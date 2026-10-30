--[[--
A vida da Traça: fome, humor, evolução e hibernação.

Lógica pura (sem dependências do KOReader), para poder ser testada fora dele.
Todos os tempos são em segundos desde a época (os.time()).
]]

local Lingua = require("traca_lingua")
local Voz = require("traca_voz")
local T = Lingua.t

local Estado = {}

Estado.FOME_POR_HORA = 100 / 48     -- barriga cheia esvazia em 2 dias
Estado.HUMOR_POR_HORA = 100 / 72    -- humor cheio some em 3 dias
Estado.LETRAS_POR_PONTO = 300       -- 300 letras = +1 de barriga (uma página ≈ +5)
Estado.HIBERNA_APOS = 3 * 24 * 3600 -- barriga vazia há 3 dias: se esconde na lombada
Estado.CARINHO_INTERVALO = 3600     -- um carinho por hora conta
Estado.REFEICAO_RECENTE = 120       -- fica "feliz" até 2 min depois de comer
Estado.LENDO_AGORA = 30 * 60        -- leu nos últimos 30 min: está lendo (de noite, fica acordada)
Estado.PAUSA_SESSAO = 30 * 60       -- pausa maior que isso começa outra sessão de leitura
Estado.FALAS_RECENTES = 80          -- quantas falas recentes ela evita repetir (80 desde a Etapa 4 da voz: com o
                                    -- sorteio com peso, as poucas falas que combinam com ela voltavam a cada 40)

-- Traça-dos-livros: não faz metamorfose, cresce trocando de pele.
-- temperamento: "ovo", "jovem" (ansiosa, insegura) ou "velha" (carrancuda, sabe demais).
Estado.FASES = {
    { nome = "ovo",    titulo = T"ovo",    min = 0,       temperamento = "ovo" },
    { nome = "ninfa",  titulo = T"ninfa",  min = 3000,    temperamento = "jovem",
      aviso = T"O ovo rachou! Nasceu uma ninfa. Ela já parece preocupada." },   -- ~2 páginas
    { nome = "jovem",  titulo = T"jovem",  min = 150000,  temperamento = "jovem",
      aviso = T"A Traça trocou de pele e cresceu. Continua nervosa." },         -- ~100 páginas
    { nome = "adulta", titulo = T"adulta", min = 600000,  temperamento = "velha",
      aviso = T"A Traça virou adulta. Leu o suficiente para ficar desconfiada do mundo." },
    { nome = "ancia",  titulo = T"anciã",  min = 1500000, temperamento = "velha",
      aviso = T"A Traça virou anciã. Sabe demais. Carrega o peso de todos os livros." },
}

local function limitar(v)
    return math.max(0, math.min(100, v))
end

function Estado.novo(agora)
    return {
        nascimento = agora,
        atualizado = agora,
        barriga = 60,
        humor = 70,
        letras = 0,
        paginas = 0,
        carinho_em = 0,
        hibernando = false,
    }
end

-- Campos que, quando existem, precisam ser tabelas.
local CAMPOS_TABELA = { "temas", "livros", "diario", "linhagem", "resenhas", "tracos", "tracos_nivel",
                        "falas_recentes", "dia", "comentario_pendente", "sim_terminados", "sim_sublinhados",
                        "lembrancas", "lembranca_pendente", "vistas", "ritmo", "cartao_pendente", "gravado",
                        "cartoes_ditos", "influencias" }

--- Garante que um estado lido do disco tem todos os campos, com os tipos certos.
-- Campo básico ausente, de tipo errado ou NaN volta ao valor inicial; tabela de tipo errado é descartada;
-- barriga e humor ficam entre 0 e 100.
function Estado.normalizar(s, agora)
    local base = Estado.novo(agora)
    if type(s) ~= "table" then return base end
    for k, v in pairs(base) do
        if type(s[k]) ~= type(v) or s[k] ~= s[k] then s[k] = v end
    end
    for _, k in ipairs(CAMPOS_TABELA) do
        if s[k] ~= nil and type(s[k]) ~= "table" then s[k] = nil end
    end
    s.barriga, s.humor = limitar(s.barriga), limitar(s.humor)
    if s.letras < 0 then s.letras = 0 end
    if s.paginas < 0 then s.paginas = 0 end
    return s
end

--- Aplica a passagem do tempo desde a última atualização.
function Estado.passarTempo(s, agora)
    local dt = agora - s.atualizado
    if dt <= 0 then -- relógio voltou (ou nada passou): não pune
        s.atualizado = math.max(s.atualizado, agora)
        return
    end
    local horas = dt / 3600
    local barriga_antes = s.barriga
    s.barriga = limitar(s.barriga - horas * Estado.FOME_POR_HORA)
    local fator = s.barriga < 20 and 2 or 1 -- com fome, o humor cai mais rápido
    s.humor = limitar(s.humor - horas * Estado.HUMOR_POR_HORA * fator)
    if s.barriga <= 0 then
        if not s.vazio_desde then
            local horas_ate_zerar = barriga_antes / Estado.FOME_POR_HORA
            s.vazio_desde = s.atualizado + math.floor(horas_ate_zerar * 3600)
        end
        if agora - s.vazio_desde >= Estado.HIBERNA_APOS then
            s.hibernando = true
        end
    end
    s.atualizado = agora
end

function Estado.fase(s)
    if s.dev_fase then  -- modo dev: fase forçada só para teste
        for _, f in ipairs(Estado.FASES) do if f.nome == s.dev_fase then return f end end
    end
    local atual = Estado.FASES[1]
    for _, f in ipairs(Estado.FASES) do
        if s.letras >= f.min then atual = f end
    end
    return atual
end

--- Próxima fase e quantas letras faltam (nil se já é a última).
function Estado.proximaFase(s)
    for _, f in ipairs(Estado.FASES) do
        if s.letras < f.min then return f, f.min - s.letras end
    end
end

--- Letras por página deste leitor (média do que ela comeu), ou 1.500 antes de ter base.
function Estado.letrasPorPagina(s)
    local p = s.paginas or 0
    if p < 20 then return 1500 end
    return math.max(500, math.min(4000, (s.letras or 0) / p))
end

