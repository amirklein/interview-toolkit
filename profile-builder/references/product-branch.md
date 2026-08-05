# Product Branch — Full Detail

This branch is calibrated from real, lived PM interview and assignment feedback, validated across
multiple live runs of the questionnaire. Use the sharper follow-ups here rather than the universal
generic template.

Step numbers match `SKILL.md`.

The option lists here run past what Claude Code and Codex will render in a single question. Ask them
in successive passes of three rather than trimming them, per
`~/.interview-toolkit/references/question-protocol.md`.

## Step 2 — Level and context

- **Level**: Mid-level PM / Senior PM / Lead or Principal PM / Group PM or Head of Product
- **Context**: B2B SaaS / B2C consumer / mix of both / enterprise with complex sales

## Step 3 — Evidence prompts

**Domains** (offer as options to react to, always with free text): billing and monetization,
onboarding and activation, platform and APIs, data and analytics, marketplace, security and
compliance, AI features, internal tooling.

**Shipped** — push for the shape of it, not just the name: how long it took, how many engineers,
what metric moved and by how much, and what you cut along the way. The cut is often the most
senior-sounding part and people rarely volunteer it.

**Scale** — company headcount, number of engineering teams supported, ARR or user count of the
surface owned.

**Unfair advantage** — the answers worth digging into here: they were the user before they were
the PM, they can read or write code, they've done a zero-to-one and a scale phase both, they've
worked in the specific vertical the target company sells to, they've run a P&L.

## Step 5 — Gap options

- Lacks strategic depth / too tactical
- Misses stakeholders, especially in B2B
- Solution isn't concrete or buildable enough
- Doesn't show ownership / hedges decisions
- Something else — I'll describe it

## Step 6 — Follow-ups per selected gap

**If "Lacks strategic depth":**
- Jumps to solutions before establishing a point of view
- Describes *what*, not *why this direction over others*
- Doesn't cover trade-offs and risks
- Doesn't think about pivot points or long-term milestones beyond the immediate task
- Doesn't tie decisions back to a clear thesis
- Something else — I'll describe it

**If "Misses stakeholders":**
- Solves for the end user only, misses economic buyer / IT / CS
- Acknowledges stakeholders exist but doesn't show the conflicts between them
- Doesn't address how this gets sold or rolled out internally
- Misses it entirely until someone points it out
- Something else — I'll describe it

**If "Solution isn't concrete or buildable":**
- No clear scope boundary — what's in, what's out
- Reads more like a vision doc than a spec
- No user stories or definitions of done; the team can't pull sprint-ready tickets from it
- Edge cases aren't addressed
- Something else — I'll describe it

**If "Doesn't show ownership / hedges":**
- Presents options instead of making the call
- Hedged language — a lot of "could" and "might"
- Doesn't name what gets cut under pressure
- No pivot triggers or decision points
- Something else — I'll describe it

## Step 7 — Ranking

Single-select, forced. List exactly the gaps selected in Step 5, not the sub-flavors.

> "Of these, which has cost you the most — the one you'd fix first if you could only fix one?"

## Step 8 — Free-text invite on the ranked gap

A strong answer here sounds like: *"my team can't pull practical action items out of what I hand
them — they end up needing a follow-up conversation just to know what to build."*

That's sharper than any multiple-choice option, because it's falsifiable. It converts into a real
test — "could an engineer pull three to five sprint tickets directly from this section?" — rather
than a vague feeling of "needs more depth." When free text like this comes up, write their bar
into the profile in their words, not as a generic restatement.

## Step 9 — Behavioral pattern under pushback

Ask where it shows up most (multi-select plus free text):

- In live conversation — caves when someone pushes back
- In writing — softens a stated position after feedback
- Both equally
- Something else — I'll describe it

A refinement worth preserving verbatim when it appears: someone narrowing "live conversation" to
a specific context, like *"1:1 feedback situations specifically."* That's more actionable than the
broad version, because it names the exact format the current conversation already is. When this
surfaces, the profile's behavioral instruction should say so explicitly — this pattern is likely
to show up right now, in this session, not just hypothetically.

## Variability across runs

This branch was tested repeatedly with simulated answers, and the outputs varied meaningfully run
to run: different primary gaps ranked first, different secondary gaps surfaced, and the behavioral
question didn't always come up.

That's correct behavior, not inconsistency to fix. The interview should faithfully reflect what a
given person actually says in a given run, not converge on a canonical profile.
