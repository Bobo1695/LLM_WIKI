---
title: Prompt Caching in Action
type: source
source_path: raw/incoming/Prompt caching in action.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-caching, implementazione, api, tool-schema]
---

## TL;DR
- Guida pratica all'implementazione del prompt caching per tool schema e system prompt.
- La prima chiamata produce `cache_creation_input_tokens`; le successive producono `cache_read_input_tokens`.
- Anche un solo carattere modificato invalida la cache per quel componente.
- Il caching parziale è possibile: se cambio solo il system prompt, i tools rimangono cachati.

## Punti chiave

**Scenari ottimali per il caching**
- System prompt lunghi (es. un assistente di coding da 6K token)
- Tool schema complessi (es. ~1.7K token per tool multipli)
- Contenuto di messaggi ripetuto frequentemente

**Caching dei tool schema**
- Aggiungere `cache_control` all'ultimo tool della lista (il breakpoint si applica a tutti i tool precedenti)
- Best practice: creare una copia della lista prima di modificarla, per evitare side effect se l'ordine dei tool cambia
```js
tools_clone = tools.copy()
last_tool = tools_clone[-1].copy()
last_tool["cache_control"] = {"type": "ephemeral"}
tools_clone[-1] = last_tool
params["tools"] = tools_clone
```

**Caching del system prompt**
- Convertire la stringa del system prompt in un blocco strutturato con `cache_control`
```js
params["system"] = [
    {
        "type": "text",
        "text": system,
        "cache_control": {"type": "ephemeral"}
    }
]
```

**Metriche di utilizzo della cache**
- Prima richiesta: `cache_creation_input_tokens=1772` — Claude scrive in cache
- Richieste successive: `cache_read_input_tokens=1772` — Claude legge dalla cache
- Contenuto modificato: nuovi token di cache creation compaiono nella risposta

**Sensibilità della cache**
- Cambiare anche un solo carattere nei tools o nel system prompt invalida l'intera cache per quel componente
- La cache è granulare: se cambio il system prompt ma i tools restano identici, ottengo una lettura parziale della cache (per i tools) e una nuova scrittura (per il system prompt)

**Ordine dei breakpoint**
1. Tools (se presenti)
2. System prompt (se presente)
3. Messages

**Considerazioni pratiche**
- Più efficace con tool schema consistenti tra richieste
- Richiede system prompt stabili
- Ideale per applicazioni che fanno più richieste con contesto simile
- La cache dura solo 1 ora: progettato per frequenza API elevata, non per storage a lungo termine

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/prompt-caching|Prompt Caching]], [[wiki/concepts/system-prompt|System Prompt]], [[wiki/concepts/tool-schema|Tool Schema]]

## Citazioni notevoli
> "The cache is extremely sensitive - changing even a single character in your tools or system prompt invalidates the entire cache for that component."

> "If you change your system prompt but keep the same tools, you'll see a partial cache read (for tools) and a cache write (for the new system prompt). This granular caching means you only pay for processing the parts that actually changed."

## Connessioni
- Implementazione pratica delle regole teoriche di [[wiki/sources/2026-05-08-rules-of-prompt-caching|Rules of Prompt Caching]].
- Complementa l'introduzione concettuale di [[wiki/sources/2026-05-08-prompt-caching|Prompt Caching]].
- L'uso di tool schema si collega a [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]] e al concetto [[wiki/concepts/tool-schema|Tool Schema]].
- Il notebook allegato `003_caching.ipynb` fornisce codice eseguibile come riferimento pratico.
