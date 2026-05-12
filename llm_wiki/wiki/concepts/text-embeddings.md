---
title: Text Embeddings
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [rag, embeddings, nlp]
sources: [2026-05-08-text-embeddings, 2026-05-08-full-rag-flow]
---

Rappresentazione numerica del significato semantico di un testo, usata come base per la ricerca semantica nelle pipeline [[wiki/concepts/rag|RAG]].

## Cosa sono

Un embedding testuale è un vettore — una lista ordinata di numeri in virgola mobile — prodotto da un modello di embedding. Ogni numero è compreso tra -1 e +1 e rappresenta una "qualità" del testo appresa durante il training del modello. Il significato preciso di ogni dimensione non è interpretabile dagli umani: è emergente dall'addestramento.

L'intuizione utile: testi semanticamente simili producono vettori "vicini" nello spazio multidimensionale; testi diversi producono vettori "lontani".

## Come si generano

1. Si passa il testo (chunk o query) a un modello di embedding via API.
2. Il modello restituisce il vettore numerico.
3. Il vettore viene normalizzato a magnitudine 1.0 (operazione gestita automaticamente dall'API).

Il provider raccomandato da [[wiki/entities/anthropic|Anthropic]] è [[wiki/entities/voyage-ai|VoyageAI]] (modello: `voyage-3-large`), poiché Anthropic non produce embedding propri.

```python
import voyageai
client = voyageai.Client()

def generate_embedding(text, model="voyage-3-large", input_type="query"):
    result = client.embed([text], model=model, input_type=input_type)
    return result.embeddings[0]
```

## Cosine Similarity

Per trovare i chunk più simili a una query si usa la **cosine similarity**: misura il coseno dell'angolo tra due vettori normalizzati.

```
cosine_similarity(A, B) = (A · B) / (|A| × |B|)
```

Interpretazione del valore:

| Valore | Significato |
|--------|-------------|
| +1     | Vettori identici (massima similarità) |
| 0      | Vettori perpendicolari (nessuna relazione) |
| -1     | Vettori opposti (massima diversità) |

In pratica i vector database usano spesso la **cosine distance** = `1 - cosine_similarity`, dove 0 indica similarità massima e valori crescenti indicano maggiore distanza.

## Ruolo nella pipeline RAG

1. **Preprocessing**: si generano e si archiviano gli embedding di tutti i chunk nel vector database.
2. **Query-time**: si genera l'embedding della domanda utente e si cercano i chunk con cosine similarity più alta.
3. I chunk più simili vengono inseriti nel prompt finale per [[wiki/entities/claude|Claude]].

## Fonti
- [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]]
- [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]]
