---
title: Tool Schema (JSON Schema per Tool)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [tool-use, json-schema, api]
sources: [2026-05-08-tool-schemas, 2026-05-08-tool-functions, 2026-05-08-handling-message-blocks]
---

## Cos'è un Tool Schema

Un **tool schema** è un oggetto JSON che descrive a [[wiki/entities/claude|Claude]] una funzione disponibile: cosa fa, quando usarla e quali argomenti accetta. È la "documentazione leggibile dalla macchina" che Claude consulta per decidere se e come invocare uno strumento.

La specifica adottata da [[wiki/entities/anthropic|Anthropic]] segue lo standard **JSON Schema**, un formato di validazione dati indipendente dall'AI, già ampiamente usato nell'industria per descrivere strutture dati ([[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]]).

## Struttura di uno Schema

Ogni schema ha tre campi obbligatori di primo livello:

```json
{
  "name": "get_weather",
  "description": "Restituisce le condizioni meteo attuali per una città. Usare quando l'utente chiede del tempo. Restituisce temperatura, umidità e descrizione.",
  "input_schema": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "Città e stato/paese (es. 'San Francisco, CA')"
      }
    },
    "required": ["location"]
  }
}
```

- **`name`**: identificatore della funzione, usato da Claude per nominare il tool nel `ToolUseBlock`.
- **`description`**: 3-4 frasi che spiegano cosa fa il tool, quando usarlo e cosa restituisce. La qualità di questo campo influenza direttamente la capacità di Claude di scegliere lo strumento corretto.
- **`input_schema`**: JSON Schema dell'oggetto di input, con `type`, `properties` (nome → tipo + descrizione) e `required` (lista parametri obbligatori).

## Scrivere Descrizioni Efficaci

La `description` è il campo più critico. Le best practice includono ([[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]]):
- Spiegare **cosa fa** il tool (non solo il nome).
- Indicare **quando Claude deve usarlo**.
- Descrivere **cosa restituisce** (tipo, formato, casi particolari).
- Aggiungere **descrizioni dettagliate per ogni parametro**, non solo il tipo.

## La Risposta Multi-Blocco

Quando Claude decide di usare uno strumento, la risposta contiene un messaggio con più blocchi ([[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]]):

- **`TextBlock`**: testo leggibile che spiega cosa sta facendo Claude.
- **`ToolUseBlock`**: istruzioni macchina con `id`, `name`, `input` (dizionario parametri) e `type: "tool_use"`.

L'applicazione deve appendere l'intero `response.content` (non solo il testo) alla history della conversazione.

## ToolResultBlock

Dopo aver eseguito la funzione, il risultato va inviato a Claude come `ToolResultBlock`:

```json
{
  "type": "tool_result",
  "tool_use_id": "<id del ToolUseBlock corrispondente>",
  "content": "<output serializzato come stringa>",
  "is_error": false
}
```

Il `tool_use_id` deve corrispondere esattamente all'`id` del `ToolUseBlock` che ha generato la richiesta.

## Type Safety e Generazione Assistita

- **Generazione con Claude**: è possibile fornire il codice della funzione a Claude chiedendo di generare lo schema — efficace e veloce.
- **Type safety**: importare `ToolParam` da `anthropic.types` per verificare staticamente la struttura dello schema nel codice Python.

## Relazioni

- [[wiki/concepts/tool-use|Tool Use]] — il meccanismo generale di cui lo schema è un componente.
- [[wiki/concepts/web-search-tool|Web Search Tool (built-in)]] e [[wiki/concepts/text-editor-tool|Text Editor Tool (built-in)]] — tool built-in con schema parzialmente incorporato in Claude.
- [[wiki/concepts/prompt-caching|Prompt Caching]] — i tool schema sono candidati ottimali per il caching (raramente cambiano); si aggiunge `cache_control: {"type": "ephemeral"}` all'ultimo tool della lista.
