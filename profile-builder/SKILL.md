---
name: profile-builder
description: >
  Use this skill when a person wants to personalize their interview-prep toolkit (thought-partner, assignment-framing, assignment-evaluator, prototype-builder) to their own specific gaps, instead of using the generic or default versions. Triggers include requests to personalize their skills, set up their profile, calibrate these to them, or any first-time setup of the toolkit after cloning the repo. Also trigger if someone wants to redo or update their profile after getting new feedback. This skill runs a short branching questionnaire (by discipline - product, design, engineering, sales, support) and then edits specific placeholder sections in the other four skill files. It does NOT rewrite the skills wholesale, only the named Watchlist and trap/risk callouts.
---

# Profile Builder

A diagnostic questionnaire that personalizes the interview-prep toolkit (`thought-partner`, `assignment-framing`, `assignment-evaluator`, `prototype-builder`) to the specific person using it — without requiring them to already know how to write a good self-assessment.

## Core principle

**The person using this skill is not a "candidate" — they are a professional with a real skillset, who is demonstrating it in an interview context.** Every question, every synthesized profile, and every piece of inserted text should reflect that framing. The goal is not to find what's wrong with them; it's to find where their existing skill isn't yet *visible* on paper, so it can be made visible.

## What this skill does NOT do

- It does not rewrite the four target skills wholesale.
- It does not touch the methodology sections (research steps, dimension frameworks, structure, tone guidance) — those are discipline-tested and not personal.
- It does not insert anything vaguer than what's already in the generic placeholder. If the questionnaire output isn't more specific than the default, leave the default alone.

## A note on how to ask

**Use your environment's native structured-question / multiple-choice UI tool for every question in this flow, not plain text.** Most agent environments that support this skill format (Cursor, Claude Code, Claude.ai/Desktop) have a dedicated tool for presenting selectable options to the user — sometimes called an "ask questions" tool, a form/UI tool, or similar — rather than just typing the question as a chat message. If such a tool is available to you, use it for every question below, including the multi-select gap questions, the ranking step, and the free-text invites (most of these tools support an open-text option alongside the choices). Only fall back to plain text questions if no such tool exists in your current environment. Defaulting to plain text when a structured tool is available makes the questionnaire slower and more error-prone for the person answering — this defeats much of the point of building it as a skill in the first place.

## The flow

### Step 1: Discipline select (single-select, no free text needed here)

Ask, using your native question UI if available: "What's your discipline?"
- Product
- Design
- Engineering
- Sales
- Support / Customer Success
- Something else (free text — if this comes up, do your best to map their answer to the closest existing branch's *structure*, and flag honestly that this branch isn't pre-built)

This determines which gap-option set loads next. See `references/discipline-branches.md` for the full option sets per discipline.

### Step 2: Level + context (within the selected branch)

Ask, using your native question UI, 1-2 questions calibrated to that discipline about seniority target and the type of environment they operate in (e.g. for Product: B2B/B2C/mixed; for Sales: SMB/enterprise; for Design: in-house/agency, etc.). Keep this short — it's context, not the diagnostic itself.

### Step 3: Gap identification (multi-select + free text, ALWAYS)

Every gap question must:
- Offer 4 discipline-relevant options (see references file)
- Always include a final option: "Something else — I'll describe it"
- Accept multiple selections

**Critical rule:** Free text is not a side option to be glossed over. If someone writes a free-text answer, you MUST follow up on it with a targeted question before moving on. Never let a free-text answer pass without engaging it.

