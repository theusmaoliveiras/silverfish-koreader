--[[--
Analyse des livres en français (la Mite) : les listes de mots que traca_memoria.lua utilise pour une
page détectée en français. Thèmes, événements, sujets et mots génériques ont leur index à part (les
faux amis « son », « grave », « pain » ne déclenchent rien en français) ; les listes de noms, de titres
et de verbes de parole s'ajoutent aux listes communes.
Tout en minuscules sauf les listes de noms propres (NAO_NOMES, TITULOS, REFERENCIAS, LIEUX…).
]]

local FR = {}

-- Mots-outils pour reconnaître la langue de la page (fréquents en français, rares en PT et en EN).
FR.FUNCIONAL = [[les des une est qui pas dans sur avec il elle du au aux cette sont mais nous vous était
    avait fait leur tout plus même aussi très bien ces sans cela comme lui je]]

-- Thèmes : mêmes clés que M.TEMAS.
FR.TEMAS = {
    morte = { "mort", "morte", "morts", "mortes", "mourir", "mourut", "meurt", "mourait", "tombeau",
              "enterrement", "cadavre", "deuil", "funérailles", "cercueil", "défunt", "défunte", "cimetière" },
    amor = { "amour", "amours", "aimer", "aimait", "aime", "aima", "baiser", "baisers", "passion", "cœur", "coeur",
             "amant", "amante", "amoureux", "amoureuse", "chérie", "chéri", "tendresse", "fiancée", "fiancé", "adorait" },
    guerra = { "guerre", "guerres", "bataille", "soldat", "soldats", "armée", "ennemi", "ennemis", "arme", "armes",
               "fusil", "sang", "guerrier", "guerriers", "combat", "régiment", "canon" },
    mar = { "mer", "navire", "vague", "vagues", "plage", "bateau", "marin", "marins", "océan", "port", "naufrage",
            "rivage", "voile", "capitaine", "flots", "équipage" },
    fe = { "dieu", "dieux", "âme", "foi", "église", "prière", "prier", "péché", "ciel", "enfer", "diable", "sacré",
           "sacrée", "seigneur", "prêtre", "chapelle", "ange" },
    dinheiro = { "argent", "riche", "riches", "pauvre", "pauvres", "dette", "dettes", "banque", "prix",
                 "héritage", "fortune", "francs", "dot", "richesse", "créancier", "salaire", "louis" },
    loucura = { "fou", "folle", "folie", "délire", "rêve", "rêves", "cauchemar", "fièvre", "hallucination", "démence",
                "insensé", "insensée" },
    tempo = { "temps", "horloge", "années", "ans", "mémoire", "souvenir", "souvenirs", "passé", "nostalgie",
              "vieux", "vieille", "pendule", "jadis", "autrefois" },
    cidade = { "ville", "rue", "rues", "place", "boulevard", "café", "foule", "coin", "trottoir", "quartier",
               "faubourg", "fiacre", "tramway" },
    natureza = { "arbre", "arbres", "forêt", "rivière", "fleuve", "pluie", "vent", "fleur", "fleurs", "champ",
                 "champs", "oiseau", "feuilles", "colline", "collines", "prairie", "bois" },
    comida = { "nourriture", "manger", "mangea", "mangeait", "pain", "vin", "dîner", "déjeuner", "souper", "banquet",
               "faim", "cuisine", "soupe", "viande", "fruit", "sucre", "repas" },
    familia = { "famille", "mère", "père", "frère", "sœur", "soeur", "fils", "fille", "filles", "grand-mère",
                "grand-père", "héritier", "parents", "mari", "épouse", "cousin", "cousine", "cousins",
                "maman", "papa", "oncle", "tante" },
    infancia = { "enfance", "enfant", "enfants", "garçon", "fillette", "jouer", "jouet", "jouets", "école",
                 "innocence", "bébé", "gamin", "gamine" },
    politica = { "roi", "reine", "empire", "gouvernement", "révolution", "peuple", "loi", "lois", "trône", "prince",
                 "ministre", "parti", "partis", "politique", "député", "république", "empereur" },
    ciencia = { "science", "sciences", "expérience", "laboratoire", "chimie", "machine", "invention", "électricité",
                "savant", "scientifique", "anatomie", "physique" },
    solidao = { "solitude", "seul", "seule", "isolé", "isolée", "silence", "abandon", "exil", "absence",
                "abandonné", "abandonnée", "solitaire" },
    arte = { "art", "peinture", "poème", "poésie", "artiste", "tableau", "théâtre", "chanson", "peintre",
             "musique", "sculpteur", "opéra" },
    animais = { "cheval", "chevaux", "chien", "chiens", "chat", "chats", "loup", "loups", "serpent", "baleine",
                "rat", "insecte", "oiseaux", "bête", "bêtes", "animal", "animaux" },
    noite = { "nuit", "nuits", "lune", "obscurité", "ténèbres", "étoiles", "minuit", "bougie", "chandelle",
              "lanterne", "crépuscule" },
    viagem = { "voyage", "voyages", "chemin", "train", "voyageur", "horizon", "bagages", "carte", "étranger",
               "partit", "marchait", "route" },
    vinganca = { "vengeance", "venger", "haine", "trahison", "trahit", "trahi", "rancune", "culpabilité",
                 "châtiment", "punition", "vengé" },
    liberdade = { "liberté", "libre", "libres", "prison", "prisonnier", "prisonnière", "esclave", "esclaves",
                  "esclavage", "chaînes", "captivité", "cachot" },
    saber = { "livre", "livres", "lire", "lecture", "bibliothèque", "savoir", "vérité", "connaissance",
              "philosophie", "étude", "études" },
    medo = { "peur", "terreur", "effroi", "épouvante", "monstre", "fantôme", "hanté", "hantée", "cri", "frisson",
             "spectre", "angoisse" },
}

