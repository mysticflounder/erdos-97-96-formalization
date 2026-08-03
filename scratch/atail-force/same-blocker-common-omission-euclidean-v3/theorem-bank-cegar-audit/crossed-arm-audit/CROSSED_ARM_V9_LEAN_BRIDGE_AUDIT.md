# Crossed-arm v9 CEGAR to Lean bridge audit

Date: 2026-08-01

## Scope and verification boundary

This is a read-only source/checkpoint audit of:

- `crossed_arm_cegar.py` in this directory;
- its imported registry/matchers in `../dual-row-cegar/dual_row_cegar.py`; and
- the sole v9 checkpoint found here, `source-at-common-full-metric-bank-v9-global-kalmanson-resume-v8/result.json`.

No solver, generator, Lake build, Lean invocation, kernel gate, or transitive
axiom audit was run.  The classifications below mean that a declaration with
the required mathematical shape exists in the live production Lean sources;
they do **not** mean that the JSON checkpoint has been decoded or replayed in
Lean.  The checkpoint itself says `UNKNOWN_TIMEOUT` and explicitly omits Lean
build/kernel closure (`result.json:1966826-1966827`).

`nthdegree docs search --lean --agentic` was attempted for the family mapping,
but this installed CLI returned no rendered answer.  Exact declarations were
therefore checked with the ordinary indexed Lean search/show interface and
against the live source declarations.

Notation used below:

- `E(c;x,y)` is the Boolean atom asserting `dist c x = dist c y`.
- `R(c;S)` says that a serialized selected row centered at `c` contains every
  point of `S` (extra support points are allowed by the matcher).
- `lin(p0,...,pk)` is the strict position order used by `linear_guard`.
- `cyc(...)` is the rotation-invariant cyclic order used by `cyclic_guard`.
- `dihedral(...)` is cyclic order up to reversal.

## What v9 serializes

The Python registry is `FULL_BANK_FAMILIES` at
`crossed_arm_cegar.py:51-86`; it contains 22 theorem-cut families.  The learned
manifest always serializes those 22 names and all five structural family names
(`crossed_arm_cegar.py:649-662`).  The checkpoint confirms the theorem manifest
at `result.json:1966777-1966822` and the structural manifest at
`result.json:71620-71626`.

Concrete v9 cut totals are at `result.json:1966829-1966862`:

- 205,428 theorem cuts.  Twenty-one families have nonzero instances; only
  `global_kalmanson_14role_16eq` has zero.
- 8,598 structural cuts: 7,489 `raw_btw_sep`, 1,109
  `mutual_bisector_transport`, and zero `shared_pair`, `circle`, or `bisector`.

Thus “serialized family” has two useful meanings: all 22 + 5 families occur in
the manifest, while 21 + 2 occur as concrete learned keys in this checkpoint.

## Classification summary

| Class | Count | Meaning |
|---|---:|---|
| `PRODUCTION-PROVED` | 16 | The Python guard matches the cited production declaration. |
| `MISMATCH` | 5 | A suitable production declaration exists, but Python names the wrong namespace or supplies an orientation-incomplete declaration. |
| `SCRATCH-ONLY` | 1 | The only exact declaration is explicitly in a `Scratch` namespace/path. |
| `NO-LEAN-PRODUCER` | 0 | No theorem family lacks some matching Lean declaration. |

This classification is about theorem-cut families only.  Structural and base
clauses are separately audited below because they need a decoder-level logical
proof, even when a small geometric lemma can discharge the final step.

## Theorem-cut family map

### Cyclic selected-row families

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `first` (35,034) | `cyc(a,b,c,d,e)`; `R(b;{a,e})`; `R(c;{a,b,d})` | `Problem97.FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows_cyclicShift`, `lean/Erdos9796Proof/P97/ATail/FivePointEuclideanObstruction.lean:661` | `PRODUCTION-PROVED` |
| `second` (34,942) | `cyc(a,b,c,d,e)`; `R(d;{a,c,e})`; `R(e;{a,b})` | `Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows_cyclicShift`, same file `:337` | `PRODUCTION-PROVED` |
| `reversed_second` (35,034) | `cyc(a,b,c,d,e)`; `R(b;{a,c,e})`; `R(a;{d,e})` | `Problem97.FivePointEuclideanObstruction.false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift`, same file `:417` | `PRODUCTION-PROVED` |

