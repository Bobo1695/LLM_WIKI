---
title: "Project setup"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287785"
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

## Project setup

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

We're going to build a CLI-based chatbot to better understand how MCP clients and servers work together. This hands-on project will give you practical experience with both sides of the MCP architecture.

## What We're Building

Our chatbot will allow users to interact with a collection of documents through a command-line interface. The system consists of two main components:

- An MCP client that handles user interactions
- A custom MCP server that manages document operations

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542682%2F09_-_003_-_Project_Setup_03.1748542682857.jpg)

The server will provide two essential tools: one for reading document contents and another for updating them. All documents will be stored in memory for simplicity - no database required.

## Important Architecture Note

In real-world projects, you typically implement either an MCP client or an MCP server, not both. You might create:

- An MCP server to expose your service to other developers
- An MCP client to connect to existing MCP servers

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542683%2F09_-_003_-_Project_Setup_07.1748542683236.jpg)

We're building both components in this project purely for educational purposes - to understand how they communicate and work together.

## Project Setup

Download the `cli_project.zip` file attached to this lesson and extract it to your preferred development directory. Open your code editor in the project folder.

The project includes a comprehensive README file with setup instructions. Follow these steps:

1. Add your Anthropic API key to the `.env` file
2. Install dependencies using either UV (recommended) or pip
3. Run the starter application to verify everything works

## Running the Application

Navigate to your project directory in the terminal. You'll see the main project files including `main.py`, `mcp_client.py`, and `mcp_server.py`.

To start the application, use one of these commands:

```js
# If using UV (recommended)
uv run main.py

# If using standard Python
python main.py
```

When the application starts successfully, you'll see a chat prompt. Test it by asking a simple question like "what's 1+1?" - you should get a quick response from Claude.

With the basic setup complete, we're ready to start implementing MCP features and exploring how clients and servers communicate through the Model Control Protocol.

#### Downloads

- [cli\_project.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762981524/cli_project.zip?response-content-disposition=attachment&Expires=1778250082&Signature=hhUtELYp1oYFV6eFsEZIRnm25QzmgJ5c3EaytKqHGQKHWr~2gJ9~n-MSiUvENTm7R2R5SNBZo2gZVN0PCqMMjo4~LamHxsh1u2A97s5FUWWsAgQb0NCy0E~L1BUh480kMeLwuEn2ScqJCg9Lilx2DHLRwkLnxraabBgwBXBUKylEo0ON2rP3SJx7MOwkGPFllHEHxw72C5akgfXgmeW8BgFdNukGh~wOQdyKjEOXxRvSrXHcHaBn6A0doIZGBeE6icrXoVyG0H3-p11c0iwG-yVrkKhKoBogfKdy51ceqglKnFlnZy84UdjrsWPfCJLYQzLyO0agzxraW~8j0BL0VQ__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [cli\_project\_COMPLETE.zip](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic/assets/1762981524/cli_project_COMPLETE.zip?response-content-disposition=attachment&Expires=1778250082&Signature=HyJj98qrjftMmVZ2eBu5nvxwGP8vWgMAm3IPaSujfoRqQImVGFU8aOCQhvwdy7EEFY95tKxNZOX3DlRzD-NmlHgEYq4nVuNSLk7720ncGyO~BzoERvWZ2ZdggY0VTmo-WBQr7Cn-q~JBxugEQd4fny9jhHiBYFu1wjBDorxEvOz4bvVw4UpzPJu5mK91ub~dymA0tE65onAKfz3RNtdwNRyDERbbUyh4s1qT2BMtp6O-vV3TajHj9WdzqpdPZ7YheMq34oFWm1O3VF6aiD5XBHW-RrYS6bRYpLtwAlyN~3Z7Iq1OVjBaHYWp686R-fjTfLSLZAvFqCd6tqJDJzBXJA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)