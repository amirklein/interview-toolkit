# Rubric — Product

**Calibration**: real. These dimensions come from lived product-management interview and
assignment feedback across multiple processes, at the senior and lead level. The traps named here
are ones that actually cost offers.

---

## The bar

Would a CPTO at a serious company trust this person to own a product line without hand-holding?

Not "is this good." Every judgment runs through that sentence. A response can be well written,
well structured, and thorough, and still fail it — usually by describing a plan instead of owning
one.

---

## Dimensions

### Dimension 1: Strategic grasp

**What strong looks like**: a clear point of view on where this product or capability is going and
*why*. Long-term thinking is explicit, not implied. Trade-offs are named. The reader finishes and
thinks: this person has an opinion and can defend it.

**Evaluate**:
- Is there a stated strategic direction, or does the work only describe what to build?
- Is there awareness of the competitive and market landscape?
- Is there a one-to-three year view, even loosely sketched?
- Do the decisions visibly flow from a north star, or do they read as ad hoc?

**Common risk**: jumping to solutions without establishing *why this direction and not another*.
If the strategy section reads as setup for the solution rather than conviction about it, that's the
gap. Flag it hard.

### Dimension 2: Stakeholder complexity

**What strong looks like**: every relevant stakeholder named, with their goal, their pain, and
where their interests conflict made explicit. The solution accounts for rollout across an
organization, not just value to one user.

**Evaluate**, and weight this heavily for B2B:
- Are all stakeholders named — economic buyer, end user, IT and security, CS, sales?
- Does the solution serve all of them, or only one?
- Are the conflicts between them acknowledged rather than smoothed over?
- Is there a sense of how this gets sold *internally*, not just built?

**Common risk**: designing for the end user and forgetting that in B2B someone else approves the
budget, someone else manages the rollout, and someone else gets blamed if it fails. When those
people aren't in the document, it reads as mid-level work no matter how good the feature idea is.

### Dimension 3: Execution depth

**What strong looks like**: a reader could hand this to an engineering team and they'd know what
to build. Features are defined, not named. Scope is explicit — in, out, and why. Edge cases and
constraints are called out.

**Evaluate**:
- Are features *defined* or just *named*? "AI assistant" is a name. "Takes X input, processes via
  Y, returns Z, falls back to W" is a definition.
- Is scope explicitly bounded in both directions?
- Are edge cases and constraints named?
- Could an engineer start a sprint from this, or would they need a two-hour discovery meeting
  first?

**Common risk**: the solution section reads like a pitch deck rather than a spec. Strong vision,
light definition. The reviewer's conclusion is "good PM for early discovery, not ready to own
execution."

### Dimension 4: End-to-end ownership

**What strong looks like**: the document feels written by someone who has *run* things — who knows
what breaks, what gets cut, where the inflection points are. Milestones exist. Risks are real.
Pivot triggers are named.

**Evaluate**:
- Is there a phased plan with real milestones?
- Are there explicit pivot triggers: "if X hasn't happened by Y, we do Z"?
- Are risks named *with* mitigations, rather than listed?
- Is there a stated decision about what gets cut under constraint?
- Would this plan survive contact with reality?

**Common risk**: clean roadmaps with no decision points. A timeline is not ownership; it's a Gantt
chart. Ownership sounds like "here's how I'll know it's working, here's what I do if it isn't,
here's what I cut under pressure and why."

### Dimension 5: Seniority signals

**What strong looks like**: the reader finishes and thinks "I'd hand this person this problem and
stop worrying about it." That takes confident trade-off calls, explicit acknowledgment of what is
*not* being done, reasoning backed by data even when estimated, and a tone that earns trust
without arrogance.

**Evaluate**:
- Are trade-offs named and defended, or avoided?
- Is there explicit de-prioritization with reasoning attached?
- Is the reasoning data-backed, even with rough numbers?
- Does the tone project ownership, or ask for permission?
- Would a CPTO or CEO feel comfortable delegating after reading this?

**Common risk**: solid work that *describes* a plan rather than *owning* one. Presenting options
without committing to one, or hedging on the trade-offs, reads as mid-level — even when the
options are all good.

---

## What a strong response contains

Load-bearing sections are marked. The rest depend on the brief and the time budget — a four-hour
assignment cannot carry all seven at full depth, and choosing which to compress is itself a
seniority signal as long as the choice is stated.

**1. Problem framing and context** *(load-bearing)*
- Restate the problem in your own words to show you understand the space
- Add the market or industry context this lives in, even briefly
- Name who is actually affected, and how
- **Common trap**: staying at surface level. Go one layer deeper — *why does this problem exist*,
  not just what it is.

**2. Stakeholder and user map** *(load-bearing for B2B)*
- Every stakeholder type, their goal, their pain
- Where goals conflict, and how you'd navigate it
- **Common trap**: designing for the end user only, missing economic buyers and internal teams.

**3. Strategic point of view** *(load-bearing)*
- Where this should go in one to three years
- What bets you're making, and why
- What you would explicitly *not* do
- **Common trap**: jumping to solutions with no north star. The reviewer needs to see decisions
  flowing from a position, not from what seems reasonable.

**4. Solution definition** *(load-bearing)*
- Defined clearly enough that engineering could scope it
- Exactly what's being built, and how it works
- Explicit scope boundaries, in and out
- Edge cases and how they're handled
- **Common trap**: naming a feature instead of defining it. "AI-powered X" is not a definition —
  what input, what model, what output, what fallback?

**5. Roadmap and milestones**
- Phase it: MVP / V1 / V2, or Now / Next / Later
- Per phase: what ships, what gets proven, what triggers moving on
- At least one explicit pivot trigger
- **Common trap**: linear roadmaps with no decision points.

**6. Metrics and success definition**
- How you'll know it worked
- A north star plus two or three supporting metrics
- Baseline and target
- **Common trap**: generic metrics — DAU, retention — with no connection to the specific thesis.

**7. Risks and mitigations**
- At least three real risks: technical, adoption, stakeholder, market
- Each with likelihood, impact, and your response
- **Common trap**: skipping it, or making it perfunctory. Naming risks is a seniority signal
  precisely because it shows you've been burned before.

---

## The panel

**The hiring manager (VP or Head of Product)** — cares whether you can be trusted with autonomy.
Opens with something like: "Walk me through why you chose this direction over the obvious
alternative."

**The skeptical engineer** — cares whether this is buildable and whether you understand what
you're asking for. Presses on: "How long do you think this takes? What did you assume about our
architecture?"

**The commercial voice (sales lead or CRO)** — cares whether this is sellable and whether it helps
the accounts under pressure right now. Presses on: "Which customer asked for this? What do I tell
the three accounts that wanted the other thing?"

**The peer PM** — cares about the seams. Presses on: "This overlaps with the surface my team owns.
Who decides?"

---

## Notes

The five dimensions get checked on every assignment, every time, regardless of what the brief
emphasizes — they're the most common reasons product candidates get rejected. When the person's
profile ranks specific gaps, check those first and hardest, but never let the unranked ones go
unchecked.
