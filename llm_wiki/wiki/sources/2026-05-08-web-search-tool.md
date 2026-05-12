---
title: The Web Search Tool
type: source
source_path: raw/incoming/The web search tool.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, built-in-tools, web-search, citazioni]
---

## TL;DR
- Il web search tool è un tool built-in completamente gestito da Anthropic: nessuna implementazione richiesta, solo uno schema stub.
- Lo schema usa il tipo `web_search_20250305` e supporta `max_uses` e `allowed_domains`.
- La risposta include blocchi di tipo speciale: `ServerToolUseBlock`, `WebSearchToolResultBlock`, `WebSearchResultBlock`, citation blocks.
- Va abilitato nelle impostazioni della console Anthropic prima dell'uso.

## Punti chiave
- **Setup**: abilitare il Web Search nella console (`https://console.anthropic.com/settings/privacy`), poi includere lo schema nella lista `tools`.
- **Schema minimo**:
  ```python
  web_search_schema = {
      "type": "web_search_20250305",
      "name": "web_search",
      "max_uses": 5
  }
  ```
- **Parametro `max_uses`**: limita il numero di ricerche per evitare chiamate API eccessive (Claude può decidere di effettuare ricerche aggiuntive basandosi sui risultati iniziali).
- **Parametro `allowed_domains`**: restringe le ricerche a domini specifici — utile per fonti autorevoli (es. `"nih.gov"` per informazioni mediche).
- **Tipi di blocchi nella risposta**:
  - `TextBlock`: spiegazione di Claude.
  - `ServerToolUseBlock`: query di ricerca usata da Claude.
  - `WebSearchToolResultBlock`: contenitore dei risultati.
  - `WebSearchResultBlock`: singolo risultato con titolo e URL.
  - Citation blocks: testo usato da Claude per supportare le risposte, con URL sorgente.
- **Rendering consigliato**: risultati web come lista di fonti in cima, citazioni inline con dominio/titolo/URL/testo citato.
- **Casi d'uso ottimali**: eventi correnti, informazioni specialistiche assenti nel training, fact-checking, ricerca con dati aggiornati.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/web-search-tool|Web Search Tool (built-in)]]

## Citazioni notevoli
> "Unlike other tools where you need to provide the implementation, Claude handles the entire search process automatically - you just need to provide a simple schema to enable it."

> "The citation format makes it clear which specific information came from which sources, building trust in the AI's responses."

## Connessioni
- Affianca [[wiki/sources/2026-05-08-text-edit-tool|The Text Edit Tool]] come altro tool built-in che non richiede implementazione.
- Risolve direttamente il problema esposto in [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]] (Claude senza accesso a dati real-time) in modo completamente gestito.
- Il parametro `allowed_domains` è concettualmente simile al principio di validazione input discusso in [[wiki/sources/2026-05-08-tool-functions|Tool Functions]].
