# Global confinement metric-core audit

Date: 2026-07-10

## Verdict

The original 30-system metric-realizability UNKNOWN frontier is fully
classified by three reusable geometric obstruction schemas.  Together with
the two earlier equality-closure schemas, the deterministic probe classifies
all 1,325 saved row systems as contradictory:

| Structural obstruction | Saved systems | Proof status |
|---|---:|---|
| duplicate center | 1,264 | generic Lean theorem |
| exact off-circle | 31 | generic Lean theorem |
| three points on one perpendicular bisector | 20 | generic Lean theorem |
| cyclic five-point bisector/circle core | 9 | generic Lean theorem |
| cyclic rhombus with two equilateral apices | 1 | generic Lean theorem |

The complete bounded artifact is
`census/global_confinement/metric_realizability_structural_complete.{md,json}`.
Its three source hashes are recorded in the JSON, and its summary is exactly
`1264 + 31 + 20 + 9 + 1 = 1325` with no remaining UNKNOWN.

This closes the **bounded metric-core triage**, not the PIN-GENERAL producer.
The saved JSON assignments are not Lean terms realizing every arbitrary audit
frame, and the extraction currently covers observed `n = 11,12` probe
assignments rather than arbitrary `n`.

## Frontier adjudication

The 30-ID baseline has digest
`085f332d753a3ca693230196643fc68c504afbd5ca99863a4433ab8ee97092d2`.
Independent cvc5 triage at 30 seconds per stage found four full-convex UNSAT
systems and left 26 UNKNOWN.  Those solver verdicts were diagnostic only and
are not used as proof certificates.

Equality-closure mining gives a complete structural partition of the same 30
IDs:

- 20 perpendicular-bisector cores;
- 9 cyclic five-point cores; and
- 1 cyclic rhombus/equilateral core.

The last system is `70d66f0cd568debd988f`.  Its core is
`a,b,c,x,y,d = 11,3,4,5,6,7`: `a,b,c,d` is an equal-sided quadrilateral,
while `b,c,y` and `x,d,a` are equilateral.  The required cyclic order makes
the turns at `c,x,y` and `x,y,d` incompatible.  A separate 120-second-per-stage
cvc5 rerun remained UNKNOWN at all three relaxations; it is retained as
`metric_realizability_cvc5_last_120s.{md,json}` to make clear that the closure
comes from the structural theorem, not a delayed solver verdict.

## Kernel-checked endpoints

The reusable endpoints are:

- `EqualityCore.not_realizes_of_duplicateCenterCore`;
- `EqualityCore.false_of_exactAt_of_exactOffCircleCore`;
- `EqualityCore.false_of_convexIndep_of_perpBisectorCore`;
- `ConvexFivePointCore.false_of_core`; and
- `ConvexRhombusCore.false_of_core`.

Targeted `lake-build` succeeds for the changed census modules.
`proof-blueprint axioms` reports only `propext`, `Classical.choice`, and
`Quot.sound` for both new orientation-sensitive wrappers.  The five-point and
rhombus theorems are general finite-label geometric consumers; no census bound
occurs in their statements.

## Project effect

The result gives a direct geometric contradiction for each saved assignment
once its row equalities and recorded cyclic order are realized.  It does not
by itself prove `RowwiseConfinedQDeletedClasses`, eliminate every arbitrary
q-critical row, or close
`Problem97.isM44PinnedSurplusGeneralMResidualsExcluded`.

The relevant open symbol remains
`Problem97.isM44PinnedSurplusGeneralMResidualsExcluded`; this work adds proved
consumers below a future producer and does not claim a spine diff.

The bridge surface has since advanced in four proof-clean steps:

1. `GeneralCarrierBridge.rowPattern` and `realizes` construct the canonical
   arbitrary-cardinality realized row system.
2. `MetricCoreAlternative` and `ShellMetricCoreAlternative` package and consume
   the five mined obstruction families plus equal-K4, equilateral-bisector,
   three-triad, surplus-source, six-row-anchor, and seven-point-orbit collision
   cores; the two cyclic consumers accept the live negative signed-area
   convention.
3. `BoundaryIndexing` gives every canonical carrier label an injective index in
   one CCW boundary enumeration, and `BoundaryIndexing.sharedPair_satisfied`
   applies the generic `btw_sep` theorem to any realized shared-pair core.
