<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Les Provençales — Comité d’agrément</title>
<style>
/* Polices intégrées au fichier : le deck ne dépend d’aucun réseau. */
__FONTS_LONGTABLE__
</style>
<style>
/* ===========================================================
   LES PROVENÇALES — VERSION « TABLE D’HÔTES »
   Système à encre unique : rouille #B53D2A sur papier crème #FAF1E2.
   Aucune seconde couleur, aucun aplat, aucune ombre.
   Les variations passent par l’opacité : 100 %, 78 %, 32 %, 10 %.
   =========================================================== */
:root{
  --papier:#FAF1E2; --papier-f:#F2E5CF; --encre:#B53D2A; --encre-p:#8E2D1F;
  --encre-78:rgba(181,61,42,.78); --encre-50:rgba(181,61,42,.5); --encre-32:rgba(181,61,42,.32);
  --stage-bg:#2A1510; --slide-bg:#FAF1E2;
  --display:'Bricolage Grotesque',Helvetica,Arial,sans-serif;
  --serif:'Fraunces',Georgia,serif;
  --marge:110px; --marge-large:160px; --marge-etroite:280px;
  --ease:cubic-bezier(.16,1,.3,1);
}
*{margin:0;padding:0;box-sizing:border-box}

/* ===========================================================
   SCÈNE FIXE 16:9 — viewport-base.css, intégralement
   =========================================================== */
