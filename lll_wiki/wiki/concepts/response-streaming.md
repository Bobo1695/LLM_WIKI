---
title: Response Streaming
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [ux, api, performance, anthropic]
sources: [2026-05-07-response-streaming]
---

Modalità in cui [[wiki/entities/claude|Claude]] invia la risposta **token per token** invece di attendere la generazione completa. Riduce drasticamente la latenza percepita dall'utente (risposte da 10–30s diventano immediate nella prima parola).

## Tipi di eventi stream

| Evento | Significato |
|---|---|
| `MessageStart` | inizio nuovo messaggio |
| `ContentBlockStart` | inizio blocco (testo, tool use…) |
| `ContentBlockDelta` | chunk di testo generato ← quello che visualizzi |
| `ContentBlockStop` | fine blocco |
| `MessageDelta` | messaggio completato |
| `MessageStop` | fine stream |

## Implementazione semplificata (consigliata)

```python
with client.messages.stream(
    model=model, max_tokens=1000, messages=messages
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)   # invia al client chunk per chunk

    final_message = stream.get_final_message()  # per storage/logging
```

`stream.text_stream` filtra automaticamente solo i `ContentBlockDelta`, evitando il parsing manuale degli eventi.

## Implementazione raw (con `stream=True`)

```python
stream = client.messages.create(model=model, max_tokens=1000,
                                messages=messages, stream=True)
for event in stream:
    print(event)   # vedi tutti i tipi di evento
```

## Best practice
- Usa `get_final_message()` dopo lo stream per avere il messaggio completo da salvare in DB.
- Passa i chunk al client via SSE (Server-Sent Events) o WebSocket.

## Connessioni
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — parametro `stream=True`.
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — il messaggio finale va aggiunto alla history.
