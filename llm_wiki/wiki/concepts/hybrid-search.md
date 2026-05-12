---
title: Hybrid Search (Semantic + Lexical)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [rag, search, bm25]
sources: [2026-05-08-bm25-lexical-search, 2026-05-08-multi-index-rag-pipeline]
---

Strategia di ricerca che combina semantic search (basata su embedding) e lexical search (basata su BM25) per superare i limiti di ciascun approccio usato singolarmente.

## Il problema della semantic search pura

La [[wiki/concepts/text-embeddings|semantic search]] eccelle nel trovare contenuti concettualmente correlati ma può fallire su match esatti. Se un utente cerca un ID univoco come "INC-2023-Q4-011", la ricerca semantica potrebbe restituire sezioni tematicamente vicine che non contengono però il termine specifico.

## BM25 Lexical Search

**BM25 (Best Match 25)** è il principale algoritmo di ricerca lessicale usato nelle pipeline [[wiki/concepts/rag|RAG]].

Funzionamento:
1. **Tokenizzazione**: la query viene divisa in termini individuali.
2. **Frequenza dei termini**: si conta quante volte ogni termine appare nei documenti.
3. **Peso per rarità**: termini rari ricevono peso maggiore; parole comuni (stop words) peso basso.
4. **Ranking**: i documenti con più occorrenze dei termini rari vengono classificati in alto.

Punti di forza:
- Trova match esatti su termini tecnici, codici, ID univoci.
- Ignora automaticamente le parole prive di valore di ricerca.
- Semplice e veloce da implementare.

Limite:
- Non capisce il significato: "automobile" e "macchina" sono termini diversi per BM25.

## Reciprocal Rank Fusion (RRF)

Per combinare i risultati di VectorIndex e BM25Index — che usano sistemi di scoring incompatibili — si usa il **Reciprocal Rank Fusion**. L'idea: si normalizza usando il ranking (posizione), non il punteggio assoluto.

Formula:

```
RRF_score(d) = Σ ( 1 / (k + rank_i(d)) )
```

Dove:
- `k` è una costante di smorzamento (tipicamente 60; valori minori amplificano le differenze di rank).
- `rank_i(d)` è la posizione del documento `d` nel ranking dell'indice `i`.

Esempio con k=1:

| Documento | VectorIndex rank | BM25 rank | RRF score |
|-----------|-----------------|-----------|-----------|
| Section 2 | 1               | 2         | 1/(1+1) + 1/(1+2) = **0.833** |
| Section 6 | 3               | 1         | 1/(1+3) + 1/(1+1) = **0.750** |
| Section 7 | 2               | 3         | 1/(1+2) + 1/(1+3) = **0.583** |

Un documento che performa bene in entrambi gli indici sale naturalmente in cima.

## Architettura consigliata

La classe `Retriever` (descritta in [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]]) incapsula entrambi gli index con un'interfaccia unificata (`add_document()`, `search()`), applica RRF internamente e restituisce i risultati fusi. L'architettura è estensibile: qualsiasi indice che implementa la stessa interfaccia viene automaticamente incluso nella fusione.

## Fonti
- [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]]
- [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]]
