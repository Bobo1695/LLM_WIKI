---
title: Citations (Implementation)
type: source
source_path: raw/incoming/Citations 1.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, rag, citazioni, api, implementazione]
---

## TL;DR
- File duplicato di Citations.md (stesso contenuto): entrambi trattano l'abilitazione e struttura delle citazioni nella API Claude.
- Le citazioni trasformano Claude in un assistente di ricerca trasparente che mostra le fonti.
- Si abilita con `"citations": {"enabled": True}` nel document block.
- La struttura della risposta include citation block con `cited_text`, `document_index`, `document_title`, `start_page_number`.

## Punti chiave

**Abilitazione citazioni**
- Aggiungere al document block: campo `title` e campo `citations: {"enabled": True}`.
- Funziona per documenti PDF (`base64`) e testo plain (`text`).

**Struttura della risposta**
- Risposta strutturata con citation block per ogni affermazione.
- Ogni citation: `cited_text`, `document_index`, `document_title`, `start_page_number`, `end_page_number`.
- PDF: usa numeri di pagina. Testo plain: usa posizioni di carattere.

**Benefici di trasparenza**
- L'utente vede che Claude risponde basandosi sul documento fornito, non solo sul training data.
- Possibilità di verificare le informazioni nel documento originale.
- Interfacce interattive con hover sulle citazioni.

**Quando usare le citazioni**
- Documenti autorevoli che l'utente deve poter referenziare.
- Applicazioni dove la verifica delle informazioni è critica.
- Sistemi che richiedono trasparenza sulle fonti.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]]
- [[wiki/concepts/citations-api|Citations API]]

## Citazioni notevoli
> "By implementing citations, you transform Claude from a 'black box' that provides answers into a transparent research assistant that shows its work."

## Connessioni
- Contenuto identico a [[wiki/sources/2026-05-08-citations|Citations]] (file sorgente duplicato).
- Feature complementare alle pipeline RAG di [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]] e [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]].
