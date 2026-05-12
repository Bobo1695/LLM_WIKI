---
title: Accessing MCP Resources
type: source
source_path: raw/incoming/Accessing resources.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, resources, client, async, pydantic]
---

## TL;DR
- Il metodo `read_resource(uri)` nel client MCP recupera una risorsa dal server tramite URI.
- Il client gestisce il parsing del contenuto in base al MIME type (JSON → dict, testo → str).
- Le risorse permettono di iniettare dati direttamente nel prompt senza bisogno di tool call.
- Import necessari: `json` e `AnyUrl` da Pydantic per il type handling dell'URI.

## Punti chiave

- **Implementazione `read_resource`**:
  ```python
  async def read_resource(self, uri: str) -> Any:
      result = await self.session().read_resource(AnyUrl(uri))
      resource = result.contents[0]
  ```
- **Parsing per MIME type**:
  ```python
  if isinstance(resource, types.TextResourceContents):
      if resource.mimeType == "application/json":
          return json.loads(resource.text)
      return resource.text
  ```
- **Efficienza**: il contenuto della risorsa viene incluso direttamente nel prompt a Claude, eliminando la necessità di un round-trip di tool use.
- **Flusso di utilizzo**: l'utente digita `@report.pdf` → la CLI mostra l'autocomplete → il contenuto viene iniettato nel prompt → Claude riceve il documento già nel contesto.
- **Separation of concerns**: il client gestisce la comunicazione con il server; la logica applicativa decide come usare i dati ricevuti.
- **Imports richiesti**: `import json` + `from pydantic import AnyUrl`.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-resources|MCP Resources]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]]

## Citazioni notevoli
> "Resources in MCP allow your server to expose data that can be directly included in prompts, rather than requiring tool calls to access information."

> "The key advantage is that Claude receives the document content directly in the prompt, eliminating the need for tool calls to access the information."

## Connessioni
- Lato client delle resource definite in [[wiki/sources/2026-05-08-defining-mcp-resources|Defining Resources]].
- Parallelo con `list_tools()` e `call_tool()` implementati in [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing a Client]].
- Il pattern di iniezione diretta nel prompt ricorda la tecnica del context window riempito discussa in relazione a [[wiki/concepts/rag|RAG]].
