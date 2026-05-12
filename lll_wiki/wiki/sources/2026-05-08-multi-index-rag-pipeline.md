---
title: A Multi-Index RAG Pipeline
type: source
source_path: raw/incoming/A Multi-Index RAG pipeline.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, hybrid-search, rrf, multi-index, architettura]
---

## TL;DR
- La classe `Retriever` combina VectorIndex e BM25Index tramite un'interfaccia unificata.
- La fusione dei risultati usa Reciprocal Rank Fusion (RRF): `RRF_score = Σ(1 / (k + rank_i))`.
- L'architettura è estensibile: qualsiasi index che implementa `add_document()` e `search()` può essere aggiunto.
- Il sistema ibrido supera entrambi gli approcci separati su query con termini tecnici specifici.

## Punti chiave

**Multi-Index Architecture**
- VectorIndex e BM25Index condividono la stessa API (`add_document()`, `search()`).
- La classe `Retriever` coordina entrambi gli index, raccoglie i risultati e li fonde.
- Interfaccia unificata per l'utente: basta chiamare `retriever.search(query)`.

**Reciprocal Rank Fusion (RRF)**
- Problema: VectorIndex e BM25Index usano sistemi di scoring diversi, non comparabili direttamente.
- Soluzione: si usa solo il ranking (posizione), non il punteggio assoluto.
- Formula: `RRF_score(d) = Σ(1 / (k + rank_i(d)))` dove k è una costante (tipicamente 60).
- Un documento che appare in posizione alta in entrambi gli index ottiene un punteggio RRF alto.

**Esempio RRF (con k=1)**
- Section 2: VectorIndex rank 1, BM25 rank 2 → RRF = 1/(1+1) + 1/(1+2) = 0.833
- Section 6: VectorIndex rank 3, BM25 rank 1 → RRF = 1/(1+3) + 1/(1+1) = 0.750
- Section 7: VectorIndex rank 2, BM25 rank 3 → RRF = 1/(1+2) + 1/(1+3) = 0.583
- Risultato finale: Section 2 > Section 6 > Section 7.

**Miglioramento rispetto al solo VectorIndex**
- Query "what happened with INC-2023-Q4-011?":
  - VectorIndex solo: Section 10 (corretto) + Section 3 - Financial Analysis (errato).
  - Retriever ibrido: Section 10 + Section 2 - Software Engineering (corretto) + Section 5.

**Estensibilità**
- Basta implementare l'interfaccia `SearchIndex` con `add_document()` e `search()`.
- Si possono aggiungere: keyword index, graph-based search, domain-specific index.
- Il Retriever incorpora automaticamente i nuovi index nel processo di fusione.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/hybrid-search|Hybrid Search (Semantic + Lexical)]]

## Citazioni notevoli
> "Merging results from different search methods isn't as simple as just concatenating lists. Each method uses different scoring systems, so we need a way to normalize and combine their rankings fairly."

> "The beauty of this architecture is its extensibility. Since all indexes implement the same SearchIndex protocol [...] you can easily add new search methodologies."

## Connessioni
- Integra e porta a compimento il lavoro di [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]] e [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]].
- L'architettura Retriever è il punto di arrivo della progressione tecnica di tutti i sorgenti del corso RAG di Anthropic Academy.
