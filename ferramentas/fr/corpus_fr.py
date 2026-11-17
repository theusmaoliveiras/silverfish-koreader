#!/usr/bin/env python3
"""Extrait le texte des EPUB français de la bibliothèque Calibre (un .txt par livre)."""
import glob, html, os, re, sys, zipfile, random
LIB = sys.argv[2] if len(sys.argv) > 2 else "."  # dossier de la bibliothèque Calibre
OUT = sys.argv[1]
FR = set("les des une est qui pas dans sur avec il elle du au aux cette sont mais nous vous".split())
EN = set("the and was with that his her which this have from were they".split())
epubs = sorted(glob.glob(LIB + "/*/*/*.epub"))
random.seed(1); random.shuffle(epubs)
vus_auteurs, n = {}, 0
for p in epubs:
    auteur = p.split("/")[-3]
    if vus_auteurs.get(auteur, 0) >= 2: continue   # variété : 2 livres max par auteur
    try:
        z = zipfile.ZipFile(p)
        parts = [z.read(f).decode("utf-8", "ignore") for f in sorted(z.namelist()) if f.endswith((".xhtml", ".html", ".htm"))]
    except Exception:
        continue
    t = " ".join(parts)
    t = re.sub(r"(?s)<(script|style)[^>]*>.*?</\1>", " ", t)
    t = re.sub(r"</p>|<br\s*/?>", "\n", t)
    t = html.unescape(re.sub(r"<[^>]+>", " ", t))
    mots = re.findall(r"[a-zà-ÿœ]+", t.lower())
    if len(mots) < 20000: continue                      # BD, nouvelles très courtes : écartées
    fr = sum(w in FR for w in mots); en = sum(w in EN for w in mots)
    if fr < 3 * en: continue
    nom = re.sub(r"[^\w]+", "_", os.path.basename(p))[:80]
    open(os.path.join(OUT, nom + ".txt"), "w").write(t)
    vus_auteurs[auteur] = vus_auteurs.get(auteur, 0) + 1
    n += 1
    if n >= 60: break
print(n, "livres")
