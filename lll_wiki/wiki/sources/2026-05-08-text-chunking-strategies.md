---
title: Text Chunking Strategies
type: source
source_path: raw/incoming/Text chunking strategies.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, chunking, nlp]
---

## TL;DR
- Il chunking è uno dei passi più critici di una pipeline RAG: una strategia sbagliata produce risposte errate.
- Esistono tre approcci principali: size-based, structure-based, semantic-based.
- Il chunking size-based con overlap è il fallback affidabile per qualsiasi tipo di documento.
- Non esiste una strategia "migliore": la scelta dipende dal tipo di documento e dal caso d'uso.

## Punti chiave

**Perché il chunking è critico**
- Un chunk mal costruito può inserire contesto irrilevante nel prompt (es. sezione medica invece di ingegneria software).
- La qualità del chunking determina direttamente la qualità delle risposte del sistema RAG.

**Size-based chunking**
- Divide il testo in stringhe di lunghezza uguale.
- Semplice, funziona con qualsiasi tipo di documento (incluso codice).
- Problema: può tagliare parole a metà e separare header dal contenuto.
- Soluzione: aggiungere overlap tra chunk contigui per garantire contesto e frasi complete.

**Structure-based chunking**
- Divide il testo in base alla struttura del documento (header, sezioni, paragrafi).
- Produce i chunk più significativi e puliti.
- Funziona bene su Markdown e documenti ben formattati.
- Limite: non funziona su testo plain o PDF privi di marcatori strutturali.

**Semantic-based chunking**
- Approccio più sofisticato: divide in frasi e raggruppa quelle semanticamente correlate.
- Produce i chunk più rilevanti.
- Costoso computazionalmente e complesso da implementare.

**Sentence-based chunking**
- Via di mezzo pratica: divide per frasi con regex, raggruppa N frasi per chunk con overlap.
- Buona scelta per documenti di testo generico.

**Regola pratica per la produzione**
- Size-based con overlap: semplice, affidabile, funziona con ogni tipo di contenuto.
- Structure-based: quando si controlla il formato dei documenti.
- Sentence-based: buona via di mezzo per la maggior parte dei testi.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]

## Citazioni notevoli
> "There's no single 'best' chunking strategy. The right approach depends on your specific documents, use cases, and the trade-offs you're willing to make between implementation complexity and chunk quality."

> "A poor chunking strategy can lead to irrelevant context being inserted into your prompts, causing your AI to give completely wrong answers."

## Connessioni
- Approfondisce il passo di preprocessing introdotto in [[wiki/sources/2026-05-08-introducing-rag|Introducing RAG]].
- Il chunking è il primo dei 5 step implementativi dettagliati in [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]].
