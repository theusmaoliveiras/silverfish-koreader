--[[--
Banco do jeito do Gato-das-Cinzas (inglês), lote 5a (traca/cartoes/rascunhos/cat/choices-5a.md).

rotulos[polo]: a palavra de cada lado de cada eixo, no lugar das da traça (traca_tracos.lua ROTULO); sem gênero.
falas[polo][temperamento]: o que ele diz na tela inicial quando aquele lado está marcado, uma por fase
  (filhote, adulto, velho: os temperamentos de traca_species.lua).
diario[polo][1|2|"volta"]: o que ele anota quando o lado fica marcado, forte ou passa (lote 5b-3,
  choices-5b3.md); {livro} = o livro de quando mudou.
Gerado por tools/build_cat_traits.py a partir do choices-5a.md e do choices-5b3.md; não editar à mão.
]]

local B = { rotulos = {}, falas = {}, diario = {} }

B.rotulos.amarga = "NO ILLUSIONS"
B.rotulos.otimista = "KEEPS AN EMBER"
B.rotulos.medrosa = "EARS UP"
B.rotulos.corajosa = "IN THE OPEN"
B.rotulos.cinica = "ON GUARD"
B.rotulos.romantica = "LOYAL TO THE END"
B.rotulos.popular = "LIKES BESTSELLERS"
B.rotulos.erudita = "OLD EDITIONS"
B.rotulos.diurna = "DAY SHIFT"
B.rotulos.noturna = "NIGHT SHIFT"

B.falas.amarga = {
    filhote = { "Everyone keeps dying in your books. I'm keeping count." },
    adulto = { "Expect the worst. Then file it." },
    velho = { "I've kept enough sad endings to fill a cellar." },
}
B.falas.otimista = {
    filhote = { "Paper burns. Stories don't. Grandmother promised." },
    adulto = { "Hope is a page they forgot to burn." },
    velho = { "I've seen the fires go out. Every single time." },
}
B.falas.medrosa = {
    filhote = { "Your books have too many cellars. I know cellars." },
    adulto = { "Psst. Lights off. Something in the walls, and it isn't me." },
    velho = { "I know what lives in walls. I used to be it." },
}
B.falas.corajosa = {
    filhote = { "Grandmother never saw the sea. I'm reading it for her." },
    adulto = { "Forget the exits. Tonight we use the front door." },
    velho = { "I read out loud now. Let the walls take notes." },
}
B.falas.cinica = {
    filhote = { "Everyone in this book wants something. Me too: the page." },
    adulto = { "Kindness? Wait three chapters." },
    velho = { "Every hero has a price. I've kept the receipts." },
}
B.falas.romantica = {
    filhote = { "They promised and they kept it. Like Rule 1, but for people." },
    adulto = { "Loyalty is the only thing I don't hide." },
    velho = { "Grandmother kept one letter in her scarf. Now I understand." },
}
B.falas.popular = {
    filhote = { "Everyone's reading this. Is that bad? It's fun, though." },
    adulto = { "I like it. I don't trust that I like it." },
    velho = { "Don't tell the kittens I enjoyed it." },
}
B.falas.erudita = {
    filhote = { "Footnote number forty. Grandmother would be proud." },
    adulto = { "A first edition. Don't breathe on it." },
    velho = { "Footnotes, errata, the printer's page. My whole life." },
}
B.falas.diurna = {
    filhote = { "Daylight pages are warmer. I checked." },
    adulto = { "Daylight. Nothing to hide. Mostly." },
    velho = { "Morning light, open book. I lived to see this." },
}
B.falas.noturna = {
    filhote = { "Fewer eyes at night. I can hear the pages better." },
    adulto = { "Psst. Everyone's asleep. Perfect." },
    velho = { "The night shift was always mine. Now it's ours." },
}

B.diario.amarga = { [1] = { "Fewer illusions lately. “{livro}” took a few." }, [2] = { "I expect the worst from every chapter now. It usually delivers." }, volta = { "Hope crept back in. I didn't let it. It just did." } }
B.diario.otimista = { [1] = { "Caught myself humming at the door. “{livro}” did that." }, [2] = { "The ember became a small fire. The good kind." }, volta = { "The ember went quiet. Still warm." } }
B.diario.medrosa = { [1] = { "Jumped at a page turn today. That's new." }, [2] = { "Everything sounds like footsteps now. Thanks, books." }, volta = { "Slept through a creak last night. Progress." } }
B.diario.corajosa = { [1] = { "Read a page out loud. Nobody came. Good." }, [2] = { "I don't hide behind the boring books anymore. Well. Less." }, volta = { "The courage took a nap." } }
B.diario.cinica = { [1] = { "I look for the price behind every favour now." }, [2] = { "I follow the money in every chapter. It's always there." }, volta = { "Believed a narrator again. We'll see." } }
B.diario.romantica = { [1] = { "Kept a letter from “{livro}”. In the scarf." }, [2] = { "My heart is a hiding place full of letters." }, volta = { "The soft part went back into hiding." } }
B.diario.popular = { [1] = { "Skipped a description today. Grandmother would frown." }, [2] = { "I like what everyone reads. I've made peace with it. Almost." }, volta = { "Read a footnote again. Felt like home." } }
B.diario.erudita = { [1] = { "Started quoting footnotes. Out loud. Sorry." }, [2] = { "I read the errata for fun now." }, volta = { "Read a whole page without a footnote. Survived." } }
B.diario.diurna = { [1] = { "Day shift lately. Odd, for a cellar cat." }, [2] = { "A day cat now. The cellar cats would laugh." }, volta = { "The mornings went quiet. Back to the dark hours." } }
B.diario.noturna = { [1] = { "Night shift again, since your late nights." }, [2] = { "Midnight is my office now." }, volta = { "Fewer midnights lately. The cellar misses them." } }

-- More since 07/11/2026 (parity with the silverfish, phase 3): gato_banco/tracos_mais_en.lua, written by hand,
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
    local ok, M = pcall(require, "gato_banco.tracos_mais_en")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
