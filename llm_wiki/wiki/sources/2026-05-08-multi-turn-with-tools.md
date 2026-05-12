---
title: Multi-Turn Conversations with Tools
type: source
source_path: raw/incoming/Multi-turn conversations with tools.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, multi-turn, conversation-loop, refactoring]
---

## TL;DR
- Quando una domanda richiede più tool in sequenza, bisogna implementare un loop di conversazione che continua fino a quando Claude smette di richiedere strumenti.
- Il campo `stop_reason == "tool_use"` segnala che Claude vuole ancora usare strumenti; diverso da `"end_turn"` indica risposta finale.
- Gli helper (`add_user_message`, `add_assistant_message`, `chat`) devono essere refactorizzati per gestire oggetti messaggio completi.
- Una funzione `text_from_message` estrae il testo leggibile dai messaggi multi-blocco.

## Punti chiave
- **Scenario**: "What day is 103 days from today?" richiede prima `get_current_datetime`, poi `add_duration_to_datetime` — due tool in sequenza.
- **Il loop di conversazione** (pseudocodice):
  ```python
  def run_conversation(messages):
      while True:
          response = chat(messages)
          add_assistant_message(messages, response)
          if response isn't asking for a tool:
              break
          tool_result_blocks = run_tools(response)
          add_user_message(messages, tool_result_blocks)
      return messages
  ```
- **Refactoring degli helper**:
  - `add_user_message` e `add_assistant_message` aggiornati per accettare stringhe, liste di blocchi o oggetti `Message` completi.
  - La funzione `chat` riceve ora un parametro `tools` opzionale e restituisce il messaggio completo, non solo il testo.
- **Estrazione testo**: `text_from_message(message)` — unisce tutti i TextBlock del messaggio con `\n`.
- **Miglioramenti chiave**: gestione flessibile dei messaggi, supporto tool nella chat, oggetti messaggio completi, utility per estrazione testo.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]

## Citazioni notevoli
> "When building applications with multiple tools, you need to handle scenarios where Claude might need to call several tools in sequence to answer a single user question."

> "To handle this pattern, you need a conversation loop that continues until Claude stops requesting tools."

## Connessioni
- Presuppone la comprensione di [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]] e [[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]].
- L'implementazione concreta del loop con la condizione `stop_reason` è dettagliata in [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]].
- I tre tool del progetto che vengono orchestrati dal loop sono descritti in [[wiki/sources/2026-05-08-using-multiple-tools|Using Multiple Tools]].
- Il pattern si collega a [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] in quanto la storia è gestita interamente lato applicazione.
