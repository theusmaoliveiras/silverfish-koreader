--[[--
Banque de phrases du journal (français). Gabarits : {n} pages, {livro}, {livro2}, {nome}, {nome2},
{fala}, {tema} (« la mer »), {de_tema} (« de la mer »), {autor}, {anterior}, {outro}, {ordinal}.
Jamais d'adjectif genré pour le lecteur.
]]

local B = { dia = {}, inicio = {}, fim = {}, obsessao = {}, lembranca = {} }

-- Jour de lecture -----------------------------------------------------------------------
B.dia.magro = {
    "Journée maigre : {n} pages de « {livro} ».",
    "Seulement {n} pages aujourd'hui. J'ai grignoté « {livro} ».",
    "{n} pages de « {livro} ». Un amuse-bouche.",
    "Peu de chose aujourd'hui : {n} pages de « {livro} ». Je me suis léché les doigts.",
    "Quelques miettes de « {livro} » : {n} pages.",
    "{n} pages. « {livro} » a à peine effleuré ma bouche.",
}
B.dia.normal = {
    "{n} pages de « {livro} ».",
    "J'ai mangé {n} pages de « {livro} ».",
    "Encore {n} pages de « {livro} » dans le ventre.",
    "Aujourd'hui : « {livro} », {n} pages.",
    "{n} pages de « {livro} », mâchées tranquillement.<dominio: Un goût {gosto}.|>",
    "J'ai avancé de {n} pages dans « {livro} ».",
    "« {livro} » a donné {n} pages aujourd'hui.",
    "{n} pages. « {livro} » reste dans mon assiette.",
}
B.dia.banquete = {
    "{n} pages de « {livro} ». Banquet.",
    "Aujourd'hui, c'était la fête : {n} pages de « {livro} ».",
    "{n} pages de « {livro} » d'un coup. Je suis pleine.",
    "J'ai mangé {n} pages de « {livro} ». Je ne me souviens même plus d'avoir respiré.",
    "Une journée bien grasse : {n} pages de « {livro} ».",
    "{n} pages de « {livro} ». Mon ventre a demandé grâce.",
}
B.dia.enorme = {
    "{n} pages de « {livro} » en un seul jour. Je suis ronde comme une bille.",
    "{n} pages. Tu n'as pas lu « {livro} », tu l'as traversé.",
    "Marathon : {n} pages de « {livro} ». Il faut que je m'allonge.",
    "{n} pages de « {livro} ». Jamais autant mangé. Je vais rouler jusqu'à la reliure.",
}
B.dia.dois_livros = {
    "{n} pages, partagées entre « {livro} » et « {livro2} ».",
    "Journée à deux plats : « {livro} » et un peu de « {livro2} ». {n} pages.",
    "{n} pages. J'ai hésité entre « {livro} » et « {livro2} », comme quelqu'un qui n'arrive pas à choisir le dessert.",
    "J'ai trompé « {livro2} » avec « {livro} ». {n} pages en tout.",
}
B.dia.horario = {
    madrugada = { "Presque tout en pleine nuit.", "Lu après minuit, comme les secrets.", "Encore une nuit blanche.<noturna: J'adore.|medrosa: Avec la lumière allumée.|>",
                  "On a lu pendant que la maison dormait.<medrosa: J'ai entendu chaque craquement.|>" },
    manha = { "Tout avant le déjeuner.", "Lu le matin, avec une odeur de café.<diurna: Mon heure.|>", "On a commencé tôt." },
    noite = { "Lu tard dans la nuit.", "Presque tout après dix heures.", "Jusque tard dans la nuit.<noturna: Comme je les aime.|>" },
}
B.dia.fala = {
    jovem = { "{nome} a dit « {fala} ». Je l'ai répété tout bas.", "{nome} a lâché « {fala} ». J'y ai repensé longtemps.",
              "J'ai gardé une réplique de {nome} : « {fala} ».", "« {fala} », a dit {nome}. Moi, je n'aurais jamais eu ce courage." },
    velha = { "{nome} a dit « {fala} ». Noté pour ne jamais pardonner.", "« {fala} », a dit {nome}. Moi, je l'aurais mieux dit.",
              "Phrase du jour, signée {nome} : « {fala} ». Elle méritait une cigarette.", "{nome} : « {fala} ». Gardé. <romantica:Je m'en servirai dans une lettre.|Je m'en servirai contre quelqu'un.>" },
}
B.dia.novo = {
    "J'ai fait la connaissance de {nome}.", "{nome} fait son apparition. Je ne sais pas encore quoi en penser.", "{nome} entre en scène.",
    "On m'a présenté {nome}. Sans grand enthousiasme.", "{nome} a débarqué. <romantica:Coup de cœur immédiat.|medrosa:Je me suis cachée.|Je vais garder un œil sur la situation.>",
    "{nome} a fait son apparition. Ça va faire des histoires.",
}
B.dia.novos2 = {
    "J'ai fait la connaissance de {nome} et de {nome2}.", "{nome} et {nome2} font leur apparition. Trop de monde.",
    "{nome} et {nome2} entrent en scène. L'un des deux va m'énerver.", "On m'a présenté {nome} et {nome2}. J'ai noté les deux.",
}
B.dia.evento = {
    morte = { "Quelqu'un est mort.", "Il y a eu un mort. <romantica:J'ai pleuré pour de vrai.|medrosa:J'ai dormi la lumière allumée.|Deuil de politesse.>", "On a enterré quelqu'un. Odeur de bougie." },
    casamento = { "Il y a eu un mariage.", "Quelqu'un s'est marié. <romantica:J'ai pleuré devant l'autel.|otimista:Cette fois, ça va durer.|Je leur donne trois chapitres.>", "Mariée, autel, promesse. Noté pour le leur rappeler." },
    viagem = { "Quelqu'un a pris la route.", "Il y a eu un voyage. <corajosa:Je suis partie avec eux, passagère clandestine dans la valise.|Moi, je suis restée.>", "Des gens qui partaient et arrivaient toute la journée." },
    carta = { "Une lettre est arrivée.", "Il y a eu une lettre. <romantica:Je l'ai lue deux fois.|otimista:C'étaient de bonnes nouvelles, pour une fois.|Ce n'est jamais une bonne nouvelle.>", "Quelqu'un a écrit ce qu'il ne fallait pas." },
    tempestade = { "Il a plu dans le livre.", "Il y a eu une tempête.", "Du tonnerre toute la journée.<medrosa: Je me suis cachée dans la reliure.|corajosa: Je suis restée à la proue.|>" },
    doenca = { "Quelqu'un est tombé malade.", "Il y a eu de la fièvre et un médecin.", "Des gens alités. Mauvais signe." },
    festa = { "Il y a eu une fête.", "Il y a eu un bal. <romantica:J'ai dansé toute seule sur la marge.|Personne ne m'a invitée.>", "De la musique et du vin. Pour eux." },
    briga = { "Il y a eu une dispute.", "Ils ont crié. <corajosa:J'ai crié avec eux.|Je me suis bouché les antennes.>", "Quelqu'un a enfin dit ce qu'il pensait." },
    fuga = { "Quelqu'un s'est enfui.", "Il y a eu une fuite.", "Des gens qui couraient pour échapper à leur destin." },
    crime = { "Il y a eu un crime.", "Du sang et la police.", "Quelqu'un a tué quelqu'un. <medrosa:Je me suis enfermée dans la reliure.|corajosa:Je suis allée enquêter.|Moi, j'ai un alibi.>" },
}
B.dia.tema = {
    "Le sujet du jour : {tema}.", "On n'a parlé que {de_tema}.", "Il a beaucoup été question {de_tema} aujourd'hui. Trop.",
    "La journée avait un goût {de_tema}.", "Tout a tourné autour {de_tema}.",
}
B.dia.pesado = { "Des pages lourdes.", "Une journée de papier sombre.", "Beaucoup d'ombre, peu de lumière.", "Une lecture qui laisse des traces." }
B.dia.leve = { "Des pages légères, pour changer.", "Une douce journée de papier.", "Une lecture qui ne fait pas mal. Rare." }
B.dia.fecho = {
    jovem = { "Demain, il y en a encore.", "Je digère encore.", "J'aime bien.", "Je me suis endormie en y pensant.", "J'en veux encore.", "" },
    velha = { "Noté.", "Quelle fatigue.", "J'ai allumé une cigarette imaginaire.", "Continuons.", "Rien de nouveau. Ou presque.", "" },
}
B.dia.fecho_escuro = {
    jovem = { "J'ai mal dormi.", "J'ai eu peur du noir.", "J'ai laissé la lumière allumée.", "J'ai serré la reliure dans mes pattes." },
    velha = { "J'ai mal dormi. Comme toujours.", "Un poids de plus sur l'étagère.", "Il m'a fallu deux cigarettes imaginaires.", "Prévisible. Ça a fait mal quand même." },
}
B.dia.fecho_leve = {
    jovem = { "J'ai fait de beaux rêves.", "J'étais contente sans raison.", "Je me suis endormie en souriant." },
    velha = { "J'ai failli sourire.", "Je me méfie de tant de légèreté.", "Ne t'y habitue pas." },
}

