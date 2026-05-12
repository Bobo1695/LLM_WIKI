---
title: Routing Workflows
type: source
source_path: raw/incoming/Routing workflows.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, agents, workflows, routing, pattern, categorization]
---

## TL;DR
- Il routing categorizza l'input dell'utente e lo instrada verso una pipeline specializzata, anziché usare un prompt generico unico.
- Il processo avviene in due step: prima Claude classifica la richiesta, poi usa il template ottimizzato per quella categoria.
- Ogni pipeline può avere workflow, prompt e tool ottimizzati per il suo specifico caso d'uso.
- È particolarmente utile per applicazioni che gestiscono tipi di richieste diverse (customer service, content generation).

## Punti chiave

### Il problema dei prompt generici
- Uno stesso prompt generico non può gestire efficacemente richieste molto diverse.
- Esempio: "programmazione" (richiede contenuto educativo) e "surf" (richiede contenuto entertainement) richiedono approcci narrativi completamente diversi.

### Impostazione delle categorie
Esempio di categorie per un tool di marketing per social media:
- **Entertainment**: contenuto ad alta energia, culturalmente rilevante, linguaggio trendy.
- **Educational**: spiegazioni chiare e coinvolgenti con esempi relatable.
- **Comedy**: contenuto affilato e inaspettato con osservazioni intelligenti.
- **Personal vlog**: contenuto autentico e intimo con storytelling conversazionale.
- **Reviews**: contenuto decisivo basato sull'esperienza, evidenzia punti di forza e debolezze.
- **Storytelling**: contenuto immersivo con dettagli vividi e connessione emotiva.

### Come funziona il routing in pratica
1. **Categorizzazione**: l'input dell'utente viene inviato a Claude con la richiesta di classificarlo in una delle categorie predefinite.
2. **Processing specializzato**: la categoria risultante viene usata per selezionare il template di prompt appropriato e generare il contenuto.

Esempio di prompt di categorizzazione:
```
Categorize the topic of a video into one of the listed categories:
<topic>Python functions</topic>
<categories>
- Educational
- Entertainment
- Comedy
- Personal vlog
- Reviews
- Storytelling
</categories>
```
Claude risponde "Educational" e il sistema usa il template educativo per generare il contenuto.

### Architettura del routing workflow
- L'input dell'utente va prima al componente router.
- Il router categorizza la richiesta tramite una chiamata iniziale a Claude.
- In base alla categoria, l'input viene inoltrato a una pipeline specifica.
- L'input va a **una sola** pipeline specializzata, non a tutte.

### Quando usare il routing
- L'applicazione gestisce tipi diversi di richieste che richiedono approcci differenti.
- Si possono definire categorie chiare che coprono i casi d'uso.
- La categorizzazione può essere gestita in modo affidabile da Claude.
- Il beneficio del processing specializzato supera l'overhead del passo di routing.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
- [[wiki/concepts/workflow-patterns|Workflow Patterns]]
- [[wiki/concepts/agent-systems|Agenti AI]]

## Citazioni notevoli
> "Routing workflows solve a common problem in AI applications: different types of user requests need different handling approaches. Instead of using a one-size-fits-all prompt, you can categorize incoming requests and route them to specialized processing pipelines."

> "The key insight is that user input only goes to one specialized pipeline, not all of them. This allows each pipeline to be highly optimized for its specific use case."

## Connessioni
- È il terzo pattern fondamentale dei workflow, accanto a parallelizzazione ([[wiki/sources/2026-05-08-parallelization-workflows|Parallelization Workflows]]) e chaining ([[wiki/sources/2026-05-08-chaining-workflows|Chaining Workflows]]).
- Il passo di categorizzazione è un utilizzo di Claude in modalità classificazione, tecnica che si sovrappone concettualmente al tool use descritti in [[wiki/sources/2026-05-08-agents-and-tools|Agents and Tools]].
- Tutti e tre i pattern sono sintetizzati in [[wiki/concepts/workflow-patterns|Workflow Patterns]].
