---
name: crew-stats
description: "Build, maintain, and publish the Codex-managed Crew Overview website: its consumer homepage, evidence-based developer Crew Stats page, and future Crew diagram page. Use when the user asks to create, update, review, publish, or explain this Crew website or its presentation of verified JCode evidence."
---

# Crew Stats

Maintain the private ChatGPT Sites-managed **Crew Overview** website as Crew’s product-scope presentation workspace. It complements JCode; it does not replace JCode’s native runtime, `/stats`, Mermaid diagrams, Crew Map, or No Mistakes pipeline.

## Source hierarchy

Read `references/authoritative-sources.md` before a Crew site design or content change.

- Use the Crew records and the Captain’s stated current direction as the approved product scope, design, and audit baseline. Use the private Crew Overview Sites workspace for the managed Home, Crew Stats, and Crew pages.
- Use current JCode terminal/session evidence, Crew Map handoffs, and the assigned `/crew` repository for developer-state facts.
- Mark developer-state content with its evidence source and capture time. Call it a **reported snapshot** or **audit** unless a current source proves it is live.
- If required evidence is unavailable, say so and stop. Do not invent project state or substitute a generic dashboard.

## Crew Stats audit workflow

Treat Crew Stats as an evidence-led audit and projection workflow for the assigned `/crew` repository:

1. Read the Captain’s current direction and the applicable Crew records to establish the intended scope.
2. Read current JCode evidence to identify what has been completed, what is active, what is blocked, and what JCode proposes next.
3. Read the current Crew Map handoff or map evidence. Check whether it has been updated and whether its recorded owner, next action, and pipeline state agree with the JCode evidence.
4. Inspect the assigned Crew repository read-only for the implementation and documentation evidence needed to evaluate stated progress. Do not make Crew code changes, run No Mistakes, or publish Crew Map updates.
5. Compare actual evidence against the Captain’s direction and state the result plainly: **on scope**, **at risk**, **off scope**, or **insufficient evidence**. Identify the exact evidence gap, mismatch, or next action.
6. Project that dated, sourced audit into the private **Crew Stats** page. Label the source, freshness, audit status, owner, current state, scope alignment, blocker, and next action. Refresh it from new verified evidence; never present a retained snapshot as live telemetry.

## Future native Crew Stats target

Treat the following as the approved future product target, not a current implementation claim:

- After the Crew build is complete, **`/crew stats`** will be a native Rust command inside JCode, built on top of JCode Swarm.
- JCode will use its native Mermaid path to report real Captain and named-Crew status: the active Captain, `@name` Crew identities, assigned task, current work, parent scope, and whether each item is aligned with its assigned project scope.
- The native JCode report will become the primary Crew Stats surface because it derives from the live Swarm state. JCode alone implements and operates it.
- The private Crew Overview Sites view remains available as an optional Codex/ChatGPT presentation layer when the developer chooses to use it. Do not remove it, but do not present it as required once the native command exists.
- Until JCode implements and verifies the native command, keep calling the Sites view a sourced audit projection and keep JCode’s current native state and Crew Map authoritative.

## Site information architecture

Maintain three top-level destinations:

1. **Home** — a consumer-grade Crew product homepage. Apply the Crew Gill-hybrid Swiss-minimal style from the records: warm paper, near-black ink, thin rules, oversized Arial editorial display, compact mono labels, restrained cursive emphasis, information-first hierarchy, and reduced-motion support.
2. **Crew Stats** — the private developer audit workspace. Display the sourced repository, JCode, and Crew Map snapshot; the Captain’s current direction; scope alignment; verified implementation evidence; pipeline state; blockers; owner; freshness; and next action. It is read-only and must not use controls that alter Crew work.
3. **Crew** — a sourced product-architecture view of the intended native JCode Crew Setup, command spine, Captain and named-Crew model-routing policy, and JCode Swarm boundary. Clearly label it as intended unless current JCode evidence proves a view is live. Never create a competing roster, scheduler, or control surface.

## Gill Huybrecht typography refresher

Use this editorial method whenever the Captain asks for a Crew Stats visual refresh, a consumer page, or a native Framer handoff. The goal is an intentional reading experience, not a collection of generic interface cards.

1. **Set art direction before components.** Start with one clear expression: warm paper, near-black ink, hairline rules, pure-yellow editorial highlights, and restrained cursive counterpoint. Avoid gradients, generic SaaS styling, decorative terminal effects, or dashboard color noise.
2. **Compose a real hierarchy.** Use a decisive sans display face for major statements, compact mono or tracked labels for evidence, readable body copy at controlled measure, and a genuine script accent only where it changes hierarchy. Never substitute a plain italic sans face for the script role.
3. **Build the grid and rhythm.** Reuse a stable outer margin, column relationship, baseline of section rules, and a deliberate large/medium/small spacing scale. Let sections breathe; do not flatten a long editorial reference into a short landing page.
4. **Make information the visual system.** A Crew Stats fact must visibly carry its source, freshness, owner, state, and next action. A Dictionary card needs its full anatomy: title, inner rule, term, phonetic line, word class, definition, related terms, and footer.
5. **Preserve designed line breaks.** Headline wraps, text measure, alignment, and negative space are part of the composition. Treat a broken line break or a clipped label as a design defect, not a cosmetic detail.
6. **Design responsive composition.** At tablet and phone widths, recomposes hierarchy, order, and measure; it does not simply shrink desktop. Preserve the yellow-plus-script lockup, editorial rules, and readable card anatomy.
7. **Handoff with evidence.** Before asking Framer or another builder to implement a page, state the reference image or page, typography roles, grid, section order, source rules for code snippets, responsive intent, navigation behavior, and non-negotiable read-only boundary.

### Visual acceptance checklist

- The hero has bold yellow emphasis paired with genuine cursive, not improvised italic text.
- Rules, margins, columns, and section rhythm repeat with discipline.
- Dictionary cards look like finished macOS-style reference objects, not dark text boxes.
- Code is either exact and source-captioned or visibly labeled illustrative.
- Crew Stats remains a sourced audit projection; no control-plane UI has been introduced.
- Desktop, tablet, and phone all preserve the intended editorial hierarchy.

## Update workflow

1. Read the authoritative records and the latest applicable JCode evidence.
2. Identify whether the request changes consumer content, developer reporting, or the future Crew view.
3. Build or update the site through the Sites workflow. Preserve responsive, accessible navigation and the approved Crew design system.
4. Before publishing, read back the changed content and ensure every developer claim has a source and freshness label.
5. Publish only when the user asks. Report the public site separately from JCode’s official state.

## Boundaries

- Never claim the site is JCode’s native `/stats` or Crew Map.
- Never run, restart, respond to, recover, or publish a No Mistakes pipeline.
- Never code Crew, publish an official Crew Map update, or send a JCode request without the user’s authorization.
- Never add Lavish, FirstMate, Instatic, Buzz, or another workflow to the site as current Crew state unless the Captain supplies an approved source and direction.
