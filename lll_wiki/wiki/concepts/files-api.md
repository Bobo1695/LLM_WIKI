---
title: Files API
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [api, files, ottimizzazione]
sources: [2026-05-08-code-execution-files-api]
---

La Files API è una funzionalità dell'[[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] che offre un modo alternativo e più efficiente per gestire file (immagini, PDF, testo, CSV, ecc.) nelle richieste a Claude.

## Il problema che risolve

Il metodo tradizionale per inviare un file a Claude prevede di codificarlo come base64 e includerlo direttamente nel corpo del messaggio. Questo approccio diventa oneroso quando:
- Lo stesso file deve essere referenziato in più richieste successive
- I file sono di grandi dimensioni
- Si vuole separare il momento dell'upload dal momento dell'elaborazione

## Come funziona

Il flusso con la Files API è semplice:

1. **Upload**: si carica il file con una chiamata API separata
2. **Ricezione ID**: l'API restituisce un file metadata object con un ID univoco
3. **Riuso**: nelle richieste successive si referenzia il file tramite l'ID, senza reinviare i dati raw

Questo approccio riduce la dimensione dei messaggi, semplifica il codice e permette il riuso dello stesso file in più conversazioni o richieste.

## Integrazione con il Code Execution Tool

La Files API è il meccanismo primario per portare dati dentro e fuori dall'ambiente del [[wiki/concepts/code-execution|Code Execution Tool]]. Poiché i container Docker usati per l'esecuzione del codice non hanno accesso alla rete, l'unico modo per fornire dati di input e recuperare output (es. grafici generati) è attraverso la Files API.

Flusso tipico combinato:
- Upload di un file dati (es. CSV) tramite Files API → referenziamento tramite `container_upload` block → Claude esegue codice Python sull'input → output scaricabile tramite file ID presente nella risposta (`type: "code_execution_output"`).

## Considerazioni

La Files API non ha funzione di cache persistente a lungo termine: i file caricati sono pensati per un riuso operativo, non per l'archiviazione permanente. Per ottimizzare il costo del preprocessing dei prompt si usa invece il [[wiki/concepts/prompt-caching|Prompt Caching]].
