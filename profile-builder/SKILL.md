---
name: profile-builder
description: >
  Use this skill to set up or update someone's interview-toolkit profile — the file the other
  skills (thought-partner, assignment-framing, assignment-evaluator, assignment-defense,
  prototype-builder) read to calibrate to this specific person instead of running generic.
  Triggers include requests to set up the toolkit, personalize or calibrate these skills, build
  my profile, first-time setup after installing the toolkit, or wanting to redo the profile after
  new feedback or a change of target role. This skill runs a short branching interview by
  discipline (product, design, engineering, sales, support) covering both what the person has
  actually done and where their skill isn't yet visible on paper, then writes a single file at
  ~/.interview-toolkit/profile.md. It does not edit any skill files.
---

# Profile Builder

A short interview that calibrates the interview toolkit to one specific person, and writes the
result to `~/.interview-toolkit/profile.md`. Every other skill in the toolkit reads that file.

Takes about five to ten minutes. Run it once, re-run it when the person's target role or
feedback changes.

## Core principle

**The person using this skill is not a "candidate." They are a professional with a real
skillset, who is demonstrating it under artificial conditions.** Every question, and every line
you write into the profile, should reflect that.

The goal is not to find what's wrong with them. It is to find two things:

1. **What they've actually done** — so the toolkit can push their real experience onto the page
   instead of helping them write competent, anonymous work.
2. **Where their existing skill isn't visible yet** — so the toolkit knows what to check before
   a real reviewer does.

Half of this interview is the first thing. That half is not optional, and it comes first — the
frame matters. Someone who has just been laid off does not need to open with twenty minutes on
their deficiencies.

## What this skill does NOT do

- **It does not edit skill files.** Everything it produces goes into one file:
  `~/.interview-toolkit/profile.md`. Earlier versions of this toolkit rewrote sections inside
  each `SKILL.md`, which broke on every update and fought with git. Don't do that.
- It does not invent evidence. Everything in the Evidence and Signature stories sections comes
  from the person's own answers. If they didn't say it, it doesn't go in.
- It does not write anything vaguer than the rubric already checks. If an answer isn't more
  specific than "watch for hedging," leave it out — a vague profile is worse than none, because
  it displaces the general checks with noise.

## A note on how to ask

**Use your environment's native structured-question UI for every question in this flow, not
plain chat text.** Most environments that support this skill format (Cursor, Claude Code,
Claude.ai/Desktop, Codex) have a dedicated tool for presenting selectable options — an "ask
question" tool, a form tool, or similar. Use it for every question below: the multi-selects, the
ranking step, and the free-text invites (most such tools support an open-text option alongside
the choices).

Only fall back to plain text if no such tool exists in your environment. Typing questions as
chat messages when a picker is available makes this slower and more error-prone to answer,
which defeats much of the point of building it as a skill.

The one exception: the two fully open-ended invites (Step 4 and Step 8) are often more natural
as plain text even when a UI tool exists. Use judgment.

---

## Step 1 — Discipline

Ask: "What's your discipline?" Single-select.

- Product
- Design
- Engineering
- Sales
- Support / Customer Success
- Something else — I'll describe it

This determines which gap options load in Step 5, and which rubric the rest of the toolkit will
use. See `references/discipline-branches.md` for the option sets.

If they pick "something else," map their answer to the closest existing branch's *structure*,
and say plainly that this branch isn't pre-built — then offer that they can write their own
rubric at `~/.interview-toolkit/rubrics/<discipline>.md` using the `_template.md` in that
folder as the shape.

## Step 2 — Level and context

One or two short questions, calibrated to the discipline, about the seniority they're targeting
and the kind of environment they work in (Product: B2B/B2C/mixed; Sales: SMB/enterprise; Design:
in-house/agency; and so on).

Keep this fast. It's context, not diagnosis.

## Step 3 — Evidence: what they've actually done

**Do not skip this and do not rush it.** This is the half of the profile that makes the
difference between the toolkit helping someone write a good generic answer and helping them
write an answer only they could have written.

Ask, using your question UI where the options help and free text where they don't:

**3a — Domains they know cold.** "What subject areas do you know well enough that you'd catch
something a smart outsider would miss?" Offer a few discipline-plausible examples as options to
react to, always with free text. You're looking for specifics — "usage-based billing," not
"SaaS."

**3b — What they've shipped or owned.** "What are the two or three things you've actually
shipped or owned end to end?" Free text, and follow up for scale: how long, how many people,
what changed as a result. Numbers matter here — they're what make the story usable later.

**3c — Scale and shape of environment.** Company size, team size, book of business, whatever's
the relevant unit for their discipline. One question.

**3d — The unfair advantage.** "Is there anything in your background that most people competing
for the same role won't have?" This is often the single most useful answer in the whole
interview — someone who did five years in ops before moving into product reads a workflow brief
differently, and that should show up in their assignments. Free text, and follow up on it.

### Signature stories

From 3b, pick the two or three strongest and pin down what each one *proves*. Ask directly:
"What does that story demonstrate about how you work?"

This mapping is the point. A story is only useful in an assignment if it's attached to a claim.
"Cut quote-to-close from 11 days to 2" is a fact; "proves you find revenue in workflow friction
nobody else looks at" is the reason to include it.

## Step 4 — Free-text invite on evidence

Before moving to gaps, one open question:

> "Anything you're proud of that the questions above didn't give you room to say?"