4. `PinnedCarrierBridge` preserves the pinned exact row, a surplus-apex selected
   row containing the deleted source, and the extracted dangerous critical row
   simultaneously in one `CriticalShellSystem` and `FaithfulCarrierPattern`.

These steps answer the realization, sign, exact-row, and boundary-index parts of
the original audit. They do not extract a core from every arbitrary frame.

The remaining bridge has two acceptable forms:

1. prove that every arbitrary PIN-GENERAL audit frame produces a realized
   `RowPattern`, the required orientation facts, and one of a proved exhaustive
   family of core schemas; or
2. prove a finite-code completeness theorem mapping every arbitrary frame to
   the saved/certified assignment domain, then consume the structural
   partition inside Lean.

Neither bridge may assume rowwise confinement or another downstream
containment conclusion.

## Surplus-source falsifier addendum

The stronger
`census.global_confinement.surplus_source_metric_core_probe` requires the
surplus-apex selected four-class to contain the deleted surplus point. This
matches the strengthened three-row Lean carrier and directly tests a concern
left open by the original audit. The scan is checkpointed and still active, so
its current counts are not a terminal census.

The concern is real: the strengthened incidence search has assignments that
avoid all five schemas used by its first version. Thus the five-family producer
was not merely unproved; it was false for the encoded incidence hypotheses.
The v2 scan and Lean alternative then added equal-K4,
equilateral-bisector collision, and three-triad collision cores. Its first
saved survivor was packet 54. A 60-second-per-stage Z3 run returned UNKNOWN at
the exact-metric, full-convex, and convex-only stages; UNKNOWN carries no
verdict.

Algebraic follow-up on that saved packet-54 assignment found a unit ideal over
characteristic zero. That calculation has now been replaced, for proof-facing
purposes, by the direct Lean theorem
`EqualityCore.not_realizes_of_surplusSourceCollisionCore`. The theorem proves
the extracted eleven-distance obstruction by similarity normalization and a
scalar reflection argument; it uses no generated certificate. Its axiom closure
is only `propext`, `Classical.choice`, and `Quot.sound`.

The v3 detector checked this surplus-source collision as a ninth generic core.
It kills the known packet-54 assignment with
`(O,A,B,C,U,V,W) = (1,4,7,8,6,9,10)`, but packet 54 as a whole remains
`INDETERMINATE` after reaching the 300,000-node cap.

A detector audit then found that v3 incorrectly required all seven core roles
to be distinct, while the Lean structure requires only `O != A`. This was a
conservative false-negative risk: it could manufacture SAT or
`INDETERMINATE`, but could not invalidate an `UNSAT` result. The corrected
role-alias detector still classified every directly replayed v3 SAT assignment,
including packets 85 and 181, as nine-core-free. The audit also found that a
same-schema resume retained `INDETERMINATE` rows. Schema v4 fixes both issues:
it validates the input digest and packet scope, retries all nonterminal rows,
and migrates only monotone `UNSAT` results from v1--v3.

The corrected v4 scan is now complete. Its 517 packet verdicts are 167 `UNSAT`,
250 `SAT`, and 100 `INDETERMINATE`. The exact artifact is archived as
`census/global_confinement/surplus_source_metric_core_results_n11_12_v4.json`
with SHA-256
`d26afd7901bc72b80d212caad6c48d9aa088b653cca3ac7caeca7811ca3b0062`.

Two further exact QQ unit cores were extracted from the saved packet-85 and
packet-181 witnesses and proved generically in Lean as
`not_realizes_of_sixRowAnchorCollisionCore` and
`not_realizes_of_sevenPointOrbitCollisionCore`. Each requires only `O != A`;
all other roles may alias. Their axiom closures are exactly `propext`,
`Classical.choice`, and `Quot.sound`. The corresponding v4 witnesses are no
longer eleven-core-free, but this does not classify either packet: a new search
is required to decide whether another witness exists.

Schema v5 performs that search. It adds the two new detectors, carries explicit
`legacy_resume` provenance on every inherited row, reuses exactly the 167
monotone v4 `UNSAT` verdicts, and retries all 350 v4 `SAT` or `INDETERMINATE`
packets. The run is active and its rolling counts are not terminal. Detector
semantics were regression-checked on 72 tests and by a 250-system randomized
differential comparison. Sharing the equality-closure matrix reduced a saved
packet-177 prefix check from about 8.05 ms to 1.27 ms and a full check from
about 45.05 ms to 6.77 ms on this host.

