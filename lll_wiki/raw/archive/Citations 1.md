---
title: "Citations"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287771"
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

## Citations

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

When Claude answers questions based on documents you provide, users might assume it's just drawing from its training data. But what if Claude could show exactly where it found specific information? That's where citations come in - a powerful feature that lets Claude reference specific parts of your source documents and show users exactly where each piece of information comes from.

## Why Citations Matter

Imagine asking Claude about how Earth's atmosphere formed and getting a detailed answer. Without citations, users have no way to verify the information or understand that Claude is actually referencing a specific document you provided. Citations solve this transparency problem by creating a clear trail from Claude's response back to your source material.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542499%2F08_-_004_-_Citations_00.1748542499688.jpg)

## Enabling Citations

To enable citations, you need to modify your document message structure. Add two new fields to your document block:

```js
{
    "type": "document",
    "source": {
        "type": "base64",
        "media_type": "application/pdf",
        "data": file_bytes,
    },
    "title": "earth.pdf",
    "citations": { "enabled": True }
}
```

The `title` field gives your document a readable name, while `citations: {"enabled": True}` tells Claude to track where it finds information.

## Understanding Citation Structure

When citations are enabled, Claude's response becomes more complex. Instead of simple text, you get structured data that includes citation information for each claim.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542500%2F08_-_004_-_Citations_08.1748542500257.jpg)

Each citation contains several key pieces of information:

- **cited\_text** - The exact text from your document that supports Claude's statement
- **document\_index** - Which document Claude is referencing (useful when you provide multiple documents)
- **document\_title** - The title you assigned to the document
- **start\_page\_number** - Where the cited text begins
- **end\_page\_number** - Where the cited text ends
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542500%2F08_-_004_-_Citations_09.1748542500755.jpg)

## Building User Interfaces with Citations

The real power of citations comes from building user interfaces that make this information accessible. You can create interactive elements where users can hover over citation markers to see exactly where information came from.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542501%2F08_-_004_-_Citations_11.1748542501163.jpg)

This creates a transparent experience where users can:

- See that Claude's answers are grounded in actual source material
- Verify the information by checking the original document
- Understand the context around each cited piece of information

## Citations with Plain Text

Citations aren't limited to PDF documents. You can also use them with plain text sources. When working with text, modify your document structure like this:

```js
{
    "type": "document", 
    "source": {
        "type": "text",
        "media_type": "text/plain",
        "data": article_text,
    },
    "title": "earth_article",
    "citations": { "enabled": True }
}
```

With plain text sources, instead of page numbers, you'll get character positions that pinpoint exactly where in the text Claude found each piece of information.

## When to Use Citations

Citations are particularly valuable when:

- Users need to verify information for accuracy
- You're working with authoritative documents that users should be able to reference
- Transparency about information sources is critical for your application
- Users might want to explore the broader context around specific facts

By implementing citations, you transform Claude from a "black box" that provides answers into a transparent research assistant that shows its work. This builds user trust and enables them to dive deeper into your source materials when needed.

#### Downloads

- [002\_citations\_complete.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762980791/002_citations_complete.ipynb?response-content-disposition=attachment&Expires=1778250027&Signature=TYWite~wJHXJ3BiTTXpXhLxFJ1q6SPMjV~TOdnGhe-eD-8W8sMj~Suv4zYqThy8WX0nktUd0~~jAMPUlVW~7R1ceUvKaosjwcF~oF8QX-F8IMQZVI9hv6UUwYuCwD-m5b0FZqs5T5tllHJZ9euh2J28kQKA6K0x1ptp1PZ78TAQ8YUPlvDVYWNFzYtbMXthvpwPZNYCeEu0r8Zr97OfEVAem7xGII27esNJolYauPbQ1lAv5Ur5AEJn0CIraFrOrHTyFVov6gt83QocOYLD2Nm7l9pdAn7i1~HxBIXeoQYPLMwKt4kAbkDGQKSrk9q~buzmVQVqRDUBHNmA7KP7v1A__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [earth.pdf](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762980798/earth.pdf?response-content-disposition=attachment&Expires=1778250027&Signature=qOObW2V4Hu7VP8we6H6MHuO0a0byTrJqZaAgZjdf3OjvhDkb2M825hg09mpYmhb4cmMLm~VWE6a2RQm7YNatuS0Hn6ndFKSWSmKH6bK0EhHr0zVh2LO~bVi766p3bY1apaZJObBnlpPCbQ1nD8EBSKcPq85ufRNs2ZnQoZjDuL3rFsHAlkcF77mD7RCaFSY0uL1oqgtBaQTesjt2nT-nkH~od4x~-py~-yVBBNAYwN7dnhSK0zo8rnXUC6euRzvFt9sbrULLp3xi-tKbyGuerL-6qmXBNUfk-~k~KEa5U~YB0btn01YxB9mkTz3kbUFJDLWdY4VWGXyvoVXTGEoSJg__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)