--[[--
Lot 2 de phrases (français). Chaque liste ici s'ajoute à la liste de même nom du module
(Lingua.anexar) : estado, contexto et memoria. Mêmes gabarits que les listes d'origine :
  FALAS_LIVRO / FALAS_PERSONAGEM : %s · FALAS_MUDA_PERTO : %d · contexte : {n} {hora} {livro} {pct}
  FALAS_NOVO / FALAS_SUMIU : %s · FALAS_VIROU : %s %s (déjà avec "de la/du") · C.personagem / nota /
  primeiro / muitos / capitulo : %s · C.dois : %s %s · FALAS_CITACAO : {nome} {fala} ·
  FALAS_REFERENCIA : {nome} {n}
{gosto} et {cheiro} incluent déjà "de"/"d'" : "un goût {gosto}", "une odeur {cheiro}".
Ne jamais parler du lecteur avec un adjectif genré.
]]

local X = { estado = { FALAS = { ovo = {}, jovem = {}, velha = {} } }, contexto = {}, memoria = { C = {} } }
local E, M, C = X.estado, X.memoria, X.memoria.C

-- Estado : paroles du quotidien ---------------------------------------------------------
E.FALAS.ovo._todas = {
    "(l'œuf a roulé d'un millimètre vers le livre)",
    "(là-dedans, quelqu'un a mâchonné quelque chose)",
    "(l'œuf est plus chaud près des pages)",
    "(une fissure minuscule est apparue et a disparu)",
    "(l'œuf a soupiré. Les œufs soupirent-ils ?)",
    "(quelque chose a frappé la coquille trois fois : toc, toc, toc)",
    "(l'œuf a l'air de lire en même temps)",
    "(silence. Un silence qui juge.)",
}
E.FALAS.jovem.feliz = {
    "Aujourd'hui le papier était croustillant juste comme il faut.<dominio: Avec un petit arrière-goût {gosto}.|>",
    "Je crois que j'ai compris une blague de l'auteur. J'ai ri toute seule.",
    "J'ai si bien mangé que j'ai oublié d'avoir peur.<medrosa: Pendant cinq minutes.|>",
    "Si le bonheur avait une odeur, ce serait celle de la colle fraîche.",
    "Je suis tellement pleine que je vais lire allongée.",
    "Aujourd'hui aucun personnage n'est mort. Du moins pas près de moi.",
    "Un chapitre entier sans frayeur. Quel luxe.",
    "J'ai tellement aimé que j'ai relu la même page. Deux fois. En mangeant.",
}
E.FALAS.jovem.normal = {
    "Les lettres ont-elles des chatouilles quand je passe ?",
    "J'ai trouvé une tache de café dans la marge. Quelqu'un a vécu ici.",
    "Si je rassemble toutes les virgules que j'ai mangées, ça fait une phrase ?",
    "Aujourd'hui j'ai essayé de lire la tête en bas. Je déconseille.",
    "Combien de pages tiennent dans une mite ? Je teste.",
    "La table des matières, c'est la carte. Moi, je suis l'exploratrice<medrosa: qui reste au campement|>.",
    "Parfois je crois que je suis un personnage secondaire de ma propre vie.",
    "J'ai lu le mot « fin » et j'ai paniqué. C'était juste un chapitre.",
    "Les notes de bas de page chuchotent. J'entends tout.",
    "J'aime le bruit de la page qui se tourne. On dirait <medrosa:un pas dans le couloir|romantica:quelqu'un qui soupire|le vent qui appelle>.",
}
E.FALAS.jovem.triste = {
    "Mon ventre gargouille plus fort que mon envie de râler.",
    "J'ai léché la couverture. Elle avait juste un goût {gosto|de poussière}.",
    "Si je m'évanouis, ranime-moi avec une préface.",
    "Je suis si faible qu'une virgule me renverserait.",
    "J'ai rêvé d'un banquet de dictionnaires. Je me suis réveillée affamée.",
    "J'ai fixé le dos du livre comme on fixe un frigo vide.",
    "Tu te souviens que j'existe ? Moi, je me souviens que tu existes.",
    "Une phrase. Une demi-phrase. Un point-virgule. N'importe quoi.",
    "Le silence de l'étagère me rend <medrosa:toute frissonnante|triste>.",
    "Je promets de ne pas critiquer le livre. Donne-m'en juste un.",
}
E.FALAS.jovem.casulo = {
    "Je me suis enroulée dans le dos du livre. Ici personne ne me voit. Toi non plus.",
    "Cachée. Frappe trois fois sur la page et je sors.",
    "Ici, ça sent le livre oublié. J'ai peur.",
    "Je me suis fait un nid avec les coins cornés. Reviens vite.",
    "Je suis en grève de la faim. Pas par choix.",
    "Je me suis cachée parce que j'en avais marre d'attendre debout.",
    "Je ne sors que quand j'entends une page se tourner.",
    "Il fait noir ici, mais au moins il n'y a pas de méchant.",
}
E.FALAS.jovem.repouso = {
    "Zzz… je rêve que j'étais <corajosa:une épée en papier|romantica:un billet doux|{coisa|un marque-page}>…",
    "Zzz… les lettres dansent… <romantica:une valse…|medrosa:autour de moi…|>",
    "Zzz… j'ai mangé un nuage de papier… <otimista:il avait un goût de soleil…|>",
}
E.FALAS.velha.feliz = {
    "Une bonne page. Je vais garder le goût<dominio: {gosto}|> jusqu'à demain.",
    "Aujourd'hui la littérature a fonctionné. N'en parle à personne.",
    "Comblée comme quelqu'un qui aurait trouvé une première édition.",
    "Même ma cigarette imaginaire est de bonne humeur.",
    "Le monde est toujours nul, mais la prose était bonne.",
    "J'ai bien mangé. Je vais être gentille pendant un quart d'heure.",
    "Quel paragraphe. J'ai presque pardonné à l'auteur tous les autres.",
    "Le bonheur, pour une mite, c'est du bon papier et <noturna:les petites heures|erudita:une note de bas de page|du silence>.",
}
E.FALAS.velha.normal = {
    "J'ai vu tant de fins que je ne lis plus que les milieux.",
    "Chaque génération croit avoir inventé la souffrance. Les livres rient.",
    "Une bibliothèque bien rangée est un cimetière classé par ordre alphabétique.",
    "Lire, c'est <romantica:tomber amoureux lentement|cinica:se méfier par écrit|contredire à petit feu>.",
    "L'auteur est mort. Sa virgule est toujours vivante. Justice poétique.",
    "<otimista:J'aime les livres qui me plaisent d'emblée. Sans honte.|Je me méfie des livres qui me plaisent d'emblée.>",
    "Les meilleures histoires sont celles que personne ne pense à recommander.",
    "Vieillir, c'est changer d'avis sans l'admettre.",
    "Le papier supporte tout. Pas les mites.",
    "Les relectures sont comme les vieux amis : pénibles et nécessaires.",
}
E.FALAS.velha.triste = {
    "La faim et la lucidité. Je préfère la faim seule.",
    "Une vieille mite sans livre, c'est une virgule sans phrase.",
    "J'ai mangé ma propre patience. Il n'en reste rien.",
    "J'ai eu des bibliothèques. Aujourd'hui, il me reste la nostalgie.",
    "Je dépéris avec élégance. Au moins ça.",
    "Même la colle du dos a perdu son goût.",
    "On m'a laissée dans le noir avec mes pensées. Fort mauvaise compagnie.",
    "La faim ancienne est la pire : elle a de la mémoire.",
    "Une page, par charité. Ou par littérature.",
    "Je suis aussi vide que la préface d'un auteur célèbre.",
}
E.FALAS.velha.casulo = {
    "Retirée dans le dos du livre. Préviens-moi quand le monde se remettra à lire.",
    "Je me suis cachée. Pas par peur : par principe.",
    "Ici, le silence est mieux écrit que bien des livres.",
    "J'hiberne. C'est ce que font les mites quand on les ignore.",
    "N'insiste pas. Lis. C'est la seule clé.",
    "J'ai fait du dos du livre un monastère. Vœu de faim.",
    "Je suis en retraite spirituelle involontaire.",
    "Je reviens quand tu ouvres un livre. Pas avant.",
}
E.FALAS.velha.repouso = {
    "Zzz… je rêve d'une librairie d'occasion <romantica:et d'un vieil amour qui s'y cache|sans clients>…",
    "Zzz… je relis ma propre épitaphe… <otimista:elle est belle…|medrosa:trop tôt…|>",
    "Zzz… un feu follet en papier… <medrosa:qui me suit…|>",
}
E.FALAS_LIVRO = {
    jovem = {
        "« %s » fait du bruit quand je mords. C'est bon signe ?",
        "J'ai gardé un petit morceau de « %s » pour plus tard.",
        "La fin de « %s » est-elle heureuse ? <otimista:Je parie que oui.|amarga:J'en doute.|Rien que d'y penser, je panique.>",
        "« %s » sent <medrosa:la cave|romantica:la lettre gardée|l'aventure>. Ou la vieille étagère.",
        "J'ai parlé de « %s » à mes antennes. Elles ont aimé.",
        "« %s » m'a donné soif de plus de pages.",
    },
    velha = {
        "« %s ». J'ai vu des couvertures plus honnêtes.",
        "Je mâchouille « %s » avec la patience de qui a tout lu.",
        "« %s » a des prétentions. <erudita:Bien fondées, je l'admets.|popular:Trop de prétention à mon goût.|Parfois ça suffit.>",
        "Le problème de « %s », c'est que ce livre sait qu'il est bon.",
        "Je ne dirai du mal de « %s » qu'après l'avoir fini. Justice.",
        "« %s » me rappelle un autre livre. Meilleur. Mais ça me le rappelle.",
    },
}
E.FALAS_PERSONAGEM = {
    jovem = {
        "Chaque fois que %s apparaît, <romantica:je soupire|corajosa:je deviens plus attentive|je retiens mon souffle>.",
        "Je me demande si %s sait que je suis en train de lire ?",
        "J'ai dessiné %s dans la marge. C'est moche.",
        "%s, du courage ou de l'inconscience ? Je ne sais jamais.",
        "J'aimerais être amie avec %s. <medrosa:Ou m'enfuir. M'enfuir, je crois.|Ou m'enfuir. Peu importe.>",
        "%s me rappelle quelqu'un que je n'ai pas encore rencontré.",
    },
    velha = {
        "%s est du genre à poser sa tasse sur le livre.",
        "J'ai déjà vu %s dans mille livres, mais sous un autre nom.",
        "%s a la profondeur <romantica:d'un puits. J'y ai plongé, amoureuse|d'une note de bas de page>.",
        "Je ne fais pas confiance à %s. <romantica:Mensonge : si. Voilà, j'ai avoué.|Ni à ceux qui lui font confiance.>",
        "%s va le regretter. Question de chapitre.",
        "Si %s était un livre, je le laisserais en plan à mi-chemin.",
    },
}
E.FALAS_MUDA_PERTO = {
    jovem = {
        "%d pages avant la peau neuve. Je répète déjà ma tête de surprise.",
        "Plus que %d pages. Ma vieille peau commence à me serrer.",
        "Dans %d pages je grandis. J'espère tenir encore dans la reliure.",
    },
    velha = {
        "%d pages avant une nouvelle mue. J'ai perdu le compte des carapaces.",
        "Plus que %d pages. La peau neuve durera plus longtemps que ma patience.",
        "Dans %d pages je change de peau. Pas d'avis.",
    },
}
E.FALAS_MUDA_IMINENTE = {
    ovo = { "(la coquille est toute fine maintenant)", "(quelque chose, là-dedans, s'impatiente)", "(l'œuf a vraiment bougé)" },
    jovem = { "Je vais bientôt sortir de moi-même !", "Encore une page et je deviens une autre !", "J'ai des chatouilles sur toute la peau." },
    velha = { "La vieille peau demande déjà sa retraite.", "Encore un peu et je change. À l'extérieur.", "La carapace cède. Comme tout." },
}

