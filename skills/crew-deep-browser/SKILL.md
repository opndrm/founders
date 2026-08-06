---
name: crew-deep-browser
description: Inspect, navigate, test, or interact with web pages using an approved visible browser-control capability. Use when a task requires clicks, forms, logged-in state, JavaScript-rendered content, visual verification, or a browser workflow rather than ordinary web search or static page reading.
---

# Crew Deep Browser

## Choose the lightest route

Use ordinary web research for public, static information. Use browser control
only when the task needs a real browser: a click, a form, a user’s signed-in
session, a JavaScript-heavy application, or visible verification.

Prefer an available, supported browser-control connector. Do not invent browser
automation, connect to an unknown debugging port, or launch a separate browser
when the user’s existing browser session is the target.

## Work visibly and deliberately

1. Inspect the current page before acting.
2. Identify the exact page, account, and target action.
3. Take one meaningful action at a time.
4. Re-read or visually verify the changed page before claiming success.

Keep the user’s active work intact. Open a new tab for a new destination rather
than overwriting an unrelated page. Treat popups, internal browser pages, and
stale tabs as unreliable until their state is confirmed.

## Authentication and external effects

Use an already authenticated user session only for the task the user requested.
Never request, reveal, or copy passwords, access tokens, cookies, or private
session data. If authentication is required and the user is not already signed
in, stop and ask them to complete the sign-in themselves.

Before a consequential external effect—sending, publishing, purchasing,
deleting, changing account settings, or submitting a form—show the exact target
and obtain explicit approval. A page loading or a button being visible is not
approval to activate it.

## Report evidence

State what page was checked, what action was completed, and what visible result
confirmed it. Report blockers plainly; do not infer a successful browser action
from tool output alone.