The guards are defined by `dual_row_cegar.py:150-176`, reconstructed from
serialized keys at `crossed_arm_cegar.py:612-621`, and the registry supplies
the fully qualified production namespace at `crossed_arm_cegar.py:32-49`.

### Kalmanson equality families

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `kalmanson_013_412_523` (8,870) | `lin(p0..p5)`; `E(p0;p1,p3)`, `E(p4;p1,p2)`, `E(p5;p2,p3)` | `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_013_412_523`, `lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean:32` | `PRODUCTION-PROVED` |
| `kalmanson_012_325_415` (14,905) | `lin(p0..p5)`; `E(p0;p1,p2)`, `E(p3;p2,p5)`, `E(p4;p1,p5)` | `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_012_325_415`, same file `:68` | `PRODUCTION-PROVED` |
| `kalmanson_012_124_314` (5,121) | `lin(p0..p4)`; `E(p0;p1,p2)`, `E(p1;p2,p4)`, `E(p3;p1,p4)` | `Problem97.CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_012_124_314`, same file `:110` | `PRODUCTION-PROVED` |
| `kalmanson_013_235_415` (12,400) | `lin(p0..p5)`; `E(p0;p1,p3)`, `E(p2;p3,p5)`, `E(p4;p1,p5)` | `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_013_235_415`, same file `:143` | `PRODUCTION-PROVED` |

The exact guards are registered at `dual_row_cegar.py:27-55`.

### Linear selected-row families

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `five_kalmanson_three_selected_rows` (2,005) | `lin(p0..p4)`; `R(p2;{p0,p3})`, `R(p0;{p3,p4})`, `R(p1;{p4,p0})` | `Problem97.CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`, `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:380` | `MISMATCH`: Python records nonexistent namespace `Problem97.CapCrossingKalmanson...` at `dual_row_cegar.py:65-70`; it omits `Bridge`. |
| `five_circle_isosceles_two_selected_rows` (6,569) | `lin(p0..p4)`; `R(p0;{p1,p3,p4})`, `R(p4;{p2,p3})` | `Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`, `lean/Erdos9796Proof/P97/Census554/FivePointCircleIsoscelesOrderBridge.lean:68` | `PRODUCTION-PROVED` |
| `six_sparse_two_selected_rows` (3,478) | `lin(p0..p5)`; `R(p0;{p1,p3,p5})`, `R(p2;{p1,p3,p4})` | `Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows`, `lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean:436` | `PRODUCTION-PROVED` |
| `six_k2_three_row_triangle` (1,196) | `lin(p0..p5)`; `R(p0;{p3,p5})`, `R(p1;{p4,p5})`, `R(p2;{p3,p4})` | `Problem97.UniqueFourKalmansonOccurrenceScratch.false_of_two_k2_three_row_triangle`, `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4KalmansonOccurrence/SixRoleKalmansonTriangle.lean:29` | `SCRATCH-ONLY`: the source namespace is explicitly `UniqueFourKalmansonOccurrenceScratch` (`:20`). |

The exact guards and metadata are at `dual_row_cegar.py:57-85`.

