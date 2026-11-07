--[[--
Banco do jeito do Gato-das-Cinzas (português), lote 5a (traca/cartoes/rascunhos/cat/choices-5a.md).

rotulos[polo]: a palavra de cada lado de cada eixo, no lugar das da traça (traca_tracos.lua ROTULO); sem gênero.
falas[polo][temperamento]: o que ele diz na tela inicial quando aquele lado está marcado, uma por fase
  (filhote, adulto, velho: os temperamentos de traca_species.lua).
diario[polo][1|2|"volta"]: o que ele anota quando o lado fica marcado, forte ou passa (lote 5b-3,
  choices-5b3.md); {livro} = o livro de quando mudou.
Gerado por tools/build_cat_traits.py a partir do choices-5a.md e do choices-5b3.md; não editar à mão.
]]

local B = { rotulos = {}, falas = {}, diario = {} }

B.rotulos.amarga = "SEM ILUSÕES"
B.rotulos.otimista = "GUARDA UMA BRASA"
B.rotulos.medrosa = "ORELHA EM PÉ"
B.rotulos.corajosa = "A CÉU ABERTO"
B.rotulos.cinica = "COM O PÉ ATRÁS"
B.rotulos.romantica = "LEAL ATÉ O FIM"
B.rotulos.popular = "GOSTA DE BEST-SELLER"
B.rotulos.erudita = "EDIÇÕES ANTIGAS"
B.rotulos.diurna = "TURNO DO DIA"
B.rotulos.noturna = "TURNO DA NOITE"

B.falas.amarga = {
    filhote = { "Todo mundo morre nos seus livros. Tô contando." },
    adulto = { "Espera o pior. Depois arquiva." },
    velho = { "Já guardei final triste pra encher um porão." },
}
B.falas.otimista = {
    filhote = { "Papel queima. História não. A vó prometeu." },
    adulto = { "Esperança é a página que esqueceram de queimar." },
    velho = { "Já vi o fogo apagar. Todas as vezes." },
}
B.falas.medrosa = {
    filhote = { "Seus livros têm porão demais. Eu conheço porão." },
    adulto = { "Psst. Luz apagada. Tem algo nas paredes, e não sou eu." },
    velho = { "Eu sei o que mora nas paredes. Eu já fui isso." },
}
B.falas.corajosa = {
    filhote = { "A vó nunca viu o mar. Tô lendo ele por ela." },
    adulto = { "Esquece as saídas. Hoje a gente usa a porta da frente." },
    velho = { "Agora eu leio em voz alta. As paredes que anotem." },
}
B.falas.cinica = {
    filhote = { "Todo mundo nesse livro quer alguma coisa. Eu também: a página." },
    adulto = { "Gentileza? Espera três capítulos." },
    velho = { "Todo herói tem um preço. Guardei os recibos." },
}
B.falas.romantica = {
    filhote = { "Prometeram e cumpriram. Tipo a Regra 1, mas pra gente." },
    adulto = { "Lealdade é a única coisa que eu não escondo." },
    velho = { "A vó guardava uma carta no lenço. Agora eu entendo." },
}
B.falas.popular = {
    filhote = { "Todo mundo tá lendo isso. É ruim? Mas é divertido." },
    adulto = { "Eu gosto. Não confio no fato de que eu gosto." },
    velho = { "Não conta pros filhotes que eu gostei." },
}
B.falas.erudita = {
    filhote = { "Nota de rodapé número quarenta. A vó ia ter orgulho." },
    adulto = { "Primeira edição. Não respira em cima." },
    velho = { "Rodapé, errata, a página do impressor. Minha vida inteira." },
}
B.falas.diurna = {
    filhote = { "Página de dia é mais quente. Conferi." },
    adulto = { "Luz do dia. Nada a esconder. Quase nada." },
    velho = { "Luz da manhã, livro aberto. Vivi pra ver isso." },
}
B.falas.noturna = {
    filhote = { "Menos olhos de noite. Escuto melhor as páginas." },
    adulto = { "Psst. Todo mundo dormindo. Perfeito." },
    velho = { "O turno da noite sempre foi meu. Agora é nosso." },
}

B.diario.amarga = { [1] = { "Ando com menos ilusões. “{livro}” levou algumas." }, [2] = { "Agora espero o pior de todo capítulo. Ele costuma entregar." }, volta = { "A esperança voltou de mansinho. Eu não deixei. Ela veio." } }
B.diario.otimista = { [1] = { "Me peguei cantarolando na porta. Foi “{livro}”." }, [2] = { "A brasa virou um foguinho. Do bom." }, volta = { "A brasa ficou quieta. Ainda morna." } }
B.diario.medrosa = { [1] = { "Pulei com uma virada de página hoje. Isso é novo." }, [2] = { "Agora tudo parece passo. Valeu, livros." }, volta = { "Dormi mesmo com um estalo ontem. Progresso." } }
B.diario.corajosa = { [1] = { "Li uma página em voz alta. Ninguém veio. Bom." }, [2] = { "Não me escondo mais atrás dos livros chatos. Bom. Menos." }, volta = { "A coragem foi tirar um cochilo." } }
B.diario.cinica = { [1] = { "Agora procuro o preço de todo favor." }, [2] = { "Sigo o dinheiro em todo capítulo. Ele sempre tá lá." }, volta = { "Acreditei num narrador de novo. Vamos ver." } }
B.diario.romantica = { [1] = { "Guardei uma carta de “{livro}”. No lenço." }, [2] = { "Meu coração é um esconderijo cheio de cartas." }, volta = { "O lado mole voltou pro esconderijo." } }
B.diario.popular = { [1] = { "Pulei uma descrição hoje. A vó ia franzir a testa." }, [2] = { "Gosto do que todo mundo lê. Fiz as pazes com isso. Quase." }, volta = { "Li uma nota de rodapé de novo. Pareceu casa." } }
B.diario.erudita = { [1] = { "Comecei a citar nota de rodapé. Em voz alta. Desculpa." }, [2] = { "Agora leio a errata por diversão." }, volta = { "Li uma página inteira sem nota de rodapé. Sobrevivi." } }
B.diario.diurna = { [1] = { "Turno do dia ultimamente. Estranho, pra gato de porão." }, [2] = { "Gato de dia agora. Os gatos do porão iam rir." }, volta = { "As manhãs ficaram quietas. Voltei pras horas escuras." } }
B.diario.noturna = { [1] = { "Turno da noite de novo, desde as suas madrugadas." }, [2] = { "A meia-noite virou meu escritório." }, volta = { "Menos meia-noite ultimamente. O porão sente falta." } }

-- More since 07/11/2026 (parity with the silverfish, phase 3): gato_banco/tracos_mais_pt.lua, written by hand,
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
    local ok, M = pcall(require, "gato_banco.tracos_mais_pt")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
