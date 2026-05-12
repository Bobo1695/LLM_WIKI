---
title: Tokenization (e pipeline di generazione)
type: concept
created: 2026-05-07
updated: 2026-05-07
tags: [llm, internals, claude, generazione]
sources: [2026-05-07-accessing-the-api, 2026-05-07-temperature]
---

Pipeline interna con cui [[wiki/entities/claude|Claude]] (e gli LLM in generale) trasforma il testo in input in testo in output. Si articola in 4 stadi.

## 1 — Tokenizzazione
Il testo è spezzato in **token**: parole intere, parti di parola, spazi, simboli. Regola pratica: ~1 parola ≈ 1 token.

## 2 — Embedding
Ogni token è convertito in un vettore numerico ad alta dimensione (embedding) che codifica tutti i suoi possibili significati semantici.

> Es. "quantum" può riferirsi alla fisica, al calcolo quantistico, a qualcosa di estremamente piccolo. L'embedding contiene tutte queste sfumature.

## 3 — Contestualizzazione
Gli embedding vengono raffinati in base alle parole circostanti (meccanismo di attenzione / attention), selezionando il significato più probabile nel contesto specifico.

## 4 — Generazione
Gli embedding contestualizzati passano attraverso un layer di output che calcola le probabilità per ogni possibile prossima parola. Il modello non sceglie sempre la parola più probabile: usa probabilità più [[wiki/concepts/temperature-parameter|temperature]] per generare testo naturale e variegato.

Il processo si ripete token per token fino a una condizione di stop: `max_tokens` raggiunto, token end-of-sequence, o [[wiki/concepts/stop-sequence|stop sequence]].

## Connessioni
- [[wiki/concepts/temperature-parameter|Temperature]] — controlla il grado di casualità nel sampling.
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — `max_tokens` è il parametro che limita la generazione.
- [[wiki/concepts/stop-sequence|Stop Sequence]] — condizione di interruzione esplicita.
