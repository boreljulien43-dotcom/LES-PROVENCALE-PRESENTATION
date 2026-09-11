# Remplace __LOGO__ / __BORIE__ par les images encodées en base64.
import base64, pathlib, sys
root = pathlib.Path('.')
def b64(p):
    return 'data:image/png;base64,' + base64.b64encode(pathlib.Path(p).read_bytes()).decode()
LOGO, BORIE = b64('assets/logo.png'), b64('assets/borie.png')
for src in sys.argv[1:]:
    src = pathlib.Path(src)
    txt = src.read_text().replace('__LOGO__', LOGO).replace('__BORIE__', BORIE)
    dst = src.with_suffix('') if src.suffix == '.tpl' else src
    dst.write_text(txt)
    print(dst, len(txt))
