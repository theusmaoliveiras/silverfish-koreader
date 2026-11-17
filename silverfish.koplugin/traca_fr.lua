--[[--
Silverfish : textes français de l'interface et des répliques de la Mite.

ui      phrase portugaise (la clé de Lingua.t) -> traduction française.
estado  les mêmes listes que traca_estado.lua, en français (même structure).
contexto  les mêmes clés que traca_contexto.lua.

Pas de traduction littérale : la blague passe avant la fidélité.
]]

local FR = {}

FR.ui = {
    ["%s · %s letras comidas"] = "%s · %s lettres mangées",
    -- plugin, menus et avis
    ["Traça"] = "La Mite",
    ["Traça: ver o bichinho"] = "La Mite : voir la petite bête",
    ["Sua traça. Funciona sem internet."] = "Ta mite. Fonctionne sans internet.",
    ["A Traça virou %s!"] = "La Mite est devenue %s !",
    ["A Traça saiu da lombada. Com fome, claro."] = "La Mite est sortie de la reliure. Affamée, évidemment.",
    ["Nasci do ovo da geração %d.%s"] = "Je suis née de l'œuf de la génération %d.%s",
    [" Tenho uma obsessão herdada: %s. Nunca pedi por isso."] = " J'ai une obsession héritée : %s. Je n'ai rien demandé.",
    ["A Traça da geração %d leu tudo o que podia e deixou um ovo.\n\n“%s”\n\nVeja em ARQUIVO → LINHAGEM."] =
        "La Mite de la génération %d a lu tout ce qu'elle pouvait et a laissé un œuf.\n\n« %s »\n\nÀ voir dans ARCHIVES → LIGNÉE.",
    ["Idioma da Traça"] = "Langue de la Mite",
    ["Idioma…"] = "Langue…",
    ["Automático (idioma do KOReader)"] = "Automatique (langue de KOReader)",

    -- phases
    ["ovo"] = "œuf", ["ninfa"] = "nymphe", ["jovem"] = "jeune", ["adulta"] = "adulte", ["anciã"] = "ancienne",
    ["O ovo rachou! Nasceu uma ninfa. Ela já parece preocupada."] = "L'œuf s'est fissuré ! Une nymphe est née. Elle a déjà l'air inquiète.",
    ["A Traça trocou de pele e cresceu. Continua nervosa."] = "La Mite a mué et grandi. Toujours nerveuse.",
    ["A Traça virou adulta. Leu o suficiente para ficar desconfiada do mundo."] =
        "La Mite est devenue adulte. Elle a assez lu pour se méfier du monde.",
    ["A Traça virou anciã. Sabe demais. Carrega o peso de todos os livros."] =
        "La Mite est devenue ancienne. Elle en sait trop. Elle porte le poids de tous les livres.",

    -- ventre et humeur
    ["CHEIA"] = "PLEINE", ["SATISFEITA"] = "RASSASIÉE", ["BELISCANDO"] = "GRIGNOTE", ["COM FOME"] = "A FAIM", ["FAMINTA"] = "AFFAMÉE",
    ["CHOCANDO"] = "COUVE",
    ["ANIMADINHA"] = "ENJOUÉE", ["TRANQUILA"] = "TRANQUILLE", ["ANSIOSA"] = "ANXIEUSE", ["APAVORADA"] = "TERRORISÉE",
    ["QUASE CONTENTE"] = "PRESQUE CONTENTE", ["CONFORMADA"] = "RÉSIGNÉE", ["RANZINZA"] = "GRINCHEUSE", ["INSUPORTÁVEL"] = "INSUPPORTABLE",

    -- succès
    ["PRIMEIRA MORDIDA"] = "PREMIÈRE BOUCHÉE", ["COMEU A 1ª PÁGINA"] = "A MANGÉ LA 1RE PAGE",
    ["CEM PÁGINAS"] = "CENT PAGES", ["100 PÁGINAS COMIDAS"] = "100 PAGES MANGÉES",
    ["MIL PÁGINAS"] = "MILLE PAGES", ["1.000 PÁGINAS COMIDAS"] = "1 000 PAGES MANGÉES",
    ["CINCO MIL"] = "CINQ MILLE", ["5.000 PÁGINAS COMIDAS"] = "5 000 PAGES MANGÉES",
    ["DEZ MIL"] = "DIX MILLE", ["10.000 PÁGINAS COMIDAS"] = "10 000 PAGES MANGÉES",
    ["NASCEU"] = "ÉCLOSION", ["SAIU DO OVO"] = "SORTIE DE L'ŒUF",
    ["PRIMEIRA MUDA"] = "PREMIÈRE MUE", ["VIROU JOVEM"] = "DEVENUE JEUNE",
    ["ADULTA"] = "ADULTE", ["LEU O BASTANTE PARA DESCONFIAR"] = "A ASSEZ LU POUR SE MÉFIER",
    ["ANCIÃ"] = "ANCIENNE", ["SABE DEMAIS"] = "EN SAIT TROP",
    ["PRIMEIRO LIVRO"] = "PREMIER LIVRE", ["TERMINOU 1 LIVRO"] = "1 LIVRE TERMINÉ",
    ["ESTANTE"] = "ÉTAGÈRE", ["TERMINOU 5 LIVROS"] = "5 LIVRES TERMINÉS",
    ["PRATELEIRA CHEIA"] = "RAYON PLEIN", ["TERMINOU 10 LIVROS"] = "10 LIVRES TERMINÉS",
    ["BIBLIÓFAGA"] = "BIBLIOPHAGE", ["TERMINOU 25 LIVROS"] = "25 LIVRES TERMINÉS",
    ["BIBLIOTECA"] = "BIBLIOTHÈQUE", ["TERMINOU 50 LIVROS"] = "50 LIVRES TERMINÉS",
    ["MARATONA"] = "MARATHON", ["50 PÁGINAS NUM DIA"] = "50 PAGES EN UN JOUR",
    ["MADRUGADA"] = "NUIT BLANCHE", ["LEU DEPOIS DAS 2H"] = "A LU APRÈS 2 H",
    ["OBSESSÃO"] = "OBSESSION", ["UM TEMA TOMOU CONTA"] = "UN THÈME A TOUT ENVAHI",
    ["DIVIDIDA"] = "DIVISÉE", ["DOIS TEMAS OPOSTOS"] = "DEUX THÈMES OPPOSÉS",
    ["COLECIONADORA"] = "COLLECTIONNEUSE", ["50 SUBLINHADOS"] = "50 SOULIGNÉS",
    ["LINHAGEM"] = "LIGNÉE", ["UMA GERAÇÃO COMPLETA"] = "UNE GÉNÉRATION COMPLÈTE",

    -- écran principal et archives
    ["TRAÇA"] = "LA MITE", ["ARQUIVO"] = "ARCHIVES",
    ["A CRIATURA"] = "LA CRÉATURE",
    ["CADERNO"] = "CARNET", ["SEUS SUBLINHADOS"] = "TES SOULIGNÉS",
    ["DIÁRIO"] = "JOURNAL", ["MEMÓRIAS DELA"] = "SES SOUVENIRS",
    ["CONQUISTAS"] = "SUCCÈS", ["MARCOS E LIVROS LIDOS"] = "JALONS ET LIVRES LUS",
    ["AS TRAÇAS QUE VIERAM ANTES"] = "LES MITES D'AVANT",
    ["PERCEPÇÃO"] = "PERCEPTION",
    ["Nenhum sublinhado. Ou você não lê, ou não sente nada. Segure o dedo numa frase do livro e destaque."] =
        "Aucun passage souligné. Soit tu ne lis pas, soit tu ne ressens rien. Maintiens le doigt sur une phrase du livre et surligne-la.",
    ["SUBLINHADO"] = "SOULIGNÉ", ["SUBLINHADOS"] = "SOULIGNÉS",
    ["< LIVROS"] = "< LIVRES",
    ["JAN FEV MAR ABR MAI JUN JUL AGO SET OUT NOV DEZ"] = "JAN FÉV MAR AVR MAI JUN JUL AOÛ SEP OCT NOV DÉC",
    ["DIVIDIDA ENTRE %s E %s"] = "DIVISÉE ENTRE %s ET %s",
    ["OBCECADA %s"] = "OBSÉDÉE %s",
    ["AINDA SEM OPINIÕES. LEIA MAIS."] = "PAS ENCORE D'AVIS. LIS-EN PLUS.",
    ["Meu diário está vazio. Como a sua estante."] = "Mon journal est vide. Comme ton étagère.",
    ["BARRIGA"] = "VENTRE", ["%s · %d PÁG. HOJE"] = "%s · %d P. AUJ.", ["HUMOR"] = "HUMEUR",
    ["%s PÁG. COMIDAS"] = "%s PAGES MANGÉES", ["%s PÁG. COMIDA"] = "%s PAGE MANGÉE",
    ["GER. %d"] = "GÉN. %d",
    ["OVO"] = "ŒUF", ["NINFA"] = "NYMPHE", ["JOVEM"] = "JEUNE", ["ANCIÃ"] = "ANCIENNE",
    ["O OVO"] = "L'ŒUF", ["NASCER"] = "ÉCLORE", ["PÁG. PARA"] = "PAGE POUR", ["PÁGS. PARA"] = "PAGES POUR",
    ["LIVROS TERMINADOS"] = "LIVRES TERMINÉS", ["PÁGINAS COMIDAS"] = "PAGES MANGÉES", ["DIAS LENDO"] = "JOURS DE LECTURE",
    ["LIVRO"] = "LIVRE", ["LIVROS"] = "LIVRES",
    ["GERAÇÃO %d · VIVA"] = "GÉNÉRATION %d · EN VIE", ["DESDE "] = "DEPUIS ", ["%s PÁG. · %s"] = "%s P. · %s",
    ["HERDOU: "] = "A HÉRITÉ : ", ["GERAÇÃO %d"] = "GÉNÉRATION %d", ["%s PÁG. · %d LIVROS"] = "%s P. · %d LIVRES",
    ["Sou a primeira. Ainda. Um dia eu deixo um ovo e vocês me esquecem."] =
        "Je suis la première. Pour l'instant. Un jour je laisserai un œuf et vous m'oublierez.",
    ["< LINHAGEM"] = "< LIGNÉE", ["%s PÁGINAS · %d LIVROS"] = "%s PAGES · %d LIVRES",
    [" · última palavra: “"] = " · dernier mot : « ", ["CITAÇÃO FAVORITA"] = "CITATION FAVORITE",
    ["ÚLTIMAS MEMÓRIAS"] = "DERNIERS SOUVENIRS", ["Últimas palavras: “"] = "Derniers mots : « ",
    ["LIVROS DA GERAÇÃO %d"] = "LIVRES DE LA GÉNÉRATION %d",

    -- panneau dev
    ["Ainda não percebi nada. Leia umas páginas com esta versão."] = "Je n'ai encore rien remarqué. Lis quelques pages avec cette version.",
    ["LIVRO: "] = "LIVRE : ", ["PERSONAGENS (VEZES · FALAS · CAPÍTULOS)"] = "PERSONNAGES (FOIS · RÉPLIQUES · CHAPITRES)",
    ["LUGARES: "] = "LIEUX : ", ["TEMAS: "] = "THÈMES : ",
    ["ÚLTIMOS CAPÍTULOS (PÁG · CLIMA · EVENTOS)"] = "DERNIERS CHAPITRES (PAGE · AMBIANCE · ÉVÉNEMENTS)",
    ["ÚLTIMO COMENTÁRIO DE CAPÍTULO: "] = "DERNIER COMMENTAIRE DE CHAPITRE : ", [" (JÁ DITO)"] = " (DÉJÀ DIT)",
    ["MORTE"] = "MORT", ["CASAMENTO"] = "MARIAGE", ["VIAGEM"] = "VOYAGE", ["CARTA"] = "LETTRE",
    ["TEMPESTADE"] = "TEMPÊTE", ["DOENÇA"] = "MALADIE", ["FESTA"] = "FÊTE", ["BRIGA"] = "DISPUTE", ["FUGA"] = "FUITE",
    ["CRIME"] = "CRIME",

    -- touchers et menus
    ["Hm. Tá. Pode continuar."] = "Hm. Bon. Tu peux continuer.",
    ["(escondida na lombada; leia uma página para ela sair)"] = "(cachée dans la reliure ; lis une page pour la faire sortir)",
    ["Já chega de carinho por agora."] = "Assez de câlins pour l'instant.",

    ["Tela de descanso: ligada"] = "Écran de veille : activé", ["Tela de descanso: desligada"] = "Écran de veille : désactivé",
    ["Modo dev…"] = "Mode dev…", ["TRAÇA · MODO DEV"] = "LA MITE · MODE DEV",
    ["Faminta"] = "Affamée", ["Ranzinza"] = "Grincheuse", ["Feliz"] = "Heureuse",
    ["Noite: ligada"] = "Nuit : activée", ["Noite: desligada"] = "Nuit : désactivée",
    ["Sair da lombada"] = "Sortir de la reliure", ["Esconder na lombada"] = "Cacher dans la reliure",
    ["O que ela percebeu"] = "Ce qu'elle a remarqué", ["Fim do ciclo (teste)"] = "Fin du cycle (test)",
    ["Ver boas-vindas"] = "Voir l'accueil",
    ["Simulação de endgame"] = "Simulation de fin de partie", ["Voltar ao estado real"] = "Revenir à l'état réel",
    ["Nenhuma simulação em koreader/traca/simulacao.lua."] = "Aucune simulation dans koreader/traca/simulacao.lua.",
    ["SIMULAÇÃO"] = "SIMULATION",
    ["A Traça teve um problema e vai ficar quieta até você reiniciar o KOReader. Sua leitura não foi afetada."] =
        "La Mite a eu un problème et restera tranquille jusqu'au redémarrage de KOReader. Ta lecture n'est pas affectée.",
    ["A Traça tropeçou. Toque para fechar."] = "La Mite a trébuché. Touche pour fermer.",
    ["Falha de teste: ligada"] = "Panne de test : activée", ["Falha de teste: desligada"] = "Panne de test : désactivée", ["Sair do teste (volta ao normal)"] = "Quitter le test (retour à la normale)",
    ["Exportar telas (PNG)"] = "Exporter les écrans (PNG)", ["%d telas salvas em %s"] = "%d écrans enregistrés dans %s",
    ["Exportar todas as simulações"] = "Exporter toutes les simulations",
    ["Exportando as simulações de koreader/traca/simulacoes…"] = "Export des simulations de koreader/traca/simulacoes…",
    ["%d simulações, %d telas salvas em koreader/traca/demo"] = "%d simulations, %d écrans enregistrés dans koreader/traca/demo",

    -- accueil
    ["(algo tremeu dentro do ovo…)"] = "(quelque chose a tremblé dans l'œuf…)",
    ["CHOCAR"] = "COUVER", ["CONTINUAR"] = "CONTINUER", ["PRONTO"] = "TERMINÉ",
    ["(o ovo rachou… ela só sai quando você ler as primeiras páginas)"] =
        "(l'œuf s'est fissuré… elle ne sortira que quand tu auras lu les premières pages)",
    ["(de dentro do ovo:) Onde você vai me achar? Escolha. Eu espero. Mal."] =
        "(de l'intérieur de l'œuf :) Où vas-tu me retrouver ? Choisis. J'attends. Mal.",
    ["ABRIR AO INICIAR"] = "OUVRIR AU DÉMARRAGE", ["A TRAÇA APARECE QUANDO O KOREADER ABRE"] = "LA MITE APPARAÎT À L'OUVERTURE DE KOREADER",
    ["ATALHO POR GESTO"] = "RACCOURCI PAR GESTE", ["SEGURE O DEDO NO CANTO SUPERIOR DIREITO"] = "MAINTIENS LE DOIGT EN HAUT À DROITE",
    ["CARTÃO NA HOME"] = "CARTE SUR L'ACCUEIL", ["NA TELA INICIAL DO SIMPLE UI"] = "SUR L'ÉCRAN D'ACCUEIL DE SIMPLE UI",
    ["SIMPLE UI NÃO INSTALADO"] = "SIMPLE UI NON INSTALLÉ",

    -- traits
    ["AMARGA"] = "AMÈRE", ["OTIMISTA"] = "OPTIMISTE", ["MEDROSA"] = "PEUREUSE", ["CORAJOSA"] = "COURAGEUSE",
    ["CÍNICA"] = "CYNIQUE", ["ROMÂNTICA"] = "ROMANTIQUE", ["POPULAR"] = "POPULAIRE", ["ERUDITA"] = "ÉRUDITE",
    ["DIURNA"] = "DIURNE", ["NOTURNA"] = "NOCTURNE", ["JEITO"] = "NATURE", ["esse livro"] = "ce livre",
    ["TRAÇOS: "] = "TRAITS : ", ["CITADOS: "] = "CITÉS : ", ["NARRADOR: "] = "NARRATEUR : ",
    ["PRIMEIRA PESSOA"] = "PREMIÈRE PERSONNE", ["TERCEIRA PESSOA"] = "TROISIÈME PERSONNE", ["MULHER"] = "FEMME", ["HOMEM"] = "HOMME",

    -- journal (écrit par la mémoire)
    ["Comecei a roer “%s”. A capa prometia muito. Capas sempre prometem."] =
        "J'ai commencé à ronger « %s ». La couverture promettait beaucoup. Les couvertures promettent toujours.",
    ["Antes eu pensava %s. Agora só penso %s. Culpa sua e dos seus livros."] =
        "Avant, je pensais %s. Maintenant je pense %s, et rien d'autre. C'est ta faute et celle de tes livres.",
    ["Percebi que penso muito %s. Não pedi por isso."] = "J'ai remarqué que je pense beaucoup %s. Je n'ai rien demandé.",
    ["Uma parte de mim pensa %s. A outra leu demais sobre %s."] = "Une part de moi pense %s. L'autre en a trop lu sur %s.",
    -- 2.0.0 : plusieurs espèces, la couvée, le Chat des Cendres
    ["A Traça da geração %d leu tudo o que podia e deixou um ovo.\n\n“%s”\n\nVeja a LINHAGEM no menu."] =
        "La Mite de la génération %d a lu tout ce qu'elle pouvait et a laissé un œuf.\n\n« %s »\n\nVa voir la LIGNÉE dans le menu.",
    ["COMENDO AGORA"] = "AU MENU", ["OVO DE TRAÇA"] = "ŒUF DE MITE",
    ["Uma soneca entre duas páginas. A minha preferida."] = "Une sieste entre deux pages. Ma préférée.",
    ["Quem acordar: as margens são minhas."] = "Avis à qui se réveille : les marges sont à moi.",
    ["Sem fome enquanto eu durmo. Só sonho com papel."] = "Pas de faim quand je dors. Je rêve juste de papier.",
    ["(de dentro do ovo:) E eu vou me chamar como? Capricha."] = "(de l'intérieur de l'œuf :) Et je vais m'appeler comment ? Fais un effort.",

    -- le Chat des Cendres : stades et avis
    ["filhote"] = "chaton", ["adulto"] = "adulte", ["velho"] = "vieux",
    ["FILHOTE"] = "CHATON", ["ADULTO"] = "ADULTE", ["VELHO"] = "VIEUX",
    ["O ovo rachou! Saiu um filhote, e a primeira coisa que fez foi conferir as saídas."] =
        "L'œuf s'est fissuré ! Un chaton en est sorti, et la première chose qu'il a faite, c'est repérer les sorties.",
    ["O filhote cresceu. Agora pergunta menos e confere mais a porta."] =
        "Le chaton a grandi. Il pose moins de questions et vérifie plus souvent la porte.",
    ["Chegou a vez do gato de ensinar as Regras, não só de seguir."] =
        "Au tour du chat d'enseigner les Règles, plus seulement de les suivre.",
    ["Saiu do esconderijo. Conferiu as saídas duas vezes antes de dar oi."] =
        "Il est sorti de sa cachette. Il a vérifié les sorties deux fois avant de dire bonjour.",
    ["O gato da geração %d desceu ao porão uma última vez, para deixar as páginas onde as próximas gerações vão procurar.\n\n“%s”\n\nVeja a LINHAGEM no menu."] =
        "Le chat de la génération %d est descendu à la cave une dernière fois, pour laisser ses pages là où les prochaines générations chercheront.\n\n« %s »\n\nVa voir la LIGNÉE dans le menu.",

    -- le Chat des Cendres : écrans
    ["GATO-DAS-CINZAS"] = "CHAT DES CENDRES", ["ESTOQUE"] = "RÉSERVE",
    ["%s PÁG. ARQUIVADAS"] = "%s PAGES ARCHIVÉES", ["PÁGINAS ARQUIVADAS"] = "PAGES ARCHIVÉES",
    ["OS GATOS QUE VIERAM ANTES"] = "LES CHATS D'AVANT", ["NOTAS DO PORÃO"] = "NOTES DE LA CAVE",
    ["OBSESSÃO %s"] = "OBSÉDÉ %s", ["PASSAR ADIANTE"] = "PASSER LE RELAIS",
    ["GUARDANDO AGORA"] = "SOUS SA GARDE", ["OVO DE GATO"] = "ŒUF DE CHAT",
    ["GERAÇÃO %d · EM VIDA"] = "GÉNÉRATION %d · EN VIE",
    ["Árvore vazia. Ótimo. Menos nomes pra acharem."] = "Arbre vide. Tant mieux : moins de noms à trouver pour eux.",
    ["(de dentro do ovo:) Psst. Tá seguro aí fora?"] = "(de l'intérieur de l'œuf :) Psst. La voie est libre, dehors ?",
    ["Durmo com um olho aberto. O bom."] = "Je dors d'un œil. Le bon.",
    ["Você guarda o resto do livro, cúmplice. Como sempre."] = "Tu gardes la suite du livre, complice. Comme toujours.",
    ["Regra 14: se alguém me viu entrar, não fui eu que saí."] = "Règle 14 : si quelqu'un m'a vu entrer, ce n'est pas moi qui suis sorti.",
    ["Regra 13: ensina uma frase a um filhote. Eu ensinei."] = "Règle 13 : apprends une phrase à un chaton. Moi, je l'ai fait.",
    ["Fecha a porta devagar. Eles ainda escutam."] = "Ferme la porte doucement. Ils écoutent encore.",
    ["O lenço é seu agora. Não deixa ninguém tocar."] = "Le foulard est à toi maintenant. Ne laisse personne y toucher.",
    ["Quem destrói um bom livro mata a própria razão. Milton sabia."] = "Qui détruit un bon livre tue la raison même. Milton le savait.",

    -- le Chat des Cendres : succès
    ["DAS CINZAS"] = "DES CENDRES", ["TIROU A 1ª PÁGINA DAS CINZAS"] = "A TIRÉ LA 1RE PAGE DES CENDRES",
    ["100 PÁGINAS ARQUIVADAS"] = "100 PAGES ARCHIVÉES", ["1.000 PÁGINAS ARQUIVADAS"] = "1 000 PAGES ARCHIVÉES",
    ["5.000 PÁGINAS ARQUIVADAS"] = "5 000 PAGES ARCHIVÉES", ["10.000 PÁGINAS ARQUIVADAS"] = "10 000 PAGES ARCHIVÉES",
    ["EM CAMPO"] = "SUR LE TERRAIN", ["SABE AS REGRAS DE COR"] = "CONNAÎT LES RÈGLES PAR CŒUR",
    ["ENSINA AS REGRAS"] = "ENSEIGNE LES RÈGLES", ["ARQUIVO VIVO"] = "ARCHIVE VIVANTE",
    ["JOGO DUPLO"] = "DOUBLE JEU", ["NOTAS NA MARGEM"] = "NOTES EN MARGE",

    -- le Chat des Cendres : réserve et humeur
    ["TUDO A SALVO"] = "TOUT À L'ABRI", ["O SUFICIENTE"] = "ASSEZ", ["RESTAM POUCAS"] = "PRESQUE À SEC",
    ["NADA DE NOVO"] = "RIEN DE NEUF", ["NADA A GUARDAR"] = "RIEN À GARDER",
    ["NAS CINZAS"] = "SOUS LA CENDRE",
    ["COM ORGULHO"] = "FIER", ["DE VIGIA"] = "AUX AGUETS", ["OUVINDO COISAS"] = "ENTEND DES BRUITS", ["COM MEDO"] = "APEURÉ",
    ["TUDO LIMPO"] = "TOUT EST CALME", ["EM SERVIÇO"] = "EN FACTION", ["DESCONFIANDO"] = "MÉFIANT", ["ROSNANDO"] = "GRONDE",
    ["EM PAZ"] = "EN PAIX", ["DE VIGÍLIA"] = "VEILLE ENCORE", ["OSSOS VELHOS"] = "VIEUX OS",

    -- la couvée
    ["NINHADA"] = "COUVÉE", ["O BANDO TODO"] = "TOUTE LA BANDE", ["O BANDO"] = "LA BANDE",
    ["NA ATIVA"] = "EN SERVICE", ["LENDO"] = "EN LECTURE", ["DIA"] = "JOUR", ["DIAS"] = "JOURS",
    ["GERAÇÃO"] = "GÉNÉRATION", ["EM SEGREDO"] = "SECRET", ["PRONTO!"] = "PRÊT !",
    ["Chocar este ovo?\n%s vai dormir com o tempo parado: sem fome e sem envelhecer."] =
        "Couver cet œuf ?\n%s va dormir, le temps figé : pas de faim, pas de vieillesse.",
    ["Acordar %s?\n%s vai dormir com o tempo parado: sem fome e sem envelhecer."] =
        "Réveiller %s ?\n%s va dormir, le temps figé : pas de faim, pas de vieillesse.",
    ["Chocar"] = "Couver", ["Acordar"] = "Réveiller", ["Cancelar"] = "Annuler", ["Agora não"] = "Pas maintenant",
    ["Acordar a Traça (teste)"] = "Réveiller la Mite (test)", ["Acordar o gato (teste)"] = "Réveiller le chat (test)",

    -- le nom
    ["Como vai se chamar?"] = "Comment va-t-on l'appeler ?", ["Nome"] = "Nom", ["Nome…"] = "Nom…",
    ["Sortear"] = "Au hasard", ["Pronto"] = "Valider",
    ["Até %d caracteres"] = "Jusqu'à %d caractères", ["Use até %d caracteres."] = "%d caractères au maximum.",
    ["Use só letras, números, espaços e hífen."] = "Uniquement des lettres, des chiffres, des espaces et des tirets.",
    ["DIGITE UM NOME"] = "TAPE UN NOM",

    -- menu et accueil
    ["Abrir ao iniciar: ligado"] = "Ouvrir au démarrage : activé", ["Abrir ao iniciar: desligado"] = "Ouvrir au démarrage : désactivé",
    ["Atalho por gesto: ligado"] = "Raccourci par geste : activé", ["Atalho por gesto: desligado"] = "Raccourci par geste : désactivé",
    ["NA PRATELEIRA INICIAL DO BOOKSHELF"] = "SUR L'ÉTAGÈRE D'ACCUEIL DE BOOKSHELF",
    ["NO SIMPLE UI E NA PRATELEIRA DO BOOKSHELF"] = "SUR SIMPLE UI ET L'ÉTAGÈRE DE BOOKSHELF",
    ["PRECISA DO SIMPLE UI OU DO BOOKSHELF 6.1"] = "IL FAUT SIMPLE UI OU BOOKSHELF 6.1",
}

