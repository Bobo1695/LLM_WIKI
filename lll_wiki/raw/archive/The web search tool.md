---
title: "The web search tool"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287755"
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

## The web search tool

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

**Important note:** Your organization must enable the Web Search tool in the settings console before using it. You can find this setting here: [https://console.anthropic.com/settings/privacy](https://console.anthropic.com/settings/privacy)

Claude includes a built-in web search tool that lets it search the internet for current or specialized information to answer user questions. Unlike other tools where you need to provide the implementation, Claude handles the entire search process automatically - you just need to provide a simple schema to enable it.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623824%2F06_-_013_-_The_Web_Search_Tool_00.1748623823785.png)

## Setting Up the Web Search Tool

To use the web search tool, you create a schema object with these required fields:

```js
web_search_schema = {
    "type": "web_search_20250305",
    "name": "web_search", 
    "max_uses": 5
}
```

The `max_uses` field limits how many searches Claude can perform. Claude might do follow-up searches based on initial results, so this prevents excessive API calls. A single search returns multiple results, but Claude may decide additional searches are needed.

## How the Response Works

When Claude uses the web search tool, the response contains several types of blocks:

- **Text blocks** - Claude's explanation of what it's doing
- **ServerToolUseBlock** - Shows the exact search query Claude used
- **WebSearchToolResultBlock** - Contains the search results
- **WebSearchResultBlock** - Individual search results with titles and URLs
- **Citation blocks** - Text that supports Claude's statements

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623825%2F06_-_013_-_The_Web_Search_Tool_07.1748623824808.png)

The response structure lets you see exactly what Claude searched for and which sources it found. Citations include the specific text Claude used to support its answers, along with the source URLs.

## Restricting Search Domains

You can limit searches to specific domains using the `allowed_domains` field. This is particularly useful when you want reliable, authoritative sources:

```js
web_search_schema = {
    "type": "web_search_20250305",
    "name": "web_search",
    "max_uses": 5,
    "allowed_domains": ["nih.gov"]
}
```

For example, when asking about medical or exercise advice, restricting to domains like PubMed (nih.gov) ensures you get evidence-based information rather than random blog content.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623825%2F06_-_013_-_The_Web_Search_Tool_13.1748623825691.png)

## Rendering Search Results

The different block types in the response are designed for specific UI rendering:

- Render text blocks as regular content
- Display web search results as a list of sources at the top
- Show citations inline with the text, including the source domain, page title, URL, and quoted text

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623826%2F06_-_013_-_The_Web_Search_Tool_17.1748623826456.png)

This structure helps users understand how Claude arrived at its answers and provides transparency about the sources being used. The citation format makes it clear which specific information came from which sources, building trust in the AI's responses.

## Practical Usage

The web search tool works best for:

- Current events and recent developments
- Specialized information not in Claude's training data
- Fact-checking and finding authoritative sources
- Research tasks requiring up-to-date information

Simply include the schema in your tools array when making API calls, and Claude will automatically decide when a web search would help answer the user's question.

#### Downloads

- [006\_web\_search.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762980062/006_web_search.ipynb?response-content-disposition=attachment&Expires=1778249907&Signature=u1TsnCnHCEoRu2HiB5GjclP8dq-nMqIkSdEDtTKi5lPBTqWD2GTFj7lawMcejq4vhM6mkxsJPs-dX6UOpDV39Ldi8N4QYKcXnga2a6iTWEYuWcZ6iok6-SK7kGMzSOfSCUlkzi9B9pNEuWw1kpPCrZ3WRUSIe14PsjNn9kbh3c0tQQ6niWGocA4a7yJJmQ16KZaWZ8eE-H16D25h6E8wLJq0XrU6h9s9ic6KnMW4Gbb0uMdEjoYhzfJ5Rb3Q1uXKUOu5iVUi8M1fqff3qNfFCSWpdXyw7H-VwGAp1kMQtHQ5QaWSEB0cUnBzp3MPNZXH7K7exJI7gRDG0vVxRbcioA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [006\_web\_search\_complete.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762980063/006_web_search_complete.ipynb?response-content-disposition=attachment&Expires=1778249907&Signature=QpKJn~8UyvoEi0OOSMZjUPHj5bs5ry0JnfthEJr6bBJD13FXNaF~KVgRlC2eUr2Adn6yd7tSaG0EllmFKYKa7vUwu5L-QP2C4GOOI6r983NZJdANKcwmAmSLdVqlvFfj~Jc7jvZ~fzQDtu7NbnerjYhbM0x5mJfFNJ1q0Fm3kQk6DsGg3pbyhGAIl~~HPS8eoWglvJSl5Dx8Z1SlL39BxdEmbE-abybkdylFt9mzVuUSWL4-k8ASRkCrsd0Cawj1xTVxJCUQW3TNtfU1lnE99lGB0O19qRYIrdo0Hr1rx-hfhAD~hkyh41zXjZcg5z0Q865wtDosl5K9RvyUGDiubQ__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)