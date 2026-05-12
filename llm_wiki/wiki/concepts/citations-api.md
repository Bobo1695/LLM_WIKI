---
title: Citations API
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [rag, citazioni, api]
sources: [2026-05-08-citations, 2026-05-08-citations-implementation]
---

Feature dell'API di [[wiki/entities/claude|Claude]] che abilita la citazione puntuale delle fonti nella risposta, trasformando il modello da "scatola nera" a assistente di ricerca trasparente.

## Perché usarla

Senza citazioni, un utente non può distinguere se [[wiki/entities/claude|Claude]] sta usando il documento fornito o il suo training data. Le citazioni risolvono questo problema creando un tracciato verificabile: ogni affermazione nella risposta è collegata al testo esatto della fonte.

## Come si abilita

Si aggiunge il campo `citations` al document block nella chiamata API:

```python
{
    "type": "document",
    "source": {
        "type": "base64",          # oppure "text" per testo plain
        "media_type": "application/pdf",
        "data": file_bytes,
    },
    "title": "nome-documento.pdf",
    "citations": { "enabled": True }
}
```

Il campo `title` è necessario per identificare il documento nelle citazioni (utile con documenti multipli).

## Struttura della risposta

Con le citazioni abilitate, la risposta non è più testo semplice ma una struttura con blocchi distinti. Ogni citation block contiene:

| Campo | Descrizione |
|-------|-------------|
| `cited_text` | Il testo esatto del documento che supporta l'affermazione |
| `document_index` | Indice del documento (utile con più documenti in input) |
| `document_title` | Il titolo assegnato al documento |
| `start_page_number` | Pagina di inizio (PDF) o posizione carattere (testo plain) |
| `end_page_number` | Pagina di fine (PDF) |

Per documenti PDF si usano numeri di pagina; per testo plain si usano posizioni di carattere.

## Quando usarla

- Applicazioni dove l'utente deve poter verificare ogni affermazione.
- Documenti autorevoli (legali, medici, finanziari) che richiedono tracciabilità.
- Interfacce con tooltip o hover che mostrano il testo sorgente.
- Qualsiasi contesto in cui la trasparenza sulle fonti è critica per la fiducia dell'utente.

## Integrazione con RAG

Le citazioni si integrano naturalmente nelle pipeline [[wiki/concepts/rag|RAG]]: i chunk recuperati tramite [[wiki/concepts/hybrid-search|hybrid search]] vengono passati come document block con le citazioni abilitate, così l'utente vede non solo la risposta ma esattamente quale chunk l'ha generata.

## Fonti
- [[wiki/sources/2026-05-08-citations|Citations]]
- [[wiki/sources/2026-05-08-citations-implementation|Citations (Implementation)]]
