---
title: Providing Examples
type: source
source_path: raw/incoming/Providing examples.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-engineering, few-shot, one-shot, multi-shot, esempi]
---

## TL;DR
- Fornire esempi (one-shot o multi-shot) è una delle tecniche di prompt engineering più efficaci: mostra a Claude cosa si vuole invece di descriverlo.
- Gli esempi sono ideali per gestire corner case, definire formati di output complessi, catturare tono o stile precisi.
- Vanno sempre strutturati con tag XML (`<sample_input>`, `<ideal_output>`) per massima chiarezza.
- Aggiungere una spiegazione del perché l'output è buono aiuta Claude a capire il ragionamento, non solo il formato.

## Punti chiave

- **Definizione**: one-shot = un singolo esempio input/output; multi-shot = più esempi per coprire scenari diversi.
- **Quando usare esempi**:
  - Corner case difficili da descrivere a parole (es. sarcasmo nell'analisi del sentiment).
  - Formati di output complessi o specifici (es. strutture JSON particolari).
  - Stile o tono preciso.
  - Input ambigui.
- **Esempio classico — sentiment analysis e sarcasmo**: senza esempio, Claude classifica "Oh yeah, I really needed a flight delay tonight! Excellent!" come positivo. Con un esempio che mostra il sarcasmo → Negative, Claude comprende il pattern.
- **Struttura con XML tags**:
  - `<sample_input>` per l'input di esempio.
  - `<ideal_output>` per l'output ideale corrispondente.
  - Questa struttura rende chiarissimo a Claude cosa rappresenta ogni parte.
- **Aggiungere contesto**: non basta fornire la coppia input/output. Spiegare perché quell'output è considerato ideale aiuta Claude a capire il ragionamento sottostante, non solo imitare il formato.
- **Trovare buoni esempi dalle eval**: usare i risultati con score più alto nelle evaluation pipeline come esempi nel prompt — mostrano a Claude cosa significa "perfetto" per il caso d'uso specifico.
- **One-shot vs multi-shot**: multi-shot quando si devono coprire più varianti o edge case; one-shot per stabilire il pattern di base.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/few-shot-prompting|Few-Shot Prompting (One-Shot / Multi-Shot)]]
- [[wiki/concepts/xml-tags-prompting|XML Tags nei Prompt]]
- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]

## Citazioni notevoli

> "Examples are especially powerful because they show rather than tell. Instead of trying to describe exactly what you want in words, you demonstrate it directly."

> "Find responses that scored 10 (or your highest available score) and use those input/output pairs as examples in your prompt."

> "Don't just provide the input/output pair - explain why the output is good."

## Connessioni

- Ultima tecnica nel ciclo di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]], che tipicamente porta agli score più alti.
- Si integra con [[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]]: i tag XML sono lo strumento preferito per strutturare gli esempi.
- Il suggerimento di usare gli output migliori delle eval come esempi crea un circolo virtuoso con [[wiki/sources/2026-05-08-eval-workflow|A Typical Eval Workflow]].
