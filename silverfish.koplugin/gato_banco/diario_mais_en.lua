--[[--
More diary for the Ash Cat, CELLAR NOTES (English), since 07/11/2026: phase 3 of the parity with the silverfish.
Written and approved by Claude at the user's request. Appended at the end of gato_banco/diario_en.lua (which is
generated and not edited by hand). Same order as gato_banco/diario_mais_pt.lua; each line adapts the Portuguese
one. The blanks are those of traca_banco/diario_en.lua ({tema} carries its article; {de_tema} is not used).
]]

return {
    dia = {
        magro = {
            "{n} pages of “{livro}”. Not much, but well kept.",
            "Just {n} pages of “{livro}”. Pocket-sized smuggling.",
            "{n} pages of “{livro}”. Fits in a crack.",
            "A piece of “{livro}”: {n} pages. Better than nothing. Much better.",
        },
        normal = {
            "{n} pages of “{livro}”. Door shut, archive open.",
            "We kept {n} pages of “{livro}”. No witnesses.",
            "“{livro}”, {n} pages. An honest shift.",
            "{n} pages of “{livro}”, one at a time, as Grandmother taught.",
            "Another {n} pages of “{livro}” in the hiding place.",
        },
        banquete = {
            "{n} pages of “{livro}”. The scarf won't close.",
            "Big day: {n} pages of “{livro}”. Had to loosen another brick.",
            "{n} pages of “{livro}”. The cellar cats would have thrown a party.",
            "“{livro}” gave {n} pages. Carried them all in my teeth.",
        },
        enorme = {
            "{n} pages of “{livro}”. That's not reading, that's moving house.",
            "{n} pages in one day. We took half of “{livro}” down to the cellar.",
        },
        dois_livros = {
            "{n} pages. “{livro}” up front, “{livro2}” in reserve.",
            "Two books, one scarf: “{livro}” and “{livro2}”. {n} pages.",
        },
        horario = {
            madrugada = { "Read in the small hours. The best shift.", "After midnight, like the cellar cats.", "All of it in the dark. Nobody saw." },
            manha = { "Read with coffee and a window.", "Morning shift. Too much light for secrets." },
            noite = { "Read at night, door shut.", "End of the day, lights low, exits checked." },
        },
        fala = {
            filhote = { "Kept a line from {nome}: “{fala}”. I'll repeat it till I fall asleep.", "“{fala}”, said {nome}. Wrote it on my scarf." },
            adulto = { "{nome}: “{fala}”. Noted.", "“{fala}”, said {nome}. Into the file." },
            velho = { "{nome} said “{fala}”. Grandmother would have said the same.", "Line of the day, from {nome}: “{fala}”. It stays with me." },
        },
        novo = {
            "{nome} came into the story. I noted the nearest exit.",
            "New file: {nome}.",
            "{nome} arrived. Don't know whose side they're on yet.",
            "{nome} showed up. I kept an eye out.",
        },
        novos2 = {
            "{nome} and {nome2} arrived at the same time. Suspicious.",
            "Two new files: {nome} and {nome2}.",
            "Met {nome} and {nome2}. Two secrets, probably.",
        },
        evento = {
            morte = { "A funeral. I kept the name.", "Someone's gone. Someone has to remember. That's me." },
            casamento = { "Someone got married. I noted the promises.", "An altar and a promise. I'll check at the end." },
            viagem = { "Someone left. I checked they took the book.", "Bags, road, goodbye. Good day for an escape." },
            carta = { "A letter. I read it over their shoulder.", "One letter changed everything. Letters do that." },
            tempestade = { "It rained all day in the book. Not a drop in the cellar.", "Thunder in the chapter. I checked the windows." },
            doenca = { "Someone fell ill. I stayed close, in silence.", "Fever in the chapter. Vigil all night." },
            festa = { "A party. I stayed in the corner, near the exit.", "Music, people, noise. Perfect for nobody seeing me." },
            briga = { "Shouting in the chapter. I noted who started it.", "A fight. Nobody heard the quietest one. I did." },
            fuga = { "Someone escaped. I noted the route.", "An escape. Good technique. Noted." },
            crime = { "A crime. I opened a file.", "Someone did what they shouldn't. I have the clues." },
        },
        tema = { "The day smelled of {tema}.", "Everything turned around {tema}.", "The subject was {tema}. Full folder." },
        pesado = { "A lot of soot today.", "Pages that weigh down the scarf.", "A dark day of paper. Checked the exits twice." },
        leve = { "Soft pages. Nobody burnt anything.", "Light reading. Grandmother would approve." },
        fecho = {
            filhote = { "More tomorrow.", "Scarf folded, page kept.", "Grandmother would have liked today." },
            adulto = { "Exits checked.", "Filed.", "Shift over." },
            velho = { "One more page for the kittens.", "Kept. As always.", "Another day that wasn't lost." },
        },
        fecho_escuro = {
            filhote = { "Left the light on.", "Slept near the door." },
            adulto = { "Checked the door twice.", "No smoke. Still." },
            velho = { "Some days you keep so they don't happen again.", "It weighed. I kept it anyway." },
        },
        fecho_leve = {
            filhote = { "Today was a good one to keep." },
            adulto = { "No smoke. Rare. Good." },
            velho = { "Days like this are worth the whole cellar." },
        },
    },

    inicio = {
        generico = {
            "“{livro}” came into the cellar. I checked the spine.",
            "We opened “{livro}”. First page twice, as Rule 4 says.",
            "New book: “{livro}”. New file.",
            "“{livro}”. Good smell. Let's see the rest.",
            "“{livro}” has begun. I've already picked my hiding place in it.",
        },
        autor = {
            "First book by {autor}. I'm starting with the footnotes.",
            "{autor}. A new name in the archive.",
            "Getting to know {autor}. For now, polite suspicion.",
        },
        mesmo_autor = { "{autor} again. The file's already open.", "More {autor}. I know that step.", "Back to {autor}. Loyalty." },
        largou = {
            "“{anterior}” stayed halfway. Now it's “{livro}”. I noted where we stopped.",
            "We swapped “{anterior}” for “{livro}”. I left a bookmark there. Just in case.",
            "We left “{anterior}”. I won't forget. Now: “{livro}”.",
        },
        relendo = {
            "Re-reading “{livro}”. Found things I hadn't seen.",
            "“{livro}” again. Rule 10: it won't be the same story.",
            "Back to “{livro}”. My piece is still there.",
        },
    },

    fim = {
        abertura = {
            "End of “{livro}”. My piece is kept. The rest lives in you.",
            "“{livro}” is over. Filed. Well, my piece.",
            "We closed “{livro}”. Nobody saw. Perfect.",
            "Last page of “{livro}”. Read it twice.",
        },
        nome = { "File: {nome}.", "Deep down, it was about {nome}.", "If anyone asks, it was {nome}." },
        protagonista = {
            filhote = { "{nome} taught me something. I don't know what yet." },
            adulto = { "{nome} went into the folder of the ones worth it." },
            velho = { "I'll tell the kittens about {nome}. My way." },
        },
        mais_escuro = { "More smoke than “{outro}”.", "Weighed more than “{outro}”. Much more." },
        mais_leve = { "Lighter than “{outro}”. Good.", "After “{outro}”, this one was a rest." },
        serie = {
            "{ordinal} book in a row about {tema}. Is someone choosing for you? Or is it you?",
            "{ordinal} book about {tema} in a row. Noted, on my guard.",
        },
        traco = {
            amarga = { "Came out with one illusion fewer." },
            otimista = { "Came out with the ember burning brighter." },
            medrosa = { "I'll check the exits twice tonight." },
            corajosa = { "Came out walking down the middle of the room." },
            cinica = { "Noted who profited from the ending." },
            romantica = { "Kept a letter from this one in my scarf." },
            popular = { "Read it too fast. Liked it too much." },
            erudita = { "I want the old edition of this one." },
        },
        nota = {
            filhote = { "I gave it {n} paws out of 5. I thought hard." },
            adulto = { "Rating: {n} loose bricks out of 5." },
            velho = { "{n} embers out of 5. No hurry." },
        },
    },

    obsessao = {
        nova = {
            "I keep thinking about {tema}. Opened a file just for it.",
            "New obsession: {tema_s}. Archive open.",
            "I think about {tema} even in the dark. Someone put it here.",
        },
        troca = {
            "I used to think about {antes}. Now I think about {agora}. Change of shift.",
            "Out went {antes_s}, in came {agora_s}. Didn't even knock.",
            "I don't think about {antes} so much now. It's {agora_s} in every corner.",
        },
    },

    lembranca = {
        autor = {
            "Book number {n} by {autor}. I know the handwriting in the dark now.",
            "{autor} again: number {n}. Thick file.",
            "More {autor}, number {n}. Loyalty has a name.",
            "Number {n} by {autor}. The cellar cats had favourite authors too.",
        },
        aniversario = {
            "One year since “{livro}”. My piece is still whole.",
            "A year ago: “{livro}”. I remember the first page.",
            "“{livro}” has been in the archive a year. No dust.",
        },
        personagem = {
            "{nome} again. The file from “{livro}” is still open.",
            "I've known {nome} since “{livro}”. Changed? I'll check.",
            "{nome} is back. I've kept an eye out since “{livro}”.",
        },
        recorde_longo = { "“{livro}” was the biggest we ever carried. The cellar still remembers.", "Nothing weighed as much as “{livro}”. Worth every page." },
        recorde_rapido = { "We never kept anything as fast as “{livro}”.", "“{livro}” flew by. Best smuggling ever." },
        serie_tema = {
            "{n} books in a row about {tema}. I see a pattern. Do you?",
            "Another book about {tema}: that's {n}. Someone chose this. Maybe you.",
        },
    },
}
