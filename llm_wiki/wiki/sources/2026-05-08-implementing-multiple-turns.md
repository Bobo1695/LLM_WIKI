---
title: Implementing Multiple Turns
type: source
source_path: raw/incoming/Implementing multiple turns.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, multi-turn, error-handling, routing, implementazione]
---

## TL;DR
- Il campo `stop_reason == "tool_use"` è il segnale preciso per continuare il loop; `"end_turn"` (o altro) segnala la risposta finale.
- La funzione `run_tools` filtra i blocchi di tipo `"tool_use"` e restituisce una lista di ToolResultBlock.
- L'error handling nel tool execution: anche in caso di errore bisogna restituire un ToolResultBlock con `is_error: True`.
- Una funzione di routing `run_tool(tool_name, tool_input)` smista le chiamate agli handler corretti, scalando facilmente con nuovi tool.

## Punti chiave
- **Rilevare la richiesta di tool**: `if response.stop_reason != "tool_use": break` — semplice condizione per uscire dal loop.
- **Loop di conversazione completo**:
  ```python
  def run_conversation(messages):
      while True:
          response = chat(messages, tools=[get_current_datetime_schema])
          add_assistant_message(messages, response)
          if response.stop_reason != "tool_use":
              break
          tool_results = run_tools(response)
          add_user_message(messages, tool_results)
      return messages
  ```
- **Gestione tool multipli per turno**: `run_tools` filtra `[block for block in message.content if block.type == "tool_use"]` e processa ogni blocco separatamente.
- **Struttura del ToolResultBlock**: `{"type": "tool_result", "tool_use_id": ..., "content": json.dumps(output), "is_error": False}`.
- **Error handling**: in caso di eccezione, inviare un blocco con `"is_error": True` e il messaggio di errore come `content`. Claude può adattare la risposta di conseguenza.
- **Routing scalabile**: funzione `run_tool(tool_name, tool_input)` con catena `if/elif` per mappare nomi → funzioni Python. Aggiungere un nuovo tool richiede solo aggiungere un `elif`.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]

## Citazioni notevoli
> "The key to knowing whether Claude wants to use a tool lies in the `stop_reason` field of the response message. When Claude decides it needs to call a tool, this field gets set to `'tool_use'`."

> "Robust tool execution requires handling potential errors. When a tool fails, we still need to provide a result block to Claude."

## Connessioni
- Implementa concretamente il loop introdotto in [[wiki/sources/2026-05-08-multi-turn-with-tools|Multi-Turn Conversations with Tools]].
- Il routing multi-tool viene poi utilizzato nella configurazione con tre strumenti mostrata in [[wiki/sources/2026-05-08-using-multiple-tools|Using Multiple Tools]].
- Il pattern di error handling con `is_error: True` integra il ciclo descritto in [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]].
