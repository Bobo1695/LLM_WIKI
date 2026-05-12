# LLM Wiki Knowledge Base

Benvenuto nella **LLM Wiki**, una knowledge base strutturata e un "Second Brain" dedicato interamente ai Large Language Models (LLM), Prompt Engineering, RAG (Retrieval-Augmented Generation), Tool Use, Model Context Protocol (MCP) e Agentic Workflows. 

Il progetto è focalizzato in particolare sull'ecosistema **Anthropic (Claude e API)**, raccogliendo concetti, sintesi e best practice derivanti dall'Anthropic Academy e da altre fonti autorevoli del settore (es. Andrej Karpathy).

## Come navigare la repository

Questa repository è pensata per essere esplorata come un **Vault di Obsidian** (o con qualsiasi editor Markdown che supporti i *wikilinks*). 

**Il punto di partenza ideale è il file:**
**[`llm_wiki/index.md`](llm_wiki/index.md)** 
L'indice principale contiene il catalogo di tutte le pagine generate, raggruppate per macro-categorie.

### Struttura delle directory

Tutto il nucleo del sapere è racchiuso nella cartella `llm_wiki/`, strutturata secondo un pattern architetturale semantico:

- `llm_wiki/wiki/sources/`: Note di partenza, trascrizioni di lezioni (es. *Anthropic Academy*), documentazione sulle API, tool e RAG.
- `llm_wiki/wiki/concepts/`: Concetti distillati e spiegati in dettaglio (es. *Prompt Evaluation*, *Prompt Caching*, *RAG Hybrid Search*, *MCP Protocol*, *Agent Systems*).
- `llm_wiki/wiki/entities/`: Entità chiave menzionate nella base di conoscenza (es. *Anthropic*, *Claude*, *VoyageAI*).
- `llm_wiki/wiki/synthesis/`: Articoli di sintesi che uniscono concetti multipli in guide strutturate (es. *Definizione di System Prompt*).
- `llm_wiki/raw/`: Materiale grezzo o log di importazione in attesa di essere processato.

### File speciali

- `llm_wiki/CLAUDE.md`: Istruzioni di sistema (System Prompt) per l'agente AI che gestisce e aggiorna la Wiki.
- `llm_wiki/log.md`: Registro delle attività e degli aggiornamenti (ingest) effettuati sulla Wiki.
- `LLM_Wiki_Report.docx`: Un documento Word riassuntivo che esporta i contenuti della Wiki in formato formale.

## Tematiche principali coperte

1. **Anthropic API**: Gestione stateless, streaming, caching dei prompt, tool built-in (Web Search, Code Execution, Text Editor), data structuring.
2. **Prompt Engineering & Evaluation**: Tecniche avanzate (XML tags, few-shot), creazione di pipeline di valutazione (eval workflow), grader basati su modello e su codice.
3. **RAG (Retrieval-Augmented Generation)**: Text chunking, text embeddings (VoyageAI), ricerca ibrida (BM25 + Semantic), citazioni API.
4. **Agenti e Workflow**: Differenze tra workflow (parallelizzazione, chaining, routing) e sistemi multi-agente flessibili.
5. **Model Context Protocol (MCP)**: Client, Server, Tool, Risorse e Prompt, e integrazioni avanzate.

---
*Progetto mantenuto iterativamente con l'ausilio di assistenti AI, strutturato per l'esplorazione e l'apprendimento continuo.*
