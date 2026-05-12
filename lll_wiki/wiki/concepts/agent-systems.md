---
title: Agenti AI (Agent Systems)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [agents, autonomia, tool-use]
sources: [2026-05-08-agents-and-workflows, 2026-05-08-agents-and-tools, 2026-05-08-environment-inspection, 2026-05-08-workflows-vs-agents]
---

## Cos'è un agente

Un agente AI è un sistema in cui un LLM riceve un obiettivo e un set di tool generici, e decide autonomamente quali azioni compiere per raggiungere tale obiettivo ([[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]]). A differenza di un workflow, non si specifica in anticipo la sequenza degli step: è Claude a formulare un piano a runtime, combinando i tool disponibili nel modo che ritiene più adatto.

La definizione chiave: si fornisce a Claude un goal e un insieme di strumenti, aspettandosi che Claude capisca come completare il compito attraverso i tool forniti ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]).

## Differenza con i workflow

| Dimensione | Workflow | Agente |
|---|---|---|
| Step | Predefiniti dal developer | Decisi da Claude a runtime |
| Flessibilità | Bassa, ottimizzata per task noti | Alta, gestisce situazioni nuove |
| Prevedibilità | Alta | Bassa |
| Testabilità | Facile (step noti) | Difficile (percorso variabile) |
| Tasso di successo | Più alto | Più basso |

Regola pratica: implementare sempre workflow dove possibile; ricorrere agli agenti solo quando veramente necessario ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]).

## Tool per agenti: generici e combinabili

Il principio fondamentale è fornire tool **astratti e combinabili**, non iper-specializzati. L'esempio paradigmatico è Claude Code, che usa tool come `bash`, `read`, `write`, `edit`, `glob`, `grep` — strumenti generici che Claude combina creativamente per risolvere qualsiasi scenario di programmazione, compresi quelli mai esplicitamente pianificati dagli sviluppatori ([[wiki/sources/2026-05-08-agents-and-tools|Agents and Tools]]).

Tool specializzati come "refactoring del codice" o "installa dipendenze" limiterebbero l'agente ai soli scenari previsti. Tool generici permettono combinazioni infinite e impreviste.

Esempi di combinazione: con tre soli tool datetime (get_current_datetime, add_duration_to_datetime, set_reminder), Claude gestisce decine di richieste diverse — dalla semplice lettura dell'ora al calcolo di scadenze complesse.

Per approfondire: [[wiki/concepts/tool-use|Tool Use]].

## Environment inspection: Claude è "cieco" senza feedback

Claude non ha percezione diretta dello stato del mondo esterno. Ogni azione — cliccare un pulsante, modificare un file, chiamare un'API — può avere esiti diversi, e senza feedback Claude non sa cosa è successo ([[wiki/sources/2026-05-08-environment-inspection|Environment Inspection]]).

Il principio guida è "read before write": prima di modificare un file bisogna leggerne il contenuto; prima di compiere azioni UI bisogna ricevere uno screenshot; dopo ogni chiamata API bisogna verificare la risposta.

Meccanismi concreti:
- Screenshot dopo interazioni UI (computer use).
- Lettura del file prima di qualsiasi modifica.
- Verifica delle risposte API.
- Validazione dell'output generato rispetto ai requisiti.

Domanda progettuale da porsi sempre: "Come farà Claude a sapere se questa azione ha funzionato?"

## Vantaggi degli agenti

- Esperienza utente più flessibile e adattiva.
- Gestione di situazioni nuove non anticipate durante lo sviluppo.
- Capacità di combinare tool in modi creativi e inaspettati.
- Possibilità di chiedere input aggiuntivi all'utente quando necessario.
- Un agente ben progettato, una volta creato, può essere deployato per risolvere una vasta gamma di problemi ([[wiki/sources/2026-05-08-agents-and-tools|Agents and Tools]]).

## Svantaggi degli agenti

- Tasso di completamento dei task inferiore rispetto ai workflow.
- Difficile da instrumentare, testare e valutare (il percorso di esecuzione è variabile).
- Comportamento meno prevedibile.
- Costo computazionale potenzialmente più elevato (più chiamate, più iterazioni).

## Quando usare un agente

Usare un agente quando:
- I task o i parametri dei task sono incerti o imprevedibili.
- Il numero e la natura degli step non è determinabile in anticipo.
- Si devono gestire situazioni nuove che non possono essere coperte da un workflow predefinito.
- La flessibilità dell'esperienza utente ha priorità sulla prevedibilità assoluta.

Non usare un agente se si riesce a scrivere un workflow: i workflow producono risultati più affidabili e testabili ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]).

## Vedi anche
- [[wiki/concepts/tool-use|Tool Use]] — come Claude interagisce con i tool
- [[wiki/concepts/workflow-patterns|Workflow Patterns]] — l'alternativa strutturata agli agenti
