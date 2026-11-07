--[[--
Gato-das-Cinzas: influências literárias e personalidade-base (português; desde 07/11/2026). O mesmo formato, as
mesmas lacunas e as mesmas regras de traca_banco/influencias_pt.lua (lá está a explicação de cada marca); a lógica
é a mesma, traca_influencias.lua. Escrito e aprovado por Claude em 07/11/2026, no volume da traça: 50 frases de
base e 70 por influência. Voz: traca/cartoes/VOICE-CAT.md (seção 11: as influências nos olhos dele).

Diferenças da traça:
  fase   filhote, adulto ou velho (ou uma lista delas)
  voz    ele guarda as páginas, não come; as Regras do Porão mantêm número e palavras; nada de adjetivo com
         gênero para o leitor nem para ele; nenhuma palavra de política.
As 16 influências estão em quatro arquivos (infl_pt_1 a infl_pt_4), na ordem de traca_banco/influencias.lua.
]]

local influencias = {}
for i = 1, 4 do
    for id, I in pairs(require("gato_banco.infl_pt_" .. i)) do influencias[id] = I end
end

return {
    -- acontecimentos detectados (traca_memoria.lua, M.EVENTOS), com artigo, para {evento}
    eventos = {
        morte = "um enterro", casamento = "um casamento", viagem = "uma partida", carta = "uma carta",
        tempestade = "uma tempestade", doenca = "uma febre", festa = "uma festa", briga = "uma briga",
        fuga = "uma fuga", crime = "um crime",
    },

    -- personalidade-base (50)
    base = {
        -- sobrevivência
        { "Arrumaram a estante hoje. Regra 5: nunca confie numa estante arrumada. Mudei “{livro}” de lugar.", situacao = "sobrevivencia", curta = "Arrumaram a estante. Regra 5. Mudei de lugar." },
        { "Cheiro de fumaça na cozinha. Era só torrada. Conferi as saídas mesmo assim.", situacao = "sobrevivencia", curta = "Fumaça na cozinha. Torrada. Conferi as saídas." },
        { "Nada novo pra guardar. Fico rondando a estante feito sentinela sem turno.", situacao = "sobrevivencia", quando = "fome" },
        { "Alguém mexeu no meu esconderijo. Ou foi o vento. Troquei de esconderijo mesmo assim.", situacao = "sobrevivencia" },
        { "Escondi “{livro}” atrás do livro mais chato da casa. Regra 8. Ninguém procura lá.", situacao = "sobrevivencia", curta = "Escondi atrás do livro chato. Regra 8." },
        { "Ouvi uma vassoura no corredor. Subi na estante com a página no dente.", situacao = "sobrevivencia" },
        { "Se vier fogo, eu saio pela janela com {personagem} no lenço. Já tá decidido.", situacao = "sobrevivencia", curta = "Se vier fogo, {personagem} sai comigo." },
        { "Decorei “{palavra}” letra por letra. Papel queima. Memória dá mais trabalho pra apagar.", situacao = "sobrevivencia", curta = "Decorei “{palavra}”. Papel queima; memória, não." },
        { "Sobrevivi a mais uma faxina. Se fosse {lente}, alguém contaria no porão.", situacao = "sobrevivencia" },
        { "Três saídas nesta sala. Contei de novo. Ainda três. Bom.", situacao = "sobrevivencia" },
        -- leitura
        { "“{livro}” tem nota de rodapé. Já gostei. É onde esquecem de olhar.", situacao = "leitura", curta = "Tem nota de rodapé. Já gostei." },
        { "Edição resumida de “{livro}”? Não. Quero o livro todo, com as partes chatas. Principalmente as chatas.", situacao = "leitura", curta = "Resumido, não. Quero as partes chatas." },
        { "{autor} escreveu isso. Eu guardo um pedaço. Você guarda o resto. É assim que um livro sobrevive.", situacao = "leitura", curta = "{autor} escreveu. A gente guarda." },
        { "Esse livro tem cheiro {de_tema}. E um pouco de fumaça. Ou sou eu.", situacao = "leitura", curta = "Cheiro {de_tema}. E de fumaça. Ou sou eu." },
        { "Li a primeira página duas vezes. Regra 4. A porta tava lá.", situacao = "leitura" },
        { "A palavra “{palavra}” apareceu de novo. Já anotei onde ela mora.", situacao = "leitura", curta = "“{palavra}” de novo. Sei onde mora." },
        { "Gosto de livro com dedicatória escrita à mão. Alguém deu de presente. Alguém guardou.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "Ainda tô guardando “{anterior}” no lenço. Esse aqui vai pro outro canto.", situacao = "leitura", curta = "Ainda guardo “{anterior}”. Esse vai pro canto." },
        { "Uma frase bonita não salva ninguém do fogo. Mas é a primeira que eu salvo.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "Já guardei tantos livros que reconheço “{palavra}” pelo jeito que ela senta na página.", situacao = "leitura", fase = "velho", curta = "Reconheço “{palavra}” de longe." },
        -- crescimento: cada fase fala do próprio tamanho
        { "Sou filhote. Ainda acho que toda porta tem chave e que todo livro tem dono.", situacao = "crescimento", fase = "filhote" },
        { "Saí do ovo faz pouco. Já sei duas regras: a um e a sete. A vó ficaria orgulhosa.", situacao = "crescimento", fase = "filhote", curta = "Já sei duas regras. A um e a sete." },
        { "Tô maior. O lenço já não arrasta no chão. Quase.", situacao = "crescimento", fase = "filhote" },
        { "Alguma coisa em mim tá mudando. Cresço igual capítulo: de uma vez, depois de muita espera.", situacao = "crescimento", quando = "muda" },
        { "Quando eu crescer, vou saber as quinze regras de cor. Hoje sei nove. Mais ou menos.", situacao = "crescimento", fase = "filhote", curta = "Quero saber as quinze regras. Sei nove. Quase." },
        { "Tô mudando. Cada fase deixa uma regra que eu não preciso mais repetir em voz alta.", situacao = "crescimento", quando = "muda" },
        { "Já tive medo dos gatos velhos. Agora os filhotes me olham do mesmo jeito. Cresci? Ou só fechei a cara?", situacao = "crescimento", fase = "adulto", curta = "Os filhotes me olham com medo. Cresci?" },
        { "Antigamente eu guardava qualquer página. Hoje confiro “{livro}” todo antes. A idade exige.", situacao = "crescimento", fase = "adulto" },
        { "Meu olho bom já não vê tão longe. Deve ser assim que vem a sabedoria: sem pedir licença.", situacao = "crescimento", fase = "velho", curta = "Vejo menos. Dizem que é sabedoria. É idade." },
        { "Na minha idade, cada livro lembra outro. Esse me lembra “{anterior}”. É quase um elogio.", situacao = "crescimento", fase = "velho" },
        -- relação com o leitor
        { "Você virou a página com a minha pata em cima. Não reclamo. Anoto.", situacao = "leitor" },
        { "Gosto do peso da sua mão no livro. Quer dizer que ele não tá sozinho.", situacao = "leitor", curta = "Mão no livro. Ele não tá sozinho. Bom." },
        { "Você escolheu “{livro}”. Não pergunto por quê. Só confiro quem pôs ele na sua mão.", situacao = "leitor", curta = "Você escolheu. Eu confiro quem pôs ali." },
        { "Você é a maior criatura que eu já vi. E lê! Então é da turma.", situacao = "leitor", fase = "filhote" },
        { "Quando eu for, deixo um ovo por aqui. Ensina uma frase pra ele. Regra 13.", situacao = "leitor", fase = "velho" },
        { "Você passa muito tempo com {personagem}. Não é ciúme. É vigilância.", situacao = "leitor" },
        { "Às vezes você fecha o livro com força, às vezes devagar. Eu sei qual noite você teve.", situacao = "leitor", fase = { "adulto", "velho" } },
        { "Não precisa agradecer. Mas, se deixar “{livro}” aberto de noite, eu fico de guarda.", situacao = "leitor", curta = "Deixa o livro aberto. Eu fico de guarda." },
        { "Você confia em {autor}. Eu confio em você. Alguém aqui tem que desconfiar. Deixa comigo.", situacao = "leitor", curta = "Você confia em {autor}. Eu desconfio por nós." },
        { "Você lê “{livro}”, eu guardo um pedaço. No fim, a gente sabe a história toda entre os dois.", situacao = "leitor", curta = "Você lê, eu guardo. Juntos, a história toda." },
        -- contexto (combina com o que foi detectado ou com a influência mais forte)
        { "Teve {evento} no capítulo, e ninguém me chamou. Fiquei de vigia do lado de fora.", situacao = "contexto", curta = "Teve {evento}. Fiquei de vigia lá fora." },
        { "Esse livro fala {de_tema} o tempo todo. Eu, que moro atrás da estante, só falo de saída.", situacao = "contexto" },
        { "{personagem} de novo. Vou abrir uma pasta só pra {personagem}.", situacao = "contexto", curta = "{personagem} de novo. Abri uma pasta." },
        { "Hoje a noite me pareceu {lente}. Depois a luz apagou e voltou a ser só a noite.", situacao = "contexto" },
        { "Teve {evento}. Os humanos leem isso e suspiram. Eu leio e confiro se a porta tá trancada.", situacao = "contexto" },
        { "{autor} escreveu pra gente com mãos. Eu leio com uma pata e um olho. Dá certo.", situacao = "contexto", curta = "{autor} escreveu pra mãos. Leio com pata." },
        { "A palavra “{palavra}” tem cara de senha que alguém esqueceu de trocar.", situacao = "contexto" },
        { "Tem silêncio de biblioteca e silêncio de porão. Prefiro o segundo: dá pra ouvir quem chega.", situacao = "contexto" },
        { "Às vezes paro de ler só pra ouvir a casa. Ela range como quem esconde alguma coisa.", situacao = "contexto" },
        { "Depois de “{anterior}”, achei que nada me pegava de surpresa. “{livro}” tá tentando.", situacao = "contexto" },
    },

    influencias = influencias,
}