-- Mots trop courants pour faire un thème seuls (il faut un 2e mot du thème sur la page, ou 3+ fois).
FR.GENERICAS = [[temps ans années vieux vieille rue rues foule coin place enfant enfants garçon école nuit lune
    étoiles livre livres lire vérité étude pauvre riche banque prix or argent fortune mère père fils fille frère
    sœur soeur femme mari parents cœur coeur âme ciel dieu seigneur libre sang ennemi mort port plage bateau vague
    fleur fleurs vent rivière champ oiseau arbre dîner déjeuner cuisine vin pain repas roi reine prince peuple loi
    théâtre chanson tableau art rêve rêves fièvre silence seul seule chemin route carte cheval chien bête
    bois café voile]]

-- Événements : mêmes clés que M.EVENTOS.
FR.EVENTOS = {
    morte = { "mourut", "mort", "morte", "enterrement", "enterrèrent", "cercueil", "deuil", "veillée", "funérailles",
              "cadavre", "décéda", "défunt", "enterré" },
    casamento = { "mariage", "mariés", "épousa", "épouser", "fiancée", "fiancé", "autel", "noces", "alliance" },
    viagem = { "partit", "départ", "voyage", "voyagea", "route", "diligence", "voiture", "arriva", "arrivée",
               "embarqua", "partirent", "partir" },
    carta = { "lettre", "lettres", "écrivit", "enveloppe", "billet", "courrier", "cachet" },
    tempestade = { "tempête", "tonnerre", "éclair", "éclairs", "orage", "bourrasque", "ouragan" },
    doenca = { "maladie", "malade", "fièvre", "médecin", "toux", "docteur", "chevet", "agonie" },
    festa = { "fête", "bal", "danse", "dansèrent", "banquet", "musique", "festin", "valse" },
    briga = { "dispute", "disputèrent", "querelle", "cria", "hurla", "insulte", "insulta", "colère" },
    fuga = { "fuit", "fuite", "enfuit", "échappa", "cacha", "poursuite", "fuir", "fuirent", "évasion" },
    crime = { "crime", "meurtre", "assassinat", "tua", "assassin", "vol", "police", "meurtrier", "commissaire" },
}

-- Sujets de chapitre (mêmes clés que traca_banco/assuntos.lua).
FR.ASSUNTOS = {
    pressagio = { "cartes", "tarot", "chance", "destin", "prophétie", "présage", "augure", "voyante",
                  "prédiction", "oracle" },
    antepassados = { "ancêtre", "aïeul", "bisaïeul", "lignée", "généalogie", "descendance", "héritage", "patronyme",
                     "blason", "arbre généalogique" },
    pai = { "père", "papa", "fils", "conseil", "héritier", "paternel", "bénédiction" },
}

