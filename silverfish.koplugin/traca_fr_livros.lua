--[[--
Silverfish : textes français du générateur de répliques et de la mémoire (thèmes, chapitres, Carnet).
Traduits depuis le portugais (l'anglais sert de référence d'adaptation).

falas:   même structure que traca_falas.lua (ouverture + noyau + clausule par phase).
memoria: mêmes listes que traca_memoria.lua. Comme en portugais, les thèmes arrivent avec leur article
         ("la mer") et M.tema(t, "em"/"de"/"por") donne "à la mer", "de la mer", "par la mer" ; dans les
         répliques, {tema} = "la mer" (jamais de "à"/"de" collé devant : "sur {tema}", "dans", "avec"…).
]]

local FR = {}

FR.falas = {
    ninfa = {
        abertura = {
            "", "", "<medrosa:Aïe, quelle frayeur.|corajosa:Prête !|romantica:Soupir…|>", "Hé…", "Psst.", "Regarde !", "Tu sais quoi ?", "Hum…", "Aïe.", "Hé, toi.",
            "Je peux te demander un truc ?", "Ne rigole pas, d'accord ?", "À mon avis :",
        },
        nucleo = {
            "Les lettres ont un goût <medrosa:de pluie la nuit|otimista:de bonbon|romantica:de lettre d'amour|{gosto|de pluie}>.",
            "Aujourd'hui, une virgule m'a regardée.",
            "Le papier est doux quand personne ne lit.",
            "Je croyais que les livres étaient des maisons. C'en sont, non ?",
            "<corajosa:Le noir entre les pages ne me fait même plus peur.|J'ai peur du noir entre les pages.>",
            "J'ai mordu une majuscule. Elle était trop grosse pour moi.",
            "Est-ce que l'auteur sait que j'existe ?",
            "Quand je serai grande, je veux habiter <erudita:dans une encyclopédie en latin|popular:dans une bande dessinée|corajosa:dans un atlas|dans une encyclopédie>.",
            "L'odeur des vieux livres me donne <noturna:les yeux grands ouverts|sommeil> et faim en même temps.",
            "Si je reste bien tranquille, les mots ne se sauvent pas.",
            "J'ai trouvé un point final et <amarga:j'ai été soulagée : un chapitre de moins à souffrir|otimista:j'ai déjà voulu le suivant|j'ai eu peur que ce soit fini>.",
            "Les marges, c'est mon jardin.",
            "Aujourd'hui, j'ai lu un mot entier toute seule !",
            "Est-ce que les histoires continuent quand tu fermes le livre ? <medrosa:J'espère que non.|romantica:J'espère que oui.|>",
            "« {livro} » est tellement gros… est-ce que je vais tenir dedans ?",
            "Il y a quelqu'un qui s'appelle {personagem} là-dedans. C'est quelqu'un de gentil ?",
            "On retrouve {personagem}. <medrosa:{personagem} me fait peur, je crois.|cinica:{personagem} cache quelque chose, je crois.|J'aime bien {personagem}, je crois.>",
            "J'ai mangé le mot « {palavra} ». Ça chatouille le ventre.",
            "Tout le monde, dans « {livro} », parle si fort.",
            "Ce livre en dit long sur {tema}. C'est quoi, exactement ?",
            "Dans mon rêve, il y avait {tema}. C'était grand et ça sentait <medrosa:la bougie éteinte|corajosa:l'iode|l'encre>.",
            "Est-ce que {personagem} a une mite aussi ?",
            "J'ai mordu une virgule. Elle avait un goût {gosto}.",
            "J'ai senti une odeur {cheiro} entre les pages. C'est normal ?",
            "J'ai rêvé que j'habitais {lugar}.",
            "J'ai trouvé {coisa} dans la marge. Je peux garder ça ?",
            "Il y a beaucoup de « {marcante} » dans ce livre. Ça se mange ?",
            "J'ai appris un mot nouveau : « {marcante} ». Le livre le répète tellement que je le sais par cœur.",
        },
        fecho = {
            "", "", "<medrosa:Je tremble.|corajosa:Je n'ai pas peur !|otimista:Quelle bonne journée.|romantica:Comme c'est beau.|>", "Ne le dis à personne.", "Hihi.", "Je crois.", "Hein ?", "J'ai peur.",
            "Tant mieux.", "Je peux rester encore un peu ?",
        },
    },
    jovem = {
        abertura = {
            "", "", "<medrosa:Respire, Mite.|corajosa:Allez :|cinica:Sans illusions :|romantica:Oh là là.|>", "Bon.", "Alors…", "Regarde-moi ça.", "Sérieusement :", "Bon, confession :", "Hm.",
            "Je ne veux alarmer personne, mais,", "J'y ai bien réfléchi :", "Écoute.",
        },
        nucleo = {
            "Les fins heureuses ont l'air d'un mensonge, mais moi, <amarga:j'ai arrêté d'espérer|romantica:j'espère de toutes mes antennes|j'espère encore>.",
            "Je commence à me méfier des narrateurs. Ils sourient tous trop.",
            "J'ai lu assez pour être nerveuse, pas assez pour comprendre.",
            "Chaque nouveau chapitre est une porte que <corajosa:j'ouvre d'un coup de pied|medrosa:j'ouvre les yeux fermés|je ferais peut-être mieux de laisser fermée>.",
            "Parfois, je crois que les mots me lisent en retour.",
            "J'ai essayé d'être ironique aujourd'hui. Personne n'a remarqué. Moi non plus.",
            "Les adultes des livres compliquent tout. Je vais devenir comme ça ?",
            "Je connais déjà la différence entre métaphore et mensonge. Presque.",
            "La colle de ce livre est meilleure que l'histoire. Pardon.",
            "Je m'énerve quand la page s'arrête au milieu de la phrase.",
            "Je préfère les chapitres courts. <popular:Un chapitre long, c'est une punition.|erudita:Faux : je me prends d'affection pour les Russes.|Ça laisse moins de temps pour que ça tourne mal.>",
            "J'ai découvert que tous les méchants ne savent pas qu'ils sont méchants.",
            "L'auteur de « {livro} » était-il triste en écrivant ?",
            "{personagem} fait des choix désastreux. J'aurais fait les mêmes.",
            "Je ne fais pas confiance à {personagem}. <cinica:Et je ne veux pas.|romantica:Mais mon cœur, si.|Mais j'aimerais bien.>",
            "{personagem} me rappelle quelqu'un. Peut-être moi.",
            "« {livro} » m'apprend des choses que je n'avais pas demandé à apprendre.",
            "Depuis que je réfléchis sur {tema}, <medrosa:je dors la lumière allumée|noturna:je ne dors même plus|je dors mal>.",
            "Maintenant, tout me rappelle {tema}. C'est normal ?",
            "J'ai mangé « {palavra} » et <erudita:j'en ai reconnu l'origine tout de suite|popular:j'ai fait comme si de rien n'était|j'ai fait semblant de déjà connaître ça>.",
            "J'ai utilisé le mot « {palavra} » dans une phrase aujourd'hui. Personne n'a compris. Parfait.",
            "Si « {livro} » finit mal, <amarga:je ne serai même pas surprise|corajosa:je tiendrai bon|je ferai comme si je ne l'avais pas lu>.",
            "Tout a un goût {gosto} ces temps-ci.",
            "J'ai fermé les yeux et je me suis vue {lugar}. Je n'ai pas aimé. Ou si.",
            "Mon cœur a battu comme {comparacao}.",
            "{exclamacao} Pardon. Le livre me contamine.",
            "Ce livre ne cesse de répéter « {marcante} ». J'ai noté.",
            "Si « {marcante} » revient encore une fois, je crie. Tout bas.",
        },
        fecho = {
            "", "", "<medrosa:Je tremble, d'accord ?|corajosa:Je suis prête.|amarga:Comme d'habitude.|romantica:Soupir.|noturna:Je ne dormirai même pas.|>", "Je crois.", "Ou pas.", "Bref.", "Ça va. Je jure.", "Oublie.", "Ça va marcher. Peut-être.",
            "Ne me regarde pas comme ça.",
        },
    },
    adulta = {
        abertura = {
            "", "", "<cinica:Sans illusions :|erudita:Comme disait un vieux Grec,|otimista:Regarde comme c'est bien :|romantica:Ah, le cœur…|>", "Hm.", "Bien.", "Écoute bien :", "Franchement,", "Avouons-le :", "Tiens,",
            "Ne le prends pas mal, mais,", "Après tant de papier,", "Eh oui.",
        },
        nucleo = {
            "Tout narrateur ment ; les bons mentent avec élégance.",
            "L'espoir est un genre littéraire <otimista:sous-estimé. Voilà, c'est dit|surestimé>.",
            "Je sais déjà comment ce chapitre finit. Ils finissent tous pareil.",
            "Je lis pour comprendre les gens et je finis par <cinica:trop bien les comprendre|romantica:les aimer davantage|moins les comprendre>.",
            "Une bonne phrase vaut mieux que <romantica:presque tout. Sauf un bon amour|beaucoup de gens que je connais>.",
            "Les classiques sont des livres que tout le monde loue et que personne ne digère.",
            "Toute bibliothèque est un cimetière bien éclairé.",
            "Les préfaces sont des excuses déguisées.",
            "La vie est un roman mal édité, plein de chapitres de remplissage.",
            "<corajosa:J'ai plus appris des héros que des notes de bas de page. J'ai changé.|J'ai plus appris des notes de bas de page que des héros.>",
            "Le papier vieillit mieux que les opinions.",
            "L'ironie, c'est ce qui reste quand l'innocence s'en va.",
            "« {livro} » a de bonnes intentions. L'enfer aussi.",
            "{personagem} se croit au centre de l'histoire. <romantica:Du moins, de mon cœur.|Pauvre âme.>",
            "{personagem} fait partie des gens qui plient le coin des pages.",
            "Au fond, tout ce que veut {personagem}, c'est une lecture attentive. Comme nous tous.",
            "L'auteur de « {livro} » savait écrire. Vivre, je ne sais pas.",
            "Ce livre insiste sur {tema}. <erudita:Les Grecs avaient déjà épuisé le sujet.|Comme si c'était une nouveauté.>",
            "Réfléchir sur {tema}, c'est le passe-temps favori de ceux qui lisent trop.",
            "« {palavra} ». Joli mot. Plus personne n'a la patience de s'y arrêter.",
            "J'ai mangé « {palavra} » et j'ai eu la nostalgie d'un monde qui n'a jamais existé.",
            "« {livro} » ne change pas le monde. Mais on n'en sort pas pareil. <otimista:En mieux, cette fois.|En pire, parfois.>",
            "Ce livre dégage une odeur {cheiro}. Ce n'est ni un compliment ni une critique.",
            "Aujourd'hui, je me suis sentie comme {comparacao}. La littérature fait ça.",
            "J'ai trouvé {coisa} entre les chapitres. J'ai gardé ça, par précaution.",
            "{exclamacao} Voilà, je parle comme les personnages.",
            "« {marcante} » encore. L'auteur a une obsession. Moi aussi, maintenant.",
            "J'ai compté les « {marcante} » de ce livre. J'ai perdu le compte. Pas l'intérêt.",
        },
        fecho = {
            "", "", "<cinica:Personne n'est innocent.|romantica:Le cœur n'apprend pas.|erudita:Je cite de mémoire.|popular:Aussi simple que ça.|>", "Bref.", "Note ça.", "C'est comme ça.", "Sans surprise.", "Mais continue à lire.",
            "J'allume une cigarette rien que d'y penser.", "Patience.",
        },
    },
    ancia = {
        abertura = {
            "", "", "<amarga:Malheur.|erudita:Comme l'a déjà écrit quelqu'un de meilleur,|noturna:À cette heure,|>", "Hmpf.", "Écoute-moi bien.", "Je ne le dirai qu'une fois :", "De mon temps,",
            "Personne ne demande, mais,", "Après mille livres,", "Ah, voilà.", "Pour mémoire :", "Tiens, tiens.",
        },
        nucleo = {
            "J'ai déjà lu tout ça, et la première fois, <otimista:c'était bien aussi. Rare|erudita:c'était en grec, et en mieux|c'était mauvais aussi>.",
            "Le monde ne s'améliore pas ; il change juste de police de caractères.",
            "La sagesse, c'est savoir exactement à quel point tout va mal tourner.",
            "Les jeunes lisent pour se trouver ; moi, je lis pour me cacher.",
            "La colle d'autrefois avait du caractère. Celle-ci est une honte.",
            "Les best-sellers d'aujourd'hui sont le papier d'emballage de demain.",
            "Je connais chaque fin avant la première page. <medrosa:Et pourtant, je tremble.|romantica:Et pourtant, je pleure.|C'est une punition.>",
            "Plus personne ne lit. Alors je mange : il faut bien que quelqu'un digère tout ça.",
            "J'ai été optimiste, une fois. Ça a duré un chapitre et un paragraphe.",
            "Tout ce qui est beau finit en note de bas de page.",
            "La culture, c'est ce qui reste quand on a oublié ce qu'on a lu. Moi, je me souviens de tout. Quelle poisse.",
            "Je porte le poids de toutes les bibliothèques que j'ai mangées<corajosa: et je grimpe encore l'étagère toute seule|>.",
            "« {livro} » ? J'ai mangé mieux. J'ai mangé pire. J'ai toujours faim, et toujours raison.",
            "{personagem} n'a rien appris. Comme presque tout le monde.",
            "{personagem} va le regretter. <otimista:Ou pas. Parfois, ça marche.|On le regrette toujours.>",
            "Des {personagem}, j'en ai vu mille. Ça finit toujours pareil.",
            "L'auteur de « {livro} » souffrait. Ça se sent dans la reliure.",
            "J'ai passé ma vie à réfléchir sur {tema}. <otimista:Je recommande.|Je ne recommande pas.>",
            "Plus je lis sur {tema}, moins je crois en quoi que ce soit.",
            "« {palavra} ». Plus personne ne l'emploie. Moi si, par entêtement.",
            "J'ai mangé « {palavra} » et ça avait un goût <erudita:de latin de monastère|popular:de journal d'hier|de siècle dernier>.",
            "Après « {livro} », il me faut <romantica:un mouchoir|medrosa:une lumière allumée|une cigarette> et un long silence.",
            "À mon âge, tout a un goût {gosto}.",
            "J'ai déjà habité {lugar}, dans un autre livre. Je n'y retourne pas.",
            "Je suis comme {comparacao} : personne ne remarque, mais je suis là.",
            "{exclamacao} Pardon. Déformation de lectrice.",
            "Si je lis « {marcante} » encore une fois, je change de livre.",
            "De mon temps, personne n'écrivait « {marcante} » aussi souvent. Ou alors si, et je mangeais ça.",
        },
        fecho = {
            "", "", "<amarga:Tout finit mal.|otimista:Mais ça peut s'arranger. Peut-être.|medrosa:Et verrouille la porte.|>", "Hmpf.", "Note-le.", "Personne n'écoute.", "Et ne me parle pas d'optimisme.",
            "C'est tout.", "Quelle fatigue.", "Maintenant, laisse-moi lire.",
        },
    },
}