--- Progresso até a próxima fase (a anciã caminha até o fim do ciclo, quando põe o ovo).
-- Devolve { fase, proxima (nil na anciã), fracao 0..1, paginas que faltam }.
function Estado.progressoFase(s)
    local fase = Estado.fase(s)
    local prox, faltam = Estado.proximaFase(s)
    local alvo = prox and prox.min or Estado.FIM_CICLO
    faltam = faltam or math.max(0, alvo - s.letras)
    local fracao = math.max(0, math.min(1, (s.letras - fase.min) / math.max(1, alvo - fase.min)))
    local paginas = faltam > 0 and math.max(1, math.ceil(faltam / Estado.letrasPorPagina(s))) or 0
    return { fase = fase, proxima = prox, fracao = fracao, paginas = paginas }
end

--- Alimenta com letras lidas. Retorna o que aconteceu: {evoluiu = fase, acordou = true}.
-- onde (opcional): { livro = "Título", capitulo = "Cap. VII" } da página comida.
function Estado.comer(s, letras, palavra, agora, onde)
    Estado.passarTempo(s, agora)
    local ocorreu = {}
    if not letras or letras <= 0 then return ocorreu end
    local fase_antes = Estado.fase(s)
    s.letras = s.letras + letras
    s.paginas = s.paginas + 1
    local pontos = letras / Estado.LETRAS_POR_PONTO
    s.barriga = limitar(s.barriga + pontos)
    s.humor = limitar(s.humor + pontos * 0.5)
    s.vazio_desde = nil
    -- sessão: uma pausa longa começa outra
    if not s.ultima_refeicao or agora - s.ultima_refeicao > Estado.PAUSA_SESSAO then
        s.sessao_inicio, s.sessao_paginas = agora, 0
    end
    s.sessao_paginas = (s.sessao_paginas or 0) + 1
    s.ultima_refeicao = agora
    if palavra then s.ultima_palavra = palavra end
    if onde then
        s.ultimo_livro = onde.livro or s.ultimo_livro
        s.ultimo_capitulo = onde.capitulo
        s.ultimo_arquivo = onde.arquivo or s.ultimo_arquivo
        s.ultimo_progresso = onde.progresso
    end
    local dia = os.date("%Y-%m-%d", agora)
    if s.hoje ~= dia then
        -- sequência de dias seguidos lendo (s.hoje ainda é o último dia em que ela comeu)
        local ontem = os.date("%Y-%m-%d", agora - 86400)
        s.sequencia = s.hoje == ontem and (s.sequencia or 1) + 1 or 1
        s.hoje, s.paginas_hoje = dia, 0
        s.dias_lidos = (s.dias_lidos or 0) + 1
    end
    s.paginas_hoje = (s.paginas_hoje or 0) + 1
    if s.paginas_hoje > (s.recorde_dia or 0) and (s.recorde_dia or 0) >= 10 then s.recorde_em = dia end
    s.recorde_dia = math.max(s.recorde_dia or 0, s.paginas_hoje)
    if tonumber(os.date("%H", agora)) < 5 then s.madrugada = true end
    if s.hibernando then
        s.hibernando = false
        ocorreu.acordou = true
    end
    local fase_depois = Estado.fase(s)
    if fase_depois ~= fase_antes then ocorreu.evoluiu = fase_depois end
    if s.letras >= Estado.FIM_CICLO and not s.dev_fase then ocorreu.fim_ciclo = true end
    return ocorreu
end

-- Ciclo de vida ----------------------------------------------------------------------
-- Depois de muita leitura como anciã, ela põe um ovo e morre. Fica um memorial; o ovo
-- herda a obsessão dela.
Estado.FIM_CICLO = 3000000  -- ~2.000 páginas

local ULTIMAS = {
    "Li tudo o que podia. O resto é com você, ovo.",
    "Deixo um ovo e uma opinião. Os dois vão dar trabalho.",
    "Fechem a capa devagar. Eu sempre odiei barulho.",
    "Não chorem. Leiam. É a mesma coisa, só que com mais papel.",
    "Foi uma vida de cola e de frases. Poderia ter sido pior. Poderia ter sido um best-seller.",
}

-- Citação favorita da geração: a fala marcante do livro mais bem avaliado por ela.
local function citacaoDaGeracao(s)
    local melhor
    for _, r in ipairs(s.resenhas or {}) do
        if (r.geracao or 1) == (s.geracao or 1) and r.citacao and (not melhor or r.nota > melhor.nota) then melhor = r end
    end
    return melhor and string.format("“%s” — %s, %s", melhor.citacao.fala, melhor.citacao.nome, melhor.livro)
end

local CAMPOS_DA_LINHAGEM = { linhagem = true, geracao = true, boasvindas = true, resenhas = true, lembrancas = true }

