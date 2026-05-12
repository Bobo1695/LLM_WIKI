---
title: Model Context Protocol (MCP)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [mcp, protocollo, tool-use, architettura]
sources: [2026-05-08-introducing-mcp, 2026-05-08-mcp-clients, 2026-05-08-mcp-review, 2026-05-08-mcp-enhancements]
---

## Cos'è MCP

Il Model Context Protocol (MCP) è un layer di comunicazione standardizzato che consente a un AI client di connettersi a MCP server specializzati per accedere a tool, risorse e prompt pre-costruiti ([[wiki/sources/2026-05-08-introducing-mcp|Introducing MCP]]). L'obiettivo è eliminare il lavoro ripetitivo di scrivere, testare e mantenere integrazioni da zero.

## Il problema che risolve

Senza MCP, costruire un chatbot che accede a un servizio esterno (es. GitHub) richiede di scrivere manualmente decine di tool: schema JSON + funzione di implementazione per ogni operazione (repository, pull request, issues, progetti…). Con MCP, quei tool sono già definiti e implementati dentro un MCP server dedicato. Il developer si limita a connettersi al server e ottiene immediatamente accesso a 50+ tool pronti all'uso ([[wiki/sources/2026-05-08-introducing-mcp|Introducing MCP]]).

La distinzione chiave: MCP non è semplicemente [[wiki/concepts/tool-use|Tool Use]] — è una questione di *chi* costruisce e mantiene i tool. Con MCP, qualcun altro ha già fatto quel lavoro.

## Architettura e Transport

Un sistema MCP si compone di:

- **MCP Client** — il bridge nel codice dell'applicazione; astrae il protocollo di comunicazione.
- **MCP Server** — espone tool, resources e prompt; funge da wrapper intorno a servizi esterni.

MCP è *transport-agnostic*: client e server possono comunicare tramite:
- **stdio** (locale) — il setup più comune, client e server sullo stesso processo.
- **HTTP** — per architetture distribuite.
- **WebSocket** — per comunicazione bidirezionale in tempo reale.

## Primitivi MCP

MCP definisce tre tipi di primitive che un server può esporre ([[wiki/sources/2026-05-08-mcp-enhancements|Enhancements with MCP Servers]]):

1. **[[wiki/concepts/mcp-tools|Tools]]** — azioni che Claude può eseguire (es. leggere un documento, aprire un ticket Jira).
2. **[[wiki/concepts/mcp-resources|Resources]]** — dati accessibili in read-only via URI (es. lista documenti, contenuto file).
3. **[[wiki/concepts/mcp-prompts|Prompts]]** — template di istruzioni pre-costruite e parametrizzate.

## Flusso di comunicazione

1. Il client invia `ListToolsRequest` → il server risponde con `ListToolsResult`.
2. Il server applicativo invia tool + query a Claude.
3. Claude risponde con una `tool_use` request.
4. Il client invia `CallToolRequest` al server MCP → riceve `CallToolResult`.
5. Il risultato viene inviato di ritorno a Claude per la risposta finale.

## Ecosistema

L'ecosistema MCP include server ufficiali e community per: GitHub, Sentry, Playwright, Figma, Jira/Confluence, Slack, Firecrawl e molti altri ([[wiki/sources/2026-05-08-mcp-enhancements|Enhancements with MCP Servers]]). Chiunque può pubblicare un MCP server; spesso i provider stessi rilasciano implementazioni ufficiali.

## MCP vs Tool Use classico

| Aspetto | Tool Use standard | MCP |
|---|---|---|
| Chi scrive i tool | Il developer dell'app | Il maintainer dell'MCP server |
| Schema JSON | Manuale (verboso) | Auto-generato dal SDK |
| Riuso | Limitato al progetto | Distribuibile a tutti i client MCP |
| Manutenzione | A carico tuo | A carico del server maintainer |

Per la scrittura manuale degli schema vedere [[wiki/concepts/tool-schema|Tool Schema]].
