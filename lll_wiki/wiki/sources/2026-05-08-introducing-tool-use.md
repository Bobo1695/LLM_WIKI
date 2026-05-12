---
title: Introducing Tool Use
type: source
source_path: raw/incoming/Introducing tool use.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, introduzione, real-time-data]
---

## TL;DR
- Il tool use permette a Claude di accedere a informazioni esterne al suo training data, superando il limite di conoscenza statica.
- Il flusso base prevede quattro passi: richiesta utente → tool call di Claude → esecuzione sul server → risposta finale con dati freschi.
- Senza strumenti, Claude non può rispondere a domande su dati real-time (meteo, prezzi, DB live).
- Il tool use trasforma Claude da base di conoscenza statica ad assistente dinamico collegato a sistemi esterni.

## Punti chiave
- **Il problema**: Claude conosce solo ciò che era presente nel suo training data; senza strumenti non può accedere a eventi correnti, dati real-time o sistemi esterni.
- **Flusso del tool use**:
  1. L'applicazione invia a Claude una domanda insieme alle istruzioni sugli strumenti disponibili.
  2. Claude decide di aver bisogno di dati aggiuntivi e formula una richiesta di tool call.
  3. Il server esegue la funzione e recupera i dati (es. da una weather API).
  4. I dati vengono inviati a Claude, che genera la risposta finale combinando domanda originale e dati freschi.
- **Esempio pratico**: meteo di San Francisco — senza strumenti Claude si scusa; con il tool use ottiene i dati in tempo reale e risponde correttamente.
- **Benefici**: informazioni real-time, integrazione con sistemi esterni (DB, API), risposte dinamiche, interazione strutturata.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "Tool use transforms Claude from a static knowledge base into a dynamic assistant that can work with live data."

> "Tools allow Claude to access information from the outside world, extending its capabilities beyond what it learned during training."

## Connessioni
- Questa fonte è il punto di ingresso dell'intera serie sul tool use di Anthropic Academy.
- Il flusso descritto qui viene approfondito tecnicamente in [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]], [[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]] e [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]].
- Il progetto pratico che implementa questi concetti è descritto in [[wiki/sources/2026-05-08-tool-use-project-overview|Project Overview]].
