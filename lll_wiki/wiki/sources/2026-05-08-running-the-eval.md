---
title: Running the Eval
type: source
source_path: raw/incoming/Running the eval.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, pipeline, codice]
---

## TL;DR
- La pipeline di valutazione si costruisce con tre funzioni: `run_prompt`, `run_test_case`, `run_eval`.
- `run_prompt` si occupa di unire il template del prompt con il singolo test case e ottenere la risposta di Claude.
- `run_test_case` chiama `run_prompt` e poi assegna un punteggio (placeholder inizialmente fisso a 10).
- `run_eval` itera sull'intero dataset raccogliendo tutti i risultati in un array strutturato.

## Punti chiave

- **Tre funzioni principali con responsabilità separate**:
  - `run_prompt(test_case)`: combina prompt template e input del test case, invia a Claude, restituisce l'output grezzo.
  - `run_test_case(test_case)`: chiama `run_prompt`, poi esegue il grading, restituisce `{output, test_case, score}`.
  - `run_eval(dataset)`: itera tutti i test case, raccoglie risultati, restituisce array completo.
- **Struttura del risultato**: ogni elemento dell'array restituito da `run_eval` contiene `output` (risposta di Claude), `test_case` (input originale) e `score` (valutazione).
- **Punteggio placeholder**: nella prima implementazione, `score` è fisso a 10; la logica di grading reale viene aggiunta nelle fasi successive.
- **Primo esecuzione lenta**: anche con Claude Haiku, elaborare un dataset completo può richiedere ~30 secondi.
- **Output verboso**: senza istruzioni di formato, Claude produce risposte elaborate; questo è esattamente il tipo di problema che il ciclo di iterazione successivo andrà a correggere.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/eval-workflow|Eval Workflow]]
- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]

## Citazioni notevoli

> "This pipeline represents the foundation of most AI evaluation systems. While it may seem simple, you've just built the majority of what an eval pipeline actually does."

> "The complexity comes in the details - better prompts, sophisticated grading, and performance optimizations."

## Connessioni

- Implementa lo Step 3 del workflow descritto in [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]], consumando il dataset creato in [[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]].
- Il punteggio placeholder verrà sostituito dalla logica descritta in [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]] e [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]].
- Il problema dell'output verboso senza istruzioni di formato rimanda direttamente alle tecniche di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]].
