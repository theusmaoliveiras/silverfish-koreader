--[[--
The Ash Cat's vocabulary for each theme (English), since 07/11/2026: phase 5 of the parity with the silverfish.
Same format and order as gato_banco/dominios_pt.lua (see
traca_banco/dominios_en.lua for how each kind fits a sentence). No politics words in the politics theme.
_causa: a bad mood with a real reason from the book, by stage; {evento} comes with "that".
]]

local D = {}

D.morte = {
    gosto = { "cold ash", "a snuffed candle", "wet earth", "funeral tea", "burnt paper" },
    cheiro = { "burnt candles", "chrysanthemums", "turned earth", "old smoke", "funeral flowers" },
    comparacao = { "a distant bell", "a candle burning down", "a letter nobody will open", "a stopped clock", "a crossed-out name" },
    exclamacao = { "Rest in peace!", "Light a candle!", "Quiet, out of respect!", "Keep the name!" },
    lugar = { "in a graveyard", "behind a headstone", "in an empty chapel", "at a wake", "in a crypt" },
    coisa = { "a wreath", "a black veil", "a nameless headstone", "a portrait with a black ribbon", "a snuffed candle" },
}
D.amor = {
    gosto = { "a perfumed letter", "honey", "chocolates", "strawberries", "sweet tea" },
    cheiro = { "roses", "a perfumed letter", "lavender", "orange blossom", "tissue paper" },
    comparacao = { "a folded note", "a promise kept", "a heart drawn in the margin", "a waltz", "a letter hidden in a scarf" },
    exclamacao = { "Oh, love!", "How romantic!", "Keep that letter!", "A promise is a promise!" },
    lugar = { "at a ball", "under a window", "in a rose garden", "on a balcony", "on a park bench" },
    coisa = { "a love letter", "a ring", "a dried rose", "an embroidered handkerchief", "a portrait in a locket" },
}
D.guerra = {
    gosto = { "gunpowder", "rust", "smoke", "mud", "hard bread" },
    cheiro = { "gunpowder", "smoke", "boot leather", "mud", "hot metal" },
    comparacao = { "a marching drum", "a torn map", "a distant cannon", "a wet trench", "a fallen flag" },
    exclamacao = { "Get down!", "Everyone to the cellar!", "Quiet in the trench!", "Fire!" },
    lugar = { "in a trench", "on the battlefield", "behind a barricade", "in the barracks", "on the front line" },
    coisa = { "a medal", "a dented helmet", "a torn flag", "a battle map", "a letter from the front" },
}
D.mar = {
    gosto = { "salt", "sea spray", "dried fish", "seaweed", "coconut water" },
    cheiro = { "sea air", "wet rope", "tar", "fish", "ship's timber" },
    comparacao = { "a breaking wave", "a blinking lighthouse", "a ship adrift", "a message in a bottle", "an anchor on the seabed" },
    exclamacao = { "Land ahoy!", "Hold the mast!", "Lower the sail!", "Fair wind!" },
    lugar = { "on deck", "in the ship's hold", "in a lighthouse", "on a quay", "at the bottom of the sea" },
    coisa = { "an anchor", "a treasure map", "a message in a bottle", "a compass", "a fishing net" },
}
D.fe = {
    gosto = { "communion wafer", "altar wine", "blessed bread", "holy water", "candle wax" },
    cheiro = { "incense", "candle wax", "cold church stone", "parchment", "altar flowers" },
    comparacao = { "a church bell", "a whispered prayer", "a lit stained-glass window", "a rosary between fingers", "a candle on an altar" },
    exclamacao = { "Heaven help us!", "Amen!", "May the books keep us!", "Thank goodness!" },
    lugar = { "in a chapel", "in a monastery", "behind the altar", "in a convent library", "in a cloister" },
    coisa = { "a rosary", "a book of psalms", "a stained-glass window", "a votive candle", "an old parchment" },
}
D.dinheiro = {
    gosto = { "old coins", "banknotes", "gold", "copper", "receipt ink" },
    cheiro = { "old coins", "a locked safe", "wallet leather", "bank ink", "new paper" },
    comparacao = { "a locked safe", "a rolling coin", "a crumpled receipt", "a disputed inheritance", "a ledger" },
    exclamacao = { "What a fortune!", "Follow the money!", "All for a few coins!", "Who pays this bill?" },
    lugar = { "in a bank", "behind a safe", "in a counting house", "in a pawnshop", "at an auction" },
    coisa = { "a gold coin", "a safe", "a will", "a ledger", "a receipt" },
}
D.loucura = {
    gosto = { "bitter medicine", "camomile tea", "chalk", "fresh paint", "nothing" },
    cheiro = { "ether", "a shut room", "old wallpaper", "medicine", "a candle at dawn" },
    comparacao = { "a clock running backwards", "a door that opens by itself", "a cracked mirror", "an echo in the hallway", "a staircase that never ends" },
    exclamacao = { "What a delirium!", "Check the door again!", "Easy, easy!", "Can nobody hear that?" },
    lugar = { "in a locked attic", "in an endless hallway", "in a room with yellow wallpaper", "in a maze", "behind the mirror" },
    coisa = { "a cracked mirror", "a letter that makes no sense", "a key that opens nothing", "a clock with no hands", "a scribbled notebook" },
}
D.tempo = {
    gosto = { "dust", "cold tea", "yellowed paper", "yesterday's bread", "faded ink" },
    cheiro = { "yellowed paper", "dust", "a wind-up clock", "an old trunk", "the attic" },
    comparacao = { "a pendulum clock", "an hourglass turning", "a faded photo", "a falling leaf", "a torn calendar" },
    exclamacao = { "How time flies!", "It's late already!", "Another year!", "Remember that?" },
    lugar = { "in an attic", "inside a clock", "in an old trunk", "in an empty station", "in an abandoned house" },
    coisa = { "an hourglass", "a pocket watch", "an old calendar", "an old photo", "a dated letter" },
}
D.cidade = {
    gosto = { "soot", "corner-café coffee", "bakery bread", "pavement rain", "tram smoke" },
    cheiro = { "soot", "coffee", "rain on tarmac", "second-hand books", "warm bread" },
    comparacao = { "a passing tram", "a lit window", "a nameless corner", "a dark alley", "a hurrying crowd" },
    exclamacao = { "Mind the tram!", "What a racket!", "Careful at the corner!", "Take the shortcut!" },
    lugar = { "in an alley", "on a corner", "in a second-hand bookshop", "under a bridge", "on a rooftop" },
    coisa = { "a tram ticket", "a street lamp", "a boarding-house key", "a city map", "yesterday's paper" },
}
D.natureza = {
    gosto = { "leaves", "dew", "earth", "moss", "rain" },
    cheiro = { "wet earth", "pine", "moss", "rain", "cut grass" },
    comparacao = { "a running river", "an old tree", "wind in the bushes", "a falling leaf", "a storm coming" },
    exclamacao = { "What a sky!", "Here comes the rain!", "Listen to the wind!", "Mind the roots!" },
    lugar = { "deep in the woods", "under a tree", "on a riverbank", "in a clearing", "in a burrow" },
    coisa = { "a dry leaf", "a smooth stone", "a twig", "an empty nest", "a feather" },
}
D.comida = {
    gosto = { "warm bread", "soup", "cheese", "Grandmother's cake", "tea with honey" },
    cheiro = { "warm bread", "soup on the stove", "cinnamon", "fresh coffee", "cake just out of the oven" },
    comparacao = { "a pot on the stove", "a laid table", "a slice of cake", "a feast", "a steaming cup" },
    exclamacao = { "What a feast!", "Help yourself!", "Pass the bread!", "Smells like dinner!" },
    lugar = { "in a kitchen", "in a pantry", "in a bakery", "under the table", "at an inn" },
    coisa = { "a wooden spoon", "a loaf", "a pot", "a jar of honey", "a checked tablecloth" },
}
D.familia = {
    gosto = { "Sunday lunch", "birthday cake", "Grandmother's soup", "afternoon tea", "home-made sweets" },
    cheiro = { "Grandmother's house", "a family trunk", "an old album", "clean sheets", "Sunday lunch" },
    comparacao = { "a photo album", "a family tree", "a will read out loud", "a full table", "a family secret" },
    exclamacao = { "Oh, family!", "Everyone to the table!", "This stays between us!", "What an inheritance!" },
    lugar = { "in a family home", "in the dining room", "in a big old house", "in the back room", "in a portrait on the wall" },
    coisa = { "a photo album", "a family ring", "a will", "an old portrait", "a family tree" },
}
D.infancia = {
    gosto = { "sweets", "warm milk", "biscuits", "lollipops", "apples" },
    cheiro = { "crayons", "sharpened pencils", "sweets", "talcum powder", "a new exercise book" },
    comparacao = { "a spinning top", "a balloon getting away", "a kite in the sky", "a game of hide-and-seek", "a chalk drawing" },
    exclamacao = { "Found you!", "Tag!", "Again!", "That's not fair!" },
    lugar = { "in a back garden", "in a tree house", "under the bed", "in a child's hiding place", "in a classroom" },
    coisa = { "a spinning top", "a marble", "a sketchbook", "a teddy bear", "a kite" },
}
D.politica = {
    gosto = { "sealing wax", "parchment ink", "banquet wine", "throne dust", "headed paper" },
    cheiro = { "sealing wax", "a closed hall", "an old carpet", "parchment", "palace candles" },
    comparacao = { "a crooked crown", "an empty throne", "a broken seal", "a long speech", "a palace staircase" },
    exclamacao = { "Long live the crown!", "Silence in the hall!", "What a speech!", "Make way!" },
    lugar = { "in a palace", "in a throne room", "in a tower", "in a crowded square", "in a palace corridor" },
    coisa = { "a crown", "a wax seal", "a sceptre", "a sealed parchment", "a banner" },
}
D.ciencia = {
    gosto = { "alcohol", "chalk", "iron", "laboratory dust", "pen ink" },
    cheiro = { "alcohol", "experiment smoke", "ozone", "burnt paper", "metal" },
    comparacao = { "a boiling test tube", "a turning cog", "a star in a telescope", "a formula on the blackboard", "a spark" },
    exclamacao = { "Eureka!", "It worked!", "Mind the spark!", "Write that down!" },
    lugar = { "in a laboratory", "in an observatory", "in a workshop", "behind a machine", "in a classroom" },
    coisa = { "a test tube", "a magnifying glass", "a cog", "a telescope", "a notebook of formulas" },
}
D.solidao = {
    gosto = { "cold tea", "bread for one", "silence", "reheated coffee", "nothing" },
    cheiro = { "an empty room", "cold tea", "dust", "a shut window", "a house with nobody in it" },
    comparacao = { "a lighthouse with no ships", "an empty chair", "a letter with no reply", "an echo", "a lone candle" },
    exclamacao = { "Is anyone there?", "How quiet!", "Stay a while!", "Nobody?" },
    lugar = { "in an empty room", "in a house with nobody in it", "on an island", "in a lighthouse", "on a station bench" },
    coisa = { "an empty chair", "a letter with no reply", "a single cup", "a key with no door", "a portrait turned to the wall" },
}
D.arte = {
    gosto = { "oil paint", "charcoal", "varnish", "watercolour", "drawing paper" },
    cheiro = { "fresh paint", "turpentine", "charcoal", "drawing paper", "varnish" },
    comparacao = { "an unfinished painting", "a line learnt by heart", "a musical score", "a statue", "a poem in the margin" },
    exclamacao = { "What a work!", "Bravo!", "Keep that line!", "How beautiful!" },
    lugar = { "in a studio", "in a museum", "in a theatre", "in a concert hall", "behind a canvas" },
    coisa = { "a paintbrush", "a score", "a poem", "a blank canvas", "a sketchbook" },
}
D.animais = {
    gosto = { "milk", "fish", "grass", "kibble", "cheese" },
    cheiro = { "wet fur", "a stable", "a burrow", "hay", "fish" },
    comparacao = { "a wolf in the snow", "a galloping horse", "a crow at the window", "a cat on a roof", "an owl on watch" },
    exclamacao = { "Miaow!", "Look, an animal!", "Psst, little one!", "Clever beast!" },
    lugar = { "in a burrow", "in a stable", "in a nest", "on a roof", "in a barn" },
    coisa = { "a feather", "a collar", "a paw print", "a nest", "a cat's bell" },
}
D.noite = {
    gosto = { "dew", "midnight tea", "darkness", "warm milk", "cold coffee" },
    cheiro = { "candles", "dew", "night jasmine", "an oil lamp", "the small hours" },
    comparacao = { "a full moon", "a lit lamp", "an owl on watch", "a window lit in the dark", "a bell at midnight" },
    exclamacao = { "Psst!", "Lights out!", "Midnight!", "Who's there?" },
    lugar = { "under the moon", "on a roof at night", "in a dark street", "in a cellar", "by a street lamp" },
    coisa = { "an oil lamp", "a candle", "a lantern", "a stone owl", "a clock striking midnight" },
}
D.viagem = {
    gosto = { "road dust", "travel bread", "station coffee", "roadside fruit", "water from a flask" },
    cheiro = { "road dust", "train smoke", "a leather suitcase", "a station", "an old map" },
    comparacao = { "a train pulling out", "an endless road", "a folded map", "a closed suitcase", "a distant whistle" },
    exclamacao = { "We're off!", "All aboard!", "Follow the map!", "Here's the station!" },
    lugar = { "on a train", "at a station", "at an inn", "by the roadside", "in a carriage" },
    coisa = { "a suitcase", "a map", "a train ticket", "a compass", "a flask" },
}
D.vinganca = {
    gosto = { "poison", "iron", "bile", "bitter wine", "ash" },
    cheiro = { "poison", "gunpowder", "smoke", "a blade", "a burnt letter" },
    comparacao = { "a hidden ember", "a blade kept back", "an old debt", "a burnt letter", "a bad promise" },
    exclamacao = { "This isn't over!", "I don't forget!", "Watch out!", "Now then!" },
    lugar = { "at a duel", "behind a curtain", "in a dark corridor", "at a masked ball", "in a cell" },
    coisa = { "a thrown glove", "a dagger", "a vial of poison", "a mask", "an anonymous letter" },
}
D.liberdade = {
    gosto = { "fresh air", "wind", "shared bread", "spring water", "rain" },
    cheiro = { "wind", "open fields", "the open sea", "an open door", "morning" },
    comparacao = { "an open cage", "a bird in flight", "an unlocked door", "a broken chain", "a window flung open" },
    exclamacao = { "Run!", "Open the door!", "Now!", "Free!" },
    lugar = { "in the open", "in an open field", "outside the cage", "on top of a hill", "outside" },
    coisa = { "a key", "a broken chain", "an empty cage", "an open door", "a wing" },
}
D.saber = {
    gosto = { "old paper", "ink", "spine glue", "library dust", "parchment" },
    cheiro = { "old paper", "a library", "ink", "a leather spine", "shelf dust" },
    comparacao = { "an open encyclopaedia", "a well-made index", "a long footnote", "a whole library", "a worn dictionary" },
    exclamacao = { "Check the index!", "What a footnote!", "Noted!", "I know this one!" },
    lugar = { "in a library", "in an archive", "on a high shelf", "in a second-hand bookshop", "in a reading room" },
    coisa = { "a dictionary", "an index", "an errata slip", "a first edition", "an encyclopaedia" },
}
D.medo = {
    gosto = { "smoke", "cellar dust", "rust", "a snuffed candle", "fright" },
    cheiro = { "smoke", "a shut cellar", "mould", "melted wax", "something burnt" },
    comparacao = { "a step in the dark", "a creaking door", "a shadow on the wall", "a whisper in the hallway", "a candle going out" },
    exclamacao = { "Psst! Stay close!", "Who's there?", "Check the door!", "Run!" },
    lugar = { "in a dark cellar", "behind the wall", "in an unlit hallway", "under the stairs", "in an attic" },
    coisa = { "a snuffed candle", "a rusty key", "a portrait that watches", "a locked door", "a cobweb" },
}

