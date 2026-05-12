---
title: MCP Tools
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [mcp, tool-use, fastmcp]
sources: [2026-05-08-defining-tools-with-mcp, 2026-05-08-mcp-server-inspector]
---

## Definizione

Gli MCP Tools sono la primitiva di *azione* del [[wiki/concepts/mcp-protocol|Model Context Protocol]]: permettono a Claude di eseguire operazioni su servizi esterni attraverso un MCP server. Corrispondono ai tool classici di [[wiki/concepts/tool-use|Tool Use]], ma la loro definizione è demandata al server e non scritta manualmente dal developer dell'applicazione ([[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]]).

## Definizione con FastMCP (Python SDK)

Il Python MCP SDK fornisce `FastMCP`, che trasforma la creazione di tool da un processo verboso (schema JSON manuale) a qualcosa di naturale per i developer Python:

```python
from mcp.server.fastmcp import FastMCP
from pydantic import Field

mcp = FastMCP("DocumentMCP", log_level="ERROR")

@mcp.tool(
    name="read_doc_contents",
    description="Read the contents of a document and return it as a string."
)
def read_document(
    doc_id: str = Field(description="Id of the document to read")
):
    return docs[doc_id]
```

Il decoratore `@mcp.tool()` + i type hint Python + `Field` di Pydantic generano automaticamente lo schema JSON che Claude utilizza. Non è necessario scrivere manualmente la struttura JSON come nell'approccio [[wiki/concepts/tool-schema|Tool Schema]] tradizionale ([[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]]).

## Vantaggi rispetto allo schema manuale

- **Schema auto-generato**: i type hint Python diventano lo schema JSON.
- **Descrizioni tramite Field**: `Field(description="...")` documenta ogni parametro per Claude.
- **Validazione integrata**: Pydantic valida gli input automaticamente.
- **Meno boilerplate**: focus sulla logica di business, non sul protocollo.
- **Type safety e supporto IDE** durante lo sviluppo.

## Testing con MCP Inspector

I tool definiti possono essere testati in isolamento usando il browser-based inspector incluso nel SDK ([[wiki/sources/2026-05-08-mcp-server-inspector|The Server Inspector]]):

```
mcp dev mcp_server.py
```

Apre un'interfaccia su `localhost:6277` dove è possibile: listare i tool, inserire parametri ed eseguirli senza dover configurare un'applicazione completa.

## Differenza da Tool Schema manuale

Nell'approccio tradizionale ([[wiki/concepts/tool-schema|Tool Schema]]), il developer scrive a mano il JSON schema con `name`, `description`, `input_schema` e i parametri. Con MCP Tools + FastMCP, questa struttura viene generata automaticamente dal codice Python, eliminando la duplicazione tra codice e schema.
