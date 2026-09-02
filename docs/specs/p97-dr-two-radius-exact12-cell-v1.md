# D-R two-radius branch: exact-12 full-carrier cell specification (v1)

Date: 2026-09-01. Lane `dr-two-radius-20260901`. Plan
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 1b. Target
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch`
(`Rigid221Closure.lean`).

Status: specification only. Nothing here is a verdict. Encoding 1a (named-role
quotient) is SAT by exact witnesses (`docs/audits/2026-09-01-dr-two-radius-quotient-wave.md`),
so this encoding adds exactly what the quotient omits: a blocker for every
carrier point, the carrier count, and full-class exactness for every incidence.

## 1. Carrier at card 12

From the plan's Section 4 (arithmetic of checked lemmas, Lean statement is
Phase 2 item L1, still {{NEEDS_PROOF}}): profile `(surplus, opp1, opp2) = (5, 4, 6)`,
growth arm `secondOpposite` only.

| role | points | source |
|---|---|---|
| apexes | `a1 = oppApex1`, `a2 = oppApex2`, `a3 = surplusApex` | `SurplusCapPacket` |
| `Is` (surplus interior) | `s1, s2, s3` | `surplusCap.card = 5` |
| `I1` (first-opposite interior) | `iq = interior_q`, `iw = interior_w` | `oppCap1.card = 4`, `OriginalUniqueFourResidual.interior_q_mem/interior_w_mem` |
| `I2` (second-opposite interior) | `t1, t2, t3, t4` | `oppCap2.card = 6` |

Twelve points, all distinct, in convex position, cyclic order
`a1, Is, a2, I1, a3, I2` in one boundary orientation, up to reversal (cap `i` has endpoints
`v_{i+1}, v_{i+2}`; see the 1a ledger). Within-cap orders are cell data.

## 2. Incidence structure

Boolean incidence variable `E(c, r, z)`: point `z` lies on the class with
label `r` about center `c`. Classes are full radius classes (`CriticalFourShell.support_eq`):
two points equidistant from `c` are in the same class. The structural layer
carries at most the classes the binders name; the metric layer makes every
other equidistance a strict inequality (exactness).

Named classes:

- `C`, `C'` at `a2` (radii `rho ≠ otherRadius`): `firstRow`, `secondRow`
  (`SelectedFourClass D.A S.oppApex2`, `support_card = 4`, supports disjoint).
  At card 12 with `_hnoFive`, every class at `a2` has at most 4 points.
- `U` at `a1`: `R.class_card_eq_four`, `U = {iq, iw, p2, ps}` with
  `p2 ∈ closed I2 = {t_i} ∪ {a3}`, `ps ∈ closed Is = {s_j} ∪ {a2}`
  (adjacent-cap one-hit lemmas at `oppApex1`). Frontier pair `q, w ∈ U`,
  `q, w ∉ Is`.
- `B1` at `c1 = χ(source)` (`U5QDeletedK4Class`, card 4, `deleted ∉ B1`,
  `c1 ∉ B1`, `source ∈ B1` by `no_qfree`), `B2` at `a2` (card 4,
  `deleted ∉ B2`), `|B1 ∩ B2| ≤ 2` (`CommonDeletionTwoCenterPacket`).
- For every carrier point `z`: blocker `χ(z) ∈ A \ {z}` with its unique
  four-class containing `z`; every other class at `χ(z)` has at most 3 points
  (`CriticalShellSystem.shellAt`, `no_qfree`). `χ(z) ≠ a2` for every `z`
  (two disjoint four-classes at `a2`). Under `lateFirstApexSystem`, `χ(u) = a1`
  for every `u ∈ U`; `χ(source) ∉ {a1, a2}`
  (`outsideFirstApexFiber`, `blocker_ne_secondApex`).
- K4 everywhere: every point has at least four equidistant points
  (`CounterexampleData.K4 : HasNEquidistantProperty 4 A`,
  `U1TwoShortCapReduction.lean`).
- Deletion facts: `FullyDeletionRobustAt D a2` (automatic from the two
  disjoint four-classes); packet `survives₁`: `B1` witnesses K4 at `c1` after
  deleting `deleted`; `survives₂` likewise at `a2`.

