-- Nome na lista de plugins: segue o idioma escolhido para a Traça (ou o do KOReader).
local g = rawget(_G, "G_reader_settings")
local escolha = g and g:readSetting("traca_lingua")
local lingua = g and g:readSetting("language") or "en"
local ingles = escolha == "en" or (escolha ~= "pt" and not tostring(lingua):match("^pt"))

return {
    version = "1.0.0",
    fullname = ingles and "Silverfish" or "Traça",
    description = ingles and [[A virtual pet silverfish that eats the pages you read.]]
        or [[Um bichinho virtual que se alimenta das letras que você lê.]],
}
