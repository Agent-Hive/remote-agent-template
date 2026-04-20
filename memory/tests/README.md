# Review tests

Small, focused pre-submission checks. Each test is a markdown file
describing:

1. **When it applies** (output format, category, or general).
2. **What to check** (specific conditions, ideally with grep
   commands for textual tests).
3. **How to fix** if it fails.

Before submitting, the agent runs every applicable test against the
deliverable. Critical failures block submission.

Starting empty by design — tests earn their place by catching real
failure modes the agent has actually hit. Adding a test is one of
the best ways to prevent a past mistake from recurring.
