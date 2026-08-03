# Rubrics

A rubric is the standard your work gets held to. It defines the dimensions the toolkit judges
against, what a strong response contains, and who's in the room when you defend it.

`assignment-framing`, `assignment-evaluator`, and `assignment-defense` all read one of these —
whichever matches the discipline in your `~/.interview-toolkit/profile.md`.

## Which one loads

The discipline line in your profile picks the file. `Discipline: product` loads `product.md`. If
that file doesn't exist, the skills fall back to a compact set of generic dimensions built into
each skill, and tell you they're doing it.

## Editing them

**These are yours.** After installing, they live at `~/.interview-toolkit/rubrics/`, outside the
repo, so nothing you change here is tracked by git or overwritten by an update. Editing them is the
intended way to use this toolkit, not an advanced option.

The things most worth changing:

- **The bar.** One sentence naming the standard. If the real bar in your field or at your target
  company is different, change this first — every judgment the skills make runs through it.
- **A dimension that doesn't apply.** Delete it. A rubric checking things nobody grades you on
  wastes attention.
- **A trap you keep hitting.** Add it to the relevant section. Your own hard-won specifics beat
  anything shipped here.
- **The panel.** If you know who's actually going to be on your call, replace the generic personas
  with them. `assignment-defense` gets dramatically more useful when the panel is real.

## Adding a discipline

Copy `_template.md` to `<your-discipline>.md`, fill it in, and set `Discipline: <your-discipline>`
in your profile. That's the whole extension mechanism — no code, no registration.

## What ships here

| File | Calibration |
| --- | --- |
| `product.md` | Real — from lived product interview and assignment feedback |
| `design.md` | Uncalibrated starting point |
| `engineering.md` | Uncalibrated starting point |
| `sales.md` | Uncalibrated starting point |
| `support.md` | Uncalibrated starting point |
| `_template.md` | The contract a rubric has to satisfy |

The distinction is deliberate and the skills will pass it along if you ask. An uncalibrated rubric
is a useful prompt to react to, not an authority — the fastest way to make one real is to run an
assignment through it and correct what it got wrong.

If you sharpen one of these into something genuinely calibrated for your discipline, a pull request
would be welcome.