-- Contexte : données de la lecture ------------------------------------------------------
X.contexto.madrugada = {
    jovem = { "{hora}. Si on fait silence, les fantômes du livre ne se réveillent pas.",
              "Tu lis à {hora} ? Je reste éveillée avec toi.<medrosa: Main dans la main, si possible.|>", "{hora}. Les lettres ont sommeil, mais moi, <diurna:aussi. Je bâille…|non>." },
    velha = { "{hora}. L'horaire officiel des lecteurs incorrigibles.", "Il est {hora}. <noturna:La meilleure heure du monde.|L'insomnie et le livre se méritent.>",
              "{hora}. Même les méchants dorment. <medrosa:Espérons-le.|Pas toi.>" },
}
X.contexto.recorde = {
    jovem = { "{n} pages ! Personne ne m'a jamais donné autant à manger en un jour !", "Record : {n} pages. Je vais compter jusqu'aux virgules.",
              "{n} pages aujourd'hui. Mon ventre veut faire un discours." },
    velha = { "{n} pages. Nouveau record. Je l'enregistre avec méfiance.", "Record de {n} pages. Tu vas bien ?",
              "{n} pages en un jour. Ce n'est pas de la lecture, c'est un changement de vie." },
}
X.contexto.maratona = {
    jovem = { "{n} pages ! <corajosa:On en fait cinquante de plus ?|Je peux faire une sieste dans le livre ?>", "Déjà {n} pages. Je roule le long de l'étagère.",
              "{n} pages… mon ventre est gros comme un dictionnaire." },
    velha = { "{n} pages. <erudita:Même Tolstoï demanderait une pause.|La littérature remercie. Le dos, non.>", "{n} pages aujourd'hui. Même moi je suis fatiguée, et je ne fais que manger.",
              "{n} pages. Souviens-toi qu'il existe une vie hors du livre. Paraît-il." },
}
X.contexto.sumiu = {
    jovem = { "{n} jours ! <medrosa:J'ai cru qu'il t'était arrivé quelque chose.|J'ai cru que tu m'avais oubliée pour de bon.>", "Te revoilà après {n} jours. <romantica:Tu m'as tellement manqué. Et j'ai eu faim aussi.|cinica:Je vais faire semblant de ne pas avoir remarqué.|Tu m'as manqué. Et j'ai eu faim.>",
              "{n} jours sans papier. Je comptais <erudita:les citations de tête|les fibres de la couverture>." },
    velha = { "{n} jours. <romantica:Je les ai tous comptés.|Je vais faire semblant de ne pas avoir compté.>", "<dominio:Après {n} jours, l'étagère a pris une odeur {cheiro}.|Après {n} jours, l'étagère avait un air de musée.>",
              "{n} jours sans lire. J'espère que ça en valait la peine. <otimista:Je parie que oui.|J'en doute.>" },
}
X.contexto.tarde = {
    jovem = { "{hora}. Il y a encore le temps pour un chapitre. Et un autre.", "Il est {hora}. Je bâille, tu tournes la page.",
              "{hora} et le livre est encore ouvert. J'aime ça." },
    velha = { "{hora}. Le jour est fini, pas la lecture.", "Il est {hora}. Heure idéale pour les livres et les mauvaises décisions.",
              "{hora}. Personne ne lit à cette heure par obligation." },
}
X.contexto.cedo = {
    jovem = { "{hora} ! Le soleil vient à peine de se lever et tu lis déjà. <diurna:C'est mon heure !|>", "Bonjour ! À {hora}, les pages sentent la rosée.",
              "{hora}. Du café pour toi, du papier pour moi." },
    velha = { "{hora}. De la lecture avant que le monde se mette à dire des bêtises.", "Il est {hora}. <noturna:Drôle d'heure pour être debout.|La meilleure heure du jour : personne ne dérange.>",
              "{hora}. Lire tôt, un luxe que peu s'offrent." },
}
X.contexto.sessao = {
    jovem = { "{n} pages sans te lever ! Tes pieds vont bien ?", "Déjà {n} pages d'affilée. J'ai la tête qui tourne à force de manger.",
              "{n} pages d'un coup. Ce livre t'a collé à lui." },
    velha = { "{n} pages sans pause. Le livre doit être bon. Ou tu fuis quelque chose.", "{n} pages d'affilée. Respect. Mais cligne des yeux.",
              "Une séance de {n} pages. Les anciens copistes approuveraient." },
}
X.contexto.sequencia = {
    jovem = { "{n} jours d'affilée ! <romantica:Je crois qu'on est devenus un couple.|Je crois qu'on est devenus une routine.>", "Jour {n} d'affilée. Mon ventre connaît déjà l'heure du repas.",
              "{n} jours sans en sauter un seul ! <medrosa:Je peux organiser une fête ? Une petite ?|Je peux organiser une fête ?>" },
    velha = { "{n} jours d'affilée. La discipline est le vice le plus élégant.", "Jour {n}. Constance. Rare et ennuyeuse. J'aime.",
              "{n} jours sans faillir. <otimista:Tu iras loin.|Ne gâche pas tout maintenant.>" },
}
X.contexto.bom_dia = {
    jovem = { "{n} pages aujourd'hui. Je grandis pour de vrai !", "J'ai déjà mangé {n} pages aujourd'hui et j'en veux encore.",
              "{n} pages aujourd'hui. Une bonne journée pour être mite.<dominio: Petite odeur {cheiro} dans l'air.|>" },
    velha = { "{n} pages aujourd'hui. Correct. Noté.", "{n} pages. La journée n'a pas été gâchée.",
              "{n} pages aujourd'hui. On peut déjà avoir un avis." },
}
X.contexto.nada_hoje = {
    jovem = { "Rien aujourd'hui. Pas même un paragraphe.", "Aucune page aujourd'hui. Je regarde le livre fermé.",
              "La journée est passée et j'ai gardé faim d'histoire." },
    velha = { "Aucune page aujourd'hui. L'étagère l'a remarqué.", "Aujourd'hui : zéro. Le livre est vexé.",
              "Une journée entière sans lire. Quel gâchis de lumière." },
}
X.contexto.reta_final = {
    jovem = { "{pct} de « {livro} » ! Presque au bout. Je suis nerveuse.", "Il reste peu de « {livro} ». Je vais manger lentement.",
              "Dernière ligne droite de « {livro} ». Je promets de ne pas pleurer. Peut-être." },
    velha = { "{pct} de « {livro} ». Maintenant l'auteur ne peut plus se défiler.", "Dernière ligne droite de « {livro} ». Prépare ton cœur. Et ta cigarette.",
              "Presque à la fin de « {livro} ». Les fins révèlent qui est l'auteur." },
}
X.contexto.metade = {
    jovem = { "La moitié de « {livro} » ! Maintenant c'est la descente, non ?", "On est au milieu de « {livro} ». Et maintenant ?",
              "La moitié de « {livro} » et j'ai déjà des théories." },
    velha = { "La moitié de « {livro} ». Le moment où le livre décide s'il vaut quelque chose.", "Au milieu de « {livro} ». L'intrigue est prête à s'effondrer.",
              "La moitié de « {livro} ». C'est là que les auteurs se fatiguent d'habitude." },
}
X.contexto.comeco = {
    jovem = { "Je commence « {livro} » ! Je ne sais pas encore qui aimer.", "Premières pages de « {livro} ». J'ai l'œil sur tout le monde.",
              "« {livro} » a commencé. J'aime déjà son odeur." },
    velha = { "Le début de « {livro} ». Tout livre jure qu'il sera différent.", "Premières pages de « {livro} ». Je suis encore polie.",
              "« {livro} » a commencé. Voyons combien de temps tiendra ma patience." },
}
X.contexto.fim_de_semana = {
    jovem = { "Un week-end avec un livre, c'est le meilleur des week-ends.", "Sans hâte, sans école, juste du papier.", "Aujourd'hui on peut lire tard, non ?" },
    velha = { "Week-end. Le monde se repose, l'étagère travaille.", "Congé du monde, permanence de lecture.",
              "Un week-end à lire. Civilisation préservée." },
}

