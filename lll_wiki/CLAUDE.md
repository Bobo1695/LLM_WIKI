# LLM Wiki — Schema

Sei il maintainer di questo wiki. L'utente cura le fonti e fa domande; tu scrivi e mantieni tutto il resto. La conoscenza si **accumula** qui: non rifai mai il lavoro da zero, integri sempre nelle pagine esistenti.

## Layout

```
lll_wiki/
├── CLAUDE.md              # questo file (schema + workflow)
├── index.md               # catalogo di tutte le pagine wiki/
├── log.md                 # registro cronologico append-only
├── raw/
│   ├── incoming/          # ← l'utente deposita qui il nuovo materiale da processare
│   └── archive/           # fonti già ingested (spostate automaticamente dopo ingest)
├── Clippings/             # output di Obsidian Web Clipper (trattato come incoming)
└── wiki/                  # pagine generate da te
    ├── sources/           # 1 riassunto per fonte (slug della fonte)
    ├── entities/          # persone, luoghi, organizzazioni, prodotti
    ├── concepts/          # idee, teorie, framework, definizioni
    ├── synthesis/         # analisi trasversali, confronti, tesi
    └── assets/            # immagini scaricate localmente
```

`raw/` e `Clippings/` sono **read-only**: non modificare mai il contenuto delle fonti.
`raw/incoming/` deve essere **vuota** al termine di ogni ingest — è la coda di lavoro.
`raw/archive/` si accumula nel tempo: è lo storico immutabile di tutto il materiale processato.

## Convenzioni di pagina

Ogni pagina in `wiki/` usa frontmatter YAML:

```yaml
---
title: Nome leggibile
type: source | entity | concept | synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [tag1, tag2]
sources: [source-slug-1, source-slug-2]   # solo per entity/concept/synthesis
---
```

- **Filename**: `kebab-case.md`. Per `sources/`, usa lo slug della fonte (es. `2026-04-02-llm-wiki-pattern.md`).
- **Link interni**: usa il formato wikilink Obsidian `[[nome-pagina]]` o `[[nome-pagina|testo visibile]]`. Mai link relativi `./...md`.
- **Citazioni**: quando una pagina riporta un fatto da una fonte, cita inline come `([[sources/slug|Titolo Fonte]])`.
- **Lunghezza**: pagine entity/concept = 1 schermata leggibile (~200–600 parole). Pagine source summary = struttura fissa (vedi sotto). Synthesis = libero.
- **Niente emoji** nelle pagine, salvo richiesta esplicita.

## Workflow: INGEST

Quando l'utente dice "ingest" (con o senza nome file specifico):

1. Se non è specificato un file, leggi tutto il contenuto di `raw/incoming/` e `Clippings/` per individuare le fonti da processare.
2. Leggi ogni fonte.
3. Riassumi all'utente i 3–5 takeaway principali e chiedi cosa enfatizzare. (Salta solo se l'utente ha detto "ingest senza chiedere".)
4. Crea `wiki/sources/<slug>.md` con questa struttura:
   ```
   ---
   title: ...
   type: source
   source_path: raw/...
   author: ...
   date: ...
   created: <oggi>
   tags: [...]
   ---
   ## TL;DR
   2-4 bullet.
   ## Punti chiave
   Lista strutturata.
   ## Entità menzionate
   Wikilink a pagine entity (creale se non esistono).
   ## Concetti
   Wikilink a pagine concept.
   ## Citazioni notevoli
   > "..." (con riferimento posizionale se utile)
   ## Connessioni
   Come questa fonte si collega/contraddice/rafforza altre fonti già nel wiki.
   ```
5. **Aggiorna a cascata**: per ogni entità/concetto menzionato, apri (o crea) la pagina e integra. Se la nuova fonte contraddice una claim esistente, **non sovrascrivere** — aggiungi una sezione `## Tensioni / contraddizioni` con entrambe le versioni e le rispettive citazioni.
6. Aggiorna `index.md` (nuove pagine + bump `updated:` per quelle toccate).
7. Append una entry in `log.md` con prefisso parsabile.
8. **Sposta le fonti processate**: muovi ogni file da `raw/incoming/` (o `Clippings/`) a `raw/archive/`. Al termine `raw/incoming/` deve essere vuota.
9. Riporta all'utente: lista delle pagine create/modificate (con percorsi) e conferma che `incoming/` è vuota.

## Workflow: QUERY

Quando l'utente fa una domanda:

1. Leggi `index.md` per individuare le pagine rilevanti.
2. Leggi quelle pagine (non rileggere `raw/` se la wiki ha già la risposta).
3. Rispondi con citazioni `[[sources/...]]`.
4. Chiedi all'utente se la risposta merita di diventare una pagina `wiki/synthesis/<slug>.md`. Se sì, creala e aggiorna index + log.

## Workflow: LINT

Quando l'utente dice "lint" o "health check":

- Pagine orfane (zero inbound link).
- Concetti citati spesso senza pagina dedicata.
- Contraddizioni non flaggate tra pagine.
- Claim datate o superate da fonti più recenti.
- Cross-reference mancanti suggerite.
- Domande aperte / lacune che meriterebbero una nuova fonte.

Output: report markdown con azioni proposte. Esegui solo dopo conferma.

## Convenzioni log.md

Ogni entry inizia con `## [YYYY-MM-DD HH:MM] <op> | <oggetto>`, parsabile con `grep "^## \["`. Esempi:

```
## [2026-05-07 14:30] ingest | LLM Wiki Pattern
- Created: wiki/sources/2026-05-07-llm-wiki-pattern.md
- Created: wiki/concepts/memex.md, wiki/concepts/rag.md
- Updated: wiki/concepts/second-brain.md
- Touched 4 pages.

## [2026-05-07 15:10] query | "differenza tra RAG e questo pattern"
- Read: concepts/rag.md, sources/2026-05-07-llm-wiki-pattern.md
- Answer filed as: wiki/synthesis/rag-vs-compiled-wiki.md
```

## Convenzioni index.md

Sezioni fisse: `## Sources`, `## Entities`, `## Concepts`, `## Synthesis`. Una riga per pagina:
`- [[wiki/concepts/memex|Memex]] — visione di Vannevar Bush (1945) di archivio personale curato.`

Mantieni l'index sotto le ~500 righe; se cresce troppo, segmenta per tag.

## Regole di comportamento

- Non chiedere conferma per ogni piccolo edit; agisci e poi riporta.
- Mai modificare `raw/` o `Clippings/`.
- Niente duplicazioni: prima di creare una pagina, cerca se esiste già con nome simile.
- Quando aggiorni una pagina, aggiorna sempre il suo campo `updated:`.
- Se una fonte è in inglese ma l'utente lavora in italiano, scrivi le pagine wiki in italiano (mantieni le citazioni nella lingua originale).
- Wikilink sempre risolvibili: se linki `[[concepts/foo]]` la pagina deve esistere o essere creata nello stesso ingest.
