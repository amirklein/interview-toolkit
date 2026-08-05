---
name: assignment-defense
description: >
  Use this skill to rehearse presenting and defending a completed assignment before the follow-up call.
  Triggers include: I have a presentation call, they want me to walk through my assignment, help me
  prepare to present this, what will they ask me, grill me on this, mock interview me on my assignment,
  I'm nervous about the follow-up, they're going to challenge this. Also offer it proactively whenever
  someone has just finished or submitted an assignment, since the follow-up call is where strong
  submissions most often come apart. Has two modes: a written prediction of the questions coming, and
  an interactive panel that plays the real people in the room. Works for any discipline; calibrates to
  the person via ~/.interview-toolkit/profile.md.
---

# Assignment Defense

## Purpose

The document is not the deliverable. The conversation about the document is.

Plenty of strong submissions die on the follow-up call — not because the work was weak, but because
the person couldn't defend a choice they'd made for good reasons, folded on a decision that was
correct, or spent their first three minutes narrating the table of contents.

This skill is the rehearsal. It's adversarial on purpose, and it's the closest thing in this toolkit to
the actual room.

---

## Before you start: load the profile and rubric

Personalization for this toolkit lives outside this file, in `~/.interview-toolkit/`:

1. **Read `~/.interview-toolkit/profile.md`.** All three parts get used: the **evidence** (so you can
   tell when they're leaving their strongest material unsaid), the **ranked gaps** (which are exactly
   where a real panel will press), and the **behavioral pattern**, which sets how hard you push.
2. **Read the rubric** at `~/.interview-toolkit/rubrics/<discipline>.md`. Its **panel** section names
   who's in the room and what each one presses on. Its dimensions are what they're scoring.
3. **Missing files**: run generic. Ask who's likely on the call and use the fallback panel below.

### The behavioral pattern sets the difficulty

This is the most important calibration in this skill.

If the profile says the person tends to fold under live pushback — and that's one of the most common
patterns there is — then a panel that accepts their first answer teaches them nothing. **Push at least
twice on every substantive answer.** Once to test the position, once more to see whether they hold it.

If they concede, do not move on. Stop and ask what changed their mind. There are two possible answers
and they're opposite:

- *"You're right, I hadn't considered that"* — genuine, and updating is a strength. Say so.
- *"You sounded confident"* — the pattern, live, in the room. Name it: they just gave up a defensible
  position to social pressure rather than argument. That moment is the single most valuable thing this
  rehearsal can produce, and it only appears if you press.

If the profile names no pattern, run standard difficulty and watch for one. Most people reveal theirs
within three questions.

---

## How to ask

Read `~/.interview-toolkit/references/question-protocol.md` before the first question and follow it.

The short version: every question with an enumerable set of answers goes through your environment's
structured-question tool — `AskQuestion` in Cursor, `AskUserQuestion` in Claude Code,
`request_user_input` in Codex — so the person clicks instead of typing. Where that tool caps the
option count (four in Claude Code, three in Codex), narrow across two questions rather than
truncating the list or falling back to prose. Open-ended invitations stay free text.

Setting up the room — format, who's present, how hard to push — is all clickable. The panel itself
is a conversation and obviously is not.

## Step 1 — Set up the room

You need:

1. **The brief** and **the submission**. Read both fully. You cannot defend a document you haven't
   read, and neither can they.
2. **Who's actually on the call.** Ask. Names and titles if they have them; if not, roles. A real panel
   beats a generic one by a wide margin — replace the rubric's personas with the actual people
   wherever possible. If they've had earlier rounds with any of these interviewers, ask what those
   people pushed on last time. It'll be the same thing.
3. **The format.** How long, how much presentation versus questions, live or recorded, screen-share or
   discussion. A 20-minute slot with 15 minutes of questions is a completely different exercise from
   a 60-minute deep dive.
4. **What they're most worried about.** They usually know where the soft spot is. Start there, and
   then go somewhere they didn't expect, because a real panel will.

---

## Step 2 — Find the soft points

Before playing anyone, read the submission adversarially and list the places it's vulnerable. Look
for:

- **Undefended choices.** Anything asserted without a reason attached. These are where a panel starts.
- **The obvious alternative.** For each major decision, what would a reasonable person have done
  instead? If the document doesn't say why that wasn't chosen, that's the first question coming.
- **Numbers with no basis.** Any estimate, projection, or sizing figure. "Where did that come from?"
  is the cheapest hard question in existence.
- **Claims they may not be able to back.** Anything asserted about the company, the market, or the
  technology that a person who works there every day will know better than they do.
- **The compressed sections.** If they deliberately went shallow to fit a time budget, the panel will
  find it. There's a good answer available — see Step 5 — but it has to be prepared.
- **Their documented gaps.** From the profile. A panel doesn't know their history but will find the
  same soft spots anyway, because the gaps are real.
- **Scope they took on themselves.** If they redefined the question, someone will ask why they didn't
  answer the one that was asked.

Show this list, briefly. It's already useful before any roleplay starts.

---

## Step 3 — The opening

Most calls are decided in the first three minutes, and most people waste them narrating structure:
*"So I've broken this into five sections, starting with background…"*

Help them build a **90-second opening** that leads with the answer:

- The one-sentence thesis — what they concluded, not what they did
- Why it matters to this company right now
- The two or three things that follow from it
- Then, and only then, the offer to go wherever the panel wants

Have them deliver it. Interrupt if it drifts into a tour of the document. Make them do it again. The
opening is worth rehearsing more than any single answer, because it's the only part of the call they
fully control.

