---
title: Text Editor Tool (built-in)
type: concept
created: 2026-05-08
updated: 2026-05-08
tags: [tool-use, built-in-tools, file-editing]
sources: [2026-05-08-text-edit-tool]
---

## Cos'è il Text Editor Tool

Il **Text Editor Tool** è un tool built-in di [[wiki/entities/anthropic|Anthropic]] che fornisce a [[wiki/entities/claude|Claude]] capacità di manipolazione di file e directory. Lo schema completo del tool è già incorporato nella conoscenza di Claude: l'utente deve solo passare un piccolo stub di schema e scrivere le funzioni che implementano concretamente le operazioni sul filesystem ([[wiki/sources/2026-05-08-text-edit-tool|The Text Edit Tool]]).

## Operazioni Disponibili

| Operazione | Descrizione |
|---|---|
| `view` | Visualizza il contenuto di un file o directory |
| `view` (range) | Visualizza un intervallo specifico di righe |
| `str_replace` | Sostituisce un testo nel file con un altro |
| `create` | Crea un nuovo file |
| `insert` | Inserisce testo a una riga specifica |
| `undo_edit` | Annulla l'ultima modifica al file |

## Schema Version-Specific

A differenza dei tool personalizzati (dove si scrive l'intero schema), per il text editor tool si passa solo uno stub che indica la versione corretta per il modello in uso:

```python
def get_text_edit_schema(model):
    if model.startswith("claude-3-7-sonnet"):
        return {
            "type": "text_editor_20250124",
            "name": "str_replace_editor"
        }
    elif model.startswith("claude-3-5-sonnet"):
        return {
            "type": "text_editor_20241022",
            "name": "str_replace_editor"
        }
```

Claude riceve lo stub e internamente lo espande nell'intera specifica del tool. L'elenco aggiornato dei tipi per ogni versione del modello è disponibile nella documentazione ufficiale Anthropic.

## Separazione Schema / Implementazione

Questa è la caratteristica distintiva rispetto ai tool personalizzati:
- **Schema**: gestito da Anthropic, incorporato in Claude. L'utente non deve definirlo.
- **Implementazione**: il codice che legge/scrive/modifica i file sul filesystem va scritto dall'utente. Claude sa come *chiedere* le operazioni, ma non sa come *eseguirle* — quella logica resta nell'applicazione.

## Casi d'Uso

- Applicazioni che devono modificare file in modo programmatico.
- Ambienti senza editor avanzati con AI integrata.
- Integrazione di capacità di file editing in applicazioni Claude-powered.
- Replica delle funzionalità di un AI code editor all'interno di applicazioni personalizzate.

## Relazioni

- [[wiki/concepts/tool-use|Tool Use]] — il meccanismo generale di cui questo è un'implementazione built-in.
- [[wiki/concepts/web-search-tool|Web Search Tool (built-in)]] — altro tool built-in con pattern simile (schema stub, implementazione gestita da Anthropic).
- [[wiki/concepts/tool-schema|Tool Schema (JSON Schema per Tool)]] — contrasto utile: negli schema personalizzati l'utente definisce tutto; qui solo lo stub.
