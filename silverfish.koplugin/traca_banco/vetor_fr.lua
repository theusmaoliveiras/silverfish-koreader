--[[--
Mots du nom composé des livres (français), utilisés par traca_vetor.lua.
nomes[tema] = { texte, genre du groupe nominal FRANÇAIS ("m"/"f") } ; les adjectifs s'accordent.
tema_curto inclut sa préposition (« de mer », « d'amour ») : cheiro et peca n'en ajoutent pas.
]]

return {
    nomes = {
        amor = { "un roman d'amour", "m" },
        mar = { "une histoire de mer", "f" },
        viagem = { "un livre de route", "m" },
        medo = { "une histoire de peur", "f" },
        morte = { "un livre sur la mort", "m" },
        guerra = { "une histoire de guerre", "f" },
        familia = { "un drame de famille", "m" },
        dinheiro = { "une histoire d'argent", "f" },
        politica = { "une intrigue politique", "f" },
        loucura = { "un livre sur la folie", "m" },
        vinganca = { "une histoire de vengeance", "f" },
        ciencia = { "une aventure scientifique", "f" },
        fe = { "un livre sur la foi et le doute", "m" },
        infancia = { "une histoire d'enfance", "f" },
        natureza = { "un livre de bois et de bêtes", "m" },
        animais = { "une histoire de bêtes", "f" },
        noite = { "un livre de nuits", "m" },
        cidade = { "une histoire de ville", "f" },
        comida = { "un livre de bonne chère", "m" },
        solidao = { "un livre sur la solitude", "m" },
        arte = { "un livre sur l'art", "m" },
        liberdade = { "une histoire de liberté", "f" },
        saber = { "un livre d'idées", "m" },
        tempo = { "un livre sur le temps", "m" },
    },
    -- théâtre : « une pièce de politique »
    peca = { "une pièce %s", "f" },
    -- le thème avec sa préposition, pour « avec une odeur … » et « une pièce … »
    tema_curto = {
        morte = "de mort", amor = "d'amour", guerra = "de guerre", mar = "de mer", fe = "de foi", dinheiro = "d'argent",
        loucura = "de folie", tempo = "de temps", cidade = "de ville", natureza = "de forêt", comida = "de cuisine",
        familia = "de famille", infancia = "d'enfance", politica = "de politique", ciencia = "de science", solidao = "de solitude",
        arte = "d'art", animais = "de bêtes", noite = "de nuit", viagem = "de route", vinganca = "de vengeance",
        liberdade = "de liberté", saber = "de savoir", medo = "de peur",
    },
    adjetivos = {
        sombrio = { m = "sombre", f = "sombre" },
        luminoso = { m = "lumineux", f = "lumineuse" },
        falante = { m = "bavard", f = "bavarde" },
        calado = { m = "taciturne", f = "taciturne" },
        agitado = { m = "agité", f = "agitée" },
        parado = { m = "immobile", f = "immobile" },
    },
    e = " et ",
    cheiro = "avec une odeur %s",
    frases = { longas = "aux phrases longues", curtas = "aux phrases courtes" },
    primeira = { m = "raconté à la première personne", f = "racontée à la première personne" },
}
