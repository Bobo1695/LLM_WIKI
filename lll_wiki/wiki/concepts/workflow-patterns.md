---
title: Workflow Patterns (Agentic)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [agents, workflows, pattern, architettura]
sources: [2026-05-08-agents-and-workflows, 2026-05-08-parallelization-workflows, 2026-05-08-chaining-workflows, 2026-05-08-routing-workflows, 2026-05-08-workflows-vs-agents]
---

## Cos'è un workflow

Un workflow è una sequenza predefinita di chiamate a Claude progettata per risolvere un problema noto attraverso step determinati in anticipo dal developer ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]). A differenza degli agenti, ogni passo è pianificato: Claude si concentra su un sotto-task alla volta, portando a maggiore accuratezza, prevedibilità e facilità di test.

Caratteristiche principali:
- Alta affidabilità: il comportamento è noto e verificabile.
- Testabile: si sa esattamente quali step verranno eseguiti.
- Prevedibile: si conosce il flusso completo prima dell'esecuzione.
- Ottimizzato: ogni step può essere raffinato indipendentemente.

La raccomandazione generale è di preferire i workflow ogni volta che è possibile predefinire il flusso, riservando gli agenti ai casi in cui il percorso non può essere determinato in anticipo ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]).

## Pattern 1: Parallelizzazione

**Struttura**: un task complesso viene suddiviso in sotto-task indipendenti eseguiti simultaneamente; i risultati vengono aggregati in un passo finale.

**Fasi**:
1. **Split** — il task complesso si decompone in valutazioni focalizzate e indipendenti.
2. **Run in parallel** — tutti i sotto-task vengono eseguiti contemporaneamente.
3. **Aggregate** — i risultati paralleli confluiscono in una decisione finale.

**Esempio pratico** ([[wiki/sources/2026-05-08-parallelization-workflows|Parallelization Workflows]]): un'applicazione di material design riceve l'immagine di un componente e deve raccomandare il materiale migliore. Invece di un unico prompt con tutti i criteri, vengono inviate 6 richieste simultanee — una per metallo, una per polimero, una per ceramica, ecc. — ognuna con criteri specializzati. I 6 risultati vengono poi aggregati da un passo finale che emette la raccomandazione.

**Nota chiave**: i sotto-task paralleli non devono essere identici; ognuno può avere prompt, tool e criteri distinti.

**Vantaggi**: attenzione focalizzata, ottimizzazione indipendente dei singoli sotto-task, scalabilità (aggiungere un nuovo caso = aggiungere una richiesta), affidabilità maggiore.

**Quando usare**: task che possono essere scomposti in valutazioni indipendenti — valutazione di criteri multipli, confronto tra opzioni, decisioni che coinvolgono domini diversi.

## Pattern 2: Chaining

**Struttura**: il task viene scomposto in step sequenziali dove l'output di ogni passo alimenta il successivo. Tra uno step e l'altro possono essere inserite elaborazioni non-LLM (validazioni, trasformazioni, chiamate API).

**Esempio pratico** ([[wiki/sources/2026-05-08-chaining-workflows|Chaining Workflows]]): creazione automatica di video per social media — trova topic trending → seleziona topic (Claude) → ricerca topic (Claude) → scrive script (Claude) → genera video → pubblica.

**Caso d'uso specifico — Evaluator-Optimizer** ([[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]]):
- **Step 1 (Producer)**: genera l'output iniziale (es. articolo, modello 3D).
- **Step 2 (Grader)**: valuta l'output rispetto a criteri definiti.
- **Step 3 (Feedback loop)**: se non accettato, il feedback ritorna al Producer; il ciclo si ripete.

Il chaining è particolarmente prezioso quando un unico prompt lungo porta Claude a ignorare sistematicamente alcuni vincoli. Suddividere in "genera" + "revisiona" produce risultati nettamente migliori: nel passo di revisione Claude può concentrarsi esclusivamente sulla correzione senza bilanciare anche la creazione.

**Quando usare**: task con molti requisiti, quando Claude ignora vincoli in prompt lunghi, quando si vuole validare o elaborare l'output tra i passi.

## Pattern 3: Routing

**Struttura**: l'input viene prima classificato in una categoria, poi instradato alla pipeline specializzata corrispondente. Ogni pipeline può avere workflow, prompt e tool ottimizzati per il suo caso d'uso specifico.

**Fasi**:
1. **Categorizzazione** — Claude classifica il tipo di input (es. Educational, Entertainment, Comedy).
2. **Routing** — l'input viene inoltrato alla pipeline dedicata a quella categoria.
3. **Processing specializzato** — la pipeline esegue il task con prompt e tool ottimizzati.

**Esempio pratico** ([[wiki/sources/2026-05-08-routing-workflows|Routing Workflows]]): un tool di marketing per social media riceve il topic "Python functions" → Claude lo classifica come "Educational" → il sistema usa il template educational per generare uno script con spiegazioni chiare ed esempi relatable. Lo stesso topic "surf" verrebbe classificato come "Entertainment" e produrrebbe uno script completamente diverso.

**Nota critica**: l'input dell'utente va a **una sola** pipeline specializzata, non a tutte. Questo è ciò che differenzia il routing dalla parallelizzazione.

**Quando usare**: applicazioni che gestiscono tipi diversi di richieste, quando si possono definire categorie chiare, quando il beneficio del processing specializzato supera l'overhead del passo di routing.

## Confronto workflow vs agenti

| Dimensione | Workflow | Agente |
|---|---|---|
| Accuratezza | Alta (focus su un sotto-task) | Più bassa (percorso variabile) |
| Prevedibilità | Alta | Bassa |
| Testabilità | Facile | Difficile |
| Flessibilità | Bassa | Alta |
| Gestione novità | No | Sì |
| Costo progettazione | Upfront significativo | Ridotto inizialmente |

La scelta dipende da quanto bene si conosce il task: se si può disegnare il flusso in anticipo, il workflow è sempre la scelta preferibile per la produzione ([[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]]).

## Vedi anche
- [[wiki/concepts/agent-systems|Agenti AI]] — l'alternativa flessibile ai workflow
