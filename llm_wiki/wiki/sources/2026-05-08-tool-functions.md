---
title: Tool Functions
type: source
source_path: raw/incoming/Tool functions.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, python, implementazione, best-practices]
---

## TL;DR
- Una tool function è una normale funzione Python eseguita quando Claude decide di aver bisogno di dati aggiuntivi.
- Le best practice includono: nomi descrittivi, validazione degli input, messaggi di errore chiari.
- La prima funzione del progetto, `get_current_datetime`, accetta un parametro di formato e restituisce data/ora corrente.
- Dopo la funzione bisogna scrivere il JSON schema corrispondente e integrarlo nel sistema di chat.

## Punti chiave
- **Definizione**: una tool function è una funzione Python ordinaria; Claude decide autonomamente quando invocarla in base alla conversazione.
- **Best practices**:
  - Usare nomi descrittivi per funzione e parametri.
  - Validare gli input: parametri vuoti o non validi devono sollevare eccezioni con messaggi utili.
  - Messaggi di errore chiari permettono a Claude di riprovare con parametri corretti.
- **Esempio — `get_current_datetime`**:
  ```python
  def get_current_datetime(date_format="%Y-%m-%d %H:%M:%S"):
      if not date_format:
          raise ValueError("date_format cannot be empty")
      return datetime.now().strftime(date_format)
  ```
- **Validazione come meccanismo di feedback**: se si solleva `ValueError("Location cannot be empty")`, Claude può ritentare la chiamata con un valore corretto.
- **Passi successivi**: dopo la funzione occorre definire il JSON schema e integrarlo nella chiamata API — argomento trattato in [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]].

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]]

## Citazioni notevoli
> "A tool function is a plain Python function that gets executed automatically when Claude decides it needs extra information to help a user."

> "The validation is particularly important because Claude learns from errors. If you raise a clear error like 'Location cannot be empty', Claude might try calling the function again with a proper location value."

## Connessioni
- La funzione `get_current_datetime` definita qui viene usata nel progetto pratico descritto in [[wiki/sources/2026-05-08-tool-use-project-overview|Project Overview]].
- Il passo successivo — scrivere lo schema JSON — è trattato in [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]].
- Il routing multi-tool viene mostrato in [[wiki/sources/2026-05-08-using-multiple-tools|Using Multiple Tools]].