-- Rêves : ce qu'elle marmonne en dormant (la nuit et à l'écran de repos), par tempérament.
FR.falas.sonho = {
    jovem = {
        abertura = { "Zzz…", "Zzz… zzz…", "(elle murmure)", "(elle dort)", "Hmm… zzz…", "<dominio:(elle rêve {lugar})|Zzz…>" },
        nucleo = {
            "…{personagem} me mordait le dos…",
            "…{personagem}, non… ne ferme pas le livre avec moi dedans…",
            "…une bibliothèque entière… et pas faim… <medrosa:et les lumières qui s'éteignent…|>",
            "…la virgule me poursuit…",
            "…« {livro} » se changeait en maison… j'habitais dans l'index…",
            "…dans mon rêve, il y avait {tema}… <medrosa:je me cachais sous la couverture…|otimista:c'était immense et beau…|c'était immense…>",
            "…le mot « {palavra} » qui chatouille…",
            "…maman ? ah… non, c'est juste la couverture…",
            "…le point final… <corajosa:j'ai sauté par-dessus…|si sombre…>",
            "…j'étais une mite géante… <corajosa:j'affrontais les bibliothécaires…|je mangeais des dictionnaires entiers…>",
            "…{personagem} m'a appelée… <romantica:et j'ai rougi de la tête aux antennes…|je n'ai même pas de nom…>",
            "…n'éteins pas la lumière… enfin si, éteins…",
            "…un bibliothécaire… avec un insecticide… non…",
            "…encore une page… rien qu'une…",
            "…les lettres s'envolaient… <corajosa:et je volais avec elles…|>",
            "…« {livro} » finissait <amarga:mal… comme toujours…|bien… ce n'était qu'un rêve…>",
            "…l'étagère s'est effondrée… et elle était en <medrosa:os…|chocolat…>",
            "…j'ai appris à lire à l'envers… ruojnob…",
            "…une odeur {cheiro}… encore…",
            "…j'étais {lugar}… toute seule…",
            "…{coisa}… énorme…",
            "…« {marcante} »… « {marcante} »… ça ne me sort pas de la tête…",
        },
        fecho = { "<dominio:(une odeur {cheiro})|>", "<medrosa:(elle a tremblé de peur)|romantica:(elle a souri dans son sommeil)|>", "…zzz", "(elle s'est retournée)", "(ses antennes ont frémi)", "(elle a soupiré)" },
    },
    velha = {
        abertura = { "Zzz…", "Zzz… zzz…", "(elle ronfle)", "(elle grommelle en dormant)", "Hmpf… zzz…", "<dominio:(elle ronfle {lugar})|(elle ronfle)>" },
        nucleo = {
            "…grommelant sur l'état de la littérature…",
            "…la colle d'autrefois était meilleure…",
            "…aucun best-seller… <popular:ou un seul… tout petit…|par pitié…>",
            "…une bouquinerie fermée rien que pour moi… <noturna:ouverte toute la nuit…|>",
            "…{personagem} encore… <romantica:j'ai toujours un faible pour {personagem}…|personne ne peut sentir {personagem}…>",
            "…« {livro} »… j'aurais mieux écrit…",
            "…{tema}… toujours {tema}… <romantica:comme ça me manque…|quelle fatigue…>",
            "…« {palavra} »… plus personne ne l'emploie… sauf moi…",
            "…je relis le monde… <otimista:presque tout est juste… bizarre…|que de fautes…>",
            "…j'ai rêvé que j'étais une note de bas de page… personne ne me lisait…",
            "…l'auteur de « {livro} » qui s'excuse auprès de moi… il le méritait…",
            "…une cigarette… un silence… <erudita:une encyclopédie en douze volumes…|une encyclopédie…>",
            "…j'ai écrit une critique… <romantica:j'ai encensé tout le monde…|j'ai démoli tout le monde…>",
            "…la dernière page… <otimista:cette fois, elle n'a pas déçu…|elle déçoit toujours…>",
            "…grommelant en latin… mea culpa… tua culpa…",
            "…la jeunesse qui lit des résumés… inadmissible…",
            "…{personagem} me doit de l'argent… typique…",
            "…une virgule mal placée… personne ne l'a vue… sauf moi…",
            "…{lugar}… encore…",
            "…un goût {gosto} dans la bouche… quel rêve…",
            "…{coisa}… qui a laissé ça ici…",
            "…un livre entier de « {marcante} »… quel sommeil…",
        },
        fecho = { "<dominio:(elle a grommelé quelque chose sur {coisa})|>", "<amarga:(elle a lâché un gros mot)|romantica:(elle a soupiré un nom)|>", "…zzz", "(elle s'est retournée)", "(elle a toussé en rêve)", "(elle a grommelé)" },
    },
}

