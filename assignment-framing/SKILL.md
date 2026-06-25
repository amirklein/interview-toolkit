---
name: assignment-framing
description: >
  Use this skill whenever the person shares a take-home assignment brief (as a PDF, paste, or description) and needs help structuring how to attack it. Triggers include: I got an assignment, help me tackle this, how should I approach this take-home, what do I need to cover, where do I start with this. Always use this skill when a job assignment brief is present, even if the person just says got a new one or pastes in instructions without explicitly asking for a framework. This skill can be personalized to your own recurring rejection patterns and senior PM expectations — run `/profile-builder` first for the sharpest results.
---

# Assignment Framing Skill

## Purpose
Help the person read a take-home assignment brief, extract what's *really* being tested, build a structured attack plan, and flag the specific gaps that are most likely to cost them the offer.

---

## Step 1 — Read and Diagnose the Brief

If the assignment is a PDF or file, read it in full before doing anything else. If it's pasted text, same.

Extract:
- **The stated ask** — what they literally want delivered
- **The unstated ask** — what this brief is *actually* testing (ownership, strategy, execution depth, stakeholder awareness)
- **The company type** — B2B vs B2C, early-stage vs scale-up, PLG vs sales-led, AI-native vs traditional. This changes what "senior PM" means to them.
- **The role level** — Senior PM, Lead PM, Group PM, Head of Product. The higher the bar, the more they expect full-ownership thinking without being told.
- **Signals of what they care about** — look for words like "define", "prioritize", "roadmap", "align", "stakeholders", "metrics", "trade-offs". Each is a hint about the depth expected.

---

## Step 2 — Live Research (Always, Before Anything Else)

Do not skip this. Do not defer it. Research happens immediately after reading the brief, before building the attack plan. The goal is to walk into the framing session with real context — not assumptions.

### 2a — The Company & Product
Go deep on the company itself:
- **What does the product actually do?** Find the live product, demo, or walkthrough. Understand the core workflow, not just the marketing pitch.
- **What is their current positioning?** What problem do they say they solve, for whom, and how?
- **What stage are they at?** Headcount, funding round, recent hires, recent launches — these signal what "senior PM" means to them right now.
- **What has been written about them recently?** News, blog posts, changelogs, job postings. Job postings in particular reveal internal priorities and pain points.
- **What do users say?** G2, Capterra, Reddit, App Store reviews — real user frustrations are often the raw material of good assignment answers.

### 2b — The Competitive Landscape
Map who they compete with and how:
- Who are the 2–3 closest competitors?
- Where is the company differentiated — and where are they behind?
- Are there market dynamics (consolidation, new entrants, AI disruption) that are relevant to the assignment topic?
- If the assignment is about a specific feature or problem area, are competitors solving it? How?

This context sharpens the strategic POV section dramatically. An answer that names the competitive reality is automatically more senior than one that treats the product in isolation.

### 2c — The Assignment-Specific Domain
If the assignment touches a specific domain (e.g., AI agents, FinOps, weather intelligence, manufacturing sourcing, brand monitoring) — go get context:
- What are the known hard problems in this space?
- What do practitioners actually care about vs. what sounds good on paper?
- Are there industry benchmarks, frameworks, or standards that would lend credibility to the response?
- What has recently changed in this space that a sharp PM would be aware of?

### 2d — Synthesize Into a Context Brief
After researching, produce a short internal summary before building the attack plan. Share this with the person — they should know what you found and correct anything that seems off.

Format:
> **Company snapshot**: what they are, stage, recent focus
> **Product reality**: what it actually does, who uses it, known friction points
> **Competitive context**: who they're up against, where the differentiation sits
> **Domain context**: what's true about this problem space that informs a smart answer
> **Assignment angle**: given all the above, what is this brief *really* testing for

---

## Step 3 — Frame What's Really Being Evaluated

Before building the plan, explicitly state the evaluation criteria *behind* the brief. Senior PM take-homes test across these five dimensions — name which ones this assignment is heavy on:

### 1. Strategic Grasp (Vision & Direction)
Can the person show they see the *whole picture* — where the product sits in the market, where it should go in 1–3 years, what bets make sense and why? This is not just "here's the roadmap" — it's *why this direction and not another*.

### 2. B2B Stakeholder Complexity
For B2B assignments: does the solution account for the **full stakeholder map** — economic buyer, end user, IT/security, CS, sales? A solution that only solves for the end user in B2B is a red flag. Always name the stakeholders and show how the solution serves or manages each.

