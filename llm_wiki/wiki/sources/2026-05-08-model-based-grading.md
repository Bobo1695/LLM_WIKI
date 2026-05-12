---
title: Model Based Grading
type: source
source_path: raw/incoming/Model based grading.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, grading, model-grader]
---

## TL;DR
- Un grader è un componente che esamina l'output del modello e restituisce un segnale misurabile (tipicamente un numero 1-10).
- Esistono tre tipi di grader: code grader (logica programmatica), model grader (un secondo LLM), human grader (revisione manuale).
- Il model grader è ideale per criteri soggettivi come qualità della risposta, completezza, instruction-following.
- Il model grader usa prefilling + stop sequences per restituire un JSON strutturato con score, strengths, weaknesses, reasoning.

## Punti chiave

- **Tre tipi di grader**:
  - **Code grader**: verifica lunghezza, parole chiave, validità sintattica (JSON/Python/regex), readability score.
  - **Model grader**: invia output + task a un secondo LLM per valutazione flessibile; ottimo per qualità, safety, helpfulness, instruction-following.
  - **Human grader**: il più flessibile ma lento; utile per qualità generale, profondità, rilevanza, conciseness.
- **Criteri di valutazione** (esempio per code generation):
  - Formato: solo Python/JSON/Regex, senza spiegazioni.
  - Sintassi valida.
  - Task following: il codice risolve correttamente il task richiesto.
- **Separazione dei criteri**: i primi due (formato + sintassi) si prestano bene a code grader; il terzo (task following) richiede model grader per la sua flessibilità.
- **Implementazione del model grader**: la funzione `grade_by_model` costruisce un prompt di valutazione, usa prefilling con ` ```json ` + stop sequence ` ``` ` per ottenere il JSON di ritorno, poi lo parsa con `json.loads()`.
- **Output strutturato del model grader**: oggetto JSON con `strengths` (array), `weaknesses` (array), `reasoning` (stringa), `score` (numero 1-10).

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]
- [[wiki/concepts/eval-workflow|Eval Workflow]]
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]]

## Citazioni notevoli

> "A grader takes model output and returns some kind of measurable feedback - typically a number between 1 and 10, where 10 represents high quality and 1 represents poor quality."

> "Model graders feed your original output into another API call for evaluation. This approach offers tremendous flexibility for assessing: response quality, quality of instruction following, completeness, helpfulness, safety."

## Connessioni

- Approfondisce lo Step 4 (grading) del workflow descritto in [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]].
- Si affianca a [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]]: i due approcci si combinano per una valutazione completa (media dei due score).
- La tecnica prefill + stop sequence per il JSON di risposta è la stessa descritta in [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]].
- Il model grader viene integrato nella funzione `run_test_case` descritta in [[wiki/sources/2026-05-08-running-the-eval|Running the Eval]].
