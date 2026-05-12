---
title: Claude
type: entity
created: 2026-05-07
updated: 2026-05-07
tags: [modello, llm, anthropic]
sources: [2026-05-07-accessing-the-api, 2026-05-07-making-a-request]
---

Famiglia di modelli linguistici sviluppati da [[wiki/entities/anthropic|Anthropic]], accessibili via [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]].

## Modelli citati nelle fonti
- `claude-sonnet-4-0` — usato negli esempi del corso Academy.

## Architettura interna (semplificata)
Il processo di generazione segue quattro stadi: [[wiki/concepts/tokenization|tokenizzazione]] → embedding → contestualizzazione → generazione. Vedi [[wiki/concepts/tokenization|Tokenization]] per dettagli.

## Proprietà chiave per sviluppatori
- **Stateless**: nessuna memoria di sessione. Per conversazioni multi-turno, il client deve inviare l'intera storia. Vedi [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]].
- **Controllabile**: comportamento modificabile via [[wiki/concepts/system-prompt|system prompt]] e [[wiki/concepts/temperature-parameter|temperature]].
- **Streaming**: supporta output token-by-token via [[wiki/concepts/response-streaming|response streaming]].
