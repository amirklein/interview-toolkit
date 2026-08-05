# Worked example — four-hour B2B product take-home

This is an illustrative workflow, not a template to copy. The product, numbers, and company are
fictional; the useful part is the sequence of decisions.

## Brief

> You are a Senior PM at RelayDesk, a B2B customer-support platform. Propose a way for support leads
> to reduce the time spent triaging duplicate tickets. Submit no more than five slides by tomorrow.

The candidate has four focused hours. Their profile says they have experience with enterprise support
workflows and tend to present options rather than make a recommendation.

## 1. Frame it

`/assignment-framing` identifies the real test: can the candidate make a bounded product bet while
balancing agents, support leadership, and IT/security? It sets this plan:

| Time | Output | Stop rule |
| --- | --- | --- |
| 0:00–0:30 | Brief diagnosis and company/product research | Stop once the existing ticket workflow and one relevant competitor pattern are understood. |
| 0:30–1:10 | Thesis and stakeholder map | Stop after choosing one primary user, economic buyer, and rollout constraint. |
| 1:10–2:35 | Three load-bearing slides | Problem, recommendation, and scoped workflow. No visual polish yet. |
| 2:35–3:15 | Measures, risks, and cut lines | Every metric has a baseline/assumption and every risk has a response. |
| 3:15–4:00 | Cold read and final polish | Fix only the highest-value finding; respect the five-slide limit. |

It explicitly cuts a full competitive landscape and labels the assumption: *"I would validate the
competitor workflow during discovery; the recommendation here is based on the stated time box."*

## 2. Make a call

The draft thesis is:

> RelayDesk should first cluster likely duplicate tickets for agent review, rather than auto-merging
> them. This removes repetitive triage while preserving the context and auditability enterprise
> support teams need.

That one sentence makes a product choice, acknowledges the risk of automation, and gives the rest of
the deck something to prove.

`/thought-partner` pushes on the missing commercial owner: why would a support leader fund this? The
candidate adds the operational consequence: fewer duplicate investigations means lower backlog age
without increasing headcount. They also state why auto-merge is rejected for V1: erroneous merges
can hide an escalation and damage trust.

## 3. Review it cold

`/assignment-evaluator` receives only the brief and the five-slide draft. Its verdict is
**borderline advance**:

- **Strong:** a specific recommendation, scope boundary, and credible rollout risk.
- **Weak:** the 30% triage-time target is asserted without a baseline or measurement plan.
- **Highest-value fix:** replace the target with a two-week instrumented pilot: measure duplicate
  candidates reviewed per agent, false-positive rate, backlog age, and agent override rate before
  committing to a reduction target.

The candidate makes that change instead of spending the final 30 minutes on icons.

## 4. Defend it

`/assignment-defense` plays the skeptical engineer:

> "Why did you choose similarity clustering instead of just improving the existing search?"

The candidate answers:

> "Search helps when an agent knows to look and has the right terms. The failure I am addressing is
> triage at intake, when the agent does neither. I would start with conservative suggestions and
> compare them with a search-only control; if false positives or overrides stay high, I would improve
> retrieval before expanding automation."

That is a defensible answer because the work made a choice, named an alternative, and defined what
would change the choice.
