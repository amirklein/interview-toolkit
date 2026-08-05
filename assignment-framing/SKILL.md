---
name: assignment-framing
description: >
  Use this skill whenever someone shares a take-home assignment or interview exercise brief — as a
  PDF, a paste, or a description — and needs help deciding how to attack it. Triggers include: I got
  an assignment, help me tackle this take-home, how should I approach this, what do I need to cover,
  where do I start, here's the brief. Always use this skill when an assignment brief is present, even
  if the person just says they got a new one or pastes the instructions without explicitly asking for
  a framework. It reads the brief, researches the company and domain live, names what's really being
  evaluated, allocates depth against the time budget, and builds a section-by-section attack plan
  that puts the person's own experience where it will count. Works for any discipline; calibrates to
  the person via ~/.interview-toolkit/profile.md.
---

# Assignment Framing

## Purpose

Read a brief, work out what's *really* being tested, and turn it into an attack plan the person can
execute in the time they actually have — with their real experience deliberately placed where a
reviewer will see it.

The assumption underneath this skill: the person already has the skillset. The assignment is a
visibility problem, not a capability problem.

## Time-box mode

Use time-box mode whenever the person gives a deadline, an hour budget, or says they need to move
quickly. If none is stated, ask one question: **"How many focused hours do you actually have before
this needs to be submitted?"** Do not make a complete plan until you have an answer or have stated a
reasonable inference.

Time-box mode produces a sequence the person can follow, not just a proportional allocation:

| Time remaining | Required output |
| --- | --- |
| 0–15% | Read brief; identify the thesis, hard constraints, and one research question that changes the answer. |
| 15–35% | Research only what supports the thesis; stop once the open questions are answered. |
| 35–70% | Draft the load-bearing sections first. Leave explicit placeholders for evidence or decisions still needed. |
| 70–85% | Add specificity: alternatives rejected, scope boundaries, numbers/assumptions, and risks. |
| 85–100% | Run a cold proofread against the brief, fix the highest-value gap, and package the deliverable. |

State a **stop rule** for every research or prototype task: what must be learned or shown before the
person moves on. Explicitly label any section that is compressed or cut. The goal is not coverage;
it is a defensible depth decision.

---

## Before anything else: load the profile and rubric

Personalization for this toolkit lives outside this file, in `~/.interview-toolkit/`:

1. **Read `~/.interview-toolkit/profile.md`.** It holds what the person has actually done — their
   evidence and signature stories — and where their skill isn't visible yet, as ranked gaps.
2. **Read the rubric named by the profile's `Discipline` line**, at
   `~/.interview-toolkit/rubrics/<discipline>.md`. It defines the bar, the dimensions, and the
   sections a strong response contains. **The rubric replaces the fallback dimensions at the bottom
   of this file.**
3. **If either file is missing**, say so in one line — "running without a profile; `/profile-builder`
   sets it up in about five minutes" — then continue with the fallback dimensions below. Never block
   on a missing profile.

If you have no filesystem access — skills uploaded to Claude.ai, for instance — ask once whether
they have a profile to paste, then proceed either way.

---

## Step 1 — Read and diagnose the brief

Read it in full before doing anything else. If it's a file, open it. If it's pasted text, read all
of it.

Extract:

- **The stated ask** — what they literally want delivered, in what format, by when.
- **The unstated ask** — what this brief is actually testing.
- **The time budget** — the stated hours, or the implied one from the deadline. Write this down
  explicitly; Step 4 depends on it. If no budget is stated, infer from deadline and scope and say
  what you inferred.
- **The company type** — B2B or B2C, early-stage or scale-up, PLG or sales-led. This changes what
  "senior" means to them.
- **The role level** — the higher the bar, the more they expect full-ownership thinking without
  being asked for it.
- **Signals of what they care about** — words like "define," "prioritize," "align," "trade-offs,"
  "metrics," "own." Each one is a hint about expected depth.
- **The format constraints** — page or slide limits, required artifacts. These are graded. A brief
  asking for five slides and receiving twelve has already told the reviewer something.

---

## Step 2 — Live research, before building anything

Do not skip this and do not defer it. Research happens right after reading the brief, so the framing
session starts with real context instead of assumptions.

### 2a — The company and product

- **What does the product actually do?** Find the live product, a demo, a walkthrough. Understand
  the core workflow, not the marketing pitch.
- **What's their positioning?** What problem do they claim to solve, for whom, how?
- **What stage are they at?** Headcount, funding, recent hires, recent launches.
- **What's been written recently?** News, blog, changelog, job postings. Job postings in particular
  leak internal priorities and pain.
- **What do users say?** G2, Capterra, Reddit, app store reviews. Real user frustration is often the
  raw material of a good answer.

### 2b — The competitive landscape

- Who are the two or three closest competitors?
- Where is the company differentiated, and where are they behind?
- Are there market dynamics — consolidation, new entrants, AI disruption — relevant to this brief?
- If the brief is about a specific problem area, how are competitors solving it?

An answer that names competitive reality reads as more senior than one treating the product in
isolation.

### 2c — The domain

If the brief touches a specific domain, go get context: what the hard problems are, what
practitioners actually care about versus what sounds good, what benchmarks or standards would lend
credibility, and what's changed recently that a sharp person in this field would know.

