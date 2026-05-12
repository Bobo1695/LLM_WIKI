---
title: MCP Clients
type: source
source_path: raw/incoming/MCP clients.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, client, transport, architettura]
---

## TL;DR
- L'MCP client è il bridge di comunicazione tra la tua applicazione e gli MCP server.
- MCP è transport-agnostic: supporta stdio (stesso processo), HTTP e WebSocket.
- I tipi di messaggio principali sono `ListToolsRequest/Result` e `CallToolRequest/Result`.
- Il flusso completo coinvolge molti step ma ogni componente ha una responsabilità precisa.

## Punti chiave

- **Ruolo del client**: astrae la complessità del protocollo di comunicazione, permettendo al codice applicativo di concentrarsi sulla logica di business.
- **Transport agnostic**: stdio è il setup più comune (client e server sulla stessa macchina); alternativamente HTTP o WebSocket per scenari distribuiti.
- **Tipi di messaggio**:
  - `ListToolsRequest` / `ListToolsResult` — il client chiede al server quali tool sono disponibili.
  - `CallToolRequest` / `CallToolResult` — il client richiede l'esecuzione di un tool specifico con parametri dati.
- **Flusso completo**:
  1. L'utente invia una query al server.
  2. Il server usa il client MCP per ottenere la lista dei tool (`ListToolsRequest`).
  3. Il server invia la query + tool a Claude.
  4. Claude risponde con una richiesta di tool use.
  5. Il client MCP esegue il tool (`CallToolRequest`) sul server MCP.
  6. Il risultato fluisce indietro verso Claude.
  7. Claude formula la risposta finale.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "The MCP client serves as the communication bridge between your server and MCP servers."

> "One of MCP's key strengths is being transport agnostic - a fancy way of saying the client and server can talk to each other using different communication methods."

> "The MCP client abstracts away the complexity of server communication, letting you focus on building your application logic."

## Connessioni
- Segue concettualmente [[wiki/sources/2026-05-08-introducing-mcp|Introducing MCP]] e precede [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing a Client]].
- Il flusso descritto è messo in pratica nel progetto CLI di [[wiki/sources/2026-05-08-mcp-project-setup|Project Setup]].
