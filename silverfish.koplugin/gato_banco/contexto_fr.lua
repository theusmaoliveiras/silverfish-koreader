--[[--
Chat des Cendres : répliques tirées de ta lecture (français). Même format et mêmes déclencheurs que
traca_contexto.lua (la Mite), par stade du chat : filhote (chaton), adulto, velho. Même ordre que contexto_pt.lua.

Gabarits : {hora} ("2h13"), {n} (pages ou jours), {livro}, {pct} ("93%") ; <polo:…|…> choisit selon le caractère ;
{cheiro|…} est un mot du monde du livre, préposition comprise (traca_voz.lua). Le chat est au masculin ;
jamais d'accord pour le lecteur.
]]

return {
    madrugada = {
        filhote = {
            "Il est {hora}. Grand-mère disait que c'est l'heure la plus sûre. Elle disait aussi d'aller dormir.",
            "{hora} ! Psst. Toute la maison dort et nous, on est là. Quelle émotion.",
            "À {hora}, le noir devient plus grand. Reste près de moi.",
            "{hora}. <noturna:Mon heure préférée !|J'ai sommeil, mais je ne raterai pas ce chapitre.>",
            "Lire à {hora}. Si on demande, on comptait les étoiles.",
        },
        adulto = {
            "{hora}. Moins d'yeux. Bonne garde.",
            "Il est {hora}. Porte verrouillée, lumière basse. Continue.",
            "{hora}. L'heure où les caves travaillaient.",
            "Lecture à {hora}. <medrosa:Je vérifie chaque craquement.|noturna:C'est comme ça qu'on fait.|Personne n'a rien vu. Parfait.>",
            "{hora} et un livre ouvert. Rien de plus clandestin.",
        },
        velho = {
            "{hora}. Grand-mère récitait à cette heure-ci. Maintenant, c'est moi qui écoute.",
            "Il est {hora}. J'ai perdu le compte des nuits blanches. Celle-ci, je la garde.",
            "{hora}. Moustaches blanches et toi qui lis. La bonne paire.",
            "{hora}. À cette heure, les livres parlent plus bas. Moi aussi.",
            "À {hora}, je repense aux caves. Sans fumée, pour une fois.",
        },
    },
    recorde = {
        filhote = {
            "{n} pages aujourd'hui ! Record ! Grand-mère l'aurait raconté à toute la cave.",
            "Jamais autant gardé en un jour : {n} pages. Mon foulard ne ferme plus.",
            "Record de {n} pages ! Mes petites pattes tremblent.",
            "{n} pages ! C'est beaucoup ? Ça a l'air beaucoup. Je suis tout fier.",
            "{n} pages en un jour. Je vais toutes les réciter. Dans l'ordre. Demain, peut-être.",
        },
        adulto = {
            "{n} pages. Record. Archivé avec date et heure.",
            "Nouveau record : {n} pages. Quelqu'un est pressé. Ou en fuite.",
            "{n} pages aujourd'hui. Jamais on n'en a transporté autant en un seul jour.",
            "Record de {n}. Ne le fête pas trop fort. Les murs ont des oreilles.",
            "{n} pages. Grosse opération. Personne n'a rien remarqué.",
        },
        velho = {
            "{n} pages. Record. À mon âge, c'est un événement.",
            "{n} pages aujourd'hui. Plus que bien des caves n'en gardaient en une semaine.",
            "Record : {n}. Je le raconterai aux chatons. À ma façon, qui change.",
            "{n} pages. J'ai vu bien des nuits. Aucune comme celle-ci.",
            "Nouveau record de {n} pages. Les pattes se plaignent ; le reste dit merci.",
        },
    },
    maratona = {
        filhote = {
            "{n} pages aujourd'hui ! Tu ne te fatigues jamais ? Moi, rien qu'à les garder, je fatigue.",
            "Déjà {n} pages. Ma cachette déborde.",
            "{n} pages… <corajosa:Allez, encore un chapitre !|je peux me reposer un peu dans le foulard ?>",
            "{n} pages ! Grand-mère disait : une à la fois. On en a fait plein à la fois.",
            "Tant de pages aujourd'hui : {n}. Je vais devoir dormir dessus.",
        },
        adulto = {
            "{n} pages. Bonne journée de travail.",
            "{n} pages aujourd'hui. Cligne des yeux. Puis continue.",
            "Déjà {n}. La Règle 12 nous a à l'œil.",
            "{n} pages. <erudita:Même un dictionnaire demanderait une pause.|Ce n'est plus de la lecture, c'est un déménagement.>",
            "{n} pages et ça continue. L'archive te remercie. Mon dos, non.",
        },
        velho = {
            "{n} pages aujourd'hui. Les vieilles pattes protestent. Je fais la sourde oreille.",
            "{n} pages. Je me souviens de nuits comme ça. Elles étaient plus dangereuses.",
            "Déjà {n}. Bois un peu d'eau. J'attends.",
            "{n} pages. Laisses-en un peu pour demain. Demain aussi en a besoin.",
            "{n} pages aujourd'hui. Ce n'est pas une lecture, c'est un sauvetage.",
        },
    },
    sumiu = {
        filhote = {
            "{n} jours ! J'ai cru qu'ils étaient venus te chercher. J'ai vérifié la porte mille fois.",
            "Tu as disparu {n} jours. J'ai gardé ta place. Et la page.",
            "{n} jours sans toi. <medrosa:J'ai entendu chaque bruit de la maison.|J'ai récité la table des matières pour passer le temps.>",
            "Te revoilà ! {n} jours. Je n'ai pas pleuré. Presque pas.",
            "{n} jours. Grand-mère disait que les gens bien reviennent toujours. Elle avait raison.",
        },
        adulto = {
            "{n} jours. Je ne demanderai pas où. Ferme juste la porte.",
            "{n} jours dehors. La cave était trop calme.",
            "Tu as disparu {n} jours. J'ai gardé les sorties dégagées.",
            "{n} jours. <romantica:Tu m'as manqué. Voilà, c'est dit.|Noté. Pas de questions.>",
            "De retour après {n} jours. Bien. Le mot de passe ?",
        },
        velho = {
            "{n} jours. À mon âge, on les compte tous.",
            "{n} jours. J'ai tout bien rangé. Presque tout.",
            "Te revoilà après {n} jours. Je le savais. J'ai attendu quand même.",
            "{n} jours sans lecture. Les livres l'ont remarqué. Moi aussi.",
            "{n} jours. J'ai déjà gardé des salles vides. Je les préfère avec toi.",
        },
    },
    tarde = {
        filhote = {
            "Déjà {hora}. Juste un chapitre de plus ? Grand-mère disait ça aussi.",
            "{hora}. <noturna:Pas sommeil du tout !|Mes yeux sont lourds, mais continue.>",
            "Lire à {hora}, c'est comme un secret. Tout bas.",
            "{hora}. La maison a éteint ses lumières. Pas nous.",
            "Il est {hora}. Tu me couvres avec le foulard ?",
        },
        adulto = {
            "{hora}. Bonne heure pour le travail discret.",
            "Il est {hora}. Encore un chapitre et on vérifie la porte.",
            "{hora}. Les meilleures pages sortent après dix heures.",
            "{hora}. Tu lis, je surveille. Marché conclu.",
            "Il est {hora}. <medrosa:J'entends même l'horloge.|Bon silence.>",
        },
        velho = {
            "{hora}. La nuit est longue. J'en ai connu de plus longues.",
            "Il est {hora}. Les vieilles caves se réveillaient à cette heure-là.",
            "{hora}. Lis. Je somnole un œil ouvert.",
            "{hora}. Livre ouvert et lumière basse. À l'ancienne.",
            "Il est {hora}. Raconte-moi le chapitre demain. Ce soir, j'écoute.",
        },
    },
    cedo = {
        filhote = {
            "{hora} ! Le soleil s'est levé, et toi aussi. Moi, presque.",
            "Bonjour ! À {hora}, les pages sentent le pain.",
            "{hora}. Lire si tôt ! Grand-mère ne voulait jamais. Chut.",
            "Il est {hora}. <diurna:Mon heure !|J'ai encore sommeil, mais ça va.>",
            "{hora}. Personne debout. Juste nous et le livre.",
        },
        adulto = {
            "{hora}. Garde de jour. La porte est plus facile à surveiller.",
            "Il est {hora}. Lire avant que le monde se mette à parler.",
            "{hora}. Trop tôt pour les ennuis. Ou pas.",
            "{hora}. Un café pour toi, une page pour moi.",
            "Bonjour. {hora}. Rien à cacher, pour l'instant.",
        },
        velho = {
            "{hora}. Les vieux yeux aiment la lumière du matin.",
            "Il est {hora}. Avant, on ne lisait que dans le noir.",
            "{hora}. Que c'est bon de lire sans se cacher.",
            "Bonjour. {hora}. L'étagère est encore froide.",
            "{hora}. Un matin avec un livre. Grand-mère n'y croirait pas.",
        },
    },
    sessao = {
        filhote = {
            "{n} pages sans t'arrêter ! Tes pattes vont bien ?",
            "{n} d'affilée ! J'ai la tête qui tourne.",
            "{n} pages d'un coup. Je n'ai même pas vérifié la porte.",
            "Déjà {n} sans pause. Grand-mère t'aurait dit de boire de l'eau.",
            "{n} pages d'affilée. Je les range aussi vite que je peux.",
        },
        adulto = {
            "{n} pages sans pause. Bon livre ou évasion ?",
            "{n} d'affilée. Respect. Maintenant, cligne des yeux.",
            "{n} pages dans la même séance. Opération propre.",
            "{n} pages sans te lever. Moi, je me lèverais. Par sécurité.",
            "{n} d'affilée. <corajosa:Continue.|Courte pause. Vérifie la porte. Reviens.>",
        },
        velho = {
            "{n} pages sans t'arrêter. Je faisais ça. Il y a longtemps.",
            "{n} d'affilée. Lève-toi, étire-toi. Le livre attendra.",
            "{n} pages d'un coup. Je me souviens de cette faim.",
            "{n} pages. Doucement, on garde aussi.",
            "{n} sans pause. Bien. Mais respire.",
        },
    },
    sequencia = {
        filhote = {
            "{n} jours d'affilée ! Je connais déjà l'heure où tu arrives.",
            "Jour {n} d'affilée ! Grand-mère appellerait ça de la discipline.",
            "{n} jours ! <romantica:On fait vraiment la paire, maintenant.|C'est devenu une routine. J'aime les routines.>",
            "{n} jours sans faute. Mon foulard est plein.",
            "Jour {n}. Je les compte tous.",
        },
        adulto = {
            "{n} jours d'affilée. Discipline de cave.",
            "Jour {n}. Personne ne brise la chaîne.",
            "{n} jours. La constance est la meilleure défense.",
            "Jour {n} d'affilée. Noté.",
            "{n} jours. C'est comme ça que les livres survivent.",
        },
        velho = {
            "{n} jours d'affilée. Ça, c'est transmettre.",
            "Jour {n}. La cave serait fière.",
            "{n} jours. J'en ai vu beaucoup abandonner au troisième.",
            "{n} jours d'affilée. Bien. La mémoire aime l'habitude.",
            "Jour {n}. Garder chaque jour. C'est comme ça qu'on faisait.",
        },
    },
    bom_dia = {
        filhote = {
            "{n} pages aujourd'hui ! Je grandis, je le sens.",
            "J'ai déjà gardé {n} pages aujourd'hui et il reste de la place.",
            "{n} pages ! Grand-mère aurait aimé cette journée.",
            "{n} pages aujourd'hui. Une belle pile.",
            "{n} aujourd'hui. Ma cachette te remercie.",
        },
        adulto = {
            "{n} pages aujourd'hui. Correct.",
            "{n}. Journée pas perdue.",
            "{n} pages aujourd'hui. Archives à jour.",
            "{n} pages. Rien n'a brûlé. Bonne journée.",
            "Aujourd'hui : {n} pages. Rapport positif.",
        },
        velho = {
            "{n} pages aujourd'hui. Une bonne journée pour garder.",
            "{n} pages. C'est déjà beaucoup, pour qui se souvient des cendres.",
            "{n} aujourd'hui. Bien. Sans hâte.",
            "{n} pages. Les chatons auraient aimé ce morceau.",
            "{n} pages aujourd'hui. De quoi faire dormir un chat en paix.",
        },
    },
    nada_hoje = {
        filhote = {
            "Toujours rien aujourd'hui. Pas une ligne. J'ai l'œil sur le livre.",
            "Aucune page aujourd'hui… ça va, toi ?",
            "Encore rien aujourd'hui. Grand-mère disait : l'oubli ne fait pas de bruit.",
            "Le livre est resté fermé toute la journée. Il va bien ?",
            "Zéro aujourd'hui. Je vais garder un souvenir à la place.",
        },
        adulto = {
            "Aucune page aujourd'hui. L'étagère l'a remarqué.",
            "Aujourd'hui : zéro. Je n'aime pas le silence.",
            "Rien aujourd'hui. L'oubli ne fait pas de bruit. Souviens-toi.",
            "Journée vide. Je monte la garde quand même.",
            "Aucune page aujourd'hui. Je ne vais pas insister. Pas trop.",
        },
        velho = {
            "Rien aujourd'hui. À mon âge, chaque jour compte.",
            "Aucune page aujourd'hui. J'ai déjà vu ça commencer comme ça.",
            "Pas aujourd'hui. Tant pis. J'attendrai demain.",
            "Le livre a dormi toute la journée. Moi aussi, presque.",
            "Zéro aujourd'hui. Garde-moi un paragraphe pour demain.",
        },
    },
    reta_final = {
        filhote = {
            "{pct} de « {livro} » ! Presque la fin. Mon cœur bat à cent à l'heure.",
            "Il reste peu de « {livro} ». Je vais le garder doucement.",
            "{pct} ! La fin de « {livro} » est juste là. Ne me dis rien !",
            "Dernière ligne droite de « {livro} ». Tiens-moi la patte.",
            "{pct} de « {livro} ». Et si ça finit mal ? Et si ça finit bien ?",
        },
        adulto = {
            "{pct} de « {livro} ». L'auteur ne peut plus s'échapper.",
            "Dernière ligne droite de « {livro} ». Sorties vérifiées.",
            "{pct}. « {livro} » est presque passé en entier.",
            "Dernières pages de « {livro} ». Vigilance doublée.",
            "{pct} de « {livro} ». C'est là qu'on cache les surprises.",
        },
        velho = {
            "{pct} de « {livro} ». Les fins m'attrapent toujours.",
            "Presque la fin de « {livro} ». Lis doucement. Une fin ne revient pas.",
            "{pct}. Bientôt, « {livro} » deviendra un souvenir.",
            "Dernière ligne droite de « {livro} ». J'ai gardé bien des fins. Celle-là aussi.",
            "{pct} de « {livro} ». Prépare le mouchoir. Le mien est prêt.",
        },
    },
    metade = {
        filhote = {
            "La moitié de « {livro} » ! Maintenant, ça devient bien, hein ?",
            "J'ai déjà gardé la moitié de « {livro} ». L'autre moitié me regarde.",
            "Le milieu de « {livro} » ! Grand-mère disait que c'est au milieu qu'habite le secret.",
        },
        adulto = {
            "La moitié de « {livro} ». C'est maintenant qu'ils abattent leurs cartes.",
            "Le milieu de « {livro} ». Point de contrôle.",
            "La moitié de « {livro} ». Une moitié gardée, une moitié à garder.",
        },
        velho = {
            "La moitié de « {livro} ». C'est au milieu que les livres trébuchent. Ou s'envolent.",
            "Le milieu de « {livro} ». J'ai appris à ne pas juger trop tôt.",
            "La moitié de « {livro} ». Un bon endroit pour souffler.",
        },
    },
    comeco = {
        filhote = {
            "Début de « {livro} » ! Ça a une odeur {cheiro|de papier neuf}.",
            "Premières pages de « {livro} ». J'ai tout le monde à l'œil.",
            "« {livro} » a commencé ! Qui je vais aimer ? Je ne sais pas encore.",
        },
        adulto = {
            "Début de « {livro} ». La première page deux fois, comme le veut la Règle 4.",
            "Premières pages de « {livro} ». Je repère les sorties.",
            "« {livro} », tout juste commencé. Personne n'est encore digne de confiance.",
        },
        velho = {
            "Début de « {livro} ». Chaque nouveau livre me rappelle le premier.",
            "Premières pages de « {livro} ». Sans hâte. Il finira par se montrer.",
            "« {livro} ». Un début. J'aime les débuts.",
        },
    },
    fim_de_semana = {
        filhote = {
            "Le week-end ! Une journée entière de livre ?",
            "Un week-end de lecture. Le meilleur genre.",
            "Un week-end sans hâte. Juste du papier et le foulard.",
        },
        adulto = {
            "Le week-end. Le monde sort ; nous, on garde.",
            "Le monde est en congé. La cave est de garde.",
            "Lire le week-end. Le bon choix.",
        },
        velho = {
            "Le week-end. Avant, c'était là qu'ils brûlaient le plus. Aujourd'hui, on lit.",
            "Un jour de repos avec un livre. Comme il se doit.",
            "Un week-end avec un livre. Les chatons devraient apprendre ça.",
        },
    },
}
