---
title: Defining Tools with MCP
type: source
source_path: raw/incoming/Defining tools with MCP.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, tool-use, fastmcp, python-sdk, pydantic]
---

## TL;DR
- Con il Python MCP SDK (FastMCP), definire un tool richiede solo il decoratore `@mcp.tool()` e i type hint: lo schema JSON viene generato automaticamente.
- Zero scrittura manuale di JSON schema: Pydantic + Field gestisce la validazione e le descrizioni dei parametri.
- Il server di esempio gestisce documenti in memoria con due tool: `read_doc_contents` e `edit_document`.
- Error handling base: si lancia `ValueError` con messaggio descrittivo quando un doc_id non esiste.

## Punti chiave

- **Inizializzazione server**: `mcp = FastMCP("DocumentMCP", log_level="ERROR")` — una sola riga.
- **Decoratore tool**: `@mcp.tool(name="...", description="...")` trasforma una funzione Python in un tool MCP con schema auto-generato.
- **Field di Pydantic**: ogni parametro usa `Field(description="...")` per fornire descrizioni comprensibili a Claude.
- **Tool `read_doc_contents`**: accetta `doc_id: str`, ritorna il contenuto del documento o lancia `ValueError`.
- **Tool `edit_document`**: accetta `doc_id`, `old_str`, `new_str`; esegue find-and-replace sul documento.
- **Benefici rispetto allo schema manuale**:
  - Generazione automatica dello schema JSON dai type hint.
  - Codice più leggibile e manutenibile.
  - Validazione built-in con Pydantic.
  - Type safety e supporto IDE.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-tools|MCP Tools]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/tool-schema|Tool Schema]], [[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "Instead of writing lengthy JSON schemas, you use Python decorators and type hints."

> "The MCP Python SDK transforms what used to be a complex process of writing tool definitions into something that feels natural for Python developers. You focus on the business logic while the SDK handles the protocol details."

## Connessioni
- Mostra l'approccio alternativo alla scrittura manuale degli schema descritta in [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]].
- I tool definiti qui vengono testati in [[wiki/sources/2026-05-08-mcp-server-inspector|The Server Inspector]] e usati via client in [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing a Client]].
