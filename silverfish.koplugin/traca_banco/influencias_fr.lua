--[[--
Phrases des influences littéraires et de la personnalité de base (français), en quatre lots
(influencias_fr_1 à _4) assemblés ici. Même structure que influencias_pt.lua.
]]

local B = { influencias = {} }
for i = 1, 4 do
    local ok, lot = pcall(require, "traca_banco.influencias_fr_" .. i)
    if ok and type(lot) == "table" then
        for k, v in pairs(lot) do
            if k == "influencias" then
                for nom, infl in pairs(v) do B.influencias[nom] = infl end
            else
                B[k] = v
            end
        end
    end
end
return B
