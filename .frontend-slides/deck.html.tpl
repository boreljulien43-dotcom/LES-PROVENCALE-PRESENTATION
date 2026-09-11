<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Les Provençales — Comité d’agrément</title>
<style>
/* Polices intégrées au fichier : le deck ne dépend d’aucun réseau. */
__FONTS_IVOIRE__
</style>
<style>
/* ===========================================================
   LES PROVENÇALES — DECK COMITÉ D’AGRÉMENT
   Charte : ivoire, encre, or, grenat. Cormorant Garamond + Karla.
   Aplats plats, filets fins, texte aligné à gauche, aucun dégradé.
   Pour changer les couleurs : les variables ci-dessous suffisent.
   =========================================================== */
:root{
  /* --- Couleurs de marque --- */
  --ivoire:#F5EAD9; --encre:#2B2420; --or:#D9A441; --grenat:#6E2A3D;
  /* --- Couleurs dérivées (les quatre ci-dessus, éclaircies ou foncées) --- */
  --or-fonce:#845F1A; --encre-douce:#6B6059; --sable:#EADCC0;
  --sable-doux:#EFE3CC; --papier:#FBF5EA; --encre-sable:#5F5138;

  --stage-bg:#171310; --slide-bg:#F5EAD9;

  /* --- Typographies (licence SIL Open Font) --- */
  --serif:'Cormorant Garamond',Georgia,serif;
  --sans:'Karla',Helvetica,Arial,sans-serif;

  /* --- Mesures, à l’échelle de la scène 1920×1080 --- */
  --marge:140px;              /* marge latérale de toutes les slides */
  --colonne-large:1640px;     /* largeur utile sans aplat latéral */
  --colonne-courte:1120px;    /* largeur utile avec aplat latéral */

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
  .deck-controls{display:none!important}
}
@media (prefers-reduced-motion:reduce){*,*::before,*::after{animation-duration:.01ms!important;transition-duration:.2s!important}}

/* ===========================================================
   ANIMATIONS — sobres : fondu montant et filets qui se tracent
   Déclenchées par la classe .visible posée sur la slide active.
   =========================================================== */
.reveal{opacity:0;transform:translateY(26px);transition:opacity .8s var(--ease),transform .8s var(--ease)}
.slide.visible .reveal{opacity:1;transform:none}
/* Les titres se dévoilent par le bas, sans bouger le texte : le bloc s’ouvre. */
.encrer{clip-path:inset(0 0 100% 0);transform:translateY(14px);
  transition:clip-path .95s var(--ease),transform .95s var(--ease)}
.slide.visible .encrer{clip-path:inset(0 0 0 0);transform:none}
.filet{transform:scaleX(0);transform-origin:left center;transition:transform 1s var(--ease)}
.slide.visible .filet{transform:scaleX(1)}
.filet-v{transform:scaleY(0);transform-origin:top center;transition:transform 1s var(--ease)}
.slide.visible .filet-v{transform:scaleY(1)}
/* L’aplat se découvre depuis son bord droit, sans translation d’un bloc entier. */
.pan{clip-path:inset(0 0 0 100%);transition:clip-path 1.1s var(--ease)}
.slide.visible .pan{clip-path:inset(0 0 0 0)}
/* Les grands chiffres montent et s’ouvrent légèrement. */
.jumbo-in{opacity:0;transform:translateY(40px) scale(.94);
  transition:opacity 1.1s var(--ease),transform 1.1s var(--ease)}
.slide.visible .jumbo-in{opacity:1;transform:none}
.barre{transform:scaleX(0);transform-origin:left center;transition:transform .85s var(--ease)}
.slide.visible .barre{transform:scaleX(1)}
/* Une ligne de tableau ne se translate pas : le navigateur repeint toute la table.
   Seule l’opacité varie, c’est ce qui rend l’enchaînement fluide. */
.tableau tr.reveal,.slide.visible .tableau tr.reveal{transform:none}
.tableau tr.reveal{transition:opacity .8s var(--ease)}
.d1{transition-delay:.08s}.d2{transition-delay:.18s}.d3{transition-delay:.28s}.d4{transition-delay:.38s}
.d5{transition-delay:.48s}.d6{transition-delay:.58s}.d7{transition-delay:.68s}.d8{transition-delay:.78s}
.d9{transition-delay:.88s}.d10{transition-delay:.98s}.d11{transition-delay:1.08s}.d12{transition-delay:1.18s}

/* ===========================================================
   GABARITS DE SLIDE
   .s-ivoire : slides de contenu · .s-encre : slides de bascule
   =========================================================== */
.s-ivoire{background:var(--ivoire)}
.s-encre{background:var(--encre)}

/* --- En-tête : surtitre + filet --- */
.surtitre{position:absolute;left:var(--marge);top:88px;font-family:var(--sans);font-weight:500;
  font-size:19px;letter-spacing:.18em;color:var(--or-fonce)}
.filet-entete{position:absolute;left:var(--marge);top:132px;height:1px;
  width:var(--colonne-large);background:rgba(217,164,65,.55)}
.filet-entete.court{width:var(--colonne-courte)}

/* --- Titre de slide : grand format --- */
.titre{position:absolute;left:var(--marge);top:178px;width:var(--colonne-large);
  font-family:var(--serif);font-weight:300;font-size:96px;line-height:1.05;color:var(--encre)}
.titre.court{width:var(--colonne-courte)}
.titre em{font-style:italic;font-weight:300}
.titre .grenat{color:var(--grenat)}

/* --- Chapô sous le titre --- */
.chapo{position:absolute;left:var(--marge);width:1000px;font-family:var(--sans);font-weight:400;
  font-size:27px;line-height:1.6;color:var(--encre-douce)}

/* --- Pied de slide : filet, mention, numéro --- */
.filet-pied{position:absolute;left:var(--marge);top:962px;width:var(--colonne-large);height:1px;
  background:rgba(217,164,65,.45)}
.filet-pied.court{width:var(--colonne-courte)}
.mention{position:absolute;left:var(--marge);top:992px;font-family:var(--sans);font-weight:400;
  font-size:19px;color:var(--encre-douce);max-width:1300px}
.numero{position:absolute;right:var(--marge);top:992px;font-family:var(--sans);font-weight:400;
  font-size:19px;letter-spacing:.1em;color:var(--or-fonce)}

