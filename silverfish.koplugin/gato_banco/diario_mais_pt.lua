--[[--
Mais diário do Gato-das-Cinzas, NOTAS DO PORÃO (português), desde 07/11/2026: a fase 3 da paridade com a traça.
Somado no fim de gato_banco/diario_pt.lua (que é gerado e não
se edita à mão): cada lista daqui entra depois das escolhidas nos lotes 5b-1, 5b-2 e 5b-3, até ele ter quase
tantas opções quanto a traça em cada pedaço. Ficam de fora os vereditos e as lembranças de clima, que não
aparecem. As lacunas são as de traca_banco/diario_pt.lua.
]]

return {
    dia = {
        magro = {
            "{n} páginas de “{livro}”. Pouco, mas bem guardado.",
            "Só {n} páginas de “{livro}”. Contrabando de bolso.",
            "{n} páginas de “{livro}”. Cabe numa fresta.",
            "Um pedaço de “{livro}”: {n} páginas. Melhor que nada. Bem melhor.",
        },
        normal = {
            "{n} páginas de “{livro}”. Porta fechada, arquivo aberto.",
            "Guardamos {n} páginas de “{livro}”. Sem testemunha.",
            "“{livro}”, {n} páginas. Um turno honesto.",
            "{n} páginas de “{livro}”, uma de cada vez, como a vó mandava.",
            "Mais {n} páginas de “{livro}” no esconderijo.",
        },
        banquete = {
            "{n} páginas de “{livro}”. O lenço não fecha mais.",
            "Dia grande: {n} páginas de “{livro}”. Tive que soltar outro tijolo.",
            "{n} páginas de “{livro}”. Os gatos do porão iam fazer festa.",
            "“{livro}” rendeu {n} páginas. Carreguei tudo no dente.",
        },
        enorme = {
            "{n} páginas de “{livro}”. Isso não é leitura, é mudança.",
            "{n} páginas num dia só. Levamos meio “{livro}” pro porão.",
        },
        dois_livros = {
            "{n} páginas. “{livro}” na frente, “{livro2}” de reserva.",
            "Dois livros, um lenço: “{livro}” e “{livro2}”. {n} páginas.",
        },
        horario = {
            madrugada = { "Lido de madrugada. O melhor turno.", "Depois da meia-noite, como os gatos do porão.", "Tudo no escuro. Ninguém viu." },
            manha = { "Lido com café e janela.", "Turno da manhã. Luz demais pra segredo." },
            noite = { "Lido de noite, porta fechada.", "Fim de dia, luz baixa, saída conferida." },
        },
        fala = {
            filhote = { "Guardei uma fala de {nome}: “{fala}”. Vou repetir até dormir.", "“{fala}”, disse {nome}. Anotei no lenço." },
            adulto = { "{nome}: “{fala}”. Anotado.", "“{fala}”, disse {nome}. Vai pra pasta." },
            velho = { "{nome} disse “{fala}”. A vó diria igual.", "Frase do dia, de {nome}: “{fala}”. Fica comigo." },
        },
        novo = {
            "{nome} entrou na história. Anotei a saída mais perto.",
            "Pasta nova: {nome}.",
            "{nome} chegou. Ainda não sei de que lado.",
            "Apareceu {nome}. Fiquei de olho.",
        },
        novos2 = {
            "{nome} e {nome2} chegaram ao mesmo tempo. Suspeito.",
            "Duas pastas novas: {nome} e {nome2}.",
            "Conheci {nome} e {nome2}. Dois segredos, provavelmente.",
        },
        evento = {
            morte = { "Teve enterro. Guardei o nome.", "Alguém se foi. Alguém tem que lembrar. Fico eu." },
            casamento = { "Alguém casou. Anotei as promessas.", "Teve altar e promessa. Vou conferir no fim." },
            viagem = { "Alguém partiu. Conferi se levou o livro.", "Malas, estrada, despedida. Bom dia pra fugir." },
            carta = { "Teve carta. Li por cima do ombro.", "Uma carta mudou tudo. Cartas fazem isso." },
            tempestade = { "Choveu o dia todo no livro. No porão, nem uma gota.", "Trovão no capítulo. Conferi as janelas." },
            doenca = { "Alguém adoeceu. Fiquei perto, em silêncio.", "Febre no capítulo. Vigília a noite inteira." },
            festa = { "Teve festa. Fiquei no canto, perto da saída.", "Música, gente, barulho. Ótimo pra ninguém me ver." },
            briga = { "Gritaram no capítulo. Anotei quem começou.", "Teve briga. Ninguém ouviu o mais quieto. Eu ouvi." },
            fuga = { "Alguém escapou. Anotei a rota.", "Teve fuga. Boa técnica. Anotei." },
            crime = { "Teve crime. Abri uma pasta.", "Alguém fez o que não devia. Tenho as pistas." },
        },
        tema = { "O dia teve cheiro {de_tema}.", "Tudo girou em torno {de_tema}.", "O assunto foi {tema}. Pasta cheia." },
        pesado = { "Muita fuligem hoje.", "Páginas que pesam no lenço.", "Dia escuro de papel. Conferi as saídas duas vezes." },
        leve = { "Páginas macias. Ninguém queimou nada.", "Leitura leve. A vó ia aprovar." },
        fecho = {
            filhote = { "Amanhã tem mais.", "Lenço dobrado, página guardada.", "A vó ia gostar de hoje." },
            adulto = { "Saídas conferidas.", "Arquivado.", "Turno encerrado." },
            velho = { "Uma página a mais pros filhotes.", "Guardado. Como sempre.", "Mais um dia que não se perdeu." },
        },
        fecho_escuro = {
            filhote = { "Deixei a luz acesa.", "Dormi perto da porta." },
            adulto = { "Conferi a porta duas vezes.", "Fumaça nenhuma. Ainda assim." },
            velho = { "Tem dia que a gente guarda pra não repetir.", "Pesou. Guardei mesmo assim." },
        },
        fecho_leve = {
            filhote = { "Hoje foi bom de guardar." },
            adulto = { "Sem fumaça. Raro. Bom." },
            velho = { "Dias assim valem o porão inteiro." },
        },
    },

    inicio = {
        generico = {
            "“{livro}” entrou no porão. Conferi a lombada.",
            "Abrimos “{livro}”. Primeira página duas vezes, como manda a Regra 4.",
            "Livro novo: “{livro}”. Pasta nova.",
            "“{livro}”. Cheiro bom. Vamos ver o resto.",
            "Começou “{livro}”. Já escolhi meu esconderijo nele.",
        },
        autor = {
            "Primeiro livro de {autor}. Começo pelas notas de rodapé.",
            "{autor}. Nome novo no arquivo.",
            "Conhecendo {autor}. Por enquanto, desconfio com educação.",
        },
        mesmo_autor = { "{autor} de novo. A pasta já tá aberta.", "Mais {autor}. Reconheço o passo.", "Voltamos a {autor}. Lealdade." },
        largou = {
            "“{anterior}” ficou no meio. Agora é “{livro}”. Anotei onde paramos.",
            "Trocamos “{anterior}” por “{livro}”. Deixei um marcador lá. Por via das dúvidas.",
            "Largamos “{anterior}”. Não esqueço. Agora: “{livro}”.",
        },
        relendo = {
            "Relendo “{livro}”. Achei coisa que não tinha visto.",
            "“{livro}” de novo. Regra 10: não vai ser a mesma história.",
            "Voltamos a “{livro}”. O meu pedaço ainda tá lá.",
        },
    },

    fim = {
        abertura = {
            "Fim de “{livro}”. O meu pedaço tá guardado. O resto mora em você.",
            "“{livro}” acabou. Arquivado. Bom, o meu pedaço.",
            "Fechamos “{livro}”. Ninguém viu. Perfeito.",
            "Última página de “{livro}”. Li duas vezes.",
        },
        nome = { "Pasta: {nome}.", "No fundo, era sobre {nome}.", "Se perguntarem, foi {nome}." },
        protagonista = {
            filhote = { "{nome} me ensinou uma coisa. Ainda não sei qual." },
            adulto = { "{nome} entrou pra pasta dos que valem." },
            velho = { "Vou contar {nome} pros filhotes. Do meu jeito." },
        },
        mais_escuro = { "Mais fumaça que “{outro}”.", "Pesou mais que “{outro}”. Bem mais." },
        mais_leve = { "Mais leve que “{outro}”. Bom.", "Depois de “{outro}”, esse foi um descanso." },
        serie = {
            "{ordinal} livro seguido {de_tema}. Alguém tá escolhendo por você? Ou é você?",
            "{ordinal} livro {de_tema} em sequência. Anotado, com o pé atrás.",
        },
        traco = {
            amarga = { "Saí com uma ilusão a menos." },
            otimista = { "Saí com a brasa mais acesa." },
            medrosa = { "Vou conferir as saídas duas vezes hoje." },
            corajosa = { "Saí andando pelo meio da sala." },
            cinica = { "Anotei quem ganhou com o final." },
            romantica = { "Guardei uma carta desse no lenço." },
            popular = { "Li rápido demais. Gostei demais." },
            erudita = { "Quero a edição antiga desse." },
        },
        nota = {
            filhote = { "Dei {n} patinhas de 5. Pensei bastante." },
            adulto = { "Nota: {n} tijolos soltos de 5." },
            velho = { "{n} brasas de 5. Sem pressa." },
        },
    },

    obsessao = {
        nova = {
            "Ando pensando {tema}. Abri uma pasta só pra isso.",
            "Nova obsessão: {tema_s}. Arquivo aberto.",
            "Penso {tema} até no escuro. Alguém pôs isso aqui.",
        },
        troca = {
            "Antes eu pensava {antes}. Agora penso {agora}. Troca de turno.",
            "Saiu {antes_s}, entrou {agora_s}. Nem bateu na porta.",
            "Já não penso tanto {antes}. Agora é {agora_s} em todo canto.",
        },
    },

    lembranca = {
        autor = {
            "{n}º livro de {autor}. Já reconheço a letra no escuro.",
            "{autor} outra vez: o {n}º. Pasta grossa.",
            "Mais {autor}, o {n}º. Lealdade tem nome.",
            "O {n}º de {autor}. Os gatos do porão também tinham autor preferido.",
        },
        aniversario = {
            "Um ano desde “{livro}”. O meu pedaço ainda tá inteiro.",
            "Faz um ano: “{livro}”. Lembro da primeira página.",
            "“{livro}” fez um ano no arquivo. Sem poeira.",
        },
        personagem = {
            "{nome} de novo. A pasta de “{livro}” ainda tá aberta.",
            "Conheço {nome} desde “{livro}”. Mudou? Vou conferir.",
            "{nome} voltou. Desde “{livro}” eu fico de olho.",
        },
        recorde_longo = { "“{livro}” foi o maior que a gente já carregou. O porão ainda lembra.", "Nada pesou tanto quanto “{livro}”. Valeu cada página." },
        recorde_rapido = { "Nunca guardamos nada tão rápido quanto “{livro}”.", "“{livro}” passou voando. Melhor contrabando." },
        serie_tema = {
            "{n} livros seguidos {de_tema}. Tô vendo um padrão. Você também?",
            "Outro livro {de_tema}: já são {n}. Alguém escolheu isso. Talvez você.",
        },
    },
}
