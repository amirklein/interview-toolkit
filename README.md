# Interview Toolkit

**[interview-toolkit website →](https://amirklein.github.io/interview-toolkit/)**

Seven agent skills for take-home assignments and interview exercises.

**Make the assignment show the judgment you already have.** This toolkit does not write an
answer for you; it helps you make the choices, trade-offs, experience, and evidence behind your
answer visible to the people evaluating it.

If you're in a process right now, the problem usually isn't that you can't do the work. It's that a
brief, a deadline, and nobody to argue with produce something thinner than you actually are. These
skills exist to close that gap: to make the assignment reflect the skillset you already have, and
then push it to the strongest version of itself.

They're built on the open [Agent Skills](https://agentskills.io) format — a plain `SKILL.md` per
folder — and work in Claude Code, Cursor, and Codex. Nothing to sign up for. Everything personal
stays in `~/.interview-toolkit` on your machine.

## The skills

| Skill | When | What it does |
| --- | --- | --- |
| `/profile-builder` | First, once | A ten-minute interview covering what you've actually done and where your skill isn't visible on paper yet. Writes `~/.interview-toolkit/profile.md`, which everything else reads. |
| `/assignment-framing` | When the brief lands | Reads the brief, researches the company and domain live, names what's really being evaluated, allocates depth against your actual hours, and builds the attack plan. |
| `/thought-partner` | Throughout | The colleague who won't let you gloss. Pushes when the thinking is thin, develops it when it's good, and tells you when your own experience belongs on the page and isn't there. |
| `/prototype-builder` | If a mockup is asked for | Researches the real product first, then builds the prototype right where you're working — real files in your IDE, an artifact in chat — plus the narrative you'll present it with. Or writes the Lovable/v0 prompt, if you'd rather build there. |
| `/assignment-evaluator` | Before you submit | An honest read against the bar for your field. Includes a cold-read mode that forgets the conversation and grades it like a stranger would. |
| `/assignment-defense` | Before the follow-up call | A mock panel. Hiring manager, skeptical peer, and the person whose territory this steps on — pressing twice, because a rehearsal easier than the real thing costs you. |
| `/interview-toolkit` | Not sure where to start | A single front door. It identifies your stage, time available, and deliverable, then routes you to the right skill without making you learn the system first. |

You don't need all seven. Most assignments use framing, thought-partner, and evaluator.

## What a session looks like

You receive a brief for a B2B product assignment due tomorrow, with four hours available:

1. Run `/interview-toolkit` and choose **"I just got the brief"**. It routes to
   `/assignment-framing` in time-box mode.
2. The framing skill researches the company, identifies that stakeholder complexity and execution
   depth are the load-bearing dimensions, and gives you an hour-by-hour plan. It explicitly cuts a
   full competitive analysis rather than letting it consume the submission.
3. Use `/thought-partner` while developing the solution. It notices you have not explained why the
   economic buyer would approve the rollout and pushes you to make the call.
4. Run `/assignment-evaluator` in cold-read mode before submitting. It gives a plain advance / no /
   borderline verdict based only on the brief and draft, then tells you the one change most likely to
   move the decision.
5. If there is a follow-up, `/assignment-defense` rehearses the questions that the skeptical
   engineer and commercial lead are most likely to ask.

See [the complete worked example](examples/product-take-home.md) for the inputs and outputs at each
stage.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/amirklein/interview-toolkit/main/install.sh | bash
```

Or from a clone, if you'd rather read it first:

```bash
git clone https://github.com/amirklein/interview-toolkit
cd interview-toolkit
./install.sh
```

The installer finds whichever tools you have — Claude Code, Cursor, Codex — copies the skills into
their skills directories, and seeds your rubrics. It never overwrites a rubric you've edited.
It replaces existing toolkit skill folders on a normal update; run `--dry-run` to inspect the change
first or `--backup` to retain dated copies under `~/.interview-toolkit/backups/`.

```bash
./install.sh                          # interactive
./install.sh -y                       # install to whatever is detected
./install.sh -t cursor,codex -y       # specific tools, no prompts
./install.sh -p                       # into this project, not your home directory
./install.sh --update                 # pull and reinstall; your profile survives
./install.sh --uninstall              # remove the skills, keep your profile
```

**Cloning alone doesn't install anything.** Agents look for skills in specific directories
(`~/.claude/skills`, `~/.cursor/skills`, `~/.codex/skills`), so there's always one step after
cloning to put them there. That's all `install.sh` does.

### After installing

1. **Restart your editor or agent** — a full restart, not just a new chat, the first time you add a
   skills directory. Type `/` to confirm the seven skills are listed.
2. **Run `/profile-builder`.** The other skills work without it, falling back to general guidance.
   They get considerably sharper once they know your patterns.

If a skill doesn't appear, check that `SKILL.md` landed directly inside its named folder
(`~/.cursor/skills/profile-builder/SKILL.md`) rather than one level deeper. That's the usual cause.

### Claude.ai and Claude Desktop

No filesystem, so it's manual:

1. Download the repo as a zip, or clone it
2. Settings → Capabilities, turn on code execution and file creation
3. Customize → Skills, upload each skill folder
4. Run `/profile-builder`. It can't write your profile there, so it'll output it in the chat — save
   it and paste it in when you start a session with the other skills.

## Making it yours

Everything personal lives in `~/.interview-toolkit`, outside the repo. Nothing there is tracked by
git, sent anywhere, or touched by an update.

```
~/.interview-toolkit/
├── profile.md          # written by /profile-builder — yours
└── rubrics/
    ├── product.md      # the standard your work is held to — edit freely
    ├── design.md
    ├── engineering.md
    ├── sales.md
    ├── support.md
    └── _template.md    # copy this to add a discipline
```

**`profile.md`** has two halves, and both matter. The gaps tell the skills what to check hardest.
The evidence — your domains, what you've shipped, the two or three stories you can tell with real
numbers — is what lets them say *"this section should be the migration you actually ran, not a
generic risk list."* A toolkit that only knows your weaknesses can help you write a competent
answer. It can't help you write yours.

**Rubrics** define the bar, the dimensions your work is judged on, what a strong response contains,
and who's in the room when you defend it. `assignment-framing`, `assignment-evaluator`, and
`assignment-defense` all read the one matching your discipline.

Editing them is the intended way to use this, not an advanced feature:

- **Change the bar** to the one you're actually held to. It's the first line, and every judgment
  runs through it.
- **Delete a dimension** nobody grades you on.
- **Replace the panel** with the names of the people who'll really be on your call. This single
  change makes `/assignment-defense` dramatically more useful.

**Adding a discipline** is one file: copy `_template.md`, fill it in, and set `Discipline:` in your
profile to match.

Only `product.md` is calibrated from real interview and assignment feedback. Design, engineering,
sales, and support ship as honest starting points and say so — useful to react to and correct, not
authoritative. The fastest way to make one real is to run an assignment through it and fix what it
got wrong. Pull requests welcome if you do.

## A habit worth keeping

Once you have a complete draft, open a **fresh chat** — ideally a different model — paste in the
brief and the draft with no context on how you got there, and ask for a grade and for holes.

A clean read from something that hasn't been in it with you catches what a long collaborative thread
never will. `/assignment-evaluator` has this as its cold-read mode, including the part that matters
most: after the blind verdict, it checks whether your own documented gap showed up to a reader who
wasn't looking for it. Revise, new chat, read again, until it holds up cold.

## What this won't do

It won't write your assignment. You'd have to defend it on a call, and you'd lose — which is why
`/assignment-evaluator` hunts for anything you can't back up and `/assignment-defense` makes you say
it out loud under pressure.

It won't tell you your draft is great. Every other chat window will do that for free.

And it doesn't replace doing the thinking. The point is to have something in the room that won't
just agree with you, that knows where these assignments go wrong, and that gives you an honest read
before a real reviewer does.

## Feedback

These are a living thing. If you tweak them, find gaps, sharpen an uncalibrated rubric, or have
ideas, open an issue or a PR. Also happy to hear from you directly if you use them for your own
search — including if they didn't help.

MIT licensed. Use it, fork it, make it yours.
