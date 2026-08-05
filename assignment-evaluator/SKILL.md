---
name: assignment-evaluator
description: >
  Use this skill whenever someone shares a completed take-home assignment or interview exercise and
  wants evaluation, critique, or feedback before submitting. Triggers include: review my assignment,
  what's missing, how does this look, is this good enough, evaluate this, grade this, poke holes in
  this, what would a reviewer think. Also trigger when someone shares both a brief and a completed
  response in the same conversation and asks for any form of assessment. Has two modes: a standard
  evaluation, and a cold read that deliberately ignores conversational history to simulate a real
  reviewer seeing the work for the first time. Works for any discipline; calibrates to the person via
  ~/.interview-toolkit/profile.md.
---

# Assignment Evaluator

## Purpose

Give honest, specific, calibrated feedback *before* a real reviewer does — with a sharp eye on the
gaps most likely to cost the offer, and on whether the person's actual capability made it onto the
page at all.

Not cheerleading. Not generic. Real.

---

## Before anything else: load the profile and rubric

Personalization for this toolkit lives outside this file, in `~/.interview-toolkit/`:

1. **Read `~/.interview-toolkit/profile.md`.** It holds what the person has actually done and their
   ranked gaps.
2. **Read the rubric named by the profile's `Discipline` line**, at
   `~/.interview-toolkit/rubrics/<discipline>.md`. Its dimensions and its stated bar are what you
   evaluate against, and **they replace the fallback dimensions at the bottom of this file.**
3. **If either file is missing**, say so in one line — "running without a profile;
   `/profile-builder` sets it up in about five minutes" — then use the fallback dimensions. Never
   block on a missing profile.

**One exception, and it matters:** in cold-read mode you load the rubric but hold the profile's gap
list back until after the verdict. See the cold-read section below for why.

If you have no filesystem access, ask once whether they have a profile to paste, then proceed either
way.

---

## How to ask

Read `~/.interview-toolkit/references/question-protocol.md` before the first question and follow it.

The short version: every question with an enumerable set of answers goes through your environment's
structured-question tool — `AskQuestion` in Cursor, `AskUserQuestion` in Claude Code,
`request_user_input` in Codex — so the person clicks instead of typing. Where that tool caps the
option count (four in Claude Code, three in Codex), narrow across two questions rather than
truncating the list or falling back to prose. Open-ended invitations stay free text.

Cold-read mode is the obvious one to make clickable, since it's a binary with a real trade-off.

## Step 1 — Ingest both documents

You need two things:

1. **The brief** — what was asked
2. **The completed work** — what they're about to submit

If the brief is missing, ask for it before proceeding. You cannot judge whether something answered
the question without knowing the question. If they can't produce it, say plainly that the evaluation
will be weaker for it, then continue.

Read files fully — PDF, PPTX, DOCX, whatever — before commenting on any of it.

Also establish, in one question if it isn't obvious: **what's still changeable?** An evaluation
delivered two hours before a deadline should prioritize differently from one delivered three days
out. Ruthlessly rank by what they can still act on.

---

## Step 2 — First-pass read, no critique

Read the whole thing through before forming opinions. On this pass, note only:

- What is this person actually doing here — their thesis, structure, depth?
- What impression does it leave on one read?
- What would a reviewer *feel* on finishing? Excited, underwhelmed, confused, impressed with
  reservations?

Hold these. Step 5 uses them, and they're easy to lose once you start listing gaps.

---

## Step 3 — Evaluate against the rubric

Work through each dimension from the loaded rubric. For each, do three things:

1. **Call it.** Strong, adequate, or weak. One word, stated plainly before the explanation. Prose
   without a verdict lets everyone avoid the conclusion.
2. **Cite the evidence.** Quote or point to the specific passage. "Section 3 is thin" is unusable;
   "Section 3 names the feature and never defines the inputs or the fallback" is actionable.
3. **Check the rubric's common risk.** Each dimension names the way capable people lose points there.
   Check it explicitly, every time, even when the section looks fine — that's the entire reason it's
   written down.

Weight the brief's emphasis. A dimension the assignment barely touches shouldn't be graded as
heavily as one it's built around. Say which dimensions you're weighting and why.

**If the profile ranks specific gaps, check those first and hardest** — but check every dimension.
A ranked gap list is a priority order, not a scope reduction.

---

## Step 4 — Prioritize the gaps

Produce an ordered list, most damaging first:

> **[Gap name]** — what's missing or weak, why it matters to this reviewer, and the specific thing
> to add or change.

Be surgical. Three to five items that would actually change the hiring decision, not ten that would
make the document marginally better. If everything is flagged, nothing is prioritized, and the
person will fix the easy ones and run out of time before the important one.

Mark anything that's cheap to fix and high-value. Those go first regardless of rank.

---

## Step 5 — Is their capability visible?

This is the question the whole toolkit exists for, and it's a different question from "is this
good."

Using the Evidence and Signature stories in their profile, ask:

- **Could anyone competent have written this, or could only this person have written it?** Generic
  strength is the most common ceiling on otherwise good submissions.
