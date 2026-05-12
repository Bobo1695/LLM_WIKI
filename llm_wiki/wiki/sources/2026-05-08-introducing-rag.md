---
title: Introducing Retrieval Augmented Generation
type: source
source_path: raw/incoming/Introducing Retrieval Augmented Generation.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, introduzione, chunking]
---

## TL;DR
- RAG spezza documenti grandi in chunk e inserisce nel prompt solo i pezzi più rilevanti alla domanda dell'utente.
- L'alternativa "prompt stuffing" (includere tutto il documento) è limitata da costi, latenza e context window.
- RAG scala a documenti molto grandi e a collezioni multi-documento.
- Richiede un passo di preprocessing e un meccanismo di ricerca, aumentando la complessità.

## Punti chiave

**Il problema dei documenti grandi**
- Un documento da 800 pagine non entra in un singolo prompt.
- Includere tutto il testo è costoso, lento e riduce l'efficacia di Claude.

**Approccio RAG**
- Fase di preprocessing: il documento viene spezzato in chunk.
- A query-time: si trovano i chunk più rilevanti e si inseriscono nel prompt.
- Risultato: prompt più piccoli, meno costosi, più focalizzati.

**Vantaggi**
- Claude si concentra solo sul contenuto pertinente.
- Scala a documenti molto grandi o a corpus multipli.
- Riduce costi e latency rispetto al full-context.

**Sfide**
- Richiede un passo di chunking in fase di preprocessing.
- Serve un meccanismo di ricerca per trovare i chunk rilevanti.
- I chunk recuperati potrebbero non contenere tutto il contesto necessario.
- La scelta della strategia di chunking è critica e non banale.

**Quando usare RAG**
- Documenti molto grandi o collezioni di documenti.
- Quando si vuole ottimizzare per costo e performance.
- Quando la semplicità non è la priorità principale.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]

## Citazioni notevoli
> "RAG trades simplicity for scalability and efficiency. While it requires more upfront work to implement properly, it enables you to work with document collections that would be impossible to handle with simple prompt stuffing."

## Connessioni
- Introduce il framework concettuale approfondito da [[wiki/sources/2026-05-08-text-chunking-strategies|Text Chunking Strategies]], [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]] e [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]].
- Complementare a [[wiki/sources/2026-05-07-llm-wiki-pattern|LLM Wiki Pattern]], che critica RAG per la mancanza di accumulazione progressiva della conoscenza.
