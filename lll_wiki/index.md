# Index

Catalogo delle pagine generate. Aggiornato a ogni ingest.

## Sources

### Meta / wiki
- [[wiki/sources/2026-05-07-llm-wiki-pattern|LLM Wiki Pattern (idea seme)]] — pattern per costruire knowledge base personali con LLM (Karpathy).
- [[wiki/sources/2026-05-07-llm-wiki-karpathy|LLM Wiki Pattern (Karpathy Gist)]] — versione Gist originale di Karpathy, duplicato con attribuzione.

### Anthropic Academy — "Claude with the Anthropic API"
- [[wiki/sources/2026-05-07-accessing-the-api|Accessing the API]] — flusso a 5 step, architettura sicura, pipeline interna di Claude.
- [[wiki/sources/2026-05-07-getting-an-api-key|Getting an API Key]] — guida step-by-step per generare la chiave da console.anthropic.com.
- [[wiki/sources/2026-05-07-making-a-request|Making a Request]] — prima chiamata Python con `client.messages.create()`.
- [[wiki/sources/2026-05-07-multi-turn-conversations|Multi-Turn Conversations]] — Claude è stateless; il client mantiene la history.
- [[wiki/sources/2026-05-07-system-prompts|System Prompts]] — parametro `system=` per ruolo e comportamento.
- [[wiki/sources/2026-05-07-system-prompts-exercise|System Prompts Exercise]] — stub (video non processato).
- [[wiki/sources/2026-05-07-temperature|Temperature]] — parametro `temperature` [0–1] per creatività vs determinismo.
- [[wiki/sources/2026-05-07-response-streaming|Response Streaming]] — output token-by-token per miglior UX.
- [[wiki/sources/2026-05-07-structured-data|Structured Data]] — assistant prefilling + stop sequences per output pulito.
- [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]] — problema senza tool, flusso base a 4 passi, benefici.
- [[wiki/sources/2026-05-08-tool-use-project-overview|Tool Use Project Overview]] — progetto reminder con 3 tool: datetime, duration, set_reminder.
- [[wiki/sources/2026-05-08-tool-functions|Tool Functions]] — tool function come funzione Python; best practice validazione input.
- [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]] — struttura JSON Schema (name, description, input_schema); generazione assistita.
- [[wiki/sources/2026-05-08-handling-message-blocks|Handling Message Blocks]] — risposta multi-blocco (TextBlock + ToolUseBlock); gestione history.
- [[wiki/sources/2026-05-08-sending-tool-results|Sending Tool Results]] — ToolResultBlock, abbinamento ID, follow-up con schema obbligatorio.
- [[wiki/sources/2026-05-08-multi-turn-with-tools|Multi-Turn Conversations with Tools]] — loop di conversazione, refactoring helper, text_from_message.
- [[wiki/sources/2026-05-08-implementing-multiple-turns|Implementing Multiple Turns]] — stop_reason=="tool_use", run_tools, error handling, routing scalabile.
- [[wiki/sources/2026-05-08-using-multiple-tools|Using Multiple Tools]] — integrazione 3 tool nel progetto finale; pattern modulare di aggiunta.
- [[wiki/sources/2026-05-08-fine-grained-tool-calling|Fine-Grained Tool Calling]] — streaming + tool use; InputJsonEvent; fine_grained=True disabilita validazione JSON.
- [[wiki/sources/2026-05-08-text-edit-tool|The Text Edit Tool]] — tool built-in per operazioni file; schema version-specific; implementazione a carico dell'utente.
- [[wiki/sources/2026-05-08-web-search-tool|The Web Search Tool]] — tool built-in web search; schema web_search_20250305; max_uses, allowed_domains, citation blocks.
- [[wiki/sources/2026-05-08-introducing-rag|Introducing RAG]] — problema dei documenti grandi, vantaggi e sfide del pattern RAG.
- [[wiki/sources/2026-05-08-text-chunking-strategies|Text Chunking Strategies]] — size-based, structure-based, semantic-based: scelta in base al tipo di documento.
- [[wiki/sources/2026-05-08-text-embeddings|Text Embeddings]] — vettori numerici del significato semantico; VoyageAI come provider raccomandato.
- [[wiki/sources/2026-05-08-full-rag-flow|The Full RAG Flow]] — pipeline end-to-end: chunking → embedding → vector DB → query → risposta.
- [[wiki/sources/2026-05-08-implementing-rag-flow|Implementing the RAG Flow]] — implementazione Python a 5 step con VectorIndex.
- [[wiki/sources/2026-05-08-bm25-lexical-search|BM25 Lexical Search]] — ricerca lessicale per match esatti; complementare alla semantic search.
- [[wiki/sources/2026-05-08-multi-index-rag-pipeline|A Multi-Index RAG Pipeline]] — classe Retriever con RRF per fondere VectorIndex e BM25Index.
- [[wiki/sources/2026-05-08-citations|Citations]] — abilitare citazioni puntuali nella risposta API con `"citations": {"enabled": True}`.
- [[wiki/sources/2026-05-08-citations-implementation|Citations (Implementation)]] — duplicato di Citations con stesso contenuto.
- [[wiki/sources/2026-05-08-prompt-evaluation|Prompt Evaluation]] — metodologie per valutare e migliorare i prompt.
- [[wiki/sources/2026-05-08-eval-workflow|Eval Workflow]] — workflow a 5 step: draft → dataset → Claude → grader → iterate.
- [[wiki/sources/2026-05-08-generating-test-datasets|Generating Test Datasets]] — generare dataset di test automaticamente con Claude (prefilling + stop sequences).
- [[wiki/sources/2026-05-08-running-the-eval|Running the Eval]] — implementazione pipeline: run_prompt / run_test_case / run_eval.
- [[wiki/sources/2026-05-08-model-based-grading|Model Based Grading]] — grader con Claude come giudice; scoring JSON strutturato 1–10.
- [[wiki/sources/2026-05-08-code-based-grading|Code Based Grading]] — validazione sintattica (JSON/Python/Regex); combinazione score code+model.
- [[wiki/sources/2026-05-08-prompt-engineering|Prompt Engineering]] — ciclo iterativo con metriche; esempio meal planning da 2.3 a 7.8.
- [[wiki/sources/2026-05-08-being-clear-and-direct|Being Clear and Direct]] — prima riga critica; action verb; linguaggio semplice e diretto.
- [[wiki/sources/2026-05-08-being-specific|Being Specific]] — output guidelines + process steps; specificità da 3.9 a 7.8 di score.
- [[wiki/sources/2026-05-08-structure-with-xml-tags|Structure with XML Tags]] — tag XML per separare istruzioni da dati in prompt complessi.
- [[wiki/sources/2026-05-08-providing-examples|Providing Examples]] — one-shot e multi-shot; struttura con XML tags; il "why" dietro ogni esempio.
- [[wiki/sources/2026-05-08-prompt-caching|Prompt Caching]] — introduzione al caching del preprocessing per ridurre costi e latenza.
- [[wiki/sources/2026-05-08-rules-of-prompt-caching|Rules of Prompt Caching]] — regole operative: breakpoint, soglia 1024 token, TTL, invalidazione.
- [[wiki/sources/2026-05-08-prompt-caching-in-action|Prompt Caching in Action]] — implementazione pratica di caching per tool schema e system prompt.
- [[wiki/sources/2026-05-08-code-execution-files-api|Code Execution and the Files API]] — Files API + Code Execution Tool per analisi dati delegata a Claude.

