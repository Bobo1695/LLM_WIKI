---
title: Being Specific
type: source
source_path: raw/incoming/Being specific.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-engineering, specificità, output-guidelines, process-steps]
---

## TL;DR
- La specificità è una delle tecniche più efficaci: fornire linee guida chiare o step di processo riduce l'ambiguità e migliora drasticamente la qualità.
- Esistono due approcci: Output Quality Guidelines (caratteristiche dell'output) e Process Steps (passi che Claude deve seguire).
- Le guidelines si usano quasi sempre; i process steps si usano per problemi complessi che richiedono ragionamento sistematico.
- Nel test del piano alimentare, aggiungere linee guida ha portato lo score da 3.92 a 7.86 (quasi raddoppiato).

## Punti chiave

- **Perché la specificità conta**: senza vincoli, Claude può produrre output con lunghezze e formati molto diversi; le linee guida danno un target preciso.
- **Output Quality Guidelines**: lista di qualità che l'output deve avere.
  - Lunghezza della risposta.
  - Struttura e formato.
  - Attributi o elementi specifici da includere.
  - Tono o stile.
  - Esempio: calorie giornaliere, breakdown macronutrienti, porzioni in grammi, timing dei pasti.
- **Process Steps**: sequenza di passi che Claude deve seguire prima di rispondere.
  - Utili per problemi complessi, decisioni, critical thinking, analisi multi-angolo.
  - Esempio: brainstorm 3 talenti → scegli il più interessante → abbozza la scena → brainstorm personaggi di supporto.
- **Regola pratica**:
  - Output guidelines: usarle quasi sempre.
  - Process steps: aggiungerle per task complessi (troubleshooting, decision-making, analisi multidimensionale).
- **Combinazione dei due approcci**: nelle applicazioni professionali si usano spesso entrambi insieme.
- **Impatto**: aggiungere guidelines al prompt del piano alimentare ha portato lo score da 3.92 a 7.86.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]

## Citazioni notevoli

> "By adding specific guidelines, you give Claude a clearer target to aim for. This dramatically improves both the consistency and quality of the output."

> "You should include quality guidelines in almost every prompt you write. They're your safety net for getting consistent, useful results."

> "Add step-by-step instructions when you're dealing with: Troubleshooting complex problems, Decision-making scenarios, Critical thinking tasks, Any situation where you want Claude to consider multiple angles."

## Connessioni

- Seconda tecnica nel ciclo di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]], che porta lo score da 3.92 (dopo [[wiki/sources/2026-05-08-being-clear-and-direct|Being Clear and Direct]]) a 7.86.
- I Process Steps si collegano concettualmente all'idea di strutturare i prompt con sezioni separate, tema sviluppato in [[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]].
- Le Output Guidelines definiscono esplicitamente i criteri che il model grader in [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]] andrà a valutare.