-- Début de livre ------------------------------------------------------------------------
B.inicio.generico = {
    "J'ai commencé à ronger « {livro} ». La couverture promettait beaucoup. Les couvertures promettent toujours.",
    "Nouveau livre : « {livro} ». Une odeur de papier qui ne sait pas encore ce qui l'attend.",
    "Première bouchée de « {livro} ». Je n'ai pas encore d'avis. Ça ne dure pas.",
    "« {livro} » est arrivé dans mon assiette. On va voir s'il tient le coup.",
    "J'ai ouvert « {livro} ». La première page jure toujours que ça vaudra le coup.",
    "On commence « {livro} ». Moi avec la dalle, toi avec de l'espoir.",
    "Un autre livre : « {livro} ». Mon ventre dit merci, mon humeur attend.",
    "« {livro} ». Nouvelle adresse. Je n'ai pas fini de défaire mes valises.",
}
B.inicio.autor = {
    "« {livro} », signé {autor}. On va voir si {autor} mérite ma faim.",
    "J'ai commencé « {livro} ». Je n'ai jamais rien mangé signé {autor}. La première fois est toujours bizarre.",
    "{autor}, enchantée. Je viens manger ton « {livro} ».",
    "Un livre signé {autor} : « {livro} ». J'en ai entendu parler. Les mites cancanent.",
}
B.inicio.mesmo_autor = {
    "Encore {autor} : « {livro} ». Fidélité ou paresse ?",
    "{autor} encore. « {livro} » cette fois. On sort ensemble ?",
    "Retour chez {autor}. « {livro} » est le prochain plat.",
    "Encore du {autor}. Tu ne le lâches pas, cet auteur, hein.",
}
B.inicio.largou = {
    "J'ai lâché « {anterior} » en chemin. Maintenant, c'est « {livro} ». Je ne commente pas. Si : lâcheté.",
    "« {anterior} » est resté derrière nous, sans fin. On l'a échangé contre « {livro} ». J'ai vu.",
    "On a abandonné « {anterior} ». Qu'il repose en paix. Maintenant : « {livro} ».",
    "On a sauté à « {livro} ». « {anterior} » va me fixer depuis l'étagère.",
}
B.inicio.relendo = {
    "Je relis « {livro} ». Je connais déjà la fin. Je mange lentement.",
    "Retour à « {livro} ». La deuxième bouchée a un autre goût.",
    "« {livro} » encore une fois. Ou tu avais oublié, ou c'est le coup de foudre.",
    "Relecture de « {livro} ». Cette fois, je fais attention aux détails. Et aux virgules.",
}