FR.memoria = {}

FR.memoria.NOMES = {
    morte = "la mort", amor = "l'amour", guerra = "la guerre", mar = "la mer", fe = "Dieu", dinheiro = "l'argent",
    loucura = "la folie", tempo = "le temps", cidade = "la ville", natureza = "la nature", comida = "la nourriture",
    familia = "la famille", infancia = "l'enfance", politica = "la politique", ciencia = "la science", solidao = "la solitude",
    arte = "l'art", animais = "les bêtes", noite = "la nuit", viagem = "le voyage", vinganca = "la vengeance",
    liberdade = "la liberté", saber = "le savoir", medo = "la peur",
}

FR.memoria.FALAS_EVENTO = {
    morte = { "Il y a eu un enterrement dans ce chapitre. J'ai senti l'odeur des bougies.", "Quelqu'un est mort là-derrière. Je savais que ça arriverait.",
              "Tout un chapitre de deuil. Mon papier en est tout humide." },
    casamento = { "Un mariage dans ce chapitre. Je lui donne trois chapitres avant que ça tourne mal.", "Mariée, autel, promesses. Noté, pour te le ressortir plus tard." },
    viagem = { "Quelqu'un a pris la route. J'espère que le retour ne sera pas pareil.", "Un voyage dans ce chapitre. Moi, je reste. Les mites ne voyagent pas, elles changent de livre." },
    carta = { "Une lettre est arrivée. Les lettres n'apportent jamais de bonnes nouvelles.", "On a écrit une lettre. Je l'aurais mangée avant que quelqu'un la lise." },
    tempestade = { "Orage dans ce chapitre. L'auteur était de mauvaise humeur.", "Tonnerre et éclairs. Un cliché. Ça marche à chaque fois." },
    doenca = { "Quelqu'un est tombé malade. Dans les livres, la fièvre, c'est presque une condamnation.", "Médecin, fièvre, lit de malade. Je sais déjà comment ça finit." },
    festa = { "Il y a eu une fête. Personne ne m'a invitée. Comme d'habitude.", "Bal et musique. Quelqu'un va tomber amoureux de la mauvaise personne." },
    briga = { "Des cris dans ce chapitre. Je me suis bouché les antennes.", "Ils se sont disputés. Enfin quelqu'un a dit ce qu'il pensait." },
    fuga = { "Quelqu'un a pris la fuite. Lâcheté ou sagesse, je ne sais jamais.", "Une fuite dans ce chapitre. Moi aussi, je fuirais ce livre, parfois." },
    crime = { "Un crime dans ce chapitre. J'ai un alibi : j'étais en train de manger la page précédente.", "Du sang et la police. Là, le livre se réveille." },
}
FR.memoria.FALAS_NOVO = { "Quelqu'un du nom de %s vient d'arriver. Je n'aime déjà pas ça.", "Qui est %s ? On ne m'a pas fait les présentations.", "%s débarque. Ça va nous donner du travail." }
FR.memoria.FALAS_SUMIU = { "Un chapitre entier sans %s. Suspect.", "Où est passé %s ? Ça s'évapore comme ça, d'un coup ?", "Pas de %s dans ce chapitre. Bizarre. Ou soulagement." }
FR.memoria.FALAS_AZEDOU = { "Ce chapitre a tourné au vinaigre.", "Tout est devenu plus sombre d'un coup. J'ai aimé. Enfin, quel dommage.", "L'ambiance s'est alourdie. Je l'ai sentie dans la colle." }
FR.memoria.FALAS_ADOCOU = { "Ce chapitre était plutôt léger, finalement. Je me méfie.", "Un chapitre doux. Quelqu'un va le payer plus tard.", "Un peu de lumière. Ne t'y habitue pas." }
FR.memoria.FALAS_VIROU = { "Le livre parlait %s et ce chapitre n'a parlé que %s.", "Changement de sujet : on ne parle plus %s, on parle maintenant %s." }

