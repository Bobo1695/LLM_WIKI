---
title: Handling Message Blocks
type: source
source_path: raw/incoming/Handling message blocks.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, message-blocks, conversation-history, api]
---

## TL;DR
- Quando Claude usa un tool, la risposta non è più un semplice testo ma un messaggio multi-blocco (TextBlock + ToolUseBlock).
- Il ToolUseBlock contiene: ID univoco, nome della funzione, parametri di input, tipo `"tool_use"`.
- Bisogna salvare l'intero contenuto del messaggio nella cronologia, non solo il testo.
- Il flusso completo è in 5 passi: invia messaggio → ricevi multi-block → esegui tool → invia risultato → ricevi risposta finale.

## Punti chiave
- **Abilitare i tool**: aggiungere il parametro `tools=[...]` alla chiamata `client.messages.create()`, passando la lista di schema JSON.
- **Struttura multi-blocco**: quando Claude decide di usare uno strumento, il campo `content` del messaggio di risposta contiene una lista con:
  - **TextBlock**: testo leggibile che spiega cosa sta facendo Claude (es. "Let me find that information for you").
  - **ToolUseBlock**: istruzioni per il codice — quale funzione chiamare e con quali parametri.
- **Campi del ToolUseBlock**:
  - `id`: identificatore univoco per tracciare la chiamata.
  - `name`: nome della funzione (es. `"get_current_datetime"`).
  - `input`: dizionario dei parametri.
  - `type`: sempre `"tool_use"`.
- **Gestione della cronologia**: Claude è stateless — occorre gestire manualmente la storia. Appendere `response.content` (non solo il testo) al messaggio `"assistant"` per preservare tutti i blocchi.
- **Aggiornamento degli helper**: le funzioni `add_user_message()` e `add_assistant_message()` devono essere aggiornate per gestire contenuto multi-blocco.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]], [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]

## Citazioni notevoli
> "Instead of just getting back a single text block, Claude can now return multi-block messages that contain both text and tool usage information."

> "Remember that Claude doesn't store conversation history - you need to manage it manually."

## Connessioni
- Estende il lavoro di [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]] mostrando come lo schema viene usato in una vera chiamata API.
- Il passo successivo — inviare i risultati del tool a Claude — è descritto in [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]].
- La gestione stateless della conversazione è approfondita nel concetto [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]].
