# Crew Stats contract

`/stats` is a product-native Crew command, not a generic request for an external dashboard.

## Meaning

Crew Stats is a thin, passive, read-only projection of the active Crew session. It derives only from real JCode state: the persisted plan, native member state, observable messages and handoffs, and Mermaid source. JCode Mermaid remains the live authoritative view while a run is active. Crew Stats may retain a labeled snapshot after a run ends.

## Visual contract

Use the records design system and the private Crew Overview ChatGPT Sites workspace. Never include controls for roster configuration, model selection, apply, stop, publish, task dispatch, Vault grants, or any other action.

The current records design system uses warm paper and black ink; Arial for display and body; a monospaced system face; thin black rules; oversized editorial display type; and restrained reveal/rule motion. Do not add an unapproved dark UI, gradients, blue cards, yellow/orange alert colors, or generic dashboard styling.

## Boundary

Do not substitute an audit report, inferred repository activity, static commit summary, provider data, output tails, absolute paths, private reasoning, authentication metadata, or secret values for Crew Stats.

## Coordinator behavior

When the user asks for “Stats,” first identify whether they mean:

1. **Crew `/stats`:** explain the product-native passive projection and use its real output only when available.
2. **A project audit:** create a separately labelled read-only audit report from supplied evidence.
3. **Ollama/JCode telemetry:** display only verified live telemetry through the lower-right diagnostics workflow.

Never implement, redesign, or trigger Crew `/stats`; that is JCode product work. Do not call a static external audit “Stats.”