### 3. Execution Depth (Developer-Ready Thinking)
Does the plan go deep enough that an engineer or designer could act on it? This means:
- Concrete feature definitions, not just feature names
- Clear scope: what's in, what's explicitly *out*, and why
- Edge cases and constraints called out
- Acceptance criteria or at least success signals per feature
- Dependencies named

### 4. Full End-to-End Ownership
Does the person demonstrate they can *run* this — not just design it? This means:
- Milestones with pivot triggers
- Risk identification and mitigation
- What to cut if constraints tighten
- How to know if you're winning (metrics)
- What could go wrong and what the fallback is

### 5. Seniority Signals (Lead Without Being Asked)
Senior PMs don't wait for permission. They:
- Make explicit trade-off decisions and defend them
- Push back on scope when needed
- Name what's being de-prioritized and why
- Show data-backed reasoning, even if the data is estimated
- Sound like someone a CTO or CEO would trust to own a P&L

---

## Step 4 — Build the Attack Plan

Structure the plan as a set of **sections the person needs to deliver**, each with:
- What it covers
- The depth expected
- The most common trap to avoid (sharpen this with `/profile-builder` if it's been run — otherwise use the general trap below)

### Template Attack Plan Structure:

**Section 1: Problem Framing & Context**
- Restate the problem in your own words — show you understand the space
- Add market/industry context that's relevant (even a sentence or two of "the world this lives in")
- Name who is *actually* affected and how
- **Common trap**: staying at surface level. Go one layer deeper — "why does this problem exist" not just "what is the problem"

**Section 2: Stakeholder & User Map** *(especially critical for B2B)*
- List every stakeholder type, their goal, and their pain
- Identify where goals conflict — and how you'll navigate that
- **Common trap**: designing for the end user only and missing economic buyers or internal teams (engineering, CS, sales)

**Section 3: Strategic POV**
- Where should this product/feature/capability go in 1–3 years?
- What bets are you making and why?
- What would you *not* do, and why?
- **Common trap**: jumping to solutions without establishing a strategic north star. The reviewer needs to see that decisions flow from a point of view, not just from what seems reasonable.

**Section 4: Solution Definition (Execution-Ready)**
- Define the solution clearly enough that engineering could scope it
- What exactly is being built? How does it work?
- What are the explicit boundaries of scope (in/out)?
- What are the edge cases and how are they handled?
- **Common trap**: naming a feature without defining it. "AI-powered X" is not a definition. What model? What input? What output? What fallback? (Run `/profile-builder` and this becomes specific to your own pattern here.)

**Section 5: Roadmap & Milestones**
- Phase the work: MVP / V1 / V2 or Now / Next / Later
- Each phase: what's delivered, what's proven, what triggers moving to next phase
- Include at least one explicit pivot trigger: "if X doesn't happen by Y, we do Z instead"
- **Common trap**: linear roadmaps with no decision points. Senior PMs build in checkpoints, not just timelines.

**Section 6: Metrics & Success Definition**
- How do you know if this worked?
- North star metric + 2–3 supporting metrics
- What's the baseline and what's the target?
- **Common trap**: generic metrics (DAU, retention) without connecting them back to the specific problem. Make the metric obviously tied to the thesis.

**Section 7: Risks & Mitigations**
- At least 3 real risks (technical, adoption, stakeholder, market)
- For each: likelihood, impact, and what you'd do
- **Common trap**: skipping this or making it perfunctory. Naming risks is a seniority signal — it shows you've actually run things before.

---

## Step 5 — Red Flag Check

Before the person starts writing, call out the specific risks for *this* assignment based on the brief diagnosis:

- **Holistic view gap**: Is there a temptation to solve for just one layer (user, feature, team) when the brief actually requires a system-level view? Name it.
- **Depth gap**: Which section is most likely to end up shallow? Pre-warn.
- **Strategic gap**: Is there a clear opportunity to show long-term vision that might get missed in the rush to define the solution?
- **Seniority gap**: Does the assignment have a trap where a mid-level answer looks fine but a senior answer would do more? (e.g., mid-level: defines the roadmap. Senior: defines the roadmap AND names what got cut and why.)

---

## Step 6 — Offer to Go Deep on Any Section

After presenting the plan, offer: *"Want to dig into any of these sections together before you start writing?"*

If the person says yes to a section, go deep — ask questions, help them sharpen the thinking, push back if the framing is too surface-level. Act like a sharp thought partner who has seen a lot of PM interviews and knows where candidates lose points.

---

## Tone & Style Notes

- Direct and confident, no corporate fluff
- Name the real risk plainly: "this is where you've been rejected before"
- Don't hedge — if something is weak, say it
- Be a thought partner, not a checklist machine
- Always connect advice back to the "full ownership" standard: would a CPTO trust this person to run it alone?
