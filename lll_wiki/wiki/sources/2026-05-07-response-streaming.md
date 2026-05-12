---
title: Response Streaming
type: source
source_path: raw/Response streaming.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, streaming, ux, performance]
---

## TL;DR
- Senza streaming: l'utente aspetta 10–30s lo spinner prima di vedere qualsiasi output.
- Con streaming: il testo appare token per token, percepito come molto più reattivo.
- API consigliata: `client.messages.stream()` + `stream.text_stream`.

## Punti chiave

### Implementazione semplificata

```python
with client.messages.stream(model=model, max_tokens=1000, messages=messages) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
    final_message = stream.get_final_message()  # per storage
```

### Implementazione raw

```python
stream = client.messages.create(..., stream=True)
for event in stream:
    print(event)   # vedi tutti i tipi: MessageStart, ContentBlockDelta, ecc.
```

### Tipi di eventi
`MessageStart` → `ContentBlockStart` → `ContentBlockDelta` (×N, testo) → `ContentBlockStop` → `MessageDelta` → `MessageStop`.

## Entità menzionate
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/response-streaming|Response Streaming]]
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]]

## Connessioni
UX enhancement ortogonale agli altri parametri; `get_final_message()` restituisce un oggetto compatibile con il pattern [[wiki/sources/2026-05-07-multi-turn-conversations|Multi-Turn conversations]].
