---
name: crew-deepseek
description: Research a focused question using current web evidence and DeepSeek-guided synthesis when DeepSeek is available in the active AI harness. Use when the user asks DeepSeek to search, research, compare current information, or turn gathered web evidence into a clear answer. This skill does not configure or require a particular model provider.
---

# Crew DeepSeek

## Establish the search question

Turn the request into one focused question and identify the decision it informs.
For a broad topic, define a small set of clearly related sub-questions. Do not
expand into an open-ended research project unless the user asks for that.

## Gather current evidence

Use $crew-agent-reach for Internet and platform routing. Prefer official,
primary, or otherwise authoritative sources. Use more than one source when the
answer affects a decision or could have changed recently.

Treat the model as the analyst, not as evidence. Do not cite model-generated
claims as sources and do not make an answer look verified unless sources support
it.

## Use the available model honestly

If DeepSeek is selected and available in the current harness, use it to
organize, compare, and explain the gathered evidence. If it is not available,
continue with the active model rather than changing providers, installing
software, or claiming that DeepSeek ran the task.

This skill does not configure DeepAPI, Ollama, a local model, or a paid research
service. Those are separate setup choices.

## Deliver the answer

Lead with the direct answer in plain language. Separate:

- facts established by sources;
- conclusions or recommendations drawn from those facts; and
- remaining uncertainty or conflicts in the evidence.

Place source links beside the statements they support. For a comparison, explain
the meaningful tradeoffs instead of producing an unsupported overall score.

## Boundaries

Research is read-only. Do not submit forms, make purchases, send messages,
change accounts, or incur a paid API charge without separate explicit user
approval.
