---
title: Few-Shot Prompting (One-Shot / Multi-Shot)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [prompt-engineering, esempi]
sources: [2026-05-08-providing-examples]
---

Il **few-shot prompting** è la tecnica che consiste nel fornire a [[wiki/entities/claude|Claude]] uno o più esempi di coppie input/output all'interno del prompt, per guidarne il comportamento mostrando direttamente cosa si vuole invece di descriverlo a parole ([[wiki/sources/2026-05-08-providing-examples|Providing Examples]]).

## Definizioni

- **One-shot**: si fornisce un singolo esempio. Sufficiente per stabilire il pattern di base o il formato atteso.
- **Multi-shot**: si forniscono più esempi. Necessario quando si devono coprire varianti, edge case o scenari diversi.

La scelta dipende dalla complessità del task: più sono le situazioni ambigue o i corner case da gestire, più esempi servono.

## Perché è efficace

Gli esempi comunicano requisiti che le istruzioni testuali faticano a esprimere con precisione. Casi tipici in cui gli esempi fanno la differenza ([[wiki/sources/2026-05-08-providing-examples|Providing Examples]]):

- **Corner case**: es. sarcasmo nell'analisi del sentiment. Un tweet come "Oh yeah, I really needed a flight delay tonight!" appare positivo in superficie ma è negativo — un esempio che lo etichetta come "Negative" risolve l'ambiguità immediatamente.
- **Formati di output complessi**: strutture JSON specifiche, formati proprietari, output con campi obbligatori in posizioni precise.
- **Tono e stile**: quando serve un registro preciso difficile da descrivere (formale-ma-colloquiale, tecnico-ma-accessibile, ecc.).
- **Input ambigui**: mostrare come trattare casi limite riduce l'incertezza e aumenta la consistenza.

## Struttura consigliata con XML tags

Gli esempi vanno sempre strutturati con [[wiki/concepts/xml-tags-prompting|tag XML]] per rendere cristallino il confine tra input e output atteso:

```
<example>
  <sample_input>Great game tonight!</sample_input>
  <ideal_output>Positive</ideal_output>
</example>

<example>
  <sample_input>Oh yeah, I really needed a flight delay tonight! Excellent!</sample_input>
  <ideal_output>Negative</ideal_output>
  Note: this is sarcasm — treat as negative.
</example>
```

Aggiungere una nota che spiega **perché** quell'output è corretto aiuta Claude a capire il ragionamento, non solo il pattern superficiale.

## Trovare buoni esempi

La fonte migliore per gli esempi sono i risultati delle [[wiki/concepts/eval-workflow|pipeline di valutazione]]: gli output con score più alto rappresentano già cosa significa "perfetto" per quel caso d'uso specifico. Riciclare questi output come esempi nel prompt crea un circolo virtuoso di miglioramento.

## Connessioni

- È una delle [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]] nel ciclo iterativo di miglioramento.
- Si usa in combinazione con [[wiki/concepts/xml-tags-prompting|XML Tags nei Prompt]] per strutturare gli esempi in modo chiaro.
- I migliori esempi provengono dai risultati della [[wiki/concepts/prompt-evaluation|Prompt Evaluation]].
