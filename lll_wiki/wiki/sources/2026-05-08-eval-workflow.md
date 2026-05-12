---
title: A Typical Eval Workflow
type: source
source_path: raw/incoming/A typical eval workflow.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, pipeline, workflow]
---

## TL;DR
- Un workflow tipico di valutazione si articola in 5 step: bozza del prompt, dataset, esecuzione su Claude, grading, iterazione.
- Il grader restituisce punteggi numerici (1-10) che permettono confronti oggettivi tra versioni del prompt.
- Il valore del workflow sta nella ripetibilità: si può modificare il prompt e rieseguire tutto per misurare il miglioramento.
- Il dataset può essere costruito a mano o generato automaticamente con Claude.

## Punti chiave

- **Step 1 – Draft prompt**: si parte da un prompt di base che fa da baseline di riferimento.
- **Step 2 – Eval dataset**: raccolta di input rappresentativi (da poche unità a migliaia), interpolati nel template del prompt. Possono essere generati manualmente o con Claude.
- **Step 3 – Feed through Claude**: ogni elemento del dataset viene unito al prompt e inviato a Claude; si raccolgono tutte le risposte.
- **Step 4 – Feed through a grader**: il grader esamina domanda + risposta e assegna un punteggio (es. 1-10). Il punteggio medio fornisce una metrica complessiva obiettiva.
- **Step 5 – Change prompt and repeat**: si modifica il prompt e si riesegue l'intera pipeline; un punteggio più alto indica un miglioramento reale.
- **Esempio concreto**: baseline score 7.66 → dopo aggiunta di "Answer with ample detail" → score 8.7.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/eval-workflow|Eval Workflow]]
- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]

## Citazioni notevoli

> "This systematic approach removes guesswork from prompt engineering and gives you confidence that your changes are actually improvements rather than just different variations."

> "In real-world evaluations, you might have tens, hundreds, or even thousands of records. You can assemble these datasets by hand or use Claude to generate them for you."

## Connessioni

- Descrive il workflow generale che viene reso concreto da [[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]] (come si crea il dataset) e [[wiki/sources/2026-05-08-running-the-eval|Running the Eval]] (come si eseguono le funzioni).
- I tipi di grader (code vs model) sono approfonditi in [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]] e [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]].
- Il ciclo di iterazione si applica direttamente alle tecniche di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]].
