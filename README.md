# Les Provençales — deck du comité d’agrément

Deux versions de la même présentation, vingt slides chacune, pour le comité d’agrément
Initiative Pays d’Aix. Toutes deux sont des fichiers HTML autonomes : polices intégrées,
logo intégré, aucune connexion nécessaire.

| Fichier | Registre |
| --- | --- |
| `index.html` | Charte de la marque. Ivoire, encre, or et grenat. Cormorant Garamond et Karla. Slides de bascule sur fond encre. |
| `deck-table-hotes.html` | Registre affiche de table d’hôtes. Encre rouille unique sur papier crème, trame de points, formes au trait. Bricolage Grotesque et Fraunces. |

## Ouvrir

Ouvrez le fichier dans un navigateur.

- Flèches, espace, molette ou glissement du doigt pour naviguer.
- `Début` et `Fin` pour aller à la première ou à la dernière slide.
- Survolez le coin haut-gauche ou appuyez sur `E` pour corriger un texte dans la page.
  Les corrections restent dans le navigateur ; `Ctrl+S` enregistre une copie du fichier.

## Modifier

Les deux fichiers sont générés. Les sources sont dans `.frontend-slides/` :
`deck.html.tpl` pour la version charte, `deck-long-table.html.tpl` pour la version
table d’hôtes. Les marqueurs `__LOGO__`, `__LOGO_T__` et `__FONTS_*__` y remplacent
les images et les polices encodées.

```bash
python3 .frontend-slides/build.py .frontend-slides/deck.html.tpl
mv .frontend-slides/deck.html index.html

python3 .frontend-slides/build.py .frontend-slides/deck-long-table.html.tpl
mv .frontend-slides/deck-long-table.html deck-table-hotes.html
```

Pour retélécharger les polices depuis Google Fonts, sous-ensemble latin uniquement :

```bash
python3 .frontend-slides/fetch_fonts.py .frontend-slides/fonts/ivoire.css "family=..."
```

Les couleurs et les mesures sont regroupées dans le bloc `:root` en haut de chaque fichier.
