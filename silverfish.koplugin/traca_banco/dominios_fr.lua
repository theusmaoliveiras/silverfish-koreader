--[[--
Vocabulaire de chaque thème (français) : les mots qu'elle tire du sujet qu'elle a digéré. Mêmes six types
que dominios_pt.lua, avec la convention française :
  gosto       après "un goût" (inclut "de"/"d'") :  "de sel"
  cheiro      après "une odeur" (inclut "de"/"d'") : "d'algue"
  comparacao  après "comme" :                       "une vague qui se brise"
  exclamacao  phrase entière :                      "Terre en vue !"
  lugar       avec sa préposition :                 "sur le pont"
  coisa       avec son article :                    "une ancre"
_causa : la mauvaise humeur avec un vrai motif tiré du livre ({evento} vient avec "ce"/"cet"/"cette").
Ne jamais parler du lecteur avec un adjectif genré.
]]

local D = {}

D.morte = {
    gosto = { "de bougie éteinte", "de terre mouillée", "de fleur fanée", "de cendre", "de thé froid d'enterrement" },
    cheiro = { "de chrysanthème", "de bougie consumée", "de terre retournée", "de naphtaline", "de fleurs d'enterrement" },
    comparacao = { "un glas d'enterrement", "une bougie en fin de vie", "un portrait au ruban noir", "une lettre que personne ne lira", "une horloge arrêtée" },
    exclamacao = { "Que Dieu ait son âme !", "Repose en paix !", "Ah, le deuil !", "Jésus, Marie, Joseph !" },
    lugar = { "dans un cimetière", "derrière un cercueil", "dans une chapelle vide", "à une veillée funèbre", "sous une pierre tombale" },
    coisa = { "une couronne de fleurs", "un voile noir", "un cercueil en papier", "une pierre tombale sans nom", "une horloge arrêtée" },
}
D.amor = {
    gosto = { "de bonbon", "de lettre parfumée", "de fraise", "de baiser volé", "de miel" },
    cheiro = { "de rose", "de lettre parfumée", "de lavande", "de fleur d'oranger", "de poudre de riz" },
    comparacao = { "un billet plié en quatre", "un soupir de balcon", "un cœur dessiné dans la marge", "une valse", "une paire de gants oubliée" },
    exclamacao = { "Ah, l'amour !", "Quelle romance !", "Soupir !", "Tiens bon, mon cœur !" },
    lugar = { "sur un balcon au clair de lune", "dans un bal", "sous une fenêtre", "dans une roseraie", "sur un banc public" },
    coisa = { "une lettre d'amour", "une bague", "une rose séchée", "un mouchoir brodé", "un portrait dans un médaillon" },
}
D.guerra = {
    gosto = { "de poudre", "de rouille", "de ration de soldat", "de fumée", "de boue de tranchée" },
    cheiro = { "de poudre", "de fumée", "de cuir de botte", "de boue", "de métal chaud" },
    comparacao = { "un tambour de marche", "une balle perdue", "une carte déchirée", "un canon", "une tranchée détrempée" },
    exclamacao = { "Aux armes !", "Feu !", "Repli !", "Garde-à-vous !" },
    lugar = { "dans une tranchée", "sur le champ de bataille", "derrière une barricade", "dans une caserne", "en première ligne" },
    coisa = { "une médaille", "un casque cabossé", "une baïonnette", "un drapeau déchiré", "une carte de bataille" },
}
D.mar = {
    gosto = { "de sel", "d'embruns", "d'eau de coco", "de poisson séché", "d'algue" },
    cheiro = { "d'embruns", "de sel", "de corde mouillée", "d'algue", "de bois de navire" },
    comparacao = { "une vague qui se brise", "un navire dans la tempête", "une ancre", "une marée basse", "un phare allumé" },
    exclamacao = { "Terre en vue !", "Un homme à la mer !", "Marée haute !", "Par la barbe de Neptune !" },
    lugar = { "sur le pont", "sur une île déserte", "dans la cale d'un navire", "dans un phare", "au fond de la mer" },
    coisa = { "une ancre", "une bouteille à la mer", "une boussole", "un coquillage", "une carte au trésor" },
}
D.fe = {
    gosto = { "d'hostie", "d'eau bénite", "de pain de monastère", "d'encens", "de vin de messe" },
    cheiro = { "d'encens", "de cierge d'église", "de bois de confessionnal", "de cire", "de myrrhe" },
    comparacao = { "une cloche d'église", "une prière murmurée", "un vitrail", "une procession", "un chapelet usé" },
    exclamacao = { "Seigneur, aie pitié !", "Alléluia !", "Amen !", "Mon Dieu !" },
    lugar = { "dans une église vide", "dans un monastère", "dans un confessionnal", "devant un autel", "dans une chapelle au bord de la route" },
    coisa = { "un chapelet", "un cierge votif", "une image pieuse", "une bible usée", "un crucifix" },
}
D.dinheiro = {
    gosto = { "de pièce", "de vieux billet", "d'or", "de coffre-fort", "d'intérêts" },
    cheiro = { "de billet neuf", "de coffre fermé", "de cuir de portefeuille", "d'encre de banque", "de métal" },
    comparacao = { "un coffre verrouillé", "une dette", "une fausse pièce", "un relevé bancaire", "un héritage disputé" },
    exclamacao = { "Quelle fortune !", "De l'or !", "Faillite !", "Plus un sou !" },
    lugar = { "dans une banque", "derrière un comptoir", "dans un coffre", "chez un prêteur sur gages", "chez le notaire" },
    coisa = { "une pièce d'or", "un testament", "un billet à ordre", "un coffre-fort", "un livre de comptes" },
}
D.loucura = {
    gosto = { "de remède amer", "de tisane de camomille", "de craie", "de miroir", "de papier peint" },
    cheiro = { "d'éther", "de grenier fermé", "de vieux papier peint", "de médicament", "de bougie de minuit" },
    comparacao = { "un rire dans le couloir", "un miroir fêlé", "une horloge qui tourne à l'envers", "un escalier sans fin", "une voix dans le grenier" },
    exclamacao = { "Je perds la tête !", "Quel délire !", "Ha !", "Au secours, les murs parlent !" },
    lugar = { "dans un grenier verrouillé", "dans un couloir sans fin", "dans un asile", "derrière le papier peint", "à l'intérieur d'un miroir" },
    coisa = { "un miroir fêlé", "une camisole de force", "un journal griffonné", "une clé sans porte", "un papier peint jaune" },
}
D.tempo = {
    gosto = { "de poussière", "de rouille", "de pain rassis", "de thé froid", "de gâteau d'hier" },
    cheiro = { "de poussière", "de vieille horloge", "d'album photo", "de grenier", "de papier jauni" },
    comparacao = { "un sablier", "du sable qui s'écoule", "un calendrier arraché", "une aiguille en retard", "un portrait délavé" },
    exclamacao = { "Tic-tac !", "Il est déjà tard !", "Ah, les années !", "Quelle heure est-il ?" },
    lugar = { "dans une tour d'horloge", "dans un grenier poussiéreux", "dans un album photo", "dans une vieille gare", "au siècle dernier" },
    coisa = { "une montre à gousset", "un sablier", "un vieux calendrier", "un portrait délavé", "une bougie usée" },
}
D.cidade = {
    gosto = { "de suie", "de café du coin", "d'asphalte", "de beignet de foire", "de fumée de tramway" },
    cheiro = { "de suie", "de pluie sur l'asphalte", "de café de boulangerie", "de journal mouillé", "de fumée d'usine" },
    comparacao = { "un tramway bondé", "un coin de rue animé", "un réverbère allumé", "une place noire de monde", "un immeuble bruyant" },
    exclamacao = { "Quel vacarme !", "Attention au tramway !", "Édition spéciale ! Édition spéciale !", "Quelle foule !" },
    lugar = { "au coin d'une rue", "dans un immeuble populaire", "sur une place bondée", "dans un tramway", "dans une rue pavée" },
    coisa = { "un journal froissé", "un ticket de tramway", "un parapluie", "un réverbère", "un chapeau oublié" },
}
D.natureza = {
    gosto = { "de feuille", "de rosée", "d'herbe", "de fruit cueilli sur l'arbre", "de terre" },
    cheiro = { "de sous-bois", "de pluie sur la terre", "de fleur des champs", "d'eucalyptus", "de foin" },
    comparacao = { "une branche dans le vent", "une rivière qui court", "un vieil arbre", "un champ en fleurs", "une clôture en bois" },
    exclamacao = { "Quel vert !", "Regarde la rivière !", "Ah, la campagne !", "Ça sent la pluie !" },
    lugar = { "au milieu des bois", "au bord d'une rivière", "sous un arbre", "dans un champ de blé", "dans une clairière" },
    coisa = { "une feuille sèche", "une branche", "un galet de rivière", "un nid", "une fleur pressée" },
}
D.comida = {
    gosto = { "de gâteau de maïs", "de pain chaud", "de confiture", "de beurre", "de café au lait" },
    cheiro = { "de pain sorti du four", "de café", "de cannelle", "de soupe", "de gâteau" },
    comparacao = { "un banquet", "un flan qui tremble", "une casserole sur le feu", "un gâteau qui gonfle", "une table de dimanche" },
    exclamacao = { "Quelle faim !", "Un délice !", "À table !", "Quel festin !" },
    lugar = { "dans une cuisine", "à une table de dîner", "dans une pâtisserie", "dans un garde-manger", "à un pique-nique" },
    coisa = { "une cuillère en bois", "un flan", "une corbeille à pain", "une tasse ébréchée", "un livre de recettes" },
}
D.familia = {
    gosto = { "de déjeuner du dimanche", "de gâteau de mamie", "de goûter", "de pain maison", "de compote" },
    cheiro = { "de maison de mamie", "de linge sur la corde", "de déjeuner du dimanche", "de vieille armoire", "de vieux savon" },
    comparacao = { "une grande table de famille", "un portrait de famille", "une dispute au réveillon", "une maison pleine de chambres", "un héritage partagé" },
    exclamacao = { "Ah, la famille !", "Quels parents !", "Maman !", "Tout le monde à table !" },
    lugar = { "dans la salle à manger", "chez la grand-mère", "dans une chambre d'enfant", "à un réveillon de Noël", "dans une grande demeure" },
    coisa = { "un album de famille", "un testament", "une nappe brodée", "un portrait ovale", "un patchwork" },
}
D.infancia = {
    gosto = { "de bonbon gélifié", "de barbe à papa", "de lait chocolaté", "de sucette", "de bouillie" },
    cheiro = { "de crayon de cire", "de pâte à modeler", "de talc", "de crayon de couleur", "de bonbon" },
    comparacao = { "une toupie qui tourne", "un cerf-volant dans le ciel", "une balançoire", "une ronde enfantine", "une dent de lait" },
    exclamacao = { "Youpi !", "Chat perché !", "Il était une fois !", "C'est toi qui t'y colles !" },
    lugar = { "sur une balançoire", "dans une cabane dans l'arbre", "dans un jardin", "dans une salle de classe", "sous le lit" },
    coisa = { "une toupie", "une poupée", "un cahier d'écriture", "une bille", "un ours en peluche" },
}
D.politica = {
    gosto = { "de vieux discours", "d'encre de journal", "de promesse en l'air", "de café de cabinet", "de papier tamponné" },
    cheiro = { "de cigare", "d'encre de journal", "de cabinet fermé", "de papier tamponné", "de cire de palais" },
    comparacao = { "un discours sans fin", "une élection serrée", "un décret", "un complot dans le couloir", "un tampon" },
    exclamacao = { "À l'ordre !", "Vive la république !", "À bas le roi !", "Coup d'État !" },
    lugar = { "dans un parlement", "dans un palais", "dans un meeting", "dans un cabinet fermé", "dans une assemblée" },
    coisa = { "un décret", "un bulletin de vote", "un tampon", "un discours froissé", "une écharpe présidentielle" },
}
D.ciencia = {
    gosto = { "de craie de tableau", "d'éther", "de métal de laboratoire", "d'encre de formule", "de poussière de lentille" },
    cheiro = { "de laboratoire", "d'éther", "d'alcool", "d'ozone", "de fil brûlé" },
    comparacao = { "une expérience qui a mal tourné", "un tube à essai", "un microscope", "une longue formule", "une étincelle électrique" },
    exclamacao = { "Eurêka !", "Hypothèse !", "Quelle découverte !", "Pour la science !" },
    lugar = { "dans un laboratoire", "dans un observatoire", "derrière un microscope", "dans un cours de physique", "à l'intérieur d'une drôle de machine" },
    coisa = { "un tube à essai", "une lentille", "un cahier de formules", "un engrenage", "un télescope" },
}
D.solidao = {
    gosto = { "de thé froid", "de pain en solitaire", "de silence", "de café pour une seule tasse", "de soupe claire" },
    cheiro = { "de chambre fermée", "de pluie sur la vitre", "de maison vide", "de draps rangés", "de poussière" },
    comparacao = { "une chaise vide", "un phare sans navire", "une lettre sans réponse", "une île", "un écho" },
    exclamacao = { "Il y a quelqu'un ?", "Personne !", "Ah, le silence.", "Allô ?" },
    lugar = { "dans une chambre vide", "sur une île", "dans un phare", "dans une maison sans personne", "dans une gare déserte" },
    coisa = { "une chaise vide", "une tasse esseulée", "une lettre sans réponse", "un parapluie solitaire", "une bougie allumée" },
}
D.arte = {
    gosto = { "de peinture à l'huile", "de vernis", "de fusain", "d'aquarelle", "de plâtre" },
    cheiro = { "de peinture à l'huile", "de térébenthine", "de vernis", "d'atelier", "de vieille partition" },
    comparacao = { "un tableau de travers", "une symphonie", "une sculpture inachevée", "un sonnet", "une scène vide" },
    exclamacao = { "Bravo !", "Bis !", "Quel chef-d'œuvre !", "Muse, aide-moi !" },
    lugar = { "dans un atelier", "dans un théâtre", "dans un musée", "sur une scène", "dans une galerie" },
    coisa = { "un pinceau", "une partition", "un buste en plâtre", "un cadre vide", "un violon" },
}
D.animais = {
    gosto = { "d'herbe", "d'os", "de croquettes", "de plume", "de poil" },
    cheiro = { "d'étable", "de chien mouillé", "de foin", "de nid", "de terrier" },
    comparacao = { "un cheval au galop", "une chouette", "un chat sur le toit", "une baleine", "un chien fidèle" },
    exclamacao = { "Ouaf !", "Miaou !", "Quelle bête !", "Hue, cheval !" },
    lugar = { "dans une étable", "dans un terrier", "dans un nid", "sur le dos d'un cheval", "dans une grange" },
    coisa = { "un fer à cheval", "une plume", "un collier", "un nid", "un os" },
}
D.noite = {
    gosto = { "de rosée", "de lait tiède", "de lune", "de bougie", "de tisane de minuit" },
    cheiro = { "de nuit fraîche", "de bougie allumée", "de belle-de-nuit", "de draps", "de rosée" },
    comparacao = { "une pleine lune", "une chouette éveillée", "une bougie en fin de vie", "un ciel sans étoiles", "un couloir sombre" },
    exclamacao = { "Bonne nuit !", "Chut, il est minuit passé !", "Quelle lune !", "Chut !" },
    lugar = { "sous la lune", "dans une rue sombre", "sur un toit à minuit", "dans une chambre sans lumière", "dans une tour" },
    coisa = { "une lampe à huile", "une bougie", "un chandelier", "un bonnet de nuit", "une lanterne" },
}
D.viagem = {
    gosto = { "de poussière de route", "de café de gare", "de pain de voyage", "de sel de port", "de fumée de train" },
    cheiro = { "de vieille valise", "de fumée de train", "de chemin de terre", "de cuir de selle", "de charbon de locomotive" },
    comparacao = { "une diligence qui cahote", "un train qui siffle", "une carte pliée", "une valise pleine", "une route sans fin" },
    exclamacao = { "En route !", "Tout le monde à bord !", "Prochain arrêt !", "Sur les routes !" },
    lugar = { "dans une diligence", "dans un train de nuit", "dans une auberge", "dans une gare", "sur un chemin de terre" },
    coisa = { "une valise", "un billet de train", "une carte", "une boussole", "un passeport" },
}
D.vinganca = {
    gosto = { "de poison", "de fer", "de plat froid", "de sang", "de cendre" },
    cheiro = { "de poudre", "de fer", "de poison", "de sang", "de fumée" },
    comparacao = { "une promesse de sang", "une lame cachée", "un plat qui se mange froid", "une vieille dette", "un duel à l'aube" },
    exclamacao = { "Vengeance !", "Il va payer !", "Œil pour œil !", "Je n'oublierai jamais !" },
    lugar = { "dans un duel à l'aube", "dans un cachot", "derrière un rideau", "à un carrefour", "dans un château en ruine" },
    coisa = { "un poignard", "un flacon de poison", "un gant jeté à terre", "une lettre anonyme", "une liste de noms" },
}
D.liberdade = {
    gosto = { "de vent", "d'air pur", "de pain partagé", "de fruit volé", "de pluie" },
    cheiro = { "de vent", "de plaine", "de large", "de pluie", "de grand chemin" },
    comparacao = { "un oiseau hors de sa cage", "une porte ouverte", "un cri", "une chaîne brisée", "un cheval en liberté" },
    exclamacao = { "Liberté !", "Ouvrez les portes !", "À bas les chaînes !", "Envole-toi !" },
    lugar = { "en rase campagne", "hors de la cage", "au sommet d'une colline", "sur une route sans panneau", "en pleine mer" },
    coisa = { "une clé", "une chaîne brisée", "une cage ouverte", "un drapeau", "un cerf-volant" },
}
D.saber = {
    gosto = { "de parchemin", "d'encre de plume", "de poussière de bibliothèque", "de craie", "de tisane d'étude" },
    cheiro = { "de bibliothèque", "de parchemin", "de dos de cuir", "d'encre de plume", "de bougie d'étude" },
    comparacao = { "une encyclopédie", "un long cours", "une note de bas de page", "un dictionnaire ouvert", "une bibliothèque entière" },
    exclamacao = { "Sapere aude !", "Élémentaire !", "Quelle érudition !", "Quod erat demonstrandum !" },
    lugar = { "dans une bibliothèque", "dans une université", "dans un cabinet d'étude", "dans un monastère de copistes", "dans une académie" },
    coisa = { "un parchemin", "une loupe", "un encrier", "un dictionnaire", "un globe terrestre" },
}
D.medo = {
    gosto = { "de sueur froide", "de bougie éteinte", "de rouille", "de poussière de crypte", "de toile d'araignée" },
    cheiro = { "de cave", "de moisi", "de bougie éteinte", "de crypte", "de terre humide" },
    comparacao = { "un grincement de porte", "une ombre dans le couloir", "un hurlement", "un pas dans le noir", "un murmure derrière le rideau" },
    exclamacao = { "Au secours !", "Qui est là ?", "Seigneur !", "Ah, un fantôme !" },
    lugar = { "dans une cave obscure", "dans une crypte", "dans un château hanté", "dans un couloir sans lumière", "sous l'escalier" },
    coisa = { "une toile d'araignée", "une clé rouillée", "un chandelier éteint", "un portrait dont les yeux vous suivent", "un cercueil entrouvert" },
}

