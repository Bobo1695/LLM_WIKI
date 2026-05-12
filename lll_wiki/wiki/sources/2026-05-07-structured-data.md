---
title: Structured Data
type: source
source_path: raw/Structured data.md
author: Anthropic Academy
date: 2026-05-07
created: 2026-05-07
updated: 2026-05-07
tags: [anthropic-academy, structured-output, json, prompt-engineering]
---

## TL;DR
- Claude tende ad aggiungere testo esplicativo attorno al JSON/codice richiesto.
- Soluzione: **assistant prefilling** (fai credere a Claude di aver già iniziato il blocco) + **stop sequence** (interrompi quando chiude il blocco).
- Risultato: output pulito, pronto all'uso senza parsing.

## Punti chiave

### Il problema

```
```json
{ "source": ["aws.ec2"] }
```
This rule captures EC2 instance state changes...   ← indesiderato
```

### La soluzione

```python
messages = []
add_user_message(messages, "Generate a short EventBridge rule as JSON")
add_assistant_message(messages, "```json")             # prefill
text = chat(messages, stop_sequences=["```"])          # stop sequence
clean = json.loads(text.strip())                       # JSON puro
```

### Generalizzazione
Funziona per qualsiasi formato strutturato (Python, CSV, YAML, liste). Identifica il "wrapper" che Claude userebbe → usalo come prefill e stop sequence.

## Entità menzionate
- [[wiki/entities/claude|Claude]]
- [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]]
- [[wiki/concepts/stop-sequence|Stop Sequence]]
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]

## Connessioni
Tecnica avanzata che si appoggia al pattern chat progressivamente costruito nelle lezioni precedenti. Particolarmente utile combinata con [[wiki/concepts/system-prompt|system prompt]] che specifica il formato atteso.
