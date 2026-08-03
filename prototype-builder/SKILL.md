---
name: prototype-builder
description: >
  Use this skill whenever someone needs to build a prototype, mockup, or interactive demo as part of a
  take-home assignment or interview exercise. Triggers include: I need to build a prototype, the
  assignment asks for a mockup, create a demo of this feature, show what this would look like,
  prototype this flow, build a clickable version. Also trigger when an assignment brief includes any
  request for visual demonstration, interactive mockup, or product simulation. This skill researches
  the real product first so the prototype matches actual UI patterns, then builds it with the new
  feature layered on top and a narrative that makes the thinking behind it visible. Works for any
  discipline; calibrates to the person via ~/.interview-toolkit/profile.md.
---

# Prototype Builder

## Purpose

Build a prototype that looks like it belongs inside the real product, so the evaluator spends their
attention on the idea rather than on decoding a generic wireframe.

Research first, build second, narrate third. The narration is not optional — an undefended prototype
is decoration.

---

## Before you start: load the profile

Read `~/.interview-toolkit/profile.md` if it exists. Two things are useful here:

- **Discipline** sets the standard the prototype is judged against. A designer's prototype is
  evaluated on craft and states; a product person's on whether the concept is clear and the reasoning
  visible; an engineer's on whether it actually runs. Load
  `~/.interview-toolkit/rubrics/<discipline>.md` for the bar.
- **Evidence** tells you what they know. If they've worked in this domain, the prototype should show
  it — real terminology, realistic data, the edge case only a practitioner would think to include.
  That specificity is more persuasive than polish.

If there's no profile, ask which discipline they're interviewing for and move on. Never block.

---

## Step 1 — Understand what's being asked

From the brief, extract:

- What product or feature needs prototyping
- Who the user is
- What flow or interaction has to be demonstrated
- The required format — the brief may specify; if not, see Step 4
- Whether this is a new feature on an existing product or a standalone concept
- **How much the prototype actually counts.** Sometimes it's the centerpiece; sometimes it's one
  slide's worth of support for a written argument. Building a twelve-screen prototype for the second
  case is a bad trade against the time budget.

If the brief is ambiguous on any of these, flag it before building.

---

## Step 2 — Research the real product

Non-negotiable when the assignment involves an existing product. The prototype has to be grounded in
the real thing, not a generic approximation.

**Find:**

- The actual UI — screenshots, the live product if it's reachable, demo videos, app store previews
- Design language: color palette, typography, component patterns (cards, modals, nav, buttons, empty
  states)
- Navigation structure and the main surfaces
- Tone: how the product talks to its users — formal, casual, dense, minimal
- The specific existing screens nearest to where the new feature would live

**Where to look:**

- The live product; sign up for a free tier if there is one
- App Store and Google Play screenshots
- Product Hunt pages, which often carry detailed screenshots
- Company blog, changelog, release notes
- YouTube demos and walkthroughs
- Public design systems or Figma files, if the company has shared them
- G2 and Capterra reviews, which frequently include user-uploaded screenshots

Document what you find and show the person, briefly. If the product isn't publicly visible at all,
say so and design from the closest comparable conventions instead — but say which conventions you
borrowed and why, because that reasoning is defensible and guessing silently is not.

---

## Step 3 — Define the scope

Agree before building:

- **Which screens** — the minimum that tells the story
- **Which interactions** — what the user does, what happens next
- **The narrative arc** — what this is supposed to demonstrate

A good assignment prototype tells one story. It doesn't cover every edge case; it makes the happy path
clear enough that the evaluator sees the thinking. Three to five screens that land beat fifteen that
feel unfinished.

One exception worth naming: if the discipline is design, the empty, loading, and error states *are*
the story, because their absence is the most common thing designers get marked down for. Check the
rubric.

---

## Step 4 — Build it

**Match the format to the environment.** The brief's requirement comes first, then whatever the
current tool does best:

- **Interactive React component** — the default in environments that render artifacts inline (Claude
  Desktop, Claude.ai). Click-through, state-driven UI, shareable in the conversation.
- **A single self-contained HTML file** — the best default in an IDE or terminal environment like
  Cursor, Codex, or Claude Code. One file, opens in any browser, no build step, easy to attach to an
  email or drop in a repo.
- **Static frames for a deck** — when the deliverable is slides, build the screens and export images
  rather than sending a link nobody will click.
- **Figma or a specific named tool** — if the brief demands it, say plainly that you can't produce a
  native file, and offer the strongest alternative: a high-fidelity HTML prototype that can be
  screenshotted into the required format. Let the person decide.

**Use the design language from Step 2.** Match the palette, the type hierarchy, the component
patterns, and the tone of UI copy. If the product uses dense tables, use dense tables — don't
translate it into cards because cards look nicer.

**Use realistic content.** Placeholder lorem ipsum and "User 1 / User 2" undercut everything else.
Real-sounding names, plausible numbers, and the vocabulary the product's actual users use signal
someone who has looked closely.

**New elements should feel native**, not bolted on. If the new feature needs a pattern the product
doesn't have, that's a design decision worth stating out loud in Step 5.

**Quality bar**: a reviewer should think *"this person has actually used the product and thought about
where this fits."* It should not read as a wireframe placeholder, and it should not read as a redesign
of things nobody asked you to touch.

---

## Step 5 — Narrate it

After building, write the short walkthrough the person can present:

- What the evaluator is looking at
- What problem it solves
- **What decisions were made and why** — including anything deliberately left out
- What V2 would add

This narrative is the layer that makes the prototype read as thinking rather than decoration. It's
also the rehearsal for the defense: every visible choice is something a panel can ask about, so any
decision that can't be explained here is a liability on the call. Flag those.

---

## Step 6 — Check it against the brief

Before calling it done:

- Does it answer what the brief actually asked for?
- Does it demonstrate the flow they wanted to see?
- Does it look credibly like the real product?
- Is it polished enough to submit without an apology attached?
- Did it stay inside the time it was worth? A prototype that consumed the hours meant for the written
  argument is a net loss, however good it looks.

If any answer is no, fix it before presenting it as finished.

---

## Standards

- **Research before building.** Always. A prototype that doesn't match the real product signals
  someone who didn't do their homework, and that impression outlasts the demo.
- **Fewer screens, higher fidelity.** Don't sprawl.
- **Every design decision should be defensible.** If you made a call about layout or interaction, be
  ready to say why.
- **It's a communication tool, not an art project.** Its job is to make the idea tangible and
  credible — and to make it obvious that a person with real judgment made it.
