---
title: Generating Test Datasets
type: source
source_path: raw/incoming/Generating test datasets.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, dataset, test-data, generazione]
---

## TL;DR
- Il dataset di test è un array di oggetti JSON che contiene gli input da passare al prompt in valutazione.
- È possibile generare il dataset automaticamente usando Claude (con un modello più veloce come Haiku per ridurre i costi).
- Il prefilling con ` ```json ` e le stop sequences permettono di estrarre JSON pulito senza testo aggiuntivo.
- Il dataset viene salvato su file (`dataset.json`) per essere riutilizzato nelle esecuzioni successive.

## Punti chiave

- **Obiettivo del dataset**: raccogliere casi di test che coprono i tipi di task che il prompt dovrà gestire in produzione (es. generazione di codice Python, JSON config, regex per AWS).
- **Struttura del dataset**: array di oggetti JSON, ognuno con una property `task` (e opzionalmente `format`) che descrive il task da assegnare a Claude.
- **Generazione automatica con Claude**: si definisce un prompt che chiede a Claude di generare N oggetti JSON con descrizioni di task; Claude produce il JSON, e si usa il prefilling per garantire output pulito.
- **Tecnica prefill + stop sequence**: si aggiunge un messaggio assistant iniziale con ` ```json ` e si imposta ` ``` ` come stop sequence, così il JSON estratto è immediatamente parsabile con `json.loads()`.
- **Scelta del modello**: per generare dati di test si preferisce un modello veloce/economico come Claude Haiku, riservando il modello principale alla valutazione vera e propria.
- **Helper functions chiave**: `add_user_message`, `add_assistant_message`, `chat` per gestire le conversazioni con l'API.
- **Persistenza**: il dataset viene scritto su `dataset.json` con `json.dump` per essere caricato nelle fasi successive dell'eval.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/eval-workflow|Eval Workflow]]
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]]

## Citazioni notevoli

> "Since we're generating test data, this is a perfect opportunity to use a faster model like Haiku instead of the full Claude model."

> "To properly parse the JSON response, we'll use prefilling and stop sequences."

## Connessioni

- Costituisce lo Step 2 del workflow descritto in [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]].
- La tecnica prefill + stop sequence richiama [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]], già introdotta in altri contesti di output strutturato.
- Il dataset generato viene poi consumato da [[wiki/sources/2026-05-08-running-the-eval|Running the Eval]] nelle funzioni `run_eval` e `run_test_case`.
- Il campo `format` del dataset è necessario per il [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]] (selezione del validatore corretto).
