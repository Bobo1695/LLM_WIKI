---
title: Agents and Tools
type: source
source_path: raw/incoming/Agents and tools.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, agents, tool-use, abstraction, combinability]
---

## TL;DR
- Gli agenti eccellono quando non si conoscono in anticipo i passi necessari: si fornisce un obiettivo e un set di tool, e Claude decide come combinarli.
- I tool devono essere **astratti e combinabili**, non iper-specializzati: Claude Code è l'esempio paradigmatico (bash, read, write, edit, glob, grep).
- Claude può concatenare tool semplici per risolvere richieste complesse non previste esplicitamente dagli sviluppatori.
- La flessibilità degli agenti ha un costo: affidabilità e prevedibilità minori rispetto ai workflow.

## Punti chiave

### Differenza fondamentale con i workflow
- I workflow sono ottimali quando si conoscono gli step esatti.
- Gli agenti brillano quando non si sa quali step saranno necessari.
- Con gli agenti, Claude formula autonomamente un piano per usare i tool disponibili.

### Il potere della combinazione dei tool
Esempio con tool datetime semplici:
- `get_current_datetime` — ottiene data e ora correnti.
- `add_duration_to_datetime` — aggiunge durata a una data.
- `set_reminder` — crea un promemoria per un momento specifico.

Come vengono combinati:
- "Che ora è?" → una sola chiamata a `get_current_datetime`.
- "Che giorno è fra 11 giorni?" → `get_current_datetime` + `add_duration_to_datetime`.
- "Ricordami di andare in palestra mercoledì prossimo" → tutti e tre i tool in sequenza.
- Claude sa anche quando chiedere informazioni aggiuntive ("Quando hai comprato il prodotto?" prima di calcolare la scadenza della garanzia).

### Principio chiave: tool astratti e generici
L'esempio paradigmatico è Claude Code:
- `bash` — esegui qualsiasi comando.
- `read` — leggi qualsiasi file.
- `write` — crea qualsiasi file.
- `edit` — modifica file.
- `glob` — trova file.
- `grep` — cerca nel contenuto dei file.

Non esistono tool specializzati come "refactoring del codice" o "installa dipendenze". Claude capisce come usare i tool di base per compiti complessi mai esplicitamente pianificati dagli sviluppatori. Questa astrazione permette di gestire scenari di programmazione innumerevoli.

### Best practice: tool combinabili
Esempio per un agente social media video:
- `bash` — accesso a FFMPEG per elaborazione video.
- `generate_image` — crea immagini da prompt.
- `text_to_speech` — converte testo in audio.
- `post_media` — carica contenuto su piattaforme social.

Questo set di tool abilita sia workflow semplici (crea e pubblica video) sia esperienze interattive (genera immagine di esempio, ottieni approvazione utente, poi procede con la creazione del video).

### Trade-off della flessibilità
- **Vantaggio**: l'agente si adatta al feedback e alle preferenze dell'utente, difficile da ottenere con un workflow rigido.
- **Svantaggio**: affidabilità e costo aumentato rispetto a un workflow deterministico.
- Si può creare un agente una volta, assicurarsi che funzioni ragionevolmente bene, e poi deployarlo per risolvere una vasta gamma di problemi.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/tool-use|Tool Use]]
- [[wiki/concepts/agent-systems|Agenti AI]]
- [[wiki/concepts/workflow-patterns|Workflow Patterns]]

## Citazioni notevoli
> "The real power of agents lies in their ability to combine simple tools in unexpected ways."

> "The key insight for building effective agents is providing reasonably abstract tools rather than hyper-specialized ones."

> "This abstraction allows it to handle countless programming scenarios that the developers never explicitly planned for."

## Connessioni
- Approfondisce la definizione di agente introdotta in [[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]] e [[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]].
- Il principio dei tool astratti si collega direttamente al concetto di [[wiki/concepts/tool-use|Tool Use]].
- La necessità che Claude osservi i risultati delle azioni dei tool è il tema centrale di [[wiki/sources/2026-05-08-environment-inspection|Environment Inspection]].
