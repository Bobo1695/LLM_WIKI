---
title: RAG (Retrieval-Augmented Generation)
type: concept
created: 2026-05-07
updated: 2026-05-08
tags: [llm, architettura, knowledge-management, rag, embeddings]
sources: [2026-05-07-llm-wiki-pattern, 2026-05-08-introducing-rag, 2026-05-08-text-chunking-strategies, 2026-05-08-text-embeddings, 2026-05-08-full-rag-flow, 2026-05-08-implementing-rag-flow, 2026-05-08-bm25-lexical-search, 2026-05-08-multi-index-rag-pipeline, 2026-05-08-citations, 2026-05-08-citations-implementation]
---

Pattern in cui un LLM, a query-time, recupera chunk rilevanti da una collezione di documenti (tipicamente via embedding + vector search) e li usa come contesto per generare una risposta.

## Limite secondo questo wiki
La conoscenza **non si accumula**: l'LLM riscopre da zero a ogni query. Niente cross-reference compilati, niente contraddizioni pre-flaggate, niente sintesi persistente. Buono per Q&A su corpus statici, debole quando il valore è nell'integrazione progressiva.

NotebookLM, ChatGPT file uploads, e la maggior parte dei sistemi RAG seguono questo schema.

## Confronto
Vedi [[wiki/concepts/compiled-wiki|Compiled Wiki]] per l'alternativa adottata in questo progetto.

## Implementazione tecnica

### Chunking

Il documento viene diviso in chunk prima di essere indicizzato. Tre strategie principali:

- **Size-based**: divide per lunghezza fissa con overlap opzionale. Semplice, funziona con qualsiasi documento (incluso codice), ma può spezzare frasi a metà.
- **Structure-based**: divide per marcatori strutturali (header, sezioni). Produce chunk puliti e significativi; richiede documenti ben formattati (es. Markdown).
- **Semantic-based**: raggruppa frasi semanticamente correlate. Qualità più alta ma computazionalmente costosa.

In produzione, il size-based con overlap è il fallback affidabile universale.

### Embeddings

Un embedding è un vettore di numeri (range -1 a +1) che rappresenta il significato semantico di un testo. Viene prodotto da un modello di embedding specializzato. Anthropic non fornisce embedding propri: il provider raccomandato è [[wiki/entities/voyage-ai|VoyageAI]] (modello `voyage-3-large`).

Per approfondire: [[wiki/concepts/text-embeddings|Text Embeddings]].

### Vector Search

Una volta generati, gli embedding vengono archiviati in un **vector database**. La similarità tra due vettori si misura con la **cosine similarity**:

- Range: da -1 (opposti) a +1 (identici).
- 0 = perpendicolari (nessuna relazione semantica).
- In pratica si usa spesso la cosine distance = `1 - cosine_similarity`.

La ricerca restituisce i chunk con embedding più vicino a quello della query utente.

### Ricerca ibrida

La semantic search pura può fallire su match esatti (es. ID univoci, codici, termini tecnici). La soluzione è la **ricerca ibrida** che combina:

- **Semantic search** (VectorIndex): capisce il contesto e il significato.
- **BM25 lexical search** (BM25Index): trova match esatti, pesa i termini rari più in alto.

I risultati dei due indici vengono fusi tramite **Reciprocal Rank Fusion (RRF)**:

```
RRF_score(d) = Σ ( 1 / (k + rank_i(d)) )
```

Per approfondire: [[wiki/concepts/hybrid-search|Hybrid Search (Semantic + Lexical)]].

## Citations API

Claude può citare esplicitamente i passi dei documenti sorgente da cui ha tratto le risposte. Si abilita aggiungendo `"citations": {"enabled": True}` nel document block della chiamata API. La risposta diventa strutturata: ogni affermazione include `cited_text`, `document_index`, `document_title` e `start_page_number`.

Questo trasforma il sistema RAG in uno strumento di ricerca trasparente dove l'utente può verificare ogni informazione nella fonte originale.

Per approfondire: [[wiki/concepts/citations-api|Citations API]].

## Fonti
- [[wiki/sources/2026-05-07-llm-wiki-pattern|LLM Wiki Pattern]]
- [[wiki/sources/2026-05-08-introducing-rag|Introducing RAG]]
- [[wiki/sources/2026-05-08-text-chunking-strategies|Text Chunking Strategies]]
- [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]]
- [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]]
- [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]]
- [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]]
- [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]]
- [[wiki/sources/2026-05-08-citations|Citations]]