### Anthropic Academy — "Agents & Workflows"
- [[wiki/sources/2026-05-08-agents-and-workflows|Agents and Workflows]] — distinzione workflow (step noti) vs agente (goal + tool generici).
- [[wiki/sources/2026-05-08-parallelization-workflows|Parallelization Workflows]] — task complessa → sotto-task parallele specializzate → aggregazione.
- [[wiki/sources/2026-05-08-chaining-workflows|Chaining Workflows]] — step sequenziali: generate → grade → revise (Evaluator-Optimizer).
- [[wiki/sources/2026-05-08-routing-workflows|Routing Workflows]] — categorizzazione input → pipeline specializzata per tipo.
- [[wiki/sources/2026-05-08-agents-and-tools|Agents and Tools]] — tool generici e combinabili per agenti; Claude decide le combinazioni.
- [[wiki/sources/2026-05-08-environment-inspection|Environment Inspection]] — ogni azione richiede ispezione del risultato; Claude è cieco senza feedback.
- [[wiki/sources/2026-05-08-workflows-vs-agents|Workflows vs Agents]] — workflow: alta affidabilità, testabile; agenti: flessibili, tasso completamento minore.

### Anthropic Academy — "MCP (Model Context Protocol)"
- [[wiki/sources/2026-05-08-introducing-mcp|Introducing MCP]] — cos'è MCP, problema che risolve, differenza da tool use custom.
- [[wiki/sources/2026-05-08-mcp-clients|MCP Clients]] — transport-agnostic, tipi di messaggio, flusso completo di comunicazione.
- [[wiki/sources/2026-05-08-mcp-project-setup|MCP Project Setup]] — progetto CLI didattico: client + server + documenti in memoria.
- [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]] — FastMCP + decoratore `@mcp.tool()` + type hint = schema auto-generato.
- [[wiki/sources/2026-05-08-mcp-server-inspector|The MCP Server Inspector]] — `mcp dev mcp_server.py` → inspector browser su localhost:6277.
- [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing an MCP Client]] — `list_tools()` e `call_tool()` asincroni; classe custom + ClientSession.
- [[wiki/sources/2026-05-08-defining-mcp-resources|Defining MCP Resources]] — resources dirette e templated con `@mcp.resource()`; MIME type.
- [[wiki/sources/2026-05-08-accessing-mcp-resources|Accessing MCP Resources]] — `read_resource(uri)` lato client; parsing per MIME type; iniezione nel prompt.
- [[wiki/sources/2026-05-08-defining-mcp-prompts|Defining MCP Prompts]] — `@mcp.prompt()`, ritorna lista messaggi; template pre-testati parametrizzati.
- [[wiki/sources/2026-05-08-mcp-prompts-client|MCP Prompts in the Client]] — `list_prompts()` e `get_prompt(name, args)`; workflow CLI con `/`.
- [[wiki/sources/2026-05-08-mcp-review|MCP Review]] — riepilogo modulo MCP (video non ancora disponibile al clipping).
- [[wiki/sources/2026-05-08-mcp-enhancements|Enhancements with MCP Servers]] — Claude Code + MCP; ecosistema server (Sentry, Playwright, Figma, Jira, Slack).

