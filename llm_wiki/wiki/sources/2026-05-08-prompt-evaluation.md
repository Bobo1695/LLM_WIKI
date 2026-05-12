---
title: Prompt Evaluation
type: source
source_path: raw/incoming/Prompt evaluation.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-evaluation, testing, affidabilità]
---

## TL;DR
- Il prompt engineering produce tecniche per scrivere prompt migliori; la prompt evaluation misura quanto quei prompt funzionano davvero.
- Esistono tre approcci dopo aver scritto un prompt: testarlo una volta, testarlo poche volte, oppure passarlo per una pipeline di valutazione sistematica.
- Le opzioni 1 e 2 sono trappole comuni: gli utenti reali portano input imprevedibili che fanno fallire prompt apparentemente solidi.
- L'approccio evaluation-first richiede più investimento iniziale ma garantisce affidabilità e permette iterazione guidata da metriche oggettive.

## Punti chiave

- **Prompt engineering vs Prompt evaluation**: il primo fornisce strumenti per scrivere prompt (multishot, XML tags, ecc.); il secondo misura l'efficacia con test automatizzati, confronto tra versioni e revisione degli output per errori.
- **Tre opzioni post-scrittura**:
  1. Test singolo → rischio alto di fallimenti in produzione con input inattesi.
  2. Pochi test + aggiustamenti → meglio, ma ancora insufficiente per la varietà di input reali.
  3. Pipeline di valutazione → score obiettivo, iterazione basata su dati, massima affidabilità.
- **Il problema dell'underestimation**: gli sviluppatori tendono a sottovalutare quanti edge case gli utenti reali producono.
- **Vantaggi dell'approccio sistematico**: identificazione delle debolezze prima della produzione, confronto numerico tra versioni, iterazione con fiducia.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]]
- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]

## Citazioni notevoli

> "Prompt engineering gives you techniques for writing better prompts, while prompt evaluation helps you measure how well those prompts actually work."

> "When you deploy a prompt to production, users will interact with it in ways you never anticipated."

> "Option 3 represents a more systematic approach to prompt development. By running your prompt through an evaluation pipeline, you get objective metrics about its performance across a broader range of test cases."

## Connessioni

- Introduce il concetto di base di [[wiki/concepts/prompt-evaluation|Prompt Evaluation]], approfondito nei dettagli pratici da [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]], [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]] e [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]].
- Il tema del ciclo iterativo si collega direttamente a [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]], che mostra come applicare tecniche concrete per migliorare i punteggi.
