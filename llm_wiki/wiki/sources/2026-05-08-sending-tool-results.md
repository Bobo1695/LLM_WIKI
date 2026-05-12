---
title: Sending Tool Results
type: source
source_path: raw/incoming/Sending tool results.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, tool-result, api, conversation-history]
---

## TL;DR
- Dopo che Claude richiede un tool call, bisogna eseguire la funzione e rimandare il risultato come ToolResultBlock.
- Il ToolResultBlock va inserito in un messaggio `"user"` e deve contenere l'ID corrispondente al ToolUseBlock originale.
- Se Claude richiede più tool nella stessa risposta, occorre inviare un risultato per ciascun ID.
- Nella chiamata di follow-up bisogna sempre includere lo schema dei tool, anche se non si prevede un'altra chiamata.

## Punti chiave
- **Eseguire la funzione**: estrarre i parametri con `response.content[1].input` e chiamare la funzione con unpacking Python: `get_current_datetime(**response.content[1].input)`.
- **Struttura del ToolResultBlock**:
  - `type`: `"tool_result"`.
  - `tool_use_id`: deve corrispondere all'`id` del ToolUseBlock richiesto da Claude.
  - `content`: output della funzione serializzato come stringa.
  - `is_error`: `True` se si è verificato un errore, altrimenti `False`.
- **Cronologia completa**: il messaggio di follow-up deve contenere tutta la storia: messaggio utente originale + messaggio assistente con tool use block + messaggio utente con tool result block.
- **Tool multipli**: Claude può richiedere più tool call in una singola risposta. Ogni chiamata ha ID univoco; i risultati devono essere inviati tutti prima della richiesta successiva.
- **Schema obbligatorio nel follow-up**: anche quando non ci si aspetta un'altra tool call, bisogna includere `tools=[...]` perché Claude ha bisogno dello schema per capire i riferimenti nella history.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]], [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]

## Citazioni notevoli
> "After Claude requests a tool call, you need to execute the function and send the results back. This completes the tool use workflow by providing Claude with the information it requested."

> "When sending the follow-up request, you must still include the tool schema even though you're not expecting Claude to make another tool call."

## Connessioni
- Continua direttamente da [[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]], completando il ciclo request-execute-return.
- Il pattern multi-turn che automatizza questo ciclo in un loop è descritto in [[wiki/sources/2026-05-08-multi-turn-with-tools|Multi-Turn Conversations with Tools]].
- Insieme a [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]], queste fonti costituiscono il nucleo tecnico del [[wiki/concepts/tool-use|Tool Use]].
