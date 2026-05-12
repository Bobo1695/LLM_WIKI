---
title: Eval Workflow
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [prompt-engineering, testing, pipeline]
sources: [2026-05-08-eval-workflow, 2026-05-08-generating-test-datasets, 2026-05-08-running-the-eval]
---

L'**eval workflow** è la pipeline standard per valutare oggettivamente le prestazioni di un prompt. Si articola in cinque step ripetibili che trasformano il processo di miglioramento del prompt da soggettivo a data-driven ([[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]]).

## I 5 step

**Step 1 — Draft prompt**: si scrive un prompt iniziale che fungerà da baseline. Anche un prompt molto semplice ("Please answer the user's question: {question}") è sufficiente per partire.

**Step 2 — Create eval dataset**: si raccolgono input campione rappresentativi dei casi d'uso reali. Il dataset è un array di oggetti JSON, ciascuno con i campi che il prompt template si aspetta. Può essere costruito a mano o generato automaticamente usando Claude stesso (con un modello veloce come Haiku per contenere i costi). Il dataset viene salvato su file (`dataset.json`) per essere riutilizzato ([[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]]).

**Step 3 — Feed through Claude**: ogni elemento del dataset viene unito al template del prompt e inviato a Claude. Si raccolgono tutte le risposte.

**Step 4 — Feed through a grader**: il grader esamina coppia (input, output) e assegna un punteggio. La media dei punteggi su tutto il dataset costituisce lo score complessivo del prompt ([[wiki/concepts/prompt-evaluation|Prompt Evaluation]]).

**Step 5 — Change prompt and repeat**: si modifica il prompt e si riesegue l'intera pipeline. Un punteggio più alto conferma che la modifica è un miglioramento reale.

## Le tre funzioni core

L'implementazione tipica si basa su tre funzioni con responsabilità distinte ([[wiki/sources/2026-05-08-running-the-eval|Running the Eval]]):

- **`run_prompt(test_case)`**: combina il template con il singolo test case e chiama Claude. Restituisce l'output grezzo.
- **`run_test_case(test_case)`**: chiama `run_prompt`, poi invoca il grader, restituisce un dizionario `{output, test_case, score}`.
- **`run_eval(dataset)`**: itera sull'intero dataset chiamando `run_test_case` per ogni elemento; raccoglie e restituisce tutti i risultati.

Questa separazione rende il codice modulare: è facile sostituire la logica di grading senza toccare il resto della pipeline.

## Scalabilità

Il workflow funziona da pochi test case in sviluppo (2-3, per velocizzare l'iterazione) fino a centinaia o migliaia di casi per la validazione finale. Il numero di casi e il modello usato (Haiku vs modelli più capaci) si bilanciano in base a velocità e costo.

## Connessioni

- La natura e i tipi di grader sono descritti in [[wiki/concepts/prompt-evaluation|Prompt Evaluation]].
- La generazione automatica del dataset usa [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]] per estrarre JSON pulito.
- Le tecniche per migliorare i punteggi tra un'iterazione e l'altra sono in [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]].
