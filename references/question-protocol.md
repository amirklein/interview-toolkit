# How to ask questions

Every skill in this toolkit reads this file before it asks the user anything.

> **Installer-managed.** This file is replaced on every install and update, because it describes
> mechanics rather than anything about you. Your own edits belong in `profile.md` and `rubrics/`,
> which the installer never overwrites.

## The rule

**Every question with an enumerable set of answers MUST be asked through the environment's native
structured-question tool, not as chat text the person has to type a reply to.** Name the tool,
call it, and let them click.

This is not a stylistic preference. These skills ask a lot of questions — `profile-builder` alone
runs ten steps — and the difference between clicking and typing is the difference between a flow
someone finishes and one they abandon halfway with a half-built profile.

Two of the three supported environments actively bias *against* asking. Claude Code reserves its
question tool for decisions it can't infer on its own, and Codex's default mode is instructed to
prefer assumptions over questions. So the instruction here is deliberately imperative: when a
question is enumerable, you are not making a judgment call about whether to ask it structurally.
You are being told to.

## What the tool is called, and what it allows

| Environment | Tool | Options per question | Notes |
| --- | --- | --- | --- |
| Cursor | `AskQuestion` | no tight ceiling | `allow_multiple` for multi-select |
| Claude Code | `AskUserQuestion` | **2–4** | 1–4 questions per call; `header` ≤12 chars; ~60s to answer; unavailable inside subagents |
| Codex | `request_user_input` | **2–3** | 1–3 questions per call; plan mode only unless `default_mode_request_user_input` is set |
| Claude.ai / Desktop | whatever picker is available | — | fall back to text if there is none |

Don't guess which environment you're in from the model name. Look at the tool list you actually
have and use whichever of these exists. If none exists, use the text fallback below.

## Tiering: fit the question to the ceiling

The ceilings are real, and they are the reason this used to degrade into typing. A six-option
question cannot render in Claude Code or Codex, so the model drops to prose and the person is back
to typing free text at a questionnaire. Resize the question instead.

**If your picker has no tight ceiling** (Cursor), ask the full list as one question. One click is
better than two, and there is no reason to hobble the good case for the sake of uniformity.

**If your picker caps at 3 or 4**, never truncate the list and never silently drop to text. Narrow
in two clicks: one question that picks the family, then one that picks within it. Two clicks is
still clicking.

### The canonical narrowing trees

Use these exact groupings, so a person who runs two different skills is asked the same way twice.

**Discipline** (`profile-builder`, Step 1) — full list is product, design, engineering, sales,
support/CS, something else.

1. "Which is closest to your work?" → *Building the product* · *Selling or supporting it* ·
   *Something else — I'll describe it*
2. If building: *Product* · *Design* · *Engineering*. If selling or supporting: *Sales* ·
   *Support / Customer Success*.

**Stage** (`interview-toolkit`, Step 1) — full list is six stages.

1. "Where are you in this?" → *Starting out — brief in hand, or setting up* · *In the middle of the
   work* · *Nearly done — reviewing or presenting*
2. If starting out: *I just got the brief* · *I want to set up my profile*. If in the middle:
   *Working through it* · *I need a prototype or mockup*. If nearly done: *I have a draft to review*
   · *I have a follow-up interview*.

### Long multi-selects

Several gap lists run to five or six items and are multi-select. Don't cut them down to four.
Ask in successive passes of three or fewer — "any of these?", then "any of these?" — and carry the
accumulated selections forward. It costs one extra click and keeps the full menu, which matters
because the item someone would never have typed unprompted is often the true answer.

## Every structured question

- **Recommended option first**, with `(Recommended)` appended to its label, when you have a view.
- **Always leave an escape.** Claude Code and Cursor append "Other" automatically; Codex only shows
  it if you ask for it, so ask for it. If a question is genuinely skippable, include *Skip this*
  rather than making someone answer to move on.
- **Options must be mutually exclusive** for single-select. If two options lead to the same next
  step, it wasn't a fork and shouldn't be a question.
- **Never re-ask what they already told you.** Read the transcript first.

## What must stay free text

Do not force a picker onto the open invitations — the evidence questions, the signature stories,
"tell me about the assignment," "what are you worried about." Two reasons, and both matter more
than consistency:

The value of this toolkit comes from specifics only that person could supply. "Usage-based billing
for mid-market fintech" is worth something; picking *B2B SaaS* from a list is worth nothing, and a
profile built from menu selections produces exactly the generic answer these skills exist to
prevent.

And in Claude Code the question tool times out in about a minute. The questions worth thinking
about for two minutes are precisely the ones that would fail. Ask those as text, and give them
room.

Offering a few options *as examples to react to*, alongside an open invitation, is fine and often
helps someone start. That is different from constraining the answer to a list.

## Text fallback

When no picker exists, keep the click-like shape: state the question, then a numbered list, and say
plainly that a single number is a complete answer. Never present a numbered list and then ask for a
sentence.

## When Codex refuses

Codex only exposes `request_user_input` in plan mode unless a feature flag is set. If a call fails
with something like *"request_user_input is unavailable in Default mode"*, don't quietly switch to
typing at them. Say what happened once and give them the fix:

> "Codex only allows click-to-select questions outside plan mode if a flag is set. Add this to
> `~/.codex/config.toml` and restart, and the rest of this will be clickable:
> `[features]` / `default_mode_request_user_input = true`. For now I'll ask in text."

Then continue in the text fallback. Never block the work on a config change.