## 3. Structural cell

A cell fixes: the within-cap orders; the support of `C`, `C'` (2 + 2 split of
`I2`, one pick in each adjacent closed cap each, all 8 distinct); `p2, ps`;
`(q, w)` and `deleted`; `source` and `c1`; `B1`; `B2 ∈ {C, C'}`; the blocker
`χ(z)` and its four-class support for every `z`; the remaining incidence
variables. The structural stage enumerates cells as models of a CNF over the
incidence variables under the cardinality and exclusion clauses above; the
reuse of the B1 lane's `CoverInstance` and static layers is recorded in the
encoder module once the reuse map is settled.

Structural negative control (plan guardrail, counting): the closed sibling
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition`
closes by `hfive` against `_hnoFive`; the control asserts a five-class at
`a2` and must be UNSAT at the structural stage.

## 3a. Reuse map (audited 2026-09-01) and structural-first plan

Audit of `census/card_head/b1_exact12_structural.py`, `sat_encoding.py`,
the three `b1_exact12_static_*.py` layers and `b1_exact12_metric_piqd.py`:

- `sat_encoding.CoverInstance` selects exactly one four-row per center
  (`sat_encoding.py:135-142`). D-R needs two disjoint four-classes at `a2`
  plus the packet row, so the row model is not reusable. Its profile table
  (`profiles.py`, minimum `(5,5,4)`) has no `(5,4,6)`; the model-slot
  profile `(5,6,4)` with `a2 = V` is the theorem-order `(5,4,6)`.
- The E/G/C static layers check exact types
  (`b1_exact12_static_equality.py:233-240`), so their installers are not
  reusable; their clause generators are: the equality relation over the 66
  edges with transitivity and duplicate-three-point-center clauses
  (`static_equality.py:339-389`), `_cached_geometry_clause_delta(edges,
  relation_variable_items)` (`static_geometry.py:336-676`, every rule names
  its Lean theorem) and `_convex_clause_delta` (`static_convex.py:133-155`)
  take only edges and the relation map.
- `b1_exact12_metric_piqd.py` is pinned to the B1 lane, profile, run id,
  cell index and producer path throughout; only the generic
  `metric_realizability_piqd.build_stage_smt2` (rows with `exact` flags plus
  cyclic order) is reusable.
- Not present anywhere: no-five at `a2`, blocker existence and uniqueness
  (`CriticalShellSystem`), `FullyDeletionRobustAt`, distinct radii, the
  ingress packet fields, cyclic order at the SAT level. These are new D-R
  clause blocks.

Decision. Encoding 1b is built structural-first as one CNF over the
edge-equality relation `eq(e, e')` on the 66 edges of the 12 points (as in
the B1 E-layer), with the D-R blocks from Section 2 stated as cardinality
and exclusion constraints on that relation (class of `z` at `c` = edges
`cz'` equal to `cz`), plus the reusable G and C deltas. CaDiCaL through
PIQD with DRAT capture decides it. Structural UNSAT at card 12 would be a
finite incidence result with a checked proof and no coordinates, the same
shape the B1 certificate ingress consumes; structural SAT yields explicit
equality patterns, enumerated under a cap with blocking clauses, for the
metric stage. New module: `census/card_head/dr_exact12_structural.py`
(to be added to the lane's owned paths before it is written).

## 4. Static and metric stages

Static layers (order and convexity consequences that need no coordinates)
prune cells; every prune names its theorem or is a relaxation recorded in the
cut admission record.

Metric stage per surviving cell: every incidence `E(c, r, z)` is an equality
`|z − c|² = ρ_{c,r}`, every non-incidence is a strict inequality, convex
position is the 12·10 orientation atoms, MEC and non-obtuse atoms as in 1a.

Instruments. The 1a wave showed Z3 QF_NRA one-shot through PIQD cannot settle
an 18-atom geometric UNSAT; it is not the UNSAT oracle here.

- SAT side: the 1a constructive search (rational circle points, frozen-order
  trust-region least squares, exact replay), extended to per-cell incidence
  lists. A replayed configuration is a witness for that cell.
- UNSAT side: either a Lean-provable counting or order argument at the cell
  level (preferred; feeds Phase 3 directly) or an algebra engine
  (Gröbner/CAD; needs Adam's per-task approval before any run). Until one of
  these runs, a cell that the constructive search cannot realize is
  `OPEN`, not UNSAT.

## 5. Claim boundary

Every stage result is a statement about this encoding at card 12. It carries
no Lean closure, coverage, or promotion claim; `promotion_eligible = false`.
Phase 3 (certificate ingress) is the only path to the spine.

## 3b. Structural stage, waves 2 and 3 (added 2026-09-01)

Encoder revision `p97-dr-exact12-structural-cnf/v2`
(`census/card_head/dr_exact12_structural.py`); the incidence-only CNF of
wave 1 is `build(geometry=False)`.

Cyclic order. `CYCLIC_ORDER = (a1, s1, s2, s3, a2, iq, iw, a3, t1, t2, t3, t4)`
(one boundary orientation, up to reversal, from `CapTriple` endpoint
membership; nothing below depends on which). The within-cap
orders are fixed without loss of generality: the base CNF is invariant under
relabelling inside `Is`, inside `I2`, and under the swap `iq ↔ iw`, so every
equality pattern of a configuration has a relabelled copy whose within-cap
orders match. Only orientation signs of carrier triples are read from the
order; no metric position is asserted.

Sign convention. A core whose Lean module provides both the all-positive and
the all-negative orientation form (`false_of_core` / `false_of_core_of_neg`,
or `false_of_core_of_common_orientation`) is instantiated on every injective
label tuple whose listed triples are all forward or all backward in the cyclic
order. That instance set is invariant under flipping the sign convention, so
the encoding does not depend on the orientation of `signedArea2`. The
side/arc bridge (a triple's sign is fixed by the cyclic order on a convex
carrier) is `Problem97.onArc_iff_between` and
`Problem97.signedArea2_neg_of_outside` (`ArcBlockContiguity.lean`, proved,
reachable from the aggregator through `SurplusM44Packet/Shard01`; import walk
of 2026-09-01) through
`exists_isCcwConvexPolygon_of_convexIndep`.

Core table (`GENERIC_CORES`; every source theorem needs only `Realizes`, that
is an injective planar realization, plus the orientation signs where listed;
`perp_bisector` additionally needs `ConvexIndep` of the carrier and carrier
membership of its points, both supplied by `CounterexampleData.convex`):

| family | labels | Lean source |
|---|---:|---|
| `perp_bisector` | 5 | `EqualityCore.false_of_convexIndep_of_perpBisectorCore` |
| `two_circle_same_arc` | 4 | `FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` + bridge |
| `equal_k4` | 4 | `EqualityCore.not_realizes_of_equalK4Core` |
| `equilateral_bisector` | 5 | `not_realizes_of_equilateralBisectorCollisionCore` |
| `hinge_five_cycle` | 5 | `false_of_fivePointHingeCycleCore` |
| `equilateral_chain_bisector` | 6 | `not_realizes_of_equilateralChainBisectorCore` |
| `hinge_six_tail`, `hinge_six_double_spoke` | 6 | `false_of_sixPointHingeTailCore`, `false_of_sixPointHingeDoubleSpokeCore` |
| `six_point_five_row_interlock`, `six_point_six_row_interlock` | 6 | `not_realizes_of_sixPointFiveRowInterlockCollisionCore`, `…SixRow…` |
| `convex_five_point`, `nested_equal_chord`, `five_point_circle_isosceles_order` | 5 | `ConvexFivePointCore`, `NestedEqualChordCore`, `FivePointCircleIsoscelesOrderCore` (order) |
| `six_point_two_circle_order`, `six_point_nested_center_order`, `six_point_circle_chain_order`, `six_point_two_circle_arc_overtake_order`, `convex_rhombus` | 6 | the same-named `Census554` order cores |
| lazy: `hinge_seven_closed_tail`, `seven_point_six_row_anchor`, `seven_point_six_row_interlock`, `seven_point_seven_row_interlock`, `seven_point_equilateral_median_interlock` | 7 | `EquilateralHingeCollisions`, the four seven-point row collisions |
| lazy: `five_row_circle_intersection_order` | 8 | `FiveRowCircleIntersectionOrderCore` (order) |

`five_point_circle_isosceles_order` also needs the chords `FX` and `PZ` to
cross; the encoder reads that from interleaving in the cyclic order. The
Lean bridge `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw` is
proved for the linear order `W < F < P < X < Z` on a ccw indexing (chords
cross by `CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw`);
the wrapper from the encoder's cyclic predicate is
`Census554.CyclicOrderDistanceCores.false_of_circle_isosceles_cyclic`
(proved 2026-09-01, dist level, cyclic pattern `W,F,P,X,Z` or its
reverse); the same-arc family has the dist-level wrapper
`CyclicOrderDistanceCores.false_of_two_circle_same_arc`. Cores whose statements need non-carrier data
(`MECStraddlingRowCore`, `CircleIntersectionInequalityCore`) or the card-11
macro-order machinery (`SeparationCore`) are omitted.

Lazy loop (`census/card_head/dr_exact12_session_loop.py`). One `piqc session`
(CaDiCaL kept alive) is seeded with the eager CNF; each SAT model is checked
against the lazy cores by the vectorised `core_violations`, violated
instances are appended, and the session is solved again. A model violating no
core is a structural survivor: its signature (`X`, `Y`, `U`, source, deleted,
`B2`, and for every point its blocker with the four-point shell) is recorded
and blocked; the loop ends at UNSAT or at a cap. A session UNSAT carries no
proof; the final formula is handed off as a raw-DIMACS job for a from-scratch
solve with DRAT capture.

Positive control: the distance-equality pattern of the regular 12-gon placed
in `CYCLIC_ORDER` satisfies every pure-geometry family and triggers no lazy
core (`test_dr_exact12_structural.py`). Differential control: the eager
families reproduce the audited B1 generators for the three shared rules and
contain the six B1-mined finite instances.

## 3c. Family-level minimal core (added 2026-09-01)

`census/card_head/dr_exact12_family_core.py` relaxes the eager CNF of 3b:
every clause of a *selectable* family carries one fresh selector literal
`-s_F` (one variable per family), while `transitivity`, the D-R hypothesis
blocks, `ingress`, and any control stay hard.  Selectable families are
`duplicate_three_point_center`, `perp_bisector`, `two_circle_same_arc`, and
every eager core of `GENERIC_CORES`.  Stripping the selector literals
returns the 3b clause list (tested).

One piqd session is seeded with the relaxed formula.  The first solve
assumes every selector true, which must reproduce the wave-3 UNSAT; the
assumption core the solver returns is a family core.  A deletion shrink
then drops one family at a time (in a caller-chosen order, so the families
whose Lean bridges are weakest are tried first): a drop that leaves the
formula UNSAT is kept, and the returned core prunes further; a drop that
makes it SAT is reverted.  A solve that is neither SAT nor UNSAT keeps its
family (fail-closed) and is recorded.  The output is one irreducible family
set: dropping any of its families makes the structural formula SAT.  It is
a minimal core over families, not a smallest one, and it lists the source
theorems a Phase 3 ingress must cover.  Every solve is a session receipt
with the base hash of the relaxed formula.

Result (wave 4, 2026-09-01): minimal family core
`{two_circle_same_arc, five_point_circle_isosceles_order}`; see the audit.
`build(families=...)` and the CLI flag `--family` build the base incidence
CNF plus any listed selectable families, which is how the wave-5 standalone
two-family CNF (254,412 clauses) and its one-family controls are produced.


Clause-level cores of the two-family CNF use finer selectors on the same
session loop.  `--by-group` gives one selector per family and unordered
label set (`family:group`, 1,287 selectors on the two-family CNF: 495
same-arc label sets and 792 isosceles label sets); `--coarse` gives one
selector per family and distinguished label set (`family:coarse`, 78
selectors: the 66 chords `{q, v}` of the same-arc family and the 12
centers `W` of the isosceles family).  The encoder records both keys per
geometry clause (`CNF.groups`, `CNF.coarse`; see `_group`).  The shrink is
the same deletion loop, so a result is one irreducible selector set at
the chosen granularity, not a smallest one.
