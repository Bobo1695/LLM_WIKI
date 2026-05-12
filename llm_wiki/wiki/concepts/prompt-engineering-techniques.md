---
title: Tecniche di Prompt Engineering
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [prompt-engineering, best-practice]
sources: [2026-05-08-prompt-engineering, 2026-05-08-being-clear-and-direct, 2026-05-08-being-specific, 2026-05-08-structure-with-xml-tags, 2026-05-08-providing-examples]
---

Il **prompt engineering** è il processo iterativo di miglioramento di un prompt per ottenere output più affidabili e di qualità superiore. Non è un'attività una-tantum: si parte da un prompt semplice, lo si valuta, si applica una tecnica, si ri-valuta, si ripete ([[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]]).

## Il ciclo iterativo

1. Definire l'obiettivo del prompt.
2. Scrivere un prompt iniziale (anche molto semplice — serve solo una baseline).
3. Valutare con la [[wiki/concepts/eval-workflow|pipeline di eval]].
4. Applicare una tecnica di miglioramento.
5. Ri-valutare per verificare il miglioramento.
6. Ripetere dal punto 4 fino alla soddisfazione.

La regola chiave è cambiare **una cosa alla volta**, per isolare l'impatto di ogni modifica.

## Tecnica 1: Chiarezza e direttezza

La prima riga del prompt è la più importante. Deve dichiarare esplicitamente il task con un **verbo d'azione** (Write, Create, Generate, Identify) e senza ambiguità ([[wiki/sources/2026-05-08-being-clear-and-direct|Being Clear and Direct]]).

- Vago: "What should this person eat?" → Diretto: "Generate a one-day meal plan for an athlete that meets their dietary restrictions."
- Istruzioni, non domande.
- Impatto misurato: score da 2.32 a 3.92 con questa sola modifica.

## Tecnica 2: Specificità

Fornire linee guida esplicite riduce lo spazio di interpretazione di Claude e migliora drasticamente consistenza e qualità ([[wiki/sources/2026-05-08-being-specific|Being Specific]]).

Due tipi di linee guida:

- **Output Quality Guidelines**: lista di caratteristiche che l'output deve avere (lunghezza, struttura, elementi obbligatori, tono). Da usare quasi sempre.
- **Process Steps**: sequenza di passi che Claude deve seguire prima di rispondere. Da usare per task complessi che richiedono ragionamento sistematico (troubleshooting, decisioni, analisi multi-angolo).

Impatto misurato: score da 3.92 a 7.86 aggiungendo guidelines al prompt del piano alimentare.

## Tecnica 3: Struttura con XML tags

Quando il prompt include grandi quantità di dati o mescola tipi di contenuto diversi, i **tag XML** creano delimitatori espliciti che aiutano Claude a distinguere istruzioni da dati ([[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]]).

- Usare nomi descrittivi: `<athlete_information>` meglio di `<data>`.
- Il beneficio cresce con la complessità del prompt.
- Approfondimento: [[wiki/concepts/xml-tags-prompting|XML Tags nei Prompt]].

## Tecnica 4: Esempi (few-shot prompting)

Fornire coppie input/output di esempio mostra a Claude cosa si vuole invece di descriverlo. Particolarmente efficace per corner case, formati complessi, stili specifici ([[wiki/sources/2026-05-08-providing-examples|Providing Examples]]).

- **One-shot**: un singolo esempio per stabilire il pattern.
- **Multi-shot**: più esempi per coprire varianti e edge case.
- Strutturare gli esempi con tag XML (`<sample_input>`, `<ideal_output>`).
- Aggiungere una spiegazione del perché l'output è buono.
- I migliori output dalle eval sono ottimi candidati come esempi.
- Approfondimento: [[wiki/concepts/few-shot-prompting|Few-Shot Prompting]].

## Connessioni

- La misurazione del miglioramento si basa su [[wiki/concepts/prompt-evaluation|Prompt Evaluation]] e [[wiki/concepts/eval-workflow|Eval Workflow]].
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]] è una tecnica complementare per controllare il formato dell'output.
