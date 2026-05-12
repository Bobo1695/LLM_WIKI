---
title: Introducing MCP
type: source
source_path: raw/incoming/Introducing MCP.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, architettura, tool-use, introduzione]
---

## TL;DR
- MCP (Model Context Protocol) è un layer di comunicazione che fornisce a Claude contesto e strumenti senza dover scrivere codice di integrazione da zero.
- Invece di implementare manualmente ogni tool con schema e funzione, si usa un MCP server pre-costruito che espone già tutto il necessario.
- Chiunque può creare un MCP server; spesso i provider stessi (es. AWS) rilasciano implementazioni ufficiali.
- MCP e tool use sono concetti complementari ma distinti: MCP riguarda *chi* costruisce e mantiene i tool.

## Punti chiave

- **Problema**: costruire un chatbot GitHub richiederebbe decine di tool (repositories, pull request, issues, progetti) con schema e implementazione per ognuno.
- **Soluzione MCP**: i tool sono già definiti e implementati dentro un MCP server dedicato; il developer si limita a connettersi.
- **Architettura base**: MCP Client (il tuo server) ↔ MCP Server (wrapper di servizi esterni con tools, prompts, resources).
- **Differenza chiave**: chiamare un'API direttamente richiede di scrivere le tool definitions; con MCP quelle definizioni sono già presenti nel server.
- **Misconception comune**: MCP non è solo tool use — è una questione di distribuzione e riuso delle integrazioni.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/tool-use|Tool Use]]

## Citazioni notevoli
> "MCP shifts the burden of tool definitions and execution away from your server to specialized MCP servers."

> "MCP servers provide tool schemas and functions already defined for you, eliminating the need to build and maintain complex integrations yourself."

> "MCP is about who does the work of creating and maintaining the tools."

## Connessioni
- Introduce i concetti sviluppati in [[wiki/sources/2026-05-08-mcp-clients|MCP Clients]], [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]] e [[wiki/sources/2026-05-08-mcp-review|MCP Review]].
- Si collega a [[wiki/sources/2026-05-08-introducing-tool-use|Introducing Tool Use]] come estensione naturale del tool use classico verso un modello distribuito.
