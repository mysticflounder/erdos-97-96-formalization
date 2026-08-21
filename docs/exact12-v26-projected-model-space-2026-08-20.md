# Exact-12 v26 projected model space: enumeration and analysis (2026-08-20)

Status: EMPIRICAL throughout.  Unauthenticated scratch solving (cadical
3.0.0 block-and-solve on the authenticated canary CNF); nothing here is a
certificate, a bank, or a wave.  This is analysis-method gap 2 of
`docs/exact12-v24-survivor-structural-analysis-2026-08-16.md` (projected
model enumeration), run on the v26 formula.

Scripts (read-only over the canary artifacts):
`scratch/rigid221-sourceheavy-anchor/core-pair/enumerate_v26_projected_models.py`
and `.../analyze_v26_projected_models.py`.  Enumerated cubes are kept untracked at
`scratch/rigid221-sourceheavy-anchor/core-pair/v26_projected_models.json`
(the repository ignores JSON under that lane tree); regenerate with the
enumeration script against the authenticated workdir.  The enumeration
walk is solver-dependent, so a regenerated sample may differ; the
summary numbers here describe the 2026-08-20 sample.

Harness oracle validation before any measurement: the recorded v26
survivor assignment satisfies every one of the 704,481 clauses of
`discovery.cnf` and its 3,040 choice variables decode to the
authenticated v26 cube at all 12 centers.

## Result 1 — the projected space holds at least 300 models

Block-and-solve enumeration of distinct projected cubes (one candidate
row per center) hit the cap of 300 without reaching UNSAT, in 512 s.
The v24 hope that "the survivor space may be small" (68 wave witnesses
collapsing to 24 distinct models) is refuted at v26: the space is >= 300
and the trailing models differ in single centers, so the count above the
cap is likely much larger.  Enumerate-and-block is not a viable closure
route at this granularity.

Enumeration-order caveat: the 300 are the solver's walk, not a uniform
sample; per-cube statistics below are exact over the sample and only
EMPIRICAL over the space.

## Result 2 — the frozen anchor star is NOT formula-forced

0 of 300 cubes carry the six frozen anchor-star rows of the
v24/v25/v26 canary survivors.  Per-center variability across the sample:

| center | distinct rows | dominant row (count) |
|---|---|---|
| 0 | 3 | (4, 5, 7, 11) x240 |
| 1 | 1 | (0, 3, 6, 8) x300 |
| 2 | 2 | (3, 6, 10, 11) x240 |
| 3 | 13 | (0, 5, 7, 9) x72 |
| 4 | 28 | (0, 1, 3, 10) x64 |
| 5 | 35 | (2, 3, 8, 10) x50 |
| 6 | 2 | (3, 4, 5, 9) x240 |
| 7 | 2 | (4, 6, 8, 10) x240 |
| 8 | 2 | (2, 6, 9, 11) x280 |
| 9 | 22 | (1, 5, 8, 11) x240 |
| 10 | 4 | (2, 3, 7, 8) x240 |
| 11 | 14 | (0, 1, 3, 4) x214 |

Only center 1 is universal, at exactly the theorem-pinned row
supp(1) = BO = {0, 3, 6, 8} — consistent with the 2026-08-20 constraint
audit's finding that this row is pinned by the source theorem.  The rest
of the "frozen anchor star" of
`docs/exact12-v26-survivor-structural-analysis-2026-08-20.md` is a
stability property of the per-wave canary survivors (the solver's first
model each wave), not a property forced by the formula.  That doc now
carries a scope correction pointing here.

## Result 3 — the orientation-family route is dead space-wide

For every one of the 300 cubes, every realized common-five instance
that is not strict/center-exchange/Klein admissible (1 to 8 per cube)
was tested for coverability by a role-cycling orientation widening,
using the same membership-valid-variant criterion as
`docs/exact12-s3-role-cycling-gap-measurement-2026-08-20.md`:

- cubes with at least one coverable instance: **0 of 300**.

No orientation-widened common-five family, of any symmetry class, can
remove any of the 300 sampled models.  This extends the single-survivor
verdict of the S3 measurement to the whole sample and corroborates the
prose warnings (A5.17/A5.18/CD8) computationally: the orientation
vocabulary cannot close this leaf.

## Consequences for the remaining v24-doc analysis items

- Steered survivors (MaxSAT, overlap-minimal models): moot at the
  orientation level — every sampled model already defeats the
  orientation vocabulary; no steering is needed to expose that.
- DRAT / refutation-stream mining: still unmeasured, but its motivation
  (hypothesis source for new orientation families) is weakened by
  Result 3.  HEURISTIC assessment, not a measurement.

Not established here: terminal UNSAT or its distance; any property of
models beyond the 300 sampled; aggregate arm coverage; Lean closure.
