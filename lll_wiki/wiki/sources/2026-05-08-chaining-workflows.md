---
title: Chaining Workflows
type: source
source_path: raw/incoming/Chaining workflows.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, agents, workflows, chaining, pattern, sequential]
---

## TL;DR
- Il chaining suddivide un task complesso in sotto-task sequenziali, dove l'output di ogni step alimenta il successivo.
- È particolarmente utile quando Claude, con un unico prompt lungo, tende a ignorare alcuni vincoli.
- Permette di inserire elaborazioni non-LLM tra gli step e mantiene Claude focalizzato su un solo compito alla volta.
- Due step (genera + revisiona) producono spesso risultati migliori di un unico prompt con molti requisiti.

## Punti chiave

### Cos'è il workflow chaining
- Un chaining workflow scompone un task grande e complesso in sotto-task sequenziali più piccoli.
- Ogni step è focalizzato su un compito specifico; il risultato di uno step diventa l'input del successivo.
- Tra uno step e l'altro si possono inserire elaborazioni non-LLM (validazioni, trasformazioni, chiamate API).

### Esempio: social media marketing tool
Creazione e pubblicazione automatica di video:
1. Trova topic di tendenza su Twitter.
2. Seleziona il topic più interessante (Claude).
3. Ricerca il topic (Claude).
4. Scrive lo script per un video in formato breve (Claude).
5. Genera video con avatar AI e text-to-speech.
6. Pubblica il video sui social.

### Il problema del prompt lungo
Con un unico prompt che specifica molti vincoli (non menzionare AI, evitare emoji, niente linguaggio informale, tono tecnico), Claude tende a violare alcuni requisiti anche quando sono esplicitamente elencati.

### La soluzione in due step
- **Step 1**: invia il prompt iniziale e accetta che il primo risultato potrebbe essere imperfetto.
- **Step 2**: invia una richiesta di revisione focalizzata esclusivamente sulla correzione dei problemi.

Esempio di istruzione per lo step 2:
> "Revise the article provided below. Follow these steps to rewrite the article: 1. Identify any location where the text identifies the author as an AI and remove them 2. Find and remove all emojis 3. Locate any cringey writing and replace it with text that would be written by a technical writer"

### Vantaggi del chaining
- Suddivide task grandi in sotto-task non parallelizzabili.
- Permette elaborazioni opzionali non-LLM tra ogni step.
- Mantiene Claude focalizzato su un solo aspetto del task complessivo.

### Quando usare il chaining
- Task complessi con molti requisiti.
- Claude ignora sistematicamente alcuni vincoli in prompt lunghi.
- Si vuole validare o elaborare l'output tra uno step e l'altro.
- Si desidera mantenere ogni interazione focalizzata e gestibile.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/workflow-patterns|Workflow Patterns]]
- [[wiki/concepts/agent-systems|Agenti AI]]

## Citazioni notevoli
> "The key benefit is focus - when you give Claude one specific task at a time, it can concentrate on doing that task well rather than juggling multiple requirements simultaneously."

> "While chaining might seem like extra work, it often produces better results than trying to cram everything into a single prompt."

## Connessioni
- Il pattern chaining è uno dei tre pattern fondamentali descritti in [[wiki/concepts/workflow-patterns|Workflow Patterns]].
- Lo step Evaluator-Optimizer descritto in [[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]] è una forma specializzata di chaining (genera → valuta → correggi).
- Si differenzia dalla parallelizzazione ([[wiki/sources/2026-05-08-parallelization-workflows|Parallelization Workflows]]) perché gli step sono sequenziali e dipendenti, non indipendenti e simultanei.
