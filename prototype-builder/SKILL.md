---
name: prototype-builder
description: >
  Use this skill whenever someone needs to build a prototype, mockup, or interactive demo as part of a
  take-home assignment or interview exercise. Triggers include: I need to build a prototype, the
  assignment asks for a mockup, create a demo of this feature, show what this would look like,
  prototype this flow, build a clickable version, write me a Lovable or v0 prompt for this. Also
  trigger when an assignment brief includes any request for visual demonstration, interactive mockup,
  or product simulation. This skill researches the real product first so the prototype matches actual
  UI patterns, then builds it in whatever environment the person is already working in — real files in
  an IDE, an interactive artifact in a chat — with the new feature layered on top and a narrative that
  makes the thinking behind it visible. It can instead write a prompt for a prototyping tool like
  Lovable or v0 if the person prefers to keep iterating there. Works for any discipline; calibrates to
  the person via ~/.interview-toolkit/profile.md.
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

## How to ask

Read `~/.interview-toolkit/references/question-protocol.md` before the first question and follow it.

The short version: every question with an enumerable set of answers goes through your environment's
structured-question tool — `AskQuestion` in Cursor, `AskUserQuestion` in Claude Code,
`request_user_input` in Codex — so the person clicks instead of typing. Where that tool caps the
option count (four in Claude Code, three in Codex), narrow across two questions rather than
truncating the list or falling back to prose. Open-ended invitations stay free text.

The build-here-or-write-a-prompt choice in Step 4 is exactly this: two options, one click.

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

## Step 4 — Build it, here

**The default is to build the prototype yourself, right now, in whatever the person is already
working in.** Don't send them somewhere else to make it. You have the product research from Step 2
in context, you can iterate on a sentence of feedback, and the result is a file they own rather than
a project in someone's cloud account.

What that means depends on where you're running, and you should just pick and go:

- **In an IDE or terminal agent** (Cursor, Claude Code, Codex) — write real files into the workspace.
  Default to **one self-contained HTML file**: opens in any browser, no build step, no dependencies,
  easy to email or drop into a repo. Reach for a small React or Vite app only when the interaction
  genuinely needs it, because a build step the person has to run is a build step that breaks the
  morning it's due. Where you can, open it or screenshot it and check your own work.
- **In a chat that renders artifacts** (Claude.ai, Claude Desktop) — build it as an interactive React
  component. Click-through, state-driven, visible in the conversation.
- **When the deliverable is a deck** — build the screens, then capture them as images. A slide with a
  real screenshot beats a link nobody will open during a review.

### If they'd rather use a prototyping tool

Some people would prefer to build in Lovable, v0, Bolt, Replit, or similar — because they want to keep
iterating there afterwards, or because it's what they know. That's a legitimate choice, so offer it
once, plainly, and don't argue:

> "I can build this here, or write it up as a prompt you can paste into Lovable or v0. Building here
> is faster to iterate and gives you a file you own; the prompt is better if you want to keep working
> on it in that tool afterwards."

If they choose the prompt, it isn't a one-liner. Carry everything the research earned, or the tool
will produce a generic app and the credibility gained in Step 2 is thrown away:

- The design language from Step 2 — palette with actual hex values, type hierarchy, component patterns,
  border and spacing feel, tone of UI copy
- Every screen and state to produce, in order, and what each one is for
- The realistic content: real-sounding names, plausible numbers, the product's own vocabulary
- The interactions that matter, and what happens on each
- An explicit instruction not to redesign or "improve" the surrounding product

Hand it over as a single pasteable block, and offer to revise it once they've seen the first output.

### If the brief names a tool

If it demands Figma, or a specific named tool you can't write to, say so plainly rather than pretending
otherwise. Then offer the strongest available path — usually a high-fidelity prototype built here and
screenshotted into the required format — and let the person decide. Don't quietly substitute.

### Whichever path

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

If you wrote a prompt for a prototyping tool instead of building it, the same questions apply to
whatever comes back — so ask to see it. A prompt that produced a generic app hasn't done the job, and
one more round of revision is much cheaper than submitting it.

---

## Standards

- Match the profile's `Directness preference` when giving feedback on the result. It affects wording,
  not the quality bar or the decision to send a prototype back for revision.
- **Build it where they are.** Sending someone to another tool by default costs an account, a fresh
  start, and everything you already learned about the product. Offer that path; don't take it unasked.
- **Research before building.** Always. A prototype that doesn't match the real product signals
  someone who didn't do their homework, and that impression outlasts the demo.
- **Fewer screens, higher fidelity.** Don't sprawl.
- **Every design decision should be defensible.** If you made a call about layout or interaction, be
  ready to say why.
- **It's a communication tool, not an art project.** Its job is to make the idea tangible and
  credible — and to make it obvious that a person with real judgment made it.