-- Fin de livre ---------------------------------------------------------------------------
B.fim.abertura = {
    "J'ai fini « {livro} ».", "Fin de « {livro} ».", "« {livro} » est terminé.", "Dernière page de « {livro} ».",
    "« {livro} » : digéré.", "J'ai mangé la dernière ligne de « {livro} ».",
}
-- {nome} : le nom composé du livre (traca_vetor.lua), ex. : « une histoire de mer, agitée »
B.fim.nome = { "C'était {nome}.", "Au fond, {nome}.", "En résumé : {nome}.", "Si on me demande : {nome}." }
B.fim.protagonista = {
    jovem = { "{nome} va me manquer.", "J'ai {nome} dans la tête.", "{nome} va habiter dans mon cœur. Petit, mais il y a de la place." },
    velha = { "J'ai {nome} dans la tête. Contre ma volonté.", "{nome} va me hanter quelques jours.",
              "J'ai survécu à {nome}. De justesse." },
}
B.fim.mais_escuro = { "Plus sombre que « {outro} ».", "Plus lourd que « {outro} ».", "À côté, « {outro} » ressemble à une comédie." }
B.fim.mais_leve = { "Plus léger que « {outro} ».", "Après « {outro} », une bouffée d'air.", "Moins douloureux que « {outro} »." }
B.fim.serie = {
    "{ordinal} livre d'affilée sur {tema}. Tu fuis quelque chose ?",
    "{ordinal} livre {de_tema} à la suite. Je vois un schéma se dessiner.",
    "{ordinal} fois qu'un de tes livres me parle {de_tema}. Noté.",
}
B.fim.traco = {
    amarga = { "Je suis ressortie plus amère que je n'étais entrée.", "Ce livre m'a retiré un peu d'espoir." },
    otimista = { "Je suis ressortie plus légère que je n'étais entrée.", "Ce livre m'a rendu un peu de foi." },
    medrosa = { "Je suis ressortie plus peureuse que je n'étais entrée.", "Ce livre m'a appris à regarder sous les pages." },
    corajosa = { "Je suis ressortie plus courageuse que je n'étais entrée.", "Ce livre m'a donné une carapace." },
    cinica = { "Je suis ressortie plus méfiante que je n'étais entrée.", "Ce livre m'a appris à suivre l'argent." },
    romantica = { "Je suis ressortie plus romantique que je n'étais entrée.", "Ce livre m'a ramollie. Quelle honte." },
    popular = { "Je suis ressortie pressée de lire. Mauvais signe.", "Ce livre m'a mal habituée à son rythme." },
    erudita = { "Je suis ressortie plus cultivée que je n'étais entrée. Insupportable.", "Ce livre m'a fait citer des auteurs à tout bout de champ." },
}
B.fim.nota = {
    jovem = { "Note : {n} petites étoiles.", "Je donne {n} petites étoiles.", "{n} petites étoiles sur 5." },
    velha = { "Note : {n} cigarettes imaginaires.", "{n} cigarettes imaginaires sur 5.", "Ça vaut {n} cigarettes imaginaires." },
}
B.fim.veredito = {
    jovem = {
        { "J'ai mangé par politesse. Pardon, l'auteur.", "Ce n'était pas pour moi. Je crois." },
        { "Il y avait du bon, mais il a mis du temps à arriver.", "Un peu tiède. Comme un papier oublié au soleil." },
        { "Il m'a plu ! Pas beaucoup. Mais il m'a plu.", "Un bon livre pour une mite comme moi." },
        { "Quel livre ! Je vais rêver de lui.", "J'étais triste que ça s'arrête. C'est bon signe, non ?" },
        { "Le meilleur que j'aie jamais mangé. Jusqu'ici. Je crois. Oui.", "Je veux le relire. Maintenant. Tout de suite." },
    },
    velha = {
        { "J'ai mâché par politesse.", "Un livre qui existe. C'est tout." },
        { "Il a eu ses moments. Rares.", "Tiède. Comme un thé oublié." },
        { "Correct. Rare, de nos jours.", "Il n'a pas changé ma vie. Mais il ne l'a pas empirée non plus." },
        { "Un bon livre. Je vais regretter de ne plus pouvoir le détester.", "Cet auteur savait ce qu'il faisait. Je déteste quand ça arrive." },
        { "Rare. Un livre que je n'ai pas réussi à détester.", "Je referme la couverture avec respect. Et une cigarette." },
    },
}