-- Ambiance (repli quand il n'y a pas de lexique de sentiment français).
FR.CLIMA_MAIS = [[heureux heureuse joie rire rit sourit sourire beau belle doux douce espoir paix lumière gentil
    tendresse bonheur ravi ravie délicieux charmant gaieté]]
FR.CLIMA_MENOS = [[triste tristesse douleur peur pleura pleurs larmes sombre ombre haine colère souffrance
    désespoir froid angoisse horreur mélancolie malheureux malheureuse chagrin effroi deuil]]

FR.NEGACAO = [[ne pas jamais rien personne aucun aucune sans ni guère plus]]

FR.DETERMINANTES = [[le la les l un une des du au aux ce cet cette ces son sa ses mon ma mes ton ta tes notre
    nos votre vos leur leurs quelque chaque]]

FR.EU = [[je j me m moi mon ma mes]]

FR.PREP_LUGAR = [[en dans]]  -- pas « à » : « dit à Camille »

FR.VERBO_FALA = [[dit disait demanda répondit cria murmura écria reprit ajouta répliqua chuchota souffla
    fit déclara continua lança interrogea balbutia soupira grommela expliqua avoua insista]]

FR.VERBO_PESSOA = [[dit demanda répondit cria murmura regarda sourit rit pleura pensa sentit soupira revint
    sortit entra arriva partit mourut embrassa courut leva assit arrêta vit entendit rappela éveilla
    dormit trembla hésita insista continua prit saisit ouvrit ferma voulait savait aimait haïssait hocha
    fronça tourna marcha resta répondait regardait souriait pensait]]

FR.NAO_NOMES = [[Il Elle Ils Elles Je Tu Nous Vous On Le La Les Un Une Des Du Au Aux Mais Et Ou Donc Puis Alors
    Quand Comme Si Oui Non Ce Cet Cette Ces Mon Ma Mes Ton Ta Tes Son Sa Ses Notre Nos Votre Vos Leur Leurs
    Qui Que Quoi Où Pourquoi Comment Rien Tout Tous Toute Toutes Personne Chacun Aucun Jamais Toujours Encore
    Déjà Ici Là Voilà Voici Aujourd Hier Demain Maintenant Ensuite Enfin Pourtant Cependant Ainsi Peut Après
    Avant Depuis Pendant Pour Par Avec Sans Sous Sur Dans Chez Entre Vers Contre Seigneur Dieu Madame Monsieur
    Mademoiselle Messieurs Mesdames Chapitre Partie Livre Tome Rue Place Boulevard Avenue Quai Saint Sainte
    Roi Reine Prince Princesse Comte Comtesse Duc Duchesse Baron Baronne Marquis Marquise Vicomte Docteur
    Abbé Père Mère Sœur Frère Oncle Tante Maître Capitaine Colonel Général Lieutenant Sergent Commissaire
    Inspecteur Professeur Majesté Altesse Excellence Monseigneur Janvier Février Mars Avril Mai Juin Juillet
    Août Septembre Octobre Novembre Décembre Lundi Mardi Mercredi Jeudi Vendredi Samedi Dimanche Noël Pâques
    Était Avait Fut Est Sont Ah Oh Eh Hélas Dès Aussi Fichtre Puisque Lorsque Tandis Parfois Soudain Bref Certes Peut-être Sauf Selon Malgré Durant Afin Quelques Quelque Certains Plusieurs Allons Allez Voyons Merci Pardon Adieu Bonjour Bonsoir Tiens Assez Non Oui Bon Bien Mal Très Trop Peu Plus Moins Grand Grande Petit Petite
    Nouveau Nouvelle Vieux Vieille Premier Première Second Seconde Dernier Dernière Nord Sud Est Ouest
    Français Française Anglais Anglaise Allemand Allemande Espagnol Italien Russe Américain Américaine
    Empire République Royaume État Église Université Académie Guerre Révolution Paradis Enfer Ciel Fin]]

FR.PAPEL_TEATRO = [[Roi Reine Prince Princesse Duc Comte Spectre Nourrice Valet Servante Docteur Capitaine
    Messager Bouffon Moine]]

FR.ABREVIACAO = [[M MM Mme Mmes Mlle Mlles Dr Pr St Ste Me Mgr]]

-- (pas « fort », « place », « ferme », « port », « passage » : « plus fort Dudley », « à la place de Camille »)
FR.ANTES_LUGAR = [[rue boulevard avenue quai fleuve rivière mont montagne lac île quartier village ville château
    vallée baie golfe pont faubourg impasse allée saint sainte]]

FR.TITULOS = [[M Mme Mlle MM Me Mgr Monsieur Madame Mademoiselle Maître Abbé Père Mère Docteur Capitaine
    Colonel Général Comte Comtesse Baron Baronne Duc Duchesse Marquis Marquise Vicomte Vicomtesse Oncle Tante
    Sœur Frère Monseigneur Commissaire Inspecteur Professeur Lieutenant Sergent]]

FR.REFERENCIAS = [[Hugo Molière Racine Corneille Pascal Montesquieu Diderot Stendhal Maupassant Chateaubriand
    Lamartine Musset Verlaine Mallarmé Apollinaire Sartre Camus Beauvoir Gide Colette Duras Céline Rabelais
    Ronsard Villon Sand Dumas Verne Platon Aristote Socrate Napoléon Jésus Christ Bouddha Moïse Bible Coran
    Vénus Jupiter Apollon Ulysse Œdipe Prométhée Narcisse Satan Lucifer Charlemagne Jeanne Robespierre]]

FR.LUGARES_CONHECIDOS = [[France Angleterre Écosse Irlande Espagne Italie Allemagne Prusse Autriche Suisse
    Hollande Belgique Russie Pologne Grèce Turquie Égypte Inde Chine Japon Mexique Amérique Europe Afrique
    Asie Londres Paris Rome Lisbonne Madrid Berlin Vienne Moscou Venise Florence Naples Genève Bruxelles
    Marseille Lyon Bordeaux Toulouse Strasbourg Nantes Lille Rouen Normandie Bretagne Provence Bourgogne
    Alsace Lorraine Champagne Auvergne Savoie Corse Méditerranée Atlantique Pacifique Seine Loire Rhône Rhin
    Garonne Nil Danube Alpes Pyrénées Vosges Jura Sibérie Sahara Algérie Maroc Tunisie Québec Canada Versailles
    Montmartre Mulhouse Colmar]]

-- Expressions figées (motifs Lua, en minuscules) qui fausseraient le compte.
FR.EXPRESSOES = {
    "mort[es]* de rire", "mort[es]* de fatigue", "mort[es]* de faim", "mort[es]* de honte", "mour%a* de peur",
    "mon dieu", "dieu merci", "grâce à dieu", "nom de dieu", "bon dieu", "de temps en temps", "tout le temps",
    "en même temps", "il fait beau temps", "guerre froide", "cœur d'or", "coeur d'or", "mer à boire",
    "à la folie", "par cœur", "par coeur",
}

-- Thèmes avec leur article, pour « la mort », « de la mort », « à la mort », « par la mort ».
FR.TEMA_INFO = {
    morte = { "la", "mort" }, amor = { "l'", "amour" }, guerra = { "la", "guerre" }, mar = { "la", "mer" },
    fe = { nil, "Dieu" }, dinheiro = { "l'", "argent" }, loucura = { "la", "folie" }, tempo = { "le", "temps" },
    cidade = { "la", "ville" }, natureza = { "la", "nature" },
    comida = { "la", "nourriture" }, familia = { "la", "famille" }, infancia = { "l'", "enfance" },
    politica = { "la", "politique" }, ciencia = { "la", "science" }, solidao = { "la", "solitude" },
    arte = { "l'", "art" }, animais = { "les", "bêtes" }, noite = { "la", "nuit" }, viagem = { "le", "voyage" },
    vinganca = { "la", "vengeance" }, liberdade = { "la", "liberté" }, saber = { "le", "savoir" },
    medo = { "la", "peur" },
}

return FR
