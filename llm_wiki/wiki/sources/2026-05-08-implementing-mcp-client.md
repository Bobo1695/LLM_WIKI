---
title: Implementing an MCP Client
type: source
source_path: raw/incoming/Implementing a client.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, client, python-sdk, implementazione, async]
---

## TL;DR
- Il client MCP è composto da due parti: una classe custom `MCPClient` e la `ClientSession` del SDK.
- I due metodi core sono `list_tools()` e `call_tool()`, entrambi asincroni.
- La classe custom gestisce la pulizia delle risorse (cleanup) della sessione in modo automatico.
- In produzione si implementa di solito solo il client o solo il server, non entrambi.

## Punti chiave

- **Architettura del client**:
  - `MCP Client` — classe custom che semplifica l'uso della sessione e gestisce il cleanup.
  - `Client Session` — connessione effettiva al server, parte del Python MCP SDK.
- **Metodo `list_tools()`**:
  ```python
  async def list_tools(self) -> list[types.Tool]:
      result = await self.session().list_tools()
      return result.tools
  ```
- **Metodo `call_tool()`**:
  ```python
  async def call_tool(self, tool_name: str, tool_input: dict) -> types.CallToolResult | None:
      return await self.session().call_tool(tool_name, tool_input)
  ```
- **Test del client**: si istanzia `MCPClient(command="uv", args=["run", "mcp_server.py"])` e si chiamano i metodi; il server si avvia automaticamente.
- **Flusso integrato**:
  1. Il client ottiene la lista tool dal server.
  2. Tool + query vengono inviati a Claude.
  3. Claude richiede un tool use.
  4. Il client esegue il tool sul server.
  5. Il risultato torna a Claude per la risposta finale.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "The client acts as the bridge between our application logic and the MCP server, making it easy to access server functionality without worrying about the underlying connection details."

## Connessioni
- Implementa praticamente il flusso teorico descritto in [[wiki/sources/2026-05-08-mcp-clients|MCP Clients]].
- Usa i tool definiti in [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]].
- Il pattern async è coerente con l'approccio visto in [[wiki/sources/2026-05-07-response-streaming|Response Streaming]].
