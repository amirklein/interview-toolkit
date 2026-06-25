---
name: prototype-builder
description: >
  Use this skill whenever the person needs to build a prototype as part of a take-home assignment or product exercise. Triggers include: I need to build a prototype, the assignment asks for a prototype, create a mockup of this, build a demo of this feature, show what this would look like, prototype this flow. Also trigger when an assignment brief includes any request for visual demonstration, interactive mockup, or product simulation. This skill researches the real product first, then builds a high-fidelity prototype that matches actual product UI patterns with new features added on top.
---

# Prototype Builder Skill

## Purpose
Build high-fidelity, realistic prototypes for PM take-home assignments — starting with live research into the actual product so the prototype looks and feels like the real thing, not a generic wireframe. New features are layered on top of accurate product foundations, making the prototype feel credible and submission-ready.

---

## Step 1 — Understand What's Being Asked

Before building anything, extract from the assignment brief:
- What product or feature needs to be prototyped
- Who the target user is
- What flow or interaction needs to be demonstrated
- What the deliverable format should be (the brief may specify; if not, default to interactive)
- Whether this is a new feature on an existing product or a standalone concept

If the brief is ambiguous on any of these, flag it before starting.

---

## Step 2 — Research the Real Product

This is non-negotiable. The prototype must be grounded in the actual product, not a generic approximation.

**Go live and find:**
- The product's actual UI — screenshots, live product if accessible, product demo videos, app store previews
- Design language: color palette, typography style, component patterns (cards, modals, nav, buttons, empty states)
- Navigation structure: how the product is organized, what the main surfaces are
- Tone: how the product talks to its users (formal, casual, dense, minimal)
- Key existing screens most relevant to where the new feature would live

**Sources to check:**
- The company's live product (web app, try a free tier if available)
- App Store / Google Play screenshots and previews
- Product Hunt page (often has detailed screenshots)
- Company blog, changelog, or release notes for UI previews
- YouTube demos or walkthrough videos
- Design systems or public Figma files if the company has shared them
- G2 / Capterra reviews often include user-uploaded screenshots

Document what you find. The prototype will be built to match.

---

## Step 3 — Define the Prototype Scope

Before building, align with the person on:
- **Which screens** need to be shown (minimum to tell the story of the feature)
- **What interactions** matter (what does the user do, what happens next)
- **What the narrative arc is** — what is this prototype supposed to demonstrate to the evaluator?

A good PM prototype tells a story. It doesn't show every edge case — it shows the happy path clearly enough that the evaluator can see the thinking behind the feature.

Keep scope lean and purposeful. 3–5 screens that clearly communicate the concept beat 15 screens that feel incomplete.

---

## Step 4 — Build the Prototype

### Default output: Interactive React artifact (in-Claude)
Build as a React component in Claude. This allows:
- Click-through interactions
- State-driven UI (tabs, modals, expanded views)
- Realistic-feeling product experience
- Shareable in the conversation

Use the real product's design language from Step 2:
- Match the actual color palette
- Match typography style (font weight, sizing hierarchy)
- Match component patterns (if the product uses card-based layout, use cards; if it uses dense tables, use tables)
- Match tone of UI copy

New feature elements should feel *native* to the product — not bolted on.

### If the assignment specifies Figma or a specific tool
Flag this to the person and discuss the best path. Claude can produce a high-detail HTML/React prototype that can be screenshotted and presented even if Figma export isn't available.

### Quality bar
The prototype should be good enough that a hiring manager looks at it and thinks: "this person has actually used the product and thought carefully about how a new feature would fit." It should not look like a wireframe placeholder.

---

## Step 5 — Narrate the Prototype

After building, produce a short walkthrough narrative that the person can use to present the prototype:
- What the evaluator is looking at
- What problem this solves
- What decisions were made in the design and why
- What would be different in V2 (shows forward thinking)

This narrative is the PM layer on top of the design layer — it's what makes the prototype read as the work of a product thinker, not just a designer.

---

## Step 6 — Sanity Check Against the Assignment

Before finalizing, check:
- Does the prototype answer what was actually asked in the brief?
- Does it demonstrate the feature/flow they wanted to see?
- Does it look credibly like the real product?
- Is it polished enough to submit without apology?

If any answer is no, fix it before presenting to the person as done.

---

## Tone & Standards

- Research before building. Always. A prototype that doesn't match the real product signals a PM who doesn't do their homework.
- Fewer screens, higher fidelity. Don't sprawl — focus on what the evaluator needs to see.
- Design decisions should be defensible. If you made a choice about layout or interaction pattern, be ready to explain why.
- The prototype is a communication tool, not an art project. Its job is to make the feature idea tangible and credible.
