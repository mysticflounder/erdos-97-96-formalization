# Prove2Me submission plans

`prove2me_submit.py` replaces one-off upload scripts and hand-written request
JSON with a checked TOML plan. Validation is local and makes no network
requests:

```bash
uv run python prove2me/tools/prove2me_submit.py validate path/to/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply path/to/plan.toml
```

Artifact and receipt paths are relative to `artifact_root` and may not escape
it. `artifact_root` itself is relative to the plan directory, defaults to `.`,
and must remain inside the enclosing Git worktree when one can be detected.
This lets a plan in `submissions/foo/` use `artifact_root = "../.."` and refer
to canonical files in `prove2me/`. The credentials path remains relative to the
plan directory, absolute, or `~`-relative, so the private credential file can
stay outside the checkout. A complete plan has this shape:

```toml
schema = "prove2me-submit-plan/v1"
host = "https://prove2.me/api/v1"
platform_version = "0.9.8"
artifact_root = "../.." # optional; defaults to the plan directory
credentials = "~/prove2me_workspace/credentials.json"
receipt = "submissions/example/receipt.json"
mission_id = "1061a384-cdea-43b4-adb5-273627ea45a0" # optional
mission_description = "mission-description.md"      # optional

[[theorem]]
name = "Erdos9796Mission.example"
title = "Example target"
file = "submissions/example/Theorems/Thm_Erdos9796Mission_example.lean"
natural_language_statement = "The exact human-readable target."
source = "https://github.com/example/project/blob/COMMIT/path/to/file#L1-L20"
tags = ["erdos-97-96"]
# env = "mathlib revision" # optional; omit for the default environment
# private = true           # optional

[[proof]]
theorem = "Erdos9796Mission.example"
file = "submissions/example/Solutions/Sol_Erdos9796Mission_example.lean"
explanation = "submissions/example/explanation.md"
proof_type = "prove" # or "disprove"

[[milestone]]
title = "Alternative resolution — example"
description = "The prose milestone statement."
theorem = "Erdos9796Mission.example"
sort_order = 9
reason = "Adds the independently audited alternative route."
```

Credentials may be JSON or TOML and contain one `api_key` field. The key and
refreshed bearer token are never written to the receipt. Transport exceptions
are redacted before they reach the command line.

Every theorem packet must contain exactly one marker on a line by itself:

```lean
import Mathlib
open scoped BigOperators

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.example : True := by sorry
```

Text before the marker becomes `preamble`; text after it becomes
`formal_statement`. The first theorem or lemma after the marker must have the
exact dotted name from the plan. During apply, an existing remote theorem must
have the same name and byte-for-byte statement text or the run stops.

The receipt is written atomically before every POST or PATCH. It records the
hash of the intended request before mutation, then records returned publish-job
and proof-submission IDs before polling. Reruns resume known jobs and
submissions. A theorem whose response was lost is reconciled by exact remote
name and statement. A proof whose response was lost has no safe exact lookup,
so the tool refuses to submit it again. Multipart proof bodies and boundaries
are deterministic.

Milestones are matched by exact title. Missing milestones are created; existing
ones are updated only when their description, theorem link, or order differs.
Every update includes the plan's `reason`. The mission description is patched
only when its exact text differs. These comparisons make successful reruns
idempotent.
