---
title: Web Search Tool (built-in)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [tool-use, built-in-tools, web-search]
sources: [2026-05-08-web-search-tool]
---

## Cos'è il Web Search Tool

Il **Web Search Tool** è un tool built-in di [[wiki/entities/anthropic|Anthropic]] che permette a [[wiki/entities/claude|Claude]] di effettuare ricerche su internet in tempo reale. A differenza dei tool personalizzati, l'intera logica di ricerca è gestita da Anthropic: l'utente deve solo fornire un piccolo schema stub per abilitarlo, senza scrivere alcuna implementazione ([[wiki/sources/2026-05-08-web-search-tool|The Web Search Tool]]).

## Prerequisito

Prima di poter usare il tool, l'organizzazione deve abilitare la funzionalità Web Search nella console Anthropic (`https://console.anthropic.com/settings/privacy`).

## Schema di Attivazione

```python
web_search_schema = {
    "type": "web_search_20250305",
    "name": "web_search",
    "max_uses": 5
}
```

Il tipo `web_search_20250305` è il versioning dello schema; versioni future potranno avere identificatori diversi.

## Parametri Configurabili

- **`max_uses`**: numero massimo di ricerche per conversazione. Claude può decidere autonomamente di effettuare ricerche di follow-up basandosi sui risultati iniziali; questo parametro previene un uso eccessivo dell'API.
- **`allowed_domains`**: lista opzionale di domini consentiti. Restringe le ricerche a fonti specifiche — utile per garantire risultati autorevoli (es. `["nih.gov"]` per informazioni mediche evidence-based).

## Tipi di Blocchi nella Risposta

Quando Claude esegue una ricerca web, la risposta contiene blocchi di tipo specifico non presenti nelle risposte normali:

| Tipo di blocco | Contenuto |
|---|---|
| `TextBlock` | Spiegazione di Claude in linguaggio naturale |
| `ServerToolUseBlock` | Query di ricerca effettiva usata da Claude |
| `WebSearchToolResultBlock` | Contenitore dei risultati di ricerca |
| `WebSearchResultBlock` | Singolo risultato con titolo e URL |
| Citation blocks | Testo specifico citato da Claude, con URL sorgente |

## Rendering dei Risultati

La struttura a blocchi è progettata per un rendering strutturato nell'interfaccia utente:
- I `WebSearchResultBlock` come lista di fonti in cima alla risposta.
- Le citazioni inline nel testo, con dominio, titolo della pagina, URL e testo citato.
- Questo approccio aumenta la trasparenza e la fiducia dell'utente nelle risposte di Claude.

## Casi d'Uso Ottimali

- Notizie ed eventi correnti.
- Informazioni specialistiche non presenti nel training data di Claude.
- Fact-checking con fonti autorevoli.
- Ricerca che richiede dati aggiornati.

## Relazioni

- [[wiki/concepts/tool-use|Tool Use]] — il meccanismo generale di cui questo è un'implementazione built-in.
- [[wiki/concepts/text-editor-tool|Text Editor Tool (built-in)]] — altro tool built-in di Anthropic con pattern simile.
- [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]] — lo schema stub segue la stessa convenzione degli schema personalizzati.
