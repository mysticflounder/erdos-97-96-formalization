# ATAIL global-count boundary

This directory pins two strengthened finite shadows, one for each card-12 cap
profile `(4,5,6)` and `(5,5,5)`.  They were found during the authorized ATAIL
parallel-research lane and are replayed without a solver.

The validator checks more than the earlier incidence preflight:

- one exact abstract four-point radius class at every center;
- a common source-to-blocker critical-shell map, including `t2 -> p`;
- one-sided ordered-cap row injectivity and endpoint one-hit;
- outside-pair uniqueness, cyclic shared-pair separation, and row overlap;
- the exact outside-pair count used by
  `orderedCap_outsidePairCount_sum_le`;
- no abstract off-surplus two-point joint fiber at the surplus endpoints; and
- the boundary of the legacy same-cap pushout packages.

The result is intentionally
`VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY`.  The nonempty omission list in
`manifest.json` fail-closes Euclidean, convex, MEC, full strict-cap, and live
K-A interpretations.

Replay from the repository root:

```bash
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/global_count_boundary/validator.py --check

PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python -m unittest -v \
  scratch/atail-force/global_count_boundary/test_validator.py
```

Print the regenerated checkpoint:

```bash
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/global_count_boundary/validator.py --print-checkpoint
```

The proof/research interpretation is recorded in
`docs/audits/2026-07-13-atail-global-count-boundary.md`.
