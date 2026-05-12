---
title: Accessing the API
type: source
source_path: raw/Accessing the API.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, api, architettura, llm-internals]
---

## TL;DR
- Ogni interazione con Claude segue un flusso a 5 step: client → server proprio → Anthropic API → elaborazione Claude → risposta.
- Non fare mai richieste all'API direttamente dal client (browser/mobile): la chiave API deve restare server-side.
- Claude elabora il testo in 4 stadi interni: tokenizzazione → embedding → contestualizzazione → generazione.
- La risposta include testo, conteggio token e `stop_reason`.

## Punti chiave

### Flusso a 5 step
1. Il client (browser/app) manda la richiesta al **tuo** server.
2. Il tuo server chiama l'**Anthropic API** con la chiave segreta.
3. Claude **processa** la richiesta internamente.
4. L'API risponde al tuo server.
5. Il tuo server restituisce il testo al client.

### Perché serve un server intermedio
Esporre l'API key nel codice client è una vulnerabilità critica: chiunque può estrarla e fare chiamate a tuo carico. Vedi [[wiki/concepts/api-key-security|API Key Security]].

### Elaborazione interna di Claude
Vedi [[wiki/concepts/tokenization|Tokenization e pipeline di generazione]] per dettagli su tokenizzazione, embedding, contestualizzazione, generazione.

### Condizioni di stop
Claude si ferma quando raggiunge `max_tokens`, genera un end-of-sequence token, o incontra una [[wiki/concepts/stop-sequence|stop sequence]].

### Struttura risposta
```
message     → testo generato
usage       → input_tokens, output_tokens
stop_reason → "end_turn" | "max_tokens" | "stop_sequence"
```

## Entità menzionate
- [[wiki/entities/anthropic|Anthropic]]
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]
- [[wiki/concepts/tokenization|Tokenization e generazione]]
- [[wiki/concepts/api-key-security|API Key Security]]
- [[wiki/concepts/stop-sequence|Stop Sequence]]

## Connessioni
Introduce la base architetturale su cui si appoggiano tutte le lezioni successive del corso [[wiki/entities/anthropic-academy|Anthropic Academy]].
