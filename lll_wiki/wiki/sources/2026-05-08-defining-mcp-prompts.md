---
title: Defining MCP Prompts
type: source
source_path: raw/incoming/Defining prompts.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, prompts, template, fastmcp, best-practices]
---

## TL;DR
- I MCP Prompt sono template di istruzioni pre-costruite e testate che i client possono usare in luogo di prompt scritti dall'utente.
- Decoratore `@mcp.prompt(name, description)`, la funzione ritorna una lista di `base.Message`.
- I parametri vengono interpolati nella stringa del prompt prima di restituire i messaggi.
- Scopo: fornire qualità e consistenza che l'utente non otterrebbe scrivendo il prompt da solo.

## Punti chiave

- **Motivazione**: un utente potrebbe scrivere "converti report.pdf in markdown", ma un prompt pre-testato con istruzioni specifiche su formattazione, struttura e output produce risultati migliori e più consistenti.
- **Struttura di un prompt MCP**:
  1. Decoratore `@mcp.prompt(name="...", description="...")`.
  2. Funzione con parametri tipizzati (Pydantic Field).
  3. Ritorno: lista di `base.Message` (es. `base.UserMessage(testo)`).
- **Importazione necessaria**: `from mcp.server.fastmcp import base`.
- **Esempio — format document**:
  ```python
  @mcp.prompt(name="format", description="Rewrites the contents of the document in Markdown format.")
  def format_document(doc_id: str = Field(description="Id of the document to format")) -> list[base.Message]:
      prompt = f"Your goal is to reformat a document... {doc_id} ..."
      return [base.UserMessage(prompt)]
  ```
- **Testing**: nell'MCP Inspector → sezione Prompts → seleziona prompt → inserisci parametri → verifica i messaggi generati.
- **Best practices**:
  - Istruzioni dettagliate e specifiche (non vaghe).
  - Testare con input diversi prima del deploy.
  - Descrizioni chiare per orientare l'utente.
  - Progettare in sinergia con i tool e le risorse del server.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-prompts|MCP Prompts]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]], [[wiki/concepts/system-prompt|System Prompt]]

## Citazioni notevoli
> "Think of them as carefully crafted templates that give better results than what users might come up with on their own."

> "Remember that prompts are meant to provide value that users couldn't easily get on their own - they should represent your expertise in the domain your MCP server covers."

## Connessioni
- Lato server dei prompt; il lato client è in [[wiki/sources/2026-05-08-mcp-prompts-client|Prompts in the Client]].
- Differisce dai [[wiki/concepts/system-prompt|System Prompt]] perché è parametrizzato, riusabile e versionato nel server.
- Testabile con il tool descritto in [[wiki/sources/2026-05-08-mcp-server-inspector|The Server Inspector]].
