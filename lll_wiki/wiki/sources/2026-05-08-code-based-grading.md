---
title: Code Based Grading
type: source
source_path: raw/incoming/Code based grading.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, grading, code-grader, validazione-sintattica]
---

## TL;DR
- Il code grader valida formato e sintassi dell'output generato da Claude tramite logica programmatica pura.
- Tre funzioni di validazione sintattica: `validate_json`, `validate_python`, `validate_regex` — restituiscono 10 (valido) o 0 (invalido).
- Il dataset deve includere un campo `format` per sapere quale validatore applicare.
- Il punteggio finale si ottiene come media tra code score e model score.

## Punti chiave

- **Due criteri per il code grader**:
  - **Formato**: la risposta contiene solo il tipo di codice richiesto (Python/JSON/Regex), senza spiegazioni.
  - **Sintassi valida**: il codice prodotto è effettivamente parsabile nel linguaggio target.
  - (Il terzo criterio, task following, è delegato al model grader.)
- **Funzioni di validazione**:
  - `validate_json(text)`: usa `json.loads()` — ritorna 10 o 0.
  - `validate_python(text)`: usa `ast.parse()` — ritorna 10 o 0.
  - `validate_regex(text)`: usa `re.compile()` — ritorna 10 o 0.
- **Campo `format` nel dataset**: ogni test case deve specificare il formato atteso (es. `"format": "python"`) affinché il grader sappia quale funzione chiamare.
- **Miglioramento del prompt**: aggiungere istruzioni esplicite come "Respond only with Python, JSON, or a plain Regex. Do not add any comments or commentary." migliora la pulizia dell'output.
- **Prefilling con ` ```code `**: si può aggiungere un messaggio assistant iniziale con ` ```code ` per guidare Claude a produrre direttamente contenuto codice.
- **Combinazione degli score**: `score = (model_score + syntax_score) / 2`. I pesi possono essere aggiustati in base alle priorità del caso d'uso.
- **Valore della baseline**: il punteggio di partenza non è intrinsecamente buono o cattivo; ciò che conta è la capacità di migliorarlo iterando il prompt.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]
- [[wiki/concepts/eval-workflow|Eval Workflow]]
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]]

## Citazioni notevoli

> "The score itself isn't inherently good or bad - what matters is whether you can improve it by refining your prompts."

> "This gives equal weight to both content quality and technical correctness. You might adjust these weights based on what matters more for your specific use case."

## Connessioni

- Complementa [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]]: i due grader si combinano per coprire aspetti diversi della qualità dell'output.
- Il campo `format` nel dataset rimanda al design del dataset discusso in [[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]].
- La tecnica prefilling con ` ```code ` è un'applicazione diretta di [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]].
- Il risultato combinato viene inserito nella struttura di `run_test_case` descritta in [[wiki/sources/2026-05-08-running-the-eval|Running the Eval]].
