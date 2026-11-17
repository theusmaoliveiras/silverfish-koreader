# Consignes de traduction française — Silverfish → « la Mite »

Plugin KOReader : une petite bête des livres (pixel art d'un poisson d'argent) qui vit dans la liseuse,
mange les pages lues, grandit et parle de ce qu'on lit. Textes d'origine en portugais (PT, la source),
adaptés en anglais (EN, « adaptado, não traduzido »). On produit le français (FR).

## Ton et principes
- **Source = le PT** (genre, articles et structure proches du français). Ouvrir l'EN en parallèle : il montre
  ce que l'auteur a jugé intraduisible et comment il a réécrit une blague. **La blague passe avant la
  fidélité** : un jeu de mots PT intraduisible se remplace par un jeu de mots français du même esprit.
- Français naturel, vivant, un peu pince-sans-rire ; phrases courtes. Pas de calque du portugais
  (« Tô com fome » → « J'ai la dalle », pas « Je suis avec faim »). Registre selon la voix (enfantine,
  râleuse, érudite…), exactement comme le PT.
- **Elle s'appelle « la Mite »** (nom propre, majuscule : « la Mite est devenue adulte »). En capitales
  dans l'UI : « LA MITE ». Le joueur peut dire « ta Mite ».
- **Elle est au féminin**, comme en PT : « je suis affamée », « OBSÉDÉE », « DIVISÉE ».
- Phases : ovo → **œuf**, ninfa → **nymphe**, jovem → **jeune**, adulta → **adulte**, anciã → **ancienne**
  (« l'ancienne », « ANCIENNE »). Le mot « traça » quand il désigne l'espèce → « mite » (minuscule).
- Le lecteur est **tutoyé** (« tu », « ton livre »). **Jamais d'adjectif genré pour le lecteur** (pas « tu es
  fatigué ») **ni pour un personnage** `{personagem}` (« {personagem} est entré·e » interdit → reformuler :
  « {personagem} vient d'arriver »).

## Gabarits : intouchables
- Garder **tels quels** les gabarits `{livro}`, `{autor}`, `{personagem}`, `{palavra}`, `{evento}`,
  `{anterior}`, `{outro}`, `{lente}`, `{n}`, `{nome}`, `{fala}`, `{hora}`, `{pct}`, `{mes}`, `{ordinal}`…
  et `%s`, `%d` (même nombre, même ordre). Ne pas en inventer : seuls ceux de la source existent.
- Valeur par défaut `{gosto|poussière}` : on traduit la partie après `|`, pas le nom.
- Marques de voix `<polo:texte|polo:texte|dominio:texte|défaut>` : **ne pas traduire les noms de pôles**
  (amarga, otimista, medrosa, corajosa, cinica, romantica, popular, erudita, diurna, noturna, dominio) ni
  les seuils (`noturna.6:`) ; traduire seulement les textes. Garder `<` `>` `|` `:` à la même place.
- Clés de tables (`B.dia.magro`, `fase = "ninfa"`, `quando = "noite"`, `situacao = …`) : **jamais
  traduites**. Seul le texte des chaînes change.
- Ce que donnent les gabarits en français :
  - `{tema}` = thème avec article : « la mort », « l'amour », « la mer », « Dieu », « les bêtes ». Jamais
    sujet de la phrase (le genre change).
  - `{de_tema}` = « de la mort », « de l'amour », « du temps », « de Dieu », « des bêtes » → « une odeur
    {de_tema} ».
  - `{evento}` (influences, `_causa`) = groupe nominal avec déterminant (« un enterrement », « cet
    enterrement ») ; à écrire dans la liste `eventos` du même fichier.
  - `{lente}` = un nom **avec son article**, tiré des « lentes » de l'influence (« un labyrinthe »).
  - Mots de domaine (fichier `dominios_fr.lua`), **convention française** :
    - `gosto` et `cheiro` **incluent la préposition** : « de sel », « d'algue », « de bougie éteinte ».
      Les modèles écrivent donc « un goût {gosto} », « une odeur {cheiro} » (jamais « goût de {gosto} »).
      Défauts inline idem : `{gosto|de poussière}`.
    - `comparacao` : après « comme » : « une vague qui se brise » (pas d'élision possible après comme).
    - `exclamacao` : phrase entière : « Terre en vue ! ».
    - `lugar` : avec sa préposition : « sur le pont ».
    - `coisa` : avec son article : « une ancre ».

## Typographie (contrôlée par le vérificateur)
- **Espace insécable U+00A0** (le caractère, pas `&nbsp;`) avant `! ? ; :` et à l'intérieur des
  guillemets : `« {livro} »`. Une espace ordinaire avant `!` serait supprimée par le moteur. **Jamais
  U+202F** (absente de la police).
- Titres de livres et citations entre **« »** (avec U+00A0) au lieu de “ ”.
- Apostrophe : garder celle de la source (droite `'` ou courbe `’`) ; pas de mélange dans une même chaîne.
- Nombres : « 1 000 » avec U+00A0 ; ordinaux « 2e », « 3e » (pas « 2º »).
- Capitales accentuées en UI : « ÉTÉ », « FÂCHÉE » (la police les a).
- Longueur : ~15 % de plus que le PT au maximum ; les champs `curta` doivent tenir en ~50 lettres.

## Fichier à produire
- Même structure que le fichier source, mêmes clés, mêmes longueurs de listes (on peut traduire en
  adaptant, pas sauter des entrées). En-tête `--[[-- … ]]` en français, court.
- Encodage UTF-8, Lua 5.1 valide. Chaînes entre guillemets doubles : échapper `"` intérieurs ou utiliser
  `[[ ]]` comme la source.

## Vérification obligatoire avant de rendre
Depuis `silverfish.koplugin/` :
```
luajit -bl <fichier>.lua > /dev/null                         # syntaxe
luajit ../ferramentas/fr/verifier.lua <module_fr> <module_source> [<module_en>]
```
Exemple : `luajit ../ferramentas/fr/verifier.lua traca_banco.diario_fr traca_banco.diario_pt traca_banco.diario_en`.
Corriger jusqu'à **0 erreur** ; lire les avertissements.

## Le Chat des Cendres (2.0.0, banques `gato_banco/*_fr.lua`)
Choix arrêtés le 15/11/2026.
- **Nom** : « le Chat des Cendres » (PT « Gato-das-Cinzas », EN « Ash Cat ») ; en capitales d'UI
  « CHAT DES CENDRES ». L'espèce en minuscule : « un chat des cendres ».
- **Il est au masculin** (contrairement à la Mite) : « je suis rassasié », « OBSÉDÉ ».
- Stades : ovo → **œuf**, filhote → **chaton**, adulto → **adulte**, velho → **vieux** (« le vieux chat »,
  « VIEUX »).
- **Voix** : méfiant, conspirateur, contrebandier pince-sans-rire ; il ne mange pas les pages, il les
  **garde** (les met à l'abri, les archive). Il **tutoie** le lecteur et l'appelle « **complice** »
  (PT « cúmplice »). Il cite les « **Règles de la Cave** » (PT « Regras do Porão ») apprises de sa
  grand-mère : « Règle 14 : … ». Le porão = **la cave** ; son journal « NOTAS DO PORÃO » → « NOTES DE LA
  CAVE ». Estoque → **réserve** (« RÉSERVE », « PAGES ARCHIVÉES »).
- Les didascalies entre parenthèses (l'œuf qui ne parle pas encore) restent entre parenthèses, en
  minuscules, au présent.
- **Citations d'auteurs réels** : si la source cite un auteur du domaine public (Milton, Montaigne…),
  traduire soi-même, brièvement. **Ne jamais recopier une traduction française publiée** ni allonger un
  extrait d'une œuvre protégée : garder la citation aussi courte que la source, ou la paraphraser.
- Les fichiers `infl_fr_1` à `infl_fr_4` se chargent par `influencias_fr.lua`, qui doit faire
  `require("gato_banco.infl_fr_" .. i)` (même structure que `influencias_pt.lua`).
- Vérification : `luajit ../ferramentas/fr/verifier.lua gato_banco.<x>_fr gato_banco.<x>_pt gato_banco.<x>_en`.