-- Mémoire : chapitres, thèmes, Carnet ---------------------------------------------------
M.FALAS_EVENTO = {
    morte = { "Encore un qui est parti. La page est devenue plus lourde.", "Il y a eu une mort. J'ai porté le deuil trois paragraphes." },
    casamento = { "Ils se sont mariés. Je note au calendrier combien de chapitres ça dure.", "Cloches, voile, promesses. J'ai déjà vu ce film." },
    viagem = { "Valises faites dans le chapitre. Moi, je reste dans le dos du livre.", "Quelqu'un est parti. Le livre est devenu plus grand." },
    carta = { "Une lettre. Quelqu'un va pleurer ou mentir.", "Dans les livres, les lettres n'arrivent jamais au bon moment." },
    tempestade = { "Il a plu tout le chapitre. Je suis humide de suspense.", "Éclair, vent, drame. Le ciel de l'auteur était nerveux." },
    doenca = { "Maladie dans le chapitre. Les livres adorent une fièvre.", "Quelqu'un est alité. Je lirai plus lentement, par respect." },
    festa = { "Fête dans le chapitre. Quelqu'un va en sortir en le regrettant.", "De la musique et des coupes. Je me méfie de tant de joie." },
    briga = { "Ils se sont violemment disputés. Au moins on sait ce qu'ils pensent.", "Dispute dans le chapitre. Je prendrais parti. Pour moi." },
    fuga = { "Quelqu'un s'est enfui en douce, entre deux lignes.", "Fuite dans le chapitre. Parfois c'est la seule sortie digne." },
    crime = { "Crime dans le chapitre. Je mangeais l'index, je le jure.", "Il y a eu du sang. Le livre s'est réveillé, moi aussi." },
}
M.FALAS_NOVO = { "Arrivée de %s. Je vais observer de loin.", "%s vient d'entrer dans l'histoire sans frapper.",
                 "Nouveau visage : %s. Je n'ai pas encore décidé si je mords.", "%s fait son apparition. Les livres amènent toujours du monde au mauvais moment." }
