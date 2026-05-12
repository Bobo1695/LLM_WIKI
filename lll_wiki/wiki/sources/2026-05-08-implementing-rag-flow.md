---
title: Implementing the RAG Flow
type: source
source_path: raw/incoming/Implementing the RAG flow.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, implementazione, vector-database, python]
---

## TL;DR
- Implementazione pratica in Python dei 5 step RAG: chunking, embedding, vector store, query embedding, similarity search.
- Il vector store deve conservare sia gli embedding numerici sia il testo originale dei chunk.
- La ricerca restituisce i risultati ordinati per cosine distance (distanza bassa = alta similarità).
- Questa implementazione base funziona bene ma ha limiti: la sezione successiva introduce BM25 per casi edge.

## Punti chiave

**I 5 step dell'implementazione**
1. Chunking del testo per sezione (usando `chunk_by_section`).
2. Generazione degli embedding per tutti i chunk (batch).
3. Creazione del vector store e inserimento di embedding + testo originale.
4. Generazione dell'embedding per la query utente.
5. Ricerca nel vector store per trovare i chunk più simili.

**Perché salvare anche il testo originale**
- Il vector database restituisce numeri (embedding), non testo.
- Per poter inserire i chunk nel prompt finale serve il testo originale.
- Ogni entry nel database contiene: embedding + riferimento al testo (`{"content": chunk}`).

**VectorIndex**
- Classe usata per creare e interrogare il vector store.
- Metodo `add_vector(embedding, metadata)`: inserisce un embedding con metadati.
- Metodo `search(query_embedding, k)`: restituisce i k chunk più simili con cosine distance.

**Interpretazione dei risultati**
- Cosine distance: valori più bassi = maggiore similarità.
- Esempio: Section 2 (Software Engineering) → distance 0.71 (match più vicino).
- Section Methodology → distance 0.72 (secondo match).

**Limite dell'approccio**
- La ricerca semantica pura non garantisce match su termini esatti (es. ID univoci come "INC-2023-Q4-011").
- Soluzione: introdurre BM25 lexical search (vedi [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]]).

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/text-embeddings|Text Embeddings]]

## Citazioni notevoli
> "RAG is fundamentally about converting text to numbers (embeddings), storing those numbers efficiently, and then using mathematical similarity to find relevant content when users ask questions."

> "When we query our vector database, getting back just the embedding numbers isn't useful. We need the actual text that was used to generate those embeddings."

## Connessioni
- Implementazione pratica del flow teorico descritto in [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]].
- Introduce il problema che motiva [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]].
- Il sistema completo con ricerca ibrida è descritto in [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]].