### Raw five/four-point equality families

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `five_kalmanson_three_shell_equalities` (5,376) | `lin(p0..p4)`; `E(p2;p0,p3)`, `E(p0;p3,p4)`, `E(p1;p4,p0)` | `Problem97.CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`, `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:341` | `MISMATCH`: Python metadata at `dual_row_cegar.py:87-92` omits `Bridge`. |
| `four_endpoint_centers_bisect_middle_pair` (3,763) | `lin(p0..p3)`; `E(p0;p1,p2)`, `E(p3;p1,p2)` | `Problem97.CapCrossingKalmansonBridge.false_of_four_ccw_endpoint_centers_bisect_middle_pair`, same file `:462` | `MISMATCH`: Python metadata at `dual_row_cegar.py:93-98` omits `Bridge`. |
| `four_middle_centers_bisect_endpoint_pair` (3,820) | `lin(p0..p3)`; `E(p1;p0,p3)`, `E(p2;p0,p3)` | `Problem97.CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair`, same file `:493` | `MISMATCH`: Python metadata at `dual_row_cegar.py:99-104` omits `Bridge`. |
| `five_second_three_row_equalities` (8,780) | `lin(p0..p4)`; `E(p3;p0,p2)`, `E(p3;p2,p4)`, `E(p4;p0,p1)` | `Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities`, `lean/Erdos9796Proof/P97/ATail/FivePointEuclideanObstruction.lean:275` | `PRODUCTION-PROVED` |
| `five_direct_three_row_equalities` (9,645) | `lin(p0..p4)`; `E(p1;p0,p4)`, `E(p2;p0,p1)`, `E(p2;p0,p3)` | `Problem97.FivePointEuclideanObstruction.false_of_five_ccw_three_row_equalities`, same file `:585` | `PRODUCTION-PROVED` |

The exact guards and metadata are at `dual_row_cegar.py:87-116`.

### Six-point equality families

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `six_sparse_row_equalities` (6,569) | `lin(p0..p5)`; `E(p0;p1,p3)`, `E(p0;p1,p5)`, `E(p2;p1,p3)`, `E(p2;p1,p4)` | `Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_row_equalities`, `lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean:398` | `PRODUCTION-PROVED` |
| `six_main_row_equalities` (429) | `lin(p0..p5)`; `E(p0;p1,p5)`, `E(p0;p3,p5)`, `E(p3;p0,p1)`, `E(p2;p1,p4)`, `E(p2;p3,p4)` | `Problem97.SixPointEuclideanObstruction.false_of_six_ccw_row_equalities`, `lean/Erdos9796Proof/P97/ATail/SixPointEuclideanObstruction.lean:769` | `PRODUCTION-PROVED` |
| `six_mirror_interleaving_equalities` (748) | `lin(p0..p5)`; `E(p0;p1,p5)`, `E(p0;p2,p4)`, `E(p3;p0,p2)`, `E(p3;p0,p4)`, `E(p4;p1,p5)` | `Problem97.SixPointEuclideanObstruction.false_of_six_ccw_mirror_interleaving_row_equalities`, same file `:513` | `PRODUCTION-PROVED` |
| `six_two_triple_row_equalities` (5,284) | `lin(p0..p5)`; `E(p1;p0,p2)`, `E(p1;p0,p3)`, `E(p5;p0,p3)`, `E(p5;p0,p4)` | `Problem97.TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities`, `lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean:223` | `PRODUCTION-PROVED` |

The exact guards and metadata are at `dual_row_cegar.py:118-142`.

### v8/v9 additions

| Family (v9 count) | Serialized guard | Intended exact declaration | Class |
|---|---|---|---|
| `convex_five_point_core` (1,460) | `dihedral(a,x,b,c,y)`; `E(x;a,b)`, `E(y;a,b)`, `E(c;b,x)`, `E(c;b,y)` | increasing orientation: `Problem97.Census554.ConvexFivePointCore.false_of_core`, `lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean:151`; decreasing orientation: `.false_of_core_of_neg`, same file `:169` | `MISMATCH`: the cut deliberately accepts both orientations (`crossed_arm_cegar.py:168-183,595-605`) but metadata names only `false_of_core` (`:53-59`).  A Lean decoder must branch to the two declarations. |
| `global_kalmanson_14role_16eq` (0) | `dihedral(a1,t4,t2,t1,t3,a2,p2,q2,r2,p1,q1,r1,s4,s2)` plus the exact 16 `E` atoms at `crossed_arm_cegar.py:75-80` | `Problem97.CapCrossingKalmansonBridge.false_of_fourteen_ccw_sixteen_shell_equalities_global_core`, `lean/Erdos9796Proof/P97/ATail/KalmansonSixteenEqualitySchema.lean:214` | `PRODUCTION-PROVED`: this wrapper itself branches to the increasing (`:64`) and decreasing (`:139`) declarations. |