html,body{width:100%;height:100%;margin:0;overflow:hidden;background:var(--stage-bg,#000)}
.deck-viewport{position:fixed;inset:0;overflow:hidden;background:var(--stage-bg,#000)}
.deck-stage{position:absolute;left:0;top:0;width:1920px;height:1080px;overflow:hidden;transform-origin:0 0;background:var(--slide-bg,#fff)}
.slide{position:absolute;inset:0;width:1920px;height:1080px;overflow:hidden;display:block;visibility:hidden;opacity:0;pointer-events:none;background:var(--slide-bg,#fff)}
.slide.active,.slide.visible{visibility:visible;opacity:1;pointer-events:auto;z-index:1}
img,video,canvas,svg{max-width:100%;max-height:100%}
.deck-controls{position:fixed;left:50%;bottom:22px;transform:translateX(-50%);z-index:1000}
@media print{
  html,body{width:1920px;height:auto;overflow:visible;background:#fff}
  .deck-viewport{position:static;overflow:visible;background:#fff}
  .deck-stage{position:static;width:auto;height:auto;transform:none!important;background:none}
  .slide{position:relative;display:block!important;visibility:visible!important;opacity:1!important;
    pointer-events:auto!important;width:1920px;height:1080px;break-after:page;page-break-after:always}
  .slide:last-child{break-after:auto;page-break-after:auto}
  .deck-controls,.nav-hint{display:none!important}
}
@media (prefers-reduced-motion:reduce){*,*::before,*::after{animation-duration:.01ms!important;transition-duration:.2s!important}}

/* ===========================================================
   TEXTURE DE PAPIER — trame de points de 4 px sur chaque slide.
   Invisible à distance, présente de près. Elle fait le papier.
   =========================================================== */
.slide::before{content:"";position:absolute;inset:0;pointer-events:none;z-index:0;
  background-image:radial-gradient(circle at 1px 1px, var(--encre-50) .5px, transparent 1px);
  background-size:4px 4px;opacity:.1}
.slide>*{position:relative;z-index:1}

/* ===========================================================
   ANIMATIONS — l’encre qui se pose : révélation par le bas,
   filets qui se tracent, chiffres qui montent.
   =========================================================== */
.reveal{opacity:0;transform:translateY(26px);transition:opacity .8s var(--ease),transform .8s var(--ease)}
.slide.visible .reveal{opacity:1;transform:none}
.encrer{clip-path:inset(0 0 100% 0);transform:translateY(14px);
  transition:clip-path .95s var(--ease),transform .95s var(--ease)}
.slide.visible .encrer{clip-path:inset(0 0 0 0);transform:none}
.filet{transform:scaleX(0);transform-origin:left center;transition:transform 1s var(--ease)}
.slide.visible .filet{transform:scaleX(1)}
.jumbo-in{opacity:0;transform:translateY(40px) scale(.94);
  transition:opacity 1.1s var(--ease),transform 1.1s var(--ease)}
.slide.visible .jumbo-in{opacity:1;transform:none}
.barre{transform:scaleX(0);transform-origin:left center;transition:transform .85s var(--ease)}
.slide.visible .barre{transform:scaleX(1)}
.d1{transition-delay:.08s}.d2{transition-delay:.18s}.d3{transition-delay:.28s}.d4{transition-delay:.38s}
.d5{transition-delay:.48s}.d6{transition-delay:.58s}.d7{transition-delay:.68s}.d8{transition-delay:.78s}
.d9{transition-delay:.88s}.d10{transition-delay:.98s}.d11{transition-delay:1.08s}.d12{transition-delay:1.18s}

/* ===========================================================
   ÉCHELLE TYPOGRAPHIQUE
   Bricolage 800 capitales pour tout affichage, approche négative.
   Fraunces italique 400 pour tout texte courant.
   =========================================================== */
.t-cover{font-family:var(--display);font-weight:800;font-size:132px;line-height:.92;
  letter-spacing:-.012em;text-transform:uppercase;color:var(--encre)}
.t-display{font-family:var(--display);font-weight:800;font-size:140px;line-height:.9;
  letter-spacing:-.012em;text-transform:uppercase;color:var(--encre)}
.t-headline{font-family:var(--display);font-weight:800;font-size:96px;line-height:.9;
  letter-spacing:-.012em;text-transform:uppercase;color:var(--encre)}
.t-headline-md{font-family:var(--display);font-weight:800;font-size:78px;line-height:.92;
  letter-spacing:-.012em;text-transform:uppercase;color:var(--encre)}
.t-quote{font-family:var(--display);font-weight:700;font-size:72px;line-height:.98;
  letter-spacing:-.012em;text-transform:uppercase;color:var(--encre)}
.t-card{font-family:var(--display);font-weight:800;font-size:44px;line-height:.95;
  letter-spacing:-.008em;text-transform:uppercase;color:var(--encre)}
.t-item{font-family:var(--display);font-weight:700;font-size:30px;line-height:1.05;
  letter-spacing:-.005em;text-transform:uppercase;color:var(--encre)}
.t-valeur{font-family:var(--display);font-weight:700;font-size:30px;line-height:1.1;
  letter-spacing:-.005em;text-transform:uppercase;color:var(--encre)}
.t-tracked{font-family:var(--display);font-weight:700;font-size:19px;letter-spacing:.18em;
  text-transform:uppercase;color:var(--encre)}
.t-qui{font-family:var(--display);font-weight:700;font-size:20px;letter-spacing:-.005em;
  text-transform:uppercase;color:var(--encre)}

.f-lead{font-family:var(--serif);font-style:italic;font-weight:400;font-size:34px;line-height:1.48;color:var(--encre)}
.f-body{font-family:var(--serif);font-style:italic;font-weight:400;font-size:26px;line-height:1.5;color:var(--encre)}
.f-roman{font-family:var(--serif);font-style:normal;font-weight:400;font-size:21px;line-height:1.5;color:var(--encre)}
.f-edition{font-family:var(--serif);font-style:italic;font-weight:400;font-size:30px;line-height:1;color:var(--encre)}
.f-tagline{font-family:var(--serif);font-style:italic;font-weight:400;font-size:27px;line-height:1.35;color:var(--encre)}
.f-stats{font-family:var(--serif);font-style:italic;font-weight:400;font-size:23px;line-height:1.4;color:var(--encre-78)}
.f-meta{font-family:var(--serif);font-style:italic;font-weight:400;font-size:18px;line-height:1.4;color:var(--encre-78)}
.f-cle{font-family:var(--serif);font-style:italic;font-weight:400;font-size:17px;letter-spacing:.16em;
  text-transform:uppercase;color:var(--encre-78)}
.f-num{font-family:var(--serif);font-style:italic;font-weight:400;color:var(--encre);line-height:.86;letter-spacing:-.02em}
.gras{font-weight:600}

/* ===========================================================
   COMPOSANTS — contours d’1,5 px, jamais d’aplat
   =========================================================== */
.pastille{display:inline-block;border:1.5px solid var(--encre);border-radius:999px;padding:13px 30px;
  font-family:var(--serif);font-style:italic;font-weight:400;font-size:21px;line-height:1;color:var(--encre)}
.etiquette{display:inline-block;border:1.5px solid var(--encre);padding:11px 20px;
  font-family:var(--serif);font-style:italic;font-weight:400;font-size:20px;line-height:1;color:var(--encre)}
.sep-pastille{font-family:var(--serif);font-style:italic;font-size:21px;color:var(--encre);opacity:.7;
  align-self:center}
.badge{display:inline-flex;align-items:center;justify-content:center;width:46px;height:46px;
  border:1.5px solid var(--encre);border-radius:50%;font-family:var(--serif);font-style:italic;
  font-size:24px;color:var(--encre)}
.badge-ligne{display:flex;align-items:center;gap:18px}

.carte{border:1.5px solid var(--encre);padding:34px 34px 30px}
.carte .haut{font-family:var(--serif);font-style:italic;font-size:18px;color:var(--encre-78);
  padding-bottom:16px;border-bottom:1px solid var(--encre-32);margin-bottom:22px}
.carte .corps{margin-bottom:24px}
.carte .bas{padding-top:18px;border-top:1px dashed var(--encre-32);
  font-family:var(--serif);font-style:italic;font-size:18px;color:var(--encre-78)}

/* Barre de titre : titre à gauche, étiquette à droite, filet dessous */
.barre-titre{position:absolute;left:var(--marge);right:var(--marge);top:104px;
  display:flex;justify-content:space-between;align-items:flex-end;gap:60px;padding-bottom:26px}
.barre-titre .filet-bas{position:absolute;left:0;right:0;bottom:0;height:1.5px;background:var(--encre)}
.barre-titre .etiq{font-family:var(--serif);font-style:italic;font-size:22px;color:var(--encre-78);
  white-space:nowrap;padding-bottom:8px}

/* Lignes de registre : le motif calendrier et tableau du système */
.registre{position:absolute;left:var(--marge);right:var(--marge)}
.ligne{display:grid;align-items:center;gap:36px;padding:27px 0;border-bottom:1px solid var(--encre-32)}
.ligne:last-child{border-bottom:none}
.ligne .num{font-family:var(--serif);font-style:italic;font-size:26px;color:var(--encre-78)}

/* Graphique : contours pour les concurrents, encre pleine pour nous */
.graphe{position:absolute;left:var(--marge);right:var(--marge)}
.g-ligne{display:flex;align-items:center;height:66px;border-bottom:1px solid var(--encre-32)}
.g-ligne:last-child{border-bottom:none}
.g-ligne .nom{width:400px;flex:0 0 400px}
.g-ligne .nom b{display:block;font-family:var(--display);font-weight:700;font-size:23px;
  letter-spacing:-.005em;text-transform:uppercase;color:var(--encre)}
.g-ligne .nom i{display:block;font-family:var(--serif);font-style:italic;font-size:17px;color:var(--encre-78);margin-top:2px}
.g-ligne .piste{flex:1;display:flex;align-items:center}
.g-ligne .fut{height:26px;border:1.5px solid var(--encre)}
.g-ligne .val{font-family:var(--serif);font-style:italic;font-size:26px;color:var(--encre);margin-left:20px;white-space:nowrap}
.g-ligne.nous .fut{background:var(--encre)}
.g-ligne.nous .val{font-size:30px}

/* Chrome : numéro de page sur chaque slide, repère de navigation hors scène */
.pagenum{position:absolute;right:80px;bottom:56px;font-family:var(--serif);font-style:italic;
  font-size:19px;letter-spacing:.02em;color:var(--encre);z-index:2}
.nav-hint{position:fixed;left:28px;bottom:22px;font-family:var(--serif);font-style:italic;
  font-size:15px;color:var(--papier);opacity:.45;z-index:1000}
.progression{position:fixed;left:0;bottom:0;height:2px;background:var(--encre);z-index:1000;
  transition:width .4s var(--ease)}

/* Logo, sur fond transparent pour se poser sur le papier crème */
.logo{position:absolute;height:120px;width:auto}

/* ===========================================================
   ÉDITION EN LIGNE
   =========================================================== */
.edit-hotzone{position:fixed;top:0;left:0;width:80px;height:80px;z-index:10000;cursor:pointer}
.edit-toggle{position:fixed;top:18px;left:18px;z-index:10001;opacity:0;pointer-events:none;
  transition:opacity .3s ease;background:var(--papier);color:var(--encre);border:1.5px solid var(--encre);
  border-radius:999px;padding:9px 18px;font-family:var(--serif);font-style:italic;font-size:16px;cursor:pointer}
.edit-toggle.show,.edit-toggle.active{opacity:1;pointer-events:auto}
.edit-toggle.active{background:var(--encre);color:var(--papier)}
body.mode-edition [contenteditable="true"]{outline:1px dashed var(--encre-32);outline-offset:5px}
.edit-aide{position:fixed;bottom:18px;left:50%;transform:translateX(-50%);z-index:10001;display:none;
  font-family:var(--serif);font-style:italic;font-size:15px;color:var(--papier);
  background:rgba(42,21,16,.9);padding:8px 14px;border-radius:999px}
body.mode-edition .edit-aide{display:block}

/* Lignes d’information dans une carte : clé à gauche, valeur à droite */
.info-ligne{display:flex;justify-content:space-between;align-items:baseline;gap:24px;
  padding:20px 0;border-bottom:1px dashed var(--encre-32)}
.info-ligne:last-child{border-bottom:none}

/* Rangée d’attribution sous une citation */
.qui-ligne{position:absolute;display:flex;align-items:baseline;gap:26px;padding-top:24px;
  border-top:1.5px solid var(--encre)}

/* Bloc de chiffre : numéral Fraunces italique, étiquette suivie, note */
.bloc-chiffre .n{font-family:var(--serif);font-style:italic;font-weight:400;font-size:148px;
  line-height:.86;letter-spacing:-.02em;color:var(--encre);display:block}
.bloc-chiffre .t-tracked{display:block;margin:18px 0 12px}

/* Ancre typographique des slides de couverture */
.jumbo{position:absolute}
.jumbo .n{font-family:var(--serif);font-style:italic;font-weight:400;font-size:430px;
  line-height:.86;letter-spacing:-.02em;color:var(--encre);display:block}

/* Grilles de colonnes */
.deux-cartes{position:absolute;left:var(--marge);right:var(--marge);display:grid;
  grid-template-columns:1fr 1fr;gap:44px}
.trois-cartes{position:absolute;left:var(--marge);right:var(--marge);display:grid;
  grid-template-columns:1fr 1fr 1fr;gap:36px}
.quatre-blocs{position:absolute;left:var(--marge);right:var(--marge);display:grid;
  grid-template-columns:repeat(4,1fr);gap:44px}
.quatre-blocs>div{border-top:1.5px solid var(--encre);padding-top:26px}
.rang-pastilles{position:absolute;display:flex;gap:16px;align-items:center;flex-wrap:wrap}
</style>
</head>
<body>
<div class="deck-viewport">
  <main class="deck-stage" id="deckStage">

  <!-- ========== 01 · COUVERTURE ========== -->
  <section class="slide active visible">
    <img class="logo reveal d1" style="left:110px;top:74px" src="__LOGO_T__" alt="Les Provençales">
    <div class="badge-ligne reveal d2" style="position:absolute;right:110px;top:88px">
      <span class="badge">1</span><span class="f-edition">Première édition</span>
    </div>

    <h1 class="t-cover encrer d3" style="position:absolute;left:110px;top:276px;width:1060px">
      L’art de se<br>retrouver,<br>en Provence</h1>

    <p class="f-tagline reveal d5" style="position:absolute;left:110px;top:700px;width:1000px">
      Des retraites féminines autour de la cuisine, du vin et de la naturopathie,
      dans le Luberon.</p>

    <div class="rang-pastilles" style="left:110px;top:830px">
      <span class="pastille reveal d6">Sept jours · six nuits</span>
      <span class="sep-pastille reveal d6">·</span>
      <span class="pastille reveal d7">Huit participantes</span>
      <span class="sep-pastille reveal d7">·</span>
      <span class="pastille reveal d8">3 500 € la semaine</span>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:936px">
      Comité d’agrément — Initiative Pays d’Aix · Julien &amp; Paulina · Septembre 2026</p>

    <div class="jumbo jumbo-in d4" style="right:110px;top:300px;width:600px">
      <span class="n">8</span>
      <span class="t-tracked" style="display:block;margin-top:26px">Participantes par session</span>
      <span class="f-meta" style="display:block;margin-top:12px">Quatre sessions ouvertes en 2027</span>
    </div>

    <p class="pagenum">01</p>
  </section>

  <!-- ========== 02 · LE PROJET ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Le projet en une phrase</h2>
      <span class="etiq reveal d2">Les Provençales</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <p class="f-lead reveal d3" style="position:absolute;left:110px;top:310px;width:1000px">
      Réunir huit femmes autour d’une passion commune, une semaine, en Provence.
      La cuisine, le vin et la naturopathie sont la première thématique, pas la seule :
      le format est pensé pour être reproduit.</p>

    <div class="rang-pastilles" style="left:110px;top:620px;width:1020px">
      <span class="etiquette reveal d5">Format reproductible</span>
      <span class="etiquette reveal d6">Deux marchés</span>
      <span class="etiquette reveal d7">Quatre sessions en 2027</span>
    </div>

    <div class="carte reveal d4" style="position:absolute;right:110px;top:310px;width:620px">
      <p class="haut">Les chiffres d’ouverture</p>
      <div class="corps">
        <div class="info-ligne"><span class="f-cle">Format</span><span class="t-valeur">7 jours · 6 nuits</span></div>
        <div class="info-ligne"><span class="f-cle">Groupe</span><span class="t-valeur">8 participantes</span></div>
        <div class="info-ligne"><span class="f-cle">Tarif</span><span class="t-valeur">3 500 €</span></div>
        <div class="info-ligne"><span class="f-cle">Chiffre d’affaires</span><span class="t-valeur">112 000 €</span></div>
      </div>
      <p class="bas">Mas Heyrauds, à Ménerbes, dans le Luberon.</p>
    </div>

    <p class="pagenum">02</p>
  </section>

  <!-- ========== 03 · OUVERTURE — L’ÉQUIPE ========== -->
  <section class="slide">
    <div class="badge-ligne reveal d1" style="position:absolute;left:110px;top:286px">
      <span class="badge">1</span><span class="f-edition">Première partie</span>
    </div>
    <div class="filet d1" style="position:absolute;left:110px;right:110px;top:376px;height:1.5px;background:var(--encre)"></div>
    <h2 class="t-display encrer d2" style="position:absolute;left:110px;top:420px;width:1500px">
      Ceux qui portent<br>le projet</h2>
    <p class="f-lead reveal d4" style="position:absolute;left:110px;top:790px;width:1180px">
      Deux parcours qui se complètent : l’opérationnel et le terrain d’un côté,
      le commerce et la gestion de l’autre.</p>
    <p class="pagenum">03</p>
  </section>

  <!-- ========== 04 · JULIEN & PAULINA ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Deux parcours</h2>
      <span class="etiq reveal d2">L’équipe</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="deux-cartes" style="top:300px">
      <div class="carte reveal d3">
        <p class="haut">Commerce · Web · Gestion</p>
        <p class="t-card">Julien</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman" style="margin-bottom:14px">Responsable d’opérations chez <span class="gras">Bureau Veritas</span>,
            sujets ESG et énergie, six à huit personnes encadrées.</p>
          <p class="f-roman" style="margin-bottom:14px">Master Grande École, Montpellier Business School.
            Formé à la gestion par son père, chef d’entreprise.</p>
          <p class="f-roman">Vend déjà des <span class="gras">coffrets provençaux</span> à des agences
            de retraites bien-être.</p>
        </div>
        <p class="bas">Apporte le commerce, le web et la gestion financière.</p>
      </div>

      <div class="carte reveal d5">
        <p class="haut">Opérations · Terrain · Marchés</p>
        <p class="t-card">Paulina</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman" style="margin-bottom:14px">Master Operations &amp; Supply Chain, University of Manchester.
            Trois ans chez <span class="gras">Kraft Heinz</span> à Londres.</p>
          <p class="f-roman" style="margin-bottom:14px">Area Manager chez <span class="gras">Amazon</span> en Pologne,
            jusqu’à 120 personnes encadrées.</p>
          <p class="f-roman">Coordonne <span class="gras">depuis un an</span> des retraites en Provence
            pour des structures concurrentes.</p>
        </div>
        <p class="bas">Porte le projet et reste l’interlocutrice des participantes.</p>
      </div>
    </div>

    <p class="pagenum">04</p>
  </section>

  <!-- ========== 05 · CITATION ========== -->
  <section class="slide">
    <p class="t-tracked reveal d1" style="position:absolute;left:280px;top:230px">Pourquoi ce projet</p>
    <blockquote class="t-quote encrer d2" style="position:absolute;left:280px;top:300px;width:1360px">
      Paulina est tombée amoureuse de la Provence. Nous voulons donner à des femmes
      l’envie de voyager seules, en confiance.</blockquote>
    <div class="qui-ligne reveal d4" style="left:280px;top:800px;width:1360px">
      <span class="t-qui">Julien &amp; Paulina</span>
      <span class="f-meta">Rencontrés en Angleterre, installés en Provence</span>
    </div>
    <p class="pagenum">05</p>
  </section>

  <!-- ========== 06 · LE CONCEPT ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Sept jours, six nuits</h2>
      <span class="etiq reveal d2">Le concept</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="registre" style="top:320px">
      <div class="ligne reveal d3" style="grid-template-columns:70px 1fr 300px">
        <span class="num">01</span>
        <div><p class="t-item">Le lieu</p>
          <p class="f-body" style="margin-top:10px">Le Mas Heyrauds, à Ménerbes. Un choix parmi des dizaines
            de mas équivalents : il sert la communication, il ne fait pas la différence.</p></div>
        <span class="etiquette" style="justify-self:end">Luberon</span>
      </div>
      <div class="ligne reveal d5" style="grid-template-columns:70px 1fr 300px">
        <span class="num">02</span>
        <div><p class="t-item">Le fil rouge</p>
          <p class="f-body" style="margin-top:10px">Le chef cuisine avec les participantes, à partir des produits
            achetés le matin même au marché.</p></div>
        <span class="etiquette" style="justify-self:end">Chaque jour</span>
      </div>
      <div class="ligne reveal d7" style="grid-template-columns:70px 1fr 300px">
        <span class="num">03</span>
        <div><p class="t-item">Ce qui reste après</p>
          <p class="f-body" style="margin-top:10px">Les principes de naturopathie sont pensés pour être prolongés
            une fois rentrées chez elles.</p></div>
        <span class="etiquette" style="justify-self:end">Au retour</span>
      </div>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:906px">
      Paulina coordonne la semaine en personne et conduit le van de neuf places.</p>
    <p class="pagenum">06</p>
  </section>

  <!-- ========== 07 · CE QUE PERSONNE NE FAIT ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Ce que personne ne fait</h2>
      <span class="etiq reveal d2">Le concept</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="trois-cartes" style="top:330px">
      <div class="reveal d3" style="border-top:1.5px solid var(--encre);padding-top:28px">
        <p class="t-item">Une semaine entière</p>
        <p class="f-body" style="margin-top:16px">Aucun concurrent ne construit sept jours autour de la cuisine
          comme fil conducteur.</p>
      </div>
      <div class="reveal d5" style="border-top:1.5px solid var(--encre);padding-top:28px">
        <p class="t-item">Le marché polonais</p>
        <p class="f-body" style="margin-top:16px">Aucun ne s’y adresse, ni ne produit de contenu dans cette langue.</p>
      </div>
      <div class="reveal d7" style="border-top:1.5px solid var(--encre);padding-top:28px">
        <p class="t-item">Un format qui se rejoue</p>
        <p class="f-body" style="margin-top:16px">La gastronomie n’est que la première thématique d’une série.</p>
      </div>
    </div>

    <blockquote class="t-headline-md encrer d9" style="position:absolute;left:110px;top:640px;width:1400px">
      Le lieu n’est pas le différenciant. L’expérience l’est.</blockquote>
    <p class="pagenum">07</p>
  </section>

  <!-- ========== 08 · OUVERTURE — LE MARCHÉ ========== -->
  <section class="slide">
    <div class="badge-ligne reveal d1" style="position:absolute;left:110px;top:286px">
      <span class="badge">2</span><span class="f-edition">Deuxième partie</span>
    </div>
    <div class="filet d1" style="position:absolute;left:110px;right:110px;top:376px;height:1.5px;background:var(--encre)"></div>
    <h2 class="t-display encrer d2" style="position:absolute;left:110px;top:420px;width:1600px">
      Le marché et<br>la concurrence</h2>
    <p class="f-lead reveal d4" style="position:absolute;left:110px;top:790px;width:1240px">
      Un marché anglo-saxon mature où la demande est prouvée, un marché polonais émergent
      où personne n’est positionné sur la Provence.</p>
    <p class="pagenum">08</p>
  </section>

  <!-- ========== 09 · DEUX MARCHÉS ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Deux dynamiques</h2>
      <span class="etiq reveal d2">Le marché</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="deux-cartes" style="top:300px">
      <div class="carte reveal d3">
        <p class="haut">Mature · Demande prouvée</p>
        <p class="t-card">Anglo-saxon</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman" style="margin-bottom:14px">L’offre existante reste concentrée sur un registre
            <span class="gras">yoga et spa générique</span>.</p>
          <p class="f-roman" style="margin-bottom:14px">La place à prendre n’est pas « il n’y a personne »,
            c’est <span class="gras">« personne ne fait ce que nous faisons »</span>.</p>
          <p class="f-roman">Ciblage de communautés de passionnés : cuisine, vin, naturopathie.</p>
        </div>
        <p class="bas">Ligne directe Marseille — New York attendue en 2027.</p>
      </div>

      <div class="carte reveal d5">
        <p class="haut">Émergent · Aucune offre Provence</p>
        <p class="t-card">Polonais</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman" style="margin-bottom:14px">Diaspora au Royaume-Uni, en France et en Allemagne,
            au pouvoir d’achat plus élevé.</p>
          <p class="f-roman" style="margin-bottom:14px">Polonaises urbaines, sur un marché dont le pouvoir
            d’achat progresse.</p>
          <p class="f-roman">Contenu <span class="gras">100 % en polonais</span> : un positionnement sans
            équivalent en Provence.</p>
        </div>
        <p class="bas">Croissance du tourisme culinaire polonais attendue à 20 % par an.</p>
      </div>
    </div>

    <p class="pagenum">09</p>
  </section>

  <!-- ========== 10 · LES SIGNAUX ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Quatre signaux</h2>
      <span class="etiq reveal d2">Le marché</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="quatre-blocs" style="top:452px">
      <div class="bloc-chiffre reveal d3"><span class="n">64 %</span>
        <span class="t-tracked">Marché féminin</span>
        <p class="f-meta">du tourisme bien-être mondial. Global Wellness Institute.</p></div>
      <div class="bloc-chiffre reveal d5"><span class="n">195</span>
        <span class="t-tracked">Pour cent de hausse</span>
        <p class="f-meta">des recherches « retraite poterie » en un an aux États-Unis.</p></div>
      <div class="bloc-chiffre reveal d7"><span class="n">20 %</span>
        <span class="t-tracked">Par an</span>
        <p class="f-meta">de croissance attendue pour le tourisme culinaire polonais.</p></div>
      <div class="bloc-chiffre reveal d9"><span class="n">2027</span>
        <span class="t-tracked">Marseille — New York</span>
        <p class="f-meta">ouverture de la ligne aérienne directe.</p></div>
    </div>

    <p class="pagenum">10</p>
  </section>

  <!-- ========== 11 · LA CONCURRENCE ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline-md encrer d1">Un prix d’entrée sur le segment actif</h2>
      <span class="etiq reveal d2">Prix par nuit</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="graphe" style="top:296px">
      <div class="g-ligne reveal d3"><div class="nom"><b>Core Retreat</b><i>3 nuits · 950 €</i></div>
        <div class="piste"><div class="fut barre d3" style="width:190px"></div><span class="val">317 €</span></div></div>
      <div class="g-ligne nous reveal d3"><div class="nom"><b>Les Provençales</b><i>6 nuits · 3 500 €</i></div>
        <div class="piste"><div class="fut barre d4" style="width:350px"></div><span class="val">583 €</span></div></div>
      <div class="g-ligne reveal d4"><div class="nom"><b>Club Garrigue</b><i>6 nuits · 3 700 €</i></div>
        <div class="piste"><div class="fut barre d5" style="width:370px"></div><span class="val">617 €</span></div></div>
      <div class="g-ligne reveal d5"><div class="nom"><b>Well in France</b><i>4 nuits · 2 850 €</i></div>
        <div class="piste"><div class="fut barre d6" style="width:428px"></div><span class="val">713 €</span></div></div>
      <div class="g-ligne reveal d6"><div class="nom"><b>Best French Forever</b><i>5 nuits · 5 000 €</i></div>
        <div class="piste"><div class="fut barre d7" style="width:600px"></div><span class="val">1 000 €</span></div></div>
      <div class="g-ligne reveal d7"><div class="nom"><b>The Provence Retreat</b><i>5 nuits · 5 750 €</i></div>
        <div class="piste"><div class="fut barre d8" style="width:690px"></div><span class="val">1 150 €</span></div></div>
      <div class="g-ligne reveal d8"><div class="nom"><b>La Bastide de Laurence</b><i>4 nuits · 5 400 €</i></div>
        <div class="piste"><div class="fut barre d9" style="width:810px"></div><span class="val">1 350 €</span></div></div>
      <div class="g-ligne reveal d9"><div class="nom"><b>Gallivant &amp; Gather</b><i>7 nuits · 9 750 €</i></div>
        <div class="piste"><div class="fut barre d10" style="width:836px"></div><span class="val">1 393 €</span></div></div>
      <div class="g-ligne reveal d10"><div class="nom"><b>Madame de la Maison</b><i>5 nuits · 7 500 €</i></div>
        <div class="piste"><div class="fut barre d11" style="width:900px"></div><span class="val">1 500 €</span></div></div>
    </div>

    <p class="f-stats reveal d11" style="position:absolute;left:110px;top:908px">
      Juste sous Club Garrigue, très loin du bloc premium passif à 1 000 – 1 500 € la nuit.</p>
    <p class="pagenum">11</p>
  </section>

  <!-- ========== 12 · LE MODÈLE ÉCONOMIQUE ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Le modèle</h2>
      <span class="etiq reveal d2">3 500 € par participante · 8 participantes</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="registre" style="top:330px">
      <div class="ligne reveal d3" style="grid-template-columns:1fr 320px 320px;border-bottom:1.5px solid var(--encre);padding:0 0 16px">
        <span class="f-cle"></span>
        <span class="f-cle" style="justify-self:end">1 session</span>
        <span class="f-cle" style="justify-self:end">Année 1 · 4 sessions</span>
      </div>
      <div class="ligne reveal d4" style="grid-template-columns:1fr 320px 320px">
        <span class="f-body">Chiffre d’affaires TTC</span>
        <span class="t-valeur" style="justify-self:end">28 000 €</span>
        <span class="t-valeur" style="justify-self:end">112 000 €</span></div>
      <div class="ligne reveal d5" style="grid-template-columns:1fr 320px 320px">
        <span class="f-body">Chiffre d’affaires HT</span>
        <span class="t-valeur" style="justify-self:end">23 333 €</span>
        <span class="t-valeur" style="justify-self:end">93 333 €</span></div>
      <div class="ligne reveal d6" style="grid-template-columns:1fr 320px 320px">
        <span class="f-body">Coûts HT</span>
        <span class="t-valeur" style="justify-self:end">17 110 €</span>
        <span class="t-valeur" style="justify-self:end">68 440 €</span></div>
      <div class="ligne reveal d7" style="grid-template-columns:1fr 320px 320px">
        <span class="f-body">Marge avant impôt</span>
        <span class="t-valeur" style="justify-self:end">6 223 €</span>
        <span class="t-valeur" style="justify-self:end">24 893 €</span></div>
      <div class="ligne reveal d8" style="grid-template-columns:1fr 320px 320px;border-bottom:none;border-top:1.5px solid var(--encre);margin-top:8px">
        <span class="t-item">Marge nette après impôt</span>
        <span class="t-card" style="justify-self:end;font-size:40px">5 290 €</span>
        <span class="t-card" style="justify-self:end;font-size:40px">21 159 €</span></div>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:908px">
      Tarif identique sur les quatre sessions. Impôt sur les sociétés à 15 %.</p>
    <p class="pagenum">12</p>
  </section>

  <!-- ========== 13 · LES POSTES DE COÛTS ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Où part l’argent</h2>
      <span class="etiq reveal d2">Par session</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="registre" style="top:320px;right:640px">
      <div class="ligne reveal d3" style="grid-template-columns:70px 1fr auto">
        <span class="num">01</span><span class="t-item">Le lieu</span>
        <span class="t-valeur" style="justify-self:end">8 000 €</span></div>
      <div class="ligne reveal d4" style="grid-template-columns:70px 1fr auto">
        <span class="num">02</span><span class="t-item">Restauration et chef</span>
        <span class="t-valeur" style="justify-self:end">5 180 €</span></div>
      <div class="ligne reveal d5" style="grid-template-columns:70px 1fr auto">
        <span class="num">03</span><span class="t-item">Ateliers</span>
        <span class="t-valeur" style="justify-self:end">1 333 €</span></div>
      <div class="ligne reveal d6" style="grid-template-columns:70px 1fr auto">
        <span class="num">04</span><span class="t-item">Banque et assurance</span>
        <span class="t-valeur" style="justify-self:end">1 136 €</span></div>
      <div class="ligne reveal d7" style="grid-template-columns:70px 1fr auto">
        <span class="num">05</span><span class="t-item">Transport en van</span>
        <span class="t-valeur" style="justify-self:end">617 €</span></div>
    </div>

    <div class="carte reveal d6" style="position:absolute;right:110px;top:320px;width:480px">
      <p class="haut">Total de la session</p>
      <div class="corps">
        <div class="info-ligne"><span class="f-cle">Principaux postes</span><span class="t-valeur">16 266 €</span></div>
        <div class="info-ligne"><span class="f-cle">Coûts totaux</span><span class="t-valeur">17 110 €</span></div>
        <div class="info-ligne"><span class="f-cle">Marge nette</span><span class="t-valeur">5 290 €</span></div>
      </div>
      <p class="bas">Le lieu pèse à lui seul près de la moitié des coûts.</p>
    </div>

    <p class="pagenum">13</p>
  </section>

  <!-- ========== 14 · L’AVANCEMENT ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Ce qui est déjà fait</h2>
      <span class="etiq reveal d2">État d’avancement</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="registre" style="top:292px">
      <div class="ligne reveal d3" style="grid-template-columns:1fr 300px;padding:19px 0">
        <div><p class="t-item">Le lieu</p><p class="f-body" style="margin-top:8px">Identifié, négociation des quatre sessions 2027 en cours.</p></div>
        <span class="etiquette" style="justify-self:end">En cours</span></div>
      <div class="ligne reveal d4" style="grid-template-columns:1fr 300px;padding:19px 0">
        <div><p class="t-item">La marque</p><p class="f-body" style="margin-top:8px">Nom, logo et noms de domaine sécurisés.</p></div>
        <span class="etiquette" style="justify-self:end">Fait</span></div>
      <div class="ligne reveal d5" style="grid-template-columns:1fr 300px;padding:19px 0">
        <div><p class="t-item">Le programme</p><p class="f-body" style="margin-top:8px">Détaillé jour par jour, prévisionnel chiffré et vérifié.</p></div>
        <span class="etiquette" style="justify-self:end">Fait</span></div>
      <div class="ligne reveal d6" style="grid-template-columns:1fr 300px;padding:19px 0">
        <div><p class="t-item">Le site et les réseaux</p><p class="f-body" style="margin-top:8px">Site en développement, réseaux sociaux créés.</p></div>
        <span class="etiquette" style="justify-self:end">En cours</span></div>
      <div class="ligne reveal d7" style="grid-template-columns:1fr 300px;padding:19px 0">
        <div><p class="t-item">Le terrain</p><p class="f-body" style="margin-top:8px">Paulina coordonne depuis un an des retraites pour des structures concurrentes.</p></div>
        <span class="etiquette" style="justify-self:end">Acquis</span></div>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:944px">
      Une preuve d’exécution, pas une compétence déclarée.</p>
    <p class="pagenum">14</p>
  </section>

  <!-- ========== 15 · LE CALENDRIER ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Le calendrier</h2>
      <span class="etiq reveal d2">De l’immatriculation au pilote</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="registre" style="top:300px">
      <div class="ligne reveal d3" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Sept — Oct 2026</span><span class="t-item">Financement et immatriculation</span>
        <span class="f-meta" style="justify-self:end">Société créée</span></div>
      <div class="ligne reveal d4" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Nov 2026</span><span class="t-item">Réservation du lieu et des prestataires</span>
        <span class="f-meta" style="justify-self:end">Quatre sessions</span></div>
      <div class="ligne reveal d5" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Déc 2026</span><span class="t-item">Ouverture des réservations</span>
        <span class="f-meta" style="justify-self:end">Campagnes PL et ANG</span></div>
      <div class="ligne reveal d6" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Sept 2027</span><span class="t-item">Session pilote, marché anglo-saxon</span>
        <span class="etiquette" style="justify-self:end">Première</span></div>
      <div class="ligne reveal d7" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Oct — Nov 2027</span><span class="t-item">Deuxième session, puis la session polonaise</span>
        <span class="f-meta" style="justify-self:end">Débrief en octobre</span></div>
      <div class="ligne reveal d8" style="grid-template-columns:290px 1fr 260px">
        <span class="f-cle">Déc 2027</span><span class="t-item">Quatrième session, puis bilan</span>
        <span class="f-meta" style="justify-self:end">Cadence 2028</span></div>
    </div>

    <p class="pagenum">15</p>
  </section>

  <!-- ========== 16 · OUVERTURE — LA DEMANDE ========== -->
  <section class="slide">
    <div class="badge-ligne reveal d1" style="position:absolute;left:110px;top:286px">
      <span class="badge">3</span><span class="f-edition">Troisième partie</span>
    </div>
    <div class="filet d1" style="position:absolute;left:110px;right:110px;top:376px;height:1.5px;background:var(--encre)"></div>
    <h2 class="t-display encrer d2" style="position:absolute;left:110px;top:420px;width:1600px">
      La demande<br>de financement</h2>
    <p class="f-lead reveal d4" style="position:absolute;left:110px;top:790px;width:1240px">
      Un besoin de trésorerie ponctuel, destiné aux acomptes de réservation des quatre
      sessions de 2027.</p>
    <p class="pagenum">16</p>
  </section>

  <!-- ========== 17 · 15 189 € ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Un besoin de 15 189 €</h2>
      <span class="etiq reveal d2">Dont 13 189 € en prêt d’honneur</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="deux-cartes" style="top:300px">
      <div class="carte reveal d3">
        <p class="haut">D’où vient l’argent</p>
        <div class="corps" style="margin-top:4px">
          <div class="info-ligne"><span class="f-body">Apport personnel</span><span class="t-valeur">2 000 €</span></div>
          <div class="info-ligne"><span class="f-body">Prêt d’honneur — Julien</span><span class="t-valeur">6 595 €</span></div>
          <div class="info-ligne"><span class="f-body">Prêt d’honneur — Paulina</span><span class="t-valeur">6 594 €</span></div>
        </div>
        <p class="bas">Deux demandes individuelles.</p>
      </div>
      <div class="carte reveal d5">
        <p class="haut">À quoi il sert</p>
        <div class="corps" style="margin-top:4px">
          <div class="info-ligne"><span class="f-body">Acomptes du lieu</span><span class="t-valeur">9 600 €</span></div>
          <div class="info-ligne"><span class="f-body">Marketing de lancement</span><span class="t-valeur">2 500 €</span></div>
          <div class="info-ligne"><span class="f-body">Acomptes prestataires</span><span class="t-valeur">1 050 €</span></div>
          <div class="info-ligne"><span class="f-body">Marque, site, digital</span><span class="t-valeur">930 €</span></div>
          <div class="info-ligne"><span class="f-body">Juridique et comptabilité</span><span class="t-valeur">809 €</span></div>
          <div class="info-ligne"><span class="f-body">Frais commerciaux</span><span class="t-valeur">300 €</span></div>
        </div>
        <p class="bas">Les acomptes du lieu pèsent les deux tiers du besoin.</p>
      </div>
    </div>

    <p class="pagenum">17</p>
  </section>

  <!-- ========== 18 · REMBOURSEMENT ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline encrer d1">Remboursé dès 2027</h2>
      <span class="etiq reveal d2">Capacité de remboursement</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="jumbo jumbo-in d3" style="left:110px;top:330px;width:900px">
      <span class="n" style="font-size:230px">21 159 €</span>
      <span class="t-tracked" style="display:block;margin-top:30px">Marge nette de la première année</span>
      <p class="f-body" style="margin-top:20px;width:820px">Pour 13 189 € empruntés. Le prêt se rembourse sur
        les résultats de l’année de lancement, et dégage un surplus pour financer la cadence de 2028.</p>
    </div>

    <div class="carte reveal d6" style="position:absolute;right:110px;top:330px;width:600px">
      <p class="haut">Pourquoi maintenant</p>
      <p class="t-card">Le calendrier commande</p>
      <div class="corps" style="margin-top:22px">
        <p class="f-roman">Chaque mois de retard sur le financement repousse la réservation des quatre sessions
          déjà positionnées sur 2027.</p>
      </div>
      <p class="bas">Un besoin ponctuel, pas structurel.</p>
    </div>

    <p class="pagenum">18</p>
  </section>

  <!-- ========== 19 · RISQUES ET RÉPONSES ========== -->
  <section class="slide">
    <div class="barre-titre">
      <h2 class="t-headline-md encrer d1">Ce qui peut manquer, et ce que nous opposons</h2>
      <span class="etiq reveal d2">Les risques</span>
      <div class="filet-bas filet d1"></div>
    </div>

    <div class="trois-cartes" style="top:370px">
      <div class="carte reveal d3">
        <p class="haut">Le risque</p>
        <p class="t-card" style="font-size:38px">Aucun retour client avant le pilote</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman">Paulina coordonne depuis un an des retraites pour des structures concurrentes,
            sur ce métier précis et sur ce territoire.</p></div>
        <p class="bas">L’exécution est déjà éprouvée.</p>
      </div>
      <div class="carte reveal d5">
        <p class="haut">Le risque</p>
        <p class="t-card" style="font-size:38px">Dépendance à un lieu unique</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman">Des dizaines de mas équivalents sont disponibles dans le Luberon, à budget
            comparable.</p></div>
        <p class="bas">Le lieu n’est pas le différenciant.</p>
      </div>
      <div class="carte reveal d7">
        <p class="haut">Le risque</p>
        <p class="t-card" style="font-size:38px">Une équipe de deux personnes</p>
        <div class="corps" style="margin-top:22px">
          <p class="f-roman">Huit participantes par session et des prestataires locaux sur chaque poste
            technique.</p></div>
        <p class="bas">Le format est dimensionné pour deux.</p>
      </div>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:908px">
      Le secteur reste sensible aux chocs économiques : c’est la raison du prix d’entrée.</p>
    <p class="pagenum">19</p>
  </section>

  <!-- ========== 20 · CLÔTURE ========== -->
  <section class="slide">
    <img class="logo reveal d1" style="left:110px;top:74px" src="__LOGO_T__" alt="Les Provençales">
    <div class="badge-ligne reveal d2" style="position:absolute;right:110px;top:88px">
      <span class="badge">1</span><span class="f-edition">Septembre 2027</span>
    </div>

    <h2 class="t-cover encrer d3" style="position:absolute;left:110px;top:300px;width:1000px;font-size:96px">
      Il ne manque<br>que votre soutien</h2>

    <p class="f-tagline reveal d5" style="position:absolute;left:110px;top:606px;width:1020px">
      Le lieu, l’équipe, le calendrier et les chiffres sont posés. Si accord, les quatre sessions
      sont réservées dans la semaine et les ventes ouvrent en décembre 2026.</p>

    <div class="rang-pastilles" style="left:110px;top:790px">
      <span class="pastille reveal d6">13 189 € en prêt d’honneur</span>
      <span class="sep-pastille reveal d6">·</span>
      <span class="pastille reveal d7">Deux demandes individuelles</span>
    </div>

    <p class="f-stats reveal d9" style="position:absolute;left:110px;top:892px">
      Julien &amp; Paulina · Comité d’agrément — Initiative Pays d’Aix</p>

    <div class="jumbo jumbo-in d4" style="right:110px;top:300px;width:640px">
      <span class="n" style="font-size:250px">2027</span>
      <span class="t-tracked" style="display:block;margin-top:26px">Première session</span>
      <span class="f-meta" style="display:block;margin-top:12px">Ouverture en septembre, dans le Luberon</span>
    </div>

    <p class="pagenum">20</p>
  </section>

  </main>
</div>

<div class="progression" id="progression"></div>
<p class="nav-hint">← → pour naviguer</p>
<div class="edit-hotzone"></div>
<button class="edit-toggle" id="editToggle" title="Mode édition (E)">Éditer</button>
<div class="edit-aide">Mode édition : cliquez un texte pour le corriger · Ctrl+S enregistre une copie · E pour sortir</div>

<script>
/* ===========================================================
   CONTRÔLEUR DE PRÉSENTATION
   Scène fixe 1920×1080 mise à l’échelle, navigation, édition.
   =========================================================== */
class Presentation {
  constructor(){
    this.slides = Array.from(document.querySelectorAll('.slide'));
    this.stage  = document.getElementById('deckStage');
    this.barre  = document.getElementById('progression');
    this.index  = 0;
    this.miseAEchelle();
    this.clavier();
    this.tactile();
    this.molette();
    this.afficher(0);
  }

  miseAEchelle(){
    const ajuster = () => {
      const f = Math.min(innerWidth / 1920, innerHeight / 1080);
      const x = (innerWidth  - 1920 * f) / 2;
      const y = (innerHeight - 1080 * f) / 2;
      this.stage.style.transform = 'translate(' + x + 'px,' + y + 'px) scale(' + f + ')';
    };
    ajuster();
    addEventListener('resize', ajuster);
  }

  afficher(i){
    this.index = Math.max(0, Math.min(i, this.slides.length - 1));
    this.slides.forEach((s, n) => {
      const actif = n === this.index;
      s.classList.toggle('active', actif);
      s.classList.toggle('visible', actif);
    });
    this.barre.style.width = ((this.index + 1) / this.slides.length * 100) + '%';
  }
  suivante(){ this.afficher(this.index + 1); }
  precedente(){ this.afficher(this.index - 1); }

  clavier(){
    addEventListener('keydown', e => {
      if (e.target.isContentEditable) return;
      switch(e.key){
        case 'ArrowRight': case 'ArrowDown': case ' ': case 'PageDown':
          e.preventDefault(); this.suivante(); break;
        case 'ArrowLeft': case 'ArrowUp': case 'PageUp':
          e.preventDefault(); this.precedente(); break;
        case 'Home': e.preventDefault(); this.afficher(0); break;
        case 'End':  e.preventDefault(); this.afficher(this.slides.length - 1); break;
      }
    });
  }

  tactile(){
    let x0 = null, y0 = null;
    addEventListener('touchstart', e => { x0 = e.touches[0].clientX; y0 = e.touches[0].clientY; }, {passive:true});
    addEventListener('touchend', e => {
      if (x0 === null) return;
      const dx = e.changedTouches[0].clientX - x0;
      const dy = e.changedTouches[0].clientY - y0;
      if (Math.abs(dx) > 55 && Math.abs(dx) > Math.abs(dy)) { dx < 0 ? this.suivante() : this.precedente(); }
      x0 = y0 = null;
    }, {passive:true});
  }

  molette(){
    let verrou = false;
    addEventListener('wheel', e => {
      if (verrou || Math.abs(e.deltaY) < 12) return;
      verrou = true;
      e.deltaY > 0 ? this.suivante() : this.precedente();
      setTimeout(() => { verrou = false; }, 620);
    }, {passive:true});
  }
}

/* ===========================================================
   ÉDITION EN LIGNE — survol du coin haut-gauche ou touche E
   =========================================================== */
class Editeur {
  constructor(){
    this.actif = false;
    this.cle = 'provencales-long-table-v1';
    this.champs = Array.from(document.querySelectorAll(
      '.t-cover,.t-display,.t-headline,.t-headline-md,.t-quote,.t-card,.t-item,.t-valeur,.t-tracked,.t-qui,' +
      '.f-lead,.f-body,.f-roman,.f-tagline,.f-stats,.f-meta,.f-cle,.f-edition,.pastille,.etiquette,' +
      '.carte .haut,.carte .bas,.jumbo .n,.bloc-chiffre .n,.g-ligne .nom b,.g-ligne .val'));
    this.restaurer();
    this.brancher();
  }

  restaurer(){
    let sauve;
    try { sauve = JSON.parse(localStorage.getItem(this.cle) || '{}'); } catch(e){ return; }
    this.champs.forEach((el, i) => { if (sauve[i] !== undefined) el.innerHTML = sauve[i]; });
  }

  enregistrer(){
    const etat = {};
    this.champs.forEach((el, i) => { etat[i] = el.innerHTML; });
    try { localStorage.setItem(this.cle, JSON.stringify(etat)); } catch(e){}
  }

  basculer(){
    this.actif = !this.actif;
    document.body.classList.toggle('mode-edition', this.actif);
    document.getElementById('editToggle').classList.toggle('active', this.actif);
    this.champs.forEach(el => {
      el.contentEditable = this.actif ? 'true' : 'false';
      if (this.actif) el.addEventListener('blur', this.enregistrer.bind(this), {once:true});
    });
  }

  /* Enregistre une copie du fichier, corrections comprises. */
  telecharger(){
    const copie = document.documentElement.cloneNode(true);
    copie.querySelectorAll('[contenteditable]').forEach(el => el.removeAttribute('contenteditable'));
    copie.querySelector('body').classList.remove('mode-edition');
    const blob = new Blob(['<!DOCTYPE html>\n' + copie.outerHTML], {type:'text/html'});
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = 'les-provencales-table-hotes.html';
    a.click();
    URL.revokeObjectURL(a.href);
  }

  brancher(){
    const bouton = document.getElementById('editToggle');
    const zone = document.querySelector('.edit-hotzone');
    let minuterie = null;
    const montrer = () => { clearTimeout(minuterie); bouton.classList.add('show'); };
    const cacher  = () => { minuterie = setTimeout(() => { if (!this.actif) bouton.classList.remove('show'); }, 400); };

    zone.addEventListener('mouseenter', montrer);
    zone.addEventListener('mouseleave', cacher);
    bouton.addEventListener('mouseenter', montrer);
    bouton.addEventListener('mouseleave', cacher);
    bouton.addEventListener('click', () => this.basculer());

    addEventListener('keydown', e => {
      if ((e.key === 'e' || e.key === 'E') && !e.target.isContentEditable) { this.basculer(); }
      if ((e.ctrlKey || e.metaKey) && e.key === 's') { e.preventDefault(); this.enregistrer(); this.telecharger(); }
    });
  }
}

const presentation = new Presentation();
new Editeur();
</script>
</body>
</html>
