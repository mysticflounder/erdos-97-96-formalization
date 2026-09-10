# Finite-nine Form B at v1: final split proof

This packet supplies a smaller proof for the existing Prove2Me theorem
`Erdos9796FiniteNine.form_b_v1` (`b6bb5e30-c060-4622-9cea-acaa92a6be0d`). It imports the accepted
N4e core and N4d branch-support nodes, then retains the authenticated source needed to finish the
remaining Form `b` cases.

The generated solution is 374,744 bytes. It replaces the 694,176-byte monolithic proof whose two
server submissions, `e79c8662-4da5-4028-a16a-ae1139352bd1` and
`c48a71c4-7c62-4cd8-8fb6-0e12fad9dada`, each timed out after 300 seconds. The split packet obtains
the earlier selector and branch conclusions from accepted public records rather than repeating
their proof bodies.

The solution elaborates under Lean 4.33.1. Its local axiom report includes `sorryAx` because the
accepted Prove2Me theorem dependencies are represented in the offline workspace by statement-only
mirrors. The generated proof source itself contains no proof placeholder or compiler-trust escape;
this local observation is separate from platform verification.

Prove2Me accepted proof submission `03e034b0-3f2c-4371-bf58-a37f96e453a2` for theorem
`Erdos9796FiniteNine.form_b_v1`. The accepted proof consumes the previously accepted
`Erdos9796FiniteNine.n4e_core` and `Erdos9796FiniteNine.n4d_formb_branch` support theorems.

Regenerate and validate with:

```bash
uv run python submissions/finite-nine-child-form-b-v1-split/generate.py --check
uv run --with ruff ruff check submissions/finite-nine-child-form-b-v1-split/generate.py
uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-form-b-v1-split/plan.toml
```
