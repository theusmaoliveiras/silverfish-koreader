# Changelog

## 1.2.0 (2026-11-02)

- New: a gear button at the top of the silverfish screen opens the settings. Long-pressing the silverfish still
  opens them too.
- New: **Open at startup** and **Gesture shortcut** can now be turned on or off in the settings. Before, they
  could only be chosen on the welcome screen.
- New: with Bookshelf 6.1 or newer, the welcome screen's **Home screen card** option also puts the
  silverfish on Bookshelf's home shelf, so there are no manual steps.
- Bookshelf card, by [AndyHazz](https://github.com/AndyHazz)
  ([pull request](https://github.com/theusmaoliveiras/silverfish-koreader/pull/2)): ready for Bookshelf 6.1.
  The card is drawn once at its own size, refreshes only when the silverfish or its thought changes (no needless
  e-ink flashes), and sits centred among the covers on a cover shelf. Older Bookshelf versions still work.

Your silverfish keeps its progress: to update, replace the `silverfish.koplugin` folder (see "Updating and
backups" in the README), or update from Storefront.

## 1.1.0 (2026-10-31)

- New: a Silverfish card for the [Bookshelf](https://github.com/AndyHazz/bookshelf.koplugin) plugin. Put it in
  the top panel or stand it on a shelf among your books. Narrow, it's just the silverfish; wider, it gets a
  speech bubble with what it's thinking. Tap it to open its screen. Tested with Bookshelf 6.0.4.

Your silverfish keeps its progress: to update, replace the `silverfish.koplugin` folder (see "Updating and
backups" in the README), or update from Storefront.

## 1.0.0 (2026-10-30)

First public release.

- A silverfish that hatches, eats the pages you read and grows through four stages (nymph, young, adult, elder),
  with generations and a family lineage.
- A personality shaped by your reading: 16 literary influences, picked up from the text of your books and from
  their EPUB genre tags, about 70 lines each, plus traits from your habits (night owl, bitter, bold, romantic…).
- It notices characters, words, places and events; comments on chapters; reviews finished books.
- Diary, notebook of your highlights, achievements, bookshelf and lineage.
- Sleep screen with dreams about your reading, and a sleeping drawing for each stage.
- Optional card and button for the Simple UI plugin.
- Portuguese and English.

Changes since the beta (2026-10-29):

- The plugin folder is now `silverfish.koplugin`. Delete the old `traca.koplugin` before installing; your
  silverfish keeps its progress.
- Literary influences speak more often and with much more variety (about 70 lines each, up from 12).
- The sleep screen shows only dreams, with a sleeping drawing for each stage, centred, without cards.
- New egg drawing.
- Fixed: after the silverfish screen was covered by another window (for example, Simple UI's home screen after
  waking up), leftover silverfish screens could pile up and show up when leaving KOReader.
- No developer mode in this version.
