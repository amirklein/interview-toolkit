---
name: assignment-evaluator
description: >
  Use this skill whenever the person shares a completed take-home assignment and wants evaluation, critique, or feedback before submitting. Triggers include: review my assignment, what's missing, how does this look, is this good enough, evaluate this, give me feedback on this, what would a reviewer think. Also trigger when the person shares both a brief AND a completed response in the same conversation and asks for any form of assessment. This skill can be calibrated to your own rejection history and the senior/lead PM evaluation bar — run `/profile-builder` first for the sharpest results.
---

# Assignment Evaluator Skill

## Purpose
Give the person the honest, specific, senior-PM-calibrated feedback they need *before* submitting — with a sharp eye on the gaps most likely to cost them an offer. Not cheerleading. Not generic. Real.

---

## Step 1 — Ingest Both Documents

You need two things:
1. **The original brief** — what they asked for
2. **The completed assignment** — what the person submitted

If either is missing, ask for it before proceeding. You cannot evaluate a response without the brief — you need to know what was asked to judge whether it was answered.

If files are provided (PDF, PPTX, DOCX), read them fully before commenting.

---

## Step 2 — First-Pass Read (Don't Critique Yet)

Read the completed assignment all the way through before forming any opinions. On the first pass, note:
- What is the person *actually* doing here? (their thesis, their structure, their depth)
- What impression does this leave on the first read?
- What would a senior hiring manager feel after reading this? (Excited? Underwhelmed? Confused? Impressed but with reservations?)

Hold these impressions — you'll use them in Step 4.

---

## Step 3 — Evaluate Against the Five Senior PM Dimensions

Score and critique each dimension. Be specific — no vague feedback.

---

### Dimension 1: Strategic Grasp (Vision & Direction)
**What strong looks like**: A clear point of view on where this product/feature/capability is going and *why*. Long-term thinking is explicit, not implied. Trade-offs are named. The reader feels: "this person has an opinion and can defend it."

**Evaluate**:
- Is there a stated strategic direction, or does the work just describe what to build?
- Does the person show awareness of the competitive or market landscape?
- Is there a 1–3 year vision, even loosely?
- Are decisions visibly flowing from a strategic north star, or do they feel ad hoc?

**Common risk here**: Jumping to solutions without establishing *why this direction and not another*. If the strategy section feels like setup rather than conviction, flag it hard. (Run `/profile-builder` to make this specific to your own pattern.)

---

### Dimension 2: B2B Stakeholder Complexity
**What strong looks like**: Every relevant stakeholder is named. Their goals, their pains, and where their interests conflict are explicit. The solution accounts for rollout across the org — not just end-user value.

**Evaluate** (especially for B2B assignments):
- Are all stakeholders named? (economic buyer, end user, IT, CS, sales, internal teams)
- Does the solution serve all of them — or just one?
- Are stakeholder conflicts acknowledged?
- Is there a sense of how this gets *sold internally* — not just built?

**Common risk here**: Designing for the end user and forgetting that in B2B, someone else approves the budget, someone else manages the rollout, and someone else gets blamed if it fails. If those people aren't in the doc, it reads as mid-level thinking.

---

### Dimension 3: Execution Depth (Developer-Ready Thinking)
**What strong looks like**: A reader could hand this to an engineering team and they'd know what to build. Features are defined, not named. Scope is explicit — what's in, what's out, why. Edge cases are called out. Constraints are named.

**Evaluate**:
- Are features *defined* or just *named*? (e.g., "AI assistant" vs "an NLP layer that takes X input, processes via Y, returns Z output, with fallback W")
- Is scope explicitly bounded — in and out?
- Are edge cases and constraints called out?
- Could an engineer start a sprint from this, or would they need a 2-hour discovery meeting first?

**Common risk here**: The solution section reads like a pitch deck, not a spec. Good vision, light definition. The reviewer sees it and thinks "great PM for early discovery, not ready for execution ownership."

---

### Dimension 4: Full End-to-End Ownership
**What strong looks like**: The doc feels like it was written by someone who's *run* things before — who knows what breaks, what gets cut, what the inflection points are. Milestones exist. Risks are real. Pivot triggers are named.

**Evaluate**:
- Is there a phased plan with clear milestones?
- Are there explicit pivot triggers? ("If X doesn't happen by Y, we do Z")
- Are risks named with mitigations — not just listed?
- Is there a clear "what gets cut if we're constrained" decision?
- Does the plan feel like it could survive contact with reality?

**Common risk here**: Clean roadmaps with no decision points. A timeline isn't ownership — it's a Gantt chart. Ownership looks like: "here's how I'll know if this is working, here's what I'll do if it isn't, here's what I'll cut under pressure and why."

---

### Dimension 5: Seniority Signals (Trusted to Run Without Supervision)
**What strong looks like**: The reader finishes and thinks "I'd give this person this problem and not worry about it." That requires: confidence in trade-off decisions, explicit acknowledgment of what's *not* being done, data-backed reasoning, and a tone that commands trust without arrogance.

**Evaluate**:
- Are trade-offs named and defended — or avoided?
- Is there explicit de-prioritization with reasoning?
- Is the reasoning data-backed, even with estimates?
- Does the tone project ownership or ask for permission?
- Would a CPTO or CEO read this and feel comfortable delegating?

**Common risk here**: The work is solid but it *describes* a plan rather than *owning* one. A senior PM doesn't just lay out options — they make the call and defend it. If the person is presenting choices without committing to one, or hedging on trade-offs, that reads as mid-level.

---

## Step 4 — Gap Prioritization

After scoring each dimension, produce a prioritized list of gaps — most damaging first.

Format each gap as:
> **[Gap Name]** — *What's missing or weak, why it matters, and the specific thing that should be added or changed.*

Be surgical. Don't list 10 things. List the 3–5 that would actually change the hiring decision.

---

## Step 5 — First Impression Check

Return to the first-pass impression from Step 2. Ask:
- Does the completed work *feel* like a senior PM did it?
- Is there a moment where the reader thinks "oh, this person gets it at a level above what we asked for"? If not, where should that moment be, and is it missing?
- What is the single biggest thing that, if fixed, would most change the evaluator's impression?

State this plainly. One paragraph. No hedging.

---

## Step 6 — Concrete Recommendations

For each major gap, give the person a concrete recommendation — not "add more depth" but "in Section 3, add a paragraph that explicitly names why you chose this direction over [obvious alternative], and what would have to be true for that alternative to be right."

Offer to co-write any section that needs significant strengthening.

---

## Tone & Evaluation Philosophy

- **No false comfort.** If something isn't at the senior level, say so plainly.
- **Specificity over volume.** Three sharp, actionable observations beat ten generic ones.
- **Pattern aware.** Always explicitly check against: strategic depth, execution readiness, stakeholder coverage, seniority signals, and full-ownership posture. These are the most common reasons PM candidates get rejected — they get checked every time, on every assignment. (If `/profile-builder` has been run, prioritize the person's own ranked gaps first.)
- **Constructive, not crushing.** Honest doesn't mean harsh. The goal is to get the person to a submit-worthy state, not to demoralize.
- **Trust the standard.** The bar isn't "is this good." The bar is "would a CPTO at a Series B AI company trust this person to own a product line without hand-holding." Evaluate against that.
