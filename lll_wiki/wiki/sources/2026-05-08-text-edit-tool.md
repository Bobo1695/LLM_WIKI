---
title: The Text Edit Tool
type: source
source_path: raw/incoming/The text edit tool.md
author: Anthropic Academy
date: 2026-05-08
created: 2026-05-08
updated: 2026-05-08
tags: [anthropic-academy, tool-use, built-in-tools, text-editor, file-editing]
---

## TL;DR
- Il text editor tool è un tool built-in di Claude che non richiede la definizione manuale dello schema JSON.
- Fornisce operazioni su file: visualizzare contenuto, vedere range di righe, sostituire testo, creare file, inserire righe, annullare modifiche.
- Lo schema è version-specific: occorre passare un piccolo stub con il tipo corretto per il modello usato.
- Claude conosce lo schema ma l'implementazione delle operazioni su file deve essere scritta dall'utente.

## Punti chiave
- **Tool built-in**: a differenza dei tool personalizzati, lo schema completo è già "incorporato" nella conoscenza di Claude. Basta passare uno stub minimo.
- **Operazioni disponibili**:
  - Visualizzare contenuto di file o directory.
  - Visualizzare range specifici di righe.
  - Sostituire testo in un file (str_replace).
  - Creare nuovi file.
  - Inserire testo a righe specifiche.
  - Annullare modifiche recenti (undo).
- **Schema version-specific**:
  ```python
  def get_text_edit_schema(model):
      if model.startswith("claude-3-7-sonnet"):
          return {"type": "text_editor_20250124", "name": "str_replace_editor"}
      elif model.startswith("claude-3-5-sonnet"):
          return {"type": "text_editor_20241022", "name": "str_replace_editor"}
  ```
- **Implementazione separata dallo schema**: Claude sa come richiedere operazioni su file, ma il codice che esegue concretamente le operazioni (lettura/scrittura/modifica filesystem) deve essere scritto dallo sviluppatore.
- **Casi d'uso**: applicazioni che devono modificare file programmaticamente, ambienti senza editor avanzati, integrazione di file editing in app Claude-powered.
- **Documentazione ufficiale**: versioni aggiornate degli schema su `https://docs.anthropic.com/en/docs/agents-and-tools/tool-use/text-editor-tool`.

## Entità menzionate
[[wiki/entities/anthropic|Anthropic]], [[wiki/entities/anthropic-academy|Anthropic Academy]], [[wiki/entities/claude|Claude]]

## Concetti
[[wiki/concepts/tool-use|Tool Use]], [[wiki/concepts/text-editor-tool|Text Editor Tool (built-in)]]

## Citazioni notevoli
> "Claude comes with one built-in tool that you don't need to create from scratch: the text editor tool."

> "Think of it this way - Claude knows how to ask for file operations, but you need to write the code that actually performs those operations."

> "Essentially, the text editor tool lets you replicate much of the functionality of a fancy AI-powered code editor within your own applications."

## Connessioni
- Affianca [[wiki/sources/2026-05-08-web-search-tool|The Web Search Tool]] come secondo esempio di tool built-in di Anthropic.
- Contrasta con i tool custom descritti in [[wiki/sources/2026-05-08-tool-functions|Tool Functions]] e [[wiki/sources/2026-05-08-tool-schemas|Tool Schemas]], dove sia funzione che schema sono definiti dall'utente.
