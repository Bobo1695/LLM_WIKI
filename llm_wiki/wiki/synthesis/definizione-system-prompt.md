---
title: Definizione e ruolo del System Prompt
type: synthesis
created: 2026-05-07
updated: 2026-05-07
tags: [system-prompt, anthropic, prompt-engineering, sintesi]
sources: [2026-05-07-system-prompts]
---

Un **system prompt** è un'istruzione di contesto fornita a [[wiki/entities/claude|Claude]] al di fuori della normale cronologia dei messaggi. Viene passato tramite il parametro `system=` dell'[[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] e ha lo scopo di definire il ruolo, il tono, i vincoli e lo stile dell'intera conversazione.

## Funzioni principali

- **Definizione del Ruolo:** Permette di assegnare a Claude una "persona" o un'identità specifica (es. un tutor di matematica, un assistente alla programmazione, un correttore di bozze).
- **Coerenza comportamentale:** Assicura che il modello mantenga un comportamento stabile e prevedibile su tutti i turni della conversazione, senza "dimenticare" le istruzioni iniziali.
- **Vincoli e Focus:** Mantiene Claude concentrato sul compito specifico richiesto dall'applicazione, definendo esplicitamente cosa deve fare e, spesso, cosa *non* deve fare.

## Esempio pratico: Il Math Tutor

L'utilizzo del system prompt trasforma radicalmente l'interazione. Senza di esso, Claude tende a fornire risposte dirette e risolutive. Con un prompt dedicato, diventa un facilitatore dell'apprendimento.

> "Sei un tutor di matematica paziente. Non rispondere direttamente alle domande degli studenti. Guidali verso la soluzione passo dopo passo."
> — ([[wiki/sources/2026-05-07-system-prompts|System Prompts]])

## Implementazione tecnica

Nell'integrazione con l'SDK Python di Anthropic, il system prompt viene passato come parametro di primo livello nel metodo `messages.create()`.

```python
# Esempio di chiamata corretta
client.messages.create(
    model="claude-3-5-sonnet-20240620",
    max_tokens=1024,
    system="Sei un assistente tecnico esperto.", # <--- System Prompt
    messages=[
        {"role": "user", "content": "Come installo Node.js?"}
    ]
)
```

**Nota:** L'API è rigorosa; se il parametro `system` è presente ma impostato a `None` o stringa vuota, potrebbe restituire un errore. È prassi comune omettere il parametro se non necessario.

## Connessioni nel wiki
- [[wiki/concepts/system-prompt|Concetto: System Prompt]] — La definizione tecnica del parametro.
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — La struttura della chiamata che ospita il prompt.
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — Il contesto in cui il system prompt agisce come ancora di stabilità.