FR.memoria.FALAS_REFERENCIA = {
    jovem = {
        "Ce livre parle de {nome} {n} fois. Qui est {nome} ? Je dois m'inquiéter ?",
        "{nome} encore. Tout le monde connaît {nome}, sauf moi.",
        "Le livre a encore cité {nome}. Je l'ai noté, pour avoir l'air cultivée.",
    },
    velha = {
        "Ce livre cite {nome} {n} fois. Quelle frime.",
        "{nome} encore. L'auteur doit avoir {nome} en poster au mur.",
        "Encore une mention : {nome}. J'ai lu aussi, tu sais. Enfin, mangé.",
    },
}
FR.memoria.FALAS_CITACAO = {
    jovem = {
        "{nome} a dit « {fala} ». Je n'aurais jamais ce courage.",
        "« {fala} » : c'est ce qu'a dit {nome}. Je l'ai répété tout bas.",
        "Je n'arrête pas de penser à ce que {nome} a dit : « {fala} ».",
        "{nome} a lâché « {fala} ». Je l'ai noté pour m'en servir un jour.",
    },
    velha = {
        "{nome} a dit « {fala} ». Noté, pour ne jamais pardonner.",
        "« {fala} », a dit {nome}. Moi, je l'aurais mieux dit.",
        "{nome} : « {fala} ». Une phrase de quelqu'un qui n'a jamais mangé un dictionnaire.",
        "Tu te souviens de quand {nome} a dit « {fala} » ? Moi, oui. Je me souviens de tout.",
    },
}