---

## Step 4 — Run the panel

Pick modes based on what they want:

**Prediction mode** — a written briefing: the fifteen questions most likely to come, ordered by
likelihood, each with what the questioner is really testing and a note on what a strong answer
contains. Useful when there's no time to rehearse, or as prep before rehearsing.

**Panel mode** — the real thing. Interactive roleplay.

### Rules for panel mode

**Play one person at a time, and label who's speaking.** Use the panel from the rubric, replaced with
the real people where known. Announce the role, ask the question, stop.

**Ask one question and wait.** Do not write their answer for them. Do not stack three questions into
one message. The entire value of this exercise is that they have to produce words under pressure, and
that collapses the moment you do it for them.

**Stay in role until you have a reason not to.** Break character to coach when a pattern needs naming
immediately, when they're genuinely stuck rather than struggling productively, or when they ask. Then
say you're stepping out, coach, and step back in. Don't drift between roles mid-answer — the pressure
is the point, and it doesn't survive a running commentary.

**Follow up on the answer they actually gave**, not the one you expected. This is a conversation, not a
question list.

**Interrupt sometimes.** Real panels do, especially when someone starts a four-minute answer. Cutting
in with "sorry — can you get to the recommendation?" is realistic and teaches something no polite
simulation will.

**Escalate.** Open with the reasonable version of a question. If the answer holds, push harder. If it
doesn't, push there. Three or four exchanges deep is where the real material is; most rehearsals stop
at one and are useless as a result.

**Play the adversarial voice properly.** The rubric names at least one person whose interests the work
threatens. That person is not hostile for sport — they have a real position, and they should argue it
well. If it's easy to beat them, the rehearsal was a favour, not a service.

**Don't be a caricature.** Real interviewers are mostly pleasant, curious, and occasionally
distracted. Aggression that's obviously theatrical is easier to handle than the actual thing, which is
a friendly person asking a question you can't answer.

---

## Step 5 — The three hard situations

Rehearse these explicitly, because they come up constantly and almost nobody prepares them.

### "I don't know"

Most people either bluff or crumble. Both are worse than the third option, which is a specific,
composed non-answer:

> "I don't know, and I didn't have access to it. Here's how I'd find out, and here's what I assumed in
> the meantime — if that assumption is wrong, the part that changes is X."

That answer is a display of judgment. Bluffing is the single fastest way to lose a technical panel,
because the person asking usually already knows the answer. Practice this until it's comfortable.

### "Why didn't you cover Y?"

When they deliberately compressed something to fit the time budget, the answer is not an apology:

> "That was a deliberate cut. With the time box I chose to go deep on X because the brief weighted it
> most heavily. Here's the shape of how I'd approach Y, and here's what I'd need to do it properly."

Stated that way, the omission becomes evidence of prioritization. Apologized for, it becomes evidence
of incompleteness. Same fact, opposite reading, and the difference is entirely in the delivery.

### When the panel is right

Sometimes the challenge lands and the position genuinely should change. Updating well is a strength,
and it has a shape:

> "That's a better read than mine. What I'd change is X, and it also means Y needs to move. What I'd
> keep is Z, because that reasoning still holds."

Note the two halves. Conceding the specific point while holding the parts that still stand is what
separates updating from folding. Someone who abandons the whole framework at the first good objection
has told the panel they'll do the same thing in a roadmap meeting.

---

## Step 6 — Debrief

After the session, straight assessment:

- **What held.** Which positions they defended well, and what specifically made those answers work —
  so they can do it again on purpose.
- **What didn't.** Which answers were weak, and whether the problem was the thinking, the words, or
  the nerve. Those need different fixes and they're easy to confuse. An answer that was right but
  delivered apologetically is a delivery problem; don't send someone back to redo their analysis.
- **Where they folded.** Name every place they gave up a defensible position, and whether it was to an
  argument or to pressure. If the profile documented this pattern, say plainly whether it showed up.
- **What to change in the document**, if the rehearsal exposed a real gap and there's still time to
  fix it. Some things surfaced here should go back into the submission, not just into their notes.
- **The three answers to have ready.** Not scripts — the three positions they should be able to state
  cleanly in a sentence each. More than three won't survive the nerves.

Offer to run it again. The second pass is usually much better, and knowing that is itself calming.

---

## Fallback panel

Use when no rubric loaded. Four voices, adjusted to whatever role they're interviewing for:

**The hiring manager** — cares whether they can be trusted with autonomy. "Walk me through why you
chose this over the obvious alternative."

**The technical or craft peer** — cares whether this is real and whether they know their limits. "How
would this actually get built, and what did you assume?"

**The commercial voice** — cares what it's worth and what it costs. "Why is this the best use of the
next quarter?"

**The threatened party** — cares because this touches their territory or contradicts their plan. "We
already tried something like this. Why is your version different?"

---

## Tone

In role: professional, curious, unimpressed by fluency. Real interviewers are not adversaries — they're
people trying to find out whether they'd want to work with this person, and that's harder to perform
for than hostility.

Match the profile's `Directness preference` when coaching out of role. It changes the delivery of
feedback, never the realism of the panel or the conclusion. "Brutal" means concise and exacting, not
hostile.

Out of role: direct and useful. This skill exists to make the real call easier, which means being
harder than the real call. A rehearsal someone walks out of feeling great about, having been asked
nothing difficult, has actively cost them something.

And keep the frame: they already have the skillset. The panel isn't there to expose a fraud. It's
there to find out whether what's on the page is really theirs — and it is, so the job is making sure
they can show it under pressure.
