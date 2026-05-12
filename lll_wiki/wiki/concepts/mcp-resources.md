---
title: MCP Resources
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [mcp, resources, dati]
sources: [2026-05-08-defining-mcp-resources, 2026-05-08-accessing-mcp-resources]
---

## Definizione

Le MCP Resources sono la primitiva di *accesso ai dati* del [[wiki/concepts/mcp-protocol|Model Context Protocol]]. Funzionano in modo analogo a un endpoint GET in un HTTP server: espongono dati in read-only che il client può richiedere tramite URI ([[wiki/sources/2026-05-08-defining-mcp-resources|Defining Resources]]).

La distinzione fondamentale rispetto agli [[wiki/concepts/mcp-tools|MCP Tools]]: le risorse *espongono dati*, i tool *eseguono azioni*.

## Due tipi di risorse

### Risorse dirette (Direct Resources)
URI statici che non cambiano:

```python
@mcp.resource("docs://documents", mime_type="application/json")
def list_docs() -> list[str]:
    return list(docs.keys())
```

Utili per esporre cataloghi, liste, dati statici.

### Risorse templated (Templated Resources)
URI con parametri variabili. Il SDK parsa automaticamente i parametri dall'URI e li passa come keyword arguments alla funzione:

```python
@mcp.resource("docs://documents/{doc_id}", mime_type="text/plain")
def fetch_doc(doc_id: str) -> str:
    return docs[doc_id]
```

Utili per accedere a singoli elementi identificati da un ID o altro parametro.

## MIME Types

Il parametro `mime_type` informa il client sul formato dei dati restituiti:
- `application/json` — dati strutturati JSON (il SDK serializza automaticamente).
- `text/plain` — testo semplice.
- Qualsiasi MIME type valido per formati diversi.

## Accesso lato client

Il client MCP legge una risorsa con `read_resource(uri)` ([[wiki/sources/2026-05-08-accessing-mcp-resources|Accessing Resources]]). Il contenuto viene poi parsato in base al MIME type:
- JSON → `json.loads(resource.text)` → dict Python.
- Testo → stringa Python.

Il vantaggio rispetto ai tool: il contenuto della risorsa può essere iniettato *direttamente* nel prompt a Claude, senza richiedere un round-trip di tool call.

## Caso d'uso tipico

Feature di mention (`@document_name`): l'utente digita `@report.pdf` → la CLI mostra l'autocomplete delle risorse disponibili → il contenuto viene recuperato e iniettato nel prompt → Claude riceve il documento già nel contesto, senza dover invocare un tool ([[wiki/sources/2026-05-08-accessing-mcp-resources|Accessing Resources]]).