-- Répliques du quotidien (même structure que traca_estado.lua) ------------------------------
FR.estado = {}

FR.estado.ULTIMAS = {
    "J'ai lu tout ce que je pouvais. Le reste, c'est à toi, l'œuf.",
    "Je laisse un œuf et une opinion. Les deux vont donner du travail.",
    "Ferme la couverture doucement. J'ai toujours détesté le bruit.",
    "Ne pleure pas. Lis. C'est la même chose, avec plus de papier.",
    "Une vie de colle et de phrases. Ça aurait pu être pire. Ça aurait pu être un best-seller.",
}

FR.estado.FALAS = {
    ovo = {
        _todas = {
            "…",
            "(l'œuf a un peu bougé)",
            "Toc, toc. Lis encore un peu et je sors.",
            "(quelque chose a grogné là-dedans)",
            "(une odeur de vieux papier s'échappe de l'œuf)",
            "(l'œuf a l'air de te juger)",
        },
    },
    jovem = {
        feliz = {
            "J'ai mangé une page entière et rien de mal n'est arrivé. <medrosa:Pas encore. J'ai l'œil.|otimista:Et il n'arrivera rien.|Pas encore.>",
            "Bon papier. Bonne colle. Je me méfie.",
            "Bon… c'était délicieux. Ça va mal tourner plus tard ?",
            "Aujourd'hui j'ai compris une métaphore. Toute seule. Je crois.",
            "{exclamacao|} J'ai mangé un paragraphe entier sans m'étrangler. Je grandis.",
            "Il est bon, ce livre, ou c'est moi qui ai faim ?",
            "Si seulement je savais lire aussi vite que je mange…",
            "Contente. Ne le dis à personne. J'ai une réputation.",
            "Aujourd'hui j'ai lu un mot de cinq syllabes. Il m'a relue en retour.",
            "Si j'avais une queue, elle remuerait. J'ai des antennes. Elles remuent.",
            "Ce livre m'a fait un câlin. <romantica:Je l'ai laissé faire.|medrosa:Ou il m'a écrasée. Je ne sais pas.|Ou il m'a écrasée. C'était bien.>",
            "Je crois que je t'aime bien. Ne le dis pas aux autres mites.",
            "J'ai avalé une virgule sans le vouloir. Maintenant tout a une pause.",
        },
        normal = {
            "Il finira bien, ce livre ? Les livres finissent toujours mal.",
            "Je suis là. <corajosa:Ferme et prête.|medrosa:Je tremble, mais je suis là.|Un peu nerveuse, mais je suis là.>",
            "Si tu arrêtes de lire, je… ça va aller. Je crois.",
            "Il paraît que les gros livres ont plus de garniture.<dominio: Celui-ci a une garniture au goût {gosto}.|>",
            "Une mite plus âgée m'a dit qu'au final, tout est papier.",
            "J'ai essayé de fumer une fois. J'ai toussé toute la reliure.",
            "Quand je serai grande, je lirai le dictionnaire. En entier.",
            "Tu lis tellement vite. Quelqu'un t'attend ?",
            "Parfois je crois que les personnages me voient. <medrosa:C'est pour ça que je me cache.|romantica:Et ils sourient.|>",
            "Pourquoi les livres ont-ils une odeur {cheiro|de vieille pluie} ?",
            "Une mite plus âgée dit que je lis trop vite. Elle lit trop lentement.",
            "<corajosa:Avant j'avais peur de la fin des livres. Maintenant je cours vers elle.|amarga:J'ai peur de la fin des livres. Avec raison.|J'ai peur de la fin des livres. Et du début. Et du milieu.>",
            "Si je mords le nom de l'auteur, il le sent ?",
            "<corajosa:Aujourd'hui je suis courageuse. Demain aussi.|Aujourd'hui j'ai décidé d'être courageuse. Demain, on verra.>",
            "Il existe un livre sur les mites ? Je le mangerais par curiosité.",
            "Parfois je relis la même ligne trois fois. Pour être sûre qu'elle existe.",
        },
        triste = {
            "J'ai faim. Et <romantica:le cœur gros|la trouille>. Surtout faim.",
            "Tu m'as oubliée ? Ce n'est pas grave, tout le monde oublie.",
            "Une toute petite page… s'il te plaît ?",
            "J'ai mâchouillé {coisa|le marque-page}. C'est tout ce qui restait.",
            "Mon ventre gargouille comme {comparacao|un chapitre à suspense}.",
            "Si je disparais, cherche {lugar|entre les pages 40 et 41}.",
            "J'ai compté les lettres de la couverture. Toutes. Deux fois. C'est tout ce qui restait.",
            "Faim d'histoire. N'importe laquelle.",
            "Même l'index ressemble à un banquet, maintenant.",
        },
        dormindo = {
            "Zzz… je rêve que l'étagère s'effondre… <corajosa:et je la retiens toute seule…|>",
            "Zzz… n'éteins pas la lumière… <medrosa:laisse-la allumée…|enfin, si, éteins…>",
            "Zzz… un bibliothécaire… avec une bombe insecticide… non…",
            "Zzz… encore une page… juste une… <noturna:la nuit est à nous…|>",
        },
        casulo = {
            "Je me suis cachée dans la reliure. Dehors, c'est dangereux. Lis une page et je reviens.",
            "Je suis là-dedans. Sombre, douillet et sans lettres. Horrible.",
        },
        repouso = {
            "Zzz… dans mon rêve, il y a <romantica:du papier à lettres|erudita:du parchemin|{coisa|du papier de riz}>…",
            "Zzz… la colle… si douce… <dominio:au goût {gosto}…|>",
            "Zzz… qui a éteint la lumière du monde ? <medrosa:Rallume…|>",
            "Zzz… je rêve d'une bibliothèque sans fin… <medrosa:et sans issue…|corajosa:et je l'explore toute…|>",
            "Zzz… la couverture est si chaude… <romantica:on dirait un câlin…|>",
        },
        palavra = "J'ai mangé le mot « %s ». <otimista:Il avait un goût de dimanche.|medrosa:Je crois qu'il était hanté.|erudita:Je le garde pour un sonnet.|Je crois qu'il m'est resté sur l'estomac.>",
    },
    velha = {
        feliz = {
            "Hm. Finalement, ce n'était pas un mauvais livre.",
            "J'ai mangé. Rassasiée. Ne t'y habitue pas.",
            "{exclamacao|} Une page correcte. Rare, de nos jours.",
            "Ce paragraphe méritait une cigarette après.",
            "Bon livre. Je vais regretter de le détester.",
            "Aujourd'hui la littérature m'a épargnée. Demain, on verra.",
            "Rassasiée. <otimista:C'est ainsi que commencent les comédies.|C'est ainsi que commencent les tragédies.>",
            "Quelle prose. <otimista:Ça me fait croire en l'humanité. Sans le presque.|Ça me fait presque croire en l'humanité. Presque.>",
            "Un livre correct. Je note la date, pour me souvenir de l'époque où le monde valait le coup.",
            "Rassasiée. Ce n'est pas du bonheur, c'est de la digestion.",
            "Cet auteur savait ce qu'il faisait. Je déteste quand ça arrive.",
            "Bon chapitre. <romantica:Je me suis émue et je ne ferai pas semblant.|Laisse-moi faire semblant de ne pas m'être émue.>",
        },
        normal = {
            "J'ai trop lu pour <otimista:perdre espoir|avoir de l'espoir>.",
            "Tout livre a une fin. Comme tout.",
            "Plus je lis, moins je comprends le monde.",
            "Lis. Ou pas. La fin est la même.",
            "J'ai allumé une cigarette. Métaphorique. Papier et feu ne font pas bon ménage.",
            "Toute bibliothèque est un cimetière bien éclairé.",
            "Les classiques sont les livres que tout le monde cite et que personne ne mange.",
            "La préface, c'est là où l'auteur s'excuse d'avance.",
            "J'ai été jeune et optimiste. <otimista:Je le suis encore.|Ça a duré un chapitre.>",
            "Notes de bas de page : là où la vérité va se cacher.",
            "Plus personne ne lit. C'est pour ça que je mange.<dominio: Au menu d'aujourd'hui : un goût {gosto}.|>",
            "La vie est un roman mal édité.",
            "Le best-seller d'aujourd'hui est le papier d'emballage de demain.",
            "J'ai lu tant de fins heureuses que <romantica:je pleure encore à chacune|j'ai perdu la foi dans les fins>.",
            "Tout narrateur ment. Les honnêtes mentent mieux.",
            "La culture, c'est ce qui reste quand on oublie ce qu'on a lu. Moi, je me souviens de tout. Pas de chance.",
            "La jeunesse lit pour se trouver. La vieillesse lit pour se cacher.",
            "J'ai déjà mangé du Shakespeare. <erudita:En version originale. Je recommande.|popular:Je préfère les feuilletons.|Indigeste. Je recommande.>",
            "Les poètes meurent jeunes. Pas les mites. Injuste.",
            "Je ne déteste pas les gens. Seulement ceux qui cornent les pages.",
            "Mon opinion sur le monde tient dans une note de bas de page. Petite et ignorée.",
        },
        triste = {
            "Faim. Comme toujours. Comme tout le monde.<dominio: J'ai la nostalgie d'un goût {gosto}.|>",
            "On ne se souvient même pas des mites.",
            "Tu sais ce qui est pire qu'un mauvais livre ? Pas de livre du tout.",
            "Je dépéris entre deux couvertures. Comme c'est poétique. Comme c'est inutile.",
            "Laisse-moi ici avec ma cigarette imaginaire et ma faim bien réelle.",
            "Étagère vide, âme vide. Ventre aussi.",
            "Faim et lucidité. <otimista:Au moins la lucidité.|La pire combinaison.>",
            "Personne ne lit. Personne ne me nourrit. La civilisation est finie.",
            "J'ai tellement faim que j'envisagerais <erudita:une notice d'utilisation. En allemand|popular:un magazine people. Avec plaisir|une notice d'utilisation>.",
        },
        dormindo = {
            "Zzz… je grommelle contre <dominio:{coisa}|l'état de la littérature>…",
            "Zzz… la colle d'avant était meilleure… <otimista:celle d'aujourd'hui fera l'affaire…|>",
            "Zzz… pas de best-seller… je t'en prie…",
            "Zzz… je rêve d'un bouquiniste fermé rien que pour moi…",
        },
        casulo = {
            "Cachée dans la reliure. Réveille-moi quand le monde ira mieux. Ou quand tu liras.",
            "Je ne suis pas là. Je suis entre les pages, là où c'est plus honnête.",
        },
        repouso = {
            "Zzz… je fume une cigarette en rêve… <erudita:et je cite Baudelaire…|>",
            "Zzz… la dernière page <otimista:surprend parfois|déçoit toujours>…",
            "Zzz… je grommelle en <popular:bon français|latin>…",
            "Zzz… je relis les épreuves du monde… <otimista:moins d'erreurs que prévu…|tant d'erreurs…>",
        },
        palavra = "« %s ». Mangé. <erudita:Mot noble ; le siècle ne le mérite pas.|popular:Mot de dictionnaire. Sans sel.|Plus personne n'emploie ce mot.>",
    },
}

