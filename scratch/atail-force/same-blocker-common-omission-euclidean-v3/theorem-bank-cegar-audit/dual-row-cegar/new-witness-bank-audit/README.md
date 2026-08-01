# Dual-row witness theorem-bank audit

Date: 2026-08-01

This is a source-only audit of two witness generations:

- **old**: `../n17-profile-6-8-6-kalmanson/witness.json`
- **six-sparse**: `../n17-profile-6-8-6-kalmanson-six-sparse/witness.json`

No Lean, Lake, solver, generator, or kernel gate was run.  The conclusions below
are exact combinatorial substitutions into source-proved theorem statements, or
explicitly marked source-level coverage results.  They are not a fresh kernel
closure verdict.

## Scope and method

The earlier replay treated the ten packet rows in `row_supports` as its main
row universe.  Each witness also contains seventeen exact rows under
`base_semantic_replay.rows`.  This audit checked:

1. the ten packet rows alone (**role-only**);
2. the seventeen base rows plus the ten packet rows (**full rows**);
3. direct selected-row consumers;
4. equality-closure consumers, with every row identifying its four incident
   center-to-support distances; and
5. all theorem-bank registries required by `AGENTS.md`.

“Literal” below means increasing indices in the exact `cyclic_order` array, so
the named boundary-order theorem can be instantiated without rotating the
boundary enumeration.  “Cyclic-only” means a direction-preserving rotation of
that array matches the pattern; this is geometric coverage but needs a proved
rotated-boundary adapter before it is a literal application to the current
`Fin 17` enumeration.

## Decisive literal-order hits

Both generations fail existing production-reachable consumers before any of
the cyclic-only results are used.

| generation | theorem | ordered labels | exact row providers |
|---|---|---|---|
| old | `Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows` | `(i0,i1,i2,i3,i4,i5) = (a1,r1,q2,r2,s4,s2)` | `outside.apex1` supplies `r1,r2,s2`; `collision.opposite` or `outside.opposite` supplies `r1,r2,s4` |
| old and six-sparse | `Problem97.ATail.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` | `(ia,ib,ic,id) = (t2,a2,p2,s4)` | `base.t2` and `outside.apex2` both contain `p2,s4` |
| old and six-sparse | same theorem | `(ia,ib,ic,id) = (t4,a2,q2,s4)` | `base.t4` and `outside.apex2` both contain `q2,s4` |
| old and six-sparse | `Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw` | `(W,F,P,X,Z) = (t2,t1,a2,p2,s4)` | `base.t2` contains `t1,p2,s4`; `base.s4` contains `a2,p2` |
| six-sparse | `Problem97.ATail.CapCrossingKalmansonBridge.false_of_two_selected_middle_rows_shared_endpoint_pair` | `(ia,ib,ic,id) = (t3,p1,a3,s1)` | `base.p1` and `outside.apex3` both contain `t3,s1` |
| six-sparse | `Problem97.TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities` | `(A,B,C,D,E,F) = (t3,t2,t1,p2,r2,a3)` | `base.t2` gives `BA = BC = BD`; `base.a3` or `collision.apex3` gives `FA = FD = FE` |

Source locations and import status:

- sparse two-row: `lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean:436`, directly imported by `ATail/FrontierLiveClosure.lean:21`;
- shared-late and shared-endpoint pair: `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:427,523`, imported through `ATail/KalmansonThreeEqualitySchemas.lean` into `ATail/FrontierLiveClosure.lean:16`;
- five-point circle/isosceles: `lean/Erdos9796Proof/P97/Census554/FivePointCircleIsoscelesOrderBridge.lean:68`, directly imported by `ATail/FrontierLiveClosure.lean:24`; and
- two-triple six-point: `lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean:223`, imported by `P97/Phase3MetricCertificateBank.lean:7`, but no import of that bank into `FrontierLiveClosure` was found.  It is therefore source-proved and banked, not currently frontier-reachable by the inspected import path.

The first four-point substitution illustrates the replay gap: neither row pair
exists wholly inside the ten role rows.  It combines `base.t2` with
`outside.apex2`.  The five-point substitution is base-only and belongs to a
family distinct from the three five-point schemas already replayed.

## Requested six-point coverage ledger

Counts are unique ordered label substitutions.  “Full cyclic” includes literal
substitutions and all direction-preserving rotations.

| consumer | old role-only literal / cyclic | old full literal / cyclic | six-sparse role-only literal / cyclic | six-sparse full literal / cyclic |
|---|---:|---:|---:|---:|
| `SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows` | 1 / 2 | 1 / 8 | 0 / 1 | 0 / 4 |
| `SixPointEuclideanObstruction.false_of_six_ccw_three_selected_rows` | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 |
| `TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities` | 0 / 0 | 0 / 9 | 0 / 0 | 1 / 6 |

