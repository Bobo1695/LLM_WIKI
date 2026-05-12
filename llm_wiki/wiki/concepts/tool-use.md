---
title: Tool Use
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [tool-use, architettura, api]
sources: [2026-05-08-introducing-tool-use, 2026-05-08-tool-use-project-overview, 2026-05-08-sending-tool-results, 2026-05-08-multi-turn-with-tools]
---

## Cos'è il Tool Use

Il **tool use** (o "function calling") è il meccanismo che permette a [[wiki/entities/claude|Claude]] di richiedere l'esecuzione di funzioni esterne durante una conversazione. Invece di limitarsi alle informazioni presenti nel training data, Claude può delegare all'applicazione ospitante il recupero di dati aggiornati o l'esecuzione di azioni nel mondo reale.

Il problema che il tool use risolve è fondamentale: Claude è addestrato su dati con una data di cutoff e non ha accesso nativo a eventi correnti, basi di dati live, API esterne o sistemi reali. Senza strumenti, domande come "Che tempo fa oggi?" o "Quanto vale questo titolo in borsa?" non possono ricevere una risposta accurata ([[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]]).

## Il Flusso Base

Il ciclo di una singola tool call si articola in quattro passi:

1. **Request**: l'applicazione invia a Claude un messaggio utente accompagnato da una lista di tool schema JSON che descrivono le funzioni disponibili.
2. **Tool Call**: Claude analizza la richiesta e, se serve informazione esterna, risponde con un messaggio multi-blocco che contiene un `ToolUseBlock` (nome funzione + parametri + ID univoco).
3. **Execution**: il server esegue la funzione Python corrispondente e ottiene il risultato.
4. **Response**: il risultato viene inviato a Claude come `ToolResultBlock` in un messaggio utente; Claude genera la risposta finale per l'utente.

## Il Loop Multi-Turn

Quando una singola risposta richiede più tool in sequenza (es. prima `get_current_datetime`, poi `add_duration_to_datetime`), il ciclo si ripete. Il segnale di continuazione è `stop_reason == "tool_use"` nel campo della risposta; quando Claude ha tutte le informazioni necessarie imposta `stop_reason == "end_turn"` e il loop termina ([[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]]).

```
while stop_reason == "tool_use":
    esegui tutti i tool richiesti
    invia i ToolResultBlock
    chiedi a Claude la risposta successiva
```

Claude può richiedere più tool in un singolo turno; ogni `ToolUseBlock` ha un ID univoco che deve essere abbinato al corrispondente `ToolResultBlock` nella risposta.

## Gestione della Cronologia

Claude è **stateless**: la cronologia della conversazione deve essere mantenuta interamente dall'applicazione. Questo significa:
- Appendere ogni messaggio assistente (inclusi tutti i blocchi, non solo il testo) alla lista `messages`.
- Includere i `ToolResultBlock` come messaggi di ruolo `"user"`.
- Passare sempre la lista completa `tools` anche nelle chiamate di follow-up, poiché Claude ha bisogno degli schema per interpretare la history ([[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]]).

## Error Handling

Se l'esecuzione di un tool fallisce, bisogna comunque inviare un `ToolResultBlock` con `is_error: True` e il messaggio di errore come `content`. Claude riceve l'errore e può adattare la risposta o richiedere una versione corretta dei parametri.

## Relazioni con altri concetti

- [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]] — la struttura che descrive ogni tool a Claude.
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — il pattern architetturale sottostante.
- [[wiki/concepts/web-search-tool|Web Search Tool (built-in)]] e [[wiki/concepts/text-editor-tool|Text Editor Tool (built-in)]] — tool built-in che non richiedono schema personalizzati.
- [[wiki/concepts/response-streaming|Response Streaming]] — può essere combinato con il tool use per aggiornamenti in tempo reale ([[wiki/sources/2026-05-08-fine-grained-tool-calling|Fine-Grained Tool Calling]]).