-- Invented cause: a bad mood gets a real reason (the standout event of a recent chapter).
D._causa = {
    eventos = {
        morte = "that death", casamento = "that wedding", viagem = "that journey", carta = "that letter",
        tempestade = "that storm", doenca = "that fever", festa = "that party", briga = "that fight",
        fuga = "that escape", crime = "that crime",
    },
    filhote = {
        "I woke up with my ears down. Must be {evento} in “{livro}”.",
        "I don't feel like anything today. I think it was {evento} in “{livro}”.",
        "I don't know why I'm like this. Or I do: {evento} in “{livro}”.",
        "I can't get it out of my head: {evento} in “{livro}”.",
    },
    adulto = {
        "Bad mood. Must be {evento} in “{livro}”. Still filing it.",
        "Woke up with my fur on end. It's {evento} in “{livro}”, I'm sure.",
        "If I'm short with you today, blame {evento} in “{livro}”.",
        "Don't ask me anything today. It's {evento} in “{livro}”, still.",
    },
    velho = {
        "A scarf-pulled-up kind of day. It's {evento} in “{livro}”.",
        "At my age, {evento} in “{livro}” weighs more.",
        "I can't forget {evento} in “{livro}”. Grandmother would know what to say.",
        "The cellar's cold today. It's {evento} in “{livro}”, still.",
    },
}

return D