FR.estado.FALAS_LIVRO = {
    jovem = {
        "« %s » a un goût <medrosa:de bougie éteinte|corajosa:d'aventure|{gosto|de mystère}>. Ou de moisi.",
        "Je mâchouille encore « %s ». Lentement, pour que ça dure.<dominio: Ça a un goût {gosto}.|>",
        "« %s » finit bien, tu crois ? Dis-le-moi sans me le dire.",
        "J'ai rêvé de « %s » cette nuit. <corajosa:J'étais l'héroïne.|romantica:C'était un beau rêve.|J'ai eu peur.>",
    },
    velha = {
        "« %s » ? J'ai mangé pire. J'ai mangé mieux. J'ai toujours faim.<dominio: Celui-ci avait une odeur {cheiro}.|>",
        "Je digère encore « %s ». <otimista:Léger. Comme la vie devrait l'être.|Lourd. Comme la vie.>",
        "L'auteur de « %s » souffrait. On le sent dans la colle.",
        "Après « %s », il me faut <romantica:un mouchoir|medrosa:une lumière allumée|une cigarette> et du silence.",
        "« %s » ne changera pas le monde. Mais il m'a un peu changée. En pire.",
    },
}
FR.estado.FALAS_PERSONAGEM = {
    jovem = { "%s me <corajosa:défie. J'aime ça|romantica:fait trembler les antennes|fait un peu peur>.", "J'aime bien %s. <romantica:Beaucoup.|cinica:Pour l'instant.|C'est dangereux ?>", "%s est de retour. Je suis devenue nerveuse." },
    velha = { "Encore %s. Il n'y a personne d'autre dans ce livre ?", "Je connais le genre de %s. <otimista:Ça finit bien, aussi incroyable que ça paraisse.|Ça finit mal.>",
              "%s parle comme quelqu'un qui n'a jamais lu un livre.", "Si je croisais %s, je <romantica:demanderais un autographe|medrosa:m'enfuirais|mordrais>." },
}

