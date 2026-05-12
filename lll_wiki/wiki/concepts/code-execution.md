---
title: Code Execution Tool
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [tool-use, codice, sandbox, python]
sources: [2026-05-08-code-execution-files-api]
---

Il Code Execution Tool è uno strumento server-side built-in di Anthropic che consente a Claude di scrivere ed eseguire codice Python all'interno di un ambiente isolato, senza che lo sviluppatore debba implementare alcuna logica di esecuzione.

## Come si attiva

A differenza dei tool personalizzati che richiedono una funzione di handler, il Code Execution Tool si abilita semplicemente includendo il suo schema predefinito nella lista dei tools della richiesta:

```json
{"type": "code_execution_20250522", "name": "code_execution"}
```

Anthropic gestisce l'infrastruttura di esecuzione; lo sviluppatore riceve i risultati direttamente nella risposta.

## Caratteristiche dell'ambiente di esecuzione

- **Container Docker isolato**: ogni esecuzione avviene in un sandbox separato
- **Nessun accesso alla rete**: il container non può effettuare chiamate API esterne o accedere a risorse remote
- **Esecuzioni multiple**: Claude può eseguire codice più volte durante una singola conversazione, iterando sulla soluzione
- **Output catturato**: i risultati di ogni esecuzione vengono inclusi nella risposta e interpretati da Claude per costruire la risposta finale

## Struttura della risposta

Quando Claude usa il Code Execution Tool, la risposta contiene blocchi di tipo diverso:

- **Text block**: analisi e spiegazioni testuali di Claude
- **Server tool use block**: il codice Python effettivamente eseguito
- **Code execution tool result block**: l'output prodotto dall'esecuzione

## Integrazione con la Files API

La mancanza di accesso alla rete rende la [[wiki/concepts/files-api|Files API]] il meccanismo essenziale per:
- **Input**: caricare file dati (CSV, immagini, PDF) e renderli disponibili al container tramite `container_upload` block
- **Output**: recuperare file generati da Claude durante l'esecuzione (grafici, report) identificati da `type: "code_execution_output"`

## Casi d'uso

La combinazione [[wiki/concepts/files-api|Files API]] + Code Execution Tool apre scenari potenti di delega computazionale a Claude:

- Analisi dati e generazione di visualizzazioni (es. churn analysis su dati CSV)
- Image processing e manipolazione
- Parsing e trasformazione di documenti
- Computazioni matematiche e modellazione
- Generazione di report con formattazione personalizzata

Il pattern fondamentale è: fornire input tramite Files API → Claude scrive, esegue e itera il codice → recuperare output tramite Files API. Questo trasforma Claude in un assistente che non solo scrive codice, ma lo esegue e ne verifica i risultati ([[wiki/concepts/tool-use|Tool Use]]).
