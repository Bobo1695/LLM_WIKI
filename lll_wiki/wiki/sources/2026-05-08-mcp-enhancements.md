---
title: Enhancements with MCP Servers
type: source
source_path: raw/incoming/Enhancements with MCP servers.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, claude-code, ecosistema, integrazioni, workflow]
---

## TL;DR
- Claude Code ha un MCP client integrato: è possibile collegare MCP server per espandere le sue capacità.
- I server si registrano con `claude mcp add [nome] [comando]` e vengono avviati automaticamente.
- L'ecosistema MCP include server per Sentry, Playwright, Figma, Jira/Confluence, Slack, web scraping.
- La potenza vera emerge dalla combinazione di più MCP server che coprono l'intero workflow di sviluppo.

## Punti chiave

- **Claude Code + MCP**: Claude Code espone già un MCP client built-in; basta aggiungere i server desiderati.
- **Comando di registrazione**:
  ```
  claude mcp add [server-name] [comando-di-avvio]
  ```
  Esempio: `claude mcp add documents uv run main.py`
- **Tre primitive esposte da ogni server**: Tools (azioni), Prompts (template), Resources (dati).
- **Esempio pratico**: server con tool `document_path_to_markdown` → Claude converte PDF/Word in markdown su richiesta.
- **Ecosistema MCP (esempi popolari)**:
  - `sentry-mcp` — bug discovery e fix automatico da Sentry.
  - `playwright-mcp` — automazione browser per testing/troubleshooting.
  - `figma-context-mcp` — espone design Figma a Claude.
  - `mcp-atlassian` — accesso a Confluence e Jira.
  - `firecrawl-mcp-server` — web scraping.
  - `slack-mcp` — post messaggi o risposte a thread Slack.
- **Workflow avanzato**: combinare Sentry (bug) + Jira (ticket) + Slack (notifica team) + server custom per creare un ambiente di sviluppo completamente integrato.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/mcp-tools|MCP Tools]], [[wiki/concepts/mcp-resources|MCP Resources]], [[wiki/concepts/mcp-prompts|MCP Prompts]]

## Citazioni notevoli
> "Claude Code has an MCP client built right into it, which means you can connect MCP servers to dramatically expand what Claude can do."

> "The real power comes from combining multiple MCP servers that match your specific development process."

## Connessioni
- Mostra l'applicazione pratica e reale di tutto il modulo MCP; riassume l'ecosistema introdotto in [[wiki/sources/2026-05-08-introducing-mcp|Introducing MCP]].
- L'approccio di combinare server specializzati rispecchia il principio di separazione delle responsabilità visto in [[wiki/sources/2026-05-08-mcp-project-setup|Project Setup]].
