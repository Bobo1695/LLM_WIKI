---
title: Temperature
type: source
source_path: raw/Temperature.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, temperature, parametro, creativita]
---

## TL;DR
- `temperature` ∈ [0.0, 1.0]: controlla il grado di casualità nella scelta del prossimo token.
- Bassa = deterministica (factual, coding). Alta = creativa (brainstorming, storytelling).
- Non garantisce output diversi — cambia solo la probabilità di ottenerli.

## Punti chiave

### Tabella range

| Range | Task |
|---|---|
| 0.0 – 0.3 | Fatti, codice, data extraction, moderation |
| 0.4 – 0.7 | Riassunti, educazione, problem-solving |
| 0.8 – 1.0 | Brainstorming, creative writing, marketing |

### Aggiunta alla funzione chat

```python
def chat(messages, system=None, temperature=1.0):
    params = {"model": model, "max_tokens": 1000, "messages": messages, "temperature": temperature}
    if system:
        params["system"] = system
    return client.messages.create(**params).content[0].text
```

## Entità menzionate
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/temperature-parameter|Temperature]]
- [[wiki/concepts/tokenization|Tokenization e generazione]]
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]

## Connessioni
Evoluzione del pattern chat di [[wiki/sources/2026-05-07-system-prompts|System prompts]], aggiunge il terzo parametro opzionale.
