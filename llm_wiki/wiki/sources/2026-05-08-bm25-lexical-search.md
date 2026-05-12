---
title: BM25 Lexical Search
type: source
source_path: raw/incoming/BM25 lexical search.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, bm25, ricerca-lessicale, hybrid-search]
---

## TL;DR
- La semantic search da sola può restituire risultati semanticamente correlati ma privi del termine esatto cercato.
- BM25 (Best Match 25) è un algoritmo di ricerca lessicale che pesa i termini rari più in alto.
- La soluzione ottimale è combinare semantic search e BM25 in parallelo (hybrid search).
- BM25 eccelle su termini tecnici, ID univoci e frasi specifiche.

## Punti chiave

**Il problema della semantic search pura**
- Cercando un ID come "INC-2023-Q4-011", la semantic search può restituire sezioni correlate concettualmente ma che non contengono l'ID.
- Esempio: ritorna la sezione "financial analysis" invece della sezione "software engineering" che contiene l'ID.

**Come funziona BM25**
1. Tokenizzazione della query: "a INC-2023-Q4-011" → `["a", "INC-2023-Q4-011"]`.
2. Conteggio della frequenza dei termini: "a" appare 5 volte, "INC-2023-Q4-011" appare 1 volta.
3. Peso inversamente proporzionale alla frequenza: termini rari ricevono pesi più alti.
4. Ricerca dei documenti con più occorrenze dei termini pesanti.

**Caratteristiche di BM25**
- Ignora le parole comuni ("stop words").
- Dà alta importanza ai termini tecnici rari e agli ID.
- Lavora su frequenza dei termini, non su significato semantico.
- Complementare alla semantic search.

**Implementazione base**
- Creare un `BM25Index`.
- Aggiungere i chunk con `store.add_document({"content": chunk})`.
- Cercare con `store.search(query_text, k)`.

**Hybrid search strategy**
- Eseguire semantic search e BM25 in parallelo.
- Combinare i risultati per ottenere il meglio dei due approcci.
- La fusione dei risultati viene implementata tramite Reciprocal Rank Fusion (vedi [[wiki/sources/2026-05-08-multi-index-rag-pipeline|Multi-Index RAG Pipeline]]).

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/hybrid-search|Hybrid Search (Semantic + Lexical)]]

## Citazioni notevoli
> "The key insight is that both search methods have complementary strengths. Semantic search understands context and meaning, while lexical search ensures you don't miss exact term matches."

> "BM25 excels at finding exact matches because it gives higher weight to rare, specific terms [and] ignores common words that don't add search value."

## Connessioni
- Risponde al limite identificato in [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]].
- Il BM25 viene integrato nel sistema ibrido descritto in [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]].
