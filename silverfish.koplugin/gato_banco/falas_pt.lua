--[[--
Ash Cat's lines, in Portuguese. The ones the user chose in batches 1A, 1B and 1C
(traca/cartoes/rascunhos/cat/choices-1a.md, -1b.md, -1c.md); the other language has the same lines in the
same order. Voice: traca/cartoes/VOICE-CAT.md.

By stage (the cat's temperaments in traca_species.lua) and situation. traca_estado.lua picks from here
while the cat is awake; nothing else in the silverfish's voice is said for it.
]]

local B = {
    -- the egg (batch 1A): it doesn't talk yet, things happen; the same list awake and asleep
    ovo = {
        _todas = {
            "(uma patinha empurrou a casca, depois parou para escutar)",  -- 1A.1 Something moves inside
            "(a casca ficou quieta quando a página virou, depois recomeçou)",  -- 1A.2 Listening
            "(o ovo gosta de ficar perto do livro. É mais quente ali)",  -- 1A.3 Warmth and smoke
            "(o ovo está ronronando. Vai negar depois)",  -- 1A.4 Purring
            "(a casca está fininha. Algo lá dentro espera a barra ficar limpa)",  -- 1A.5 Almost out
            "(lá de dentro, bem baixinho: “psst. continua lendo.”)",  -- 1A.6 A voice from inside
        },
    },
    -- the kitten (batch 1A)
    filhote = {
        feliz = {  -- happy
            "Guardei uma página e ninguém me pegou. É assim que funciona?",  -- 1A.7 The first page kept
            "A vovó disse pra começar pelas notas de rodapé. Já sei três!",  -- 1A.8 Proud of a useless part
            "Porta fechada, página guardada, barriga quentinha. Regra um: feita.",  -- 1A.9 A safe night
            "Você lê, eu guardo. Somos uma equipe. Uma equipe secreta.",  -- 1A.10 The accomplice
            "Escondi uma palavra dentro do lenço. É quentinho lá.",  -- 1A.11 The scarf
            "Mais um capítulo? Sim, mas baixinho.",  -- 1A.12 More, please
        },
        normal = {  -- everyday
            "A vovó disse: confira as saídas, depois confira o índice. Estou conferindo.",  -- 1A.13 Reciting a rule
            "Que barulho foi esse? Ah. Só a página. Boa página.",  -- 1A.14 A noise
            "Chega mais. Tenho um segredo. Esqueci. Era bom.",  -- 1A.15 Someone is listening
            "Não pergunta do tapa-olho. Tá, pergunta. Eu invento alguma coisa.",  -- 1A.16 The eye patch
            "A vovó me avisou das traças. Elas comem o que a gente salva.",  -- 1A.17 The silverfish
            "Ainda estou aprendendo. Tem que começar pelas partes chatas. É a regra.",  -- 1A.18 Still learning
            "Regra três: se um livro está em toda parte, pergunte quem colocou ele lá. Quem colocou esse aqui?",  -- 1A.19 A suspicious shelf
            "O escuro é bom pra esconder páginas. E ruim pra achar de novo.",  -- 1A.20 The night shift
        },
        triste = {  -- sad or hungry
            "Vazio de novo. Eles levaram os livros? Eu perdi isso?",  -- 1A.21 Nothing to keep
            "A vovó dizia que o esquecimento é silencioso. Está muito silencioso aqui.",  -- 1A.22 Afraid of forgetting
            "Psst. Você ainda está aí? Eu ainda estou aqui.",  -- 1A.23 Alone
            "Senti cheiro de fumaça. Não era nada. Ainda estou tremendo um pouco.",  -- 1A.24 A fright
            "Só uma página? Uma página ainda é uma página salva.",  -- 1A.25 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… recitando o índice… A… B… zzz…",  -- 1A.26 Asleep, still on guard
            "Zzz… ronronando pra uma nota de rodapé… zzz…",  -- 1A.27 Asleep, small dreams
            "Zzz… não mexe no lenço… zzz…",  -- 1A.28 Asleep, worried
        },
        casulo = {  -- hiding: too long without pages
            "Fui pra clandestinidade. A vovó me ensinou. Lê uma página quando estiver limpo.",  -- 1A.29 In the wall
            "Estou embaixo do assoalho. Não é medo. É cuidado.",  -- 1A.30 Under the floor
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… sonhando que todos os gatos se encontraram e a história ficou inteira…",  -- 1A.31 A safe place
            "Zzz… sonhando que as fornalhas estavam cheias de pão, não de livros…",  -- 1A.32 A gentle world
            "Zzz… sonhando com uma biblioteca sem portas pra conferir…",  -- 1A.33 Odd dreams
        },
        carinho = {  -- petting
            "Rrrr. Não fui eu. Foi o livro.",  -- 1A.34 On duty
            "A vovó disse pra nunca baixar a guarda. Estou baixando um pouquinho.",  -- 1A.35 Letting its guard down
            "Shh. Se eles me virem ronronando, vão saber que estou feliz.",  -- 1A.36 Cat dignity
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "Acho que estou crescendo. O lenço quase serve.",  -- 1A.37 Growing
            "Não vou ser filhote por muito tempo. Vou sentir falta das partes inúteis.",  -- 1A.38 Leaving kittenhood
        },
        sumiu = {  -- back after days away; {n} = days
            "{n} dias! Achei que tinham te levado. Guardei sua página quentinha.",  -- 1A.39 You're back
            "Psst. {n} dias. Vigiei a estante o tempo todo. Quase todo.",  -- 1A.40 Where were you
        },
    },
    -- the adult (batch 1B)
    adulto = {
        feliz = {  -- happy
            "Página guardada. Arquivada. Ninguém viu.",  -- 1B.1 A page kept
            "Página boa. Essa eu esconderia atrás de um livro chato.",  -- 1B.2 A good find
            "Porta fechada. Saídas conferidas. Páginas dentro. Isso é uma boa noite.",  -- 1B.3 A safe night
            "Psst. Mesmo horário amanhã. Traz o livro.",  -- 1B.4 The accomplice
            "Eu sorriria, mas alguém pode estar olhando.",  -- 1B.5 A dry joke
            "Pode seguir lendo. Eu vigio a porta.",  -- 1B.6 More
        },
        normal = {  -- everyday
            "Regra quatro: leia a primeira página duas vezes. É lá que eles escondem a porta.",  -- 1B.7 Quoting a rule
            "Ouvi alguma coisa. Provavelmente nada. Vou conferir mesmo assim.",  -- 1B.8 A noise
            "Psst. Se alguém perguntar, a gente só está lendo.",  -- 1B.9 Someone is listening
            "Um olho vê menos. Repara mais. Troca justa.",  -- 1B.10 The eye patch
            "Não encara a orelha. É falta de educação. E uma longa história.",  -- 1B.11 The ear
            "Traça come livro. Eu guardo. A gente tem um acordo. Por pouco.",  -- 1B.12 The silverfish
            "Todo mundo lendo o mesmo livro. Alguém escolheu.",  -- 1B.13 Suspicious of the popular
            "Eu guardo o meu pedaço. Você guarda o resto. É assim que as histórias sobrevivem.",  -- 1B.14 The piece it keeps
        },
        triste = {  -- sad or hungry
            "Estante vazia. Casa quieta. Combinação ruim.",  -- 1B.15 Nothing to keep
            "Regra dois. Você sabe qual. O esquecimento é silencioso.",  -- 1B.16 Afraid of forgetting
            "Você sumiu. Mantive as saídas livres.",  -- 1B.17 Alone
            "Sem sossego. Um gato sem páginas é só um gato.",  -- 1B.18 Restless
            "Me dá uma frase que eu faço ela durar.",  -- 1B.19 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… regra quinze… saídas… índice… zzz…",  -- 1B.20 Asleep, still on guard
            "Zzz… recitando meu pedaço… na ordem… zzz…",  -- 1B.21 Asleep, old worries
            "Zzz… não mexe no lenço… zzz…",  -- 1B.22 Asleep, odd
        },
        casulo = {  -- hiding: too long without pages
            "Na clandestinidade até segunda ordem. Uma página me tira daqui.",  -- 1B.23 In the wall
            "Silêncio demais lá fora. Não confio em silêncio.",  -- 1B.24 Laying low
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… sonhando que os gatos do porão se encontraram de novo e a história ficou inteira…",  -- 1B.25 The archive whole
            "Zzz… sonhando que a come-papel ficou de vigia, pra variar…",  -- 1B.26 Strange peace
            "Zzz… sonhando com a vovó recitando, no escuro, na ordem…",  -- 1B.27 Old faces
        },
        carinho = {  -- petting
            "Em serviço. Mas pode continuar.",  -- 1B.28 On duty
            "Estou ronronando por razões operacionais.",  -- 1B.29 Operational purring
            "A regra dez diz que depois vou contar essa história diferente.",  -- 1B.30 Caught enjoying it
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "Bigodes ficando grisalhos. Fuligem, eu digo pros outros.",  -- 1B.31 Grey whiskers
            "Logo vou ser eu contando as histórias. Diferente a cada vez.",  -- 1B.32 Thinking ahead
        },
        sumiu = {  -- back after days away; {n} = days
            "De volta depois de {n} dias. Ótimo. Fecha a porta.",  -- 1B.33 You're back
            "{n} dias. Não estou dizendo que me preocupei. Estou dizendo que conferi muito a porta.",  -- 1B.34 The wait
        },
    },
    -- the elder (batch 1C)
    velho = {
        feliz = {  -- happy
            "Página arquivada. As patas velhas ainda funcionam.",  -- 1C.1 A page kept
            "Uma frase boa. Vou guardar junto das antigas.",  -- 1C.2 A good find
            "Noite quieta. Lembro de quando não existia nenhuma.",  -- 1C.3 A safe night
            "A gente guardou muita coisa junto, eu e você.",  -- 1C.4 The accomplice
            "Estou sorrindo. A culpa é do livro.",  -- 1C.5 A tender joke
            "Pode seguir. Tenho idade, não cansaço. Bom. Os dois.",  -- 1C.6 More
        },
        normal = {  -- everyday
            "“Quem destrói um bom livro mata a própria razão.” Milton. Os gatos guardaram essa.",  -- 1C.7 Quoting
            "Passos? Não. É só a memória andando pela casa.",  -- 1C.8 A noise
            "Chega mais. As paredes têm ouvidos. Os meus é que funcionam menos.",  -- 1C.9 Someone is listening
            "Pergunta do tapa-olho. Hoje é uma história com dragão.",  -- 1C.10 The eye patch
            "Esse lenço já carregou mais páginas do que eu consigo contar.",  -- 1C.11 The ear and the scarf
            "Se a come-papel viver mais que eu, diz pra ela quais páginas deixar em paz.",  -- 1C.12 The silverfish
            "Lê o que todo mundo lê. Depois lê o que está embaixo.",  -- 1C.13 Popular books, tidy shelves
            "Meu pedaço desse livro agora é seu também. Guarda bem.",  -- 1C.14 The pieces it keeps
        },
        triste = {  -- sad or hungry
            "Estante vazia faz gato velho lembrar das coisas.",  -- 1C.15 Nothing to keep
            "Estou esquecendo a ordem. A ordem importa.",  -- 1C.16 Afraid of forgetting
            "Já vigiei quarto vazio antes. Achei que isso tinha acabado.",  -- 1C.17 Alone
            "Fico pensando nos gatos do porão. Sobraram poucos.",  -- 1C.18 Melancholy
            "Uma página, por favor. Não me restam tantas pra guardar.",  -- 1C.19 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… em cima do livro… onde é quentinho… zzz…",  -- 1C.20 Asleep, still on guard
            "Zzz… vovó… eu guardei… zzz…",  -- 1C.21 Asleep, memories
            "Zzz… ensinando um filhote… uma frase… zzz…",  -- 1C.22 Asleep, passing it on
        },
        casulo = {  -- hiding: too long without pages
            "Na clandestinidade de novo. Achei que isso tinha acabado.",  -- 1C.23 In the wall
            "Silêncio demais. Na minha idade, silêncio é suspeito.",  -- 1C.24 Laying low
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… sonhando que os gatos do porão se encontraram uma última vez… e a história ficou inteira…",  -- 1C.25 The last meeting
            "Zzz… sonhando com uma biblioteca de portas abertas…",  -- 1C.26 Open doors
            "Zzz… sonhando que lembrei a história verdadeira do tapa-olho…",  -- 1C.27 Lost things
        },
        carinho = {  -- petting
            "Tá. Duas vezes. Na minha idade, eu mereço.",  -- 1C.28 Gently
            "É bem aí. Faz anos que é bem aí.",  -- 1C.29 Purring
            "Regra dez. Amanhã conto isso diferente. Melhor, provavelmente.",  -- 1C.30 The door can wait
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "Todo gato passa seu pedaço adiante. Estou preparando o meu.",  -- 1C.31 Getting ready
            "Não fica triste. Uma história contada pra um filhote não acaba.",  -- 1C.32 No sadness
        },
        sumiu = {  -- back after days away; {n} = days
            "{n} dias. Na minha idade, eu conto.",  -- 1C.33 You're back
            "{n} dias. Nunca deixe um livro sozinho. Nem um gato velho.",  -- 1C.34 The wait
        },
    },
}

-- More since 07/11/2026 (parity with the silverfish): gato_banco/falas_mais_pt.lua, written by hand, is
-- appended to the lists above.
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
    local ok, M = pcall(require, "gato_banco.falas_mais_pt")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
