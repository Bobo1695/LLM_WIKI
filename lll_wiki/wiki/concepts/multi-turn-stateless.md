---
title: Multi-Turn Stateless
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [architettura, conversazione, anthropic, stato]
sources: [2026-05-07-multi-turn-conversations]
---

[[wiki/entities/claude|Claude]] **non mantiene alcuna memoria di sessione**. Ogni chiamata all'[[wiki/concepts/anthropic-messages-api|API]] è completamente indipendente dalle precedenti. Per conversazioni multi-turno, è il client a dover mantenere e inviare l'intera storia.

## Il problema
```
User: "What is quantum computing?"
Claude: [risponde]
User: "Write another sentence"  ← Claude non ha idea di cosa espandere
```
Senza storia, Claude scrive una frase su qualcosa di casuale.

## La soluzione: mantenere la lista `messages`

```python
def add_user_message(messages, text):
    messages.append({"role": "user", "content": text})

def add_assistant_message(messages, text):
    messages.append({"role": "assistant", "content": text})

def chat(messages):
    return client.messages.create(
        model=model, max_tokens=1000, messages=messages
    ).content[0].text

# Flusso corretto
messages = []
add_user_message(messages, "Define quantum computing in one sentence")
answer = chat(messages)
add_assistant_message(messages, answer)       # ← fondamentale
add_user_message(messages, "Write another sentence")
final = chat(messages)                        # ora funziona
```

## Implicazioni architetturali
- Il server deve persistere la lista `messages` per ogni sessione utente (DB, session store, ecc.).
- Ogni request cresce in token all'aumentare dei turn → tenere d'occhio i costi e il context window.

## Connessioni
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — struttura `messages`.
- [[wiki/concepts/system-prompt|System Prompt]] — separato da `messages`, non va incluso nella lista.
