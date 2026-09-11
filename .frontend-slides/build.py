# Remplace __LOGO__ / __BORIE__ par les images encodées en base64.
import base64, pathlib, sys
root = pathlib.Path('.')
def b64(p):
    return 'data:image/png;base64,' + base64.b64encode(pathlib.Path(p).read_bytes()).decode()
LOGO, BORIE = b64('assets/logo.png'), b64('assets/borie.png')
LOGO_T = b64('assets/logo-transparent.png')
FONTS = {k: pathlib.Path('.frontend-slides/fonts/%s.css' % k).read_text()
         for k in ('ivoire', 'long-table')}
for src in sys.argv[1:]:
    src = pathlib.Path(src)
    txt = src.read_text().replace('__LOGO__', LOGO).replace('__BORIE__', BORIE).replace('__LOGO_T__', LOGO_T)
    for k, css in FONTS.items():
        txt = txt.replace('__FONTS_%s__' % k.upper().replace('-', ''), css)
    dst = src.with_suffix('') if src.suffix == '.tpl' else src
    dst.write_text(txt)
    print(dst, len(txt))