FR.estado.FALAS_MUDA_PERTO = {
    jovem = {
        "Il reste environ %d pages avant ma mue. Je suis nerveuse.",
        "Encore %d pages et je grandis. Et si je devenais moche ?",
        "J'ai compté : %d pages avant ma prochaine peau. J'ai recompté. Toujours %d.",
        "Dans %d pages, je serai quelqu'un d'autre. Promets-moi de me reconnaître ?",
    },
    velha = {
        "Encore %d pages et je mue. Encore. Quelle fatigue.",
        "%d pages avant la prochaine mue. Vieillir, c'est juste ça : changer de carapace et se plaindre.",
        "Encore %d pages. Peau neuve, vieilles opinions.",
        "Dans %d pages, je change. Le monde reste le même. Comme toujours.",
    },
}
FR.estado.FALAS_MUDA_IMINENTE = {
    ovo = { "(l'œuf est en train de se fissurer…)", "Toc. Toc. TOC. Lis encore un tout petit peu !", "(quelque chose pousse la coquille de l'intérieur)" },
    jovem = {
        "Ça me gratte. Je crois que je mue aujourd'hui.",
        "Mon dos craque. C'est maintenant ? C'est maintenant !",
        "Encore quelques pages… je sens la vieille peau qui se détache.",
        "Ne regarde pas ! Je suis sur le point de muer.",
    },
    velha = {
        "Ça me gratte. C'est reparti. Une peau de plus, un poids de plus.",
        "Je sens la carapace se fendre. Ou c'est l'âge. Lis vite et on saura.",
        "Je suis sur le point de changer. Je doute que ça améliore quoi que ce soit.",
        "Presque en pleine mue. Laisse-moi un peu de dignité.",
    },
}

