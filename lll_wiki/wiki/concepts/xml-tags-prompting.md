---
title: XML Tags nei Prompt
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [prompt-engineering, struttura]
sources: [2026-05-08-structure-with-xml-tags]
---

I **tag XML nei prompt** sono delimitatori personalizzati che aggiungono struttura esplicita a un prompt, separando chiaramente istruzioni, dati, esempi e altri blocchi di contenuto. [[wiki/entities/claude|Claude]] è addestrato a riconoscere e rispettare questi confini ([[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]]).

## Il problema che risolvono

Quando un prompt include grandi blocchi di testo — dati tabulari, documentazione, codice, record storici — Claude può fare fatica a distinguere cosa sono le istruzioni e cosa sono i dati da elaborare. Questa confusione produce output imprecisi o che ignorano parti del contesto.

Esempio: chiedere a Claude di fare il debug di codice fornendo sia il codice sia la documentazione, tutto in plain text, rende difficile capire dove finisce l'uno e dove inizia l'altra.

## Come si usano

Si wrappa il contenuto da delimitare con tag di apertura e chiusura dal nome descrittivo:

```
<athlete_information>
- Height: 6'2"
- Weight: 180 lbs
- Goal: Build muscle
- Dietary restrictions: Vegetarian
</athlete_information>

Generate a meal plan based on the athlete information above.
```

I tag non devono rispettare nessuno schema XML ufficiale. La regola è: **nome descrittivo > nome generico**.

- `<sales_records>` meglio di `<data>`
- `<my_code>` e `<docs>` meglio di `<section_1>` e `<section_2>`
- `<athlete_information>` meglio di `<info>`

## Quando usarli

I tag XML sono particolarmente utili quando:
- Il prompt include grandi quantità di contesto o dati.
- Si mescolano tipi di contenuto diversi (codice, documentazione, dati strutturati).
- Si interpolano più variabili in un template.
- Si vogliono strutturare esempi few-shot (vedi [[wiki/concepts/few-shot-prompting|Few-Shot Prompting]]).

Anche per prompt più brevi, i tag migliorano la chiarezza e riducono il rischio di ambiguità.

## Scalabilità

Il beneficio dei tag XML cresce con la complessità del prompt. Per prompt semplici l'impatto è limitato; per prompt che elaborano decine di pagine di dati, i tag diventano indispensabili.

## Connessioni

- Sono parte delle [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]] e si usano spesso in combinazione con le altre tecniche (specificità, esempi).
- Nel [[wiki/concepts/few-shot-prompting|Few-Shot Prompting]] si usano tag come `<sample_input>` e `<ideal_output>` per strutturare gli esempi.
- Concetto affine: [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]], che usa ` ```json ` come delimitatore di inizio blocco codice.
