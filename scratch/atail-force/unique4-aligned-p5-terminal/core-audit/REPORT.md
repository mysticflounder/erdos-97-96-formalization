# Aligned-p5 compact core audit

## Outcome

The card-eleven aligned-p5 Boolean UNSAT does **not** need the large U5 or
planar banks, either minimal-deletion overlay, the critical-system encoding,
the shell-curvature overlay, the retained/frontier-pair identification, or the
four seeded Kalmanson cuts.

After deleting all of those families, the formula is still UNSAT.  A greedy
schema deletion then reduces the ten-schema kernel Kalmanson bank to the four
existing consumers with indices `1, 4, 6, 9`.  The resulting compact formula
has 15,192 numbered variables and 27,781 clauses.  CaDiCaL emits a DRAT proof,
and `drat-trim` verifies it.

This isolates a credible source target:

> On the fixed card-eleven `(5,5,4)` aligned-p5 branch, the three strict
> first-opposite-cap points in the exact first-apex class, the global selected
> four-rows, complete distance-equality relations, and the checked own-cap
> row bounds force an order-preserving or reflected occurrence of at least one
> of Kalmanson schemas `1, 4, 6, 9`.

Each schema already has a kernel-checked Lean contradiction consumer.  The
missing Lean work is the aggregate **occurrence/coverage producer**, not a new
metric contradiction.

## Evidence status

- **EXACT WITHIN THE DOCUMENTED CNF PROJECTION:** every SAT/UNSAT ablation
  below is an exact CaDiCaL verdict for the generated finite formula.
- **EXTERNALLY CERTIFIED:** `drat-trim` prints the standalone line
  `s VERIFIED` for the compact CNF and its DRAT proof.
- **NOT LEAN-PROVEN:** there is no source-to-CNF theorem or Lean replay of the
  compact certificate.  The result is not yet a proof of the source branch.
- **GREEDY, NOT ENUMERATIVE:** `{1,4,6,9}` is inclusion-minimal relative to
  the recorded deletion order.  This audit did not enumerate every minimal
  schema bank.

## Theorem-bank preflight

The required preflight covered:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- the three concise certificate censuses and their JSON registries named in
  `AGENTS.md`; and
- `nthdegree docs search --lean` for the critical-fiber and Kalmanson
  consumers.

No bank supplies the missing aggregate occurrence theorem.  The useful
existing endpoints are the kernel-only Kalmanson schemas in
`unique4-curvature-occurrence-census/kalmanson_schema_bank.kernel_only.json`.
Their Lean declarations currently live in the scratch module
`unique4-kalmanson-core-port/UniqueFourKalmansonCores.lean`; they are
consumers, not occurrence producers.

## Family ablation

The original aligned-p5 formula has 2,791,032 clauses.  One-family deletion
gave:

| Deleted family | Clauses deleted | Result |
|---|---:|---|
| retained/frontier-pair identification | 44 | UNSAT |
| pair-minimality overlay | 22,590 | UNSAT |
| strict-cap minimality overlay | 76,419 | UNSAT |
| shell-curvature overlay | 167,156 | UNSAT |
| seeded Kalmanson cuts | 3,012 | UNSAT |
| planar bank | 332,640 | UNSAT |
| U5 bank | 2,106,720 | UNSAT |
| critical system / blocker map | 50,248 | UNSAT |
| base kernel Kalmanson bank | 8,118 | SAT |
| selected-row existence/cardinality family | 6,718 | SAT |
| complete-radius/local-metric family | 26,442 | SAT |
| aligned-class units | 3 | UNKNOWN at 180 s |
| own-cap row bounds | 74 | UNKNOWN at 180 s |

Deleting the first eight families **together** removes 2,758,829 clauses and
leaves 32,203 clauses.  That cumulative formula is UNSAT in 2.73 seconds.
Against this stripped formula, each following additional deletion is SAT:

| Additional deletion | Result |
|---|---|
| the three aligned-class units | SAT in 56.80 s |
| own-cap row bounds | SAT in 18.08 s |
| selected-row existence/cardinality family | SAT in 0.015 s |
| complete-radius/local-metric family | SAT in 0.015 s |

Thus the compact route genuinely uses the aligned class, own-cap bounds,
global selected rows, complete-radius geometry, and a Kalmanson consumer
bank.  It does **not** use U5, planar, critical-map, minimality, curvature, or
seeded-consumer machinery.

The exact ablation records are in `runs/`.  Generated intermediate CNFs were
deleted after each run.

## Per-schema isolation

With every non-Kalmanson family still present, a bank containing only schema
`1` is UNSAT and a bank containing only schema `6` is UNSAT.  Every other
single-schema bank is SAT.  Those two single-schema conclusions depend on
the large families removed by the compact route.

On the stripped 32,203-clause formula:

- deleting schema `1` makes the formula SAT;
- deleting any one of the other nine schemas leaves it UNSAT;
- schema `1` alone is nevertheless SAT.

The fixed-order greedy deletion leaves exactly:

