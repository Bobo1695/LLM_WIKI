---
title: Citations
type: source
source_path: raw/incoming/Citations.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, citazioni, api, trasparenza]
---

## TL;DR
- Le citazioni permettono a Claude di indicare esattamente da quale parte del documento sorgente proviene ogni affermazione.
- Si abilitano aggiungendo `"citations": {"enabled": True}` nel document block della chiamata API.
- La risposta diventa strutturata: ogni claim include `cited_text`, `document_index`, `document_title`, `start_page_number`.
- Funziona sia con PDF che con testo plain; per i PDF usa numeri di pagina, per il testo plain usa posizioni di carattere.

## Punti chiave

**Perché le citazioni sono importanti**
- Senza citazioni, l'utente non sa se Claude attinge al documento fornito o al training data.
- Le citazioni creano un trail trasparente: risposta → testo sorgente specifico.
- Aumentano la fiducia dell'utente e permettono verifica indipendente.

**Come abilitare le citazioni (PDF)**
```json
{
    "type": "document",
    "source": {
        "type": "base64",
        "media_type": "application/pdf",
        "data": "<file_bytes>"
    },
    "title": "earth.pdf",
    "citations": { "enabled": true }
}
```

**Come abilitare le citazioni (testo plain)**
```json
{
    "type": "document",
    "source": {
        "type": "text",
        "media_type": "text/plain",
        "data": "<article_text>"
    },
    "title": "earth_article",
    "citations": { "enabled": true }
}
```

**Struttura della risposta con citazioni**
- La risposta non è più testo semplice: contiene blocchi strutturati.
- Ogni citation block include:
  - `cited_text`: il testo esatto del documento che supporta l'affermazione.
  - `document_index`: quale documento (utile con documenti multipli).
  - `document_title`: il titolo assegnato al documento.
  - `start_page_number` / `end_page_number`: dove nel documento (PDF) o posizione di carattere (testo).

**Casi d'uso ideali**
- Applicazioni dove l'utente deve poter verificare le informazioni.
- Documenti autorevoli che si vuole referenziare direttamente.
- Interfacce con hover sulle citazioni per esplorare il contesto originale.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/citations-api|Citations API]]

## Citazioni notevoli
> "By implementing citations, you transform Claude from a 'black box' that provides answers into a transparent research assistant that shows its work."

> "Citations solve this transparency problem by creating a clear trail from Claude's response back to your source material."

## Connessioni
- Feature API di [[wiki/entities/claude|Claude]] applicabile direttamente alle pipeline RAG descritte in [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]].
- Implementazione dettagliata con esempi di codice in [[wiki/sources/2026-05-08-citations-implementation|Citations Implementation]].
