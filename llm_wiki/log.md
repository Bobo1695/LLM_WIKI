# Log

Registro cronologico append-only. Ogni entry: `## [YYYY-MM-DD HH:MM] <op> | <oggetto>`.

## [2026-05-07 00:00] bootstrap | wiki initialized
- Created: CLAUDE.md (schema)
- Created: index.md, log.md
- Created: wiki/{sources,entities,concepts,synthesis,assets}/
- Domain: generico / multi-dominio.

## [2026-05-07 00:05] ingest | LLM Wiki Pattern (idea seme)
- Source: messaggio iniziale dell'utente (filed as `wiki/sources/2026-05-07-llm-wiki-pattern.md`).
- Created: wiki/sources/2026-05-07-llm-wiki-pattern.md
- Created: wiki/entities/vannevar-bush.md
- Created: wiki/concepts/memex.md, rag.md, compiled-wiki.md, second-brain.md
- Touched 6 pagine + index.

## [2026-05-07 10:00] maintenance | Riorganizzazione raw/
- Created: raw/incoming/ (coda di lavoro, deve essere vuota dopo ogni ingest)
- Created: raw/archive/ (storico immutabile di tutte le fonti processate)
- Moved: tutti i 10 file .md già ingested → raw/archive/
- Updated: CLAUDE.md (layout + workflow ingest con step di archiviazione)

## [2026-05-07 09:00] ingest | Anthropic Academy — "Claude with the Anthropic API" (9 lezioni)
- Sources: raw/Accessing the API.md, Getting an API key.md, Making a request.md,
           Multi-Turn conversations.md, System prompts.md, System prompts exercise.md,
           Temperature.md, Response streaming.md, Structured data.md, llm-wiki.md
- Created sources (10): 2026-05-07-accessing-the-api, getting-an-api-key, making-a-request,
  multi-turn-conversations, system-prompts, system-prompts-exercise, temperature,
  response-streaming, structured-data, llm-wiki-karpathy (duplicato con attribuzione Karpathy)
- Created entities (3): anthropic.md, anthropic-academy.md, claude.md
- Created concepts (8): anthropic-messages-api.md, api-key-security.md, tokenization.md,
  temperature-parameter.md, system-prompt.md, multi-turn-stateless.md,
  response-streaming.md, assistant-prefilling.md, stop-sequence.md
- Updated: index.md
- Totale pagine toccate: 22

## [2026-05-07 16:37] query | "cosa è un system prompt"
- Read: wiki/concepts/system-prompt.md, wiki/sources/2026-05-07-system-prompts.md
- Answer filed as: [[wiki/synthesis/definizione-system-prompt.md]]
- Updated: index.md

## [2026-05-08 09:00] ingest | Anthropic Academy — Prompt Evaluation + Prompt Engineering (11 lezioni)
- Sources: raw/incoming/Prompt evaluation.md, A typical eval workflow.md, Generating test datasets.md,
           Running the eval.md, Model based grading.md, Code based grading.md,
           Prompt engineering.md, Being clear and direct.md, Being specific.md,
           Structure with XML tags.md, Providing examples.md
- Created sources (11): 2026-05-08-prompt-evaluation.md, 2026-05-08-eval-workflow.md,
  2026-05-08-generating-test-datasets.md, 2026-05-08-running-the-eval.md,
  2026-05-08-model-based-grading.md, 2026-05-08-code-based-grading.md,
  2026-05-08-prompt-engineering.md, 2026-05-08-being-clear-and-direct.md,
  2026-05-08-being-specific.md, 2026-05-08-structure-with-xml-tags.md,
  2026-05-08-providing-examples.md
- Created concepts (5): prompt-evaluation.md, eval-workflow.md, prompt-engineering-techniques.md,
  xml-tags-prompting.md, few-shot-prompting.md
- Updated concepts (1): assistant-prefilling.md (aggiunta nota uso in test dataset)
- Updated: index.md
- Totale pagine toccate: 17

## [2026-05-08 00:00] ingest | Anthropic Academy — Prompt Caching + Code Execution + Files API (4 lezioni)
- Sources: raw/incoming/Prompt caching.md, Rules of prompt caching.md,
           Prompt caching in action.md, Code execution and the Files API.md
- Created sources (4): 2026-05-08-prompt-caching.md, 2026-05-08-rules-of-prompt-caching.md,
  2026-05-08-prompt-caching-in-action.md, 2026-05-08-code-execution-files-api.md
- Created concepts (4): prompt-caching.md, files-api.md, code-execution.md, tool-schema.md
- Updated: index.md
- Totale pagine toccate: 9

## [2026-05-08 12:00] ingest | Anthropic Academy — RAG completo (9 lezioni)
- Sources: raw/incoming/Introducing Retrieval Augmented Generation.md,
           Text chunking strategies.md, Text embeddings.md, The full RAG flow.md,
           Implementing the RAG flow.md, BM25 lexical search.md,
           A Multi-Index RAG pipeline.md, Citations.md, Citations 1.md
