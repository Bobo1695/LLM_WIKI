---
title: Defining MCP Resources
type: source
source_path: raw/incoming/Defining resources.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, resources, fastmcp, uri, mime-type]
---

## TL;DR
- Le MCP Resources espongono dati in modalità read-only (analoga a GET), a differenza dei tool che eseguono azioni.
- Due tipi: dirette (URI statico, es. `docs://documents`) e templated (URI con parametri, es. `docs://documents/{doc_id}`).
- Decoratore `@mcp.resource()` con MIME type; il SDK serializza automaticamente il valore di ritorno.
- Caso d'uso tipico: feature di mention (`@document_name`) che inietta il contenuto del documento nel prompt.

## Punti chiave

- **Resources vs Tools**: resources = fetch dati (GET-like); tools = esecuzione azioni.
- **Flusso**: il client invia `ReadResourceRequest` con URI → il server risponde con i dati.
- **Risorsa diretta** (lista documenti):
  ```python
  @mcp.resource("docs://documents", mime_type="application/json")
  def list_docs() -> list[str]:
      return list(docs.keys())
  ```
- **Risorsa templated** (fetch singolo documento):
  ```python
  @mcp.resource("docs://documents/{doc_id}", mime_type="text/plain")
  def fetch_doc(doc_id: str) -> str:
      ...
  ```
- **Parametri URI**: nel templated resource, i parametri dell'URI diventano argomenti keyword della funzione (parsing automatico del SDK).
- **MIME types comuni**: `application/json`, `text/plain`.
- **Serializzazione**: il SDK converte automaticamente il valore di ritorno (non serve json.dumps manuale).
- **Test**: via MCP Inspector → sezioni "Resources" (dirette) e "Resource Templates" (templated).

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]]

## Concetti
[[wiki/concepts/mcp-resources|MCP Resources]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]]

## Citazioni notevoli
> "Resources in MCP servers allow you to expose data to clients, similar to GET request handlers in a typical HTTP server."

> "Resources expose data, tools perform actions."

## Connessioni
- Complementare a [[wiki/sources/2026-05-08-defining-tools-with-mcp|Defining Tools with MCP]]: due primitive diverse dello stesso server.
- Il lato client di questa funzionalità è trattato in [[wiki/sources/2026-05-08-accessing-mcp-resources|Accessing Resources]].
- Testing con l'inspector descritto in [[wiki/sources/2026-05-08-mcp-server-inspector|The Server Inspector]].
