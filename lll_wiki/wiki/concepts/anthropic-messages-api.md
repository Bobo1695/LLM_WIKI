---
title: Anthropic Messages API
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [api, anthropic, claude, sviluppo]
sources: [2026-05-07-accessing-the-api, 2026-05-07-making-a-request, 2026-05-07-multi-turn-conversations, 2026-05-07-system-prompts, 2026-05-07-temperature, 2026-05-07-response-streaming, 2026-05-07-structured-data]
---

Interfaccia REST di [[wiki/entities/anthropic|Anthropic]] per interagire con [[wiki/entities/claude|Claude]]. Endpoint principale: `client.messages.create()` (Python SDK).

## Parametri della chiamata

| Parametro | Obbligatorio | Descrizione |
|---|---|---|
| `model` | sì | Nome del modello (es. `claude-sonnet-4-0`) |
| `max_tokens` | sì | Limite massimo di token in output (safety cap, non target) |
| `messages` | sì | Lista di messaggi `{role, content}` |
| `system` | no | [[wiki/concepts/system-prompt|System prompt]] |
| `temperature` | no | [[wiki/concepts/temperature-parameter|Temperature]] (0.0–1.0, default 1.0) |
| `stop_sequences` | no | Lista di stringhe che interrompono la generazione |
| `stream` | no | `True` per [[wiki/concepts/response-streaming|response streaming]] |

## Struttura della risposta

```python
message.content[0].text   # testo generato
message.usage             # input_tokens, output_tokens
message.stop_reason       # "end_turn" | "max_tokens" | "stop_sequence"
```

## Setup base (Python)

```python
from dotenv import load_dotenv
load_dotenv()
from anthropic import Anthropic

client = Anthropic()          # legge ANTHROPIC_API_KEY da .env
model = "claude-sonnet-4-0"
```

## Sicurezza chiave
Non esporre mai l'API key in codice client-side. Il server fa da proxy. Vedi [[wiki/concepts/api-key-security|API Key Security]].

## Flusso a 5 step
Ogni chiamata segue: client → server proprio → Anthropic API → elaborazione Claude → risposta. Vedi [[wiki/sources/2026-05-07-accessing-the-api|fonte]] per il diagramma completo.

## Connessioni
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — gestione storia conversazione.
- [[wiki/concepts/system-prompt|System Prompt]] — personalizzazione comportamento.
- [[wiki/concepts/temperature-parameter|Temperature]] — controllo creatività.
- [[wiki/concepts/response-streaming|Response Streaming]] — output progressivo.
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling]] — output strutturato.
