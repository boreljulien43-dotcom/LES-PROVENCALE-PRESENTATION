"""Télécharge les polices Google et les intègre en base64 : le deck fonctionne hors ligne."""
import base64, re, subprocess, sys, pathlib

UA = ("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) "
      "Chrome/131.0.0.0 Safari/537.36")

def curl(url):
    return subprocess.run(['curl', '-sS', '-A', UA, url], capture_output=True, check=True).stdout

def bloc_css(query):
    """Ne garde que le sous-ensemble latin : le français y tient entièrement."""
    css = curl('https://fonts.googleapis.com/css2?' + query + '&display=swap').decode()
    sorties, garder = [], False
    for morceau in css.split('/*'):
        nom = morceau.split('*/')[0].strip()
        if nom != 'latin':
            continue
        regle = '/*' + morceau
        regle = regle.split('*/', 1)[1]
        url = re.search(r'url\((https://[^)]+\.woff2)\)', regle)
        if not url:
            continue
        data = curl(url.group(1))
        b64 = 'data:font/woff2;base64,' + base64.b64encode(data).decode()
        regle = regle.replace(url.group(1), b64)
        regle = re.sub(r'\s*unicode-range:[^;]+;', '', regle)
        sorties.append(regle.strip())
    return '\n'.join(sorties)

if __name__ == '__main__':
    cible, query = sys.argv[1], sys.argv[2]
    css = bloc_css(query)
    pathlib.Path(cible).write_text(css)
    print(cible, len(css), 'caractères,', css.count('@font-face'), 'fontes')