-- Cause inventée ensuite : la mauvaise humeur gagne un vrai motif (l'événement d'un chapitre récent).
D._causa = {
    eventos = {
        morte = "cette mort", casamento = "ce mariage", viagem = "ce voyage", carta = "cette lettre",
        tempestade = "cette tempête", doenca = "cette fièvre", festa = "cette fête", briga = "cette dispute",
        fuga = "cette fuite", crime = "ce crime",
    },
    jovem = {
        "Je me suis réveillée toute triste. Ça doit être {evento} dans  « {livro} » .",
        "Je suis toute flétrie aujourd'hui. Je crois que c'est {evento} dans  « {livro} » .",
        "Je ne sais pas pourquoi je suis comme ça. Ou plutôt si : {evento} dans  « {livro} » .",
        "Impossible de me l'ôter de la tête : {evento} dans  « {livro} » .",
    },
    velha = {
        "Mauvaise humeur. Ça doit être {evento} dans  « {livro} » . Je ne m'en suis jamais remise.",
        "Réveil aigre. C'est encore {evento} dans  « {livro} » , j'en suis sûre.",
        "Si je suis insupportable, c'est à cause de {evento} dans  « {livro} » .",
        "Ne me demande rien aujourd'hui. C'est encore {evento} dans  « {livro} » .",
    },
}

return D