The permanent `equality_ideal_probe.py` provides a second triage layer. It
extracts normalized rows from saved v4/v5 SAT witnesses, emits exact QQ
squared-distance ideals, runs guarded Singular smoke tests, and greedily removes
rows only after a confirmed unit-ideal verdict. `UNIT` means exactly that the
gauge-fixed equality ideal contains 1; `NONUNIT` is not a real-realizability
claim. Packet 177 survives all eleven named detectors under direct replay, but
its seven-point equality subsystem is Singular-confirmed unit. A direct Lean
`grobner` proof exceeded the 16 GB build cap after 575 seconds, so this is a
formalization candidate rather than a proved twelfth consumer.

Eleven consumers are therefore proved, while the total producer remains open.
The active probe cannot supply that arbitrary-`n` theorem by itself. Exact local
models also show that the pinned/surplus/dangerous three-row packet alone does
not force a contradiction; additional global shell/audit data is load-bearing.

Auditing all four sources in the surplus-apex class does not add a hidden
producer. Let `O := S.oppositeVertexByIndex S.surplusIdx`. The first unsupported
fact needed for the shared-pair route is, schematically,

```lean
∃ q (hq : q ∈ K.support) z,
  z ∈ K.support ∧ z ≠ q ∧
  H.centerAt q (K.support_subset_A hq) ≠ O ∧
  z ∈ (H.selectedAt q (K.support_subset_A hq))
    .toCriticalFourShell.support
```

`CriticalShellSystem` proves that `q` lies in its own chosen shell but does not
force this second intersection point at a blocker distinct from `O`. The saved
packet-177 incidence witness realizes exactly that one-point-intersection
obstruction inside the bounded shadow. Even if the existential is proved, a
second independent theorem must show that the resulting strict boundary
subinterval inherits a live audit/blocker state; cyclic alternation alone does
not provide recurrence.

There is also a concrete orientation-convention boundary.  The metric probe
encodes the stored order with positive Cartesian cross products, whereas
`ConvexCyclicOrder.hneg_of_ccw` gives negative `signedArea2` for increasing
indices in the current Lean boundary enumeration.  A producer must therefore
construct the matching reversed/reflected order or add a sign-symmetric core
wrapper.  Directly passing `hneg_of_ccw` to the current positive-orientation
wrappers is not type-correct and is not an accepted bridge.

## Questions and concerns

1. What theorem, rather than a probe convention, makes `extract_systems`
   exhaustive for the PIN-GENERAL frame interface?
2. How will the remaining `U3FixedTripleAuditFrame` rows be selected in the
   already-constructed arbitrary-cardinality `rowPattern` so that an equality
   core is forced?
3. Which geometric transition produces the second shared support point and
   its `SharedPairSeparationCore`, then carries a valid audit state into the
   resulting strict boundary subinterval; or instead produces another proved
   metric core?
4. Can the obstruction alternatives be extracted centerwise, or is a
   global assignment/certificate object required to preserve equality paths
   spanning several rows?
5. Can a returning audit escape be shown to decrease a finite cyclic interval
   rank, rather than merely returning to previously accumulated support?
6. Is the intended closure theorem general in ambient `n`, or should the
   project first isolate and formally close only the `n = 11,12` slice?

Until these questions are answered by theorem signatures and implementations,
the correct status is **PROVEN eleven generic consumers / EXACT complete v4
nine-core census within the bounded incidence abstraction / ACTIVE v5
eleven-core retry / EXACT direct replay of eleven-core-free saved witnesses /
FALSIFIED eleven-family producer under the encoded three-row-plus-shell shadow
/ OPEN general producer**.

## 2026-07-11 card-eleven addendum

The preceding conclusion is retained as the audit of the earlier
packet-stratified route, but it is no longer the current closure status.
Subsequent Lean work proved that the target's strict `5 < m` branch has
`m = 6` and `A.card = 11`, and proved the exact one-hit/two-hit selected-row
counts along the six-point surplus cap. The packet-177 equality obstruction is
also now the twelfth generic consumer,
`not_realizes_of_sevenPointCircleNetworkCollisionCore`.

