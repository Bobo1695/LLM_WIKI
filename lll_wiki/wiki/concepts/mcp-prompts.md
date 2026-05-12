---
title: MCP Prompts
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [mcp, prompts, template]
sources: [2026-05-08-defining-mcp-prompts, 2026-05-08-mcp-prompts-client]
---

## Definizione

Gli MCP Prompts sono la primitiva di *template istruzioni* del [[wiki/concepts/mcp-protocol|Model Context Protocol]]. Sono template di messaggi pre-costruiti, testati e parametrizzati che i client possono richiamare al posto di scrivere prompt ad hoc. Il loro scopo è garantire qualità e consistenza superiori a quelle che l'utente finale otterrebbe da solo ([[wiki/sources/2026-05-08-defining-mcp-prompts|Defining Prompts]]).

## Struttura lato server

Un MCP Prompt è definito con il decoratore `@mcp.prompt()` e ritorna una lista di messaggi (`base.Message`):

```python
from mcp.server.fastmcp import base
from pydantic import Field

@mcp.prompt(
    name="format",
    description="Rewrites the contents of the document in Markdown format."
)
def format_document(
    doc_id: str = Field(description="Id of the document to format")
) -> list[base.Message]:
    prompt = f"Your goal is to reformat a document... {doc_id} ..."
    return [base.UserMessage(prompt)]
```

I tipi di messaggio disponibili includono `UserMessage` e `AssistantMessage`, permettendo di costruire conversazioni multi-turno come template.

## Accesso lato client

Il client MCP espone due metodi ([[wiki/sources/2026-05-08-mcp-prompts-client|Prompts in the Client]]):

- `list_prompts()` — recupera tutti i prompt disponibili dal server.
- `get_prompt(name, args)` — ottiene un prompt specifico con i parametri interpolati; restituisce la lista di messaggi pronta per essere inviata a Claude.

## Differenza dai System Prompt

| Aspetto | [[wiki/concepts/system-prompt|System Prompt]] | MCP Prompt |
|---|---|---|
| Posizionamento | Parametro `system=` nella chiamata API | Template restituito dal server MCP |
| Riusabilità | Fisso nel codice dell'app | Versionato e distribuito con il server |
| Parametrizzazione | Statico o interpolato manualmente | Parametri dichiarativi con Field |
| Gestione | A carico del developer dell'app | A carico del maintainer del server MCP |

## Workflow di utilizzo (CLI)

1. L'utente digita `/` → appaiono i prompt disponibili come comandi.
2. L'utente seleziona il prompt desiderato (es. "format").
3. Il sistema richiede i parametri richiesti (es. quale documento).
4. Il prompt con i valori interpolati viene inviato a Claude.
5. Claude usa i tool del server per completare il task.

## Best practices

- Istruzioni dettagliate e specifiche, non vaghe.
- Test approfonditi con input diversi prima del deploy.
- Progettati in sinergia con i tool e le risorse del server.
- Descrizioni chiare per orientare l'utente finale.
