---
title: "Text chunking strategies"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287776"
author:
published:
created: 2026-05-08
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)

[

**2**  
download

](#)

## Text chunking strategies

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

Text chunking is one of the most critical steps in building a RAG (Retrieval Augmented Generation) pipeline. How you break up your documents directly impacts the quality of your entire system. A poor chunking strategy can lead to irrelevant context being inserted into your prompts, causing your AI to give completely wrong answers.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542228%2F07_-_002_-_Text_Chunking_Strategies_01.1748542228739.jpg)

Consider this example: you have a document with sections on medical research and software engineering. If you chunk poorly, a user asking "How many bugs did engineers fix this year?" might get information about medical research instead of software engineering, simply because the medical section happened to contain the word "bug" in a different context.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542229%2F07_-_002_-_Text_Chunking_Strategies_04.1748542229353.jpg)

This is why choosing the right chunking strategy matters so much. Let's explore three main approaches.

## Size-Based Chunking

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542230%2F07_-_002_-_Text_Chunking_Strategies_05.1748542229862.jpg)

Size-based chunking is the simplest approach - you divide your text into strings of equal length. If you have a 325-character document, you might split it into three chunks of roughly 108 characters each.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542230%2F07_-_002_-_Text_Chunking_Strategies_06.1748542230454.jpg)

This method is easy to implement and works with any type of document, but it has clear downsides:

- Words get cut off mid-sentence
- Chunks lose important context from surrounding text
- Section headers might be separated from their content
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542231%2F07_-_002_-_Text_Chunking_Strategies_07.1748542230923.jpg)

To address these issues, you can add overlap between chunks. This means each chunk includes some characters from the neighboring chunks, providing better context and ensuring complete words and sentences.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542231%2F07_-_002_-_Text_Chunking_Strategies_08.1748542231502.jpg)

Here's a basic implementation:

```js
def chunk_by_char(text, chunk_size=150, chunk_overlap=20):
    chunks = []
    start_idx = 0
    
    while start_idx < len(text):
        end_idx = min(start_idx + chunk_size, len(text))
        chunk_text = text[start_idx:end_idx]
        chunks.append(chunk_text)
        
        start_idx = (
            end_idx - chunk_overlap if end_idx < len(text) else len(text)
        )
    
    return chunks
```

## Structure-Based Chunking

Structure-based chunking divides text based on the document's natural structure - headers, paragraphs, and sections. This works great when you have well-formatted documents like Markdown files.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542232%2F07_-_002_-_Text_Chunking_Strategies_09.1748542232356.jpg)

For a Markdown document, you can split on header markers:

```js
def chunk_by_section(document_text):
    pattern = r"\n## "
    return re.split(pattern, document_text)
```

This approach gives you the cleanest, most meaningful chunks because each one represents a complete section. However, it only works when you have guarantees about your document structure. Many real-world documents are plain text or PDFs without clear structural markers.

## Semantic-Based Chunking

Semantic-based chunking is the most sophisticated approach. You divide text into sentences, then use natural language processing to determine how related consecutive sentences are. You build chunks from groups of related sentences.

This method is computationally expensive but produces the most relevant chunks. It requires understanding the meaning of individual sentences and is more complex to implement than the other strategies.

## Sentence-Based Chunking

A practical middle ground is chunking by sentences. You split the text into individual sentences using regular expressions, then group them into chunks with optional overlap:

```js
def chunk_by_sentence(text, max_sentences_per_chunk=5, overlap_sentences=1):
    sentences = re.split(r"(?<=[.!?])\s+", text)
    
    chunks = []
    start_idx = 0
    
    while start_idx < len(sentences):
        end_idx = min(start_idx + max_sentences_per_chunk, len(sentences))
        current_chunk = sentences[start_idx:end_idx]
        chunks.append(" ".join(current_chunk))
        
        start_idx += max_sentences_per_chunk - overlap_sentences
        
        if start_idx < 0:
            start_idx = 0
    
    return chunks
```

## Choosing Your Strategy

Your choice depends entirely on your use case and document guarantees:

- **Structure-based**: Best results when you control document formatting (like internal company reports)
- **Sentence-based**: Good middle ground for most text documents
- **Size-based**: Most reliable fallback that works with any content type, including code

Size-based chunking with overlap is often the go-to choice in production because it's simple, reliable, and works with any document type. While it may not give perfect results, it consistently produces reasonable chunks that won't break your pipeline.

Remember: there's no single "best" chunking strategy. The right approach depends on your specific documents, use cases, and the trade-offs you're willing to make between implementation complexity and chunk quality.

#### Downloads

- [001\_chunking.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558508/001_chunking.ipynb?response-content-disposition=attachment&Expires=1778249935&Signature=oR02guv3j~stZJqiyi1kDo0A1QMAFNyW~F3aScRmP1j-yR2KnEDIMu0zgsnbMHTWzRPqACTdY~l9T4yeR6se4TqlTAL1TRpb21saSQf5dmhsSbJirH8UsD24PsbT5PZOKvzKDW52cqpMMVlcwJ6To5ViEAlu7rlhVTCmanu2cHmgitjCSMgBT9fshbXrkfDKMvMUDxJkm40skddsXbZn72mymWSvP3JlPpiCd75qi36qVRhVjoMqDuXTnv0PVC2idYUfDEJM8m7P7Vjgc5NM0oQZ173hWiq7wS9ND4KoiFJjk46~1Uf1HbSOXx3Yccpqa-MVjosD0fwzhNavYU7QaA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [report.md](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558508/report.md?response-content-disposition=attachment&Expires=1778249935&Signature=EFOwqXOjB0XugWJlCE63eNUQ8B22UiaVCuhzo2P~rHZdtd6SX2s8qMr7YKJyRAvcf5SAGh6Ip~o6WilyKC8ty~qeZH4SvXmRAAUijGv4grFY30ue13ZWcdf9hVfayN1PunA2Khvi5SKQcfzC0WrmUFBAitc2LD9NkzaPcSJd3exrpnTDeX1o0bN37TTX3~jAiHtLzK6nHNI7656wJNqaDMGhBs1lkHb6XDjit4pCnBp480toiwmws~U~iyi7fk33GmIi6FVu~PwiZLJDe8~wyt9PD-JTUH-36E7ILAxgytZeLVio1xp0v4QccatidisVEpfQlT3QtlV-E-MR0wxTIQ__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)