M.FALAS_SUMIU = { "Aucun signe de %s. Il faudrait aller voir.", "%s a disparu du chapitre. Coïncidence ? J'en doute.",
                  "%s m'a manqué. Ne le répète à personne.", "Chapitre sans %s. Le livre a respiré autrement." }
M.FALAS_AZEDOU = { "Le chapitre s'est soudain assombri.", "C'est devenu lourd. Même la colle pesait.",
                   "Ce chapitre a un goût de mauvaise nouvelle.", "Tout est devenu gris. Ça va avec le papier." }
M.FALAS_ADOCOU = { "Un chapitre gentil. Je me méfie, mais j'en profite.", "Le livre a souri dans ce chapitre.",
                   "Il y a eu de la légèreté. J'en ai gardé un peu pour les mauvais jours.", "Chapitre doux. Quelque chose de mal arrive, je parie." }
M.FALAS_VIROU = { "Ce chapitre en a eu assez %s et s'est mis à parler %s.", "L'auteur s'est lassé %s et est passé à parler %s." }

M.FALAS_TEMA = {
    morte = { "Après tant d'enterrements, j'ai appris à lire en noir.", "La mort est le seul spoiler que tous les livres racontent." },
    amor = { "L'amour dans les livres est meilleur que le vrai : il est relu et corrigé.", "J'ai lu tant d'amour que je me méfie des câlins." },
    guerra = { "Les guerres des livres finissent à la dernière page. Les autres, non.", "Beaucoup de poudre. Même mon papier est devenu nerveux." },
    mar = { "Je rêve de vagues en papier.", "Je sens le roulis du navire même quand la page s'arrête." },
    fe = { "J'ai prié pour une fin heureuse. Personne n'a répondu.", "S'il existe un ciel, j'espère qu'il a une bibliothèque." },
    dinheiro = { "Dans les livres, ceux qui ont de l'argent ont de meilleurs problèmes.", "J'ai compté des pièces tout le chapitre. Aucune n'était à moi." },
    loucura = { "La folie des livres me paraît de plus en plus sensée.", "Certains jours, je parle aux virgules." },
    tempo = { "Le temps passe vite dans les livres. Dehors aussi, mais sans table des matières.", "J'ai pris un chapitre de vieux aujourd'hui." },
    cidade = { "Une odeur de rue mouillée sur le papier.", "Tant de monde dans les villes des livres, et personne ne lit." },
    natureza = { "Une feuille d'arbre dans le livre. Une feuille de papier dans ma bouche.", "Les livres m'ont appris le nom de plantes que je ne verrai jamais." },
    comida = { "Je lis des dîners et je mâche du papier. Injustice gastronomique.", "Un livre avec de la nourriture me donne deux fois plus faim." },
    familia = { "Toute famille de livre a un secret dans le garde-manger.", "La famille : l'intrigue que personne ne choisit et que tout le monde lit." },
    infancia = { "Les enfants des livres savent des choses que les adultes oublient.", "Je me souviens d'avoir été nymphe. Mensonge, non, je ne me souviens pas." },
    politica = { "Couronnes, lois et discours. Tout n'est que papier.", "Les puissants des livres finissent toujours par tomber. Heureusement que ce sont des livres." },
    ciencia = { "Trop d'expériences. Un jour quelqu'un fera une mite géante.", "La science des livres explose beaucoup." },
    solidao = { "La solitude des personnages me tient compagnie.", "Si seuls dans les livres. Moi, je suis si bien accompagnée." },
    arte = { "Un tableau décrit en mots peint ma tête.", "Les artistes des livres souffrent joliment." },
    animais = { "Les bêtes des livres sont plus sages que leurs maîtres.", "Un cheval dans le chapitre. J'ai envié ses pattes." },
    noite = { "La nuit des livres est plus noire que la vraie.", "J'aime les chapitres qui se passent au petit matin. Comme nous." },
    viagem = { "J'ai déjà fait le tour du monde sans quitter le dos du livre.", "Valises, trains, navires. Moi, juste des pages." },
    vinganca = { "Dans les livres, la vengeance coûte toujours plus cher que l'offense.", "Une rancune bien écrite est un art dangereux." },
    liberdade = { "Des chaînes de papier. Des chaînes quand même.", "La liberté des livres tient sur une page. La nôtre, non." },
    saber = { "Plus il y a de livres sur les livres, plus j'ai envie de manger des bibliothèques.", "Trop savoir fait grossir. Je sais." },
    medo = { "Ce livre me fait regarder sous la page.", "Des monstres en papier. Je préfère les vrais : ils sont plus lents." },
}