Universal free-text follow-up template (use when you don't have discipline-specific texture to follow up with):
> "What did that look like the last time it happened? What was the actual feedback, in their words if you remember it?"

For the Product branch specifically, you have richer real-world calibration available (see `references/product-branch.md`) — use the sharper, more specific follow-ups documented there rather than the generic template.

### Step 4: Follow-up on each selected gap (multi-select + free text, ALWAYS)

For every gap they selected in Step 3, ask one follow-up using your native question UI, breaking it into more specific flavors. Same rule: multi-select, always include free text, always follow up on free text.

### Step 5: Forced ranking (single-select — NEVER multi-select)

This is the most important mechanical rule in this entire skill: **the ranking step must be single-select.** Its entire purpose is to force prioritization. If someone could select multiple "top" gaps, the exercise produces a list, not a profile, and the personalization downstream will be unfocused.

Ask, using your native question UI: "Of these, which has cost you the most — the one you'd fix first if you could only fix one?"

### Step 6: Final free-text invite on the ranked gap

After they rank, ask one more open question specifically about the #1 gap, using your native question UI's free-text option if it has one, or plain text if not (open-ended questions are the one case where plain text is often the more natural choice even when a UI tool exists):
> "Is there anything about how [ranked gap] shows up for you specifically that the questions above didn't quite capture?"

This is where the sharpest, most usable detail tends to surface (e.g., "my developers and designers are missing practical steps to take into action in sprints" — a concrete, falsifiable bar that's far more useful than "needs more execution depth").

### Step 7 (optional but valuable): Behavioral pattern under pushback

Ask, using your native question UI, how they tend to respond when someone pushes back on their thinking — in live conversation specifically, not just in writing. This one question can produce an instruction that changes *how Claude itself should behave* in the `thought-partner` skill (e.g., "push back at least twice before treating agreement as resolution" for someone who tends to cave under live pressure). This is a different and often more valuable kind of personalization than anything about document content.

Don't force this question if the flow already feels long — use judgment. But if it comes up naturally or the person seems rushed through earlier questions, it's worth asking explicitly.

## Synthesizing the profile

Once the questionnaire is complete, write a short synthesized profile with this structure:

```
Primary gap (ranked #1): [specific, falsifiable description — not "needs more X" but "outputs don't translate into Y"]
Secondary gap(s): [list, with the specific flavor from follow-ups]
Behavioral pattern (if surfaced): [how they respond to live pushback, and what that means for how the thought-partner skill should act]
```

**Test before inserting:** for each piece of this profile, ask — is this more specific than what's already in the generic skill's placeholder section? If not, don't insert it. A profile that just says "watch for hedging" isn't worth inserting over a generic Watchlist that already says that.

**Do not delete unflagged dimensions.** The generic skill's placeholder sections typically cover several dimensions (e.g., strategic depth, stakeholder coverage, execution, ownership, seniority signals). A given questionnaire run will usually surface only some of these as active concerns — that doesn't mean the others are irrelevant for this person, only that they weren't top-of-mind in this run. Keep every dimension the generic version covers; sharpen the ones the questionnaire flagged with the person's specific language, and keep the rest as a baseline general check (you can note explicitly that it wasn't flagged as a top concern this round). Shrinking the skill's coverage based on one incomplete questionnaire run is a regression, not a personalization.

## Applying the profile to the four skills

**Do not commit or push these changes to git, and do not ask to.** This is a local personalization step — the edited skill files should exist only on the person's machine, not in version control or any shared/main branch. If your environment (e.g. Cursor, Claude Code) prompts you to stage, commit, or push after editing files, decline that prompt and proceed with local file edits only. If asked, tell the person these are personal, local-only edits and they can choose to manage them in git themselves if they want — but you should never initiate or suggest a commit as part of this skill.

Each of the four target skills has named placeholder sections (typically called "Watchlist," "[Name]'s trap," or "[Name]'s specific risk here" in the original). Your job:

1. Open each target skill file
2. Locate the named placeholder sections only — do not touch methodology, structure, dimension frameworks, or tone guidance
3. Replace the placeholder content with the synthesized profile, written in the second person ("you tend to...", not "the user tends to...")
4. If the behavioral pattern from Step 7 was surfaced, add a short explicit instruction to `thought-partner`'s operating instructions (not just the Watchlist) — e.g., "If [person] agrees with your pushback quickly, push back at least once more before treating the agreement as resolved."
5. Show the person a before/after diff of what changed in each file before finalizing — don't silently overwrite.

**Watch for broken pronoun grammar.** If you do any bulk find/replace of a name (e.g. swapping a placeholder name for the actual person's name, or genericizing to "[Person]"), pronouns elsewhere in the sentence (he/him/his, she/her/hers, they/them) often don't match anymore. Don't trust a global substitution — read every sentence that was touched and fix grammar by hand. This is a real failure mode that's easy to miss on a skim.

## Re-running this skill

If someone wants to update their profile (new feedback, new role target, etc.), re-run the full flow rather than patching incrementally. Overwrite the placeholder sections fresh rather than appending to old ones — stale personalization is worse than no personalization.
