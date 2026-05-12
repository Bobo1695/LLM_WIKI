---
title: Being Clear and Direct
type: source
source_path: raw/incoming/Being clear and direct.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-engineering, chiarezza, direttezza]
---

## TL;DR
- La prima riga del prompt è la parte più importante: determina il tono e la direzione di tutto ciò che segue.
- "Chiaro" significa linguaggio semplice, senza ambiguità, con una dichiarazione diretta del task.
- "Diretto" significa usare istruzioni (non domande) e iniziare con un verbo d'azione (Write, Create, Generate).
- Anche solo riformulare la prima riga può migliorare lo score significativamente (es. da 2.32 a 3.92).

## Punti chiave

- **La prima riga conta**: imposta il contesto per tutto il resto del prompt.
- **Chiarezza**:
  - Usare linguaggio semplice, comprensibile.
  - Dichiarare esattamente cosa si vuole senza giri di parole.
  - Evitare descrizioni vaghe o indirette.
  - Esempio: "Write three paragraphs about how solar panels work" invece di descrivere vagamente "quelle cose sui tetti che usano il sole".
- **Direttezza**:
  - Formulare istruzioni, non domande.
  - Iniziare con verbi d'azione come "Write", "Create", "Generate", "Identify".
  - Esempio: "Identify three countries that use geothermal energy. Include generation stats for each." invece di "I was reading about renewable energy... what countries use it?"
- **Applicazione pratica**: "What should this person eat?" → "Generate a one-day meal plan for an athlete that meets their dietary restrictions."
  - La revisione comunica: azione (generate), oggetto (meal plan), vincoli (one day, athlete, dietary restrictions).
- **Impatto misurabile**: questa singola modifica ha portato lo score da 2.32 a 3.92.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]

## Citazioni notevoli

> "The first line of your prompt is the most important part of your entire request."

> "Claude responds best when you treat it like a capable assistant who needs clear direction rather than someone who has to guess what you want."

> "Start strong with a direct action verb, be specific about the task, and you'll see better results right away."

## Connessioni

- Prima tecnica concreta nel ciclo di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]], applicata all'esempio del piano alimentare.
- Il miglioramento da 2.32 a 3.92 è il punto di partenza per le ulteriori tecniche di [[wiki/sources/2026-05-08-being-specific|Being Specific]] (da 3.92 a 7.86).
- La chiarezza nelle istruzioni si applica anche nella costruzione dei prompt di grading in [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]].