C.tema = {
    morte = { "Tu as encore souligné la mort. Ça va ?", "Phrase de deuil. Je l'ai gardée avec soin." },
    amor = { "Tu as souligné l'amour. J'ai fait semblant de ne pas voir.", "Ça, c'est le fait de quelqu'un qui aime. Ou qui se souvient." },
    guerra = { "Tu as souligné la guerre. Qu'elle reste sur le papier.", "Passage de bataille. Je l'ai gardé sans la poudre." },
    mar = { "Tu as souligné la mer. J'ai senti le sel dans la bouche.", "Vague soulignée. Elle a mouillé la page." },
    fe = { "Tu as souligné une prière. J'en veux une aussi.", "Foi soulignée. Notée avec respect." },
    dinheiro = { "Tu as souligné l'argent. Pratique.", "Des pièces dans le passage. Aucune pour moi." },
    loucura = { "Tu as souligné la folie. On est deux.", "Ce passage est un peu fou. J'aime." },
    tempo = { "Tu as souligné le temps. Il passera quand même.", "De la nostalgie dans le passage. Gardée pour plus tard." },
    cidade = { "Tu as souligné la ville. Bruyante, mais belle.", "Rue soulignée. Odeur de pluie sur l'asphalte." },
    natureza = { "Tu as souligné un arbre. Il te remercie.", "De la nature dans le passage. J'ai mieux respiré." },
    comida = { "Tu as souligné de la nourriture. Maintenant j'en veux.", "Banquet souligné. J'ai mâchouillé la marge." },
    familia = { "Tu as souligné la famille. Il y a quelque chose là-dessous.", "Passage de famille. Gardé sans poser de questions." },
    infancia = { "Tu as souligné l'enfance. Quelle phrase petite et immense.", "Passage d'enfant. Attention à la relecture." },
    politica = { "Tu as souligné le pouvoir. Méfie-toi de lui.", "Passage de roi. Couronne de papier." },
    ciencia = { "Tu as souligné une expérience. Voyons ce que ça donne.", "De la science dans le passage. Odeur de laboratoire." },
    solidao = { "Tu as souligné la solitude. Je me suis blottie tout près.", "Passage solitaire. Maintenant il a de la compagnie : moi." },
    arte = { "Tu as souligné un vers. Il est plus beau souligné.", "De l'art dans le passage. Gardé encadré." },
    animais = { "Tu as souligné une bête. Je t'aime bien.", "Un animal dans le passage. Les bêtes comprennent toujours." },
    noite = { "Tu as souligné la nuit. Ça nous va bien.", "Passage nocturne. J'ai allumé une bougie imaginaire." },
    viagem = { "Tu as souligné un voyage. Emmène-moi.", "Passage de route. J'ai gardé la carte." },
    vinganca = { "Tu as souligné une vengeance. Je dormirai d'un œil.", "De la rancune dans le passage. Notée, par précaution." },
    liberdade = { "Tu as souligné la liberté. Quelle phrase légère.", "Passage sans chaînes. Beau." },
    saber = { "Tu as souligné le savoir. Tu vas le citer à un dîner ?", "Passage savant. Je suis devenue plus cultivée rien qu'en mangeant." },
    medo = { "Tu as souligné la peur. Du courage, ça.", "Passage à frissons. J'ai laissé la lumière allumée." },
}
C.curto = { "Peu de mots, beaucoup de dégâts.", "Court et précis. Comme une morsure.",
            "Ça tient sur un tatouage. Ne le fais pas.", "Petite phrase, grand écho." }