The cap-selected direct probe then enumerated the exact forced finite surface,
not one representative per earlier packet type. It covered all twelve ordered
choices of distinct pinned/deleted surplus-interior labels. Every placement was
exhaustive, the maximum node count was 315,503, and the residual bank was empty.
The artifact is
`census/global_confinement/direct_cap_selected_metric_core_residuals_n11.json`
with SHA-256
`5d084bf9b5e9cca3f76418d30efde7ec9251915715ba85599be425d8442dd673`.
The temporary three-pattern residual was fully explained by a forward-only
cyclic-order detector: all three patterns already contained the convex
five-point core in reverse orientation. Both orientations are now checked and
regression-tested.

This removes audit questions 2--6 from the current critical path: the target is
finite, the full audit rows need not drive a general descent, and the core
family is exhaustive in the declared direct model. Question 1 survives in a
more precise form. The remaining acceptance risks are:

1. the Python enumeration must be replaced by a kernel-checked finite
   classifier or certificate replay;
2. the live card-eleven geometry must be labeled as the canonical `(6,4,4)`
   `Fin 11` code, proving every incidence/blocker field and closure-color
   soundness; and
3. the labeling must transport the hull order in either orientation so the two
   order-sensitive core consumers receive the required signed-area facts.

The updated status is **PROVEN cardinality reduction and twelve generic
consumers / EXACT zero-residual direct finite census within the declared model /
OPEN verified finite classifier / OPEN geometric labeling and soundness bridge /
OPEN sole target `sorry`**.

### Native-classifier implementation audit

The first replacement-classifier checkpoint is now independently buildable.
`CapSelectedNativeClassifier.placementCheck_p6_d4` closes one placement by
`native_decide` in about 81 seconds. The older free-color bitvector run had no
verdict after 55 minutes; therefore only the lower-bound statement "more than
40x faster relative to elapsed old runtime" is justified. No completed runtime
ratio for the old classifier is claimed.

The soundness boundary is explicit. Closed finite mask identities live in
`CapSelectedNativeClassifierFacts`; ordinary proofs in
`CapSelectedNativeClassifierSound` connect semantic rows to candidate masks,
the fixed seed, overlap, Q3, cyclic separation, and `rowsCompatible`. The
canonical closure-color and exact direct-or-mirror boundary-block modules also
build. Unadjudicated risks remain: pair-count pruning, search-tree coverage,
closure-path/core soundness, eleven unchecked placements, and conversion of
the boundary blocks to canonical labels. Accordingly the audit status remains
OPEN and the target `sorry` is untouched.

### Native-classifier search-coverage addendum (2026-07-11)

Two risks listed above are now discharged in Lean. The soundness module proves
the pair-count pruning guard `pairBoundOK` and the complete `compatibleWith`
filter for every fresh semantic row. `CapSelectedNativeClassifierCoverage`
then proves that domain sorting is permutation-only, restriction preserves the
distinguished semantic rows, and a successful native placement check produces
a duplicate-free semantic prefix with `hasPrefixCore = true`.

The audit remains OPEN. The unadjudicated finite risks are explicit
closure-path replay/core extraction and the eleven remaining placement checks;
the geometric risk remains conversion of exact boundary blocks to canonical
labels and the live `IncidenceOK`/`PinnedShellOK` interface.

### All-placement and checked-nogood addendum (2026-07-11)

The two finite risks in the preceding paragraph have now been narrowed.
`CapSelectedNativePlacements.allPlacementChecks` packages successful Lean
replays for all twelve ordered pin/deletion placements. Its live axiom audit
reports `propext`, `Lean.ofReduceBool`, and the project-approved
`Lean.trustCompiler`; the evaluated project modules contain no `unsafe`,
`@[implemented_by]`, or `@[extern]` declarations.

`CapSelectedNogoodCertificate` now checks proof-free row choices and direct
row/flip closure paths and proves that a checked match yields the existing
`ClosureCoreAlternative`. `CapSelectedNogoodClassifier` separately proves the
full semantic DFS trace for a static checked bank. Thus core extraction and
search coverage are proved at the generic checker level. The remaining finite
risk is concrete: emit the compact bank payload, validate every path, and prove
all twelve static-bank placement checks. The geometric labeling and source
consumer remain open as stated above.
