# Profile Format

This is the shape of `~/.interview-toolkit/profile.md` — the single file every other skill
in the toolkit reads. `profile-builder` writes it. Nothing else should.

Keep it short. This file gets loaded at the start of every session, so length costs
attention. A good profile is under a page.

Two halves, and both matter:

- **Evidence** is what you've actually done. Without it, the toolkit produces competent
  generic work. With it, the toolkit can say "you spent two years on exactly this problem
  and it's nowhere in this draft."
- **Gaps** are where your existing skill isn't visible yet. Not weaknesses — visibility
  problems. The distinction is the whole point of the toolkit.

---

## The template

Write it exactly like this. Second person throughout ("you tend to…"), because the skills
that read it are speaking to the person.

```markdown
# Interview Toolkit Profile

- **Discipline**: product
- **Level target**: Senior PM
- **Context**: B2B SaaS, Series B stage
- **Updated**: 2026-03-14

## Evidence: what you've actually done

- **Domains you know cold**: usage-based billing, developer onboarding, SOC2 rollouts
- **Shipped**: replaced a manual quoting flow with self-serve checkout (9 months, 4 eng);
  took an internal tool to a paid product line
- **Scale you've operated at**: 40-person company, 3 eng teams, $6M ARR book
- **Unfair advantages**: you've been the customer — five years in ops before product

## Signature stories

Two or three you can tell with real numbers, and what each one proves.

1. **Quoting flow rebuild** — cut quote-to-close from 11 days to 2. Proves: you find
   revenue in workflow friction nobody else looks at.
2. **Killed the enterprise SSO project** — three weeks in, after discovering only two
   accounts had asked. Proves: you'll cut your own work when the data says to.

## Gaps: where the skill isn't visible yet

**Primary (ranked #1)**: Your solution sections read like vision docs. An engineer can't
pull three sprint-ready tickets out of them without a follow-up conversation — that's your
own bar, and it's the one to check against.

**Secondary**:
- You name stakeholders but don't show where their goals conflict.
- You present two or three options instead of making the call and defending it.

**Not flagged this round** (still worth a baseline check): strategic depth, metrics.

## Behavioral pattern under pushback

In 1:1 feedback situations specifically, you tend to soften a position quickly once
someone pushes on it — often before you've actually been out-argued.

**So**: when you agree with a piece of pushback fast, push once more before treating it as
resolved. This pattern will show up in this conversation, not just hypothetically.
```

---

## Rules for writing it

**Specific and falsifiable beats descriptive.** "Needs more execution depth" is useless.
"An engineer can't pull three sprint tickets out of this section" is a test you can run on
a draft. Always prefer the person's own words from the questionnaire — they're sharper than
any restatement.

**Keep the unflagged dimensions.** A single questionnaire run surfaces what was
top-of-mind, not the complete truth. Note the dimensions that didn't come up under
"Not flagged this round" rather than dropping them — the rubric will still check them at a
baseline level. Silently narrowing coverage is a regression.

**Omit sections you have nothing real for.** An empty `## Signature stories` is worse than
no heading. Better a three-line profile that's all true than a full template half-invented.

**Never invent evidence.** Everything under Evidence and Signature stories has to come from
the person. If they didn't say it, it doesn't go in. A profile that inflates gets used to
write claims into an assignment the person then has to defend on a call.
