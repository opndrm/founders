---
name: sketch
description: Connect Codex to the Sketch app through its native MCP server to inspect Sketch documents, pages, layers, and selection images. Use when the user mentions Sketch, wants to open or analyze a Sketch document, inspect a selection, compare design references, or turn a Sketch screen into implementation guidance.
---

# Sketch

Use Sketch's native MCP integration to work with the currently open Sketch document.

## Start

1. Open Sketch.
2. In Sketch, start its MCP server from **Plugins → MCP → Start MCP Server**.
3. Confirm the native Sketch MCP tools are available before trying to inspect a document.

## Workflows

### Inspect a document

Use the native Sketch tools to identify the open document, its pages, and the active page. Keep inspection read-only unless the user explicitly asks to edit the design.

### Inspect a layer tree

Read the selected page or artboard as a lightweight layer tree. Report hierarchy, names, layout-relevant properties, and styles without changing the document.

### View a selection

Use Sketch's selection-image capability to obtain an image of the currently selected layer or artboard. Use that image for visual analysis only when it helps answer the request.

### Produce implementation guidance

Translate an inspected Sketch screen into framework-appropriate implementation guidance. Clearly distinguish observations from recommendations, and do not claim a screen is implemented unless it has been verified separately.

## Constraints

- Default to read-only operations in Sketch.
- Do not modify layers, styles, symbols, or documents without explicit user approval.
- Use Sketch's native integration instead of reimplementing document rendering or management.
- If the Sketch MCP server is unavailable, state that plainly and ask the user to start it in Sketch.
