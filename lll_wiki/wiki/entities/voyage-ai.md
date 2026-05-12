---
title: VoyageAI
type: entity
created: 2026-05-08
updated: 2026-05-08
tags: [entità, embeddings, ai]
sources: [2026-05-08-text-embeddings]
---

Provider di text embeddings consigliato da [[wiki/entities/anthropic|Anthropic]] per le pipeline [[wiki/concepts/rag|RAG]] basate su [[wiki/entities/claude|Claude]].

## Ruolo nell'ecosistema Anthropic

[[wiki/entities/anthropic|Anthropic]] non produce embedding propri. Per le pipeline [[wiki/concepts/rag|RAG]] che richiedono la generazione di [[wiki/concepts/text-embeddings|text embeddings]], il provider raccomandato ufficialmente da [[wiki/entities/anthropic-academy|Anthropic Academy]] è VoyageAI, specializzato in embedding testuali di alta qualità.

## Utilizzo

- Registrazione con account separato da Anthropic.
- API key gratuita per iniziare (variabile d'ambiente: `VOYAGE_API_KEY`).
- Libreria Python: `voyageai`.
- Modello principale consigliato: `voyage-3-large`.
- Il parametro `input_type` distingue tra embedding di query (`"query"`) e di documento (`"document"`).

## Fonti
- [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]]
