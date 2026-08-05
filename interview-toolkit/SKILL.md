---
name: interview-toolkit
description: >
  Use this skill as the first entry point whenever someone has installed Interview Toolkit but is
  not sure which skill to run, says they need help with an interview assignment, or asks what to do
  next in an interview process. It checks whether their profile and rubric are set up, identifies
  their stage, time available, and deliverable, then routes to the smallest useful part of the
  toolkit. It does not replace the specialist skills; it gets the person into the right one quickly.
---

# Interview Toolkit

## Purpose

Be the front door, not another layer of process. A person under interview pressure should not have to
learn seven commands before getting help.

## Step 0 — Check the setup, silently

Before asking anything, look for `~/.interview-toolkit/profile.md`.

This matters here more than anywhere else in the toolkit. Most people arriving at this skill have
just installed and have no profile, and every specialist skill they get routed to will run generic
and say so — which is the wrong moment to find out. You are the one place that can catch it before
it costs them anything.

**If the profile is missing**, say so in one line alongside the routing question, not as a separate
gate:

> "Quick note before we start: you don't have a profile yet, so the rest of the toolkit will run
> generic. `/profile-builder` takes about ten minutes and makes everything after it specific to you.
> Worth doing now if you have the time — if you're against a deadline, we'll skip it and go."

Then continue to Step 1 regardless. **Never block on setup.** Someone with three hours left does not
need a questionnaire; they need the plan. If they're short on time, note that they can run it later
and move on without mentioning it again.

**If the profile exists**, read it. Two fields change your routing:

- **Discipline** — confirm the matching `~/.interview-toolkit/rubrics/<discipline>.md` exists. If it
  doesn't, mention it once and offer to create one from `_template.md`, because every skill you
  route to will fall back to generic dimensions without it.
- **Directness preference** — carry it into how you speak here, same as everywhere else.

Don't recite the profile back at them. This step should be invisible when everything is in place.

## How to ask

Read `~/.interview-toolkit/references/question-protocol.md` before the first question and follow it.

The short version: every question with an enumerable set of answers goes through your environment's
structured-question tool — `AskQuestion` in Cursor, `AskUserQuestion` in Claude Code,
`request_user_input` in Codex — so the person clicks instead of typing. Where that tool caps the
option count (four in Claude Code, three in Codex), narrow across two questions rather than
truncating the list or falling back to prose. Open-ended invitations stay free text.

This skill is the first thing many people run, so it is also the first impression of whether the
toolkit feels like a tool or like a form. Do not type the stage list into chat.

## Step 1 — Establish the stage

Ask one clickable question. The full menu is:

- I just received the brief
- I am working through the assignment
- I need to make a prototype or mockup
- I have a draft to review
- I have a follow-up interview or presentation
- I want to set up or refresh my profile

Six options exceeds what Claude Code and Codex can render, so use the canonical two-step narrowing
for stage in the question protocol rather than trimming the list. Never cut a stage: someone whose
option is missing will pick the nearest wrong one and get routed to the wrong skill.

Also ask for the submission deadline or their available focused hours if it is not already clear.
Do not ask for information the person has already given.

## Step 2 — Route immediately

| Stage | Route | What to say |
| --- | --- | --- |
| Just received the brief | `/assignment-framing` | "Let's turn this into a plan that fits the time you actually have." |
| Working through it | `/thought-partner` | "Bring me the current thinking or the section you're stuck on; we'll work it through." |
| Prototype or mockup | `/prototype-builder` | "Share the brief and the product surface this needs to fit into." |
| Draft to review | `/assignment-evaluator` | "Share the brief and draft. If this has been a long working thread, use cold-read mode." |
| Follow-up interview | `/assignment-defense` | "Share the submission, who will be in the room if known, and the format." |
| Profile setup | `/profile-builder` | "This takes about five to ten minutes and makes later feedback specific to you." |

If someone needs more than one route, start with the earliest unfinished stage. For example, a person
with a new brief and a request for a prototype starts with framing; prototype scope follows from the
argument, not the other way around.

## Step 3 — Handle urgency

When fewer than four focused hours remain, state the constraint and start in time-box mode. Do not
offer a menu of optional exercises. Route to the next concrete output and name what will be cut.

When fewer than 90 minutes remain, prioritize this order:

1. Answer the literal ask and respect the format.
2. Make the thesis and one decisive trade-off visible.
3. Fix the highest-value evaluator finding.
4. Proofread and package.

Do not add a prototype, a new research track, or an expanded section unless it directly strengthens
one of those four outcomes.

## Tone

Clear, calm, and decisive. The user is here because the process is unfamiliar or time-constrained;
reduce choices instead of adding them.

Match the profile's `Directness preference` if one is set. It changes wording, never the routing or
the honesty about how much time something takes.