| Index | Existing kernel-checked consumer | Normalized row-membership schema |
|---:|---|---|
| 1 | `false_of_endpoint_k2_endpoint_k1_three_selected_rows_long` | `0:{1,3}; 4:{2,3}; 5:{1,2}` |
| 4 | `false_of_one_k2_two_k1_three_selected_rows` | `0:{1,3}; 2:{3,4}; 3:{1,4}` |
| 6 | `false_of_one_k1_two_endpoint_k2_three_selected_rows` | `0:{3,4}; 1:{0,4}; 2:{0,3}` |
| 9 | `false_of_endpoint_k2_endpoint_k1_three_selected_rows_postBankEight` | `0:{1,3,5}; 4:{1,2}; 5:{2,3}` |

Removing any one of these four from the final greedy bank is SAT.  The
reproducible deletion trace is `greedy_schema_ablation.json`.

This is the main routing conclusion: after discarding the non-load-bearing
machinery, the correct producer is a **four-way Kalmanson occurrence
coverage theorem**.  Targeting only schema `1` or only schema `6` would
silently reintroduce dependence on the large U5/planar/critical families.

## Compact certificate

Reproduction:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/unique4-aligned-p5-terminal/core-audit/run_family_ablation.py \
  --family aligned_pair+pair_minimality+single_minimality+curvature+seeded_kalmanson+bank_planar+bank_u5+critical_system \
  --kalmanson-mode keep-1,4,6,9 \
  --timeout-seconds 180 \
  --retain-cnf \
  --cnf-path scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.cnf

cadical -t 180 \
  scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.cnf \
  scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.drat

drat-trim \
  scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.cnf \
  scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.drat \
  -c scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.core.cnf
```

The stored compact artifacts are:

| Artifact | SHA-256 |
|---|---|
| `aligned_p5_compact.cnf` | `081ba956b308c643fa9e845e0340017647de405aea42e6d0601679a1267f12f4` |
| `aligned_p5_compact.drat` | `f7008bc65433436329029c0b2f041847f5464d3a68046e6377f5a2d1a7511c72` |
| `aligned_p5_compact.core.cnf` | `38541e309291156d78719ba88f0cef4218469e8351d25abdd774b4e916193666` |
| `aligned_p5_compact.cadical.log` | `07e5595984020ce32e6b6d0fb0ec637663ad06c15ad45aecbc5c00721812c445` |
| `aligned_p5_compact.drat-trim.log` | `4448bfba958f2df89a14e33781c83d1c73be4f3fbe0646c2033cf1d4fe19122e` |

CaDiCaL reports UNSAT in 4.06 seconds and writes a 10.9 MB binary DRAT proof.
`drat-trim` verifies it in 3.14 seconds.  Its backward core contains:

- 6,350 of 27,781 input clauses;
- 110,996 of 199,529 proof lemmas;
- 4,826,801 resolution steps; and
- 1,557 RAT lemmas.

## Named core map

`map_compact_core.py` rebuilds the exact compact formula, checks exact parsed
clause-sequence agreement with the stored CNF, and maps every extracted core
clause back to its encoder block and variable names.

All 6,350 clauses map; zero are unmatched.  The core uses only three variable
families:

- selected-row membership;
- complete-radius equality; and
- the exact first-apex class.

In particular, the checked core uses no retained pair, no strict pair, no
second-apex deletion row, no critical system, and no minimality witness.

The largest block counts in the extracted core are:

| Block | Core clauses |
|---|---:|
| complete-radius transitivity | 2,133 |
| full-class cyclic alternation | 1,208 |
| four Kalmanson schema families | 1,125 |
| selected-row at-least-four | 868 |
| selected-row/class radius containment | 418 |
| cross-center radius transport | 355 |
| circle intersection at most two | 78 |
| all own-cap row bounds combined | 48 |
| first-apex class closure/equality/row transport combined | 72 |
| aligned-p5 class units | 3 |

The 1,125 Kalmanson core clauses have 1,347 schema matches because 136 literal
clauses are shared by more than one normalized schema.  Match counts are:

| Schema | Core matches |
|---:|---:|
| 1 | 339 |
| 4 | 322 |
| 6 | 488 |
| 9 | 198 |

The core is therefore not a small literal MUS that suggests one hand-written
three-row occurrence.  Its useful compression is at the **four schema-family
level**.

## Recommended Lean target

Do not reintroduce the removed critical/minimality/U5/planar machinery.  Prove
one card-eleven aligned-p5 aggregate coverage theorem with this shape:

1. enumerate the carrier in its convex boundary order;
2. choose one source-valid `SelectedFourClass` at every carrier center from
   global K4;
3. use the exact first-apex class containing all three strict p5 points;
4. derive the already-proved own-cap bounds and complete-radius generic
   constraints; and
5. return an order-preserving or reflected occurrence of schema
   `1 ∨ 4 ∨ 6 ∨ 9`.

Promote/import the four existing scratch consumers together with that
producer, or restate their short Kalmanson proofs in a production predecessor.
The occurrence disjunction then closes immediately.

The compact DRAT result is a strong discovery and regression artifact, but
full closure still requires either a Lean finite coverage proof (potentially
with an audited `native_decide` checker) or a source-faithful CNF/LRAT bridge.
