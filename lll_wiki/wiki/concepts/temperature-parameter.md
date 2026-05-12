---
title: Temperature
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [parametro, llm, creativita, anthropic]
sources: [2026-05-07-temperature]
---

Parametro decimale `[0.0, 1.0]` che controlla quanto Claude si fida delle probabilità più alte durante la [[wiki/concepts/tokenization|generazione]]. In pratica: il "dial della creatività".

- **Bassa (≈0)**: quasi deterministico, sceglie sempre il token più probabile. Stesso prompt → stessa risposta.
- **Alta (≈1)**: distribuisce la probabilità più uniformemente, introduce varietà e sorpresa.

## Quando usare quale range

| Range | Task tipici |
|---|---|
| 0.0 – 0.3 | Risposte fattuali, coding, data extraction, content moderation |
| 0.4 – 0.7 | Riassunti, contenuto educativo, problem-solving, creative writing con vincoli |
| 0.8 – 1.0 | Brainstorming, creative writing libero, marketing, umorismo |

> "Temperature doesn't guarantee different outputs — it just changes the probability of getting them." ([[wiki/sources/2026-05-07-temperature|fonte]])

## Implementazione

```python
def chat(messages, system=None, temperature=1.0):
    params = {
        "model": model,
        "max_tokens": 1000,
        "messages": messages,
        "temperature": temperature,
    }
    if system:
        params["system"] = system
    return client.messages.create(**params).content[0].text
```

## Connessioni
- [[wiki/concepts/tokenization|Tokenization e generazione]] — temperature agisce sul sampling step.
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — parametro opzionale della chiamata.