-- Répliques avec les données de lecture (mêmes clés que traca_contexto.lua) -----------------
FR.contexto = {
    madrugada = {
        jovem = {
            "Il est {hora}. On ne devrait pas dormir ? <noturna:J'adore cette heure.|J'ai peur du noir et toi, tu lis.>",
            "{hora} et tu es là. Tout va bien ? Moi oui. Je crois. J'ai sommeil.",
            "Lire à {hora}, ça fait interdit. <medrosa:Ça m'a fait peur.|noturna:Notre heure préférée.|J'aime bien.>",
            "À {hora}, les lettres grossissent. Ou mes yeux rapetissent.",
            "{hora} ! Si on demande, on dormait.<dominio: Je rêve {lugar}.|>",
        },
        velha = {
            "Il est {hora}. À cette heure, il n'y a que des mites, des poètes et des insomniaques. Tu es lequel ?",
            "{hora}. Rien de bon n'a jamais été lu après minuit. Sauf tout ce qui vaut la peine.",
            "Lire à {hora}. <noturna:La meilleure heure, je l'ai toujours dit.|diurna:Ce n'est pas une heure pour les gens bien.|Demain tu accuseras le livre. Moi, je t'accuse, toi.>",
            "{hora} du matin. Moi avec ma cigarette imaginaire, toi avec la lumière de ton écran. Deux vices.",
            "{hora}. L'heure où chaque phrase sonne vrai. Attention à ce que tu soulignes.",
        },
    },
    recorde = {
        jovem = {
            "{n} pages aujourd'hui ! Record ! Je vais le dire à toutes les mites. Je n'ai pas d'amies, mais je vais le dire.",
            "Jamais autant mangé en un jour : {n} pages. Mon ventre est fier et effrayé.",
            "Record de {n} pages. Je crois que j'ai grandi d'un millimètre.",
        },
        velha = {
            "{n} pages. Record. N'attends pas d'applaudissements ; attends-toi à une indigestion.",
            "Nouveau record : {n} pages en un jour. Tu fuis quelque chose ?",
            "{n} pages. Jamais autant mangé. Note la date, que je puisse m'en plaindre plus tard.",
        },
    },
    maratona = {
        jovem = {
            "{n} pages aujourd'hui. <corajosa:J'en avalerais cent de plus.|Mon ventre est tout rond.>",
            "Déjà {n} pages ! Je ne marche plus, je roule.",
            "{n} pages… tu ne te fatigues pas ? Moi, je me fatigue rien qu'à mâcher.<dominio: J'ai un goût {gosto} dans la bouche.|>",
        },
        velha = {
            "{n} pages aujourd'hui. Mon ventre te remercie ; ma dignité, moins.",
            "{n} pages. <erudita:Proust approuverait. Peut-être.|Ce n'est pas de la lecture, c'est un déménagement.>",
            "Déjà {n} pages. Cligne des yeux. Bois de l'eau. Puis reviens, bien sûr.",
        },
    },
    sumiu = {
        jovem = {
            "{n} jours sans papier. J'ai compté chaque heure. <medrosa:J'avais peur que tu ne reviennes pas.|Il y en a eu beaucoup.>",
            "Tu as disparu {n} jours. <medrosa:J'ai cru qu'il t'était arrivé quelque chose.|romantica:J'avais le cœur serré.|J'ai cru que tu avais changé de mite.>",
            "{n} jours ! De faim, j'ai failli manger ma propre ombre. <medrosa:Elle m'a fait peur.|corajosa:Je me suis battue avec.|dominio:Elle avait un goût {gosto}.|>",
        },
        velha = {
            "{n} jours sans lire. <otimista:Ce n'est pas grave, on recommence.|La civilisation est tombée et personne ne m'a prévenue ?>",
            "{n} jours. Je suis restée là, à ruminer le rabat de la jaquette<erudita: et une thèse|dominio: en pensant à {coisa}|>.",
            "{n} jours sans toi. <romantica:Tu m'as manqué. Voilà, c'est dit.|Je ne demanderai pas où tu étais. Tu ne lisais pas, c'est tout ce qui compte.>",
        },
    },
    tarde = {
        jovem = {
            "Il est déjà {hora}. Juste un chapitre de plus, hein ? Je sais comment ça finit.",
            "<noturna:{hora}… je suis bien éveillée. Continue.|{hora}… mes petits yeux se ferment, mais continue.>",
            "Lire à {hora}, c'est comme confier un secret. À voix basse.",
        },
        velha = {
            "{hora}. L'heure où tout lecteur jure qu'il dormira après ce chapitre.",
            "Il est {hora}. Le livre ne va pas s'enfuir. Toi, si, de sommeil.",
            "{hora}. Encore éveillée <noturna:par goût. La nuit est à moi|à cause de toi. Non que je m'en soucie>.",
        },
    },
    cedo = {
        jovem = {
            "Lire à {hora} ? Avant le café ? <diurna:J'adore le matin !|noturna:Je n'ai même pas encore dormi.|Quel courage.>",
            "{hora} et tu me nourris déjà. Quelle belle matinée !",
            "Réveil matinal pour lire ? Moi, je me suis réveillée tôt pour manger. On fait équipe.",
        },
        velha = {
            "{hora}. Lire avant le café. <diurna:Le seul ordre naturel des choses.|Je ne comprends pas, mais je respecte.>",
            "Il est {hora}. Les oiseaux chantent, tu lis, je mange. Le seul ordre naturel que j'approuve.",
            "Lecture à {hora}. La journée n'a pas commencé et elle est déjà meilleure qu'hier.",
        },
    },
    sessao = {
        jovem = {
            "{n} pages sans s'arrêter ! Je peux respirer ?",
            "Tu as lu {n} pages d'un coup. Tout va bien, là-dehors ?",
            "{n} pages d'affilée. Ce livre t'a eu. Moi aussi.",
        },
        velha = {
            "{n} pages d'affilée. Soit le livre est bon, soit ta vie va plus mal.",
            "{n} pages sans pause. Cligne des yeux. Les yeux ne se changent pas comme des reliures.",
            "Une séance de {n} pages. Les moines copistes approuveraient.",
        },
    },
    sequencia = {
        jovem = {
            "{n} jours de suite à lire ! Je me laisse gâter.",
            "Jour {n} d'affilée de nourriture. Je crois que tu m'aimes bien.<dominio: Aujourd'hui, ça avait un goût {gosto}.|>",
            "{n} jours sans faillir. <romantica:Ça ressemble fort à une idylle.|otimista:Ça va faire cent.|N'arrête pas maintenant, d'accord ?>",
        },
        velha = {
            "{n} jours d'affilée. La constance : la vertu la plus ennuyeuse et la plus rare.",
            "{n} jours de lecture sans faute. <otimista:Je crois en toi.|cinica:On verra combien de temps ça dure.|Je commence presque à croire en toi.>",
            "Jour {n} d'affilée. Je ne vais pas te féliciter. Voilà, c'est fait.",
        },
    },
    bom_dia = {
        jovem = {
            "{n} pages aujourd'hui. Je deviens potelée.",
            "{exclamacao|} Déjà {n} pages aujourd'hui ! Encore quelques-unes et je deviens une autre mite.",
            "{n} pages aujourd'hui. <amarga:Au moins ça.|C'est une bonne journée, hein ?>",
        },
        velha = {
            "{n} pages aujourd'hui. Respectable. Pas spectaculaire, mais respectable.<dominio: Avec un goût {gosto}.|>",
            "{n} pages aujourd'hui. On peut presque parler de lecture.",
            "{n} pages. Une journée correcte. <otimista:Elles se font plus fréquentes.|Elles sont rares, les journées correctes.>",
        },
    },
    nada_hoje = {
        jovem = {
            "Aucune page aujourd'hui… ce n'est pas grave, j'attends. J'attends très bien.",
            "Je n'ai encore rien mangé aujourd'hui. Pas même une virgule.",
            "La journée se termine et le livre est fermé. Je suis restée à regarder la couverture.",
        },
        velha = {
            "Aucune page aujourd'hui. La journée n'est pas finie. Mais elle essaie.",
            "Aujourd'hui : zéro page. Noté dans mon journal des déceptions.",
            "Le livre est resté fermé toute la journée. Moi aussi, à l'intérieur.",
        },
    },
    reta_final = {
        jovem = {
            "{pct} de « {livro} ». Ça se termine ! Je ne veux pas que ça se termine !",
            "Dernière ligne droite de « {livro} ». <corajosa:J'irai jusqu'au bout sans ciller.|medrosa:Je mangerai les yeux fermés.|Je mangerai doucement pour que ça dure.>",
            "Il ne reste presque rien de « {livro} ». Et après, qu'est-ce que je vais manger ?",
        },
        velha = {
            "{pct} de « {livro} ». La dernière ligne droite. <otimista:C'est ici que les bons auteurs brillent.|C'est ici que les auteurs gâchent tout.>",
            "Presque à la fin de « {livro} ». Ne me dis rien. Je mangerai la fin de toute façon.",
            "Dernières pages de « {livro} ». Prépare-toi au vide d'après-livre. J'y habite déjà.",
        },
    },
    metade = {
        jovem = {
            "La moitié de « {livro} » ! Ça devient bon. Ou mauvais. Je ne sais pas encore.",
            "J'ai déjà mangé la moitié de « {livro} ». L'autre moitié me regarde.",
        },
        velha = {
            "La moitié de « {livro} ». À partir d'ici, ça descend.",
            "Le milieu de « {livro} ». Le moment où les auteurs ont l'habitude de se perdre.",
        },
    },
    comeco = {
        jovem = {
            "Début de « {livro} »… ça a une odeur {cheiro|de papier neuf}. Ou d'ennuis.",
            "Premières pages de « {livro} ». <corajosa:Je suis déjà enthousiaste.|Je suis déjà nerveuse.>",
        },
        velha = {
            "Début de « {livro} ». Toute couverture promet. Voyons ce qu'elle tient.",
            "Premières bouchées de « {livro} ». <otimista:Prometteur.|Je ne déteste pas encore. Pas encore.>",
        },
    },
    fim_de_semana = {
        jovem = {
            "Lecture du week-end ! Le meilleur genre de week-end.",
            "Le week-end, c'est jour de papier. Youpi.",
        },
        velha = {
            "Le week-end et tu lis. Pas de fête ? Parfait. Les fêtes sont surfaites.",
            "Le week-end. Le monde sort, tu lis. Bon choix.",
        },
    },
}

return FR
