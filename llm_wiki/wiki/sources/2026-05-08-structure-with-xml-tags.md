---
title: Structure with XML Tags
type: source
source_path: raw/incoming/Structure with XML tags.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, prompt-engineering, xml-tags, struttura]
---

## TL;DR
- I tag XML nei prompt creano delimitatori chiari tra istruzioni e dati, evitando che Claude confonda i diversi blocchi di contenuto.
- Sono particolarmente utili con grandi quantità di dati interpolati o con più tipi di contenuto misti (codice, documentazione, dati).
- I nomi dei tag sono liberi: preferire nomi descrittivi (`<athlete_information>`, `<sales_records>`) rispetto a generici (`<data>`).
- Anche per prompt brevi i tag XML migliorano la leggibilità e la precisione dell'elaborazione.

## Punti chiave

- **Il problema senza struttura**: con grandi blocchi di testo, Claude può non distinguere dove finiscono le istruzioni e dove iniziano i dati da elaborare.
- **Soluzione con XML tags**: wrappare i dati in tag come `<sales_records>...</sales_records>` crea confini espliciti.
- **Esempio codice + docs**: senza tag, code e documentation si mescolano; con `<my_code>` e `<docs>` i due blocchi sono chiaramente separati.
- **Custom tag names**: non serve usare tag XML ufficiali. Regola: più il nome è descrittivo, meglio Claude comprende lo scopo di ogni sezione.
  - `<sales_records>` meglio di `<data>`
  - `<athlete_information>` meglio di `<info>`
- **Quando usare XML tags**:
  - Grandi quantità di contesto o dati.
  - Mix di tipi di contenuto diversi (codice, documentazione, dati).
  - Prompt con più variabili interpolate.
  - Qualsiasi caso in cui si vuole essere extra-chiari sui confini.
- **Applicazione al piano alimentare**: wrappare i dati dell'atleta in `<athlete_information>` rende evidente che altezza, peso, obiettivo e restrizioni sono un blocco coeso.
- **Scalabilità**: il beneficio cresce con la complessità del prompt.

## Entità menzionate

Wikilink: [[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti

- [[wiki/concepts/xml-tags-prompting|XML Tags nei Prompt]]
- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]]

## Citazioni notevoli

> "XML tags provide a simple way to add structure and clarity to your prompts, especially when you're interpolating large amounts of data."

> "The more specific and descriptive your tag names, the better Claude can understand the purpose of each section."

> "XML tags become increasingly valuable as your prompts grow more complex and include larger amounts of varied content."

## Connessioni

- Terza tecnica nel ciclo di [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]].
- I tag XML sono utilizzati anche nei prompt di few-shot per strutturare gli esempi (vedi [[wiki/sources/2026-05-08-providing-examples|Providing Examples]]: `<sample_input>`, `<ideal_output>`).
- La stessa logica di delimitazione si applica nel prefilling con ` ```json ` descritto in [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]].