## Entities
- [[wiki/entities/anthropic|Anthropic]] — azienda AI, sviluppa Claude e l'API.
- [[wiki/entities/anthropic-academy|Anthropic Academy]] — piattaforma corsi per sviluppatori.
- [[wiki/entities/claude|Claude]] — famiglia di modelli LLM di Anthropic.
- [[wiki/entities/vannevar-bush|Vannevar Bush]] — ingegnere statunitense, autore del concetto di Memex (1945).
- [[wiki/entities/voyage-ai|VoyageAI]] — provider di text embeddings consigliato da Anthropic per pipeline RAG.

## Concepts

### Prompt Engineering & Evaluation
- [[wiki/concepts/prompt-evaluation|Prompt Evaluation]] — valutazione sistematica con pipeline eval, grader code/model/human, metriche numeriche.
- [[wiki/concepts/eval-workflow|Eval Workflow]] — 5 step: dataset → Claude → grader → score → iterate; funzioni run_prompt/run_test_case/run_eval.
- [[wiki/concepts/prompt-engineering-techniques|Tecniche di Prompt Engineering]] — chiarezza, specificità, XML tags, esempi one/multi-shot; ciclo iterativo con metriche.
- [[wiki/concepts/xml-tags-prompting|XML Tags nei Prompt]] — separazione istruzioni/dati con tag XML in prompt complessi.
- [[wiki/concepts/few-shot-prompting|Few-Shot Prompting]] — one-shot e multi-shot: esempi per catturare edge case e definire formato output.