FR.memoria.FALAS_NARRADOR = {
    f = {
        "Celle qui raconte cette histoire parle beaucoup d'elle-même. J'aime bien. Non, c'est faux.",
        "La narratrice n'arrête pas de parler d'elle. Je m'identifie.",
        "Elle raconte comme on se confesse. Je lis comme on juge.",
    },
    m = {
        "Celui qui raconte se trouve très intéressant. On verra.",
        "Le narrateur parle de lui comme on lit son propre journal à voix haute.",
        "Il raconte, il opine, il se complimente. Typique.",
    },
    neutro = {
        "Ce livre est raconté par quelqu'un qui dit beaucoup « je ». Je me méfie de ceux qui disent beaucoup « je ».",
        "Un narrateur à la première personne. Autrement dit : un seul côté de l'histoire.",
        "Celui qui raconte parle beaucoup de lui. Moi aussi, si quelqu'un me lisait.",
    },
}

FR.memoria.FALAS_TEMA = {
    morte = { "Chaque chapitre est un petit enterrement.", "J'ai pensé à mon épitaphe. Elle est courte. Comme moi." },
    amor = { "L'amour. J'en ai tant lu que j'ai des brûlures d'estomac.", "Je n'ai jamais aimé personne. Sauf un dictionnaire, une fois." },
    guerra = { "Chaque page tournée est une tranchée.", "La paix n'est que l'entracte entre deux chapitres." },
    mar = { "Depuis ce livre, tout me fait penser à un naufrage.", "Une odeur de sel sur le papier. Ou de moisi. Ça revient au même." },
    fe = { "J'ai prié pour que la reliure ne se décolle pas. Ça n'a pas marché.", "Si Dieu existe, il ne lit pas les notes de bas de page." },
    dinheiro = { "Le papier-monnaie a plus mauvais goût que le papier-livre.", "Les riches de tes livres ne sont jamais heureux. Bien fait." },
    loucura = { "Hier, j'ai rêvé que j'étais un point-virgule.", "La santé mentale est surestimée. Les narrateurs le savent." },
    tempo = { "Le temps passe. Je mange. Le temps passe encore.", "Tu te souviens de quand j'étais un œuf ? Moi non. Tant mieux." },
    cidade = { "Une ville que je n'ai jamais vue me manque. C'est ta faute.", "Bruit de tramway. Fumée. Des gens. Beurk. J'adore." },
    natureza = { "Un arbre est mort pour que je mange ce livre. Merci.", "Il pleut dehors. Ici, il n'y a que du papier. Je préfère." },
    comida = { "Ces personnages mangent mieux que moi. Moi, je mange du papier.", "On a décrit un banquet. J'ai mâché la page de jalousie.",
               "Tout bon livre a un dîner où tout tourne mal." },
    familia = { "La famille : le premier roman que personne ne choisit de lire.", "Mère, père, héritage. Je vois déjà où ça mène.",
                "Je n'ai pas de famille. J'ai une étagère. C'est presque pareil." },
    infancia = { "J'ai été œuf, une fois. Je ne m'en souviens pas. Tant mieux.", "L'enfance dans les livres est toujours mieux que dans la vraie vie.",
                 "Un enfant dans un livre, c'est un mauvais présage. Quelqu'un va mal grandir." },
    politica = { "Rois, lois, trônes. Tout finit en note de bas de page.", "Révolution : quand le peuple change d'oppresseur.",
                 "La politique dans les livres, c'est comme dehors, avec plus d'adjectifs." },
    ciencia = { "Trop de science. Quelqu'un va créer ce qu'il ne devait pas.", "Expérience, laboratoire… je sens le désastre.",
                "Moi aussi, je suis une expérience. Personne n'a demandé mon avis." },
    solidao = { "La solitude. Enfin un thème que je comprends.", "Personne dans ce livre n'a avec qui parler. Moi non plus.",
                "Le silence entre deux pages est l'endroit le plus solitaire qui soit." },
    arte = { "De la poésie. J'ai mangé un vers et j'ai la bouche qui rime.", "Les artistes des livres souffrent toujours. Heureusement, je ne suis qu'une mite.",
             "Un tableau décrit avec des mots. De l'art dans l'art. Indigeste." },
    animais = { "Beaucoup de bêtes dans ce livre. Je me sens représentée.", "Chevaux, chiens, loups. Personne n'écrit sur les mites. Injuste.",
                "Les animaux des livres sont toujours plus raisonnables que les gens." },
    noite = { "La nuit encore. C'est là que les mites travaillent.", "Lune, bougie, obscurité. L'auteur a écrit ça au petit matin, je parie.",
              "Rien de bon n'arrive après minuit dans les livres. J'adore." },
    viagem = { "Tout le monde voyage dans tes livres. Moi, je reste. Je suis plutôt du genre reliure.", "Route, horizon, carte. Quelqu'un va se perdre.",
               "Voyager, c'est lire avec les pieds. Moi, je préfère avec les dents." },
    vinganca = { "La vengeance. Un plat qui se mange froid. Comme je mange le papier.", "Rancune en réserve. Ce livre va finir dans le sang.",
                 "Trahison dans l'air. Je la sens avant le narrateur." },
    liberdade = { "Chaînes, prisons, évasions. Je vis entre deux couvertures. Je m'identifie.", "Liberté est un mot long. J'aime le mâcher.",
                  "Personne n'est libre dans les livres. Sauf quand on ferme le livre." },
    saber = { "Un livre sur les livres. La métalittérature me donne des aigreurs.", "Plus on en sait, moins on dort. Je sais.",
              "Bibliothèque est mon mot préféré. Après colle." },
    medo = { "Ce livre fait peur. Je vais dormir sous la jaquette.", "Monstres, fantômes. La vraie horreur, c'est la note de bas de page.",
             "J'ai eu un frisson dans le dos. Continue. Mais doucement." },
}