--- Encerra o ciclo: guarda o memorial em s.linhagem e transforma `s` num ovo novo.
-- extras: { citacao = "trecho — livro" } (opcional, vem do Caderno).
function Estado.renascer(s, agora, extras, sorteio)
    sorteio = sorteio or math.random
    local livros = {}
    for titulo, L in pairs(s.livros or {}) do livros[#livros + 1] = { titulo, L.inicio or 0 } end
    table.sort(livros, function(a, b) return a[2] < b[2] end)
    local titulos = {}
    for i = 1, math.min(60, #livros) do titulos[i] = livros[i][1] end
    local memorias = {}
    local d = s.diario or {}
    for i = math.max(1, #d - 4), #d do memorias[#memorias + 1] = d[i].texto end
    local memorial = {
        geracao = s.geracao or 1, nascimento = s.nascimento, morte = agora,
        letras = s.letras, paginas = s.paginas, dias_lidos = s.dias_lidos, tema = s.tema_dominante,
        palavra = s.ultima_palavra, livros = titulos, memorias = memorias,
        citacao = (extras and extras.citacao) or citacaoDaGeracao(s), ultimas = ULTIMAS[sorteio(#ULTIMAS)],
    }
    local tracos_mae = s.tracos
    if tracos_mae then
        memorial.tracos = {}
        for k, v in pairs(tracos_mae) do memorial.tracos[k] = v end
    end
    local linhagem = s.linhagem or {}
    linhagem[#linhagem + 1] = memorial
    local heranca = s.tema_dominante
    for k in pairs(s) do if not CAMPOS_DA_LINHAGEM[k] then s[k] = nil end end
    for k, v in pairs(Estado.novo(agora)) do s[k] = v end
    s.linhagem, s.geracao, s.boasvindas = linhagem, memorial.geracao + 1, true
    if heranca then
        s.heranca, s.tema_dominante, s.temas = heranca, heranca, { [heranca] = 20 }
    end
    -- o ovo nasce com 30% do jeito da mãe
    if tracos_mae then
        s.tracos, s.tracos_nivel = {}, {}
        local ok, Tracos = pcall(require, "traca_tracos")
        for k, v in pairs(tracos_mae) do
            s.tracos[k] = v * 0.3
            if ok then s.tracos_nivel[k] = Tracos.nivel(s.tracos[k]) end
        end
    end
    return memorial
end

--- Páginas e dias de leitura somando todas as gerações (as conquistas são do leitor).
function Estado.totais(s)
    local paginas, dias = s.paginas or 0, s.dias_lidos or 0
    for _, m in ipairs(s.linhagem or {}) do
        paginas, dias = paginas + (m.paginas or 0), dias + (m.dias_lidos or 0)
    end
    return paginas, dias
end

-- Marcos (conquistas) ----------------------------------------------------------------
-- Cada marco: { titulo, descricao, atual, meta }. "atual >= meta" = conquistado.
-- Valem para a vida toda do leitor: uma geração anterior que chegou lá também conta.
function Estado.marcos(s, extras)
    extras = extras or {}
    local paginas, livros = Estado.totais(s), extras.livros_terminados or 0
    local function fase_ok(nome)
        local alvo
        for _, f in ipairs(Estado.FASES) do if f.nome == nome then alvo = f.min end end
        return ((s.letras or 0) >= alvo or #(s.linhagem or {}) > 0) and 1 or 0
    end
    local lista = {
        { "PRIMEIRA MORDIDA", "COMEU A 1ª PÁGINA", paginas, 1 },
        { "CEM PÁGINAS", "100 PÁGINAS COMIDAS", paginas, 100 },
        { "MIL PÁGINAS", "1.000 PÁGINAS COMIDAS", paginas, 1000 },
        { "CINCO MIL", "5.000 PÁGINAS COMIDAS", paginas, 5000 },
        { "DEZ MIL", "10.000 PÁGINAS COMIDAS", paginas, 10000 },
        { "NASCEU", "SAIU DO OVO", fase_ok("ninfa"), 1 },
        { "PRIMEIRA MUDA", "VIROU JOVEM", fase_ok("jovem"), 1 },
        { "ADULTA", "LEU O BASTANTE PARA DESCONFIAR", fase_ok("adulta"), 1 },
        { "ANCIÃ", "SABE DEMAIS", fase_ok("ancia"), 1 },
        { "PRIMEIRO LIVRO", "TERMINOU 1 LIVRO", livros, 1 },
        { "ESTANTE", "TERMINOU 5 LIVROS", livros, 5 },
        { "PRATELEIRA CHEIA", "TERMINOU 10 LIVROS", livros, 10 },
        { "BIBLIÓFAGA", "TERMINOU 25 LIVROS", livros, 25 },
        { "BIBLIOTECA", "TERMINOU 50 LIVROS", livros, 50 },
        { "MARATONA", "50 PÁGINAS NUM DIA", s.recorde_dia or 0, 50 },
        { "MADRUGADA", "LEU DEPOIS DAS 2H", s.madrugada and 1 or 0, 1 },
        { "OBSESSÃO", "UM TEMA TOMOU CONTA", s.tema_dominante and 1 or 0, 1 },
        { "DIVIDIDA", "DOIS TEMAS OPOSTOS", extras.ambivalente and 1 or 0, 1 },
        { "COLECIONADORA", "50 SUBLINHADOS", extras.sublinhados or 0, 50 },
        { "LINHAGEM", "UMA GERAÇÃO COMPLETA", #(s.linhagem or {}), 1 },
    }
    local out = {}
    for _, m in ipairs(lista) do
        out[#out + 1] = { titulo = T(m[1]), descricao = T(m[2]), atual = m[3], meta = m[4], feito = m[3] >= m[4] }
    end
    return out
end

--- Faz carinho. Retorna false se já ganhou carinho na última hora.
function Estado.carinho(s, agora)
    Estado.passarTempo(s, agora)
    if s.hibernando or agora - s.carinho_em < Estado.CARINHO_INTERVALO then
        return false
    end
    s.humor = limitar(s.humor + 15)
    s.carinho_em = agora
    return true
end

--- Você leu nos últimos minutos?
function Estado.lendoAgora(s, agora)
    return s.ultima_refeicao ~= nil and agora - s.ultima_refeicao < Estado.LENDO_AGORA
end

--- "normal", "feliz", "triste" ou "dormindo" ("casulo" quando hibernando).
-- dormir = true força o sono quando ela está bem (usado na tela de descanso).
function Estado.expressao(s, agora, dormir)
    if s.hibernando then return "casulo" end
    if s.barriga < 25 or s.humor < 25 then return "triste" end
    local hora = s.dev_noite and 2 or tonumber(os.date("%H", agora))
    -- de noite ela dorme, a não ser que você esteja lendo agora
    if dormir or ((hora >= 23 or hora < 6) and not Estado.lendoAgora(s, agora)) then return "dormindo" end
    if (s.ultima_refeicao and agora - s.ultima_refeicao < Estado.REFEICAO_RECENTE) or s.humor >= 75 then
        return "feliz"
    end
    return "normal"
end

-- Poses de dormir sorteadas na tela de descanso.
Estado.POSES = { "", "_cobertor", "_estrelas" }

--- Nome do sprite (fase_expressão). pose (opcional, de Estado.POSES) enfeita quem dorme.
-- Quando o desenho daquela variação não existe, o desenho cai para o da fase.
function Estado.sprite(s, agora, dormir, pose)
    local e = Estado.expressao(s, agora, dormir)
    local nome = Estado.fase(s).nome .. "_" .. e
    if e == "dormindo" and pose then nome = nome .. pose end
    return nome
end

--- Quadros da animação: dormindo respira e solta Zzz; acordada só respira,
-- e de vez em quando pisca (quando está normal).
function Estado.quadros(s, agora, dormir)
    local e = Estado.expressao(s, agora, dormir)
    local fase = Estado.fase(s).nome
    if e == "casulo" or e == "dormindo" then
        local base = fase .. "_" .. e
        return { base .. "_1", base .. "_2", base .. "_3", base .. "_4" }
    end
    local a, b = fase .. "_" .. e .. "_1", fase .. "_" .. e .. "_2"
    if e == "normal" then
        return { a, b, a, b, a, fase .. "_piscar" }
    end
    return { a, b }
end

-- Falas por temperamento e humor. "casulo" = escondida na lombada (hibernando).
-- "repouso" = tela de descanso (o Kindle dormindo).
local FALAS = {
    ovo = {
        _todas = {
            "…",
            "(o ovo tremeu um pouquinho)",
            "Toc, toc. Lê mais um pouco que eu saio.",
            "(algo lá dentro resmungou)",
            "(cheiro de papel velho vindo do ovo)",
            "(o ovo parece estar julgando você)",
        },
    },
    jovem = {
        feliz = {
            "Comi uma página inteira e nada de ruim aconteceu. <medrosa:Ainda. Tô de olho.|otimista:E nem vai acontecer.|Ainda.>",
            "Papel bom. Cola boa. Desconfio.",
            "Tá… isso foi gostoso. Vai dar errado depois?",
            "Hoje eu entendi uma metáfora. Sozinha. Acho.",
            "{exclamacao|} Comi um parágrafo inteiro sem engasgar. Estou crescendo.",
            "Esse livro é bom ou eu que estou com fome?",
            "Se eu soubesse ler tão rápido quanto como…",
            "Feliz. Não conta pra ninguém. Tenho uma reputação.",
            "Hoje li uma palavra com cinco sílabas. Ela me leu de volta.",
            "Se eu tivesse cauda, estaria balançando. Tenho antenas. Estão balançando.",
            "Esse livro me abraçou. <romantica:Deixei.|medrosa:Ou me esmagou. Não sei.|Ou me esmagou. Foi bom.>",
            "Acho que gosto de você. Não conta pras outras traças.",
            "Comi uma vírgula sem querer. Agora tudo tem uma pausa.",
        },
        normal = {
            "Será que esse livro acaba bem? Livros nunca acabam bem.",
            "Tô aqui. <corajosa:Firme e pronta.|medrosa:Tremendo, mas tô.|Meio nervosa, mas tô.>",
            "Se você parar de ler, eu… tudo bem. Acho.",
            "Ouvi dizer que os livros grossos têm mais recheio.<dominio: Esse tem recheio de {gosto}.|>",
            "Uma traça mais velha me disse que tudo é papel no fim.",
            "Tentei fumar uma vez. Tossi a lombada inteira.",
            "Quando eu crescer, quero ler o dicionário. Inteiro.",
            "Você lê com tanta pressa. Tem alguém te esperando?",
            "Às vezes acho que os personagens me veem. <medrosa:Por isso me escondo.|romantica:E sorriem.|>",
            "Por que os livros têm cheiro de {cheiro|chuva velha}?",
            "Uma traça mais velha disse que eu leio rápido demais. Ela lê devagar demais.",
            "<corajosa:Antes eu tinha medo do fim dos livros. Agora corro até ele.|amarga:Tenho medo do fim dos livros. Com razão.|Tenho medo do fim dos livros. E do começo. E do meio.>",
            "Se eu morder o nome do autor, ele sente?",
            "<corajosa:Hoje sou corajosa. Amanhã também.|Hoje decidi ser corajosa. Amanhã a gente vê.>",
            "Será que existe um livro sobre traças? Eu comeria por curiosidade.",
            "Às vezes leio a mesma linha três vezes. Para ter certeza que ela existe.",
        },
        triste = {
            "Tô com fome. E com <romantica:saudade|medo>. Mais fome.",
            "Você esqueceu de mim? Tudo bem, todo mundo esquece.",
            "Uma pagininha só… por favor?",
            "Mastiguei {coisa|o marcador de página}. Foi o que sobrou.",
            "Barriga roncando. Parece {comparacao|um capítulo de suspense}.",
            "Se eu sumir, procure {lugar|entre as páginas 40 e 41}.",
            "Contei as letras da capa. Todas. Duas vezes. É o que sobrou.",
            "Fome de história. Qualquer história.",
            "Até o índice parece um banquete agora.",
        },
        dormindo = {
            "Zzz… sonhando que a estante desabou… <corajosa:e eu segurei sozinha…|>",
            "Zzz… não apaga a luz… <medrosa:deixa acesa…|quer dizer, apaga…>",
            "Zzz… um bibliotecário… com spray… não…",
            "Zzz… mais uma página… só mais uma… <noturna:a noite é nossa…|>",
        },
        casulo = {
            "Me escondi na lombada. Lá fora é perigoso. Leia uma página que eu volto.",
            "Tô aqui dentro. Escuro, quentinho e sem letras. Horrível.",
        },
        repouso = {
            "Zzz… sonhando com <romantica:papel de carta|erudita:pergaminho|{coisa|papel de arroz}>…",
            "Zzz… a cola… tão macia… <dominio:com gosto de {gosto}…|>",
            "Zzz… quem apagou a luz do mundo? <medrosa:Acende…|>",
            "Zzz… sonhando com uma biblioteca sem fim… <medrosa:e sem saída…|corajosa:e eu explorando tudo…|>",
            "Zzz… a capa é tão quentinha… <romantica:parece um abraço…|>",
        },
        palavra = "Comi a palavra “%s”. <otimista:Tinha gosto de domingo.|medrosa:Acho que estava assombrada.|erudita:Vou guardar pra um soneto.|Acho que me fez mal.>",
    },
    velha = {
        feliz = {
            "Hm. Até que não era um livro ruim.",
            "Comi. Satisfeita. Não se acostume.",
            "{exclamacao|} Uma página decente. Raro, hoje em dia.",
            "Esse parágrafo merecia um cigarro depois.",
            "Bom livro. Vou sentir falta de odiá-lo.",
            "Hoje a literatura me poupou. Amanhã veremos.",
            "Satisfeita. <otimista:É assim que começam as comédias.|É assim que começam as tragédias.>",
            "Que prosa. <otimista:Me faz acreditar na humanidade. Sem quase.|Quase me faz acreditar na humanidade. Quase.>",
            "Um livro decente. Vou anotar a data, para lembrar quando o mundo valia a pena.",
            "Satisfeita. Não é felicidade, é digestão.",
            "Esse autor sabia o que fazia. Odeio quando acontece.",
            "Bom capítulo. <romantica:Me emocionei e não vou fingir.|Me dê licença enquanto finjo que não me emocionei.>",
        },
        normal = {
            "Já li coisa demais pra <otimista:perder a esperança|ter esperança>.",
            "Todo livro termina. Como tudo.",
            "Quanto mais eu leio, menos eu entendo o mundo.",
            "Leia. Ou não. O fim é o mesmo.",
            "Acendi um cigarro. Metafórico. Papel e fogo não combinam.",
            "Toda biblioteca é um cemitério com boa iluminação.",
            "Os clássicos são livros que todo mundo cita e ninguém come.",
            "Prefácio é onde o autor pede desculpas antes da hora.",
            "Já fui jovem e otimista. <otimista:Continuo.|Durou um capítulo.>",
            "Notas de rodapé: onde a verdade vai se esconder.",
            "Ninguém lê mais. Por isso eu como.<dominio: Hoje o cardápio foi {gosto}.|>",
            "A vida é um romance mal editado.",
            "O best-seller de hoje é o papel de embrulho de amanhã.",
            "Li tantos finais felizes que <romantica:ainda choro em todos|perdi a fé em finais>.",
            "Todo narrador mente. Os honestos mentem melhor.",
            "Cultura é o que sobra quando você esquece o que leu. Eu lembro de tudo. Que azar.",
            "A juventude lê pra se encontrar. A velhice lê pra se esconder.",
            "Já comi Shakespeare. <erudita:No original. Recomendo.|popular:Prefiro novela.|Indigesto. Recomendo.>",
            "Os poetas morrem cedo. As traças, não. Injustiça.",
            "Eu não odeio as pessoas. Só as que dobram a ponta da página.",
            "Minha opinião sobre o mundo cabe numa nota de rodapé. Pequena e ignorada.",
        },
        triste = {
            "Fome. Como sempre. Como todos.<dominio: Saudade de {gosto}.|>",
            "Nem as traças são lembradas.",
            "Sabe o que é pior que um livro ruim? Livro nenhum.",
            "Estou definhando entre duas capas. Que poético. Que inútil.",
            "Me deixa aqui com meu cigarro imaginário e minha fome real.",
            "Estante vazia, alma vazia. Barriga também.",
            "Fome e lucidez. <otimista:Pelo menos a lucidez.|A pior combinação.>",
            "Ninguém lê. Ninguém me alimenta. A civilização acabou.",
            "Estou tão faminta que consideraria <erudita:um manual de instruções. Em alemão|popular:uma revista de fofoca. Com prazer|um manual de instruções>.",
        },
        dormindo = {
            "Zzz… resmungando sobre <dominio:{coisa}|o estado da literatura>…",
            "Zzz… a cola de antigamente era melhor… <otimista:a de hoje também serve…|>",
            "Zzz… nenhum best-seller… por favor…",
            "Zzz… sonhando com um sebo fechado só pra mim…",
        },
        casulo = {
            "Escondida na lombada. Me acorde quando o mundo melhorar. Ou quando você ler.",
            "Não estou aqui. Estou entre as páginas, onde é mais honesto.",
        },
        repouso = {
            "Zzz… fumando um cigarro em sonho… <erudita:e citando Baudelaire…|>",
            "Zzz… a última página <otimista:às vezes surpreende|sempre decepciona>…",
            "Zzz… resmungando em <popular:português claro|latim>…",
            "Zzz… revisando o mundo… <otimista:menos erros do que eu esperava…|muitos erros…>",
        },
        palavra = "“%s”. Comi. <erudita:Palavra nobre; o século não a merece.|popular:Palavra de dicionário. Sem sal.|Ninguém mais usa essa palavra.>",
    },
}

-- Falas sobre o que você está lendo (%s = livro, personagem ou número).
local FALAS_LIVRO = {
    jovem = {
        "“%s” tem gosto de <medrosa:vela apagada|corajosa:aventura|{gosto|mistério}>. Ou de mofo.",
        "Ainda estou mastigando “%s”. Devagar, pra durar.<dominio: Tem gosto de {gosto}.|>",
        "Será que “%s” acaba bem? Me conta sem me contar.",
        "Sonhei com “%s” ontem. <corajosa:Eu era a heroína.|romantica:Foi um sonho bonito.|Fiquei com medo.>",
    },
    velha = {
        "“%s”? Já comi piores. Já comi melhores. Continuo com fome.<dominio: Este cheirava a {cheiro}.|>",
        "Ainda digerindo “%s”. <otimista:Leve. Como a vida devia ser.|Pesado. Como a vida.>",
        "O autor de “%s” sofria. Dá pra sentir na cola.",
        "Depois de “%s”, preciso de <romantica:um lenço|medrosa:uma luz acesa|um cigarro> e de um silêncio.",
        "“%s” não muda o mundo. Mas me mudou um pouco. Pior.",
    },
}
local FALAS_PERSONAGEM = {
    jovem = { "%s me <corajosa:desafia. Gostei|romantica:deixa com as antenas bambas|assusta um pouco>.", "Gosto de %s. <romantica:Gosto muito.|cinica:Por enquanto.|Isso é perigoso?>", "%s apareceu de novo. Fiquei nervosa." },
    velha = { "%s de novo. Esse livro não tem mais ninguém?", "Já conheço o tipo de %s. <otimista:Termina bem, por incrível que pareça.|Termina mal.>",
              "%s fala como quem nunca leu um livro.", "Se eu encontrasse %s, <romantica:pedia um autógrafo|medrosa:fugia|mordia>." },
}

-- Perto de trocar de pele (crescer de fase). %d = páginas que faltam.
local FALAS_MUDA_PERTO = {  -- até ~60 páginas: às vezes
    jovem = {
        "Faltam umas %d páginas pra eu trocar de pele. Tô nervosa.",
        "Mais %d páginas e eu cresço. E se eu ficar feia?",
        "Contei: %d páginas pra minha próxima pele. Contei de novo. Ainda %d.",
        "Daqui a %d páginas eu viro outra. Promete que me reconhece?",
    },
    velha = {
        "Mais %d páginas e troco de pele. De novo. Que cansaço.",
        "%d páginas pra próxima muda. Envelhecer é só isso: trocar de casca e reclamar.",
        "Faltam %d páginas. Pele nova, opiniões velhas.",
        "Em %d páginas eu mudo. O mundo continua igual. Como sempre.",
    },
}
local FALAS_MUDA_IMINENTE = {  -- até ~10 páginas: sempre
    ovo = { "(o ovo está rachando…)", "Toc. Toc. TOC. Lê mais um pouquinho!", "(algo lá dentro está empurrando a casca)" },
    jovem = {
        "Tá coçando. Acho que troco de pele hoje.",
        "Minhas costas estão estalando. É agora? É agora!",
        "Só mais umas páginas… eu sinto a pele velha soltando.",
        "Não olha! Estou quase trocando de pele.",
    },
    velha = {
        "Tá coçando. Lá vamos nós de novo. Mais uma pele, mais um peso.",
        "Sinto a casca rachar. Ou é a idade. Leia logo e descobrimos.",
        "Estou prestes a mudar. Duvido que melhore alguma coisa.",
        "Quase trocando de pele. Me deixe com um pouco de dignidade.",
    },
}

-- Em inglês, as mesmas listas vêm de traca_en.lua.
local EN = Lingua.conteudo("estado")
if EN then
    FALAS, FALAS_LIVRO, FALAS_PERSONAGEM = EN.FALAS, EN.FALAS_LIVRO, EN.FALAS_PERSONAGEM
    FALAS_MUDA_PERTO, FALAS_MUDA_IMINENTE, ULTIMAS = EN.FALAS_MUDA_PERTO, EN.FALAS_MUDA_IMINENTE, EN.ULTIMAS
end

-- Lotes novos de frases (traca_banco/extra_pt.lua e extra_en.lua) somam às listas acima.
Lingua.anexar({ FALAS = FALAS, FALAS_LIVRO = FALAS_LIVRO, FALAS_PERSONAGEM = FALAS_PERSONAGEM,
    FALAS_MUDA_PERTO = FALAS_MUDA_PERTO, FALAS_MUDA_IMINENTE = FALAS_MUDA_IMINENTE }, Lingua.extra("estado"))

-- s (opcional): a fala que combina com ela pesa mais (traca_voz.lua, PLANO-VOZ.md Etapa 4)
local function sorteiaLista(lista, sorteio, s)
    return Voz.escolher(lista, s, sorteio)
end

-- Brechas das falas geradas: livro, palavra, tema e um personagem do livro atual. Com um domínio
-- (traca_voz.lua), os núcleos com {gosto}, {cheiro}… também valem (o resolvedor troca as palavras).
local function dadosDaFala(s, sorteio, Memoria)
    local dados = { livro = s.ultimo_livro, palavra = s.ultima_palavra,
                    voz = function(t, sem_dominio) return Voz.resolver(t, s, sorteio, sem_dominio) end,
                    escolher = function(lista, sem_dominio) return Voz.escolher(lista, s, sorteio, sem_dominio) end }
    if Voz.temDominio(s) then
        for slot in pairs(Voz.SLOTS) do dados[slot] = "{" .. slot .. "}" end
    end
    if Memoria then
        -- palavras do próprio livro (Etapa 5): {palavra} e {marcante} sorteiam entre as marcantes do
        -- livro atual; sem elas ainda, {palavra} é a última palavra longa comida e {marcante} fica sem dado
        local marc = s.ultimo_livro and Memoria.marcantes and Memoria.marcantes(s, s.ultimo_livro, 10) or {}
        if #marc > 0 then
            dados.marcante = marc[sorteio(#marc)]
            dados.palavra = dados.marcante
        end
        if s.tema_dominante then dados.tema = Memoria.NOMES_TEMA[s.tema_dominante] end
        local nomes = s.ultimo_livro and Memoria.personagens(s, s.ultimo_livro, 5) or {}
        if #nomes > 0 then dados.personagem = nomes[sorteio(#nomes)] end
    end
    return dados
end

local function chaveCurta(t)
    local h = 0
    for i = 1, #t do h = (h * 31 + t:byte(i)) % 2147483647 end
    return h
end

--- Sorteia uma fala. Devolve a fala e a chave para evitar repetição (o núcleo, nas geradas).
local function sortearFala(s, agora, sorteio, dormir, tela)
    local e = Estado.expressao(s, agora, dormir)
    local temp = Estado.fase(s).temperamento
    local grupo = FALAS[temp]
    -- tela de descanso: só sonho, mesmo com fome, triste, perto da muda ou escondida na lombada (fala de quem
    -- está acordada quebra a cena); o ovo não sonha: só os barulhos de dentro da casca (as falas entre
    -- parênteses; "Toc, toc. Lê mais um pouco" fica para quando você está lendo)
    if dormir then
        if grupo._todas then
            local rachando = Estado.proximaFase(s) and Estado.progressoFase(s).paginas <= 10
            local quietas = {}
            for _, f in ipairs(rachando and FALAS_MUDA_IMINENTE.ovo or grupo._todas) do
                if f:sub(1, 1) == "(" or f == "…" then quietas[#quietas + 1] = f end
            end
            return sorteiaLista(quietas, sorteio)
        end
        local okF, Falas = pcall(require, "traca_falas")
        local okM, Memoria = pcall(require, "traca_memoria")
        local dados = dadosDaFala(s, sorteio, okM and Memoria)
        if okF and sorteio(2) ~= 2 then
            local f, chave = Falas.sonhar(temp, dados, sorteio)
            if f then return f, chave end
        end
        return sorteiaLista(grupo.repouso, sorteio, s)
    end
    -- um cartão da caixa (traca_cartoes.lua): na Home; na tela da Traça, se não coube na Home. Vem antes de
    -- qualquer sorteio, para que tentar um cartão que não cabe na Home não mude as falas seguintes.
    if e ~= "dormindo" and e ~= "casulo" and not grupo._todas then
        local okCar, Cartoes = pcall(require, "traca_cartoes")
        local car = okCar and Cartoes.pendente(s, agora, tela)
        if car then
            car.usado = true
            return car.texto
        end
    end
    -- muda chegando: quantas páginas faltam para a próxima fase (a mesma conta do cartão de fase)
    local prox = Estado.proximaFase(s)
    if prox and e ~= "casulo" then
        local paginas = Estado.progressoFase(s).paginas
        if paginas <= 10 then
            return sorteiaLista(FALAS_MUDA_IMINENTE[temp], sorteio)
        elseif paginas <= 60 and temp ~= "ovo" and sorteio(4) == 1 then
            return (sorteiaLista(FALAS_MUDA_PERTO[temp], sorteio):gsub("%%d", tostring(paginas)))
        end
    end
    if grupo._todas then
        return sorteiaLista(grupo._todas, sorteio)
    end
    if e == "casulo" then return sorteiaLista(grupo.casulo, sorteio) end

    local okF, Falas = pcall(require, "traca_falas")
    local okM, Memoria = pcall(require, "traca_memoria")
    local dados = dadosDaFala(s, sorteio, okM and Memoria)
    -- dormindo de noite: quase sempre um sonho gerado (com o livro, o tema e os personagens dela)
    if e == "dormindo" then
        if okF and sorteio(4) ~= 4 then
            local f, chave = Falas.sonhar(temp, dados, sorteio)
            if f then return f, chave end
        end
        return sorteiaLista(grupo.dormindo, sorteio, s)
    end
    -- uma lembrança nova (autor que volta, aniversário, nada tão sombrio desde…): a primeira fala, uma vez,
    -- por até 24h
    local lem = s.lembranca_pendente
    if lem and not lem.usado and agora - (lem.t or 0) < 24 * 3600 then
        lem.usado = true
        return lem.texto
    end
    -- acabou um capítulo: a primeira fala depois disso é sobre ele (uma vez só, por até 12h)
    local p = s.comentario_pendente
    if p and not p.usado and agora - (p.t or 0) < 12 * 3600 then
        p.usado = true
        return p.texto  -- se ela disse isso há pouco, a regra de não repetir escolhe outra
    end
    -- dados da sua leitura: hora, páginas de hoje, recorde, sequência, sessão, parte do livro. Os fortes
    -- (madrugada, recorde, maratona, dias sumido) vêm antes das influências; os outros, depois.
    local okC, Contexto = pcall(require, "traca_contexto")
    local fc, forte
    if okC then fc, forte = Contexto.fala(s, agora, temp, sorteio) end
    if fc and forte and sorteio(10) <= 6 then return fc end
    -- influências literárias e personalidade-base (traca_influencias.lua), o repertório principal: a mais
    -- forte escolhe a frase, a segunda pode entrar na mesma fala; sem influência, a personalidade-base
    local okI, Influencias = pcall(require, "traca_influencias")
    if okI then
        local hora = tonumber(os.date("%H", agora))
        local situ = { triste = e == "triste", feliz = e == "feliz", fome = s.barriga < 40, cheia = s.barriga >= 85,
                       noite = hora >= 22 or hora < 5,
                       muda = (prox and Estado.progressoFase(s).paginas <= 60) and true or false,
                       fase = Estado.fase(s).nome, tela = tela }
        -- frases ditas há pouco ficam de fora; se não sobrar nenhuma, a vez passa para o resto
        local recentes = {}
        for _, h in ipairs(s.falas_recentes or {}) do recentes[h] = true end
        local function dita(chave) return recentes[chaveCurta(chave)] == true end
        local f, chave = Influencias.fala(s, dados, sorteio, situ, dita)
        if f then return f, chave end
    end
    if fc and not forte and sorteio(10) <= 3 then return fc end
    -- o jeito que ela ficou com as suas leituras (amarga, medrosa, romântica, noturna…)
    local okT, Tracos = pcall(require, "traca_tracos")
    if okT then
        local f = Tracos.fala(s, temp, sorteio)
        if f then return f end
    end
    -- às vezes ela fala do que você leu ou do que os livros fizeram com ela
    local sorte = sorteio(10)
    if sorte == 1 then
        local f = okM and Memoria.fala(s, sorteio, temp)
        if f then return f end
    elseif sorte == 2 and s.ultimo_livro then
        return string.format(sorteiaLista(FALAS_LIVRO[temp], sorteio, s), s.ultimo_livro)
    elseif sorte == 3 and dados.personagem then
        return string.format(sorteiaLista(FALAS_PERSONAGEM[temp], sorteio, s), dados.personagem)
    elseif sorte == 4 and dados.palavra then
        return string.format(grupo.palavra, dados.palavra)
    end
    -- de mau humor, às vezes ela culpa algo que aconteceu no livro (causa inventada depois)
    if e == "triste" and s.humor < 25 and sorteio(3) == 1 then
        local f = Voz.causa(s, temp, sorteio)
        if f then return f end
    end
    -- na maioria das vezes, uma fala gerada para a fase
    if (e == "normal" or e == "feliz") and okF and sorteio(3) ~= 1 then
        local f, chave = Falas.gerar(Estado.fase(s).nome, dados, sorteio)
        if f then return f, chave end
    end
    return sorteiaLista(grupo[e], sorteio, s)
end


--- Uma frase para o estado atual. sorteio(n) deve devolver um inteiro de 1 a n.
-- dormir = true é a tela de descanso (usa as falas de repouso e os sonhos).
-- Evita repetir as últimas falas (guarda só um número por fala, em s.falas_recentes; a chave é a frase
-- antes de escolher a variante de traço, então as variantes de uma mesma frase contam como uma só).
-- tela: "home" (só por Estado.falaQueCabe), "traca" ou nil; decide se um cartão da caixa pode sair.
function Estado.fala(s, agora, sorteio, dormir, tela)
    sorteio = sorteio or math.random
    local recentes = s.falas_recentes or {}
    local usadas = {}
    for _, h in ipairs(recentes) do usadas[h] = true end
    local car = s.cartao_pendente
    local car_usado = car and car.usado
    local texto, chave
    for _ = 1, 8 do
        texto, chave = sortearFala(s, agora, sorteio, dormir, tela)
        if not usadas[chaveCurta(chave or texto)] then break end
    end
    recentes[#recentes + 1] = chaveCurta(chave or texto)
    while #recentes > Estado.FALAS_RECENTES do table.remove(recentes, 1) end
    s.falas_recentes = recentes
    local final = (Voz.resolver(texto, s, sorteio))
    -- o cartão saiu nesta fala: na tela da Traça, está dito; na Home, quem decide é falaQueCabe (se coube)
    if car and car.usado and not car_usado then
        if final ~= car.texto then
            car.usado = car_usado  -- a regra de não repetir escolheu outra
        elseif tela ~= "home" then
            local okCar, Cartoes = pcall(require, "traca_cartoes")
            if okCar then Cartoes.dito(s, car, agora) end
        end
    end
    return final
end

--- A fala da tela de descanso. Só é escolhida quando o Kindle vai dormir (escolher = true): aí entra nas
-- recentes e pode usar a lembrança ou o comentário de capítulo. Os redesenhos que ninguém vê (a cada 10
-- páginas, ao acordar, ao fechar o livro) repetem a última escolhida, sem gastar nada; se ainda não houve
-- nenhuma, sorteiam uma e devolvem o estado como estava.
function Estado.falaDescanso(s, agora, escolher, sorteio)
    if escolher then
        s.fala_descanso = Estado.fala(s, agora, sorteio, true)
        return s.fala_descanso
    end
    if type(s.fala_descanso) == "string" then return s.fala_descanso end
    local recentes = {}
    for i, v in ipairs(s.falas_recentes or {}) do recentes[i] = v end
    local lem, com = s.lembranca_pendente, s.comentario_pendente
    local lem_usado, com_usado = lem and lem.usado, com and com.usado
    local texto = Estado.fala(s, agora, sorteio, true)
    s.falas_recentes = recentes
    if lem then lem.usado = lem_usado end
    if com then com.usado = com_usado end
    return texto
end

--- Uma fala que caiba num espaço pequeno (o cartão da Home): linhas(texto) diz quantas linhas ela ocupa.
-- Sorteia de novo (até `tentativas`) quando passa de `max_linhas`, sem efeito colateral das tentativas:
-- só a fala escolhida entra nas recentes, e lembrança ou comentário de capítulo que não couber continua
-- guardado para a tela principal (onde há espaço). Devolve o texto e quantas linhas ele ocupa; se nada
-- couber, a mais curta das tentativas. É a fala da Home: o cartão da caixa sai aqui primeiro; se não
-- couber, fica marcado (nao_coube) e espera a tela da Traça.
function Estado.falaQueCabe(s, agora, linhas, max_linhas, tentativas, sorteio)
    local function copia(t) local o = {} for i, v in ipairs(t or {}) do o[i] = v end return o end
    local lem, com, car = s.lembranca_pendente, s.comentario_pendente, s.cartao_pendente
    local orig = { recentes = copia(s.falas_recentes), lem = lem and lem.usado, com = com and com.usado,
                   car = car and car.usado }
    local escolhido, n_esc, melhor, n_melhor
    for _ = 1, tentativas or 8 do
        s.falas_recentes = copia(orig.recentes)
        local texto = Estado.fala(s, agora, sorteio, nil, "home")
        if texto then
            local n = linhas(texto)
            if n <= (max_linhas or 2) then escolhido, n_esc = texto, n; break end
            if not melhor or n < n_melhor then melhor, n_melhor = texto, n end
        end
    end
    -- lembrança/comentário que apareceu numa tentativa e não coube: continua guardado
    if lem and lem.texto ~= escolhido then lem.usado = orig.lem end
    if com and com.texto ~= escolhido then com.usado = orig.com end
    if car and not orig.car then
        if car.texto == (escolhido or melhor) then
            local okCar, Cartoes = pcall(require, "traca_cartoes")
            if okCar then Cartoes.dito(s, car, agora) end
        else
            if car.usado then car.nao_coube = true end  -- apareceu numa tentativa e não coube
            car.usado = orig.car
        end
    end
    if not escolhido then
        s.falas_recentes = orig.recentes
        return melhor, n_melhor
    end
    return escolhido, n_esc
end

--- Páginas comidas hoje (zera à meia-noite).
function Estado.paginasHoje(s, agora)
    if s.hoje ~= os.date("%Y-%m-%d", agora) then return 0 end
    return s.paginas_hoje or 0
end

--- Quantas das 4 bolinhas estão cheias para um valor de 0 a 100.
function Estado.bolinhas(valor)
    return math.max(0, math.min(4, math.ceil((valor or 0) / 25 - 1e-9)))
end

local ROTULO_BARRIGA = { { 75, "CHEIA" }, { 50, "SATISFEITA" }, { 25, "BELISCANDO" }, { 0.5, "COM FOME" }, { -1, "FAMINTA" } }
local ROTULO_HUMOR = {
    ovo = { { -1, "CHOCANDO" } },
    jovem = { { 75, "ANIMADINHA" }, { 50, "TRANQUILA" }, { 25, "ANSIOSA" }, { -1, "APAVORADA" } },
    velha = { { 75, "QUASE CONTENTE" }, { 50, "CONFORMADA" }, { 25, "RANZINZA" }, { -1, "INSUPORTÁVEL" } },
}

local function rotulo(tabela, valor)
    for _, r in ipairs(tabela) do
        if valor >= r[1] then return T(r[2]) end
    end
    return T(tabela[#tabela][2])
end

function Estado.rotuloBarriga(s)
    return rotulo(ROTULO_BARRIGA, s.barriga)
end

function Estado.rotuloHumor(s)
    return rotulo(ROTULO_HUMOR[Estado.fase(s).temperamento], s.humor)
end

--- Conta letras num texto UTF-8 (letras ASCII + um por caractere acentuado).
function Estado.contarLetras(texto)
    if type(texto) ~= "string" then return 0 end
    local _, ascii = texto:gsub("%a", "")
    local _, multibyte = texto:gsub("[\194-\244]", "")
    return ascii + multibyte
end

--- A palavra mais comprida (até 20 bytes) do texto, ou nil.
function Estado.palavraMaisLonga(texto)
    if type(texto) ~= "string" then return nil end
    -- travessões, aspas curvas, reticências e « » não fazem parte de palavras
    texto = texto:gsub("\226\128[\128-\191]", " "):gsub("\194[\160-\191]", " ")
    local melhor
    for p in texto:gmatch("[%a\128-\255]+") do
        if #p <= 20 and (not melhor or #p > #melhor) then melhor = p end
    end
    if melhor and #melhor >= 6 then return melhor:lower() end
end

return Estado
