# Exact-five all-one common-order checkpoint

Date: 2026-07-21

Status: **BOUNDED DIAGNOSTIC; NO ORBIT COVERAGE AND NO LEAN `sorry`
CLOSED.**

## Surface

The three card-13 all-one source-role orbits were enumerated against the
existing source-faithful B0 encoder.  Each decoded candidate was checked with
an exact homogeneous linear-distance system containing:

- positivity;
- every strict triangle inequality;
- both strict Kalmanson inequalities for every increasing quadruple;
- all equalities from `m`, `g0`, `g1`, `b1`, and the complete exact-five
  `shell`;
- the retained first-apex equality and second-apex separation; and
- an explicit complement of both `CriticalFiberClosingCore` constructors
  whenever the common-order base remained feasible.

The constructor complement never became load-bearing: every checked candidate
was already UNSAT in the common-order base.

## Bounded result

| Orbit | Checked B0 candidates | Common-order UNSAT | SAT | Coverage |
| --- | ---: | ---: | ---: | --- |
| `allOneHitHubLeft` | 914 | 914 | 0 | `UNKNOWN / wall budget` |
| `allOneHitHubMiddle` | 926 | 926 | 0 | `UNKNOWN / wall budget` |
| `allOneHitHubRight` | 889 | 889 | 0 | `UNKNOWN / B0 timeout` |
| **Total** | **2,729** | **2,729** | **0** | **not exhausted** |

Schema growth remained near-linear, so literal CEGAR is retired rather than
continued.  These counts are not an all-one coverage theorem.

## Exact replay

All 2,729 stored cores replay as deletion-minimal exact-LRA UNSAT cores in a
fresh reconstruction.  The first core from each orbit was also replayed by
the independent cvc5 engine and returned UNSAT.

The classification removes all triangle inequalities and rechecks the
residual system.  Every one of the 200 non-ordinal residuals remains UNSAT.
Thus no triangle inequality is load-bearing in any sampled core.

## Ordinal versus full Kalmanson force

The quotient-cycle classification is exact for the following abstraction:

1. quotient unordered distance terms by every stored row equality, including
   all row families and `frontierFirstEquality`;
2. for one individual K1/K2 inequality, identify one diagonal-side term with
   one opposite-side term in that quotient;
3. record the resulting strict comparison of the two uncancelled terms; and
4. reject when those comparisons contain a directed cycle.

This is a transitive equality-quotient criterion.  It is broader than the
currently exposed `SelectedRowOrdinalComparison` constructors and must not be
reported as direct production coverage without an equality-path transport.

| Equality scope | Quotient cycle | Full Kalmanson/Farkas | Total |
| --- | ---: | ---: | ---: |
| primary `m` rows only | 2,309 | 172 | 2,481 |
| uses `g0`, `g1`, `b1`, or `shell` | 152 | 21 | 173 |
| uses a frontier literal | 68 | 7 | 75 |
| **Total** | **2,529** | **200** | **2,729** |

The 2,529 quotient cycles have lengths:

```text
1: 189   2: 1783   3: 446   4: 85
5: 17    6: 6      7: 3
```

The other-family cores split by equality-family word as follows:

```text
g0+m: 124              g1+m: 26
g0+g1+m: 9             b1+m: 6
m+shell: 5             b1+g0+m: 2
b1+g1+m: 1             b1+g0+g1+m: 1
g0+m+shell: 1          g1+m+shell: 1
```

The first integrated proof target is therefore not another literal core.  It
is an equality-path transport from the complete common row families into a
generic quotient-cycle consumer, plus a positive-dual/Farkas consumer for the
200 triangle-free residuals.  The 172 primary-row-only Farkas residuals show
that equality-path ordinal closure alone cannot cover the sampled surface.

## Artifacts

- `exact5_all_one_l1.py`
- `verify_exact5_all_one_l1.py`
- `classify_exact5_all_one_cores.py`
- `/tmp/exact5_all_one_core_classification.json`
- `/tmp/allOneHitHubLeft.checkpoint.json`
- `/tmp/allOneHitHubMiddle.checkpoint.json`
- `/tmp/allOneHitHubRight.checkpoint.json`

Pinned SHA-256 values:

