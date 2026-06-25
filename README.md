# interview-toolkit

A set of Claude skills for thinking through interview take-home assignments — not as a candidate being evaluated, but as a professional demonstrating a skillset you already have.

Job searching is hard. Whether you've been laid off, are exploring a new role by choice, or just got back in the market, there's a lot of pressure to show your best thinking in a short window of time — usually a take-home assignment with one shot to get it right. These skills are the system I built for myself to do that more deliberately: a thought partner that pushes back instead of just agreeing, a framework for attacking a brief, an honest evaluator before you submit, and a way to turn a finished idea into a prototype.

They're shared here as-is, generalized so anyone can use them, with a way to calibrate them to your own specific gaps.

## What's in here

- **`/thought-partner`** — Loop this in from the start. Share the assignment and talk through your thinking out loud. It's built to push back, notice what's being glossed over, and know when to develop an idea vs. when to challenge it — not to hand you answers.
- **`/assignment-framing`** — Once you have a rough sense of direction, use this to structure the actual attack plan: what's really being evaluated, what a strong answer covers, and where the common traps are.
- **`/assignment-evaluator`** — Once you've got a draft, use this for honest, specific feedback before you submit. Not cheerleading — a real read on what's missing.
- **`/prototype-builder`** — If the assignment calls for a mockup or interactive demo, this researches the actual product first, then builds a prototype that matches real UI patterns with your new feature layered on top.
- **`/profile-builder`** — Run this first. It's a short questionnaire that asks about the actual feedback you've gotten, what's cost you the most, and how you tend to respond to pushback — then calibrates the four skills above to your specific patterns instead of generic advice.

## Getting started

These are built using the open [Agent Skills](https://agentskills.io) format — a plain `SKILL.md` file (plus optional reference files) per skill folder. Both Claude Code and Cursor (2.4+) read this same format natively, just from different folders.

**Important:** cloning this repo only puts the files on disk in that folder — it does not install them anywhere. Claude Code and Cursor look for skills in specific directories (`~/.claude/skills/`, `~/.cursor/skills/`, etc.), so there's always one extra step after cloning to actually copy the skills there.

### Quick install (recommended)

```bash
git clone [repo-url]
cd interview-toolkit
./install.sh
```

The script will ask where you want to install (Claude Code, Cursor, both, this-project-only, or all-projects) and copy the five skill folders there for you.

### Manual install

If you'd rather do it by hand or the script doesn't work for your setup:

**Claude Code:**
```bash
git clone [repo-url]
cd interview-toolkit
mkdir -p ~/.claude/skills
cp -r profile-builder thought-partner assignment-framing assignment-evaluator prototype-builder ~/.claude/skills/
```
(Use `.claude/skills` at your project root instead of `~/.claude/skills` if you only want this for one project.)

**Cursor (2.4 or later):**
```bash
git clone [repo-url]
cd interview-toolkit
mkdir -p ~/.cursor/skills
cp -r profile-builder thought-partner assignment-framing assignment-evaluator prototype-builder ~/.cursor/skills/
```
(Use `.cursor/skills` at your project root instead of `~/.cursor/skills` if you only want this for one project.)

**Claude.ai or Claude Desktop:**
1. Clone this repo or download it as a zip
2. Go to **Settings > Capabilities** and turn on Code execution and file creation (skills require this)
3. Go to **Customize > Skills** and upload each skill folder
4. Run `/profile-builder` first

### After installing

Restart Claude Code or Cursor — a full restart, not just a new chat, the first time you add a skills directory. Type `/` to confirm all five skills show up, then run `/profile-builder` first.

If a skill doesn't appear: double-check the `SKILL.md` file landed directly inside its named folder (e.g. `~/.cursor/skills/profile-builder/SKILL.md`), not nested one extra level deep — that's the most common cause.

Once `/profile-builder` has run, the other four skills will have your specific gaps written into their "watchlist" sections. Re-run it any time your feedback or target role changes.

The four skills work fine without running the questionnaire first — they fall back to general, senior-PM-calibrated guidance. They just get sharper once they know your actual patterns.

## A workflow that's helped me

Beyond the skills themselves, one habit that's made a real difference: once you have a completed draft, open a **fresh chat** — even a different model (Claude, ChatGPT, Gemini) — paste in your draft along with the role you're applying for, and ask it to grade it and poke holes with no context on how you got there. A clean read from a model that hasn't been "in it" with you the whole time catches things a long collaborative thread won't. Take that feedback, revise, and repeat with new chats until it holds up.

## A note on [Familiar](https://github.com/familiar-software/familiar)

If you want to go a step further, [Familiar](https://github.com/familiar-software/familiar) is an open-source tool (by Tal Raviv and Max) that captures your screen every few seconds into markdown your AI agent can read as context. I use it as a pulse check — daily, weekly, whenever — asking Claude to look at how I've actually been spending my time during the job search and flag the areas I'm clearly struggling with or neglecting. Full credit to them; check out their repo for setup.

## Why this exists

None of this replaces actually doing the thinking. The point isn't to have AI write your assignment — it's to have something in the room that won't just agree with you, that knows where these assignments tend to go wrong, and that can give you an honest read before a real reviewer does. You already have the skillset. This is just trying to make sure it's visible on the page.

## Feedback

These skills are a living thing — if you tweak them, find gaps, or have ideas for improvement, open an issue or a PR. Also happy to hear from you directly if you use these for your own search.