## Structural families

All five structural names are serialized in the manifest, but they are not
members of `FULL_BANK_FAMILIES`.  Their clauses therefore need explicit Lean
semantic proofs in the checkpoint decoder; merely looking up a theorem-bank
name is not a proof of the encoded clause.

| Family (v9 count) | Clause/guard encoded by Python | Available production endpoint | Bridge assessment |
|---|---|---|---|
| `shared_pair` (0) | Two distinct selected-row centers `c,d` share endpoints `x,y`; forbid `x,y` lying on the same cyclic side of chord `c,d` (`dual_row_cegar.py:424-459`, replay at `crossed_arm_cegar.py:527-545`). | `Problem97.SurplusCOMPGBank.btw_sep`, `lean/Erdos9796Proof/P97/SurplusCOMPGBankSep.lean:100` | Decode both `R` atoms into the four distance equalities, all distinctness/injectivity hypotheses, and the two `btw` values; then apply `btw_sep`. Direct decoder proof required. |
| `circle` (0) | Distinct centers `c,d` each have one selected row containing common `x,y,z` (`dual_row_cegar.py:424-442`). | `Problem97.eq_of_equidistant_three_noncollinear`, `lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129` | Decode row equalities and convex noncollinearity, derive `c=d`, contradict the key's distinct centers. Direct decoder proof required. |
| `bisector` (0) | Three distinct selected-row centers `c,d,e` each contain common endpoints `x,y` (`dual_row_cegar.py:443-469`). | No exact generic clause wrapper was found. `Problem97.u5_common_bisector_triple_incompatibility`, `lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:146`, is a specialized U5-class theorem, not this arbitrary row-key schema. | Prove directly that all three centers lie on the perpendicular bisector of `x,y`, hence are collinear, contradicting strict-convex-position noncollinearity. Do not cite the specialized U5 theorem without constructing its additional data. |
| `raw_btw_sep` (7,489) | `¬E(c;x,y) ∨ ¬E(d;x,y) ∨ Xor(btw(c,d,x),btw(c,d,y))` (`crossed_arm_cegar.py:375-417,546-556`). | `Problem97.SurplusCOMPGBank.btw_sep`, `lean/Erdos9796Proof/P97/SurplusCOMPGBankSep.lean:100` | Exact geometric endpoint, but the decoder must prove atom-to-distance and position-to-`btw` correspondence plus all side conditions. Direct Horn/clause proof required. |
| `mutual_bisector_transport` (1,109) | `¬E(c1;q,c2) ∨ ¬E(c2;q,c1) ∨ E(q;c1,c2)` (`crossed_arm_cegar.py:419-450,557-565`). | `Problem97.dist_eq_dist_of_mutual_bisector`, `lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean:98` | Exact metric lemma. The Lean bridge still has to decode the three literals and prove the Horn clause by cases. |

## Base CNF families that cannot be discharged by theorem-bank calls

The checkpoint's `assertion_block_counts` begins at `result.json:5`.  Excluding
the three learned-cut block labels (`crossed_full_bank_cut_theorem`,
`crossed_full_bank_cut_raw_btw_sep`, and
`crossed_full_bank_cut_mutual_bisector_transport`), every remaining block is a
base encoding obligation.  A sound Lean bridge must prove the following groups
from its decoded finite structures and production hypotheses:

