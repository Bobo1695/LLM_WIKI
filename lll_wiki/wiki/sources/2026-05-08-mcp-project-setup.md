---
title: MCP Project Setup
type: source
source_path: raw/incoming/Project setup.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, setup, progetto, cli, python]
---

## TL;DR
- Il progetto didattico è una CLI chatbot che permette di interagire con documenti in memoria via MCP.
- Struttura: MCP client (`mcp_client.py`) + MCP server (`mcp_server.py`) + entry point (`main.py`).
- In produzione si implementa tipicamente *o* il client *o* il server, non entrambi.
- Setup: chiave API in `.env`, dipendenze con UV o pip, avvio con `uv run main.py`.

## Punti chiave

- **Obiettivo del progetto**: costruire un chatbot CLI per gestire documenti; il server espone due tool: lettura e aggiornamento documenti; i documenti sono in memoria (no DB).
- **Architettura reale**: normalmente si sceglie uno dei due ruoli:
  - Creare un MCP server per esporre un servizio ad altri developer.
  - Creare un MCP client per connettersi a MCP server esistenti.
- **Scopo didattico**: implementare entrambi i componenti nello stesso progetto per capire come comunicano tra loro.
- **File principali**: `main.py` (entry point), `mcp_client.py` (client), `mcp_server.py` (server).
- **Comandi di avvio**:
  ```
  uv run main.py       # raccomandato (UV)
  python main.py       # alternativa standard
  ```
- **Verifica setup**: il chatbot risponde a domande semplici (es. "what's 1+1?") confermando che Claude è raggiungibile.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]]

## Citazioni notevoli
> "In real-world projects, you typically implement either an MCP client or an MCP server, not both."

> "We're building both components in this project purely for educational purposes - to understand how they communicate and work together."

## Connessioni
- Fornisce la base pratica per le lezioni successive: [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools]], [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing a Client]], [[wiki/sources/2026-05-08-defining-mcp-resources|Defining Resources]].
- Il setup con UV e `.env` è consistente con quello visto in [[wiki/sources/2026-05-07-getting-an-api-key|Getting an API Key]].
