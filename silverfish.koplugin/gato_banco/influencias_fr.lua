--[[--
Chat des Cendres : influences littéraires et personnalité de base (français), traduit de influencias_pt.lua
(l'anglais sert de référence). Même format, mêmes marques et même ordre ; logique dans traca_influencias.lua.
50 phrases de base ici ; les 16 influences (70 phrases chacune) sont dans infl_fr_1 à infl_fr_4.
Le chat garde les pages, il ne les mange pas ; il est au masculin ; aucun adjectif genré pour le lecteur
ni pour {personagem}. {de_tema} = « de la mort » ; {lente} et {evento} portent leur article.
]]

local influencias = {}
for i = 1, 4 do
    for id, I in pairs(require("gato_banco.infl_fr_" .. i)) do influencias[id] = I end
end

return {
    -- événements détectés (traca_memoria.lua, M.EVENTOS), avec article, pour {evento}
    eventos = {
        morte = "un enterrement", casamento = "un mariage", viagem = "un départ", carta = "une lettre",
        tempestade = "une tempête", doenca = "une fièvre", festa = "une fête", briga = "une dispute",
        fuga = "une évasion", crime = "un crime",
    },

    -- personnalité de base (50)
    base = {
        -- survie
        { "On a rangé l'étagère aujourd'hui. Règle 5 : ne jamais se fier à une étagère rangée. J'ai déplacé « {livro} ».", situacao = "sobrevivencia", curta = "On a rangé l'étagère. Règle 5. J'ai déplacé." },
        { "Odeur de fumée dans la cuisine. Juste des toasts. J'ai vérifié les sorties quand même.", situacao = "sobrevivencia", curta = "Fumée en cuisine. Des toasts. Sorties vérifiées." },
        { "Rien de neuf à garder. Je fais des rondes sur l'étagère, sentinelle sans tour de garde.", situacao = "sobrevivencia", quando = "fome" },
        { "Quelqu'un a touché à ma cachette. Ou c'était le vent. J'ai changé de cachette quand même.", situacao = "sobrevivencia" },
        { "J'ai caché « {livro} » derrière le livre le plus ennuyeux de la maison. Règle 8. Personne ne cherche là.", situacao = "sobrevivencia", curta = "Caché derrière le livre ennuyeux. Règle 8." },
        { "Un balai dans le couloir. Je suis monté sur l'étagère, la page entre les dents.", situacao = "sobrevivencia" },
        { "S'il y a le feu, je file par la fenêtre avec {personagem} dans mon foulard. C'est décidé.", situacao = "sobrevivencia", curta = "S'il y a le feu, {personagem} part avec moi." },
        { "J'ai appris « {palavra} » lettre par lettre. Le papier brûle. La mémoire, c'est plus dur à effacer.", situacao = "sobrevivencia", curta = "Appris « {palavra} ». Papier brûlé ; mémoire, non." },
        { "Survécu à un ménage de plus. Si ça avait été {lente}, on le raconterait à la cave.", situacao = "sobrevivencia" },
        { "Trois sorties dans cette pièce. J'ai recompté. Toujours trois. Bien.", situacao = "sobrevivencia" },
        -- lecture
        { "« {livro} » a des notes de bas de page. Je l'aime déjà. C'est là qu'on oublie de regarder.", situacao = "leitura", curta = "Des notes de bas de page. Je l'aime déjà." },
        { "Une version abrégée de « {livro} » ? Non. Je veux le livre entier, avec les passages ennuyeux. Surtout ceux-là.", situacao = "leitura", curta = "Abrégé ? Non. Je veux les passages ennuyeux." },
        { "{autor} a écrit ça. J'en garde un morceau. Tu gardes le reste. C'est comme ça qu'un livre survit.", situacao = "leitura", curta = "{autor} l'a écrit. Nous, on le garde." },
        { "Ce livre a une odeur {de_tema}. Et un peu de fumée. Ou c'est moi.", situacao = "leitura", curta = "Odeur {de_tema}. Et de fumée. Ou c'est moi." },
        { "J'ai lu la première page deux fois. Règle 4. La porte était là.", situacao = "leitura" },
        { "Le mot « {palavra} » est revenu. J'ai noté où il habite.", situacao = "leitura", curta = "« {palavra} », encore. Je sais où il habite." },
        { "J'aime les livres avec une dédicace écrite à la main. Quelqu'un l'a offert. Quelqu'un l'a gardé.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "Je garde encore « {anterior} » dans mon foulard. Celui-ci ira dans l'autre coin.", situacao = "leitura", curta = "Je garde encore « {anterior} ». Celui-ci, au coin." },
        { "Une belle phrase ne sauve personne du feu. Mais c'est la première que je sauve.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "J'ai gardé tant de livres que je reconnais « {palavra} » à sa façon de s'asseoir sur la page.", situacao = "leitura", fase = "velho", curta = "Je reconnais « {palavra} » de loin." },
        -- croissance : chaque stade parle de sa propre taille
        { "Je suis un chaton. Je crois encore que chaque porte a sa clé et chaque livre son propriétaire.", situacao = "crescimento", fase = "filhote" },
        { "Je suis sorti de l'œuf il y a peu. Je connais déjà deux règles : la un et la sept. Grand-mère serait fière.", situacao = "crescimento", fase = "filhote", curta = "Je connais deux règles. La un et la sept." },
        { "J'ai grandi. Le foulard ne traîne plus par terre. Presque.", situacao = "crescimento", fase = "filhote" },
        { "Quelque chose change en moi. Je grandis comme un chapitre : d'un coup, après une longue attente.", situacao = "crescimento", quando = "muda" },
        { "Quand je serai grand, je saurai les quinze règles par cœur. Aujourd'hui, j'en sais neuf. À peu près.", situacao = "crescimento", fase = "filhote", curta = "Les quinze règles ? J'en sais neuf. Presque." },
        { "Je change. Chaque stade laisse une règle que je n'ai plus besoin de répéter à voix haute.", situacao = "crescimento", quando = "muda" },
        { "Les vieux chats me faisaient peur. Maintenant, les chatons me regardent pareil. J'ai grandi ? Ou je fais juste la tête ?", situacao = "crescimento", fase = "adulto", curta = "Les chatons ont peur de moi. J'ai grandi ?" },
        { "Avant, je gardais n'importe quelle page. Maintenant, je vérifie tout « {livro} » d'abord. L'âge a ses exigences.", situacao = "crescimento", fase = "adulto" },
        { "Mon bon œil ne voit plus si loin. La sagesse doit venir comme ça : sans demander la permission.", situacao = "crescimento", fase = "velho", curta = "Je vois moins. On dit sagesse. C'est l'âge." },
        { "À mon âge, chaque livre en rappelle un autre. Celui-ci me rappelle « {anterior} ». C'est presque un compliment.", situacao = "crescimento", fase = "velho" },
        -- le lecteur
        { "Tu as tourné la page avec ma patte dessus. Je ne me plains pas. Je note.", situacao = "leitor" },
        { "J'aime le poids de ta main sur le livre. Ça veut dire qu'il n'est pas seul.", situacao = "leitor", curta = "Une main sur le livre. Il n'est pas seul. Bien." },
        { "Tu as choisi « {livro} ». Je ne demande pas pourquoi. Je vérifie juste qui te l'a mis entre les mains.", situacao = "leitor", curta = "Tu l'as choisi. Je vérifie qui l'a mis là." },
        { "Tu es la plus grande créature que j'aie jamais vue. Et tu lis ! Alors tu es des nôtres.", situacao = "leitor", fase = "filhote" },
        { "Quand je partirai, je laisserai un œuf par ici. Apprends-lui une phrase. Règle 13.", situacao = "leitor", fase = "velho" },
        { "Tu passes beaucoup de temps avec {personagem}. Ce n'est pas de la jalousie. C'est de la vigilance.", situacao = "leitor" },
        { "Parfois tu fermes le livre d'un coup, parfois doucement. Je sais quelle nuit tu as passée.", situacao = "leitor", fase = { "adulto", "velho" } },
        { "Pas besoin de me remercier. Mais si tu laisses « {livro} » ouvert la nuit, je monte la garde.", situacao = "leitor", curta = "Laisse le livre ouvert. Je monte la garde." },
        { "Tu fais confiance à {autor}. Moi, je te fais confiance. Il faut bien que quelqu'un se méfie. Laisse-moi faire.", situacao = "leitor", curta = "Tu crois {autor}. Je me méfie pour deux." },
        { "Tu lis « {livro} », j'en garde un morceau. À la fin, à nous deux, on connaît toute l'histoire.", situacao = "leitor", curta = "Tu lis, je garde. À deux, toute l'histoire." },
        -- contexte (selon ce qui a été détecté ou l'influence la plus forte)
        { "Il y a eu {evento} dans le chapitre, et personne ne m'a appelé. J'ai fait le guet dehors.", situacao = "contexto", curta = "Il y a eu {evento}. J'ai fait le guet dehors." },
        { "Ce livre parle {de_tema} tout le temps. Moi, qui vis derrière l'étagère, je ne parle que de sorties.", situacao = "contexto" },
        { "{personagem}, encore. Je vais ouvrir un dossier rien que pour {personagem}.", situacao = "contexto", curta = "{personagem}, encore. J'ai ouvert un dossier." },
        { "Ce soir, la nuit ressemblait à {lente}. Puis la lumière s'est éteinte et ce n'était plus que la nuit.", situacao = "contexto" },
        { "Il y a eu {evento}. Les humains lisent ça et soupirent. Moi, je le lis et je vérifie que la porte est fermée.", situacao = "contexto" },
        { "{autor} a écrit pour des gens qui ont des mains. Je lis avec une patte et un œil. Ça marche.", situacao = "contexto", curta = "{autor} écrit pour des mains. Je lis à la patte." },
        { "Le mot « {palavra} » a l'air d'un mot de passe qu'on a oublié de changer.", situacao = "contexto" },
        { "Il y a le silence des bibliothèques et celui des caves. Je préfère le second : on entend qui arrive.", situacao = "contexto" },
        { "Parfois j'arrête de lire juste pour écouter la maison. Elle craque comme quelqu'un qui cache quelque chose.", situacao = "contexto" },
        { "Après « {anterior} », je croyais que plus rien ne me surprendrait. « {livro} » essaie.", situacao = "contexto" },
    },

    influencias = influencias,
}
