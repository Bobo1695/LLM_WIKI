---
title: MCP Prompts in the Client
type: source
source_path: raw/incoming/Prompts in the client.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, mcp, prompts, client, async, implementazione]
---

## TL;DR
- Il client MCP espone due metodi per i prompt: `list_prompts()` e `get_prompt(name, args)`.
- `get_prompt` restituisce i messaggi con i parametri già interpolati, pronti per essere inviati a Claude.
- Nella CLI, i prompt sono accessibili digitando `/` per mostrare i comandi disponibili.
- I prompt combinano flessibilità (parametri) e qualità garantita (template pre-testati).

## Punti chiave

- **Metodo `list_prompts()`**:
  ```python
  async def list_prompts(self) -> list[types.Prompt]:
      result = await self.session().list_prompts()
      return result.prompts
  ```
- **Metodo `get_prompt()`**:
  ```python
  async def get_prompt(self, prompt_name, args: dict[str, str]):
      result = await self.session().get_prompt(prompt_name, args)
      return result.messages
  ```
- **Come funzionano gli argomenti**: il dizionario `args` viene passato come keyword arguments alla funzione prompt sul server; i valori vengono interpolati nel template.
- **Workflow CLI**:
  1. L'utente digita `/` → appaiono i prompt disponibili come comandi.
  2. L'utente seleziona un prompt (es. "format").
  3. Il sistema richiede i parametri (es. quale documento formattare).
  4. Il prompt interpolato viene inviato a Claude.
  5. Claude usa i tool disponibili per completare il task.
- **Best practices** (lato client):
  - Prompt rilevanti per il purpose del server.
  - Progettati per interagire con i tool disponibili.
  - Parametri ben documentati per guidare l'utente.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/mcp-prompts|MCP Prompts]], [[wiki/concepts/mcp-protocol|Model Context Protocol (MCP)]]

## Citazioni notevoli
> "Prompts bridge the gap between predefined functionality and dynamic user needs, giving Claude structured starting points for complex tasks while maintaining flexibility through parameterization."

> "Prompts in MCP define a set of user and assistant messages that can be used by the client. These prompts should be high quality, well-tested, and relevant to the overall purpose of the MCP server."

## Connessioni
- Lato client dei prompt definiti in [[wiki/sources/2026-05-08-defining-mcp-prompts|Defining Prompts]].
- Pattern simmetrico ai metodi `list_tools()` e `call_tool()` di [[wiki/sources/2026-05-08-implementing-mcp-client|Implementing a Client]].
- Completa il trittico delle primitive MCP: tools ([[wiki/concepts/mcp-tools|MCP Tools]]), resources ([[wiki/concepts/mcp-resources|MCP Resources]]), prompts ([[wiki/concepts/mcp-prompts|MCP Prompts]]).
