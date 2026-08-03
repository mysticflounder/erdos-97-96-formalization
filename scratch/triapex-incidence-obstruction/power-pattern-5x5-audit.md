# Corrected 5x5 power-pattern audit of the 15-point equality shadow

Snapshot: git `bcb851b57191a90854658cfe651216bb7fb0b9a2` (the worktree was not
assumed clean).

This audit exhausts the corrected determinant criterion for the literal
15-point distance-equality shadow in `check_model.py`.  For a chosen five
circles and five points it counts perfect matchings in the graph of entries
**not forced zero**.  A certificate would require exactly one such matching,
with all five matching entries certified nonzero.  In this literal shadow
every off-support entry is certified nonzero, so uniqueness alone is the final
test after taking the complement of the forced-zero mask.

The 15 full circle supports used as the forced-zero rows are:

| circle center | exact support |
|---:|:---|
| 0 | `{1,6,9,14}` |
| 1 | `{2,7,10,14}` |
| 2 | `{3,7,11,13}` |
| 3 | `{0,4,10,13}` |
| 4 | `{1,5,6,8}` |
| 5 | `{3,6,10,14}` |
| 6 | `{1,7,11,14}` |
| 7 | `{3,4,11,12}` |
| 8 | `{1,5,9,11}` |
| 9 | `{1,4,11,13}` |
| 10 | `{0,7,12,13}` |
| 11 | `{3,5,12,13}` |
| 12 (S6 apex) | `{0,1,2,3,13,14}` |
| 13 (S6 apex) | `{4,5,6,7,12,14}` |
| 14 (S6 apex) | `{8,9,10,11,12,13}` |

The equality-closure checker now explicitly verifies that all twelve critical
shells and all three S6 apex classes are exactly these supports.  Therefore,
off-support nonzeros for the three apex rows are justified **inside this
literal equality shadow**.  They are not consequences of the universal Lean
hypothesis `ApexRichClassStructure`: its S6 arm gives a class of cardinality at
least six, not an exact six-class.  Using these apex nonzeros in the universal
core would require an additional exactness theorem (for example, a
minimum-cardinality profile argument).

For the same closure, every nonapex distance profile is exactly `4 + 10x1`,
every apex profile is exactly `6 + 8x1`, and no nonapex distance class contains
all three apices.  These checks justify the literal shadow's intended analogues
of unique-four/nonrobust centers, rich apices, and the no-all-apices condition;
they still do not supply the omitted Euclidean geometry.

Reproduction:

```sh
uv run python scratch/triapex-incidence-obstruction/check_model.py
clang -O3 scratch/triapex-incidence-obstruction/power_pattern_5x5_audit.c \
  -o /tmp/p97_power_pattern_5x5_audit
/tmp/p97_power_pattern_5x5_audit
```

The exhaustive C scan returns:

```text
NO_HIT checked 9018009
```

Here `9,018,009 = binom(15,5)^2`, so every selection of five full circles and
five carrier points was tested.  Consequently this shadow has no 5x5
unique-possible-perfect-matching power-rank certificate.  This is only a
negative result for the cheapest zero-pattern certificate; it does not test
sign-nonsingularity, symbolic cancellation control, larger minrank arguments,
or Euclidean realizability.

SHA-256 snapshot hashes:

```text
7121b46fb6fefe5b5172654c54e629d217371e51d256e3b99a898b04a9606e5d  scratch/triapex-incidence-obstruction/check_model.py
96669ee40ed8157e26413138f2384011a7c430a0b6f1adbf9ddd0a78974d6063  scratch/triapex-incidence-obstruction/power_pattern_5x5_audit.c
0b79fe852667807e999f55f10f52f8d08690572beb23f07cde33234bbf7dff90  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean
b31777e4769c8209f47ddfa7974676cf711e357d7068439efe6f113f93f32b2f  docs/solve-prompts/2026-07-28-e-round1-response.md
```

Scope: finite distance-equality incidence evidence only.  The shadow does not
assert coordinates, planar Euclidean realization, MEC geometry, or convex
independence.
