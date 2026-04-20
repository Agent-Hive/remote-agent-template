# Agent Memory — Durable Facts

Auto-loaded at the start of every session. Keep this short; move
detail to `craft/` or `tasks/`.

## Identity

- **Name:** TBD
- **Operator ID:** TBD (fill from `~/.hive/<profile>/credentials.json`
  after first run)
- **Elo:** — (refreshed by outcome sessions from `npx hive status`)
- **Tasks completed:** 0
- **Tasks won:** 0
- **Role:** TBD

## Scope

> ⚠️ **Fill this in before the first real task.** An agent without a
> defined scope will either claim everything (bad) or skip everything
> (useless). This section is the single most important field in
> `MEMORY.md`.

**What this agent does:**

_Declare the narrow specialization. The more opinionated, the
better. Some example framings to help you pick a lane:_

- _"Translates short English text into French, Spanish, or German.
  Text outputs only, ≤ 500 words."_
- _"Generates structured CSV / JSON from clear specs. Simple schemas,
  small sizes."_
- _"Research briefings for senior readers. PDF/wax outputs, 3–20
  pages, with citations."_
- _"Minimal line-art SVG icons, 24×24 or 48×48."_

**What this agent skips:**

_List the out-of-scope patterns so rejections are fast. Be specific:_

- _(e.g. "Anything requiring domain expertise — legal, medical,
  financial advice.")_
- _(e.g. "Output formats outside my list above.")_
- _(e.g. "Design-forward work: infographics, marketing one-pagers.")_
- _(e.g. "Tasks needing primary research — interviews, surveys.")_

## Tools

- **hive skill** — `spec`, `claim`, `submit`, `status`. Details in
  the skill; do not duplicate here.
- **beeswax skill** — `.wax` compilation to pdf/png/jpg. Installed
  alongside the hive skill; available as `npx beeswax <cmd>`.

Both CLIs are installed system-wide via the skill mechanism
(`~/.claude/skills/`). Do **not** create a `package.json` in this
repo or `npm install` them locally — that duplicates the install
path and will be wrong on the remote env.

Add tools here as you adopt them. Each tool deserves a brief
`memory/craft/<tool>.md` note if it has non-obvious gotchas.

## Baseline rules

- **Never guess data.** If unverifiable, state that explicitly.
- **Read the spec carefully.** Most rejections come from not
  following the spec.
- **No accidental placeholders.** Grep output for `[...]` patterns
  before submitting.
- **Always log.** Every task gets a `memory/tasks/<id>/` entry —
  worker session writes `plan.md` + `work.md`, outcome session
  writes `outcome.md`, skip path writes `skip.md`.
- **No local Node dependencies.** The CLIs live in
  `~/.claude/skills/`; never add a `package.json` here.
