---
title: Prompt Evaluation
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [prompt-engineering, testing, qualità]
sources: [2026-05-08-prompt-evaluation, 2026-05-08-eval-workflow, 2026-05-08-model-based-grading, 2026-05-08-code-based-grading]
---

La **prompt evaluation** è il processo di misurazione sistematica dell'efficacia di un prompt attraverso test automatizzati. Si affianca al [[wiki/concepts/prompt-engineering-techniques|prompt engineering]]: mentre il secondo fornisce tecniche per scrivere prompt migliori, la valutazione misura quanto quei prompt funzionino davvero ([[wiki/sources/2026-05-08-prompt-evaluation|Prompt Evaluation]]).

## Perché è necessaria

Quando si scrive un prompt per un'applicazione seria, la tentazione è di testarlo poche volte e considerarlo "abbastanza buono". Questo approccio è una trappola frequente: gli utenti reali producono input imprevedibili che fanno fallire anche prompt apparentemente solidi. Senza una pipeline di valutazione, i problemi emergono solo in produzione — troppo tardi.

La valutazione sistematica permette di:
- Identificare debolezze prima del deployment.
- Confrontare versioni diverse del prompt con metriche oggettive.
- Iterare con fiducia, sapendo che ogni modifica è un miglioramento misurabile.
- Costruire applicazioni AI più affidabili ([[wiki/sources/2026-05-08-prompt-evaluation|Prompt Evaluation]]).

## I tre approcci dopo la scrittura di un prompt

1. **Test singolo**: il più rischioso. Si verifica il prompt una volta e lo si considera valido. Fallisce frequentemente con input reali inattesi.
2. **Pochi test + aggiustamenti**: si coprono uno o due corner case, ma restano scoperte molte situazioni reali.
3. **Pipeline di valutazione sistematica**: si esegue il prompt su un dataset di test, si ottiene uno score oggettivo, si itera. Richiede più investimento ma garantisce affidabilità ([[wiki/sources/2026-05-08-prompt-evaluation|Prompt Evaluation]]).

## I tipi di grader

Un grader è il componente che esamina l'output di Claude e restituisce un segnale misurabile (tipicamente un numero da 1 a 10). Esistono tre categorie ([[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]]):

- **Code grader**: logica programmatica — validazione sintattica (JSON, Python, regex), lunghezza, presenza/assenza di parole chiave. Veloce, deterministico, adatto a criteri oggettivi.
- **Model grader**: un secondo LLM valuta la qualità dell'output. Flessibile, adatto a criteri soggettivi come instruction-following, completezza, safety. Usa prefilling + stop sequences per restituire un JSON strutturato con score e reasoning.
- **Human grader**: revisione manuale. Massima flessibilità, ma lento e costoso. Utile per qualità generale, profondità, rilevanza.

In pratica, code grader e model grader si combinano: si fa la media dei due score per ottenere una valutazione completa che copre sia la correttezza tecnica sia la qualità del contenuto ([[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]]).

## Connessioni

- Il workflow pratico passo-passo è descritto in [[wiki/concepts/eval-workflow|Eval Workflow]].
- Le tecniche per migliorare i punteggi sono raccolte in [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]].
- Il model grader sfrutta [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]] per estrarre JSON strutturato.