- Created sources (9): 2026-05-08-introducing-rag.md, 2026-05-08-text-chunking-strategies.md,
  2026-05-08-text-embeddings.md, 2026-05-08-full-rag-flow.md, 2026-05-08-implementing-rag-flow.md,
  2026-05-08-bm25-lexical-search.md, 2026-05-08-multi-index-rag-pipeline.md,
  2026-05-08-citations.md, 2026-05-08-citations-implementation.md
- Created concepts (3): text-embeddings.md, hybrid-search.md, citations-api.md
- Created entities (1): voyage-ai.md
- Updated concepts (1): rag.md (aggiunta sezione Implementazione tecnica + Citations API; aggiornati sources)
- Updated: index.md, log.md
- Totale pagine toccate: 15

## [2026-05-08 14:00] ingest | Anthropic Academy — Tool Use completo (12 lezioni)
- Sources: raw/incoming/Introducing tool use.md, Project overview.md, Tool functions.md,
           Tool schemas.md, Handling message blocks.md, Sending tool results.md,
           Multi-turn conversations with tools.md, Implementing multiple turns.md,
           Using multiple tools.md, Fine grained tool calling.md,
           The text edit tool.md, The web search tool.md
- Created sources (12): 2026-05-08-introducing-tool-use.md, 2026-05-08-tool-use-project-overview.md,
  2026-05-08-tool-functions.md, 2026-05-08-tool-schemas.md, 2026-05-08-handling-message-blocks.md,
  2026-05-08-sending-tool-results.md, 2026-05-08-multi-turn-with-tools.md,
  2026-05-08-implementing-multiple-turns.md, 2026-05-08-using-multiple-tools.md,
  2026-05-08-fine-grained-tool-calling.md, 2026-05-08-text-edit-tool.md,
  2026-05-08-web-search-tool.md
- Created concepts (4): tool-use.md, tool-schema.md (aggiornato/espanso), web-search-tool.md, text-editor-tool.md
- Updated: index.md (10 nuove voci sources + 3 nuove voci concepts; stub intro+overview espansi)
- Totale pagine toccate: 18

## [2026-05-08 00:00] ingest | Anthropic Academy — MCP (Model Context Protocol) (12 lezioni)
- Sources: raw/incoming/Introducing MCP.md, MCP clients.md, Project setup.md,
           Defining tools with MCP.md, The server inspector.md, Implementing a client.md,
           Defining resources.md, Accessing resources.md, Defining prompts.md,
           Prompts in the client.md, MCP review.md, Enhancements with MCP servers.md
- Created sources (12):
  2026-05-08-introducing-mcp.md, 2026-05-08-mcp-clients.md, 2026-05-08-mcp-project-setup.md,
  2026-05-08-defining-tools-with-mcp.md, 2026-05-08-mcp-server-inspector.md,
  2026-05-08-implementing-mcp-client.md, 2026-05-08-defining-mcp-resources.md,
  2026-05-08-accessing-mcp-resources.md, 2026-05-08-defining-mcp-prompts.md,
  2026-05-08-mcp-prompts-client.md, 2026-05-08-mcp-review.md, 2026-05-08-mcp-enhancements.md
- Created concepts (4):
  wiki/concepts/mcp-protocol.md, wiki/concepts/mcp-tools.md,
  wiki/concepts/mcp-resources.md, wiki/concepts/mcp-prompts.md
- Updated: index.md, log.md
- Totale pagine toccate: 18

## [2026-05-08 16:00] ingest | Anthropic Academy — Agents & Workflows (7 lezioni)
- Sources: raw/incoming/Agents and workflows.md, Parallelization workflows.md, Chaining workflows.md,
           Routing workflows.md, Agents and tools.md, Environment inspection.md, Workflows vs agents.md
- Created sources (7): 2026-05-08-agents-and-workflows.md, 2026-05-08-parallelization-workflows.md,
  2026-05-08-chaining-workflows.md, 2026-05-08-routing-workflows.md,
  2026-05-08-agents-and-tools.md, 2026-05-08-environment-inspection.md,
  2026-05-08-workflows-vs-agents.md
- Created concepts (2): agent-systems.md, workflow-patterns.md
- Updated: index.md
- Totale pagine toccate: 9

## [2026-05-08 16:30] ingest | CONSOLIDAMENTO — Anthropic Academy batch completo (55 lezioni)
- Moduli ingested oggi: Prompt Evaluation (6), Prompt Engineering (5), Tool Use (12),
  RAG (9), Prompt Caching + Files API (4), MCP (12), Agents & Workflows (7)
- Totale sources create: 55
- Totale concepts creati: 23 (prompt-evaluation, eval-workflow, prompt-engineering-techniques,
  xml-tags-prompting, few-shot-prompting, tool-use, tool-schema, web-search-tool,
  text-editor-tool, text-embeddings, hybrid-search, citations-api, prompt-caching,
  files-api, code-execution, mcp-protocol, mcp-tools, mcp-resources, mcp-prompts,
  agent-systems, workflow-patterns)
- Totale entities create: 1 (voyage-ai)
- Concepts aggiornati: rag.md, assistant-prefilling.md
- raw/incoming/ → raw/archive/ (55 file spostati)
- Totale pagine toccate: ~82