/* --- Aplat de sable latéral --- */
.aplat{position:absolute;right:0;top:0;width:520px;height:1080px;background:var(--sable)}
.bord-aplat{position:absolute;left:1400px;top:0;width:1px;height:1080px;background:rgba(217,164,65,.6)}

/* --- Colonne de repères (dans l’aplat ou sur l’ivoire) --- */
.colonne{position:absolute;left:1460px;width:340px;z-index:2}
.repere{padding:22px 0}
.repere+.repere{border-top:1px solid rgba(217,164,65,.55)}
.repere .cle{display:block;font-family:var(--sans);font-weight:400;font-size:15px;
  letter-spacing:.19em;color:var(--or-fonce);margin-bottom:8px}
.repere .valeur{font-family:var(--serif);font-weight:400;font-size:40px;line-height:1.12;color:var(--encre)}
.repere .note{display:block;font-family:var(--sans);font-weight:400;font-size:17px;
  line-height:1.45;color:var(--encre-sable);margin-top:8px}

/* ===========================================================
   COUVERTURE ET CLÔTURE
   =========================================================== */
.couv-aplat{position:absolute;right:0;top:0;width:660px;height:1080px;background:var(--sable)}
.couv-bord{position:absolute;left:1260px;top:0;width:1px;height:1080px;background:rgba(217,164,65,.6)}
.trait-grenat{position:absolute;left:var(--marge);top:330px;width:88px;height:2px;background:var(--grenat)}
.couv-surtitre{position:absolute;left:var(--marge);top:368px;font-family:var(--sans);font-weight:500;
  font-size:20px;letter-spacing:.17em;color:var(--grenat)}
.couv-titre{position:absolute;left:var(--marge);top:428px;width:1700px;font-family:var(--serif);
  font-weight:300;font-size:178px;line-height:1.02;color:var(--encre);z-index:3}
.couv-titre em{font-style:italic;font-weight:300}
.couv-chapo{position:absolute;left:var(--marge);top:806px;width:900px;font-family:var(--sans);
  font-weight:400;font-size:27px;line-height:1.6;color:var(--encre-douce)}
.couv-logo{position:absolute;left:109px;top:96px;height:160px;width:auto}
.couv-pied{position:absolute;left:var(--marge);top:990px;font-family:var(--sans);font-weight:400;
  font-size:20px;color:var(--encre-douce)}
.couv-colonne{position:absolute;left:1320px;top:640px;width:440px;z-index:2}
.couv-date{position:absolute;left:1320px;top:1000px;font-family:var(--sans);font-weight:400;
  font-size:20px;color:var(--encre-sable);z-index:2}

/* ===========================================================
   SLIDES DE BASCULE (fond encre)
   =========================================================== */
.s-encre .sect-num{position:absolute;left:var(--marge);top:300px;font-family:var(--serif);
  font-weight:300;font-size:48px;color:var(--or);letter-spacing:.06em}
.s-encre .sect-filet{position:absolute;left:var(--marge);top:392px;width:1640px;height:1px;
  background:rgba(217,164,65,.45)}
.s-encre .sect-titre{position:absolute;left:var(--marge);top:430px;width:1620px;font-family:var(--serif);
  font-weight:300;font-size:166px;line-height:1.02;color:var(--ivoire)}
.s-encre .sect-titre em{font-style:italic;font-weight:300;color:var(--or)}
.s-encre .sect-chapo{position:absolute;left:var(--marge);top:790px;width:1080px;font-family:var(--sans);
  font-weight:400;font-size:26px;line-height:1.62;color:rgba(245,234,217,.66)}
.s-encre .numero{color:rgba(217,164,65,.8)}
.s-encre .filet-pied{background:rgba(217,164,65,.3)}

/* ===========================================================
   BLOCS DE CONTENU RÉUTILISABLES
   =========================================================== */
/* Deux colonnes de texte */
.duo{position:absolute;left:var(--marge);top:430px;display:flex;gap:120px}
.duo .col{width:760px}
.duo.serre{gap:96px}
.duo.serre .col{width:520px}
.col-titre{font-family:var(--serif);font-weight:400;font-size:52px;color:var(--encre);line-height:1.1}
.col-role{font-family:var(--sans);font-weight:500;font-size:18px;letter-spacing:.16em;
  color:var(--or-fonce);margin-top:14px;display:block}
.col-filet{width:100%;height:1px;background:rgba(217,164,65,.55);margin:26px 0 24px}
.liste{list-style:none}
.liste li{position:relative;padding-left:32px;font-family:var(--sans);font-weight:400;font-size:24px;
  line-height:1.58;color:var(--encre-douce);margin-bottom:20px}
.liste li::before{content:"";position:absolute;left:0;top:16px;width:16px;height:1px;background:var(--or)}
.liste li strong{font-weight:600;color:var(--encre)}
.col-apport{font-family:var(--sans);font-weight:500;font-size:20px;line-height:1.5;color:var(--grenat);
  padding-top:20px;border-top:1px solid rgba(217,164,65,.55)}

/* Trois volets */
.trio{position:absolute;left:var(--marge);top:440px;display:flex;gap:80px}
.trio .volet{width:493px}
.volet .cle{display:block;font-family:var(--sans);font-weight:500;font-size:17px;letter-spacing:.18em;
  color:var(--or-fonce);padding-top:22px;border-top:1px solid var(--or);margin-bottom:22px}
.volet p{font-family:var(--sans);font-weight:400;font-size:24px;line-height:1.6;color:var(--encre-douce)}
.volet .accroche{font-family:var(--serif);font-weight:400;font-size:44px;line-height:1.18;
  color:var(--encre);margin-bottom:18px}

/* Quatre chiffres */
.quatuor{position:absolute;left:var(--marge);top:460px;display:flex;gap:60px}
.quatuor .chiffre{width:365px;border-top:1px solid var(--or);padding-top:26px}
.chiffre .valeur{display:block;font-family:var(--serif);font-weight:400;font-size:104px;line-height:1;
  color:var(--grenat)}
.chiffre p{font-family:var(--sans);font-weight:400;font-size:22px;line-height:1.5;color:var(--encre-douce);
  margin-top:22px}