C.longo = { "Tu as souligné tout un paragraphe. Tu es d'accord avec tout ?", "C'est un surlignage ou un chapitre ?",
            "Passage long. Je le digérerai en plusieurs fois.", "Tu as tant souligné que la page est devenue jaune." }
C.nota = { "Tu as noté « %s ». J'aurais noté avec plus de drame.", "« %s » — ta note. Je suis d'accord à moitié.",
           "Tu as écrit « %s ». Je l'ai gardé avec la phrase." }
C.madrugada = { "Souligné au petit matin. Les phrases de la nuit pèsent plus lourd.", "Surlignage fait à %s heures du matin. Gardé avec tendresse.",
                "Petit matin et surligneur. Combinaison dangereuse." }
C.primeiro = { "Le premier surlignage de « %s ». Que la collection commence.", "Première marque dans « %s ». J'aime ton choix.",
               "« %s » a reçu son premier soulignement. Il va se croire important." }
C.muitos = { "%s surlignages dans ce livre. Il est devenu le tien.", "Déjà %s soulignements. Ce livre t'a eu.",
             "%s marques. Bientôt il sera plus simple de souligner ce que tu n'as pas aimé." }
C.capitulo = { "« %s » encore. Ce chapitre est un aimant.", "Un autre surlignage dans « %s ». Ce chapitre te dit quelque chose.",
               "« %s » est plein de tes marques." }