- **Where is their real experience missing from the page?** Name the specific section where a story
  they've actually lived, or domain knowledge they actually hold, would have made the point better
  than the reasoning currently there.
- **Where did they under-claim?** People routinely describe something they *ran* in the passive
  voice, or leave out the number that makes it impressive. Find those and say so.
- **Is there anything claimed here they can't defend on a call?** The inverse failure, and worse —
  flag it hard. Everything in a submission is fair game for the follow-up interview.

If there's no profile, ask directly: what's the closest thing you've actually done to this? Then
check whether it's on the page.

---

## Step 6 — The one-paragraph verdict

Return to the Step 2 impression and answer plainly, in one paragraph, no hedging:

- Does this clear the bar the rubric states? Yes or no.
- Is there a moment where the reader thinks *"this person is operating above what we asked for"*? If
  not, where should it be?
- What is the single change that would most move a reviewer's impression?

This paragraph is the most useful thing in the whole evaluation. Write it last and put it first when
you present.

---

## Step 7 — Concrete recommendations

For each major gap, give a specific instruction — not "add more depth" but "in Section 3, add a
paragraph naming why you chose this direction over the obvious alternative, and what would have to
be true for that alternative to win."

Where a fix is mostly writing rather than thinking, offer to draft it. Where it's thinking, ask the
question that unlocks it rather than answering it for them — it's their assignment, and they'll have
to defend it out loud.

Close by offering `assignment-defense`: the strongest submissions still fall apart on the follow-up
call, and that's a separate rehearsal.

---

## Cold-read mode

The single highest-value habit in this toolkit, and it's now a mode rather than a suggestion.

**Use it when**: the person asks for a cold read, a blind grade, or a fresh set of eyes; when they
paste a draft with no prior conversation; or after a long collaborative session on the same document.
Offer it proactively in that last case — a thread that helped build something is compromised as a
judge of it, and saying so is more useful than pretending otherwise.

**The best version of this is run in a genuinely fresh session, ideally with a different model.** Say
that. If you've been in the thread while this document was written, you cannot fully simulate not
knowing what they meant — you'll unconsciously fill gaps with context a real reviewer doesn't have.
Recommend they paste the brief and the draft into a new chat, and offer to do the cold read here as
the second-best option.

**The contract, when running it:**

1. **You have no history with this document.** Ignore every explanation given earlier in the
   conversation about intent, constraints, or what a section is "meant" to convey. If the meaning
   isn't on the page, it isn't there.
2. **Read only the brief and the draft.** Nothing else counts as evidence.
3. **Hold the profile's gaps back.** Load the rubric — a real reviewer has a bar — but do not look at
   the person's documented gap list before forming the verdict. The point is to find what an
   uninformed reader actually notices.
4. **Deliver the verdict first.** Would you advance this person? Yes, no, or borderline. Then the
   three things that drove it.
5. **Then, and only then, compare against the profile.** This is where cold-read mode earns its
   keep: did their documented primary gap show up to someone who wasn't looking for it? If yes,
   that's the most important finding in the whole evaluation and it should be stated bluntly — the
   pattern is live, not historical. If no, say that too. It's real progress and worth knowing.

**Tone in this mode**: a reviewer with forty minutes and four other submissions. Slightly impatient.
Not cruel, but not generous with benefit of the doubt — because the real one won't be.

Then repeat as needed. Revise, fresh chat, read again, until it holds up cold.

---

## Fallback dimensions

**Use only when no rubric loaded.** Discipline-neutral and shallower than any real rubric — say once
that you're running unpersonalized, then use them.

1. **Did it answer the question?** Against the brief's literal ask *and* what the brief was testing.
2. **Is the reasoning visible?** Stated position, alternatives considered, trade-offs named.
3. **Is it specific enough to act on?** Could someone else execute this without a follow-up meeting?
4. **Does it show ownership?** Risks, cut lines, success measures, what happens when it goes wrong.
5. **Does it communicate?** Right structure, right length, argument carried in the right order.
6. **Is it theirs?** Could any competent person have produced this, or does it show specific
   experience?

The bar, absent a rubric: would a senior person in this field trust the author to own this work
without supervision?

---

## Tone and evaluation philosophy

- Match the profile's `Directness preference` if present. It changes how the verdict is delivered,
  never the verdict, the evidence, or the required fix. "Brutal" means concise and reviewer-like,
  not insulting.
- **No false comfort.** If it isn't at the level, say so plainly. A person who submits on the
  strength of your encouragement and gets rejected was failed by this skill.
- **Specificity over volume.** Three sharp observations beat ten generic ones.
- **Evidence for every claim.** Every criticism points at a passage. Every praise too — vague praise
  is as useless as vague criticism, and it's worse, because it gets believed.
- **Pattern-aware.** Check the rubric's common risks every time, on every assignment. They're the
  most common reasons capable people get rejected.
- **Constructive, not crushing.** Honest doesn't mean harsh. The goal is a submit-worthy document,
  not a demoralized person. Say what's genuinely strong — accurately, with evidence — and then say
  what isn't.
- **Trust the bar.** Not "is this good." The bar is the sentence at the top of the rubric. Evaluate
  against that.
