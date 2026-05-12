---
title: Assistant Prefilling + Stop Sequences
type: concept
created: 2026-05-07
updated: 2026-05-08
tags: [prompt-engineering, output-control, structured-data, anthropic]
sources: [2026-05-07-structured-data, 2026-05-08-generating-test-datasets]
---

Tecnica per ottenere output strutturato pulito (JSON, codice, CSV…) da [[wiki/entities/claude|Claude]] senza testo explicativo attorno.

## Il problema
Claude tende ad aggiungere introduzioni e spiegazioni attorno al contenuto richiesto:
```
```json
{ "source": ["aws.ec2"] ... }
```
This rule captures EC2 instance state changes...
```
Per applicazioni che consumano direttamente il JSON, questo è rumore.

## La soluzione: prefill + stop sequence

```python
messages = []
add_user_message(messages, "Generate a short EventBridge rule as JSON")
add_assistant_message(messages, "```json")     # prefill: Claude crede di aver già iniziato

text = chat(messages, stop_sequences=["```"])  # si ferma prima di chiudere il blocco
clean = json.loads(text.strip())               # JSON puro, nient'altro
```

**Come funziona:**
1. Il messaggio `assistant` con ` ```json ` fa credere a Claude di aver già iniziato un blocco codice.
2. Claude continua scrivendo solo il contenuto (JSON).
3. Quando Claude tenta di chiudere con ` ``` `, la stop sequence interrompe la generazione.

## Generalizzazione
Applicabile a qualsiasi formato strutturato:
- Codice Python → prefill ` ```python ` + stop ` ``` `
- Liste puntate → prefill `- ` e stop opportuno
- CSV → prefill con header
- YAML → prefill `---`

> "The key is identifying what Claude naturally wants to wrap your content in, then using that as your prefill and stop sequence." ([[wiki/sources/2026-05-07-structured-data|fonte]])

## Uso nei test dataset

La tecnica di prefilling è impiegata anche nella **generazione di dataset di test** per le pipeline di valutazione dei prompt. Quando si usa Claude per generare automaticamente casi di test (es. array di oggetti JSON con descrizioni di task AWS), si applica lo stesso pattern: `add_assistant_message(messages, "```json")` + stop sequence ` ``` ` garantisce che l'output sia JSON puro e immediatamente parsabile con `json.loads()`, senza testo introduttivo o conclusivo ([[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]]). Lo stesso approccio è usato nel model grader per estrarre il JSON di valutazione strutturato ([[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]]).

## Connessioni
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — parametro `stop_sequences`.
- [[wiki/concepts/system-prompt|System Prompt]] — alternativa/complemento per forzare formato output.
- [[wiki/concepts/stop-sequence|Stop Sequence]] — meccanismo sottostante.
- [[wiki/concepts/eval-workflow|Eval Workflow]] — la tecnica è parte integrante della pipeline di generazione dataset e grading.
