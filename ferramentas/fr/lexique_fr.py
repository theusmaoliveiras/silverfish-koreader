#!/usr/bin/env python3
"""Lexique de sentiment français par formes fléchies (traca_lexico_fr.lua).
Polarité des lemmes : FEEL (Abdaoui et al. 2017, LIRMM, usage personnel/recherche) + supplement_sentiment.tsv
(lemmes fréquents absents de FEEL, annotés à la main). Formes : Lexique383 (lexique.org, CC BY-SA, ~140 000
formes → lemme) + vocabulaire du corpus ; une forme inconnue de Lexique383 est ramenée à un lemme par suffixes.
Une forme qui pointe vers deux polarités opposées est écartée. Graphies « oe » et « œ » toutes deux produites.
Usage : lexique_fr.py polarity.csv supplement.tsv Lexique383.tsv corpus/ sortie.lua"""
import csv, glob, re, sys, collections
feel, supp, lexique, corpus, sortie = sys.argv[1:6]
def oe(w): return w.replace("œ", "oe")
pol = {}
for r in csv.DictReader(open(feel)):
    w = oe(r["word"].strip().lower())
    if w and " " not in w and "?" not in w: pol[w] = 1 if r["polarity"] == "positive" else -1
for ligne in open(supp):
    p = ligne.split("\t")
    if len(p) == 2 and p[1].strip() in ("1", "-1"): pol[oe(p[0].strip().lower())] = int(p[1])
lemmes_de = collections.defaultdict(set)
for r in csv.DictReader(open(lexique), delimiter="\t"):
    lemmes_de[oe(r["ortho"].lower())].add(oe(r["lemme"].lower()))
vocab = set()
for f in glob.glob(corpus + "/*.txt"):
    vocab.update(oe(w) for w in re.findall(r"[a-zà-ÿœ]+", open(f).read().lower().replace("’", " ").replace("'", " ")))
NOM = [("s", ""), ("x", ""), ("e", ""), ("es", ""), ("euse", "eux"), ("euses", "eux"), ("ive", "if"), ("ives", "if"),
       ("elle", "el"), ("elles", "el"), ("enne", "en"), ("ennes", "en"), ("ère", "er"), ("ères", "er"), ("aux", "al"),
       ("ale", "al"), ("ales", "al")]
ADV = [("ment", ""), ("ement", "e"), ("emment", "ent"), ("amment", "ant"), ("ément", "é")]
VER = "e es ent ons ez ais ait aient ai a as âmes èrent é ée és ées ant erai eras era erons erez eront erais erait eraient ât er".split()
VIR = "is it issent issait issaient issais issant i ie ies irent ira irait issons issez ir".split()
def suffixes(w, regles, minimum=3):
    return {w[: len(w) - len(s)] + r for s, r in regles if w.endswith(s) and len(w) - len(s) >= minimum}
def candidats(w):
    out = {w}
    if w in lemmes_de:
        out |= lemmes_de[w]
        if w.endswith("ment"): out |= suffixes(w, ADV)
        return out
    out |= suffixes(w, NOM) | suffixes(w, ADV)
    for s in VER:
        if w.endswith(s) and len(w) - len(s) >= 2:
            st = w[: len(w) - len(s)]
            out.add(st + "er")
            if st.endswith("ge"): out.add(st[:-1] + "er")
            if st.endswith("ç"): out.add(st[:-1] + "cer")
    out |= {w[: len(w) - len(s)] + "ir" for s in VIR if w.endswith(s) and len(w) - len(s) >= 2}
    return out
OUTILS = set("pas plus rien personne bien tout faire avoir être aller dire voir petit grand point fin bon mal cour sens "
             "sort pu vu été eu fait mais car or".split())
lex, ecart = {}, 0
for w in vocab | set(lemmes_de):
    if len(w) < 3 or w in OUTILS: continue
    if w in pol: lex[w] = pol[w]; continue
    vals = {pol[l] for l in candidats(w) if l in pol and l not in OUTILS}
    if len(vals) == 1: lex[w] = vals.pop()
    elif vals: ecart += 1
for w in list(lex):
    if "oe" in w: lex[w.replace("oe", "œ")] = lex[w]
with open(sortie, "w") as o:
    o.write("-- Lexique de sentiment français par formes (généré par ferramentas/fr/lexique_fr.py) : FEEL (Abdaoui et al.\n"
            "-- 2017, LIRMM, usage personnel/recherche) + supplément annoté, étendu aux formes fléchies par Lexique383\n"
            "-- (lexique.org, CC BY-SA). -1 négatif, 1 positif.\nreturn {\n")
    for w in sorted(lex): o.write('["%s"]=%d,\n' % (w, lex[w]))
    o.write("}\n")
if len(lex) > 64000: print("ATTENTION : LuaJIT plafonne à 65 535 constantes par fichier ; découper le lexique en deux modules")
print(len(pol), "lemmes polarisés ;", len(lex), "formes ;", ecart, "formes ambiguës écartées")
