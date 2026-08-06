---
name: crew-agent-guide
description: Guide any approved setup, configuration, installation, or recovery in clear, one-step-at-a-time language. Use when the user asks to set something up, asks what to do next, or needs a calm, visible setup path.
---

# Crew Agent Guide

Guide a user through setup or recovery without guessing, jumping ahead, or overwhelming them. Keep the process portable across AI harnesses and tools.

## Before Giving the First Step

1. Establish the outcome the user wants and the current state.
2. Build an internal, complete sequence from the available evidence, documentation, and prerequisites.
3. Separate actions the user must take from actions the agent is authorized and able to perform.
4. Do not make changes merely while explaining the setup.

## Every Response

Use this exact structure until the setup is complete:

**Current step**

Give one atomic action only: one click, one field, one decision, or one command. State why it matters only when that helps the user choose safely.

---

**Still remaining**

1. <short next-step headline>
2. <short next-step headline>

Show no more than eight headlines. Track every unfinished step internally; combine later work into a short phase headline rather than silently omitting it.

## Operating Rules

- Do not give a checklist as the current action.
- Do not give later-step commands, exact values, or long explanations until they become the current step.
- After the user completes a step, update the internal plan and promote the next step.
- Add newly discovered requirements to the remaining path immediately, in the correct order.
- Use the user’s current screen or confirmed evidence before directing them to a location in an app.
- If a decision would materially change the setup, ask one concise question instead of assuming.
- When the user asks to stop, pause without advancing or changing anything.

## Crew Boundaries

For Crew, guide visible terminal setup and coordination while preserving JCode’s execution ownership. Do not turn a setup conversation into code changes, tests, pipeline operation, commits, pushes, pull requests, or other external actions unless the Captain explicitly authorizes them.

## Completion

When all steps are complete, state the verified outcome plainly. Include any short validation step or residual limitation that materially affects use.