/* Citation */
.citation{position:absolute;left:var(--marge);top:300px;width:1400px;font-family:var(--serif);
  font-weight:300;font-style:italic;font-size:76px;line-height:1.28;color:var(--encre)}
.signature{position:absolute;left:var(--marge);top:820px;font-family:var(--sans);font-weight:500;
  font-size:21px;letter-spacing:.14em;color:var(--or-fonce)}

/* Tableau de chiffres */
.tableau{position:absolute;left:var(--marge);top:420px;width:1160px;border-collapse:collapse}
.tableau th,.tableau td{text-align:left;padding:20px 0;border-bottom:1px solid rgba(217,164,65,.45)}
.tableau th{font-family:var(--sans);font-weight:500;font-size:17px;letter-spacing:.17em;
  color:var(--or-fonce);border-bottom:1px solid var(--or)}
.tableau td:first-child{font-family:var(--sans);font-weight:400;font-size:24px;color:var(--encre-douce);width:460px}
.tableau td.n{font-family:var(--serif);font-weight:400;font-size:38px;color:var(--encre);
  font-variant-numeric:lining-nums tabular-nums;font-feature-settings:"lnum","tnum";
  text-align:right;width:350px}
.tableau th.n{text-align:right}
.tableau tr.total td{border-bottom:none;padding-top:26px}
.tableau tr.total td:first-child{font-weight:600;color:var(--encre)}
.tableau tr.total td.n{color:var(--grenat);font-size:46px}

/* Graphique en barres — positionnement prix */
.graphe{position:absolute;left:var(--marge);top:352px;width:1640px}
.ligne-graphe{display:flex;align-items:center;height:62px}
.ligne-graphe .nom{width:380px;flex:0 0 380px}
.ligne-graphe .nom b{display:block;font-family:var(--sans);font-weight:400;font-size:23px;color:var(--encre)}
.ligne-graphe .nom span{display:block;font-family:var(--sans);font-weight:400;font-size:16px;
  color:var(--encre-sable);margin-top:3px}
.ligne-graphe .piste{position:relative;flex:1;height:100%;display:flex;align-items:center}
.ligne-graphe .barre-fill{height:26px;background:var(--or-fonce);border-radius:0 4px 4px 0}
.ligne-graphe .val{font-family:var(--serif);font-weight:400;font-size:30px;color:var(--encre);
  margin-left:20px;white-space:nowrap}
.ligne-graphe.nous .nom b{font-weight:600}
.ligne-graphe.nous .barre-fill{background:var(--grenat)}
.ligne-graphe.nous .val{color:var(--grenat)}

/* Frise du calendrier */
.frise{position:absolute;left:var(--marge);top:520px;width:1640px}
.frise-axe{position:absolute;left:0;top:0;width:1640px;height:1px;background:var(--or)}
.frise-etapes{display:flex;justify-content:space-between;align-items:flex-start}
.etape{width:250px;position:relative;padding-top:44px}
.etape::before{content:"";position:absolute;left:0;top:-5px;width:11px;height:11px;border-radius:50%;
  background:var(--or-fonce)}
.etape.cle::before{background:var(--grenat);width:15px;height:15px;top:-7px}
.etape .quand{display:block;font-family:var(--sans);font-weight:500;font-size:18px;letter-spacing:.13em;
  color:var(--or-fonce);margin-bottom:12px}
.etape p{font-family:var(--sans);font-weight:400;font-size:21px;line-height:1.5;color:var(--encre-douce)}
.etape.cle p{color:var(--encre);font-weight:500}

/* Liste d’avancement */
.avancement{position:absolute;left:var(--marge);top:400px;width:1160px;list-style:none}
.avancement li{position:relative;padding:20px 0 20px 46px;border-bottom:1px solid rgba(217,164,65,.4);
  font-family:var(--sans);font-weight:400;font-size:24px;line-height:1.45;color:var(--encre-douce)}
.avancement li::before{content:"";position:absolute;left:0;top:31px;width:22px;height:1px;background:var(--or)}
.avancement li strong{font-weight:600;color:var(--encre)}

/* Risques et réponses */
.risques{position:absolute;left:var(--marge);top:400px;width:1640px}
.risque{display:flex;gap:80px;padding:30px 0;border-top:1px solid rgba(217,164,65,.5)}
.risque .quoi{width:560px;flex:0 0 560px;font-family:var(--serif);font-weight:400;font-size:40px;
  line-height:1.2;color:var(--encre)}
.risque .reponse{font-family:var(--sans);font-weight:400;font-size:23px;line-height:1.58;color:var(--encre-douce)}
.risque .reponse b{font-weight:600;color:var(--grenat)}

/* Chiffre héros */
.heros{position:absolute;left:var(--marge);top:330px}
.heros .valeur{font-family:var(--serif);font-weight:300;font-size:190px;line-height:1;color:var(--grenat)}
.heros .quoi{font-family:var(--sans);font-weight:400;font-size:26px;line-height:1.55;color:var(--encre-douce);
  margin-top:24px;max-width:700px}

/* ===========================================================
   CHROME HORS SCÈNE : barre de progression et édition en ligne
   =========================================================== */
.progression{position:fixed;left:0;bottom:0;height:2px;background:var(--or);z-index:1000;
  transition:width .4s var(--ease)}
.edit-hotzone{position:fixed;top:0;left:0;width:80px;height:80px;z-index:10000;cursor:pointer}
.edit-toggle{position:fixed;top:18px;left:18px;z-index:10001;opacity:0;pointer-events:none;
  transition:opacity .3s ease;background:var(--papier);color:var(--encre);border:1px solid var(--or);
  border-radius:2px;padding:9px 14px;font-family:var(--sans);font-size:15px;cursor:pointer}
.edit-toggle.show,.edit-toggle.active{opacity:1;pointer-events:auto}
.edit-toggle.active{background:var(--grenat);color:var(--ivoire);border-color:var(--grenat)}
body.mode-edition [contenteditable="true"]{outline:1px dashed rgba(110,42,61,.55);outline-offset:5px}
.edit-aide{position:fixed;bottom:18px;left:18px;z-index:10001;display:none;font-family:var(--sans);
  font-size:14px;color:var(--ivoire);background:rgba(43,36,32,.9);padding:8px 12px;border-radius:2px}
