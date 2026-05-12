---
title: Using Multiple Tools
type: source
source_path: raw/incoming/Using multiple tools.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, multi-tool, reminder, pattern]
---

## TL;DR
- Aggiungere nuovi tool al sistema è semplice: basta aggiungere lo schema alla lista `tools` e un `elif` al router.
- Il progetto ora usa tre tool: `get_current_datetime`, `add_duration_to_datetime`, `set_reminder`.
- Claude orchestra autonomamente la sequenza di chiamate necessaria per rispondere a richieste complesse in linguaggio naturale.
- Il pattern modulare permette di espandere le capacità senza ristrutturare il codice esistente.

## Punti chiave
- **Tre tool del progetto finale**:
  - `get_current_datetime` — data e ora corrente.
  - `add_duration_to_datetime` — aggiunge una durata a una data.
  - `set_reminder` — imposta il promemoria nel sistema.
- **Aggiornamento di `run_conversation`**: aggiungere i tre schema alla lista `tools=[...]`.
- **Aggiornamento del router**:
  ```python
  def run_tool(tool_name, tool_input):
      if tool_name == "get_current_datetime":
          return get_current_datetime(**tool_input)
      elif tool_name == "add_duration_to_datetime":
          return add_duration_to_datetime(**tool_input)
      elif tool_name == "set_reminder":
          return set_reminder(**tool_input)
  ```
- **Test con richiesta complessa**: "Set a reminder for my doctors appointment. Its 177 days after Jan 1st, 2050." — Claude calcola autonomamente la data (27 giugno 2050) e imposta il promemoria in sequenza.
- **Struttura dei messaggi nella history**: messaggio utente → messaggio assistente (testo + tool use blocks) → messaggi utente con tool results → messaggi assistente di follow-up.
- **Pattern di aggiunta tool**: 1) implementa funzione, 2) definisci schema, 3) aggiungi schema a `run_conversation`, 4) aggiungi `elif` a `run_tool`.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "Once you have the core tool infrastructure, adding new tools follows this pattern: 1. Create the tool function implementation, 2. Define the tool schema, 3. Add the schema to the tools list in `run_conversation`, 4. Add a case for the tool in `run_tool`."

> "This modular approach makes it easy to expand your AI assistant's capabilities without restructuring existing code."

## Connessioni
- Rappresenta la conclusione del progetto pratico iniziato in [[wiki/sources/2026-05-08-tool-use-project-overview|Project Overview]].
- Si basa sull'infrastruttura di loop sviluppata in [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]] e [[wiki/sources/2026-05-08-multi-turn-with-tools|Multi-Turn Conversations with Tools]].
- Le funzioni `add_duration_to_datetime` e `set_reminder` sono fornite già pronte nel notebook del corso (link nel file sorgente).
