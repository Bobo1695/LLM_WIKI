---
title: Code Execution and the Files API
type: source
source_path: raw/incoming/Code execution and the Files API.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, files-api, code-execution, tool-use, analisi-dati, python]
---

## TL;DR
- La Files API permette di caricare file una volta sola e referenziarli tramite file ID nelle richieste successive, evitando l'encoding base64 inline.
- Il Code Execution tool esegue codice Python in un container Docker isolato senza accesso di rete.
- Combinati insieme, permettono di delegare a Claude task computazionali complessi: upload CSV → analisi → grafici scaricabili.
- Il workflow apre possibilità oltre l'analisi dati: image processing, document parsing, modellazione matematica.

## Punti chiave

**Files API**
- Alternativa all'invio di file come base64 direttamente nei messaggi
- Flusso: upload del file → ricezione di un file metadata object con ID univoco → uso dell'ID nelle richieste future
- Particolarmente utile quando lo stesso file è referenziato più volte o per file di grandi dimensioni
- Supporta immagini, PDF, testo e altri formati

**Code Execution Tool**
- Tool server-side: non richiede implementazione da parte dello sviluppatore
- Si attiva includendo lo schema predefinito nella richiesta: `{"type": "code_execution_20250522", "name": "code_execution"}`
- Esegue codice Python in un container Docker isolato
- Caratteristiche dell'ambiente di esecuzione:
  - Nessun accesso alla rete (impossibile fare chiamate API esterne)
  - Claude può eseguire codice più volte durante una singola conversazione
  - I risultati vengono catturati e interpretati da Claude per la risposta finale

**Workflow combinato Files API + Code Execution**
- I container Docker non hanno accesso alla rete → la Files API è il meccanismo primario per portare dati dentro e fuori dall'ambiente di esecuzione
- Flusso tipico:
  1. Upload del file dati (es. CSV) tramite Files API
  2. Inclusione di un `container_upload` block nel messaggio con il file ID
  3. Richiesta di analisi a Claude
  4. Claude scrive ed esegue codice Python per processare il file
  5. Claude genera output (es. grafici) disponibili per il download

**Struttura della risposta con code execution**
- Text block: analisi e spiegazioni di Claude
- Server tool use block: il codice effettivo che Claude ha deciso di eseguire
- Code execution tool result block: output dell'esecuzione
- Claude può eseguire codice più volte durante una singola risposta, costruendo l'analisi iterativamente

**Download dei file generati**
- Claude può generare file (grafici, report) durante l'esecuzione
- Identificabili in risposta con `type: "code_execution_output"` — contengono file ID per il download
- Recuperabili tramite: `download_file("file_id_from_response")`

**Casi d'uso oltre l'analisi dati**
- Image processing e manipolazione
- Parsing e trasformazione di documenti
- Computazioni matematiche e modellazione
- Generazione di report con formattazione personalizzata

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/files-api|Files API]], [[wiki/concepts/code-execution|Code Execution Tool]], [[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]]

## Citazioni notevoli
> "Since the Docker containers have no network access, the Files API becomes the primary way to get data in and out of the execution environment."

> "You can delegate complex, computational tasks to Claude while maintaining control over the inputs and outputs through the Files API. This creates a powerful workflow where Claude becomes your coding assistant that can actually execute and iterate on solutions."

## Connessioni
- Il Code Execution tool è una forma avanzata di tool use; si collega a [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]] e al concetto [[wiki/concepts/tool-use|Tool Use]].
- La Files API si integra con l'[[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] descritta in [[wiki/sources/2026-05-07-accessing-the-api|Accessing the API]].
- Il notebook allegato `005_code_execution.ipynb` e il dataset `streaming.csv` sono risorse pratiche complementari.
