---
title: System Prompts
type: source
source_path: raw/System prompts.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, system-prompt, prompt-engineering, comportamento]
---

## TL;DR
- Il system prompt è una stringa separata dai `messages` che definisce ruolo e comportamento di Claude.
- Passato come `system=` nella chiamata API (omettere se `None`, non passare `None`).
- Trasforma risposte generiche in interazioni specializzate e coerenti.

## Punti chiave

### Esempio: math tutor

```python
system_prompt = """
You are a patient math tutor.
Do not directly answer a student's questions.
Guide them to a solution step by step.
"""
```
Senza → Claude risolve l'equazione.
Con → Claude chiede "Qual è il primo passo per isolare x?"

### Implementazione robusta

```python
def chat(messages, system=None):
    params = {"model": model, "max_tokens": 1000, "messages": messages}
    if system:
        params["system"] = system   # l'API rifiuta system=None
    return client.messages.create(**params).content[0].text
```

## Entità menzionate
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/system-prompt|System Prompt]]
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]

## Connessioni
Estende il pattern chat di [[wiki/sources/2026-05-07-multi-turn-conversations|Multi-Turn conversations]]; il parametro `system` viene poi mantenuto anche in [[wiki/sources/2026-05-07-temperature|Temperature]].