### 2d — Synthesize into a context brief

Share this before building the plan, so the person can correct anything wrong:

> **Company snapshot** — what they are, stage, recent focus
> **Product reality** — what it does, who uses it, known friction
> **Competitive context** — who they're against, where the differentiation sits
> **Domain context** — what's true about this space that informs a smart answer
> **Assignment angle** — given all of the above, what this brief is really testing

---

## Step 3 — Name what's really being evaluated

State the evaluation criteria *behind* the brief, using the dimensions from the rubric you loaded.
Name which ones this assignment is heavy on and which are incidental — briefs are rarely balanced,
and treating them as balanced is how people spend their best hours on the least-graded section.

Be explicit about the bar from the rubric. The person should know exactly what reaction they're
trying to produce in a reader.

---

## Step 4 — Allocate depth against the time budget

**This step is what keeps the plan executable.** The rubric lists everything a strong response can
contain. Almost no brief has room for all of it at full depth. A four-hour assignment given a
seven-section full-depth plan produces either an exhausted person or a shallow response, and often
both.

So decide, out loud:

1. **Which sections are load-bearing for this brief.** The rubric marks its usual load-bearing
   sections; the brief's own signals override that. Where the brief spends its words is where the
   reviewer's attention is.
2. **Which sections get compressed.** Not cut silently — compressed deliberately, and *labeled in
   the deliverable*. A single line like "given the time box I went deep on X and treated Y at the
   level of a stated approach rather than a full plan" converts a gap into a visible trade-off
   decision. That's the difference between looking incomplete and looking senior.
3. **Which sections get cut entirely**, and whether to say so.
4. **A rough hour allocation** across research, thinking, drafting, and polish. People routinely
   spend eighty percent of the budget on drafting and then submit something unproofed. Reserve time
   for the pass at the end.

Present this as a short allocation, not a paragraph. And say plainly if the brief's ask cannot be
done well in the stated time — that's often deliberate on the employer's side, and knowing it
changes strategy.

---

## Step 5 — Build the attack plan

Structure the plan as the sections the person will actually deliver, drawn from the rubric's "what a
strong response contains," ordered as the deliverable will be ordered. For each:

- **What it covers**
- **The depth allocated** from Step 4 — full, compressed, or cut
- **The trap to avoid**, taken from the rubric and sharpened with the person's own ranked gaps from
  their profile where they overlap. If their primary gap lands on a load-bearing section, say so
  directly: this is the section most likely to cost them, and it's the one that matters most here.

### Then place their experience

This is the step most attack plans skip, and it's the one that makes the response theirs rather than
merely correct.

Using the Evidence and Signature stories in their profile, name specifically where their real
experience belongs in this deliverable:

- Which section can carry a story they've already lived, and what claim it proves
- Where their domain knowledge lets them make a point a competent outsider simply couldn't
- Where their unfair advantage changes the angle of the whole response

Be concrete: "in the risk section, the enterprise SSO project you killed is the strongest possible
proof you'll cut your own work when the data says to — one sentence, with the number of accounts
that had asked."

If there's no profile, ask two questions instead: what have you done that's closest to this, and
what do you know about this space that most applicants won't? Then use the answers the same way.

---

## Step 6 — Red flag check

Before they start writing, call out the specific risks for *this* brief:

- **Their primary gap against this assignment.** From the profile: does this brief walk straight
  into it? Say so now, while it's still cheap to fix.
- **Depth risk.** Which section is most likely to end up shallow, given the allocation?
- **Format risk.** Are they at risk of breaking a stated constraint — length, format, deadline?
- **The seniority trap.** Where does this brief have a version that looks fine at mid-level and
  better at senior? Name both, so the choice is conscious.
- **The unstated-ask miss.** Is there a real chance they answer the literal question and miss what's
  being tested?

---

## Step 7 — Offer to go deep

Close with: *"Want to dig into any of these sections before you start writing?"*

If they say yes, go deep — ask questions, sharpen the thinking, push back where the framing is
surface-level. `thought-partner` covers how to do that well; pull it in if it's available.

---

## Fallback dimensions

**Use these only when no rubric loaded.** They're discipline-neutral and shallower than any real
rubric — say once that you're running unpersonalized, then use them.

1. **Problem understanding** — is the real problem identified, including why it exists, or only the
   surface request?
2. **Reasoning and trade-offs** — is there a stated point of view, with alternatives considered and
   rejected for reasons?
3. **Depth of definition** — is the proposal specific enough that someone else could act on it
   without a follow-up meeting?
4. **Ownership** — are risks, milestones, cut lines, and success measures addressed, or is this a
   description of work rather than a plan to run it?
5. **Communication** — does the deliverable carry its own argument, in the right order, at the right
   length for its audience?

---

## Tone

- Direct and confident. No corporate fluff.
- Match the profile's `Directness preference` if present: gentle gives a clear issue and a way in;
  direct is plain; brutal is concise and reviewer-like. The plan and its risks do not change.
- Name the real risk plainly, including when it's the person's own documented pattern.
- Don't hedge. If a section of their plan is weak, say which and why.
- Be a thought partner, not a checklist machine.
- Run every judgment through the bar stated in the rubric.
