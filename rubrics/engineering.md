# Rubric — Engineering

**Calibration**: uncalibrated. A reasonable starting point based on general knowledge of what
engineering take-homes and system-design exercises get judged on, not lived feedback the way
`product.md` is. Correct it against what you've actually been told — this file is yours to edit.

---

## The bar

Would a staff engineer be comfortable with this person owning a service on call, and trust their
judgment about what to build simply versus what to build properly?

---

## Dimensions

### Dimension 1: Correctness and completeness

**What strong looks like**: it does what was asked, including the parts that weren't spelled out.
The obvious cases work; the non-obvious ones are handled or explicitly deferred with a reason.

**Evaluate**:
- Does it satisfy every stated requirement, including the easily missed ones?
- Are inputs validated, and are failures handled rather than ignored?
- Are concurrency, ordering, and partial-failure cases considered where they apply?
- Where something is deliberately unhandled, is that stated rather than silent?

**Common risk**: the happy path works and nothing else was considered. Reviewers read unhandled
failure as not knowing it could fail, which is the more expensive interpretation.

### Dimension 2: Trade-offs made explicit

**What strong looks like**: the reader sees a decision space and a choice inside it. Simplicity
versus flexibility, speed versus durability, build versus buy — the relevant axis is named and
picked with a reason.

**Evaluate**:
- Are the two or three real decisions called out?
- Is there a stated alternative for each, and why it lost?
- Are the costs of the chosen path acknowledged rather than hidden?
- Does the reasoning reference the actual constraint — scale, deadline, team size — or is it
  abstract?

**Common risk**: presenting one design as the only design. Even correct choices look like luck when
the alternatives are missing.

### Dimension 3: Failure modes and operability

**What strong looks like**: written by someone who has been paged. What breaks, how you'd know, and
what happens next are all addressed.

**Evaluate**:
- What are the failure modes, and what's the blast radius of each?
- How would you detect a problem — logs, metrics, alerts, traces?
- Is there a retry, backoff, timeout, or idempotency story where one is needed?
- What's the rollback or degradation path?

**Common risk**: treating this as ops work to be added later. Operability is the clearest signal of
seniority in the whole exercise and the most commonly skipped.

### Dimension 4: Scale and evolution

**What strong looks like**: honest about where the current design stops working, and about what
would change at the next order of magnitude. Not over-built for scale that doesn't exist.

**Evaluate**:
- At what load does this design break, and what's the next move?
- Are the data access patterns matched to the storage choice?
- What's cheap to change later and what's expensive — is the expensive thing the right bet?
- Is there premature abstraction dressed as forethought?

**Common risk**: both directions fail. Building for a million users you don't have wastes the
exercise; building for a hundred with no idea what breaks at ten thousand reads as inexperience.

### Dimension 5: Communication and code quality

**What strong looks like**: a reviewer can follow it without you in the room. Names carry meaning,
structure matches the domain, and the write-up explains the problem and the shape of the solution
before the details.

**Evaluate**:
- Is there a README or summary that orients a reader in two minutes?
- Are tests present and do they test the things that matter, not the trivia?
- Is the code consistent with itself, and does it avoid cleverness that costs clarity?
- Does the explanation talk about problem and impact, or only implementation?

**Common risk**: technically strong work explained entirely in implementation terms. The reviewer
has to reconstruct the reasoning, and often reconstructs it as less thoughtful than it was.

---

## What a strong response contains

**1. Requirements and assumptions** *(load-bearing)* — what you understood the ask to be, and every
assumption you made. **Common trap**: silently resolving an ambiguity, then being judged for
choosing wrong.

**2. Design overview** *(load-bearing)* — the shape of the solution before the details, ideally with
a diagram. **Common trap**: leading with code and never stating the model.

**3. Key decisions and trade-offs** *(load-bearing)* — two or three, with alternatives. **Common
trap**: listing technologies rather than reasoning about them.

**4. Implementation** — the code or the detailed design. **Common trap**: sprawl. A smaller correct
core beats a larger half-finished surface.

**5. Failure modes and observability** — what breaks, how you'd know, what you'd do. **Common
trap**: skipping this entirely.

**6. Testing** — what you tested, what you didn't, and why. **Common trap**: coverage of the easy
paths only.

**7. What you'd do with more time** — the honest list. **Common trap**: pretending it's complete.
Naming your own gaps first is a seniority signal; being caught not knowing them is the opposite.

---

## The panel

**The staff or principal engineer** — cares about judgment and failure thinking. Opens with: "Where
does this break first?"

**The hiring manager** — cares whether you can be trusted with scope and whether you communicate.
Presses on: "What did you decide not to build, and why?"

**The product partner** — cares about what this enables and what it costs. Presses on: "How long
would the real version take, and what would you cut to halve it?"

**The on-call peer** — cares whether this will wake them up. Presses on: "It's 3am and this is
throwing errors. What do I look at?"
