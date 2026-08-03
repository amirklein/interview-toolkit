# Rubric — Design

**Calibration**: uncalibrated. This is a reasonable starting point based on general knowledge of
what design work gets judged on, not on lived interview feedback the way `product.md` is. Treat it
as something to react to and correct. If a dimension here doesn't match what you've actually been
told, edit this file — it's yours now.

---

## The bar

Would a design leader hand you a critical, ambiguous surface and expect to be surprised by the
quality of the thinking, not just the pixels?

---

## Dimensions

### Dimension 1: Grounding in insight

**What strong looks like**: the work visibly starts from something true about users, not from a
visual idea. The reader can trace every significant decision back to a problem someone actually has.

**Evaluate**:
- Is there evidence — research, data, support tickets, prior experience — behind the problem
  definition?
- Are user needs stated specifically enough to be wrong?
- If no research was possible, are the assumptions named as assumptions?
- Does the solution respond to the insight, or did the insight get written afterward to justify it?

**Common risk**: beautiful work that answers a problem nobody confirmed. It reads as decorative,
and the follow-up question — "why this problem?" — has no answer.

### Dimension 2: Defensible rationale

**What strong looks like**: every meaningful choice has a stated reason, and alternatives that were
considered and rejected are visible. The reader understands the decision space, not just the
outcome.

**Evaluate**:
- Are the two or three hardest choices called out and explained?
- Are rejected alternatives shown, with why they lost?
- Is the rationale about the user and the constraint, or about taste?
- Could you defend each decision to someone who prefers a different one?

**Common risk**: presenting only the final answer. Without the discarded paths, strong judgment is
invisible — the reviewer can't tell a considered decision from a first instinct that happened to
work.

### Dimension 3: Systemic thinking

**What strong looks like**: the work fits a system. Components are reusable, states are complete,
and the solution scales past the happy path shown in the presentation.

**Evaluate**:
- Are empty, loading, error, and permission states covered?
- Does it reuse existing patterns where it should, and break them only deliberately?
- What happens at the extremes — no data, too much data, the longest possible string?
- Would this survive being extended by someone else next quarter?

**Common risk**: a portfolio-perfect happy path. Edge and empty states are where real product
design lives, and their absence signals someone who hasn't shipped much.

### Dimension 4: Feasibility and handoff

**What strong looks like**: an engineer could build it, and would want to. Constraints are
acknowledged, effort is understood, and the handoff includes what's actually needed to implement.

**Evaluate**:
- Is there awareness of what's expensive to build and what's cheap?
- Are behaviors specified, not just appearances — what happens on interaction, on failure?
- Is there a stated view on what ships first if the work has to be staged?
- Would this need a long meeting to clarify, or is it self-explanatory?

**Common risk**: designing something technically unreasonable without knowing it, then having the
compromise made for you by whoever builds it.

### Dimension 5: Communication of the work

**What strong looks like**: the presentation carries the argument on its own. Someone who wasn't in
the room understands the problem, the reasoning, and the outcome in the intended order.

**Evaluate**:
- Does it open with the problem, or with a screen?
- Is there a narrative, or a gallery?
- Is the outcome stated — what changed, or what you'd expect to change?
- Is it the right length for the audience?

**Common risk**: showing artifacts instead of telling an argument. The work was good; the case for
it never got made.

---

## What a strong response contains

**1. Problem and context** *(load-bearing)* — what's broken, for whom, and how you know.
**Common trap**: starting from the solution and reverse-engineering the problem.

**2. Research and insight** — what you learned or, when research wasn't possible, what you assumed
and how you'd test it. **Common trap**: presenting assumption as finding.

**3. Explorations** — the directions considered, and why the chosen one won. **Common trap**:
showing only the winner, which hides your judgment.

**4. The solution** *(load-bearing)* — the flow end to end, with real states, not just hero
screens. **Common trap**: happy path only.

**5. Rationale on the hard calls** *(load-bearing)* — the two or three decisions someone will push
on, defended in advance. **Common trap**: defending everything equally, which defends nothing.

**6. Feasibility and staging** — what it takes to build, and what ships first. **Common trap**:
treating this as someone else's problem.

**7. Success and next steps** — what you'd measure, what V2 holds. **Common trap**: ending at the
final mockup, which reads as a project rather than a product.

---

## The panel

**The design leader** — cares about judgment and whether you can be left alone with ambiguity.
Opens with: "Talk me through a decision you went back and forth on."

**The engineer** — cares about buildability. Presses on: "What happens when this list has two
thousand items and the name doesn't fit?"

**The PM** — cares about the problem and the trade-off. Presses on: "If we only had two weeks,
what part of this ships?"

**The skeptic** — cares whether this is real. Presses on: "What evidence do you have that users
actually want this?"