C.personagem = { "%s encore. Ce personnage habite dans ta tête.", "Tu as souligné %s. Ça ne vaut pas tant d'honneur.",
                 "%s dans la phrase. Noté, pour en jaser plus tard.", "Tu aimes %s ou tu as juste pitié ?", "%s. Toujours. Quelle obsession." }
C.dois = { "%s et %s dans le même passage. Ça va faire jaser.", "%s et %s ensemble. Je sais déjà comment ça finit.",
           "Entre %s et %s, je garderais le marque-page.", "%s et %s. Quel duo dangereux." }
C.geral = {
    jovem = { "J'ai gardé ce passage dans la poche de mon ventre.", "C'est beau ou triste ? Les deux ?", "Je vais me répéter ça tout bas avant de dormir.",
              "J'ai pensé à cette phrase. Beaucoup pensé.", "Ce passage a un goût de secret." },
    velha = { "Souligné. Encore une pour la collection de phrases que personne ne relit.", "Ça a des prétentions. J'aime les prétentions bien faites.",
              "Gardé. Dans dix ans ça paraîtra évident.", "Une phrase qui a une vocation d'épigraphe.",
              "D'accord, avec des réserves. Toujours avec des réserves.", "Beau. Et je déteste admettre que c'est beau." },
}
M.FALAS_CITACAO = {
    jovem = { "{nome} a dit « {fala} ». Je l'ai répété à mes antennes.", "J'ai gardé ce que {nome} a dit : « {fala} ».",
              "« {fala} ». C'est {nome} qui l'a dit. J'ai été impressionnée." },
    velha = { "« {fala} », a dit {nome}. Moi, j'aurais édité.", "{nome} a lâché un « {fala} ». Noté, avec méfiance.",
              "Je digère encore « {fala} », de {nome}." },
}
M.FALAS_REFERENCIA = {
    jovem = { "{nome} encore ! Je vais chercher qui c'est. Non, je ne le ferai pas.", "Le livre a déjà parlé de {nome} {n} fois. Dois-je m'inquiéter ?" },
    velha = { "{n} citations de {nome}. L'auteur voulait paraître cultivé.", "{nome}, encore une fois. On a compris que tu as lu, cher auteur." },
}

return X
