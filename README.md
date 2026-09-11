# Les Provençales — deck du comité d’agrément

Présentation HTML autonome, 20 slides, destinée au comité d’agrément Initiative Pays d’Aix.

## Ouvrir

Ouvrez `index.html` dans un navigateur. Aucune installation, aucune connexion nécessaire.

- Flèches, espace, molette ou glissement du doigt pour naviguer.
- `Début` et `Fin` pour aller à la première ou à la dernière slide.
- Survolez le coin haut-gauche ou appuyez sur `E` pour corriger un texte directement dans la page.
  Les corrections restent dans le navigateur ; `Ctrl+S` enregistre une copie du fichier.

## Charte

Ivoire `#F5EAD9`, encre `#2B2420`, or `#D9A441`, grenat `#6E2A3D`, plus les dérivées de la charte.
Typographies Cormorant Garamond et Karla, chargées depuis Google Fonts.
Aplats plats, filets fins, texte aligné à gauche, aucun dégradé.

## Modifier

`index.html` est un fichier généré. La source est `.frontend-slides/deck.html.tpl`, où le logo est
remplacé par le marqueur `__LOGO__`. Après modification :

```bash
python3 .frontend-slides/build.py .frontend-slides/deck.html.tpl && mv .frontend-slides/deck.html index.html
```

Les couleurs et les mesures sont regroupées dans le bloc `:root` en haut du fichier.
