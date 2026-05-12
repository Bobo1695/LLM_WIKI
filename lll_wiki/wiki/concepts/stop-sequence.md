---
title: Stop Sequence
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [parametro, generazione, anthropic]
sources: [2026-05-07-accessing-the-api, 2026-05-07-structured-data]
---

Stringa (o lista di stringhe) che, se incontrata durante la generazione, interrompe immediatamente Claude. Parametro `stop_sequences` dell'[[wiki/concepts/anthropic-messages-api|API]].

## Condizioni di stop in Claude

Claude si ferma quando:
1. `max_tokens` raggiunto → `stop_reason: "max_tokens"`
2. Token end-of-sequence naturale → `stop_reason: "end_turn"`
3. Stop sequence incontrata → `stop_reason: "stop_sequence"`

## Uso principale
Combinato con [[wiki/concepts/assistant-prefilling|assistant prefilling]] per output strutturato pulito:
```python
chat(messages, stop_sequences=["```"])
```
Claude smette di generare non appena trova ` ``` `, lasciando solo il contenuto interno.

## Connessioni
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling]] — uso principale delle stop sequences.
- [[wiki/concepts/tokenization|Tokenization e generazione]] — le stop sequences sono una condizione di interruzione del loop di generazione.