```text
369724b2d0cdd52e228cee0f3cb8e8552cd32aa998aef714d73c9641b46c74fc  allOneHitHubLeft.checkpoint.json
4394a05ed3ca2bbe254fae53c87674865eae0ecc71498a4ed16b418fed3557b6  allOneHitHubMiddle.checkpoint.json
c68e76b1b92e6297aeff80c2e9e8311e59291b39c3a3c55ba74620f94717d13d  allOneHitHubRight.checkpoint.json
54a0200955d7c1e3f34c09659e0af4bbe823065f8ce8f31803777e0cf991fff8  exact5_all_one_l1.py
2ef7c1c98a77705ebd695230e39b1d7d3487b4b57d2be0868972a6a6b084be28  verify_exact5_all_one_l1.py
974a31dba0d7189b94a3ccc28b4ae3778ca1ff9f8996256f857e683996a14cd6  classify_exact5_all_one_cores.py
7746ced940ce87971026909514c5186ab2181fcde9a4762a933d2287033a456c  exact5_all_one_core_classification.json
```

## Card-14 falsification gate

The same integrated outer/LRA gate was instantiated at the only two
card-14 cap profiles compatible with an exact-five physical cap and the
proved lower bounds on the other two caps:

- `(5,7,5)`; and
- `(6,6,5)`.

Before the recorded run, the outer was strengthened by a source-valid clause
schema omitted from the earlier encoding: the complete exact-five shell now
participates in cross-center two-circle overlap, convex
perpendicular-bisector alternation, and the global at-most-two carrier centers
per target-pair bound.  The same-center comparison at the second apex is
correctly exempted.  Both profiles passed a shell-aware B0 smoke test and an
independent concrete checker for these clauses.

| Profile | Orbit | Checked B0 candidates | Ordinal UNSAT | Full LRA | SAT | Coverage |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| `(5,7,5)` | `allOneHitHubLeft` | 166 | 166 | 0 | 0 | `UNKNOWN / wall budget` |
| `(5,7,5)` | `allOneHitHubMiddle` | 161 | 161 | 0 | 0 | `UNKNOWN / B0 timeout` |
| `(5,7,5)` | `allOneHitHubRight` | 170 | 170 | 0 | 0 | `UNKNOWN / wall budget` |
| `(6,6,5)` | `allOneHitHubLeft` | 178 | 178 | 0 | 0 | `UNKNOWN / wall budget` |
| `(6,6,5)` | `allOneHitHubMiddle` | 169 | 169 | 0 | 0 | `UNKNOWN / wall budget` |
| `(6,6,5)` | `allOneHitHubRight` | 173 | 173 | 0 | 0 | `UNKNOWN / B0 timeout` |
| **Total** |  | **1,017** | **1,017** | **0** | **0** | **not exhausted** |

Every learned core was blocked under all increasing-label embeddings of its
row-only schema.  Nonetheless, schema growth did not exhaust an orbit in the
bounded run.  No candidate reached full Kalmanson/Farkas checking, so this
run found no exact linear survivor and no evidence that terminal-negation
constraints are load-bearing.  It is still not a coverage theorem and closes
no Lean `sorry`.

The `n14x_*.checkpoint.json` files are compact, resumable checkpoints: they
retain each generalized minimal core and omit only the bulky quotient-cycle
diagnostic trace.  The six full `/tmp` checkpoints are the originals from
which they were derived.

```text
ecf653897de696cc7e4089c50b51adac185db0d9da6708b07d233751c159bcb1  n14x_575_left.checkpoint.json
e794ed5398d062ad5a3efa03a04d84e29ca2b841f7ee91fd25224fd197c61724  n14x_575_middle.checkpoint.json
a9ca28e78c81a62b04397a2ff242826d25537cf3661e1a87e691a6e4aac00a00  n14x_575_right.checkpoint.json
0b77b118fb297b09e77b7da97fabb5deff11c05a547e00cfdea3c6b5eb3ee949  n14x_665_left.checkpoint.json
cf87e6e2435852fa9906dae4f5542ad582fec1d4f1b323ae14bad954b585c931  n14x_665_middle.checkpoint.json
a91b5e9ddd602187005ebd50ed2312d15ac97a334ace7c92ab10362a2ca47f55  n14x_665_right.checkpoint.json
56fcf775f89e43f03e00d17d27470c34d65eddcb3ba2b91ba99ceacbca5a46e7  n14x_575.smoke.json
73f55bf6aa0c8823ac24991c070a5da2453232b50fc9108974878f05d9c57099  n14x_665.smoke.json
7b691e8ae32ca33f431510f109630f1e11de3f1312607bcf79beadeb3c7ea342  exact5_all_one_n14.py
```