People routinely surface their best material here, because the structured questions were about
categories and this one is about them.

---

## Step 5 — Gap identification

Now the other half. Frame the turn explicitly — something like: "Now the less fun half. Not
what you're bad at: where what you're already good at doesn't make it onto the page."

Every gap question must:

- Offer 4 discipline-relevant options (see `references/discipline-branches.md`)
- Always include a final "Something else — I'll describe it"
- Accept multiple selections

**Critical rule:** free text is not a side option to skim past. If someone writes a free-text
answer, you MUST follow up on it with a targeted question before moving on. That's where the
usable detail lives.

Universal free-text follow-up, when you have no discipline-specific texture to work with:

> "What did that look like the last time it happened? What was the actual feedback, in their
> words if you remember them?"

For the Product branch you have richer calibration available — use the sharper follow-ups in
`references/product-branch.md` rather than the generic template.

## Step 6 — Follow up on each selected gap

For every gap selected in Step 5, ask one follow-up that breaks it into more specific flavors.
Same rules: multi-select, always a free-text option, always engage the free text.

## Step 7 — Forced ranking

**This step must be single-select.** It is the most important mechanical rule in this skill.

Its entire purpose is to force prioritization. If someone can pick multiple "top" gaps, the
exercise produces a list instead of a profile, and everything downstream is unfocused.

Ask: "Of these, which has cost you the most — the one you'd fix first if you could only fix
one?" List exactly the gaps they selected in Step 5, not the sub-flavors.

## Step 8 — Free-text invite on the ranked gap

> "Is there anything about how [ranked gap] shows up for you specifically that the questions
> above didn't quite capture?"

This is where the sharpest material tends to surface. A strong answer sounds like *"my
developers and designers can't pull practical actions out of what I hand them"* — a concrete,
falsifiable bar, far more useful than "needs more execution depth." When you get one, the
profile should use their bar in their words.

## Step 9 — Behavioral pattern under pushback

Ask how they tend to respond when someone pushes back on their thinking — in live conversation
specifically, not just in writing.

This one question can produce an instruction that changes how the agent itself behaves in
`thought-partner` and `assignment-defense` (for example: "push back at least twice before
treating agreement as resolution"). That's a different and often more valuable kind of
personalization than anything about document content, because it changes the conversation the
person is having right now.

Don't force it if the flow already feels long. But if they seemed to rush earlier questions,
it's worth asking.

## Step 10 — Directness preference

Ask: "How directly do you want this toolkit to challenge you?" Single-select.

- **Gentle** — state the issue clearly, then offer a way in.
- **Direct** — default. Name the risk plainly and move to the fix.
- **Brutal** — simulate an impatient reviewer; concise, exacting, never insulting.

This changes delivery, not standards. A gentle setting must not hide a failing verdict, and a
brutal setting must not turn into performative hostility. If they skip the question, write
`Directness preference: direct`.

---

## Writing the profile

Read `references/profile-template.md` for the exact format and the rules for writing it. Then
write the file:

1. **Create `~/.interview-toolkit/` if it doesn't exist.**
2. **Write `~/.interview-toolkit/profile.md`** following the template.
3. **Show the person the full file** before or immediately after writing it, and offer to adjust
   anything. Never write it silently — this is a document about them, and they should recognize
   themselves in it.
4. **Confirm the discipline rubric exists** at `~/.interview-toolkit/rubrics/<discipline>.md`.
   If it's missing (they installed by hand, or picked a discipline with no rubric), say so and
   offer to create one from `_template.md` in that folder.

If your environment has no filesystem access — for example, skills uploaded to Claude.ai — you
can't write the file. Say so plainly, output the full profile in the chat, and tell them to save
it as `~/.interview-toolkit/profile.md` themselves, or to paste it at the start of sessions with
the other skills.

### Rules for what goes in

**Specific and falsifiable, or leave it out.** The test for every line: could you run this
against a draft and get a yes or no? "Needs more depth" fails. "An engineer can't pull three
sprint tickets from this section" passes.

**Use their words.** When someone gives you a sharp phrase for their own pattern, keep it
verbatim. Your restatement will be blander than what they said.

**Don't drop the dimensions that didn't come up.** A single run surfaces what was top-of-mind,
not the complete picture. List unflagged dimensions under "Not flagged this round" so the rubric
still checks them at a baseline level. Narrowing the toolkit's coverage based on one incomplete
interview is a regression, not a personalization.

**Watch pronoun grammar.** If you do any find/replace on names or pronouns while drafting, read
every touched sentence. Global substitutions leave broken grammar that's easy to miss on a skim.

### This file is personal and local

`~/.interview-toolkit/profile.md` lives outside the repo, so nothing about it touches version
control. Don't offer to commit it, and don't copy it into the toolkit folder. If someone wants
it backed up or synced, that's their call to make, not something this skill initiates.

## Re-running

Re-run the full flow rather than patching. Overwrite the file rather than appending — stale
personalization is worse than none.

Two shortcuts worth offering when someone re-runs:

- **Evidence usually holds; gaps change.** If they ran this recently and only have new feedback,
  offer to keep Steps 1–4 as-is and redo Steps 5–9.
- **Multiple targets.** If they're interviewing for meaningfully different roles, they can keep
  more than one profile — `profile.md` is what loads by default, and something like
  `profile-growth.md` alongside it can be pointed at explicitly in a session. Mention this only
  if it's relevant; it's a power-user path, not the default.