1. **Finite-function, support, and cardinality clauses**:
   `critical_blocker_total`, `critical_blocker_nonself`,
   `critical_support_exact`, `collision_blockers_distinct`,
   `blockers_in_indexed_strict_cap`, `p_blocker_collision`,
   `q_equal_blocker`, `r_blocker_collision`, `fresh_q_blocker`,
   `p_first_apex_exact_class`, `q_first_apex_exact_class`,
   `r_first_apex_exact_class`, `Q_first_shell_exact_cap_intersection`,
   `q_shell_exact_cap_intersection`, `all_four_endpoint_omissions`,
   `five_center_deletion_arm_selector`,
   `five_center_deletion_blocker_survival`, and
   `five_center_deletion_fixed_apex_survival`.

2. **Order/permutation and crossed-arm selector clauses**:
   `cyclic_position_block_bounds`, `cyclic_position_block_permutation`,
   `cyclic_position_fixed_apices`, `crossed_arm_shared_fourth`,
   `crossed_arm_source-at-common`, `Q_fresh_outside_source_same_blocker`,
   `live_Q_named_pair_in_first_blocker_row`,
   `live_Q_ordered_outside_pair_selector`, and
   `live_Q_source_same_actual_blocker`.

3. **K4 and equality semantics**:
   `global_K4`, `critical_no_K4_after_source_deletion`, and
   `global_edge_equality_closure`.  The JSON names
   `Problem97.Census554.EqualityCore.EdgeClosure.sound` as the equality-closure
   endpoint, but literal decoding, closure membership, and the Boolean clause
   remain direct bridge obligations.

4. **Geometric base clauses**:
   `distinct_first_apex_radii`,
   `equal_pair_has_at_most_two_carrier_centers`,
   `two_complete_circles_intersect_at_most_two`,
   `full_selected_row_shared_pair_separation`, and
   `cap_crossing_kalmanson_shared_late_pair`.  These require direct
   hypothesis-to-clause proofs using the corresponding circle, separation, or
   Kalmanson production lemmas; they are not instances of a serialized
   `FULL_BANK_FAMILIES` cut.

The two remaining structural learned-cut block labels are covered in the
structural table.  Consequently, even after fixing the five theorem metadata
mismatches and promoting/replacing the scratch-only six-point theorem, the
checkpoint is not a Lean certificate: a decoder must still prove the base CNF,
each serialized structural clause, the learned theorem-key interpretation, and
the final propositional replay.

## Required corrections before a Lean bridge can claim exact registry fidelity

1. Change the four `Problem97.CapCrossingKalmanson.*` strings in
   `dual_row_cegar.py:65-104` to `Problem97.CapCrossingKalmansonBridge.*`.
2. Represent `convex_five_point_core` as an orientation-dispatched pair of
   declarations, or point metadata to a production wrapper that accepts the
   same dihedral guard.
3. Promote the `six_k2_three_row_triangle` result out of the explicit Scratch
   namespace (or prove a production wrapper with the identical hypotheses).
4. Supply direct Lean clause semantics for all five structural families and
   all base assertion blocks listed above.
5. Replay the v7 learned-cut payload and final CNF proof in Lean, then run a
   transitive axiom/kernel audit.  None of those steps is evidenced by v9.

## Remediation status (2026-08-01)

Items 1--3 are repaired in the working tree.  The four Kalmanson registry
strings now use `Problem97.CapCrossingKalmansonBridge`; the convex family names
the orientation-complete production theorem
`Problem97.Census554.ConvexFivePointCore.false_of_core_of_common_orientation`;
and
`Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`
is a cardinality-generic production proof of the former scratch-only family.
Focused Lean 4.27 checks of both new declarations pass, and their reported
transitive axioms are exactly `propext`, `Classical.choice`, and `Quot.sound`.

Items 4--5 remain open.  Registry repair does not establish atom decoding,
base-CNF semantics, structural-clause semantics, exhaustion, RUP replay, or a
transitive publish-spine dependency.  The second v9 source-at-common tranche
also remains `UNKNOWN_FAIL_CLOSED`; it accumulated 9,082 structural and 228,898
theorem cuts but supplied no certificate.
