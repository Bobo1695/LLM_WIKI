---
title: Multi-Turn Conversations
type: source
source_path: raw/Multi-Turn conversations.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, conversazione, stato, codice]
---

## TL;DR
- Claude è completamente stateless: ogni chiamata API è indipendente.
- Per conversazioni multi-turno, il client mantiene e reinvia l'intera lista `messages`.
- Pattern: aggiungi user message → chiama API → aggiungi assistant message → ripeti.

## Punti chiave

### Helper functions pattern

```python
def add_user_message(messages, text):
    messages.append({"role": "user", "content": text})

def add_assistant_message(messages, text):
    messages.append({"role": "assistant", "content": text})

def chat(messages):
    return client.messages.create(
        model=model, max_tokens=1000, messages=messages
    ).content[0].text
```

### Flusso corretto

```python
messages = []
add_user_message(messages, "Define quantum computing in one sentence")
answer = chat(messages)
add_assistant_message(messages, answer)   # ← step critico spesso dimenticato
add_user_message(messages, "Write another sentence")
final_answer = chat(messages)
```

## Entità menzionate
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]

## Connessioni
Le helper functions introdotte qui vengono riutilizzate in [[wiki/sources/2026-05-07-system-prompts|System prompts]], [[wiki/sources/2026-05-07-temperature|Temperature]], [[wiki/sources/2026-05-07-response-streaming|Response streaming]] e [[wiki/sources/2026-05-07-structured-data|Structured data]].
