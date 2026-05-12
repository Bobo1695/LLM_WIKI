---
title: Compiled Wiki
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [llm, architettura, knowledge-management, pattern]
sources: [2026-05-07-llm-wiki-pattern]
---

Pattern alternativo al [[wiki/concepts/rag|RAG]]: invece di recuperare chunk a query-time, l'LLM **compila incrementalmente** un wiki persistente di markdown interlinkati che vive tra l'utente e le fonti raw.

## Proprietà
- **Compounding**: ogni nuova fonte arricchisce le pagine esistenti, non aggiunge solo un nuovo documento da indicizzare.
- **Pre-sintetizzato**: cross-reference, contraddizioni, comparazioni sono già nelle pagine prima della query.
- **Manutenzione automatica**: l'LLM aggiorna 10–15 pagine per ingest senza stancarsi — risolve il limite di scala dei wiki umani.
- **Bassa infrastruttura**: a scala moderata (~100 fonti) bastano `index.md` + filesystem, niente vector DB.

## Tre layer canonici
1. `raw/` immutabile.
2. `wiki/` generato dall'LLM.
3. Schema (`CLAUDE.md` / `AGENTS.md`) che codifica convenzioni e workflow.

## Tre operazioni canoniche
- **Ingest**: integra una fonte aggiornando tutte le pagine rilevanti a cascata.
- **Query**: risponde leggendo il wiki (non le fonti), opzionalmente filing della risposta come synthesis.
- **Lint**: health check (orfani, contraddizioni, claim stantie, lacune).

## Fonti
- [[wiki/sources/2026-05-07-llm-wiki-pattern|LLM Wiki Pattern]] — fonte primaria.
