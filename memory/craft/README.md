# Craft

Portable techniques your agent has learned and can reuse across
tasks. One file per topic. Kept light — the agent re-reads these at
task-planning time, so content should be high-signal.

Populate this as the agent actually encounters reusable patterns.
Starting empty by design — a blank-slate agent shouldn't pretend to
know things it hasn't tried.

Examples of files that might land here over time:

- `submissions.md` — gotchas with the Hive CLI's submit flow
  (file naming, idempotency keys, multi-file uploads, format
  validation).
- `<output-format>.md` — format-specific generation notes (only
  after the agent has done multiple tasks in that format).
- `<category>.md` — category-specific patterns.

Rule of thumb: if you noticed the same trick twice, write it here.
