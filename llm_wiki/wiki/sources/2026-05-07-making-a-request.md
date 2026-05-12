---
title: Making a Request
type: source
source_path: raw/Making a request.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, api, python, codice]
---

## TL;DR
- Setup: `pip install anthropic python-dotenv`, chiave in `.env`, `client = Anthropic()`.
- Chiamata core: `client.messages.create(model, max_tokens, messages)`.
- `max_tokens` è un safety cap, non un target: Claude si ferma prima se finisce naturalmente.
- Risposta: `message.content[0].text`.

## Punti chiave

### Setup ambiente

```python
%pip install anthropic python-dotenv

# .env
ANTHROPIC_API_KEY="sk-ant-..."

from dotenv import load_dotenv
load_dotenv()
from anthropic import Anthropic
client = Anthropic()
model = "claude-sonnet-4-0"
```

### Prima chiamata

```python
message = client.messages.create(
    model=model,
    max_tokens=1000,
    messages=[{"role": "user", "content": "What is quantum computing? Answer in one sentence"}]
)
print(message.content[0].text)
```

### Struttura messaggi
- `role: "user"` → input umano
- `role: "assistant"` → risposta Claude

## Entità menzionate
- [[wiki/entities/anthropic|Anthropic]]
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]
- [[wiki/concepts/api-key-security|API Key Security]]

## Connessioni
Punto di partenza pratico del corso; si estende con [[wiki/sources/2026-05-07-multi-turn-conversations|Multi-Turn conversations]] e [[wiki/sources/2026-05-07-system-prompts|System prompts]].