For the equality-only consumers, full equality closure gives:

| consumer | old literal / cyclic | six-sparse literal / cyclic |
|---|---:|---:|
| `SixPointEuclideanObstruction.false_of_six_ccw_mirror_interleaving_row_equalities` | 0 / 0 | 0 / 0 |
| `SixPointEuclideanObstruction.false_of_six_ccw_row_equalities` | 0 / 2 | 0 / 2 |

The two cyclic-only substitutions for the latter are
`(A,B,C,D,E,F) = (q1,a1,t3,t2,t4,p1)` and
`(q1,a1,t3,t2,t4,p2)`.  They are not counted as literal closure above.

The newly added sparse cut removes the old literal sparse witness hit, but the
new witness still has four full-row cyclic sparse patterns.  One is
`(p2,s2,a1,t1,r1,q2)`, with `base.p2` (or either common packet row) and
`outside.apex1`; another is `(q2,s4,t3,t2,t4,r1)`, with the `q2` row and
`base.t3`.  Thus the sparse cut is clean only in the narrower literal/role-row
matcher, not under full cyclic row composition.

## Other current-project consumers

The following exact checks used the full 27 row objects.

| family | result |
|---|---|
| `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order` | no literal hit; 7 old and 5 six-sparse cyclic-only substitutions |
| `Census554.FiveRowCircleIntersectionOrderCore.false_of_core` | no hit in either generation, including unrestricted auxiliary labels `X5,X6,X9` and cyclic spine rotation |
| `Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` | metric-core hits exist; the literal Cap shared-late theorem above is the stronger direct selected-row packaging of two of them |
| `SixPointTwoCircleArcOvertakeOrderCore.false_of_core` and carrier bridge | no full equality-closure hit |
| `SixPointTwoCircleOrderCore.six_point_twoCircle_order_incompatible` / `false_of_core` | no full equality-closure hit |
| `SixPointNestedCenterOrderCore.false_of_core` | no full equality-closure hit |
| `SixPointCircleChainOrderCore.false_of_core` | no full equality-closure hit |
| `false_of_centerAt_selectedFourClass_inter_card_ge_three` | covered by the already-replayed two-row support-overlap check, not a new family |
| `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair` | covered by the already-replayed common-bisector triple, subject to its packet provenance hypotheses |
| `false_of_mutualClassPair_sharedMember_thirdClassExcludes` | no exact-row hit, literal or cyclic, in either generation |
| critical-shell and large-cap/U5 wrappers | not directly instantiable from `witness.json`: their shell, cap, class, exactness, or `CounterexampleData` provenance is absent |

## External/sibling theorem-bank ledger

The audit read:

- `docs/general-n-certificate-bank-mining-2026-07-09.md` (especially sibling
  `p97-rvol` banks);
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The sibling registry contains 500 source-proved novel `False` consumers (481
RVOL-reachable and 19 unimported).  A relaxed source-header matcher checked all
133 source-proved `metric-point-uniform` `False` candidate declarations against
the full equality closure of each witness.  It parsed 131 declarations and
found **zero injective metric-pattern embeddings** in either generation.  The
two structure-wrapper headers not expanded by the matcher were:

- `Problem97.U5QCriticalMotifAGramMetricPacket.incompatibility`;
- `Problem97.U5QCriticalMotifATailPairMetricPacket.incompatibility`.

Their expanded antecedent consumers occur separately in the registry and were
among the zero-hit parsed declarations.  The check deliberately relaxed
non-metric hypotheses, so failure of the required metric equalities is enough
to exclude an injective embedding.  This is a source-text audit, not a parser
proof or kernel check.

The remaining sibling consumers require class/U5/U1 packet data, scalar
coordinates, cap predicates, common-point choices, or an ambient
`CounterexampleData` classifier not present in the JSON witness.  The bank
registry itself identifies this producer/classifier gap.  They are classified
as **not artifact-instantiable**, not as mathematically refuted.

The legacy registries contain 39 and 38 novel contradiction consumers,
respectively.  Their useful metric material is tied to fixed-`N9` or explicit
scalar/coordinate interfaces; this `N17` row witness supplies neither the
normalization nor those scalar hypotheses.  No direct artifact-level
instantiation was found.

## Conclusion

Neither witness generation is theorem-bank clean.  The six-sparse generation
fixes the old literal sparse-row hit but has a literal two-triple six-point hit,
three literal production-reachable Cap hits, and the unchanged literal
five-point circle/isosceles hit.  The immediate CEGAR coverage defect is not a
missing deep external theorem: it is failure to compose the seventeen base
rows with the ten packet rows, together with omission of the existing
five-point circle/isosceles consumer.
