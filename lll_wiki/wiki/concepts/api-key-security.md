---
title: API Key Security
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [sicurezza, api, anthropic]
sources: [2026-05-07-accessing-the-api, 2026-05-07-getting-an-api-key, 2026-05-07-making-a-request]
---

Principio fondamentale nell'uso dell'[[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]: la chiave API non deve mai essere esposta in codice client-side (browser, mobile app).

## Regole pratiche

- Archivia la chiave in un file `.env` mai committato (aggiungi al `.gitignore`).
- Il client manda le richieste al **tuo server**, che fa da proxy verso Anthropic.
- Genera la chiave da `console.anthropic.com` → "Get API Keys" → "Create Key".
- La chiave è mostrata **una sola volta** al momento della creazione: copiala subito. Se persa, eliminala e ricreane una.

## Pattern Python

```python
# .env
ANTHROPIC_API_KEY="sk-ant-..."

# codice
from dotenv import load_dotenv
load_dotenv()
from anthropic import Anthropic
client = Anthropic()  # legge automaticamente ANTHROPIC_API_KEY
```

## Connessioni
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — il servizio che usa la chiave.
- [[wiki/sources/2026-05-07-getting-an-api-key|Getting an API key]] — guida step-by-step.
