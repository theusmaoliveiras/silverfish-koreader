--[[--
Vocabulaire de chaque thème du Chat des Cendres (français). Même format et même ordre que
gato_banco/dominios_pt.lua, avec la convention française de traca_banco/dominios_fr.lua :
  gosto       après "un goût" (inclut "de"/"d'") :  "de cendre froide"
  cheiro      après "une odeur" (inclut "de"/"d'") : "d'encens"
  comparacao  après "comme" :                       "une vague qui se brise"
  exclamacao  phrase entière :                      "Terre en vue !"
  lugar       avec sa préposition :                 "sur le pont"
  coisa       avec son article :                    "une ancre"
Dans le thème politique, aucun mot de politique (VOICE-CAT.md, section 4).
_causa : la mauvaise humeur avec un vrai motif tiré du livre, par stade (filhote, adulto, velho) ;
{evento} vient avec "ce"/"cette", donc jamais après une préposition. Le chat est au masculin.
]]

local D = {}

D.morte = {
    gosto = { "de cendre froide", "de bougie éteinte", "de terre mouillée", "de thé de veillée funèbre", "de papier brûlé" },
    cheiro = { "de bougie consumée", "de chrysanthème", "de terre retournée", "de vieille fumée", "de fleurs d'enterrement" },
    comparacao = { "une cloche au loin", "une bougie en fin de vie", "une lettre que personne n'ouvrira", "une horloge arrêtée", "un nom rayé" },
    exclamacao = { "Qu'il repose en paix !", "Allume une bougie !", "Silence, par respect !", "Garde le nom !" },
    lugar = { "dans un cimetière", "derrière une pierre tombale", "dans une chapelle vide", "à une veillée funèbre", "dans une crypte" },
    coisa = { "une couronne de fleurs", "un voile noir", "une pierre tombale sans nom", "un portrait au ruban noir", "une bougie éteinte" },
}
D.amor = {
    gosto = { "de lettre parfumée", "de miel", "de chocolat", "de fraise", "de thé sucré" },
    cheiro = { "de rose", "de lettre parfumée", "de lavande", "de fleur d'oranger", "de papier de soie" },
    comparacao = { "un billet plié", "une promesse tenue", "un cœur dessiné dans la marge", "une valse", "une lettre cachée dans le foulard" },
    exclamacao = { "Ah, l'amour !", "Que c'est romantique !", "Garde cette lettre !", "Chose promise, chose due !" },
    lugar = { "à un bal", "sous une fenêtre", "dans une roseraie", "sur un balcon", "sur un banc public" },
    coisa = { "une lettre d'amour", "une bague", "une rose séchée", "un mouchoir brodé", "un portrait dans un médaillon" },
}
D.guerra = {
    gosto = { "de poudre", "de rouille", "de fumée", "de boue", "de pain dur" },
    cheiro = { "de poudre", "de fumée", "de cuir de botte", "de boue", "de métal chaud" },
    comparacao = { "un tambour de marche", "une carte déchirée", "un canon au loin", "une tranchée détrempée", "un drapeau tombé" },
    exclamacao = { "À terre !", "Tout le monde à la cave !", "Silence dans la tranchée !", "Feu !" },
    lugar = { "dans une tranchée", "sur le champ de bataille", "derrière une barricade", "dans une caserne", "en première ligne" },
    coisa = { "une médaille", "un casque cabossé", "un drapeau déchiré", "une carte de bataille", "une lettre du front" },
}
D.mar = {
    gosto = { "de sel", "d'embruns", "de poisson séché", "d'algue", "d'eau de coco" },
    cheiro = { "d'air marin", "de corde mouillée", "de goudron", "de poisson", "de bois de navire" },
    comparacao = { "une vague qui se brise", "un phare qui clignote", "un navire à la dérive", "une bouteille à la mer", "une ancre au fond de l'eau" },
    exclamacao = { "Terre en vue !", "Tiens le mât !", "Amenez la voile !", "Bon vent !" },
    lugar = { "sur le pont", "dans la cale du navire", "dans un phare", "sur un quai", "au fond de la mer" },
    coisa = { "une ancre", "une carte au trésor", "une bouteille à la mer", "une boussole", "un filet de pêche" },
}
D.fe = {
    gosto = { "d'hostie", "de vin de messe", "de pain bénit", "d'eau bénite", "de cire de cierge" },
    cheiro = { "d'encens", "de cire de cierge", "de pierre froide d'église", "de parchemin", "de fleurs d'autel" },
    comparacao = { "une cloche d'église", "une prière murmurée", "un vitrail illuminé", "un chapelet entre les doigts", "un cierge sur un autel" },
    exclamacao = { "Dieu me garde !", "Amen !", "Que les livres nous gardent !", "Grâce au ciel !" },
    lugar = { "dans une chapelle", "dans un monastère", "derrière l'autel", "dans une bibliothèque de couvent", "dans un cloître" },
    coisa = { "un chapelet", "un livre de psaumes", "un vitrail", "un cierge votif", "un vieux parchemin" },
}
D.dinheiro = {
    gosto = { "de vieille pièce", "de billet de banque", "d'or", "de cuivre", "d'encre de reçu" },
    cheiro = { "de vieille pièce", "de coffre fermé", "de cuir de portefeuille", "d'encre de banque", "de papier neuf" },
    comparacao = { "un coffre verrouillé", "une pièce qui roule", "un reçu froissé", "un héritage disputé", "un livre de comptes" },
    exclamacao = { "Quelle fortune !", "Suis l'argent !", "Tout ça pour quelques pièces !", "Qui paie l'addition ?" },
    lugar = { "dans une banque", "derrière un coffre", "dans un bureau de comptable", "chez un prêteur sur gages", "à une vente aux enchères" },
    coisa = { "une pièce d'or", "un coffre-fort", "un testament", "un livre de comptes", "un reçu" },
}
D.loucura = {
    gosto = { "de remède amer", "de tisane de camomille", "de craie", "de peinture fraîche", "de rien" },
    cheiro = { "d'éther", "de chambre fermée", "de vieux papier peint", "de médicament", "de bougie à l'aube" },
    comparacao = { "une horloge qui tourne à l'envers", "une porte qui s'ouvre toute seule", "un miroir fêlé", "un écho dans le couloir", "un escalier sans fin" },
    exclamacao = { "Quel délire !", "Revérifie la porte !", "Du calme, du calme !", "Personne n'entend ça ?" },
    lugar = { "dans un grenier verrouillé", "dans un couloir sans fin", "dans une chambre au papier peint jaune", "dans un labyrinthe", "derrière le miroir" },
    coisa = { "un miroir fêlé", "une lettre qui n'a aucun sens", "une clé qui n'ouvre rien", "une horloge sans aiguilles", "un cahier griffonné" },
}
D.tempo = {
    gosto = { "de poussière", "de thé froid", "de papier jauni", "de pain d'hier", "d'encre délavée" },
    cheiro = { "de papier jauni", "de poussière", "d'horloge à remontoir", "de vieille malle", "de grenier" },
    comparacao = { "une horloge à balancier", "un sablier qu'on retourne", "une photo délavée", "une feuille qui tombe", "un calendrier déchiré" },
    exclamacao = { "Comme le temps passe !", "Il est déjà tard !", "Encore un an !", "Tu te souviens ?" },
    lugar = { "dans un grenier", "à l'intérieur d'une horloge", "dans une vieille malle", "dans une gare vide", "dans une maison abandonnée" },
    coisa = { "un sablier", "une montre à gousset", "un vieux calendrier", "une photo ancienne", "une lettre datée" },
}
D.cidade = {
    gosto = { "de suie", "de café du coin", "de pain de boulangerie", "de pluie sur le trottoir", "de fumée de tramway" },
    cheiro = { "de suie", "de café", "de pluie sur l'asphalte", "de bouquiniste", "de pain chaud" },
    comparacao = { "un tramway qui passe", "une fenêtre allumée", "un coin de rue sans nom", "une ruelle sombre", "une foule pressée" },
    exclamacao = { "Attention au tramway !", "Quel vacarme !", "Prudence au coin de la rue !", "Prends le raccourci !" },
    lugar = { "dans une ruelle", "au coin d'une rue", "chez un bouquiniste", "sous un pont", "sur un toit" },
    coisa = { "un ticket de tramway", "un réverbère", "une clé de pension", "un plan de la ville", "un journal d'hier" },
}
D.natureza = {
    gosto = { "de feuille", "de rosée", "de terre", "de mousse", "de pluie" },
    cheiro = { "de terre mouillée", "de pin", "de mousse", "de pluie", "d'herbe coupée" },
    comparacao = { "une rivière qui court", "un vieil arbre", "du vent dans les broussailles", "une feuille qui tombe", "un orage qui arrive" },
    exclamacao = { "Quel ciel !", "Voilà la pluie !", "Écoute le vent !", "Attention aux racines !" },
    lugar = { "au milieu des bois", "sous un arbre", "au bord d'une rivière", "dans une clairière", "dans un terrier" },
    coisa = { "une feuille sèche", "un galet lisse", "une brindille", "un nid vide", "une plume" },
}
D.comida = {
    gosto = { "de pain chaud", "de soupe", "de fromage", "de gâteau de grand-mère", "de thé au miel" },
    cheiro = { "de pain chaud", "de soupe qui mijote", "de cannelle", "de café frais", "de gâteau tout juste sorti du four" },
    comparacao = { "une marmite sur le feu", "une table mise", "une part de gâteau", "un banquet", "une tasse fumante" },
    exclamacao = { "Quel festin !", "Sers-toi !", "Passe le pain !", "Ça sent le repas !" },
    lugar = { "dans une cuisine", "dans un garde-manger", "dans une boulangerie", "sous la table", "dans une auberge" },
    coisa = { "une cuillère en bois", "un pain", "une marmite", "un pot de miel", "une nappe à carreaux" },
}
D.familia = {
    gosto = { "de déjeuner du dimanche", "de gâteau d'anniversaire", "de soupe de grand-mère", "de goûter", "de confiserie maison" },
    cheiro = { "de maison de grand-mère", "de malle de famille", "de vieil album", "de draps propres", "de déjeuner du dimanche" },
    comparacao = { "un album photo", "un arbre généalogique", "un testament lu à voix haute", "une table pleine", "un secret de famille" },
    exclamacao = { "Ah, la famille !", "Tout le monde à table !", "Ça reste entre nous !", "Quel héritage !" },
    lugar = { "dans une maison de famille", "dans la salle à manger", "dans une grande demeure", "dans la chambre du fond", "dans un portrait au mur" },
    coisa = { "un album photo", "une bague de famille", "un testament", "un vieux portrait", "un arbre généalogique" },
}
D.infancia = {
    gosto = { "de bonbon", "de lait tiède", "de biscuit", "de sucette", "de pomme" },
    cheiro = { "de crayon de cire", "de crayon taillé", "de bonbon", "de talc", "de cahier neuf" },
    comparacao = { "une toupie qui tourne", "un ballon qui s'envole", "un cerf-volant dans le ciel", "une partie de cache-cache", "un dessin à la craie" },
    exclamacao = { "Trouvé !", "Touché !", "Encore !", "C'est pas du jeu !" },
    lugar = { "dans une cour", "dans une cabane dans l'arbre", "sous le lit", "dans une cachette d'enfant", "dans une salle de classe" },
    coisa = { "une toupie", "une bille", "un cahier de dessin", "un ours en peluche", "un cerf-volant" },
}
D.politica = {
    gosto = { "de cire à cacheter", "d'encre de parchemin", "de vin de banquet", "de poussière de trône", "de papier à en-tête" },
    cheiro = { "de cire à cacheter", "de salle fermée", "de vieux tapis", "de parchemin", "de bougie de palais" },
    comparacao = { "une couronne de travers", "un trône vide", "un sceau brisé", "un long discours", "un escalier de palais" },
    exclamacao = { "Vive la couronne !", "Silence dans la salle !", "Quel discours !", "Place, place !" },
    lugar = { "dans un palais", "dans une salle du trône", "dans une tour", "sur une place bondée", "dans un couloir de palais" },
    coisa = { "une couronne", "un sceau de cire", "un sceptre", "un parchemin scellé", "un étendard" },
}
D.ciencia = {
    gosto = { "d'alcool", "de craie", "de fer", "de poussière de laboratoire", "d'encre de stylo" },
    cheiro = { "d'alcool", "de fumée d'expérience", "d'ozone", "de papier brûlé", "de métal" },
    comparacao = { "un tube à essai qui bout", "un engrenage qui tourne", "une étoile dans un télescope", "une formule au tableau", "une étincelle" },
    exclamacao = { "Eurêka !", "Ça a marché !", "Attention à l'étincelle !", "Note ça !" },
    lugar = { "dans un laboratoire", "dans un observatoire", "dans un atelier", "derrière une machine", "dans une salle de classe" },
    coisa = { "un tube à essai", "une loupe", "un engrenage", "un télescope", "un cahier de formules" },
}
D.solidao = {
    gosto = { "de thé froid", "de pain pour un seul", "de silence", "de café réchauffé", "de rien" },
    cheiro = { "de chambre vide", "de thé froid", "de poussière", "de fenêtre fermée", "de maison sans personne" },
    comparacao = { "un phare sans navire", "une chaise vide", "une lettre sans réponse", "un écho", "une bougie seule" },
    exclamacao = { "Il y a quelqu'un ?", "Quel silence !", "Reste un peu !", "Personne ?" },
    lugar = { "dans une chambre vide", "dans une maison sans personne", "sur une île", "dans un phare", "sur un banc de gare" },
    coisa = { "une chaise vide", "une lettre sans réponse", "une tasse toute seule", "une clé sans porte", "un portrait retourné" },
}
D.arte = {
    gosto = { "de peinture à l'huile", "de fusain", "de vernis", "d'aquarelle", "de papier à dessin" },
    cheiro = { "de peinture fraîche", "de térébenthine", "de fusain", "de papier à dessin", "de vernis" },
    comparacao = { "un tableau inachevé", "un vers appris par cœur", "une partition", "une statue", "un poème dans la marge" },
    exclamacao = { "Quelle œuvre !", "Bravo !", "Garde ce vers !", "Quelle beauté !" },
    lugar = { "dans un atelier", "dans un musée", "dans un théâtre", "dans une salle de concert", "derrière une toile" },
    coisa = { "un pinceau", "une partition", "un poème", "une toile vierge", "un carnet de croquis" },
}
D.animais = {
    gosto = { "de lait", "de poisson", "d'herbe", "de croquettes", "de fromage" },
    cheiro = { "de poil mouillé", "d'écurie", "de terrier", "de foin", "de poisson" },
    comparacao = { "un loup dans la neige", "un cheval au galop", "un corbeau à la fenêtre", "un chat sur le toit", "une chouette qui monte la garde" },
    exclamacao = { "Miaou !", "Regarde, une bête !", "Psst, la bestiole !", "Maligne, la bête !" },
    lugar = { "dans un terrier", "dans une écurie", "dans un nid", "sur un toit", "dans une grange" },
    coisa = { "une plume", "un collier", "une empreinte de patte", "un nid", "un grelot de chat" },
}
D.noite = {
    gosto = { "de rosée", "de thé de minuit", "d'obscurité", "de lait tiède", "de café froid" },
    cheiro = { "de bougie", "de rosée", "de jasmin de nuit", "de lampe à huile", "de nuit profonde" },
    comparacao = { "une pleine lune", "une lampe allumée", "une chouette qui monte la garde", "une fenêtre allumée dans le noir", "une cloche à minuit" },
    exclamacao = { "Psst !", "Éteins la lumière !", "Minuit !", "Qui est là ?" },
    lugar = { "sous la lune", "sur un toit la nuit", "dans une rue sombre", "dans une cave", "près d'un réverbère" },
    coisa = { "une lampe à huile", "une bougie", "une lanterne", "une chouette de pierre", "une horloge qui sonne minuit" },
}
D.viagem = {
    gosto = { "de poussière de route", "de pain de voyage", "de café de gare", "de fruit cueilli au bord de la route", "d'eau de gourde" },
    cheiro = { "de poussière de route", "de fumée de train", "de valise en cuir", "de gare", "de vieille carte" },
    comparacao = { "un train qui part", "une route sans fin", "une carte pliée", "une valise fermée", "un sifflet au loin" },
    exclamacao = { "On part !", "En voiture !", "Suis la carte !", "Voilà la gare !" },
    lugar = { "dans un train", "dans une gare", "dans une auberge", "au bord de la route", "dans une calèche" },
    coisa = { "une valise", "une carte", "un billet de train", "une boussole", "une gourde" },
}
D.vinganca = {
    gosto = { "de poison", "de fer", "de fiel", "de vin amer", "de cendre" },
    cheiro = { "de poison", "de poudre", "de fumée", "de lame", "de lettre brûlée" },
    comparacao = { "une braise cachée", "une lame qu'on garde", "une vieille dette", "une lettre brûlée", "une mauvaise promesse" },
    exclamacao = { "Ça ne va pas se passer comme ça !", "Je n'oublie pas !", "Attention !", "Cette fois, ça y est !" },
    lugar = { "en plein duel", "derrière un rideau", "dans un couloir sombre", "à un bal masqué", "dans une cellule" },
    coisa = { "un gant jeté", "une dague", "un flacon de poison", "un masque", "une lettre anonyme" },
}
D.liberdade = {
    gosto = { "de grand air", "de vent", "de pain partagé", "d'eau de source", "de pluie" },
    cheiro = { "de vent", "de prairie", "de grand large", "de porte ouverte", "de matin" },
    comparacao = { "une cage ouverte", "un oiseau qui s'envole", "une porte déverrouillée", "une chaîne brisée", "une fenêtre grande ouverte" },
    exclamacao = { "Cours !", "Ouvre la porte !", "Maintenant !", "Libre !" },
    lugar = { "à ciel ouvert", "en rase campagne", "hors de la cage", "en haut d'une colline", "dehors" },
    coisa = { "une clé", "une chaîne brisée", "une cage vide", "une porte ouverte", "une aile" },
}
D.saber = {
    gosto = { "de vieux papier", "d'encre", "de colle de reliure", "de poussière de bibliothèque", "de parchemin" },
    cheiro = { "de vieux papier", "de bibliothèque", "d'encre", "de reliure en cuir", "de poussière d'étagère" },
    comparacao = { "une encyclopédie ouverte", "un index bien fait", "une longue note de bas de page", "une bibliothèque entière", "un dictionnaire usé" },
    exclamacao = { "Vérifie l'index !", "Quelle note de bas de page !", "Noté !", "Ça, je sais !" },
    lugar = { "dans une bibliothèque", "dans des archives", "sur une haute étagère", "chez un bouquiniste", "dans une salle de lecture" },
    coisa = { "un dictionnaire", "un index", "un erratum", "une édition originale", "une encyclopédie" },
}
D.medo = {
    gosto = { "de fumée", "de poussière de cave", "de rouille", "de bougie éteinte", "de frayeur" },
    cheiro = { "de fumée", "de cave fermée", "de moisi", "de cire fondue", "de brûlé" },
    comparacao = { "un pas dans le noir", "une porte qui grince", "une ombre sur le mur", "un murmure dans le couloir", "une bougie qui s'éteint" },
    exclamacao = { "Psst ! Reste près de moi !", "Qui est là ?", "Vérifie la porte !", "Cours !" },
    lugar = { "dans une cave obscure", "derrière le mur", "dans un couloir sans lumière", "sous l'escalier", "dans un grenier" },
    coisa = { "une bougie éteinte", "une clé rouillée", "un portrait qui vous regarde", "une porte verrouillée", "une toile d'araignée" },
}

