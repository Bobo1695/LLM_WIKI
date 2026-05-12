---
title: LLM Wiki Pattern
type: source
source_path: (messaggio utente, 2026-05-07)
author: (anonimo, condiviso dall'utente)
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [meta, llm, knowledge-management, pattern]
---

## TL;DR
- Pattern per knowledge base personali in cui l'LLM **compila e mantiene** un wiki persistente, invece di rifare retrieval da zero a ogni domanda (come fa il [[wiki/concepts/rag|RAG]] classico).
- Tre layer: fonti raw immutabili, wiki markdown generato dall'LLM, file di schema (questo `CLAUDE.md`) che codifica le convenzioni.
- Tre operazioni: **ingest** (integra una nuova fonte a cascata), **query** (rispondi dal wiki, eventualmente filing della risposta), **lint** (health check periodico).
- L'umano cura fonti e domande; l'LLM fa il lavoro di bookkeeping che fa morire i wiki tradizionali.

## Punti chiave
- **Differenza chiave vs RAG**: la conoscenza è un artefatto **compounding**. Cross-reference, contraddizioni, sintesi sono già lì — non rederivati a ogni query.
- **Architettura**: `raw/` (immutabile) → `wiki/` (generato) ← `CLAUDE.md` (schema). L'utente non scrive il wiki, lo legge.
- **Indicizzazione**: due file speciali. `index.md` orientato al contenuto (catalogo), `log.md` orientato al tempo (cronologia append-only). A scala moderata (~100 fonti) bastano da soli, niente embedding richiesti.
- **Casi d'uso**: ricerca, sviluppo personale, lettura libri (stile Tolkien Gateway), wiki aziendale auto-mantenuto, due diligence, deep-dive hobby.
- **Tooling consigliato**: Obsidian come IDE di lettura (graph view, dataview, marp), Web Clipper per ingest articoli web, eventualmente `qmd` per ricerca a scala.
- **Filosofia**: il problema dei wiki umani è la manutenzione, non la lettura/scrittura. Gli LLM annullano quel costo.

## Entità menzionate
- [[wiki/entities/vannevar-bush|Vannevar Bush]] — citato per il Memex (1945) come precursore concettuale.

## Concetti
- [[wiki/concepts/memex|Memex]]
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/compiled-wiki|Compiled Wiki]]
- [[wiki/concepts/second-brain|Second Brain]]

## Citazioni notevoli
> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."

> "Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase."

## Connessioni
- È la **fonte seme** di tutto questo wiki: ogni convenzione in `CLAUDE.md` deriva da qui.
- Si oppone esplicitamente al pattern [[wiki/concepts/rag|RAG]] e si pone come evoluzione del [[wiki/concepts/memex|Memex]] di Bush risolvendo il problema della manutenzione.