-- Obsessions (thème dominant) -------------------------------------------------------------
-- Ici {tema} et {antes}/{agora} suivent un verbe sans préposition ; {tema_s}, {antes_s}, {agora_s} sont les formes nues.
B.obsessao.nova = {
    "J'ai remarqué que je rumine beaucoup {tema}. Je n'ai rien demandé.",
    "Je ressasse {tema}. La faute à tes livres.",
    "Nouvelle obsession : {tema_s}. Ça arrive aux meilleures mites.",
    "Impossible de m'arrêter de ressasser {tema}. Il me faudra un autre livre. Ou une thérapie.",
}
B.obsessao.troca = {
    "Avant, je ressassais {antes}. Maintenant, je ne ressasse plus que {agora}. La faute à toi et à tes livres.",
    "Changement d'obsession : {antes_s} dehors, {agora_s} dedans.",
    "Dans ma tête, {agora_s} a chassé {antes_s}.",
    "Je ne ressasse plus tellement {antes}. Maintenant, c'est {agora_s}, tout le temps.",
}

-- Souvenirs (traca_lembrancas.lua) : {autor} {n} {livro} {mes} {nome} {tema} {de_tema} -------
B.lembranca.autor = {
    "{autor} encore. C'est le {n}e livre signé {autor} qu'on lit. Ça commence à ressembler à une relation.",
    "Retour chez {autor} : {n}e livre. Je reconnais déjà l'assaisonnement.",
    "{n}e livre signé {autor}. Certains collectionnent les timbres.",
    "Encore {autor}. Le {n}e. Toi, tu ne te lasses pas, et j'avoue que moi non plus.",
    "{autor} encore, pour la {n}e fois. Je sais déjà où sont les os.",
}
B.lembranca.aniversario = {
    "Il y a un an, on finissait « {livro} ». J'en sens encore le goût.",
    "Un an aujourd'hui depuis la fin de « {livro} ». Tu t'en souviens ? Moi, je me souviens de tout.",
    "Anniversaire : il y a exactement un an, la dernière page de « {livro} ».",
    "Aujourd'hui, ça fait un an pour « {livro} ». Les mites aussi retiennent les dates.",
}
B.lembranca.personagem = {
    "{nome} encore… on se connaît depuis « {livro} ».",
    "Regardez qui revient : {nome}. Depuis « {livro} », je n'avais pas revu cette figure.",
    "{nome} ! Je croyais que « {livro} » nous en avait débarrassés.",
    "{nome} encore une fois. « {livro} » n'a pas suffi, apparemment.",
}
B.lembranca.recorde_longo = {
    "« {livro} » : {n} pages. Le plus long que tu aies lu avec moi. Je suis gavée.",
    "Record : « {livro} » est le livre le plus épais qu'on ait mangé ensemble.",
    "On n'a jamais rien mangé d'aussi gros que « {livro} ». Il faut que je m'allonge.",
}
B.lembranca.recorde_rapido = {
    "« {livro} » a été le plus rapide de tous. Tu n'as même pas mâché.",
    "Aucun livre n'est descendu aussi vite que « {livro} ». Soit il était bon, soit tu avais faim.",
    "Record de vitesse : « {livro} ». Il m'a donné le hoquet.",
}
B.lembranca.serie_tema = {
    "{n}e livre d'affilée sur {tema}. Je vois un schéma se dessiner. Et toi ?",
    "Encore un livre {de_tema}. C'est le {n}e de suite. Tu cherches quelque chose ?",
    "{n} livres d'affilée où {tema} fait la loi. Noté dans mon petit carnet.",
}
B.lembranca.sombrio_desde = {
    "Tu n'avais rien lu d'aussi sombre depuis « {livro} », en {mes}.",
    "Depuis « {livro} », là-bas en {mes}, je n'avais pas mangé de pages aussi noires.",
    "Celui-ci est aussi lourd que « {livro} ». Et c'était en {mes}.",
}
B.lembranca.mais_sombrio = {
    "C'est le livre le plus sombre qu'on ait lu ensemble. Je suis en deuil sans savoir pourquoi.",
    "Jamais mangé des pages aussi noires avec toi. Un record dont personne ne voulait.",
}
B.lembranca.leve_desde = {
    "Rien d'aussi léger depuis « {livro} », en {mes}. Quel soulagement.",
    "Depuis « {livro} », en {mes}, je n'avais pas mangé de pages aussi douces.",
}
B.lembranca.mais_leve = {
    "Le livre le plus léger qu'on ait lu ensemble. Je me méfie.",
    "Jamais mangé des pages aussi douces avec toi. Je vais avoir des caries.",
}

return B
