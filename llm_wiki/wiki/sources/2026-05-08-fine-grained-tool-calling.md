---
title: Fine-Grained Tool Calling
type: source
source_path: raw/incoming/Fine grained tool calling.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, streaming, fine-grained, json-validation]
---

## TL;DR
- Con lo streaming attivo, i tool argument arrivano in chunks tramite eventi `InputJsonEvent` con campi `partial_json` e `snapshot`.
- Per default, l'API bufferizza i chunk e li invia solo quando una coppia chiave-valore top-level è completa e validata.
- Il fine-grained tool calling disabilita la validazione JSON lato API, inviando i chunk immediatamente non appena Claude li genera.
- Con fine-grained abilitato il codice deve gestire autonomamente JSON non valido (try/except su `json.loads`).

## Punti chiave
- **Streaming e tool use**: con streaming abilitato, oltre agli eventi `ContentBlockDelta` per il testo, arrivano eventi `InputJsonEvent` per gli argomenti del tool.
- **Campi di `InputJsonEvent`**:
  - `partial_json`: chunk parziale del JSON corrente.
  - `snapshot`: JSON accumulato fino a quel momento.
- **Comportamento di default (con validazione)**: l'API bufferizza i chunk e attende che una coppia chiave-valore top-level sia completa prima di inviarla. Questo causa "pause e burst" visibili nel flusso.
- **Perché il buffering**: il server valida ogni key-value pair top-level contro lo schema prima di rilasciarlo, garantendo JSON valido ma introducendo latenza.
- **Fine-grained tool calling**: si attiva con `fine_grained=True`. Effetti:
  - Nessun buffering: i chunk arrivano appena Claude li genera.
  - La validazione JSON è disabilitata lato API.
  - Il codice client deve gestire JSON parziale o non valido (es. `"word_count": undefined`).
- **Gestione errori obbligatoria**:
  ```python
  try:
      parsed_args = json.loads(chunk.snapshot)
  except json.JSONDecodeError:
      print("Received invalid JSON, continuing...")
  ```
- **Quando usarlo**: utile quando si vuole mostrare aggiornamenti in tempo reale all'utente o elaborare risultati parziali il prima possibile; richiede robusta gestione degli errori.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/response-streaming|Response Streaming]]

## Citazioni notevoli
> "Fine-grained tool calling does one main thing: it disables JSON validation on the API side."

> "Without fine-grained tool calling, the API's validation would catch this error and potentially wrap problematic values in strings, which might not match your expected schema."

## Connessioni
- Combina il tool use (introdotto in [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]]) con lo streaming ([[wiki/concepts/response-streaming|Response Streaming]]).
- Il comportamento di default con validazione è il complemento del flusso multi-turn descritto in [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]].
- Argomento avanzato rispetto al resto della serie; presuppone la comprensione dell'intero ciclo tool use.
