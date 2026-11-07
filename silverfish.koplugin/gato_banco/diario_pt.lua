--[[--
Banco do diário do Gato-das-Cinzas, NOTAS DO PORÃO (português): lotes 5b-1, 5b-2 e 5b-3
(traca/cartoes/rascunhos/cat/choices-5b1.md, choices-5b2.md, choices-5b3.md).
O mesmo formato de traca_banco/diario_pt.lua; o que é por fase tem filhote, adulto e velho.
Gerado por tools/build_cat_diary.py; não editar à mão.
]]

local B = { dia = {}, inicio = {}, fim = {}, obsessao = {}, lembranca = {} }

-- O dia de leitura (5b-1)
B.dia.magro = { "{n} páginas de “{livro}”. Um pedaço pequeno. Ainda é um pedaço.", "{n} páginas de “{livro}”, guardadas no lenço." }
B.dia.normal = { "{n} páginas de “{livro}” arquivadas.", "“{livro}” entregou {n} páginas hoje.", "Hoje: “{livro}”, {n} páginas, nada de fumaça." }
B.dia.banquete = { "{n} páginas de “{livro}”. Vou precisar de outra parede.", "Levei {n} páginas de “{livro}” pro porão." }
B.dia.enorme = { "{n} páginas. Você não leu “{livro}”, contrabandeou.", "{n} páginas de “{livro}”. Ninguém guarda tanto. A gente guardou." }
B.dia.dois_livros = { "{n} páginas, divididas entre “{livro}” e “{livro2}”. Dois esconderijos.", "{n} páginas. “{livro}” ficou com a maioria. “{livro2}”, com o resto." }
B.dia.horario = { madrugada = { "Quase tudo depois da meia-noite. Menos olhos." }, manha = { "Tudo antes do almoço. Nada a esconder." }, noite = { "Luz baixa, páginas virando." } }
B.dia.fala = { filhote = { "{nome} disse “{fala}”. Decorei." }, adulto = { "{nome} disse “{fala}”. Arquivei como prova." }, velho = { "“{fala}”, disse {nome}. Vou ensinar pra um filhote." } }
B.dia.novo = { "Conheci {nome}. Conferindo as saídas.", "{nome} apareceu. Encrenca, provavelmente." }
B.dia.novos2 = { "{nome} e {nome2} apareceram. Alguém ali esconde alguma coisa." }
B.dia.evento = {
    morte = { "Alguém morreu. Guardei a última página." },
    casamento = { "Teve casamento. Promessas arquivadas, pra conferir depois." },
    viagem = { "Gente indo e vindo o dia todo. Saída demais." },
    carta = { "Alguém escreveu o que não devia. Guardei." },
    tempestade = { "Tempestade o dia todo. Bom disfarce." },
    doenca = { "Alguém de cama o dia todo. Fiquei de vigia." },
    festa = { "Teve baile. Todo mundo olhando, ninguém vigiando." },
    briga = { "Teve briga. Parede tem ouvido; hoje ouviu bastante." },
    fuga = { "Alguém fugiu. Boa saída." },
    crime = { "Sangue e pergunta. Gosto das perguntas." },
}
B.dia.tema = { "Pasta do dia: {tema}.", "De novo, {tema}. Alguém fica botando isso aí." }
B.dia.pesado = { "Página que deixa fuligem." }
B.dia.leve = { "Um dia macio de papel. Desconfio." }
B.dia.fecho = { filhote = { "Vou contar pra vó no sonho.", "" }, adulto = { "Porta fechada.", "" }, velho = { "Mais uma noite guardada.", "" } }
B.dia.fecho_escuro = { filhote = { "Dormi com uma orelha em pé.", "" }, adulto = { "Dormi em cima do livro. Por via das dúvidas.", "" }, velho = { "Tem página que eu preferia não guardar. Guardo mesmo assim.", "" } }
B.dia.fecho_leve = { filhote = { "Ronronei dormindo. Não conta.", "" }, adulto = { "Noite tranquila. Não confio.", "" }, velho = { "É por noites assim que a gente guardou os livros.", "" } }

-- Começo e fim de livro, a obsessão (5b-2)
B.inicio.generico = { "“{livro}” chegou. Ninguém veio atrás. Ótimo.", "“{livro}”. Cheirei a lombada antes. Mania antiga.", "Começamos “{livro}”. Eu fico com as notas de rodapé." }
B.inicio.autor = { "{autor}, prazer. Vou ficar de olho em você." }
B.inicio.mesmo_autor = { "De volta a {autor}. Mesma letra, páginas novas." }
B.inicio.largou = { "Largamos “{anterior}” no meio. Regra 1, cúmplice. Regra 1." }
B.inicio.relendo = { "Relendo “{livro}”. Bom. Página guardada duas vezes fica mais segura." }
B.fim.abertura = { "Última página de “{livro}”. Guardada.", "“{livro}” passou. Inteiro." }
B.fim.nome = { "Arquivado como: {nome}." }
B.fim.protagonista = { filhote = { "Quero ser como {nome} quando crescer. Talvez." }, adulto = { "{nome} vai ficar comigo um tempo. Debaixo do assoalho." }, velho = { "{nome} me lembrou a vó." } }
B.fim.mais_escuro = { "Fez “{outro}” parecer piquenique." }
B.fim.mais_leve = { "Depois de “{outro}”, esse me deixou dormir." }
B.fim.serie = { "{ordinal} livro seguido {de_tema}. Tô vendo um padrão. Eles também podem estar." }
B.fim.traco = {
    amarga = { "Esse livro levou um pouco de esperança. Eu pego de volta." },
    otimista = { "Saí acreditando que os livros vencem. De novo." },
    medrosa = { "Vou dormir de luz acesa por uns dias." },
    corajosa = { "Esse livro me deu pelo mais grosso." },
    cinica = { "Confio menos no narrador agora. E no autor." },
    romantica = { "Saí mais mole. Não espalha." },
    popular = { "Gostei. Tô investigando por quê." },
    erudita = { "Saí com cheiro de edição antiga." },
}
B.fim.nota = { filhote = { "{n} patinhas de 5." }, adulto = { "{n} tijolos soltos de 5." }, velho = { "{n} brasas de 5." } }
B.obsessao.nova = { "Não paro de pensar {tema}. Alguém plantou isso." }
B.obsessao.troca = { "Entrou {agora_s}, saiu {antes_s}. Sem barulho, como contrabando." }

-- Lembranças (5b-3); as de clima (sombrio_desde…) estão desligadas em traca_lembrancas.lua
B.lembranca.autor = { "{autor} de novo: o {n}º livro. A gente já sabe onde {autor} esconde as portas." }
B.lembranca.aniversario = { "Faz um ano que a gente terminou “{livro}”. Ainda sei o meu pedaço." }
B.lembranca.personagem = { "{nome} de novo… tenho uma pasta sobre essa figura desde “{livro}”." }
B.lembranca.recorde_longo = { "Nunca carreguei nada tão grande quanto “{livro}”. Minhas costas confirmam." }
B.lembranca.recorde_rapido = { "“{livro}” foi o mais rápido de todos. Fuga limpa." }
B.lembranca.serie_tema = { "Mais um livro {de_tema}: {n} seguidos. O que você procura, cúmplice?" }

-- More since 07/11/2026 (parity with the silverfish, phase 3): gato_banco/diario_mais_pt.lua, written by hand,
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
    local ok, M = pcall(require, "gato_banco.diario_mais_pt")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
