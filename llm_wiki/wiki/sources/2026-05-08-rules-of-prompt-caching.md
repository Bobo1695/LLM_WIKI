---
title: Rules of Prompt Caching
type: source
source_path: raw/incoming/Rules of prompt caching.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-caching, cache-breakpoint, api, regole]
---

## TL;DR
- Il caching non è automatico: bisogna aggiungere manualmente breakpoint con `cache_control: {"type": "ephemeral"}`.
- La cache valida solo se il contenuto fino al breakpoint è identico nelle richieste successive.
- Minimo 1024 token totali per attivare la cache; TTL di un'ora.
- Si possono usare fino a 4 breakpoint per richiesta; si applica a testo, system prompt, tool schema, immagini e blocchi tool use/result.

## Punti chiave

**Cache breakpoint: come si attivano**
- Il caching non è abilitato di default: occorre inserire manualmente un cache breakpoint
- Si usa il formato esteso (longhand) per i blocchi di testo, aggiungendo il campo `cache_control: {"type": "ephemeral"}`
- Il formato shorthand non permette di aggiungere `cache_control`
- Tutto il lavoro di preprocessing eseguito prima del breakpoint viene salvato in cache

**Regola di invalidazione**
- La cache viene usata nelle richieste successive solo se il contenuto fino al breakpoint è identico
- Anche una piccola modifica (es. aggiungere la parola "please") invalida l'intera cache per quel componente
- La cache è estremamente sensibile: anche 1 carattere di differenza causa un cache miss

**Caching cross-message**
- I breakpoint possono attraversare più messaggi e tipi di messaggio
- Se si inserisce un breakpoint in un messaggio più tardi nella conversazione, tutti i messaggi precedenti (user, assistant, ecc.) vengono inclusi nel contenuto cachato
- Utile per cachare l'intero contesto conversazionale fino a un certo punto

**Dove si possono inserire breakpoint**
- System prompt
- Tool definition (schema degli strumenti)
- Image block
- Tool use e tool result block
- I system prompt e le tool definition sono candidati ottimali perché raramente cambiano tra richieste

**Ordine di elaborazione**
- Claude processa i componenti in quest'ordine: tools → system prompt → messages
- Conoscere l'ordine aiuta a posizionare i breakpoint in modo efficace

**Numero massimo di breakpoint**
- Fino a 4 breakpoint per richiesta
- Es.: uno per i tools, uno a metà della cronologia conversazionale

**Soglia minima**
- Contenuto minimo di 1024 token per essere eligibile alla cache
- La soglia si applica alla somma di tutti i messaggi e blocchi da cachare, non ai singoli blocchi
- Un semplice "Hi there!" non supera la soglia; un prompt lungo o contenuto ripetuto 500+ volte sì

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/prompt-caching|Prompt Caching]], [[wiki/concepts/system-prompt|System Prompt]], [[wiki/concepts/tool-schema|Tool Schema]]

## Citazioni notevoli
> "Work done on messages is not cached automatically - you need to manually add a 'cache breakpoint' to a block."

> "For the cache to be useful in follow-up requests, the content must be identical up to the breakpoint. Even small changes like adding the word 'please' will invalidate the cache and force Claude to reprocess everything."

> "The key to effective prompt caching is identifying which parts of your requests stay consistent across multiple calls and placing breakpoints strategically to maximize reuse while minimizing cache invalidation."

## Connessioni
- Approfondisce le regole operative del concetto introdotto in [[wiki/sources/2026-05-08-prompt-caching|Prompt Caching]].
- L'implementazione pratica di queste regole è mostrata in [[wiki/sources/2026-05-08-prompt-caching-in-action|Prompt Caching in Action]].
- Il concetto di system prompt cachabile si collega a [[wiki/concepts/system-prompt|System Prompt]].
- Il riferimento ai tool schema si collega a [[wiki/concepts/tool-schema|Tool Schema]] e all'uso degli strumenti descritto in [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]].
