# Product Branch — Full Detail

This branch is calibrated from real, lived PM interview/assignment feedback patterns, validated across multiple live questionnaire runs. Use the sharper follow-ups here rather than the universal generic template.

## Step 2: Level + context
- Level: Mid-level PM / Senior PM / Lead/Principal PM / Group PM/Head of Product
- Context: B2B SaaS / B2C consumer / Mix of both / Enterprise/complex sales

## Step 3: Gap options (multi-select + free text)
- Lacks strategic depth / too tactical
- Misses stakeholders (especially in B2B)
- Solution isn't concrete/buildable enough
- Doesn't show ownership / hedges decisions
- Something else — I'll describe it

## Step 4: Follow-ups per selected gap

**If "Lacks strategic depth" selected:**
- Jump to solutions before establishing a POV
- Describe *what*, not *why this direction vs. others*
- Don't go over trade-offs and risks
- Don't think about pivot points / long-term plan (milestones) beyond the immediate task
- Don't tie decisions back to a clear thesis
- Something else — I'll describe it

**If "Misses stakeholders" selected:**
- Solve for end user only, miss economic buyer/IT/CS
- Acknowledge stakeholders exist but don't show conflicts between them
- Don't address how this gets sold/rolled out internally (no GTM/selling-point thinking)
- Miss it entirely until someone points it out
- Something else — I'll describe it

**If "Solution isn't concrete/buildable" selected:**
- No clear scope boundary (what's in/out)
- Reads more like a vision doc than a spec
- No user stories or definitions of done — team can't pull sprint-ready tickets from it
- Edge cases aren't addressed
- Something else — I'll describe it

**If "Doesn't show ownership / hedges" selected:**
- Present options instead of making the call
- Hedge language — lots of "could" and "might"
- Don't name what gets cut under pressure
- No pivot triggers or decision points
- Something else — I'll describe it

## Step 5: Ranking (single-select, forced)
"Of these, which has cost you the most — the one you'd fix first if you could only fix one?"
List exactly the gaps they selected in Step 3 (not the sub-flavors) as the ranking options.

## Step 6: Free-text invite on the ranked gap
Ask specifically about the ranked gap. A strong answer here typically sounds something like: "my team can't pull practical action items out of what I hand them — they end up needing a follow-up conversation just to know what to build."

This kind of answer is sharper than any multiple-choice option — it gives a falsifiable bar ("could an engineer pull 3-5 sprint tickets directly from this section?") rather than a vague feeling of "needs more depth." When free text like this comes up, the inserted Watchlist language should use the person's own bar, not a generic restatement.

## Step 7: Behavioral pattern under pushback
Ask where it shows up most (multi-select + free text):
- In live conversation — caves when someone pushes back
- In writing — softens stated position after feedback
- Both equally
- Something else — I'll describe it

Real example of a free-text refinement worth preserving as-is: someone narrowing "live conversation" down to a more specific context, like "1:1 feedback situations specifically" rather than live conversation in general. This is more actionable than the broad version, because it can name the exact format a Claude conversation already is. If this surfaces, the instruction inserted into `thought-partner` should say so explicitly: this pattern is likely to show up in this conversation, right now, not just hypothetically.

## Notes on variability across runs

This branch was tested multiple times with simulated answers, and the outputs varied meaningfully run to run — different primary gaps got ranked, different secondary gaps surfaced, and the behavioral-pattern question didn't always come up. This is correct behavior, not inconsistency to fix. The questionnaire should faithfully reflect whatever a given person actually selects in a given run, not converge on a single "canonical" profile.
