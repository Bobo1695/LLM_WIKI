---
title: Tool Schemas
type: source
source_path: raw/incoming/Tool schemas.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, json-schema, api, implementazione]
---

## TL;DR
- Il JSON schema è la "documentazione" che Claude legge per capire quando e come usare uno strumento.
- Ogni schema ha tre campi principali: `name`, `description`, `input_schema` (con type/properties/required).
- Si può usare Claude stesso per generare gli schema a partire dal codice della funzione.
- L'uso del tipo `ToolParam` della libreria Anthropic aggiunge type-safety al codice.

## Punti chiave
- **Scopo**: lo schema JSON non è specifico all'AI — è uno standard di validazione dati adottato dalla comunità AI per descrivere i parametri delle funzioni.
- **Struttura di uno schema**:
  - `name`: nome chiaro e descrittivo (es. `"get_weather"`).
  - `description`: 3-4 frasi su cosa fa il tool, quando usarlo e cosa restituisce.
  - `input_schema`: oggetto JSON Schema con `type`, `properties` (nome → tipo + descrizione) e `required` (lista parametri obbligatori).
- **Scrivere descrizioni efficaci**: spiegare cosa fa il tool, quando Claude deve usarlo, i dati restituiti e una descrizione dettagliata per ogni argomento.
- **Generazione assistita**: è possibile fornire il codice della funzione a Claude chiedendo di generare lo schema seguendo le best practice della documentazione Anthropic.
- **Convenzione di naming**: `function_name` + `function_name_schema` per mantenere funzioni e schema abbinati nel codice.
- **Type safety**: importare `ToolParam` da `anthropic.types` per prevenire errori di tipo quando si passa lo schema all'API.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]]

## Citazioni notevoli
> "JSON Schema isn't specific to AI or tool calling - it's a widely-used data validation specification that's been around for years."

> "Your tool description is crucial for helping Claude understand when to use your function."

## Connessioni
- Questa fonte è il passo naturale dopo [[wiki/sources/2026-05-08-tool-functions|Tool Functions]]: prima si scrive la funzione, poi il suo schema.
- Lo schema viene usato nelle chiamate API mostrate in [[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]] e [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]].
- Il concetto di schema built-in (senza definizione manuale) è illustrato per il text editor in [[wiki/sources/2026-05-08-text-edit-tool|The Text Edit Tool]] e per il web search in [[wiki/sources/2026-05-08-web-search-tool|The Web Search Tool]].
