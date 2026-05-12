---
title: Prompt Engineering
type: source
source_path: raw/incoming/Prompt engineering.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-engineering, iterazione, valutazione]
---

## TL;DR
- Il prompt engineering è un processo iterativo: goal → prompt iniziale → valutazione → applicazione di tecniche → ri-valutazione.
- Si parte sempre da un prompt semplice ("naive") per stabilire una baseline misurabile, poi si migliora.
- La classe `PromptEvaluator` automatizza la generazione del dataset e la valutazione con model grading.
- Un punteggio iniziale di 2.3/10 è normale; l'obiettivo è il miglioramento progressivo, non la perfezione immediata.

## Punti chiave

- **Ciclo iterativo in 5 step**:
  1. Definire l'obiettivo del prompt.
  2. Scrivere un prompt iniziale di base.
  3. Valutare il prompt con la pipeline di eval.
  4. Applicare tecniche di prompt engineering.
  5. Ri-valutare per verificare che le modifiche migliorino effettivamente i risultati.
- **Esempio pratico**: piano alimentare per atleti — input: altezza, peso, obiettivo, restrizioni dietetiche; output: piano alimentare completo per un giorno.
- **`PromptEvaluator` class**: gestisce generazione dataset e model grading. Parametro `max_concurrent_tasks` controlla la concorrenza (partire da 3 per evitare rate limit).
- **Generazione dataset**: `evaluator.generate_dataset()` accetta `task_description`, `prompt_inputs_spec`, `output_file`, `num_cases`. Tenere basso (2-3) in sviluppo.
- **Criteri extra**: `evaluator.run_evaluation()` accetta `extra_criteria` per specificare requisiti di valutazione specifici del caso d'uso.
- **Report HTML**: l'evaluation produce sia uno score numerico sia un report HTML dettagliato con il ragionamento per ogni test case.
- **Non scoraggiarsi**: score iniziale di 2.3/10 è tipico per un primo tentativo.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]
- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]
- [[wiki/concepts/eval-workflow|Eval Workflow]]

## Citazioni notevoli

> "Prompt engineering is about taking a prompt you've written and improving it to get more reliable, higher-quality outputs."

> "Remember that prompt engineering is an iterative process. The key is to make one change at a time, evaluate the impact, and build on what works."

> "Don't be discouraged by low initial scores - a score of 2.3 out of 10 is typical for a first attempt."

## Connessioni

- Descrive il meta-processo che raccoglie tutte le tecniche specifiche introdotte in [[wiki/sources/2026-05-08-being-clear-and-direct|Being Clear and Direct]], [[wiki/sources/2026-05-08-being-specific|Being Specific]], [[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]] e [[wiki/sources/2026-05-08-providing-examples|Providing Examples]].
- Si appoggia all'infrastruttura di valutazione descritta in [[wiki/sources/2026-05-08-prompt-evaluation|Prompt Evaluation]] e [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]].
