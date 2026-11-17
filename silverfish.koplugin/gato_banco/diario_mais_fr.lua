--[[--
Suite du journal du Chat des Cendres, NOTES DE LA CAVE (français), traduite de gato_banco/diario_mais_pt.lua.
S'ajoute au bout des listes de gato_banco/diario_fr.lua. Mêmes gabarits que traca_banco/diario_fr.lua.
]]

return {
    dia = {
        magro = {
            "{n} pages de « {livro} ». Peu, mais bien gardé.",
            "Seulement {n} pages de « {livro} ». De la contrebande de poche.",
            "{n} pages de « {livro} ». Ça tient dans une fente.",
            "Un morceau de « {livro} » : {n} pages. Mieux que rien. Bien mieux.",
        },
        normal = {
            "{n} pages de « {livro} ». Porte fermée, archives ouvertes.",
            "On a gardé {n} pages de « {livro} ». Sans témoin.",
            "« {livro} », {n} pages. Un service honnête.",
            "{n} pages de « {livro} », une à la fois, comme disait Grand-mère.",
            "Encore {n} pages de « {livro} » dans la planque.",
        },
        banquete = {
            "{n} pages de « {livro} ». Le foulard ne ferme plus.",
            "Grosse journée : {n} pages de « {livro} ». J'ai dû desceller une autre brique.",
            "{n} pages de « {livro} ». Les chats de la cave auraient fait la fête.",
            "« {livro} » a rendu {n} pages. J'ai tout porté entre les dents.",
        },
        enorme = {
            "{n} pages de « {livro} ». Ce n'est plus de la lecture, c'est un déménagement.",
            "{n} pages en un seul jour. On a descendu la moitié de « {livro} » à la cave.",
        },
        dois_livros = {
            "{n} pages. « {livro} » devant, « {livro2} » en réserve.",
            "Deux livres, un foulard : « {livro} » et « {livro2} ». {n} pages.",
        },
        horario = {
            madrugada = { "Lu aux petites heures. La meilleure garde.", "Après minuit, comme les chats de la cave.", "Tout dans le noir. Personne n'a rien vu." },
            manha = { "Lu avec un café et une fenêtre.", "Garde du matin. Trop de lumière pour les secrets." },
            noite = { "Lu la nuit, porte fermée.", "Fin de journée, lumière basse, sorties vérifiées." },
        },
        fala = {
            filhote = { "J'ai gardé une phrase de {nome} : « {fala} ». Je vais la répéter jusqu'à m'endormir.", "« {fala} », a dit {nome}. Je l'ai noté sur le foulard." },
            adulto = { "{nome} : « {fala} ». Noté.", "« {fala} », a dit {nome}. Au dossier." },
            velho = { "{nome} a dit « {fala} ». Grand-mère aurait dit pareil.", "Phrase du jour, signée {nome} : « {fala} ». Je la garde." },
        },
        novo = {
            "{nome} vient d'entrer dans l'histoire. J'ai repéré la sortie la plus proche.",
            "Nouveau dossier : {nome}.",
            "{nome} vient d'arriver. Je ne sais pas encore dans quel camp.",
            "Voilà {nome}. Je surveille.",
        },
        novos2 = {
            "{nome} et {nome2}, en même temps. Suspect.",
            "Deux nouveaux dossiers : {nome} et {nome2}.",
            "Rencontré {nome} et {nome2}. Deux secrets, sûrement.",
        },
        evento = {
            morte = { "Un enterrement. J'ai gardé le nom.", "Quelqu'un s'en est allé. Il faut que quelqu'un se souvienne. Ce sera moi." },
            casamento = { "Quelqu'un s'est marié. J'ai noté les promesses.", "Un autel, une promesse. Je vérifierai à la fin." },
            viagem = { "Quelqu'un est parti. J'ai vérifié que le livre suivait.", "Valises, route, adieux. Bon jour pour filer." },
            carta = { "Une lettre. Je l'ai lue par-dessus l'épaule.", "Une lettre a tout changé. Les lettres font ça." },
            tempestade = { "Il a plu toute la journée dans le livre. À la cave, pas une goutte.", "Du tonnerre dans le chapitre. J'ai vérifié les fenêtres." },
            doenca = { "Quelqu'un est tombé malade. Je suis resté tout près, sans un bruit.", "De la fièvre dans le chapitre. Veillée toute la nuit." },
            festa = { "Une fête. Je suis resté dans le coin, près de la sortie.", "Musique, monde, bruit. Parfait pour qu'on ne me voie pas." },
            briga = { "Des cris dans le chapitre. J'ai noté qui avait commencé.", "Une dispute. Personne n'a entendu la voix la plus basse. Moi, si." },
            fuga = { "Quelqu'un s'est échappé. J'ai noté l'itinéraire.", "Une évasion. Bonne technique. Noté." },
            crime = { "Un crime. J'ai ouvert un dossier.", "Quelqu'un a fait ce qu'il ne fallait pas. J'ai les indices." },
        },
        tema = { "La journée avait une odeur {de_tema}.", "Tout a tourné autour {de_tema}.", "Le sujet, c'était {tema}. Dossier plein." },
        pesado = { "Beaucoup de suie aujourd'hui.", "Des pages qui pèsent dans le foulard.", "Journée de papier sombre. J'ai vérifié les sorties deux fois." },
        leve = { "Des pages douces. Personne n'a rien brûlé.", "Lecture légère. Grand-mère aurait approuvé." },
        fecho = {
            filhote = { "Demain, il y en aura encore.", "Foulard plié, page gardée.", "Grand-mère aurait aimé cette journée." },
            adulto = { "Sorties vérifiées.", "Archivé.", "Fin de service." },
            velho = { "Une page de plus pour les chatons.", "Gardé. Comme toujours.", "Encore un jour qui ne s'est pas perdu." },
        },
        fecho_escuro = {
            filhote = { "J'ai laissé la lumière allumée.", "J'ai dormi près de la porte." },
            adulto = { "J'ai vérifié la porte deux fois.", "Pas de fumée. Quand même." },
            velho = { "Il y a des jours qu'on garde pour qu'ils ne se répètent pas.", "C'était lourd. Je l'ai gardé quand même." },
        },
        fecho_leve = {
            filhote = { "Aujourd'hui, c'était bon à garder." },
            adulto = { "Pas de fumée. Rare. Bien." },
            velho = { "Des jours comme ça valent toute la cave." },
        },
    },

    inicio = {
        generico = {
            "« {livro} » est entré à la cave. J'ai vérifié le dos.",
            "On a ouvert « {livro} ». La première page deux fois, comme le veut la Règle 4.",
            "Nouveau livre : « {livro} ». Nouveau dossier.",
            "« {livro} ». Bonne odeur. Voyons la suite.",
            "« {livro} » a commencé. J'ai déjà choisi ma planque dedans.",
        },
        autor = {
            "Premier livre de {autor}. Je commence par les notes de bas de page.",
            "{autor}. Un nom nouveau aux archives.",
            "Je fais connaissance avec {autor}. Pour l'instant, méfiance polie.",
        },
        mesmo_autor = { "{autor} encore. Le dossier est déjà ouvert.", "Encore {autor}. Je reconnais le pas.", "Retour chez {autor}. Fidélité." },
        largou = {
            "« {anterior} » est resté en plan. Maintenant, c'est « {livro} ». J'ai noté la page.",
            "On a troqué « {anterior} » contre « {livro} ». J'y ai laissé un marque-page. Au cas où.",
            "On a lâché « {anterior} ». Je n'oublie pas. Maintenant : « {livro} ».",
        },
        relendo = {
            "On relit « {livro} ». J'ai trouvé des choses que je n'avais pas vues.",
            "« {livro} », encore. Règle 10 : jamais deux fois de la même façon.",
            "Retour à « {livro} ». Mon morceau y est toujours.",
        },
    },

    fim = {
        abertura = {
            "Fin de « {livro} ». Mon morceau est à l'abri. Le reste vit en toi.",
            "« {livro} » est fini. Archivé. Enfin, mon morceau.",
            "On a refermé « {livro} ». Personne n'a vu. Parfait.",
            "Dernière page de « {livro} ». Lue deux fois.",
        },
        nome = { "Dossier : {nome}.", "Au fond, ça parlait de {nome}.", "Si on demande, c'était {nome}." },
        protagonista = {
            filhote = { "{nome} m'a appris quelque chose. Je ne sais pas encore quoi." },
            adulto = { "{nome} rejoint le dossier des gens qui comptent." },
            velho = { "Je raconterai {nome} aux chatons. À ma façon." },
        },
        mais_escuro = { "Plus de fumée que « {outro} ».", "Plus lourd que « {outro} ». Bien plus." },
        mais_leve = { "Plus léger que « {outro} ». Bien.", "Après « {outro} », celui-ci, c'était du repos." },
        serie = {
            "{ordinal} livre d'affilée qui parle {de_tema}. Quelqu'un choisit pour toi ? Ou c'est toi ?",
            "{ordinal} livre de suite qui parle {de_tema}. Noté, avec méfiance.",
        },
        traco = {
            amarga = { "J'en sors avec une illusion de moins." },
            otimista = { "J'en sors avec la braise plus vive." },
            medrosa = { "Je vérifierai les sorties deux fois ce soir." },
            corajosa = { "J'en sors en marchant au milieu de la pièce." },
            cinica = { "J'ai noté à qui profite la fin." },
            romantica = { "J'ai gardé une lettre de celui-ci dans le foulard." },
            popular = { "Lu trop vite. Trop aimé." },
            erudita = { "Je veux l'édition ancienne de celui-là." },
        },
        nota = {
            filhote = { "Je lui ai mis {n} pattes sur 5. J'ai bien réfléchi." },
            adulto = { "Note : {n} briques descellées sur 5." },
            velho = { "{n} braises sur 5. Sans se presser." },
        },
    },

    obsessao = {
        nova = {
            "Je ressasse {tema}. J'ai ouvert un dossier rien que pour ça.",
            "Nouvelle obsession : {tema_s}. Archives ouvertes.",
            "Je rumine {tema} jusque dans le noir. Quelqu'un a mis ça là.",
        },
        troca = {
            "Avant, je ressassais {antes}. Maintenant, je ressasse {agora}. Relève de la garde.",
            "Sortie : {antes_s}. Entrée : {agora_s}. Sans même frapper.",
            "Je ne ressasse plus tellement {antes}. Maintenant, c'est {agora_s} dans tous les coins.",
        },
    },

    lembranca = {
        autor = {
            "{n}e livre de {autor}. Je reconnais l'écriture dans le noir.",
            "{autor} encore : le {n}e. Dossier épais.",
            "Encore {autor}, le {n}e. La fidélité a un nom.",
            "Le {n}e de {autor}. Les chats de la cave aussi avaient leur auteur préféré.",
        },
        aniversario = {
            "Un an depuis « {livro} ». Mon morceau est toujours entier.",
            "Il y a un an : « {livro} ». Je me souviens de la première page.",
            "« {livro} » a un an d'archives. Pas un grain de poussière.",
        },
        personagem = {
            "{nome} encore. Le dossier de « {livro} » est toujours ouvert.",
            "Je connais {nome} depuis « {livro} ». Du changement ? Je vais vérifier.",
            "{nome} revient. Depuis « {livro} », je garde un œil ouvert.",
        },
        recorde_longo = { "« {livro} », c'est le plus gros qu'on ait jamais porté. La cave s'en souvient encore.", "Rien n'a pesé autant que « {livro} ». Chaque page en valait la peine." },
        recorde_rapido = { "On n'a jamais rien mis à l'abri aussi vite que « {livro} ».", "« {livro} » est passé en coup de vent. La meilleure contrebande." },
        serie_tema = {
            "{n} livres d'affilée qui parlent {de_tema}. Je vois un schéma. Et toi ?",
            "Encore un livre qui parle {de_tema} : ça fait {n}. Quelqu'un a choisi ça. Toi, peut-être.",
        },
    },
}
