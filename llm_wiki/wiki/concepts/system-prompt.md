---
title: System Prompt
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [parametro, prompt-engineering, anthropic, comportamento]
sources: [2026-05-07-system-prompts]
---

Istruzione di contesto passata a [[wiki/entities/claude|Claude]] al di fuori della lista `messages`, tramite il parametro `system=` dell'[[wiki/concepts/anthropic-messages-api|API]]. Definisce ruolo, tono, vincoli e stile per l'intera conversazione.

## Funzione
- Fornisce a Claude una "persona" o ruolo specifico.
- Mantiene il comportamento coerente su tutti i turn.
- Tiene Claude "on task" rispetto all'applicazione che lo usa.

## Esempio classico: math tutor

```python
system_prompt = """
You are a patient math tutor.
Do not directly answer a student's questions.
Guide them to a solution step by step.
"""
```
Senza system prompt → Claude risolve l'equazione direttamente.
Con system prompt → Claude fa domande guida, non dà la soluzione.

## Implementazione (pattern flessibile)

```python
def chat(messages, system=None):
    params = {"model": model, "max_tokens": 1000, "messages": messages}
    if system:
        params["system"] = system    # l'API non accetta system=None
    return client.messages.create(**params).content[0].text
```

> Importante: `system=None` non è accettato dall'API — il parametro va omesso, non passato come `None`.

## Connessioni
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — parametro `system`.
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — il system prompt è separato dalla history dei messaggi.