body.mode-edition .edit-aide{display:block}
</style>
</head>
<body>
<div class="deck-viewport">
  <main class="deck-stage" id="deckStage">

  <!-- ========== 01 · COUVERTURE ========== -->
  <section class="slide s-ivoire active visible">
    <div class="couv-aplat pan"></div>
    <div class="couv-bord"></div>
    <div class="trait-grenat filet d1"></div>
    <p class="couv-surtitre reveal d2">Comité d’agrément — Initiative Pays d’Aix</p>
    <h1 class="couv-titre encrer d3">L’art de se retrouver,<br><em>en Provence</em></h1>
    <p class="couv-chapo reveal d4">Retraites thématiques pour femmes, dans le Luberon.
      Quatre sessions en 2027, huit places chacune.</p>
    <img class="couv-logo reveal d5" src="__LOGO__" alt="Les Provençales">
    <p class="couv-pied reveal d6">Julien &amp; Paulina</p>
    <div class="couv-colonne">
      <div class="repere reveal d4"><span class="cle">Format</span><span class="valeur">7 jours · 6 nuits</span></div>
      <div class="repere reveal d5"><span class="cle">Prix</span><span class="valeur">3 500 € TTC</span></div>
      <div class="repere reveal d6"><span class="cle">Demande</span><span class="valeur">13 189 €</span></div>
    </div>
    <p class="couv-date reveal d6">Septembre 2026</p>
  </section>

  <!-- ========== 02 · LE PROJET EN UNE PHRASE ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">Le projet</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:96px">Des séjours thématiques<br><em>pour huit participantes</em></h2>
    <p class="chapo reveal d3" style="top:600px;width:1080px">La cuisine, le vin et la naturopathie
      constituent la première thématique. Le format se reproduit sur d’autres passions sans modifier
      la structure de coûts.</p>
    <div class="colonne" style="top:300px">
      <div class="repere reveal d4"><span class="cle">En 2027</span><span class="valeur">4 sessions</span></div>
      <div class="repere reveal d5"><span class="cle">Chiffre d’affaires</span><span class="valeur">112 000 € TTC</span></div>
      <div class="repere reveal d6"><span class="cle">Marchés</span><span class="valeur">Anglo-saxon<br>et polonais</span></div>
    </div>
    <div class="filet-pied court filet d4"></div>
    <p class="mention reveal d5">Mas Heyrauds, à Ménerbes, dans le Luberon. Société à immatriculer à l’automne 2026.</p>
    <p class="numero reveal d5">02 / 21</p>
  </section>

  <!-- ========== 03 · BASCULE — L’ÉQUIPE ========== -->
  <section class="slide s-encre">
    <p class="sect-num reveal d1">01</p>
    <div class="sect-filet filet d1"></div>
    <h2 class="sect-titre encrer d2">Ceux qui portent<br><em>le projet</em></h2>
    <p class="sect-chapo reveal d3">Deux parcours qui se complètent : l’opérationnel et le terrain d’un côté,
      le commerce et la gestion de l’autre.</p>
    <div class="filet-pied filet d3"></div>
    <p class="numero reveal d4">03 / 21</p>
  </section>

  <!-- ========== 04 · JULIEN & PAULINA ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">L’équipe</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Deux parcours complémentaires</h2>
    <div class="duo" style="top:400px">
      <div class="col">
        <p class="col-titre reveal d3">Julien</p>
        <span class="col-role reveal d3">Commerce · Web · Gestion</span>
        <div class="col-filet filet d3"></div>
        <ul class="liste">
          <li class="reveal d4">Responsable d’opérations chez <strong>Bureau Veritas</strong>, sujets ESG et
            énergie, six à huit personnes encadrées.</li>
          <li class="reveal d5">Master Grande École, Montpellier Business School. Formé à la gestion par son
            père, chef d’entreprise.</li>
          <li class="reveal d6">Vend déjà des <strong>coffrets provençaux</strong> à des agences de retraites
            bien-être.</li>
        </ul>
      </div>
      <div class="col">
        <p class="col-titre reveal d3">Paulina</p>
        <span class="col-role reveal d3">Opérations · Terrain · Marchés</span>
        <div class="col-filet filet d4"></div>
        <ul class="liste">
          <li class="reveal d5">Master Operations &amp; Supply Chain, University of Manchester. Trois ans chez
            <strong>Kraft Heinz</strong> à Londres.</li>
          <li class="reveal d6">Area Manager chez <strong>Amazon</strong> en Pologne, jusqu’à 120 personnes
            encadrées.</li>
          <li class="reveal d7">Coordonne <strong>depuis un an</strong> des retraites en Provence pour des
            structures concurrentes.</li>
        </ul>
      </div>
    </div>
    <div class="filet-pied filet d6"></div>
    <p class="mention reveal d7">Paulina porte le projet et reste l’interlocutrice des participantes.</p>
    <p class="numero reveal d7">04 / 21</p>
  </section>

  <!-- ========== 05 · POURQUOI CE PROJET ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Origine du projet</p>
    <div class="filet-entete filet d1"></div>
    <blockquote class="citation encrer d2" style="top:296px">« Nous nous sommes rencontrés en Angleterre.
      Paulina est tombée amoureuse de la Provence et s’y est installée. Nous voulons la faire découvrir,
      et donner à des femmes l’envie de voyager seules, en confiance. »</blockquote>
    <p class="signature reveal d4" style="top:858px">Julien &amp; Paulina</p>
    <div class="filet-pied filet d4"></div>
    <p class="mention reveal d5">Paulina coordonne des retraites en Provence depuis un an, pour des structures concurrentes.</p>
    <p class="numero reveal d5">05 / 21</p>
  </section>

  <!-- ========== 06 · LE CONCEPT ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Le concept</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Sept jours, six nuits, huit participantes</h2>
    <div class="trio" style="top:496px">
      <div class="volet reveal d3"><span class="cle">Le lieu</span>
        <p>Mas Heyrauds, à Ménerbes. Retenu parmi des dizaines de mas équivalents à budget comparable.
          Le lieu sert l’image, il ne porte pas la différenciation.</p></div>
      <div class="volet reveal d4"><span class="cle">Le fil rouge</span>
        <p>Le chef cuisine avec les participantes, à partir des produits achetés le matin même au marché.</p></div>
      <div class="volet reveal d5"><span class="cle">Ce qui reste après</span>
        <p>Les principes de naturopathie sont pensés pour être prolongés une fois rentrées chez elles.</p></div>
    </div>
    <div class="filet-pied filet d5"></div>
    <p class="mention reveal d6">Paulina coordonne la semaine en personne et conduit le van de neuf places.</p>
    <p class="numero reveal d6">06 / 21</p>
  </section>

  <!-- ========== 07 · CE QUI NOUS DIFFÉRENCIE ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">Le concept</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:80px">Un positionnement<br><em>que la concurrence n’occupe pas</em></h2>
    <ul class="liste" style="position:absolute;left:140px;top:512px;width:1080px">
      <li class="reveal d3" style="font-size:26px">Aucun des <strong>huit concurrents étudiés</strong> ne
        construit une semaine entière autour de la cuisine comme fil conducteur.</li>
      <li class="reveal d4" style="font-size:26px">Aucun ne s’adresse au <strong>marché polonais</strong>
        ni ne produit de contenu dans cette langue.</li>
      <li class="reveal d5" style="font-size:26px">Le format se reproduit sur d’autres thématiques
        <strong>sans modifier la structure de coûts</strong>.</li>
    </ul>
    <div class="colonne" style="top:470px">
      <div class="repere reveal d4"><span class="cle">Le vrai concept</span>
        <span class="valeur" style="font-size:34px">Fédérer un groupe de femmes autour d’une passion</span>
        <span class="note">Le repos et le spa sont des standards du secteur. Ils ne constituent pas un avantage.</span></div>
    </div>
    <div class="filet-pied court filet d5"></div>
    <p class="numero reveal d6">07 / 21</p>
  </section>

  <!-- ========== 08 · BASCULE — LE MARCHÉ ========== -->
  <section class="slide s-encre">
    <p class="sect-num reveal d1">02</p>
    <div class="sect-filet filet d1"></div>
    <h2 class="sect-titre encrer d2">Le marché et<br><em>la concurrence</em></h2>
    <p class="sect-chapo reveal d3">Un marché anglo-saxon mature où la demande est prouvée, un marché polonais
      émergent où personne n’est encore positionné sur la Provence.</p>
    <div class="filet-pied filet d3"></div>
    <p class="numero reveal d4">08 / 21</p>
  </section>

  <!-- ========== 09 · DEUX MARCHÉS ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Le marché</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Deux marchés, deux dynamiques</h2>
    <div class="duo" style="top:400px">
      <div class="col">
        <p class="col-titre reveal d3">Anglo-saxon</p>
        <span class="col-role reveal d3">Mature · Demande prouvée</span>
        <div class="col-filet filet d3"></div>
        <ul class="liste">
          <li class="reveal d4">L’offre existante reste concentrée sur un registre <strong>yoga et spa
            générique</strong>.</li>
          <li class="reveal d5">La demande est établie ; <strong>l’offre ne l’est pas</strong> sur le
            créneau thématique.</li>
          <li class="reveal d6">Ciblage de communautés de passionnés : cuisine, vin, naturopathie.</li>
        </ul>
      </div>
      <div class="col">
        <p class="col-titre reveal d3">Polonais</p>
        <span class="col-role reveal d3">Émergent · Aucune offre Provence</span>
        <div class="col-filet filet d4"></div>
        <ul class="liste">
          <li class="reveal d5">Diaspora au Royaume-Uni, en France et en Allemagne, au pouvoir d’achat plus
            élevé.</li>
          <li class="reveal d6">Polonaises urbaines, sur un marché dont le pouvoir d’achat progresse.</li>
          <li class="reveal d7">Contenu <strong>100 % en polonais</strong> : un positionnement sans équivalent
            en Provence.</li>
        </ul>
      </div>
    </div>
    <div class="filet-pied filet d6"></div>
    <p class="numero reveal d7">09 / 21</p>
  </section>

  <!-- ========== 10 · LES SIGNAUX ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Le marché</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Quatre indicateurs de marché</h2>
    <div class="quatuor" style="top:516px">
      <div class="chiffre jumbo-in d3"><span class="valeur">64 %</span>
        <p>du marché mondial du tourisme bien-être est féminin.<br>Source : Global Wellness Institute</p></div>
      <div class="chiffre jumbo-in d4"><span class="valeur">+ 195 %</span>
        <p>de recherches « retraite poterie » en un an aux États-Unis. Indice du glissement vers les
          séjours thématiques.</p></div>
      <div class="chiffre jumbo-in d5"><span class="valeur">+ 20 %</span>
        <p>de croissance annuelle attendue pour le tourisme culinaire polonais.</p></div>
      <div class="chiffre jumbo-in d6"><span class="valeur">2027</span>
        <p>ouverture de la ligne aérienne directe Marseille — New York.</p></div>
    </div>
    <div class="filet-pied filet d6"></div>
    <p class="mention reveal d7">Les deux premiers indicateurs cadrent la demande, les deux suivants l’accès au marché.</p>
    <p class="numero reveal d7">10 / 21</p>
  </section>

  <!-- ========== 11 · LA CONCURRENCE ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">La concurrence</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:76px;top:174px">Un prix d’entrée sur le segment actif</h2>
    <p class="chapo reveal d2" style="top:284px;width:1300px;font-size:21px">Prix par nuit en chambre
      individuelle. Huit concurrents étudiés, classés du moins cher au plus cher.</p>
    <div class="graphe" style="top:352px">
      <div class="ligne-graphe reveal d3"><div class="nom"><b>Core Retreat</b><span>3 nuits · 950 €</span></div>
        <div class="piste"><div class="barre-fill barre d3" style="width:190px"></div><span class="val">317 €</span></div></div>
      <div class="ligne-graphe nous reveal d3"><div class="nom"><b>Les Provençales</b><span>6 nuits · 3 500 €</span></div>
        <div class="piste"><div class="barre-fill barre d4" style="width:350px"></div><span class="val">583 €</span></div></div>
      <div class="ligne-graphe reveal d4"><div class="nom"><b>Club Garrigue</b><span>6 nuits · 3 700 €</span></div>
        <div class="piste"><div class="barre-fill barre d5" style="width:370px"></div><span class="val">617 €</span></div></div>
      <div class="ligne-graphe reveal d5"><div class="nom"><b>Well in France</b><span>4 nuits · 2 850 €</span></div>
        <div class="piste"><div class="barre-fill barre d6" style="width:428px"></div><span class="val">713 €</span></div></div>
      <div class="ligne-graphe reveal d6"><div class="nom"><b>Best French Forever</b><span>5 nuits · 5 000 €</span></div>
        <div class="piste"><div class="barre-fill barre d7" style="width:600px"></div><span class="val">1 000 €</span></div></div>
      <div class="ligne-graphe reveal d7"><div class="nom"><b>The Provence Retreat</b><span>5 nuits · 5 750 €</span></div>
        <div class="piste"><div class="barre-fill barre d8" style="width:690px"></div><span class="val">1 150 €</span></div></div>
      <div class="ligne-graphe reveal d8"><div class="nom"><b>La Bastide de Laurence</b><span>4 nuits · 5 400 €</span></div>
        <div class="piste"><div class="barre-fill barre d9" style="width:810px"></div><span class="val">1 350 €</span></div></div>
      <div class="ligne-graphe reveal d9"><div class="nom"><b>Gallivant &amp; Gather</b><span>7 nuits · 9 750 €</span></div>
        <div class="piste"><div class="barre-fill barre d10" style="width:836px"></div><span class="val">1 393 €</span></div></div>
      <div class="ligne-graphe reveal d10"><div class="nom"><b>Madame de la Maison</b><span>5 nuits · 7 500 €</span></div>
        <div class="piste"><div class="barre-fill barre d11" style="width:900px"></div><span class="val">1 500 €</span></div></div>
    </div>
    <div class="filet-pied filet d10"></div>
    <p class="mention reveal d11">Positionné sous le seul concurrent au format comparable, à moins de la moitié du bloc premium.</p>
    <p class="numero reveal d11">11 / 21</p>
  </section>

  <!-- ========== 12 · LE MODÈLE ÉCONOMIQUE ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Les chiffres</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Le modèle à remplissage complet</h2>
    <table class="tableau" style="top:400px">
      <tr><th>Hypothèse haute : 8 places vendues sur 8</th>
        <th class="n">1 session</th><th class="n">Année 1 · 4 sessions</th></tr>
      <tr class="reveal d3"><td>Chiffre d’affaires TTC</td><td class="n">28 000 €</td><td class="n">112 000 €</td></tr>
      <tr class="reveal d4"><td>Chiffre d’affaires HT</td><td class="n">23 333 €</td><td class="n">93 333 €</td></tr>
      <tr class="reveal d5"><td>Coûts HT</td><td class="n">17 110 €</td><td class="n">68 440 €</td></tr>
      <tr class="reveal d6"><td>Marge avant impôt</td><td class="n">6 223 €</td><td class="n">24 893 €</td></tr>
      <tr class="total reveal d7"><td>Marge nette après impôt</td><td class="n">5 290 €</td><td class="n">21 159 €</td></tr>
    </table>
    <div class="filet-pied filet d7"></div>
    <p class="mention reveal d8">Tarif identique sur les quatre sessions. TVA à 20 %, impôt sur les sociétés à 15 %. Marge nette : 22,7 % du chiffre d’affaires hors taxes.</p>
    <p class="numero reveal d8">12 / 21</p>
  </section>

  <!-- ========== 13 · LES POSTES DE COÛTS ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">Les chiffres</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:88px">Structure de coûts d’une session</h2>
    <table class="tableau" style="top:400px;width:1120px">
      <tr class="reveal d3"><td>Le lieu</td><td class="n">8 000 €</td></tr>
      <tr class="reveal d4"><td>Restauration et chef</td><td class="n">5 180 €</td></tr>
      <tr class="reveal d5"><td>Ateliers cuisine et naturopathie</td><td class="n">1 333 €</td></tr>
      <tr class="reveal d6"><td>Frais bancaires et assurance</td><td class="n">1 136 €</td></tr>
      <tr class="reveal d7"><td>Transport en van</td><td class="n">617 €</td></tr>
      <tr class="total reveal d8"><td>Coûts totaux de la session</td><td class="n">17 110 €</td></tr>
    </table>
    <div class="colonne" style="top:400px">
      <div class="repere reveal d5"><span class="cle">Principaux postes</span>
        <span class="valeur">16 266 €</span>
        <span class="note">sur 17 110 € de coûts totaux. Le lieu représente 47 % des coûts et reste dû quel que soit le remplissage.</span></div>
      <div class="repere reveal d7"><span class="cle">Marge nette</span>
        <span class="valeur">5 290 €</span>
        <span class="note">par session, après impôt sur les sociétés.</span></div>
    </div>
    <div class="filet-pied court filet d8"></div>
    <p class="numero reveal d9">13 / 21</p>
  </section>

  <!-- ========== 14 · POINT MORT ET SENSIBILITÉ ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">Les chiffres</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:88px">Le point mort est atteint<br><em>à six places sur huit</em></h2>
    <table class="tableau" style="top:396px;width:1120px">
      <tr><th style="width:380px">Places vendues par session</th>
        <th class="n" style="width:370px">Marge nette par session</th>
        <th class="n" style="width:370px">Marge nette de l’année</th></tr>
      <tr class="reveal d3"><td style="width:380px">8 sur 8</td>
        <td class="n" style="width:370px">5 290 €</td><td class="n" style="width:370px">21 159 €</td></tr>
      <tr class="reveal d4"><td style="width:380px">7 sur 8</td>
        <td class="n" style="width:370px">2 811 €</td><td class="n" style="width:370px">11 243 €</td></tr>
      <tr class="reveal d5"><td style="width:380px;color:var(--grenat);font-weight:600">6 sur 8</td>
        <td class="n" style="width:370px;color:var(--grenat)">332 €</td>
        <td class="n" style="width:370px;color:var(--grenat)">1 326 €</td></tr>
      <tr class="reveal d6"><td style="width:380px">5 sur 8</td>
        <td class="n" style="width:370px">− 2 527 €</td><td class="n" style="width:370px">− 10 107 €</td></tr>
    </table>
    <div class="colonne" style="top:396px">
      <div class="repere reveal d4"><span class="cle">Point mort</span>
        <span class="valeur">5,9 places</span>
        <span class="note">Il faut vendre six places sur huit pour couvrir les coûts d’une session.</span></div>
      <div class="repere reveal d6"><span class="cle">Hypothèses</span>
        <span class="valeur" style="font-size:34px">Tous les coûts tenus pour fixes</span>
        <span class="note">Une part de la restauration varie en réalité avec le nombre de participantes :
          le point mort réel est un peu plus bas.</span></div>
    </div>
    <div class="filet-pied court filet d6"></div>
    <p class="mention reveal d7">Recette hors taxes par participante : 2 917 €. Coûts d’une session : 17 110 €.</p>
    <p class="numero reveal d7">14 / 21</p>
  </section>

  <!-- ========== 14 · L’ÉTAT D’AVANCEMENT ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">Où en sommes-nous</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:88px">Ce qui est déjà fait</h2>
    <ul class="avancement" style="top:376px;width:1120px">
      <li class="reveal d3"><strong>Le lieu</strong> est identifié, la négociation des quatre sessions 2027 est en cours.</li>
      <li class="reveal d4"><strong>La marque</strong> est sécurisée : nom, logo, noms de domaine.</li>
      <li class="reveal d5"><strong>Le programme</strong> est détaillé jour par jour.</li>
      <li class="reveal d6"><strong>Le prévisionnel</strong> est chiffré et vérifié.</li>
      <li class="reveal d7"><strong>Le site</strong> est en développement, les réseaux sociaux sont créés.</li>
      <li class="reveal d8"><strong>Le plan commercial</strong> est construit sur les deux marchés.</li>
    </ul>
    <div class="colonne" style="top:400px">
      <div class="repere reveal d6"><span class="cle">Déjà sur le terrain</span>
        <span class="valeur" style="font-size:34px">Un an de coordination de retraites</span>
        <span class="note">Paulina coordonne aujourd’hui des séjours pour des structures concurrentes.
          C’est une preuve d’exécution, pas une compétence déclarée.</span></div>
    </div>
    <div class="filet-pied court filet d8"></div>
    <p class="numero reveal d9">15 / 21</p>
  </section>

  <!-- ========== 15 · LE PLAN DE DÉPLOIEMENT ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Le calendrier</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">De l’immatriculation à la session pilote</h2>
    <div class="frise" style="top:548px">
      <div class="frise-axe filet d3"></div>
      <div class="frise-etapes">
        <div class="etape reveal d4"><span class="quand">Sept — Oct 2026</span>
          <p>Financement et immatriculation de la société.</p></div>
        <div class="etape reveal d5"><span class="quand">Nov 2026</span>
          <p>Réservation du lieu et des prestataires pour les quatre sessions.</p></div>
        <div class="etape reveal d6"><span class="quand">Déc 2026</span>
          <p>Ouverture des réservations, campagnes anglaise et polonaise.</p></div>
        <div class="etape cle reveal d7"><span class="quand">Sept 2027</span>
          <p>Session pilote, marché anglo-saxon.</p></div>
        <div class="etape reveal d8"><span class="quand">Oct — Nov 2027</span>
          <p>Deuxième session anglaise, puis la session polonaise.</p></div>
        <div class="etape reveal d9"><span class="quand">Déc 2027</span>
          <p>Quatrième session, puis bilan de l’année.</p></div>
      </div>
    </div>
    <div class="filet-pied filet d9"></div>
    <p class="mention reveal d10">Un débrief est prévu dès octobre 2027, juste après le pilote.</p>
    <p class="numero reveal d10">16 / 21</p>
  </section>

  <!-- ========== 16 · BASCULE — LA DEMANDE ========== -->
  <section class="slide s-encre">
    <p class="sect-num reveal d1">03</p>
    <div class="sect-filet filet d1"></div>
    <h2 class="sect-titre encrer d2">La demande<br><em>de financement</em></h2>
    <p class="sect-chapo reveal d3">Un besoin de trésorerie ponctuel, destiné aux acomptes de réservation
      des quatre sessions de 2027.</p>
    <div class="filet-pied filet d3"></div>
    <p class="numero reveal d4">17 / 21</p>
  </section>

  <!-- ========== 17 · 15 189 € ========== -->
  <section class="slide s-ivoire">
    <div class="aplat pan"></div>
    <div class="bord-aplat"></div>
    <p class="surtitre reveal d1">La demande</p>
    <div class="filet-entete court filet d1"></div>
    <h2 class="titre court encrer d2" style="font-size:88px">Un besoin de 15 189 €</h2>
    <div class="duo serre" style="top:376px">
      <div class="col">
        <span class="col-role reveal d3">D’où vient l’argent</span>
        <div class="col-filet filet d3"></div>
        <table class="tableau" style="position:relative;left:0;top:0;width:520px">
          <tr class="reveal d4"><td style="width:300px;font-size:22px">Apport personnel</td><td class="n" style="font-size:30px;width:220px">2 000 €</td></tr>
          <tr class="reveal d5"><td style="width:300px;font-size:22px">Prêt d’honneur — Julien</td><td class="n" style="font-size:30px;width:220px">6 595 €</td></tr>
          <tr class="reveal d6"><td style="width:300px;font-size:22px">Prêt d’honneur — Paulina</td><td class="n" style="font-size:30px;width:220px">6 594 €</td></tr>
        </table>
      </div>
      <div class="col">
        <span class="col-role reveal d3">À quoi il sert</span>
        <div class="col-filet filet d4"></div>
        <table class="tableau" style="position:relative;left:0;top:0;width:520px">
          <tr class="reveal d5"><td style="width:320px;font-size:22px">Acomptes du lieu</td><td class="n" style="font-size:30px;width:200px">9 600 €</td></tr>
          <tr class="reveal d6"><td style="width:320px;font-size:22px">Marketing de lancement</td><td class="n" style="font-size:30px;width:200px">2 500 €</td></tr>
          <tr class="reveal d7"><td style="width:320px;font-size:22px">Acomptes prestataires</td><td class="n" style="font-size:30px;width:200px">1 050 €</td></tr>
          <tr class="reveal d8"><td style="width:320px;font-size:22px">Marque, site, digital</td><td class="n" style="font-size:30px;width:200px">930 €</td></tr>
          <tr class="reveal d9"><td style="width:320px;font-size:22px">Juridique et comptabilité</td><td class="n" style="font-size:30px;width:200px">809 €</td></tr>
          <tr class="reveal d10"><td style="width:320px;font-size:22px">Frais commerciaux</td><td class="n" style="font-size:30px;width:200px">300 €</td></tr>
        </table>
      </div>
    </div>
    <div class="colonne" style="top:376px">
      <div class="repere reveal d5"><span class="cle">Sollicité en prêt d’honneur</span>
        <span class="valeur" style="font-size:64px;color:var(--grenat)">13 189 €</span>
        <span class="note">Deux demandes individuelles, après 2 000 € d’apport personnel.</span></div>
    </div>
    <div class="filet-pied court filet d9"></div>
    <p class="mention reveal d10">Les acomptes du lieu représentent 63 % du besoin et conditionnent la réservation des quatre sessions.</p>
    <p class="numero reveal d10">18 / 21</p>
  </section>

  <!-- ========== 18 · REMBOURSEMENT ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">La demande</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">La marge 2027 couvre 1,6 fois l’emprunt</h2>
    <div class="heros jumbo-in d3" style="top:424px">
      <span class="valeur">21 159 €</span>
      <p class="quoi">de marge nette en 2027 à remplissage complet, pour 13 189 € empruntés.
        À sept places sur huit, la marge de l’année en couvre 0,85 fois : le remboursement s’étale
        alors sur deux exercices.</p>
    </div>
    <div class="volet reveal d5" style="position:absolute;left:1180px;top:424px;width:600px">
      <span class="cle">Pourquoi maintenant</span>
      <p>Chaque mois de retard sur le financement repousse la réservation des quatre sessions déjà
        positionnées sur le calendrier 2027. C’est un besoin de trésorerie ponctuel, pas structurel.</p>
    </div>
    <div class="filet-pied filet d6"></div>
    <p class="mention reveal d6">Le besoin finance des acomptes de réservation, pas un déficit d’exploitation.</p>
    <p class="numero reveal d6">19 / 21</p>
  </section>

  <!-- ========== 19 · RISQUES ET RÉPONSES ========== -->
  <section class="slide s-ivoire">
    <p class="surtitre reveal d1">Les risques</p>
    <div class="filet-entete filet d1"></div>
    <h2 class="titre encrer d2" style="font-size:88px">Risques identifiés et mesures</h2>
    <div class="risques" style="top:400px">
      <div class="risque reveal d3"><p class="quoi">Le remplissage des quatre sessions</p>
        <p class="reponse"><b>Le point mort est à six places sur huit.</b> Le prix d’entrée du segment
          et l’ouverture de deux marchés élargissent la base de prospects.</p></div>
      <div class="risque reveal d4"><p class="quoi">Aucun retour client avant le pilote</p>
        <p class="reponse">Paulina coordonne depuis un an des retraites pour des structures concurrentes,
          sur ce métier et sur ce territoire. <b>L’exécution est déjà éprouvée.</b></p></div>
      <div class="risque reveal d5"><p class="quoi">Dépendance à un lieu unique</p>
        <p class="reponse">Des dizaines de mas équivalents sont disponibles dans le Luberon à budget
          comparable. <b>Le lieu n’est pas le différenciant.</b></p></div>
    </div>
    <div class="filet-pied filet d5"></div>
    <p class="mention reveal d6">L’équipe se limite à deux personnes : huit participantes et des prestataires locaux dimensionnent le format en conséquence.</p>
    <p class="numero reveal d6">20 / 21</p>
  </section>

  <!-- ========== 20 · CONCLUSION ========== -->
  <section class="slide s-ivoire">
    <div class="couv-aplat pan"></div>
    <div class="couv-bord"></div>
    <div class="trait-grenat filet d1"></div>
    <p class="couv-surtitre reveal d2">En conclusion</p>
    <blockquote class="citation encrer d3" style="top:428px;width:1060px;font-size:62px">Le lieu, l’équipe,
      le calendrier et le prévisionnel sont établis. Le prêt d’honneur débloque les acomptes et permet
      d’ouvrir les réservations en décembre 2026.</blockquote>
    <img class="couv-logo reveal d5" src="__LOGO__" alt="Les Provençales">
    <p class="couv-pied reveal d6">Julien &amp; Paulina</p>
    <div class="couv-colonne" style="top:392px">
      <div class="repere reveal d4"><span class="cle">Sollicité</span>
        <span class="valeur" style="color:var(--grenat)">13 189 €</span>
        <span class="note">en prêt d’honneur, deux demandes individuelles.</span></div>
      <div class="repere reveal d5"><span class="cle">Si accord</span>
        <span class="valeur" style="font-size:34px">Réservation des 4 sessions dans la semaine</span>
        <span class="note">Ouverture des ventes dès décembre 2026.</span></div>
    </div>
    <p class="couv-date reveal d6">21 / 21</p>
  </section>

  </main>
</div>

<div class="progression" id="progression"></div>
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

  /* La scène entière est mise à l’échelle d’un seul transform.
     Le contenu n’est jamais recomposé : le 16:9 est conservé partout. */
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
   ÉDITION EN LIGNE
   Survol du coin haut-gauche ou touche E. Les corrections sont
   conservées dans le navigateur ; Ctrl+S enregistre une copie.
   =========================================================== */
class Editeur {
  constructor(presentation){
    this.presentation = presentation;
    this.actif = false;
    this.cle = 'provencales-deck-v1';
    this.champs = Array.from(document.querySelectorAll(
      '.couv-titre,.couv-chapo,.couv-surtitre,.couv-pied,.couv-date,.titre,.chapo,.surtitre,.mention,' +
      '.sect-titre,.sect-chapo,.citation,.signature,.liste li,.volet p,.volet .accroche,.chiffre p,' +
      '.etape p,.avancement li,.risque .quoi,.risque .reponse,.repere .valeur,.repere .note,' +
      '.col-titre,.col-role,.heros .quoi,.tableau td'));
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
    a.download = 'les-provencales-comite.html';
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
new Editeur(presentation);
</script>
</body>
</html>