-- Cause inventée : la mauvaise humeur gagne un vrai motif (l'événement marquant d'un chapitre récent).
D._causa = {
    eventos = {
        morte = "cette mort", casamento = "ce mariage", viagem = "ce voyage", carta = "cette lettre",
        tempestade = "cette tempête", doenca = "cette fièvre", festa = "cette fête", briga = "cette dispute",
        fuga = "cette fuite", crime = "ce crime",
    },
    filhote = {
        "Je me suis réveillé les oreilles basses. Ça doit être {evento} dans « {livro} ».",
        "Envie de rien aujourd'hui. Je crois que c'est {evento} dans « {livro} ».",
        "Je ne sais pas pourquoi je suis comme ça. Ou plutôt si : {evento} dans « {livro} ».",
        "Impossible de me l'ôter de la tête : {evento} dans « {livro} ».",
    },
    adulto = {
        "Mauvaise humeur. Ça doit être {evento} dans « {livro} ». Je suis encore en train de l'archiver.",
        "Réveillé le poil hérissé. C'est {evento} dans « {livro} », j'en suis sûr.",
        "Si je te réponds sèchement aujourd'hui, la faute à {evento} dans « {livro} ».",
        "Ne me demande rien aujourd'hui. C'est encore {evento} dans « {livro} ».",
    },
    velho = {
        "Journée à remonter le foulard jusqu'au nez. C'est {evento} dans « {livro} ».",
        "À mon âge, {evento} dans « {livro} » pèse plus lourd.",
        "Je n'oublie pas {evento} dans « {livro} ». Grand-mère saurait quoi dire.",
        "La cave est froide aujourd'hui. C'est encore {evento} dans « {livro} ».",
    },
}

return D
