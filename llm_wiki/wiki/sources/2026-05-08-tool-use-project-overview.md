---
title: Tool Use — Project Overview
type: source
source_path: raw/incoming/Project overview.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, progetto, reminder, date-calculation]
---

## TL;DR
- Il progetto pratico del corso consiste nel costruire un sistema di promemoria che usa Claude con strumenti personalizzati.
- Le sfide principali sono: consapevolezza dell'ora esatta, calcolo di date future, capacità di impostare promemoria.
- Vengono introdotti tre tool specifici: `get_current_datetime`, `add_duration_to_datetime`, `set_reminder`.
- Il principio guida è: quando Claude ha limitazioni, le si estende con strumenti invece di aggirarle nei prompt.

## Punti chiave
- **Obiettivo del progetto**: rispondere a richieste come "Imposta un promemoria per la mia visita medica, è tra una settimana da giovedì."
- **Tre limitazioni di Claude da risolvere**:
  1. Conosce la data ma non l'ora esatta.
  2. Ha difficoltà con l'aritmetica delle date su lunghi intervalli.
  3. Non ha meccanismi nativi per impostare promemoria.
- **I tre strumenti necessari**:
  - `get_current_datetime` — recupera data e ora precise.
  - `add_duration_to_datetime` — calcola date future in modo affidabile.
  - `set_reminder` — imposta il promemoria nel sistema.
- **Approccio metodologico**: i tool vengono implementati uno alla volta, dal più semplice al più complesso, per comprendere progressivamente il meccanismo del tool calling.
- **Principio chiave**: estendere le capacità di Claude tramite strumenti piuttosto che cercare workaround nei prompt.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "This project demonstrates a key principle of working with AI: when the model has limitations, we extend its capabilities through tools rather than trying to work around those limitations in our prompts."

## Connessioni
- Questa fonte introduce il progetto pratico il cui codice viene dettagliato in [[wiki/sources/2026-05-08-tool-functions|Tool Functions]], [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]] e [[wiki/sources/2026-05-08-using-multiple-tools|Using Multiple Tools]].
- Il loop multi-turn necessario per eseguire più tool in sequenza è spiegato in [[wiki/sources/2026-05-08-multi-turn-with-tools|Multi-Turn Conversations with Tools]] e [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]].
