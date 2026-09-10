# Finite-nine N4d Form B branch support

This packet publishes the second timeout-safe support node for the finite-nine Form `b` proof. Its
public record exposes eight branch conclusions for a fixed shell and zero-defect cap layout. The
solution uses the accepted `Erdos9796FiniteNine.n4e_core` theorem for the omitted first N4e slice.

Prove2Me published definition `Erdos9796FiniteNine_N4dFormBBranchSupport` with ID
`3cf4e4b9-6989-4b26-85ca-ae7d5c56a13e` and theorem
`Erdos9796FiniteNine.n4d_formb_branch` with ID
`42459e69-2295-4399-8a78-05eecc61a975`. Proof submission
`e7aae940-ff91-4c37-a2d9-a7284461f1ba` was accepted.

The generated solution is 327,541 bytes, below Prove2Me's one-MiB source limit and far smaller
than the original 694,176-byte Form `b` submission that exceeded the server verification window.
It contains the authenticated repaired prerequisite prefix, the balanced pure-helper slice, and
the N4e source after `c2_vertex_same_open_side_as_v3` through
`qEqE_lowerArc_impossible_flipped`.

Regenerate and check the packet with:

```bash
uv run python submissions/finite-nine-n4d-formb-branch-support/generate.py
uv run python submissions/finite-nine-n4d-formb-branch-support/generate.py --check
uv run --with ruff ruff check submissions/finite-nine-n4d-formb-branch-support/generate.py
uv run python tools/prove2me_submit.py validate submissions/finite-nine-n4d-formb-branch-support/plan.toml
```
