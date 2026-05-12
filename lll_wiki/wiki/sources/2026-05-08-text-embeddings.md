---
title: Text Embeddings
type: source
source_path: raw/incoming/Text embeddings.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, embeddings, nlp, voyageai]
---

## TL;DR
- Un embedding testuale è una lista di numeri (da -1 a +1) che rappresenta il significato semantico di un testo.
- La semantic search usa gli embedding per trovare chunk concettualmente simili alla domanda dell'utente.
- Anthropic non produce embedding propri: il provider raccomandato è VoyageAI.
- Il modello consigliato è `voyage-3-large`.

## Punti chiave

**Il problema della ricerca nei chunk**
- Dopo il chunking, serve trovare quali chunk sono più rilevanti alla domanda.
- La ricerca per keyword esatta non basta: serve capire il significato.

**Cos'è un embedding**
- Rappresentazione numerica del significato di un testo.
- L'embedding model riceve testo in input e produce una lista di numeri float.
- Ogni numero è compreso tra -1 e +1.
- Ogni numero rappresenta una "qualità" del testo appresa durante il training (non direttamente interpretabile dagli umani).

**Semantic search**
- Si genera un embedding per ogni chunk durante il preprocessing.
- A query-time si genera un embedding per la domanda dell'utente.
- Si confrontano gli embedding per trovare i chunk semanticamente più vicini.

**VoyageAI come provider**
- Anthropic non offre embedding propri.
- Provider raccomandato: [[wiki/entities/voyage-ai|VoyageAI]].
- Richiede account separato e API key (gratuita per iniziare).
- Variabile d'ambiente: `VOYAGE_API_KEY`.
- Modello principale: `voyage-3-large`.

**Implementazione base**
- Installare la libreria `voyageai`.
- Creare un client `voyageai.Client()`.
- Chiamare `client.embed([text], model=model, input_type=input_type)`.
- Il parametro `input_type` differenzia query da documento.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/voyage-ai|VoyageAI]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/text-embeddings|Text Embeddings]]

## Citazioni notevoli
> "A text embedding is a numerical representation of the meaning contained in some text. Think of it as converting words and sentences into a format that computers can work with mathematically."

> "Each number in an embedding is essentially a 'score' for some quality of the input text. However, here's the important caveat: we don't know precisely what each number represents."

## Connessioni
- Il secondo passo della pipeline RAG descritta in [[wiki/sources/2026-05-08-introducing-rag|Introducing RAG]].
- Gli embedding vengono usati concretamente nel flow descritto in [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]].
- La cosine similarity come metrica di confronto è spiegata in dettaglio in [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]].