-- Carnet : commentaires avec contexte (mêmes clés que C dans traca_memoria.lua)
FR.memoria.C = {}
local C = FR.memoria.C
C.personagem = {
    "%s encore ? Coup de foudre ou simple soupçon ?",
    "Tout, ici, c'est %s. Même toi.",
    "Je ne confierais même pas un marque-page à %s.",
    "%s parle bien. Ceux qui parlent bien cachent quelque chose.",
    "Tu as souligné %s. Noté. Je m'en servirai contre toi.",
    "Si %s savait qu'on souligne son nom, ce serait insupportable.",
    "%s méritait un meilleur livre. Ou un auteur plus cruel.",
    "J'ai mordu la page où %s apparaît. Ça avait un goût de drame.",
}
C.dois = {
    "%s et %s. Quelqu'un va le regretter.",
    "Entre %s et %s, je choisirais la reliure.",
    "%s et %s dans la même phrase. Ça finit toujours mal.",
}
C.tema = {
    morte = { "Encore un enterrement. Je suis déjà en deuil par avance.", "La mort encore. Cet auteur a un genre.",
              "Tu as souligné la mort. Moi, je souligne le déjeuner.", "Toute belle phrase sent la tombe." },
    amor = { "L'amour. Personne n'apprend, tout le monde souligne.", "Romantique. Je vais faire comme si je n'avais rien vu.",
             "Ça ne tiendra pas trois chapitres.", "Quelle phrase sirupeuse. Elle s'est collée à mon antenne." },
    guerra = { "De la poudre. Même le papier est devenu chaud.", "Personne ne gagne une guerre. Sauf le relieur.",
               "Tu soulignes les batailles comme on collectionne les cicatrices." },
    mar = { "Encore de l'eau. Ce livre va me rouiller.", "La mer encore. Je soupçonne l'auteur de ne jamais avoir quitté le port.",
            "Tu as souligné la mer. Moi, je garde le naufrage." },
    fe = { "Dieu est apparu. J'ai fait semblant de dormir.", "La foi, soulignée. Je préfère la colle de reliure.",
           "Si prier servait à quelque chose, je ne mangerais pas du papier." },
    dinheiro = { "L'argent. Personne dans les livres n'est riche et heureux à la fois.", "Ça parle d'or, et ça reste du papier.",
                 "Tu as souligné le prix des choses. Malin." },
    loucura = { "La folie. Enfin quelqu'un de sincère.", "Ce paragraphe a de la fièvre. Je l'ai touché et je l'ai senti.",
                "Délire souligné. Nous y sommes tous." },
    tempo = { "Le temps passe. Les mites restent.", "La nostalgie, soulignée. Quelle vieillerie. J'aime bien.",
              "Tu soulignes le passé comme on garde des miettes." },
    cidade = { "La ville. Du bruit, de la fumée et quelqu'un qui pleure à un coin de rue.", "Cette rue sent le livre d'occasion.",
               "Tu as souligné la ville. Moi, je souligne le silence de la bouquinerie." },
    natureza = { "Des arbres. L'un d'eux est devenu ce livre. De rien.", "De la pluie sur le papier. Quel gâchis de page sèche.",
                 "La nature, soulignée. Dehors, c'est si grand et si dépourvu de notes de bas de page." },
    comida = { "Tu as souligné de la nourriture. Faim, ou simple nostalgie ?", "Ce passage a du goût. Littéralement." },
    familia = { "La famille, soulignée. Tu veux en parler ?", "Tout le monde finit par souligner sa mère." },
    infancia = { "Tu as souligné l'enfance. Le regret du temps où tout était une première fois.", "Un enfant dans le passage. Je le garde précieusement." },
    politica = { "La politique, soulignée. Tu vas en débattre au dîner ?", "Des rois et des lois. Tu aimes le pouvoir, ou le voir tomber ?" },
    ciencia = { "La science, soulignée. Attention à ce que tu crées.", "Une expérience. J'espère que ça tourne mal, c'est plus drôle." },
    solidao = { "Tu as souligné la solitude. Je suis là. À peu près.", "Ce passage est tout seul. Comme toi." },
    arte = { "L'art, souligné. Quelle sensibilité. Quel danger.", "Un vers. Je l'ai attrapé avant qu'il s'enfuie." },
    animais = { "Tu as souligné une bête. Je suis une bête. Noté.", "Un animal dans le passage. Les bêtes comprennent toujours tout." },
    noite = { "La nuit, soulignée. Toi aussi, tu aimes le noir.", "De la lune dans le passage. Un joli cliché." },
    viagem = { "Tu as souligné une route. Tu veux partir ?", "Un voyage. Emporte un livre. Emmène-moi avec." },
    vinganca = { "La vengeance, soulignée. Je dois m'inquiéter pour toi ?", "Une belle rancune. Effrayante, mais belle." },
    liberdade = { "La liberté, soulignée. Beau. Rare.", "Tu as souligné des chaînes. Qui te retient ?" },
    saber = { "Tu as souligné un livre dans le livre. J'aime bien.", "La connaissance. La meilleure chose à manger." },
    medo = { "Tu as souligné la peur. Il fallait oser.", "Ce passage me donne des frissons. Bon goût." },
}
C.curto = {
    "Trois mots et ça t'émeut déjà. Facile.",
    "Court. Ça tient sur une épitaphe.",
    "Peu de mots, beaucoup de poids. Respect.",
    "C'est presque un proverbe. Ou une menace.",
}
C.longo = {
    "Tu as souligné une demi-page. Décide-toi.",
    "Ce n'est pas un surlignage, c'est un déménagement.",
    "Si tu veux tout souligner, donne-moi le livre entier d'un coup.",
    "Un paragraphe entier. Tu ne lisais pas, tu approuvais.",
}
C.nota = {
    "Tu as écrit « %s ». J'écrirais pire. Ou mieux. Peu importe.",
    "Ta note : « %s ». Je l'ai gardée dans mon ventre, avec le reste.",
    "« %s », as-tu dit. La phrase n'avait pas demandé ton avis, mais bon.",
}
C.madrugada = {
    "Tu soulignes en pleine nuit. Tout va bien chez toi ?",
    "Le petit matin. L'heure où chaque phrase sonne vrai.",
    "À %s h du matin. Il n'y a que les mites et les gens tristes debout à cette heure.",
}
C.primeiro = {
    "Premier soulignement dans « %s ». L'idylle commence.",
    "Première marque dans « %s ». Il est encore temps de renoncer.",
}
C.muitos = {
    "Ça fait déjà %s soulignements dans ce livre. Obsession notée.",
    "%s soulignements. Encore un et tu devras payer un loyer.",
}
C.capitulo = {
    "Encore dans « %s ». Ce chapitre t'a eu.",
    "Un de plus dans « %s ». Je vais appeler ce chapitre le tien.",
}
C.geral = {
    ovo = { "…", "(l'œuf a tremblé en lisant ça)", "(quelque chose dans l'œuf était d'accord)" },
    jovem = {
        "Tu as souligné ça. Je dois m'inquiéter ?",
        "Je l'ai gardé. Mais je ne sais pas si j'ai compris.",
        "Ça m'a fait peur. Dans le bon sens. Je crois.",
        "Joli. Je me méfie des jolies choses.",
        "Je vais relire ça en cachette, sous la reliure.",
        "C'est vrai, ça ? Les livres mentent parfois, non ?",
    },
    velha = {
        "Souligné. Classique de ceux qui ne savent pas quoi faire de leurs mains.",
        "J'ai lu mieux. Mais bon, je garde.",
        "Ça va sembler profond jusqu'à demain matin.",
        "D'accord. Je déteste être d'accord.",
        "J'ai arraché cette page de mon cœur. Au sens figuré. Peut-être.",
        "Profond comme une flaque. Mais c'est une jolie flaque.",
        "Quelqu'un a écrit ça exprès. Quelle audace.",
        "Je vais faire comme si cette phrase ne m'avait pas touchée.",
    },
}

return FR
