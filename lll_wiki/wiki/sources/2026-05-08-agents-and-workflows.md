---
title: Agents and Workflows
type: source
source_path: raw/incoming/Agents and workflows.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, agents, workflows, evaluator-optimizer, cad]
---

## TL;DR
- Workflow e agenti sono due strategie per gestire task che Claude non può completare in una singola richiesta.
- Si usano i workflow quando il flusso di step è noto in anticipo; si usano gli agenti quando i task o i parametri sono incerti.
- Il pattern Evaluator-Optimizer (produttore + valutatore + ciclo di feedback) è un esempio concreto di workflow ricorrente.
- Imparare i pattern permette di avere "ricette" riutilizzabili per implementare funzionalità nelle proprie applicazioni.

## Punti chiave

### Quando usare workflow vs agenti
- **Workflow**: si conosce esattamente il flusso di step; l'UX dell'app vincola gli utenti a un insieme definito di task.
- **Agenti**: non si sa con certezza quale task o quali parametri verranno forniti a Claude; il sistema deve essere adattivo.

### Definizioni
- **Workflow**: serie di chiamate a Claude progettate per risolvere un problema specifico attraverso una sequenza predeterminata di step.
- **Agente**: si fornisce a Claude un obiettivo e un insieme di tool, aspettandosi che Claude capisca autonomamente come raggiungere l'obiettivo.

### Esempio pratico: workflow Image-to-CAD
Un'app dove l'utente carica l'immagine di un pezzo metallico e il sistema genera un file STEP (standard per modelli 3D):
1. Claude descrive l'oggetto nell'immagine.
2. Claude usa la libreria CadQuery per modellare l'oggetto.
3. Si crea un rendering.
4. Claude valuta il rendering rispetto all'immagine originale e, se necessario, corregge.

### Pattern Evaluator-Optimizer
- **Producer**: riceve l'input e crea l'output (es. Claude che modella il pezzo con CadQuery).
- **Grader**: valuta l'output rispetto a criteri definiti.
- **Feedback loop**: se il grader non accetta l'output, il feedback ritorna al producer per miglioramenti.
- **Iterazione**: il ciclo si ripete fino all'accettazione dell'output.

### Perché studiare i pattern di workflow
I pattern come l'Evaluator-Optimizer sono ricette ripetibili che hanno funzionato per altri ingegneri. Identificarli non produce automaticamente valore — bisogna comunque scrivere il codice — ma accelerano la progettazione di nuove funzionalità.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/workflow-patterns|Workflow Patterns]]
- [[wiki/concepts/agent-systems|Agenti AI]]

## Citazioni notevoli
> "Workflows are a series of calls to Claude meant to solve a specific problem through a predetermined series of steps. Agents give Claude a goal and a set of tools, expecting Claude to figure out how to complete the goal through the provided tools."

> "The goal of identifying different workflows is to give you a set of repeatable recipes for implementing your own features."

## Connessioni
- Si collega direttamente a [[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]], che approfondisce vantaggi e svantaggi di ciascun approccio.
- Il pattern Evaluator-Optimizer descritto qui è un caso specifico di [[wiki/concepts/workflow-patterns|Chaining Workflow]].
- L'esempio Image-to-CAD introduce implicitamente la necessità di [[wiki/sources/2026-05-08-environment-inspection|Environment Inspection]] (verifica del rendering).
