--[[--
Banco do diário do Gato-das-Cinzas, NOTAS DO PORÃO (inglês): lotes 5b-1, 5b-2 e 5b-3
(traca/cartoes/rascunhos/cat/choices-5b1.md, choices-5b2.md, choices-5b3.md).
O mesmo formato de traca_banco/diario_en.lua; o que é por fase tem filhote, adulto e velho.
Gerado por tools/build_cat_diary.py; não editar à mão.
]]

local B = { dia = {}, inicio = {}, fim = {}, obsessao = {}, lembranca = {} }

-- O dia de leitura (5b-1)
B.dia.magro = { "{n} pages of “{livro}”. A small piece. Still a piece.", "{n} pages of “{livro}”, tucked into the scarf." }
B.dia.normal = { "{n} pages of “{livro}” filed.", "“{livro}” gave up {n} pages today.", "Today: “{livro}”, {n} pages, no smoke." }
B.dia.banquete = { "{n} pages of “{livro}”. I'll need another wall.", "Carried {n} pages of “{livro}” down to the cellar." }
B.dia.enorme = { "{n} pages. You didn't read “{livro}”, you smuggled it out.", "{n} pages of “{livro}”. Nobody keeps that much. We did." }
B.dia.dois_livros = { "{n} pages, split between “{livro}” and “{livro2}”. Two hiding places.", "{n} pages. “{livro}” got most of them. “{livro2}” got the rest." }
B.dia.horario = { madrugada = { "Most of it after midnight. Fewer eyes." }, manha = { "All of it before lunch. Nothing to hide." }, noite = { "Lamps low, pages turning." } }
B.dia.fala = { filhote = { "{nome} said “{fala}”. I learned it by heart." }, adulto = { "{nome} said “{fala}”. Filed as evidence." }, velho = { "“{fala}”, said {nome}. I'll teach it to a kitten." } }
B.dia.novo = { "Met {nome}. Checking for exits.", "{nome} appeared. Trouble, probably." }
B.dia.novos2 = { "{nome} and {nome2} showed up. One of them is hiding something." }
B.dia.evento = {
    morte = { "Someone died. I kept their last page." },
    casamento = { "A wedding. Promises filed, to be checked later." },
    viagem = { "People leaving and arriving all day. Too many exits." },
    carta = { "Someone wrote what they shouldn't have. Kept it." },
    tempestade = { "Storm all day. Good cover." },
    doenca = { "Someone in bed all day. I kept watch." },
    festa = { "A ball. Everyone looking, nobody watching." },
    briga = { "A fight. Walls have ears; today they heard plenty." },
    fuga = { "Someone ran away. Good exit." },
    crime = { "Blood and questions. I like the questions." },
}
B.dia.tema = { "Today's file: {tema}.", "Again, {tema}. Someone keeps putting it there." }
B.dia.pesado = { "Pages that leave soot." }
B.dia.leve = { "A soft day of paper. Suspicious." }
B.dia.fecho = { filhote = { "I'll tell Grandmother in my dream.", "" }, adulto = { "Door shut.", "" }, velho = { "Another night kept.", "" } }
B.dia.fecho_escuro = { filhote = { "Slept with one ear up.", "" }, adulto = { "Slept on top of the book. Just in case.", "" }, velho = { "Some pages I'd rather not keep. I keep them anyway.", "" } }
B.dia.fecho_leve = { filhote = { "Purred in my sleep. Don't tell.", "" }, adulto = { "A quiet night. I don't trust it.", "" }, velho = { "Nights like this are why we kept the books.", "" } }

-- Começo e fim de livro, a obsessão (5b-2)
B.inicio.generico = { "“{livro}” arrived. Nobody followed it. Good.", "“{livro}”. I sniffed the spine first. Old habit.", "We begin “{livro}”. I'll take the footnotes." }
B.inicio.autor = { "{autor}, nice to meet you. I'll be keeping an eye on you." }
B.inicio.mesmo_autor = { "Back to {autor}. Same handwriting, new pages." }
B.inicio.largou = { "Left “{anterior}” halfway. Rule 1, accomplice. Rule 1." }
B.inicio.relendo = { "Re-reading “{livro}”. Good. A page kept twice is safer." }
B.fim.abertura = { "Last page of “{livro}”. Kept.", "“{livro}” got through. Whole." }
B.fim.nome = { "Filed under: {nome}." }
B.fim.protagonista = { filhote = { "I want to be like {nome} when I grow up. Maybe." }, adulto = { "{nome} will stay with me a while. Under the floorboards." }, velho = { "{nome} reminded me of Grandmother." } }
B.fim.mais_escuro = { "Made “{outro}” look like a picnic." }
B.fim.mais_leve = { "After “{outro}”, this one let me sleep." }
B.fim.serie = { "{ordinal} book in a row about {tema}. I see a pattern. So might they." }
B.fim.traco = {
    amarga = { "This book took a little hope. I'll get it back." },
    otimista = { "Came out believing the books win. Again." },
    medrosa = { "I'll be sleeping with the light on for a while." },
    corajosa = { "This book gave me thicker fur." },
    cinica = { "I trust the narrator less now. And the author." },
    romantica = { "Came out softer. Don't spread it around." },
    popular = { "I enjoyed it. I'm investigating why." },
    erudita = { "Came out smelling of old editions." },
}
B.fim.nota = { filhote = { "{n} paws out of 5." }, adulto = { "{n} loose bricks out of 5." }, velho = { "{n} embers out of 5." } }
B.obsessao.nova = { "Can't stop thinking about {tema}. Someone planted it." }
B.obsessao.troca = { "In came {agora_s}, out went {antes_s}. Quietly, like contraband." }

-- Lembranças (5b-3); as de clima (sombrio_desde…) estão desligadas em traca_lembrancas.lua
B.lembranca.autor = { "{autor} again: book number {n}. We know where they hide the doors." }
B.lembranca.aniversario = { "One year since we finished “{livro}”. I still know my piece." }
B.lembranca.personagem = { "{nome} again… I've had a file on them since “{livro}”." }
B.lembranca.recorde_longo = { "Never carried anything as big as “{livro}”. My back says so." }
B.lembranca.recorde_rapido = { "“{livro}” was the fastest ever. A clean getaway." }
B.lembranca.serie_tema = { "Another book about {tema}: {n} in a row. What are you looking for, accomplice?" }

-- More since 07/11/2026 (parity with the silverfish, phase 3): gato_banco/diario_mais_en.lua, written by hand,
-- is appended to the lists above.
do
    local function juntar(a, b)
        for k, v in pairs(b) do
            if type(v) == "table" and type(a[k]) == "table" then
                if type(v[1]) == "string" then
                    for _, x in ipairs(v) do a[k][#a[k] + 1] = x end
                else
                    juntar(a[k], v)
                end
            elseif a[k] == nil then
                a[k] = v
            end
        end
    end
    local ok, M = pcall(require, "gato_banco.diario_mais_en")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
