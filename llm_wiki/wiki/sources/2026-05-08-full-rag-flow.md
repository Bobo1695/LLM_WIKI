---
title: The Full RAG Flow
type: source
source_path: raw/incoming/The full RAG flow.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, embeddings, cosine-similarity, vector-database]
---

## TL;DR
- Il flow RAG completo si articola in 6 step: chunking, embedding, storage, query embedding, similarity search, generazione del prompt finale.
- La cosine similarity misura la vicinanza semantica tra vettori: valori da -1 (opposti) a +1 (identici), 0 = perpendicolare.
- Il vector database memorizza gli embedding e consente ricerche per similarità.
- La fase di preprocessing (step 1-3) avviene una volta sola; step 4-6 si ripetono per ogni query utente.

## Punti chiave

**Step 1 — Chunking del documento sorgente**
- Il testo viene diviso in chunk gestibili (es. per sezione).

**Step 2 — Generazione degli embedding**
- Ogni chunk viene convertito in un vettore di numeri tramite un embedding model.
- Il modello esegue automaticamente una normalizzazione che scala ogni vettore a magnitudine 1.0.
- I vettori normalizzati possono essere visualizzati su un cerchio unitario.

**Step 3 — Archiviazione nel vector database**
- Gli embedding e il testo originale vengono memorizzati in un database vettoriale specializzato.
- Qui finisce la fase di preprocessing (eseguita una volta sola in anticipo).

**Step 4 — Embedding della query utente**
- La domanda dell'utente viene passata allo stesso embedding model.
- Si ottiene un vettore normalizzato che rappresenta l'intento semantico della domanda.

**Step 5 — Ricerca per similarità**
- Il vettore della query viene inviato al vector database.
- Il database restituisce i chunk con embedding più simili (cosine similarity più alta).

**Step 6 — Creazione del prompt finale**
- La domanda dell'utente + il chunk più rilevante vengono combinati in un prompt per Claude.

**Cosine similarity**
- Misura il coseno dell'angolo tra due vettori.
- Range: da -1 a +1.
  - 1 = altissima similarità (stessa direzione).
  - -1 = molto diversi (direzione opposta).
  - 0 = perpendicolari (nessuna relazione).
- Cosine distance = (1 - cosine similarity): 0 = massima similarità, valori crescenti = meno simili.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/text-embeddings|Text Embeddings]]

## Citazioni notevoli
> "The database returns the software engineering section because it's the closest match to what the user asked about."

> "The vector database uses cosine similarity to determine which embeddings are most similar. This measures the cosine of the angle between two vectors."

## Connessioni
- Integra e sintetizza i concetti di [[wiki/sources/2026-05-08-text-chunking-strategies|Text Chunking Strategies]] e [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]] in un flow end-to-end.
- L'implementazione pratica di questo flow è in [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]].
