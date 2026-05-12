---
title: Prompt Caching
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [performance, caching, api, ottimizzazione]
sources: [2026-05-08-prompt-caching, 2026-05-08-rules-of-prompt-caching, 2026-05-08-prompt-caching-in-action]
---

Il prompt caching è una funzionalità dell'API Anthropic che permette di riutilizzare il lavoro computazionale di preprocessing già eseguito da Claude, invece di ricominciare da capo a ogni richiesta.

## Come funziona

Normalmente, quando Claude riceve un messaggio, esegue una serie di operazioni di preprocessing — tokenizzazione, creazione di embedding, analisi contestuale — prima di generare la risposta. Al termine della richiesta, tutto questo lavoro viene scartato. Se la richiesta successiva contiene lo stesso contenuto (come avviene spesso nelle conversazioni multi-turno o nei workflow di analisi documentale), Claude deve ripetere l'intero preprocessing.

Il caching interrompe questo ciclo: la prima richiesta "scrive" i risultati del preprocessing in una cache; le richieste successive che inviano contenuto identico "leggono" dalla cache invece di rielaborare. Il risparmio è significativo: circa il 90% di sconto sul costo dei token cachati e una latenza ridotta.

## Come si abilita

Il caching non è automatico. Occorre inserire esplicitamente un **cache breakpoint** nel blocco da cachare, usando il campo `cache_control: {"type": "ephemeral"}` nel formato esteso del blocco:

```json
{
  "type": "text",
  "text": "...",
  "cache_control": {"type": "ephemeral"}
}
```

Tutto il contenuto processato *prima* del breakpoint viene salvato in cache. I breakpoint possono essere inseriti in blocchi di testo, [[wiki/concepts/system-prompt|System Prompt]], [[wiki/concepts/tool-schema|Tool Schema]], immagini e blocchi tool use/result.

## Regole operative

- **Soglia minima**: il contenuto da cachare deve essere almeno 1024 token (somma di tutti i blocchi, non il singolo blocco).
- **TTL**: la cache dura 1 ora; progettata per applicazioni con frequenza API elevata.
- **Massimo 4 breakpoint** per richiesta.
- **Sensibilità**: anche 1 solo carattere di differenza rispetto alla richiesta precedente invalida l'intera sezione cachata. La cache è tutto-o-niente per ciascun componente.
- **Ordine di elaborazione**: Claude processa prima i tools, poi il system prompt, poi i messages — i breakpoint seguono questo ordine.

## Metriche

La risposta API espone due campi per monitorare l'utilizzo della cache:

- `cache_creation_input_tokens` — token scritti in cache (prima chiamata)
- `cache_read_input_tokens` — token letti dalla cache (chiamate successive)

Il caching parziale è possibile: se i tools restano identici ma il system prompt cambia, si ottiene una lettura parziale (tools) + una nuova scrittura (system prompt).

## Casi d'uso ideali

- Workflow di analisi documentale con domande multiple sullo stesso documento
- Applicazioni con [[wiki/concepts/system-prompt|System Prompt]] lungo e stabile
- Agenti con [[wiki/concepts/tool-schema|Tool Schema]] complessi e invarianti tra le richieste
- Conversazioni multi-turno dove si vuole cachare il contesto storico
