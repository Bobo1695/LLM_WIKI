---
title: The MCP Server Inspector
type: source
source_path: raw/incoming/The server inspector.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, debugging, testing, inspector, dev-tools]
---

## TL;DR
- Il Python MCP SDK include un inspector browser-based per testare il server senza collegarlo a un'applicazione.
- Si avvia con `mcp dev mcp_server.py` → apre localhost:6277 nel browser.
- Permette di testare tool, resource e prompt in isolamento, accelerando lo sviluppo.
- L'interfaccia è in evoluzione attiva; il layout potrebbe cambiare ma le funzionalità core rimangono.

## Punti chiave

- **Comando di avvio**: `mcp dev mcp_server.py` (assicurarsi che l'ambiente Python sia attivato).
- **Porta**: 6277 (localhost); l'inspector apre una dashboard nel browser.
- **Workflow nell'inspector**:
  1. Clicca "Connect" per avviare il server MCP.
  2. Usa la navigation bar (Resources, Prompts, Tools).
  3. Click "List Tools" per vedere i tool disponibili.
  4. Seleziona un tool, inserisci i parametri, clicca "Run Tool".
- **Test concatenati**: si può testare una sequenza (es. edit_document → read_doc_contents) per verificare che le modifiche siano avvenute correttamente.
- **Development loop**: modifica codice → testa nell'inspector → verifica risultati → debug in isolamento; non serve configurare Claude o un'app completa.
- **Nota**: l'interfaccia è in sviluppo attivo; le screenshot potrebbero non corrispondere alla versione attuale.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
[[wiki/concepts/mcp-tools|MCP Tools]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]]

## Citazioni notevoli
> "This tool becomes essential as you build more complex MCP servers. It eliminates the need to wire up your server to Claude or another application just to test basic functionality, making development much faster and more focused."

## Connessioni
- Complementare a [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]]: dopo aver definito i tool, li si testa qui.
- Utile anche per testare le resource di [[wiki/sources/2026-05-08-defining-mcp-resources|Defining Resources]] e i prompt di [[wiki/sources/2026-05-08-defining-mcp-prompts|Defining Prompts]].
