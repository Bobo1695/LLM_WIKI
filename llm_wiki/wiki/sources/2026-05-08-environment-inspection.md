---
title: Environment Inspection
type: source
source_path: raw/incoming/Environment inspection.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, agents, environment-inspection, feedback, observability]
---

## TL;DR
- Claude opera "alla cieca": deve poter osservare i risultati delle proprie azioni per lavorare efficacemente.
- Il principio di base è "leggi prima di scrivere": ogni modifica a file o stato deve essere preceduta da un'ispezione.
- Screenshot, lettura file e verifica risposte API sono i meccanismi concreti di environment inspection.
- L'ispezione dell'ambiente trasforma Claude da esecutore cieco ad agente capace di adattarsi.

## Punti chiave

### Perché l'environment inspection è essenziale
- Claude non ha percezione diretta dello stato del mondo: ogni azione potrebbe avere esiti diversi e imprevedibili.
- Esempio con computer use: cliccare un pulsante potrebbe navigare a una nuova pagina, aprire un menu o scatenare qualsiasi altra modifica. Senza screenshot del risultato, Claude non sa cosa è successo.

### Principio "Read before Write"
- Prima di modificare qualsiasi file, Claude deve leggerne il contenuto corrente.
- Sembra ovvio, ma è un pattern da codificare esplicitamente quando si progettano agenti.
- Esempio: se viene chiesto di aggiungere una nuova route a un file Python, Claude legge prima il codice esistente per capire la struttura corrente, solo poi apporta le modifiche richieste senza rompere le funzionalità esistenti.

### System prompt per guidare l'ispezione
Per task complessi, si può istruire Claude tramite system prompt. Esempio per un agente di generazione video:
- Usa il tool bash per eseguire whisper.cpp e generare file di caption con timestamp per verificare il posizionamento dei dialoghi.
- Usa FFmpeg per estrarre screenshot dal video a intervalli regolari per ispezionare visivamente l'output.
- Confronta il contenuto generato con i requisiti originali.

### Meccanismi concreti di ispezione
- **Operazioni su file**: leggere i contenuti prima di modificare.
- **Interazioni UI**: prendere screenshot dopo ogni interazione.
- **API**: verificare le risposte per i dati attesi.
- **Contenuto generato**: validare rispetto ai requisiti.

### Vantaggi dell'environment inspection
- **Tracking del progresso**: Claude può valutare quanto è vicino al completamento del task.
- **Gestione degli errori**: risultati inattesi possono essere rilevati e corretti.
- **Quality assurance**: l'output può essere verificato prima di considerare il task completo.
- **Comportamento adattivo**: Claude può adeguare il proprio approccio in base a ciò che osserva.

### Domanda progettuale fondamentale
Quando si progettano agenti, chiedersi sempre: "Come farà Claude a sapere se questa azione ha funzionato?"

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/agent-systems|Agenti AI]]
- [[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "When building AI agents, one crucial concept often gets overlooked: environment inspection. Claude operates blindly - it needs to be able to observe and understand the results of its actions to work effectively."

> "Environment inspection transforms Claude from a blind executor of commands into an agent that can truly understand and adapt to its working environment."

> "When designing your own agents, always ask: 'How will Claude know if this action worked?'"

## Connessioni
- Approfondisce un aspetto critico degli agenti introdotti in [[wiki/sources/2026-05-08-agents-and-tools|Agents and Tools]]: i tool astratti (bash, read) sono anche gli strumenti di ispezione.
- Si collega al pattern Evaluator-Optimizer in [[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]]: il "Grader" è in sostanza un meccanismo di environment inspection formalizzato nel workflow.
- Il concetto di "operare alla cieca" è la principale differenza pratica tra agenti ben progettati e mal progettati, tema centrale in [[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]].
