---
title: Prompt Caching
type: source
source_path: raw/incoming/Prompt caching.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-caching, performance, ottimizzazione, api]
---

## TL;DR
- Il prompt caching salva il lavoro di preprocessing di Claude invece di scartarlo dopo ogni richiesta.
- Le richieste successive che inviano contenuto identico leggono dalla cache invece di rielaborare tutto da zero.
- La cache dura un'ora e conviene soprattutto quando si invia lo stesso contenuto con alta frequenza.
- Vantaggi principali: risposte più veloci e costi ridotti per le porzioni cachate.

## Punti chiave

**Come Claude processa normalmente le richieste (senza caching)**
- Tokenizza il prompt in pezzi più piccoli
- Crea embedding per ogni token
- Aggiunge contesto basato sul testo circostante
- Solo dopo genera la risposta effettiva
- Tutto questo lavoro di preprocessing viene scartato al termine della richiesta

**Il problema del lavoro ripetuto**
- Nelle conversazioni multi-turno o nei workflow di analisi documentale, lo stesso contenuto viene inviato più volte
- Claude deve ripetere l'intero preprocessing su contenuto già analizzato
- Questo spreco aumenta costi e latenza

**Come funziona il prompt caching**
- La prima richiesta esegue il preprocessing e salva i risultati in cache
- La cache funziona come una lookup table: "se rivedo questo messaggio, riuso il lavoro già fatto"
- Le richieste successive leggono dalla cache invece di rielaborare

**Benefici**
- Risposte più veloci per richieste che usano contenuto cachato
- Costo inferiore per le porzioni cachate della richiesta
- Ottimizzazione automatica: la prima richiesta "scrive", le successive "leggono"

**Limitazioni**
- La cache dura solo un'ora
- Utile solo se si invia ripetutamente lo stesso contenuto
- Massimamente efficace con alta frequenza di richieste con contenuto identico

**Casi d'uso ideali**
- Workflow di analisi documentale (più domande sullo stesso documento lungo)
- Task di editing iterativo (il contenuto base rimane costante)

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/prompt-caching|Prompt Caching]], [[wiki/concepts/tokenization|Tokenization]]

## Citazioni notevoli
> "Instead of throwing away all the processing work after each request, Claude can save and reuse it when you send similar content again."

> "Prompt caching works best for scenarios like document analysis workflows, where you're asking multiple questions about the same large document, or iterative editing tasks where the base content remains constant while you refine specific aspects."

## Connessioni
- Questa fonte introduce il concetto base del prompt caching; i dettagli implementativi sono in [[wiki/sources/2026-05-08-rules-of-prompt-caching|Rules of Prompt Caching]] e [[wiki/sources/2026-05-08-prompt-caching-in-action|Prompt Caching in Action]].
- Il preprocessing descritto (tokenizzazione, embedding) si collega a [[wiki/concepts/tokenization|Tokenization]].
- Il contesto di API usage si ricollega a [[wiki/sources/2026-05-07-accessing-the-api|Accessing the API]] e [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]].