### Anthropic API
- [[wiki/concepts/anthropic-messages-api|Anthropic Messages API]] — struttura completa della chiamata API, parametri, risposta.
- [[wiki/concepts/api-key-security|API Key Security]] — mai esporre la chiave lato client; usare `.env` + server proxy.
- [[wiki/concepts/multi-turn-stateless|Multi-Turn Stateless]] — Claude è stateless; il client invia l'intera history a ogni call.
- [[wiki/concepts/system-prompt|System Prompt]] — parametro `system=` per personalizzare comportamento e ruolo.
- [[wiki/concepts/temperature-parameter|Temperature]] — dial creatività [0.0–1.0]; tabella task per range.
- [[wiki/concepts/response-streaming|Response Streaming]] — streaming token-by-token, eventi e implementazione.
- [[wiki/concepts/assistant-prefilling|Assistant Prefilling + Stop Sequences]] — tecnica per output strutturato pulito (JSON, codice).
- [[wiki/concepts/stop-sequence|Stop Sequence]] — condizione di interruzione esplicita della generazione.
- [[wiki/concepts/prompt-caching|Prompt Caching]] — riutilizzo del preprocessing di Claude; breakpoint, TTL 1h, sconto ~90% sui token cachati.
- [[wiki/concepts/files-api|Files API]] — upload file una volta, riuso tramite ID; alternativa al base64 inline.
- [[wiki/concepts/code-execution|Code Execution Tool]] — esecuzione Python in Docker isolato; nessun accesso rete; combinato con Files API.
- [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]] — struttura name/description/input_schema; TextBlock + ToolUseBlock + ToolResultBlock.
- [[wiki/concepts/tool-use|Tool Use]] — meccanismo per estendere Claude con funzioni esterne; flusso a 4 passi; loop multi-turn su stop_reason.
- [[wiki/concepts/web-search-tool|Web Search Tool (built-in)]] — tool built-in Anthropic; schema web_search_20250305; max_uses, allowed_domains, citation blocks.
- [[wiki/concepts/text-editor-tool|Text Editor Tool (built-in)]] — tool built-in per operazioni file; schema version-specific; l'implementazione spetta all'utente.

### Model Context Protocol (MCP)
- [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]] — layer di comunicazione standard AI client ↔ MCP server; primitivi Tools/Resources/Prompts; ecosistema.
- [[wiki/concepts/mcp-tools|MCP Tools]] — primitiva di azione; FastMCP + `@mcp.tool()` + type hint; auto-schema generation.
- [[wiki/concepts/mcp-resources|MCP Resources]] — primitiva dati read-only; URI diretti e templated; iniezione nel prompt.
- [[wiki/concepts/mcp-prompts|MCP Prompts]] — template istruzioni parametrizzati; `@mcp.prompt()`; riusabili e versionati.

### LLM Internals
- [[wiki/concepts/tokenization|Tokenization e pipeline di generazione]] — tokenizzazione → embedding → contestualizzazione → generazione.

### Agents & Workflows
- [[wiki/concepts/agent-systems|Agenti AI (Agent Systems)]] — LLM + goal + tool generici; step decisi a runtime; vantaggi/svantaggi vs workflow.
- [[wiki/concepts/workflow-patterns|Workflow Patterns (Agentic)]] — parallelizzazione, chaining, routing; confronto workflow vs agenti.

### Knowledge Management
- [[wiki/concepts/memex|Memex]] — archivio personale curato con trail associativi (Bush, 1945).
- [[wiki/concepts/rag|RAG (Retrieval-Augmented Generation)]] — pattern retrieval a query-time; ora include chunking, embeddings, hybrid search, citations.
- [[wiki/concepts/text-embeddings|Text Embeddings]] — vettori numerici -1/+1 del significato semantico; cosine similarity per confronto.
- [[wiki/concepts/hybrid-search|Hybrid Search (Semantic + Lexical)]] — BM25 + semantic search fusi con Reciprocal Rank Fusion (RRF).
- [[wiki/concepts/citations-api|Citations API]] — citazioni puntuali delle fonti nella risposta Claude; struttura cited_text, document_index, page.
- [[wiki/concepts/compiled-wiki|Compiled Wiki]] — alternativa al RAG: wiki persistente mantenuto incrementalmente dall'LLM.
- [[wiki/concepts/second-brain|Second Brain]] — sistema esterno persistente di accumulo della conoscenza personale.

## Synthesis
- [[wiki/synthesis/definizione-system-prompt|Definizione e ruolo del System Prompt]] — Sintesi su ruolo, funzioni e implementazione dei system prompt in Claude.
