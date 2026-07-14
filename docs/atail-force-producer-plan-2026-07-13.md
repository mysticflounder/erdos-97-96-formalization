# ATAIL-FORCE shared-radius producer plan (2026-07-13)

## Status and lane authorization

Cardinality nomenclature is now fixed for this lane:

- **`CARD-GE-12` / `card-ge-12`** means a theorem whose hypothesis is
  `12 ≤ D.A.card`, uniformly covering every larger carrier.
- **`CARD-EQ-12` / `card-eq-12`** means a finite census, saved placement, or
  profile calculation under `D.A.card = 12` only.
- Bare **“card-12 producer”** is retired from current-status prose. Historical
  file names and immutable artifact identifiers are left unchanged, but they
  do not determine theorem scope.

Adam explicitly authorized this ATAIL work as genuine parallel closure
research. The live pair declaration is stated under `9 < D.A.card`; the two
large-cap hypotheses imply only `11 ≤ D.A.card`. No current theorem closes its
card-11 slice. Therefore ATAIL must be uniform from card 11, or the separate
A11 Census cover/consumer must return as a dependency for that slice. The
card-11 Census process is stopped at a nonterminal bank and is not resumed
implicitly. The released compute pool is available for a freshly manifested
successor.

That authorization includes proof-local analysis files, scratch Lean/Python
artifacts, bounded theorem-discovery computations, theorem-bank searches, and
closure-document synchronization needed to pursue this proof without
per-artifact permission. It does not transfer ownership of the separately
worked Route-B/LIVE-T1 source and does not authorize destructive or unrelated
external actions.

Current status:

- `ATAIL-SUB2`: PROVEN, audited, and landed in Lean.
- `ATAIL-Q3`: DONE-NEGATIVE within its stated selected-four/two-center
  abstraction.
- `ATAIL-DISTINCT-REPLAY`: DONE-NEGATIVE for all equality-only routes.
- `ATAIL-EQ-PILOT`, `ATAIL-INEQ-PILOT`, and `ATAIL-CVC5-PILOT`:
  DONE-NEGATIVE-TRACTABILITY.
- `ATAIL-ORDER-FAN-1`: CHECKED-SCRATCH; one 15-hypothesis scalar
  incompatibility has a solver-free Lean proof, but its exact selected-four
  orbit matcher reaches only 39 of 167,782 systems.
- `ATAIL-CAP-KERNELS-1`: CHECKED-SCRATCH; two order-free scalar
  incompatibilities have explicit Lean proofs. Together with
  `ATAIL-ORDER-FAN-1`, the exact union matcher reaches 129 of 167,782 systems
  across 45 joint classes, with no overlap among the three cuts.
- `ATAIL-LIVE-PROVENANCE`: CHECKED-SCRATCH; the outer wrapper's common
  `CriticalShellSystem` is retained through the five source rows and the extra
  `f2` row. An exact source-contract census covers all 35 helpers and all 79
  textual holes. The same current contracts also force a two-point
  off-dangerous subset of the `f2` support in all seven LIVE-C helpers. A
  corrected finite incidence census gives explicit witnesses for all seven
  families and forces none of the three modeled incidence sinks.
- `ATAIL-JOINT-FIBER-SINK`: CHECKED-SCRATCH; every fixed pair of opposite-apex
  radii has at most one carrier point outside the surplus cap. Each apex also
  has a K4 radius with at least three off-surplus points, so marginal K4 counts
  cannot produce the required collision without additional cross-apex
  correlation.
- `ATAIL-EXACT-APEX-PAIR-COVERAGE`: DONE-NEGATIVE at the finite
  exact-class/order abstraction.  The deterministic solver-free classifier in
  `census/atail_force/producer_coverage_census.py` exhausts all 369,743
  target-negating full exact-class pairs in the card-11 `(5,5,4)` and card-12
  `(6,5,4)` / `(5,5,5)` profiles.  Existing formalized banks classify 44,831,
  endpoint-radius containment classifies 108,435, and the imported arbitrary-
  packet adjacent-cap one-hit theorems classify 215,547.  They subsume both
  scratch MEC stages at this precedence; **930 survive** (96 / 150 / 684),
  with survivors in every profile.  Thus the two opposite-apex marginals plus
  the current fixed cyclic order are still not a coverage theorem.  The next
  surface must add the source-indexed deletion-critical map and a live
  cap/MEC coupling; extending the marginal classifier is theorem discovery,
  not the primary closure task.
- `ATAIL-BLOCKER-GRAPH-GATE`: DONE-NEGATIVE at the blocker abstraction. Exact
  finite and Euclidean non-convex witnesses show that global K4, deletion
  criticality, blocker cycles, and overlap at most two do not force the fixed
  opposite-apex joint pair.
- `ATAIL-GLOBAL-COUNT-CARD-EQ-12`: DONE-NEGATIVE for the current ordered-cap count.
  The proved per-cap contribution `m+4` has large pair-capacity slack, and
  common-system blocker rows cannot be counted independently from global K4
  rows at the same center. Deterministic strengthened finite shadows for both
  `CARD-EQ-12` profiles satisfy the count, blocker cover, cyclic/order constraints,
  and singleton joint fibers. They are not Euclidean models; they terminate
  the finite double-count route and require a real metric/order coupling.
- `ATAIL-SAME-CAP-BOUNDARY`: CHECKED-SCRATCH; the dangerous `p` row supplies
  two points outside any indexed cap containing `p`, the `u` row is proved to
  have center different from `p`, and an exact proposition packages the only
  remaining datum: a second distinct center in the same cap equidistant from
  that outside pair. Its `.false` theorem immediately applies
  `outsidePair_unique_capCenter`. All audited endpoints use only the standard
  core axioms. The additional checked theorem
  `.of_criticalShell_capMultiplicity` shows that it suffices to find one
  non-`p` critical center in `p`'s cap whose shell contains two dangerous
  outside points. Cap sizes alone do not force this except in the extremal
  cap-size-4/all-four-outside case. The one-call
  `false_of_criticalShell_sameCap_capMultiplicity` adapter is also
  kernel-checked.
- `ATAIL-DANGEROUS-BLOCKER-COLLAPSE`: CHECKED-NEGATIVE in Lean. The dangerous
  radius class is exactly `{q,t1,t2,t3}`; deleting any member blocks `p`; and
  any critical-shell system can be overridden so all four dangerous sources
  choose `p`. Thus an arbitrary `hcritical` witness plus a dangerous source
  cannot force the required non-`p` center. Use a source outside the dangerous
  class, an independently constructed non-`p` blocker, or common provenance
  which makes the consumed row invariant under this override.
- `ATAIL-OUTSIDE-SOURCE-BOUNDARY`: CHECKED-SCRATCH. The live source `u` is
  outside the dangerous class, and both the supplied `u` row and any
  common-system row at `u` have center different from `p`. The exact remaining
  fields are one common cap containing `p` and that center, plus two dangerous
  row-support points outside it. Existing cap coverage and complement bounds
  are independent and do not align those sets. A checked sufficient condition
  confines all off-dangerous `u`-row support to the common cap; proving that
  confinement is genuine new content.
- `ATAIL-UROW-CAP-MULTIPLICITY-AUDIT`: DONE-NEGATIVE for the current local
  derivation surface; the full live implication remains CONJECTURED. The exact
  strictly convex Euclidean `(4,5,6)` relaxed residual has a common cap and the
  generic center-cap intersection bound, but only one dangerous `u`-row point
  outside that cap, so it refutes the attempted combination of the two
  complement bounds. It is not a live counterexample: the named Moser frame is
  not an MEC frame, global K4 fails at eight centers, and the full
  no-M44/full-filter coupling is absent. The pair theorem also erases the fact
  that its five rows were built from the same `CriticalShellSystem` as
  `hcritical`; restoring that provenance is necessary for a common-system
  argument but does not itself prove either cap-alignment field. Audit:
  `docs/audits/2026-07-13-atail-urow-cap-multiplicity-geometric-audit.md`.
- `ATAIL-CRITICAL-SYSTEM-FIBER-COUNT`: CHECKED-SCRATCH and PROVEN. For one
  retained `CriticalShellSystem`, every `centerAt` fiber injects into a locked
  exact four-point support, so `|A| <= 4 * |image(centerAt)|`. The live
  `9 < |A|` hypothesis forces three blocker centers; a fourth is forced only
  above card 12. The strongest generic same-cap pigeonhole needs
  `4 * (|A \ cap| + 1) < |A|`, which fails for all card-12 caps of size at
  most six and remains too weak at card 13. This is a reusable incidence field,
  not the missing placement producer.
- `ATAIL-CERTIFICATE-BANK-GENERALIZATION`: AUDITED. The sibling fixed
  `Fin 6` / `Fin 8` theorem `u5_gram_cert_checker_sound` exposes the strongest
  general theorem schema: a sound Gram-certificate checker over arbitrary
  finite row and label types. Its archived checker handled 37,278 of 37,350
  targeted U5 residual patterns. Generalizing it would consolidate metric
  consumers for changing graphs, but it cannot choose live rows or prove
  coverage. The bank's second recurring object is the four-uniform
  critical-shell incidence design; its card-12 counts remain slack. Audit:
  `docs/audits/2026-07-13-atail-certificate-bank-generalization-audit.md`.
- `CENSUS554-CURRENT-TAIL-PATTERNS`: AUDITED on the paused 5,939-row bank.
  Rows 5,633--5,939 contain 307 rows and 306 arbitrary-relabeling motifs, all
  306 new versus the 5,632-row prefix, and none belongs to the original four
  equality-core families. Thirty-two rows minimize to four already-known
  perpendicular-bisector cores; the only other repeated motif occurs twice and
  matches no current unordered detector. This supports a general compiler and
  order-aware consumers, not a new fixed unordered theorem family. It is
  deterministic census evidence, not a completeness or stabilization theorem;
  the full exact replay remains `NOT_RUN`. Audit:
  `scratch/census-554/current_tail_pattern_audit_2026-07-13.md`.
- `ATAIL-PAIR-SECOND-CENTER-CARD-EQ-12`: DONE-NEGATIVE within its finite incidence
  shadow. One explicit placement in each `CARD-EQ-12` profile has a validated
  29-row witness with no encoded-row Q-C witness, even after retaining five
  supplied exact rows, a selected exact row at every center, and one
  source-indexed critical-system row at every point. This is not a Euclidean
  model and does not test arbitrary bisector hits.
- `ATAIL-PAIR-SECOND-CENTER-METRIC-CARD-EQ-12`: TRUSTED EXACT-CAS DONE-NEGATIVE for
  those two saved shadows. Singular and two msolve variable orders return
  `UNIT` for both 36-equality ideals; bounded deletion retains cross-checked
  6-row/18-equality and 7-row/21-equality unit subsets. This excludes the two
  normalized real shadows, but the original oracle is nonexhaustive and not a
  Lean theorem.
- `ATAIL-FIVE-ROW-METRIC-CORE`: CHECKED-SCRATCH, kernel consumer complete.
  An independently replayed rational identity proves one five-row CEGAR core
  inconsistent, and `scratch/atail-force/five_row_metric_core.lean` now gives
  a compact structural proof: eleven equal-distance equations force the two
  distinguished points to coincide. It exposes both
  `false_of_five_selectedFourClasses` and `FiveRowCollisionCore`; all printed
  axiom sets are exactly `propext`, `Classical.choice`, and `Quot.sound`.
  This closes the consumer, not the incidence producer.
- `ATAIL-PAIR-SECOND-CENTER-METRIC-CEGAR-CARD-EQ-12`: BOUNDED DONE-NEGATIVE at the two
  fixed placements. A hash-bound 64-round resume per profile saves and fully
  replays 128 `CROSSCHECKED_UNIT` full ideals and 128 cross-checked monotone
  cuts. Both profiles stop at `STOPPED_ROUND_BUDGET`, not exhaustion; no
  nonunit candidate appears. One repeated `(5,5,5)` five-row type reuses the
  existing `SixPointCircleChainCollisionCore`, but no learned cut is wholly
  sourced by the five supplied live rows.
- `ATAIL-COMMON-SYSTEM-METRIC-CEGAR-CARD-EQ-12`: BOUNDED STRUCTURAL CHECKPOINT, not a
  producer proof. A closer finite shadow chooses the five supplied rows and
  one exact source-indexed row for every point of one common system, with
  same-center coupling and Q-C negation but without a global row at every
  center. After integrating the subsuming arc-overtake and five-row
  circle-intersection matchers, the clean replay accepts 6 cuts for `(4,5,6)`
  and 21 for `(5,5,5)`. The archived
  pre-integration checkpoint is preserved at SHA-256
  `fcb0b93588ad95dac43aa2a1bf1364d5f7a3a24cc5cb5f15739c8541cd11ca09`;
  the current checkpoint is
  `1c8c943281998453a17b6063bff59efa19cff4363343b08f9ffe49bb64f873d0`.
  The bank used by this replay is `ExactOffCircleCore`, `NestedEqualChordCore`,
  `MECStraddlingRowCore`, `SixPointTwoCircleOrderCore`,
  `SixPointNestedCenterOrderCore`, `SixPointCircleChainOrderCore`, the
  checked-scratch `SixPointCircleChainWrapOrderCore`, and the checked-scratch
  `SevenPointSplitBridgeOrderCore`, together with the production
  `SixPointTwoCircleArcOvertakeOrderCore` and
  `FiveRowCircleIntersectionOrderCore`. The historical `(4,5,6)` round-5
  shadow has an exact relaxed
  `Q(sqrt(3),sqrt(K))` certificate, but actual MEC/nonobtuse/order data closes
  it; replay now stops at an honest round-6 four-row survivor. The `(5,5,5)`
  replay uses the new three-row cut at rounds 10--15, then exact-off-circle
  cuts at 16--17, a nested-equal-chord cut at round 18, and the new five-row
  consumer at rounds 19--20. Its first uncovered survivor is round 21, digest
  `2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec`,
  with rows `0:{1,2,3,4}`, `1:{0,2,6,7}`, `2:{3,8,9,10}`,
  `3:{1,5,6,8}`, `4:{1,2,9,11}`. The oracle verdicts are
  `[NONUNIT,NONUNIT,NONUNIT]`, so the run stops fail-closed rather than
  promoting realizability or impossibility. The `(4,5,6)` final ideal remains
  `CROSSCHECKED_NONUNIT`; real feasibility is undecided in both profiles.
- `ATAIL-MEC-STRADDLING-ROW-CORE`: PROVEN and target-built. For the saved
  `(4,5,6)` residual take `o=0,a=1,p=2,s=3,x=10,y=7`. Three inherited rows
  give `oa=ap=os=sx=sy`; the Moser circumdisk contains `x,y`, the angle at
  `a` is nonobtuse, and four cyclic orientations place `x,y` on opposite sides
  of the `o-s` ray. `false_of_core` and its reflected consumer close with core
  axioms only. This is a metric/MEC consumer, not universal row production.
- `ATAIL-SIX-POINT-TWO-CIRCLE-CORE`: PROVEN and target-built. The production
  theorem bank maps the `(5,5,5)` residual to
  `A=0,P=9,Q=11,B=1,D=3,C=2` in cyclic order and proves that
  `AB=AC=AD=BC`, `CD=CP`, and `DA=DQ` are impossible. Its generic
  `EdgeClosure` consumers handle both orientations with core axioms only. No
  exact-row exclusion or other six labels are used.
- `ATAIL-SIX-POINT-NESTED-CENTER-CORE`: PROVEN and target-built. On the
  `(5,5,5)` round-14 shadow, the map
  `(O,A,D,E,X,C)=(0,1,3,4,5,2)` uses four rows and five cyclic signs to force
  a normalized determinant contradiction. Its production metric theorem,
  `EdgeClosure` core, reflected consumer, and actual GeneralCarrier adapter
  have only the standard core axioms. The matcher closes rounds 14--16.
- `ATAIL-SIX-POINT-CIRCLE-CHAIN-ORDER-CORE`: PROVEN and target-built. On
  `(5,5,5)` round 17, the map `(O,A,D,E,C,Y)=(0,1,3,4,2,8)` uses all five
  rows, eight closure equalities, and the four signs `OAC,OAE,OAD,CYO`.
  Production and reflected consumers plus the actual GeneralCarrier adapter
  are kernel-clean. The matcher closes round 17 and exposes round 18.
- `ATAIL-SIX-POINT-CIRCLE-CHAIN-WRAP-ORDER-CORE`: CHECKED-SCRATCH and PROVEN.
  The same eight circle-chain closures are impossible in cyclic order
  `O,Y,A,D,E,C`, using signs `OAC,OAE,OAD,OYA`. The generic metric theorem,
  positive/reflected consumers, and arbitrary-carrier adapter elaborate
  without warnings; every audited endpoint has exactly the standard core
  axiom set and no `sorryAx`. The monotone matcher closes both rounds 18 and
  19. This is a bounded metric consumer, not the uniform live producer.
- `ATAIL-SEVEN-POINT-SPLIT-BRIDGE-ORDER-CORE`: CHECKED-SCRATCH and PROVEN.
  The round-20 graph splits the former shared circle-chain point into bridges
  `U,W`. The generic theorem consumes nine closure equalities and signs
  `OAC,OAD,OAE,OEC`; its reflected `EdgeClosure` consumer and actual
  GeneralCarrier adapter elaborate with exactly the standard core axioms.
  Independent source and antecedent audit is `CERTIFIED / PASS`. The matcher
  closes rounds 20--22 with one spine and `W=8,9,10`. Equality-only Gram
  certificates cannot replace the order argument: all five equality rows have
  an explicit positive-norm realization in the wrong cyclic order. This is a
  bounded metric consumer, not the live row producer.
- `ATAIL-SIX-POINT-ARC-OVERTAKE-ORDER-CORE`: PROVEN and production target
  built.
  The three-row pattern uses
  `(O,A,C,D,E,F)=(0,1,2,3,4,5)`, the closures
  `OA=OC=AC=OD=OE` and `DA=DE=DF`, and cyclic order
  `O,A,D,E,F,C`. The generic metric theorem, positive/reflected
  `EdgeClosure` consumers now live in
  `Census554/SixPointTwoCircleArcOvertakeOrderCore.lean`; the round-independent
  `Census554/SixPointTwoCircleArcOvertakeCarrierBridge.lean` exposes
  `ThreeRowSupportData.toCore` and the arbitrary-carrier contradiction. Both
  modules kernel-check with exactly `propext`, `Classical.choice`, and
  `Quot.sound`. The archived replay
  shows exact forward coverage of old rounds 10--28 and no hit on rounds 0--9;
  after monotone integration it supplies six three-row cuts at new rounds
  10--15. This compresses a walking-label suffix into one theorem family; it
  does not prove live row production.
- `ATAIL-FIVE-ROW-CIRCLE-INTERSECTION-ORDER-CORE`: PROVEN and production
  target built. The five selected rows and cyclic spine `O,A,D,E,C` imply an
  order contradiction in both orientations; the proof uses no exact-row, MEC,
  nonobtuse, or disk hypothesis. The scalar inequality, geometry bridge, and
  generic order core now live in three production modules, and
  `GeneralCarrierBridge` consumes both orientations with exactly the standard
  core axioms. The production structural oracle has 23 families, 22 eligible
  for raw-cube matching, and 26 detector stages. On the 46-shard
  `CARD-EQ-12` frontier, the family invalidates 12 saved first survivors but
  closes no shard: a one-million-node retry finds the sole delayed survivor at
  108,537 nodes. The trusted exact equality oracle excludes 45/46 final
  survivors; shard index 19 remains fail-closed because Singular times out
  while both msolve orders return `UNIT`. This banks an order consumer, not the
  Stage-I incidence producer.
- `ATAIL-LIVE-ARC-OVERTAKE-PRODUCER`: CHECKED-SCRATCH interface, forcing lemma
  open. `live_arc_overtake_producer.lean` works on the existing five-row pair
  surface. It preserves the dangerous row at `p`, one critical row selected
  for source `p`, and the supplied `u` row in one faithful carrier pattern,
  then calls the arc-overtake adapter. The minimal packet chooses a dangerous
  permutation `{A,C,D,E}={q,t1,t2,t3}` with the `u` row centered at `D` and
  containing `A,E`, a critical `p`-source row centered at `A` and containing
  `C`, and cyclic order `p,A,D,E,u,C`. Both the minimal theorem and the
  stronger common-system fiber-collision corollary have only the standard
  core axioms. The former round-19 shadow avoided the packet exactly by letting
  the `u` row meet the dangerous base in only one point. The remaining live
  theorem is therefore an MEC/cap/full-filter/no-M44 forcing lemma for the
  aligned second dangerous hit or an immediately consumed alternate; more
  blind rounds are not the proof strategy.
- `ATAIL-STAGE1-ALIGNED-INCIDENCE`: CHECKED-SCRATCH boundary; live forcing
  open, incidence-only route DONE-NEGATIVE.  The structure
  `LiveArcOvertakeStageOneFields` is exactly the live packet with cyclic order
  removed.  It implies
  `card (uRow.support ∩ {q,t1,t2,t3}) = 2` and reconstructs the final packet
  once order is supplied.  A separate kernel-checked `Fin 12` common-system
  incidence shadow preserves support-card-four, source membership,
  same-center support rigidity, pairwise intersection at most two, the
  p-critical A/C alignment, and the u-center D alignment, but has exactly one
  dangerous u-row hit.  Therefore common provenance and current incidence
  consequences alone cannot prove Stage I; omitted metric/MEC/cap/no-`M44`
  geometry or a named alternate is load-bearing.  Assessment:
  `scratch/atail-force/stage1_aligned_incidence_assessment_2026-07-13.md`.
- `ATAIL-STAGE1-PRESCRIBED-APEX-DELETION`: CHECKED-SCRATCH under Adam's
  authorized parallel closure research.  At most one source in a three-point
  off-surplus apex marginal can be deletion-blocked at the other apex, so two
  sources survive.  Their double deletion either survives or yields two
  disjoint exact shells, forcing `|oppCap2| >= 6` and `|A| >= 12`; at card 12
  the shell profile is oriented `(5,4,6)` (AHEAD-labeled `(5,6,4)`), which the
  historical `654_all` run did not cover.  The robust arm flips to a fresh
  survivor pair, while the generic MUS module extracts pairwise-disjoint
  shells from a blocked minimal deletion core.  Both Lean files are
  kernel-checked with only the standard core axioms.  An exact `(5,5,5)`
  finite shadow forces a two-cycle, proving that immediate freshness is not a
  monotone: the missing positive field is survival at both apices on the same
  cumulatively erased carrier, or an immediately consumed cap/order/critical-
  row alternate.  Assessment and validation:
  `scratch/atail-force/stage1_prescribed_apex_deletion_assessment_2026-07-14.md`
  and `scratch/atail-force/stage1_scratch_validation_2026-07-14.md`.
  The next formal lemma is now smaller: failure of same-radius double deletion
  forces a unique apex K4 radius class of cardinality four or five.  This
  classifier is specified in
  `scratch/atail-force/stage1_biapex_survival_bank_assessment_2026-07-14.md`.
  It reduces the geometric branch to two crossed small apex rows.  Broad
  selected-four CEGAR is not being resumed: equality/incidence relaxations
  already have witnesses and the existing cuts lack an extraction map.  The
  only authorized follow-up is the SAT-first crossed-row experiment in
  `scratch/atail-force/crossed_apex_small_row_cegar_spec_2026-07-14.md`;
  MARCO-style multi-core enumeration was gated on repeatable Tier-A UNSAT.
  Tier A instead stopped immediately with an exact `Q(sqrt(3))` strict-convex
  eight-point witness: two unique five-point apex rows realize the crossed
  packet.  The 192-case outer manifest and three drift tests pass, but no
  solver sweep is warranted.  The next positive field is a cross-row or
  critical-row center `z != oppApex1` with `dist z q = dist z w`, plus the
  cap-side placement required by `bisectorCapKernel`.
- `ATAIL-CARD-EQ-12-NEXT-SURVIVORS`: OPEN, bounded honestly. The `(4,5,6)`
  round-6 survivor has digest `268f0efa...ba89f9`; a tempting equilateral
  five-point core has no embedding in the actual hull order, so its scratch
  theorem was deleted. The five-row circle-intersection consumer closes the
  former rounds 19 and 20. The `(5,5,5)` replay now reaches round 21, digest
  `2854f002...fb82ec`, with rows ending in `3:{1,5,6,8}` and
  `4:{1,2,9,11}`. Its equality oracle is fail-closed
  `[NONUNIT,NONUNIT,NONUNIT]`; no existing formalized matcher claims it and
  real feasibility remains undecided. The former round-19 survivor remains
  the finite-shadow witness that isolated the missing aligned second-hit
  field, but it is no longer the live common-system replay frontier. On the
  broader 46-shard formalized-core frontier, production integration of the
  same theorem invalidates 12 saved first survivors but leaves all 46 shards
  `SAT_FINITE_SHADOW_ONLY`; the exact equality oracle is now 45/46 negative
  with shard index 19 fail-closed.
- `ATAIL-NESTED-GLOBAL-PAIR-PRODUCER`: OPEN-PROOF with a checked exact
  interface. `orderedBlockerRow` proves that every critical blocker row can be
  enumerated automatically as `o,a,b,c,d` in boundary order. Nested-chord
  closure then needs only `o,d ∈ rowPattern F a` and
  `o,c ∈ rowPattern F b` for one such row. `HasGlobalNestedPairProducer`
  packages these four global-row memberships and
  `false_of_hasGlobalNestedPairProducer` closes with core axioms only. No extra
  critical sources or blocker-center alignment fields are required.
- `ATAIL-456-ONE-GLOBAL-ROW`: DONE-NEGATIVE within the fixed finite frame.
  Exhaustive locally admissible support enumeration at each missing center
  4--11 leaves 128--176 candidates after every current kernel-backed core;
  every center has a proper exact equality-ideal survivor in both msolve
  orders. Thus restoring all-center K4 one row at a time is too weak. The next
  bounded layer must couple the two global rows in
  `GlobalNestedPairFields`, impose MEC, or use stronger live data.
- `ATAIL-456-NESTED-PAIR-CENSUS`: DONE-NEGATIVE for the saved placement.
  Exact candidate enumeration finds no `GlobalNestedPairFields` witness for
  any of the twelve critical sources. Three blocker patterns conflict with
  locked exact rows; the only unlocked pattern has 15 center-7 candidates,
  all killed by existing `DuplicateCenterCore` or `ExactOffCircleCore`
  instances. Thus global K4 incidence alone does not force this producer on
  the saved placement; MEC/cap/full-filter geometry must exclude or alter it.
- `ATAIL-CARD-EQ-12-PLACEMENT-SURFACE`: EXACT at the placement layer only. Independent
  re-enumeration gives 936,726 raw named placements and 367,206 verified
  automorphism representatives across `(4,5,6)` and `(5,5,5)`. No row-system,
  metric, target-faithfulness, or producer claim is made. This scale rejects a
  naive per-representative CAS sweep as the closure plan.
- `ATAIL-FORCE`: OPEN-RESEARCH and load-bearing for `K-A-PAIR`.

Threshold decision: keep the genuine ATAIL target at `CARD-GE-12`. No current
result proves that a larger threshold is necessary. The `CARD-EQ-12` external
`(4,5,6)` certificate falsifies only a relaxed, non-target-faithful row
abstraction and identifies live MEC/global-K4 fields which reject it. Moving
the threshold above `CARD-GE-12` would create an AHEAD obligation for the
`CARD-EQ-{12,13,14}` head and would not discharge the independently open
card-11 slice.

`CARD-GE-12` means a tail theorem assuming `12 ≤ D.A.card`, not a theorem
only for the exact value `D.A.card = 12`. The two `CARD-EQ-12` profile
consumers do not by themselves supply the selection/monotonicity argument for
cards 13 and above. That uniform lift remains part of ATAIL-FORCE; it is not
evidence that the threshold must be raised.

At this checkpoint, session `019f5a3d` is durably anchored directly at
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`;
LIVE-T1 is source-closed and needs no further branch work.  Its public
declarations inherit `sorryAx` only through K-A-PAIR. Anchor state is maintained with
`proof-blueprint anchor`, not by editing generated `docs/live-blueprint.md`.
The T1 and T3 relabel adapters are now production-wired through all 24 helpers.
Both reduce their orbit to this
shared-radius K-A-PAIR residual, which is reachable from the umbrella through
`false_of_center_p_t2_t20`. Neither adapter proves K-A-PAIR or introduces a
new direct `sorry`.

## Current execution plan

This lane is not waiting for a predetermined number of census rounds.  Its
closure sequence is:

1. **DONE:** prove and kernel-audit the reusable arc-overtake metric/order
   consumer and arbitrary-carrier adapter;
2. **DONE:** integrate its monotone matcher, replay from the frozen manifest,
   and inspect the first avoiding survivor rather than continuing the old
   suffix one `sorry` at a time;
3. **DONE:** state and kernel-check the minimal conditional producer on the
   existing live five-row surface (`LiveArcOvertakeFields` and
   `false_of_liveArcOvertakeFields`);
4. **CURRENT / OPEN-PROOF, STAGE I:** work at the parent boundary with the
   concrete `Hcritical`, the actual MEC-derived surplus packet, and all
   source-indexed rows.  Provenance is already present; do not schedule a
   provenance-restoration theorem.  Also do not try to prove unconditional
   `URowCommonCapOffDangerousConfinement`: its extracted incidence/counting
   surface has a checked counterexample.  The content theorem must instead
   classify a survivor pair into the checked critical-pair consumers below,
   using a field absent from the countermodels: MEC/cap order, a full exact
   filter, or an actual cross-source critical-row incidence.  The target is a
   parent-level `False` theorem, so it can be called before the LIVE-Q/C case
   split and retire that split after closure;
5. **ROUND-19 ALTERNATE DONE; UNIFORM STAGE II OPEN:** from that packet and
   the actual MEC/cap order, prove the arc-overtake cyclic order or a named
   order-failure alternate.  The round-19 alternate is now kernel-checked in
   both orientations: its five row equalities and six cyclic signs imply the
   scalar contradiction without any MEC, nonobtuse, or disk hypothesis.  Its
   label-generic core, GeneralCarrier adapter, deterministic matcher, and
   replay registration are now checked; and
6. **PENDING OWNED INTEGRATION:** combine the robust and unique-row branches
   into the parent `False` theorem, call it before slot enumeration, and
   remove the residual/helper chain after reference mining. Then refresh the
   serialized target build and proof-blueprint spine.

The current direct source surface is 12 declarations / 32 textual holes: one
K-A-PAIR hole plus four LIVE-Q helpers with 24 holes and seven one-hole LIVE-C
contracts. All LIVE-T1/T3 helpers are source-sorry-free but transitively
depend on K-A-PAIR. The preferred parent theorem makes the Q/C case tree
unreachable; after reference mining, delete that tree instead of adjudicating
its 31 holes individually. Thus closure proceeds by one parent producer and
dead-code removal; it does not adjudicate the remaining direct liveData
holes independently.

The Q/C audit also has an exact boundary.  LIVE-Q normalizes all four helpers
to one slot-invariant packet but supplies no distinct aligned row center.
Every LIVE-C branch does supply two distinct `f2` support points outside the
dangerous base, and the fixed dangerous `p`-circle can feed the same-cap sink
without an artificial `t2Row.center = p` adapter.  The missing incidence is
opposite to the proved one: the sink needs two dangerous-base points of the
second-center row outside a common cap.  The special `center_t2_named` branch
also supplies the equilateral-star prefix of the five-row consumer, but first
lacks a dangerous-centered cross-row edge.  No complete Q orbit or C helper
is closed by the current fields.

The two Stage-I escape packets have also been geometrically normalized.
`stage1_separated_cap_geometry_boundary.lean` proves that a separated pair is
either two strict-interior centers in distinct caps or an opposite-Moser
endpoint packet. The endpoint packet now retains a cap-cardinality-free pair
of distinct facing-cap interior points and the entire exact four-point radius
filter. Both outer Moser endpoints have unequal distances to that pair, so the
former short/large-cap split is superseded and no large-cap escape remains.
The open ALIGN cases are therefore the distinct-interior packet and the
endpoint exact-filter interior-pair packet.
`stage1_separated_pair_classifier_boundary.lean` proves exact
full-shell equality, uniqueness of the `uRow` center as the common-cap
bisector point, and the retained global block order.  Its smallest named
consumed alternate needs two additional carrier centers on the same
perpendicular bisector; current data does not produce even the first one.
`stage1_bisector_producer_boundary.lean` now specializes that requirement to
the actual global critical-shell system. For an escaped pair `z,w`, the
diagonal source incidences are automatic, so the only missing row memberships
are `w ∈ H.row(z)` and `z ∈ H.row(w)`, together with pairwise distinctness
of `uRow.center`, `H.centerAt(z)`, and `H.centerAt(w)`. A one-call checked
adapter turns exactly that producer into confinement and hence the existing
same-cap sink. Any genuinely new bisector center is forced outside the common
cap. Reciprocal incidence without the three inequalities is also classified:
Dumitrescu forces one of the three center collisions, and exact critical-row
rigidity upgrades it to equality of the corresponding complete supports.
Thus a center-collision branch is now a named support-collapse alternate, not
an unexamined failure of the direct sink. Assessment:
`scratch/atail-force/stage1_bisector_producer_assessment_2026-07-13.md`.

The theorem-bank audit gives a still smaller uniform metric sink for either
sharp separated-cap arm.  With `c := rows.uRow.center`, `hfixed` and `p != c`,
the two equalities

```text
dist c q = dist c t1
dist c q = dist c t3
```

force `p = c` by `eq_of_equidistant_three_noncollinear`.  The durable source
`stage1_three_dangerous_equidistant_sink.lean` packages both this preferred
`q,t1,t3` form and the symmetric `t1,t2,t3` form, plus exact-shell membership
specializations.  This is a consumer reduction, not an equality producer.
Full common-`CriticalShellSystem` provenance restores diagonal membership,
no-q-free data, and conditional same-center support equality, but neither
displayed equality nor either reciprocal endpoint incidence.

That negative boundary now has an exact Euclidean regression witness.
`stage1_dangerous_equality_euclidean_countermodel_2026-07-14.py` specializes
the pinned 33-point construction to a global-K4, deletion-minimal, common
critical-system surface with exact dangerous and `u` rows.  The squared
distances from the `u`-row center to `q,t1,t2,t3` are respectively
`36,34,32,26`, so both requested equalities fail.  The checker passes with
exact integer arithmetic.  Its carrier is non-convex and supplies no live
MEC/Moser/cap/no-M44 packet, so it is not a K-A-PAIR counterexample; it proves
that the next theorem must visibly use that coupled geometric layer rather
than another generic global-K4, blocker, full-filter, or provenance lemma.

The complementary local endpoint witness is exact and strictly convex: seven
rational points realize the endpoint shell, the circumscribed MEC disk, a
six-point facing cap, and both outer-distance inequalities.  It omits the
global K4/common-critical-system layer.  Together the two witnesses isolate
the interaction between the convex MEC/cap geometry and the common critical
system as load-bearing; neither half of that interaction suffices alone.

The cap-local critical-map refinement has also reached its exact counting
limit.  For sources in one indexed cap, a blocker center inside the cap has
fiber at most two and an outside blocker center has fiber at most four, giving

```text
|cap sources| <= 2 * |inside blocker image|
                 + 4 * |outside blocker image|.
```

If there is at most one inside blocker center this yields
`|cap| <= 2 + 4 * |A \ cap|`.  At card 12 and cap sizes 4, 5, 6 the right-hand
capacities are 34, 30, 26, so the strengthened count is far from forcing a
second center.  The finite-shadow replay and all ten mutation/checkpoint tests
pass, including an example attaining inside-fiber size two.  This is exact
only within the encoded abstraction and supplies no reason to raise the lane
above `CARD-GE-12`; the missing ingredient is pair-specific metric/order
coupling.

The first-field audit makes that coupling target precise.  On the
distinct-interior arm, `dist c q = dist c t1` is exactly the assertion that
`c := rows.uRow.center` lies on the perpendicular bisector of `q,t1`; the
available cap-order lemmas supply neither half-plane sign, and the closest
ordered-cap theorem would prove a strict inequality rather than the required
boundary equality.  On the opposite-endpoint arm, localizing `t2` or `u` to
the facing interior would produce a literal selected-row incidence, but only
at the already-known endpoint blocker center, so it cannot feed the checked
three-center sink.  The first useful endpoint field is therefore

```text
y ∈ (H.selectedAt x hxA).toCriticalFourShell.support
H.centerAt x hxA ≠ c0
```

for an endpoint-interior source `x`, where `c0` is the already-known endpoint
center.  The symmetric incidence and the second distinct center remain
downstream.  Short-cap branches already yield `c in B` or `p in R`, but no
current contradiction consumer accepts either one-field output.  No banked
or live theorem couples the chosen critical map to cap order strongly enough
to produce the displayed field.  Full assessment:
`scratch/atail-force/stage1_coupled_geometry_first_field_assessment_2026-07-14.md`.

The two stronger short-cap incidences do not bypass this boundary.  The bare
outputs `c ∈ B` and `p ∈ R` match no checked consumer, and a finite
common-incidence shadow realizes both simultaneously with `R ∩ B = ∅`.
However, the short selector does canonically produce a different cross-cap
pair in both non-surplus orientations: two distinct points off the surplus
cap, already co-radial at one opposite apex.  Its sole remaining field is
equality of their distances to the other opposite apex.  This is a genuinely
smaller, witness-fixed producer target, but not an easier geometric lemma:
the checked joint-fiber injectivity theorem already proves the negation of
that equality.  It must come from the live dangerous/`u`-row coupling and
immediately closes the branch.  The specialization does not cover a
large-facing-cap branch.  Assessments:
`scratch/atail-force/stage1_short_cap_output_consumer_assessment_2026-07-14.md`
and
`scratch/atail-force/stage1_one_apex_cross_cap_bank_audit_2026-07-14.md`.

The uniform K-A-PAIR target now has an exact functional producer interface.
For a checked first-apex K4 radius `r`, put

```text
T_r := (D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap.
```

The current tree proves `3 ≤ |T_r|` and injectivity of
`x ↦ dist x S.oppApex2` on `T_r`.  A closure-sufficient new field is

```text
ApexAlignedTwoHit(P,S,r) :=
  ∃ source,
    P.system.centerAt source = S.oppApex2 ∧
    2 ≤ |T_r ∩ support(P.system.selectedAt source)|.
```

Two points in that intersection instantiate the forbidden double-apex fiber
immediately.  The first absent atomic coupling is already the weaker
`OppApex2InBlockerImage`: no current theorem identifies any chosen critical
blocker center with `S.oppApex2`.  Common provenance gives source incidence
and equal-center support rigidity only after a center has been chosen; cap
regions, independent apex marginals, and blocker-center partitions do not
produce the alignment or the two hits.  Full functional audit:
`scratch/atail-force/apex_filters/joint_fiber_functional_producer_assessment_2026-07-14.md`.

Focused direct-file checks now pass for the newly added unimported sink, the
full repaired critical-map module, and the short-output incidence
countermodel plus its scratch dependency.  Every printed endpoint has only
standard core axioms; the dependency olean was emitted under `/tmp`, not into
the repository.  Exact commands, hashes, and axiom closures:
`scratch/atail-force/stage1_scratch_validation_2026-07-14.md`.

For `center_t2_named`, the exact next producer is a cross-source blocker row
centered at a dangerous `D != t2` and containing `t2`; existing comparison
maps force center `t2` and merely reproduce the already-used row.

Validation note: the auxiliary saved `(4,5,6)` exact-witness replay currently
fails closed because its report/source SHA pins have drifted.  It is treated
as stale discovery evidence until its artifact owner refreshes the gate.  No
kernel theorem or closure claim above depends on that replay.

The former round-19 `(5,5,5)` shadow identified the first Stage-I failure: its
supplied `u`-row has exactly one dangerous-base hit.  The exact forcing audit
also shows that the lower bound `2 <= |uRow.support ∩ B|` alone would not
close: blocker-center alignment and a second point in the `p`-critical row are
independent fields.  An exact nine-point strictly convex model realizes all
three aligned local rows in a non-overtaking order, proving that Stage II is
not routine convex-order bookkeeping.  Additional CEGAR rounds may test
candidate alternatives, but they are not a gate on either proof stage.  Full
audit: `scratch/atail-force/second_dangerous_hit_forcing_analysis.md`.

The Stage-II round-19 alternate is no longer conjectural.
`residual_555_round19_mec_scalar_core.lean` proves the three lower
circle-intersection margins incompatible and proves the uniform numerical
bound `tau < -4/25`, using only `sin t <= t` and `pi < 3.15`.  All five
audited scalar endpoints have exactly the standard core axioms.
`residual_555_round19_mec_geometry_lift.lean` completes the geometric lift in
both orientation conventions.  It derives the ordered minor-arc angles, four
chord identities, and three reverse-triangle lower margins directly from the
five row equalities and cyclic signs; the public endpoints again audit to only
`propext`, `Classical.choice`, and `Quot.sound`.
`residual_555_round19_five_row_order_core.lean` and
`residual_555_round19_general_carrier_adapter.lean` package that result as a
label-generic equality-closure core and convex-carrier consumer.  The
monotone matcher is registered and deterministically closes rounds 19 and 20.
No work remains on this alternate; it is a banked consumer, not the still-open
live Stage-I row producer.

## Exact on-spine consumer

Let

```text
S := leafSurplusPacket (D := D) (MT := MT) (hCirc := hCirc)
       (CP := CP) (i := i) (hM := hM) (hsurplus := hsurplus).
```

The existing theorem
`DoubleApexOffSurplusSharedRadiusPair` must produce two distinct points of
`D.A`, both outside `S.surplusCap`, at common radii from both
`S.oppApex1` and `S.oppApex2`. The downstream theorem
`U2NonSurplusSqueeze.oppCap2_escape_gen` is already proved and immediately
turns such a pair into `False` by the two-circle reflection/sign argument.
The missing work is therefore a producer, not another geometric sink.

An older, still-valid alternate producer target is the following
selection-robust cardinality statement (pseudocode, not yet a Lean
declaration):

```lean
∃ r ρ : ℝ,
  2 ≤ (((D.A.filter (fun x => dist x S.oppApex1 = r)) ∩
          (D.A.filter (fun x => dist x S.oppApex2 = ρ))) \
        S.surplusCap).card
```

This is exactly strong enough. A two-element extraction supplies `x`, `w'`,
membership, distinctness, both off-surplus facts, and the four radius
equalities consumed by `oppCap2_escape_gen`. It is also honest about the
mathematical crux: the overlap must be forced for full exact-radius filters,
not for one arbitrarily truncated selected-four support.

The sink has now been repackaged in the exact finite-set vocabulary in
`scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean`. The checked
theorem `doubleApexJointFiber_sdiff_surplus_card_le_one` proves that every such
fixed joint fiber has cardinality at most one. The same module proves that K4
still supplies, separately at each opposite apex, a radius with at least three
carrier points outside the surplus cap and at least two in the strict interior
of its own opposite cap. On each three-point marginal, distance to the other
apex is injective. Thus the target lower bound is not a pigeonhole consequence
of the two marginal K4 classes: it must use a hypothesis that correlates the
two apex partitions. The complete theorem, axiom, applicability, and
circularity audit is
`docs/audits/2026-07-13-atail-apex-filter-assessment.md`.

## What ATAIL-Q3 decided

The historical Q3 sweep in `census/q3_two_center/` is complete:

- 87 mirror-reduced joint classes;
- 68 exact rational realizations;
- 4 exact realizations over `Q(sqrt(3))`;
- 15 classes reported killed by K-Q3-1/K-Q3-5; and
- zero unclassified classes.

Applying the Q3 joint kills simultaneously to all three Moser pairs leaves a
stored SAT assignment for every unordered cap profile at each card 12--16:
22 profiles under the base proved cuts and the same 22 after the SUB2 cuts.
This is an exact statement about the finite token model, not a real
configuration counterexample.

The permanent checkpoint is:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run --with sympy python -m census.q3_two_center.checkpoint --check
```

It exact-replays all 72 realized windows, rejects a radius mutation in every
case, validates all 44 stored profile/tier assignments against C1/C2/C4/H1,
the per-type cuts, and both Q3 joint kills, pins every input digest, and runs
the repaired falsifier gate. The falsifier gate covers 9 banked configurations
and 396 nonobtuse boundary triangles with no hit; that gate is explicitly
guard-banded floating evidence. The checkpoint does not independently replay
the 15 hand/Z3 kill proofs.

Consequently, a single selected-four `{V,W}` window is terminal as a closure
mechanism. Re-running or enlarging that same class menu is not ATAIL-FORCE.

## First three-center successor checkpoint

`census/atail_force/` now restores the first piece of information omitted by
Q3: the selected-four classes at all three Moser vertices use the same support
points and must fit one global convex order. The permanent preflight:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run --with sympy python -m census.atail_force.checkpoint --check
```

independently parses and replays every row in the pinned 3,375-class
L2/full-participant inventory. It checks the three selected-four counts,
own-center exclusion, H1, pairwise overlap, the mask-7 consequence of C4, and
both proved Q3 joint kills for all three Moser pairs. It then restores all
membership-distinct permutations inside the three cap blocks. The exact count
is 167,782 global-order systems, with 6--12 interior support points, 19--31
variables, exactly 14 equalities, 9--15 weak inequalities, and 106--495 strict
inequalities. The largest single class has 1,728 order decorations.

`three_center_surface.py` constructs the exact rational polynomial generators,
including the common MEC frame, all three class radii, disk/nonobtuse/cap-sign
constraints, and every cyclic triple in the single order. It also exposes the
pairwise-distinctness and triangle-area separators needed by a future
equality-ideal engine. The checkpoint pins the source inventory and generator
digests and materializes representative systems as a construction gate.

No solver was invoked, no geometric row was classified, and no Lean
leaf-to-inventory extraction was proved. In particular, the checkpoint does
not upgrade representative-surface completeness into geometric coverage and
does not force the full-filter overlap. Its status is
`PREFLIGHT_COMPLETE_NO_SOLVER_RUN`, while ATAIL-FORCE remains OPEN-RESEARCH.

The exact finite reduction is also complete at the combinatorial boundary.
All six simultaneous Moser-vertex/center relabelings act on the inventory and
the cyclic decorations. The 3,375 classes form 590 S3 orbits; keeping every
order of one representative leaves 30,997 cases. Independently, cap/order
forgetting leaves 343 distinct 14-equation skeletons, or 70 S3 orbits. All
20,250 class/permutation edges and canonical-order inverse round trips are
checked. This does not classify any system. The fixed-gauge
similarity/reflection transfer is mathematically standard and documented in
the Q3 formulation, but the checkpoint honestly records that it has no
independent algebraic transfer certificate yet.

The bare 14-equation layer is already a proved negative terminal, without a
solver. Put the Moser triangle at unit equilateral coordinates, set all three
class radii to one, and place each interior support point at a Moser vertex
omitted by its membership mask. K-Q3-5 leaves no mask 7, so such a vertex
always exists. The checkpoint exact-replays this `Q(sqrt(3))` substitution for
all 343 raw equality skeletons and rejects three radius mutations per skeleton
(1,029/1,029). These are intentionally collapsed witnesses: they do not pass
pairwise-distinctness separators or the strict cap/order inequalities. Thus an
unsaturated equality-ideal sweep cannot kill any case and should not be run.

## Existing-theorem-bank audit

The required registry and indexed-corpus searches were run before formulating
the new target.

Reusable results already present include:

- `SelectedFourClass.inter_card_le_two`: selected classes at distinct centers
  overlap in at most two points;
- `eq_of_equidistant_three_noncollinear`: three common noncollinear points
  force the two centers equal;
- `outsidePair_unique_capCenter` and
  `U2NonSurplusSqueeze.oppCap2_escape_gen`: the desired two-point outside pair
  is already contradictory; and
- the Census-554 equality and cyclic-separation cores, which consume an
  already-present shared pair but do not produce one.

The sibling-only theorem
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
is genuinely source-proved. It rules out a particular five-point/seven-
equality pattern, but prior constrained-cube work found that pattern absent in
3,713 of 4,000 cubes. It is another sink unless a completeness theorem forces
its seven equalities.

The sibling declaration
`RVOL.P97.U1LargeCapRouteBTail.DoubleApexOffSurplusSharedRadiusPair` is not an
independent proof: its body is a `simpa` re-export of the inner declaration
that still contains `sorry`. The mining registry's source-proved label on the
wrapper therefore cannot be used as closure evidence.

No searched bank theorem forces the required full-filter overlap from the
current two-large-cap, no-M44, critical-shell, and convexity hypotheses.

## Five-row pair surface versus six-row live surface

The current source interfaces are not interchangeable. The pair theorem takes
`CriticalSourceRows`, whose fields are exactly the five rows sourced at
`q,t1,t2,t3,u`. The liveData theorem additionally takes the sixth row sourced
at `f2 := t2[0]` plus two comparison maps that certify same-critical-system
agreement when `f2` equals one of those five sources. Those three live inputs
are absent from `DoubleApexOffSurplusSharedRadiusPair`.

In particular, `hcritical : Nonempty (CriticalShellSystem D.A)` in the pair
statement does not relate the abstract five supplied rows to a chosen global
system. A new row can be selected from it, but the live comparison maps cannot
be reconstructed. The existing `false_of_center_p_t2_t20` adapter uses the
sixth row and one comparison map first, then calls the narrower pair theorem in
the specialized collapse branch.

Therefore ATAIL has two honest proof surfaces: prove the current five-row pair
theorem from exactly its statement, or consume the six-row inputs directly at
`u1_largeCap_routeB_tail_liveData_false` (possibly widening and immediately
threading the pair interface). The completed three-center census contains
neither the dangerous `p` row nor the sixth `f2` row. Full audit:
`docs/audits/2026-07-13-atail-sixth-row-scope.md`.

The live comparison maps now have a kernel-checked scratch normalization. If
`f2 = rows.sourcePoint source`, equality of the two centers and selected `l1`
points forces equality of the complete exact four-shell supports. The proof is
in `scratch/atail-force/critical_row_coupling.lean` and checks without a
`sorry`. This is useful provenance extraction, but it is not the producer:
different slot permutations of the common support survive in the T1/T3 cells.
The same scratch module also checks the routine implication from a joint
full-filter card lower bound of two to the exact distinct off-surplus pair and
four radius equalities consumed by the existing sink.

A second kernel-checked scratch module,
`scratch/atail-force/triple_relabel_adapters.lean`, shows that those T1/T3 slot
permutations do not require separate geometry. When `f2` equals `t1` or `t3`,
permute the dangerous triple so the transferred row becomes the existing pair
consumer's `t2Row`. The fixed-triple, rows, live data, and base pairwise packet
all transport. The T1 half is now promoted as
`Problem97.U1LargeCapRouteBTailRelabel.false_of_center_p_t1_t20_via_pair` and
wired through all 12 LIVE-T1 helpers, removing their 24 direct holes. The T3
half is now likewise production-wired through all 12 T3 helpers. Both orbit
adapters depend on K-A-PAIR; this does not close K-A-PAIR and does not address
LIVE-Q or LIVE-C.

## Required strengthening beyond Q3

Any viable producer must add information lost by the selected-four Q3
abstraction. At least one of these must become a theorem:

1. **Full-filter coupling.** Choose the K4 radii at both opposite apices but
   retain the entire exact-radius filters. Use cap cardinalities, convex order,
   and the no-M44 alternative to force their off-surplus intersection to card
   at least two.
2. **Order-coupled multi-window forcing.** Couple more than one decorated
   Moser-pair window through shared point identities and one global convex
   order. Independent per-pair Q3 predicates are insufficient; the stored
   token assignments already satisfy all three simultaneously. The
   `census/atail_force/` surface now gives this route a fixed 167,782-case
   decision boundary. A manifest-bound seven-case full-inequality pilot
   classified none of them: all seven reached the 30-second solver timeout.
3. **Critical-row producer.** On the pair surface, use the five `rows`,
   `hcenter`, `hsupport`, and `H` hypotheses. On the live surface, also consume
   `f2CriticalRow` and its same-system comparison maps. Force either the
   full-filter overlap directly or the seven equalities consumed by
   `u1TwoLargeCapObstruction`.
4. **Direct contradiction.** Derive `False` from the same on-spine hypotheses
   without naming the pair, then eliminate into the existing existential.

The first concrete theorem-facing milestone, extraction from the cardinality
target to the exact `DoubleApexOffSurplusSharedRadiusPair` conclusion, is now
kernel-checked in the unimported scratch module. Card 11 remains open on the
live Front-A spine: no `D.A.card = 11 → False` theorem is imported
by the leaf. The helper has no Census dependency, but a proof that starts only
at `CARD-GE-12` would still require A11-CONSUME and leaf wiring. It is not marked
landed until the pair-theorem owner can consume it on-spine without overwriting
concurrent work. The content-bearing milestone remains the lower bound itself.
On the
geometric-decision branch, the symmetry/equality-skeleton reduction is now
done. The bounded separator-saturated exact pilot is now
**DONE-NEGATIVE-TRACTABILITY**: all seven deterministic strata hit their
20-second limit, produced no output, and consumed 141.357 seconds in total.
This gives no emptiness, dimension, or mathematical verdict, and increasing
the same `msolve` budget is rejected.

`ATAIL-DISTINCT-REPLAY` is now complete. The exact checkpoint constructs one
separator-satisfying algebraic witness for every one of the 343 raw equality
skeletons and verifies 4,802 equalities plus 19,978 pairwise-distinctness and
nondegenerate-triangle separators. All coordinates are proved real in all 343
rows. The checkpoint checks no disk, nonobtuse, cap, or global-order inequality
and proves no full configuration, full-filter pair, or Lean claim.

Therefore both the bare and separator-saturated equality-only routes are
**DONE-NEGATIVE**, including over real algebraic coordinates. This is
theorem-discovery evidence, not a counterexample to ATAIL-FORCE or a substitute
for the lower-bound theorem. The next candidate must use real
cap/disk/nonobtuse/global-order inequalities or a direct full-filter or
critical-row producer. No bulk 30,997- or 167,782-case nonlinear run is
authorized.

`ATAIL-INEQ-PILOT` is also complete as a
**DONE-NEGATIVE-TRACTABILITY** diagnostic. Its immutable manifest selected the
same seven representatives, one in each interior-support stratum 6 through 12,
and included every emitted disk, nonobtuse, cap-sign, and global-order
inequality. One sequential Z3 4.16.0 QF_NRA/NLSAT process ran for at most 30
seconds per case and 240 seconds overall. All seven cases returned `TIMEOUT`;
the run consumed 219.901 seconds and produced neither a model nor an UNSAT
proposal. The result is bound to every exact generator digest and gives no
mathematical verdict. Increasing this budget or extending the run to the
30,997- or 167,782-case surfaces is rejected. The useful next step is theorem
extraction from the full-filter/critical-row hypotheses, not a larger blind
nonlinear sweep.

The released Census-554 resources funded one same-budget cross-engine check,
not a larger surface. `ATAIL-CVC5-PILOT` replayed the exact seven frozen system
digests with cvc5 1.3.3 nonlinear coverings, one effective-nice-10 process,
30 seconds per case, and the same 240-second aggregate wall. The nice/smoke
preflights passed; all seven cases reached the exact cvc5 timeout diagnostic in
219.217 seconds, with no SAT or UNSAT status. The immutable raw artifact's
statusless-timeout parser bug is independently normalized by
`cvc5_pilot_checkpoint.py`, which validates every manifest/system/SMT2 digest,
constraint ledger, return code, elapsed bound, and diagnostic and reports 7/7
`TIMEOUT`. This is again no mathematical verdict and closes the blind
cross-engine escalation option at this granularity.

`ATAIL-ORDER-FAN-1` then tested the prescribed smaller-subsystem successor.
For the frozen six-interior-point case, the equality, disk, nonobtuse, and
cap-side base is immediately SAT. Adding only the first seven cyclic-order
inequalities, the edge fan based at `v2 -> s1`, is repeatably Z3-UNSAT.
Conservative deletion reduces that proposal to 15 scalar hypotheses involving
only the Moser frame and three support points. The independent, solver-free
theorem `Problem97.ATAILForceScratch.orderFanKernel` proves that implication
in `scratch/atail-force/order_fan_kernel.lean`: two ordered surplus points
shared with the two adjacent apex classes are incompatible with the indicated
opposite-cap member of the second class.

The exact S3 matcher in `order_fan_coverage.py` finds that hypothesis pattern
in only 39 of the 167,782 selected-four order decorations, across 21 of the
3,375 joint classes. This is exact combinatorial coverage of that decision
surface, not live-leaf inventory coverage and not a full-filter producer.
A five-second bounded replay of the analogous edge fan on the other six frozen
interior-size strata returned `UNKNOWN` throughout; that is no evidence of
realizability or impossibility. The checkpoint validates theorem extraction
from materially smaller order subsystems, but its present reach is far too
narrow to close K-A-PAIR and does not authorize a bulk scan.

The complete bounded m=6 edge-fan diagnostic then checked all seven S3 class
representatives, all 25 representative order decorations, and all nine
oriented edges per decoration: 225 queries at 250 ms each. The order-free
base histogram was 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`; the edge-fan
histogram was 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`. These are solver
diagnostics only. The six base `UNSAT` rows were exactly four decorations of
class 2422 and two of class 2472, and both orbit proposals were independently
reduced and proved instead of being promoted from solver output.

`Problem97.ATAILForceScratch.bisectorCapKernel` proves the eight-hypothesis
class-2472 core: equal-radius equations put two points on the same base
perpendicular bisector, making the two strict cap signs additive inverses.
`Problem97.ATAILForceScratch.twoCircleCapKernel` proves the eleven-hypothesis
class-2422 core: one cap witness forces the Moser apex left of the base
midpoint while the second two-circle/cap witness forces it right. Both proofs
are solver-free and live in `scratch/atail-force/`.

The exact simultaneous-S3 union matcher scans all 167,782 decorations. The
three disjoint cuts reach 39 systems / 21 classes for `orderFanKernel`, 66 / 18
for `bisectorCapKernel`, and 24 / 6 for `twoCircleCapKernel`: 129 systems in 45
classes total, leaving 167,653 systems. This proves useful local theorem-bank
content but also supplies a stopping rule: blind selected-four kernel mining
is no longer the primary lane unless a new forcing theorem makes one of these
patterns unavoidable. The next content-bearing target is the full-filter or
critical-row producer on the actual K-A-PAIR/K-A-LIVE hypothesis surface.

## Retained critical-system provenance and LIVE-C delta

The seven LIVE-C helper contracts were first audited directly against
`CriticalRowPacket.center_ne_source`, K-A-PAIR's actual hypotheses, the bank
registries, and an indexed-corpus search. Center/source equality kills only
subcells where the extra `f2 := t2[0]` source is identified with its blocker
center; none of the seven helper contracts supplies that equality. They also
lack the p-centered exact-dangerous `t2Row` hypotheses required by K-A-PAIR.
This is a negative structural checkpoint, not a proof that no new LIVE-C
producer exists. LIVE-C therefore remains a separate six-row target.

The outer Route-B wrapper does carry more information than those helper
signatures expose: it constructs `rows` and `f2CriticalRow` from the same
`CriticalShellSystem`. The checked scratch packet
`U1Depth5.LiveCriticalRowProvenance` retains the constructor equalities and
recovers every row's deletion-blocker fact. Its support coupling reuses the
existing theorem-bank result
`CriticalShellSystem.selectedFourClass_support_eq_shell`: two system rows with
the same blocker center have the same complete support, without a source
collision or selected-slot equality.

The exact audit in
`scratch/atail-force/provenance_contract_audit.py` pins the current boundary:

- all 35 helpers receive only an unlinked
  `Nonempty (CriticalShellSystem D.A)` and none receives the provenance packet
  or the `f2` deletion-blocker fact;
- the 28 p-centered LIVE-Q/T1/T3 helpers already transfer full support through
  their current comparison maps, so provenance rederives rather than enlarges
  that part of their contracts;
- all 35 would regain `f2Row_no_qfree` from the retained packet;
- six named-center LIVE-C helpers become instances of the statement that every
  selected K4 row at the `f2` blocker center contains the `f2` source and is
  exactly the `f2` critical support; the fresh-center helper has the same
  blocker statement without a packet-label name.

This is not itself a contradiction. It positively realizes the f2-critical
branch of the global-K4 dichotomy: asking for another selected class at the
same center cannot produce a different row. The checked adapter
`f2Row_to_qCriticalTriple` packages `f2Row.support.erase f2` directly as the
existing `U5QCriticalTripleClass`; it exposes the surviving arm in the U5
consumer vocabulary but does not close it. The reusable positive output is
instead the checked theorem
`two_le_f2Row_support_sdiff_dangerousBase`. Since every LIVE-C blocker center
is distinct from `p`, the two-circle intersection bound gives at least two
points in
`f2Row.support \ {q,t1,t2,t3}`. The contract census confirms that this applies
to all seven LIVE-C helpers without widening their current signatures; the
witness form `exists_two_f2Row_support_off_dangerousBase` extracts two distinct
support points explicitly.

The bounded incidence-only follow-up is now **DONE-NEGATIVE, exact within its
stated finite model**. `scratch/atail-force/incidence_delta_census.py` retains
four-point supports, source membership, the actual `f := t2[0]` and
`f5 := t2[1]` placements in the `t2` source row, center/source separation,
equal-center support coupling, all distinct-center two-circle overlap bounds,
the conditional comparison maps, all seven center branches, and the two
special `t2` subbranches. It stores one explicit witness per family. All 7/7
validate as `SAT_INCIDENCE_ONLY`, with zero forced second center collision,
zero support containing `q` plus two dangerous points, and zero five-source
support. The witness digest is
`78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e`.
The witnesses deliberately choose `f` distinct from the five packet sources,
so the live conditional comparison maps are valid vacuously; unlike the first
draft, they correctly place both `f` and `f5` in the `t2` row.

This is not a Euclidean or convex realization and does not model the metric
fields of existing consumers. It terminates only the attempt to force a sink
from the enumerated incidence facts alone. Any next producer must use
additional cap/order/full-filter or metric content.

The next producer must add one of the facts the row census still lacks:

1. prove that those two off-dangerous points are outside the relevant surplus
   cap and co-radial from both opposite Moser apices (either by identifying the
   f2 center with one apex and proving the other radius, or independently),
   which would turn them into the K-A-PAIR witness; or
2. confine the two points to a bounded anchor/support inventory and supply the
   missing class-center equalities needed by a banked U5 incidence consumer; or
3. derive a second, distinct-center full-filter class whose overlap with the
   f2 support is forced beyond the two-circle bound.

The checked artifacts are
`scratch/atail-force/live_critical_provenance.lean` and
`scratch/atail-force/provenance_contract_audit.py`; the bounded negative census
is `scratch/atail-force/incidence_delta_census.py`. They remain off-spine while
the shared Route-B parent producer remains open.  LIVE-T1 is source-closed and
only inherits K-A-PAIR transitively.

## Critical-row finite-shadow metric discriminator

A stronger saved-row follow-up retained one selected four-point row at every
center, pairwise support overlap at most two, a common cyclic order satisfying
every shared-pair separation, and avoidance of all currently formalized metric
cores. It produced one candidate for each of the `(4,5,6)` and `(5,5,5)`
internal `CARD-EQ-12` block-profile labels; `(4,5,6)` is not the closure matrix's
labeled-cap tuple order. These are finite-shadow witnesses, not Euclidean
models, and no profile-orientation bridge is claimed.

`scratch/atail-force/critical_row_metric_discriminator.py` now gives the exact
metric-model computation. Singular returns `UNIT` over `QQ` for an eight-row,
24-equality subsystem of the `(4,5,6)` candidate and a seven-row,
20-equality subsystem of the `(5,5,5)` candidate. Hence both full
36-equality systems are excluded by a trusted exact-arithmetic CAS computation
in the normalized distinct-point gauge. No Nullstellensatz certificate was
independently replayed. The result is exact within this algebraic model for
the two saved candidates but is not an exhaustive critical-row census or a new
Lean theorem.

Equality-level deletion exposed large rigidity networks rather than a small
common core, and a certificate-lift attempt timed out at 180 seconds. This
rejects verbatim formalization and further blind core mining from the two
examples. Their useful output is a sharper producer target: start from the two
off-dangerous `f2`-support points already forced by retained provenance, then
use actual convex/cap localization to put that pair in the required second
full-filter class and consume
`CapSelectedRowCounting.outsidePair_unique_capCenter`, or identify the two
centers with the opposite Moser apices and prove K-A-PAIR directly. A generic
second-center or blocker-cycle statement is insufficient. Full scope and the
`msolve` raw-parser regression are recorded in
`docs/audits/2026-07-13-atail-critical-row-metric-discriminator.md`.

## Blocker-graph gate and marginal anti-pigeonhole boundary

The blocker-map route has now been tested at the strongest relaxed interface
that it naturally supplies. `scratch/atail-force/blocker_graph/countermodel.py`
checks a 12-vertex symmetric distance-equality structure with a spanning
blocker cycle, one exact four-class at every center, global deletion
criticality, and distinct-center support overlap at most two. Even with both
fixed centers on the cycle, every two-center joint fiber has cardinality one.

The independent
`scratch/atail-force/blocker_graph/euclidean_countermodel.py` checks a fixed
33-point integer-coordinate Euclidean set with global K4, failure of global K4
after every single deletion, genuine blocker cycles, and an injective
two-center distance map. This second witness is deliberately not convex
independent, so it is not a counterexample to K-A-PAIR. It proves exactly that
Euclidean realizability plus blocker structure still does not replace the
live convex/Moser/cap hypotheses.

Therefore no further cycle-length, spanning, or blocker-surjectivity
classification is a closure step. Any blocker-based successor must explicitly
derive an off-surplus overlap of cardinality at least two for exact shells at
the two fixed opposite Moser apices from convexity, cap sizes/order, no-M44, or
the actual critical-row packet. Otherwise it merely renames K-A-PAIR. Full
hypothesis mapping and replay commands are in
`docs/audits/2026-07-13-atail-blocker-graph-assessment.md`.

The ordered-cap double count is terminal at the same abstraction boundary.
`orderedCap_card_add_four_le_choose_outside` contributes only `m+4` outside
pairs for a cap of size `m`; the summed card-12 lower is 27 while the available
pair capacities are 63 and 64. A common critical-shell system cannot double
this incidence count: blocker fibers have size at most four, and every global
selected row at a blocker center is identified with the same critical support.
The deterministic artifacts in `scratch/atail-force/global_count_boundary/`
validate strengthened finite shadows for both profiles with the full current
count, blocker cover, cyclic separation, one-sided cap bounds, and singleton
fixed joint fibers. Their Euclidean and live omissions are fail-closed in the
manifest. The exact count and replay audit is
`docs/audits/2026-07-13-atail-global-count-boundary.md`; nine tests pass.

## Closure priority and fallback

### Target-specific `CARD-EQ-12` Q-C incidence preflight

The first `ATAIL-PAIR-SECOND-CENTER` preflight is complete in
`scratch/atail-force/second_center_query/`. It deliberately excludes the
separately owned card-11 profile and tests one explicit admitted named-label
placement in each `CARD-EQ-12` profile. The serialized surface retains the exact
dangerous `p` row, all five independent supplied source rows, one exact
selected row at every carrier center, and one source-indexed exact
critical-system row for every carrier point. It also checks source membership,
center/source separation, the encoded no-q-free consequence at every chosen
blocker, the current cyclic/pair/Q3 inventory constraints, cap sizes, and the
row-witnessed negation of Q-C.

Both searches return independently validated `SAT_FINITE_SHADOW_ONLY`:

- `(4,5,6)`: 19 nodes, 29 rows, witness digest
  `ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47`;
- `(5,5,5)`: 26 nodes, 29 rows, witness digest
  `d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18`.

The manifest fail-closes Euclidean metric equations and disequalities, strict
convexity, the geometric strict-cap order, MEC/non-obtuse data, arbitrary
bisector hits not represented by a selected row, the omitted full live
fields, exhaustive placements, Q-A/Q-E, and card 11. Therefore the checkpoint
proves only that the retained row/cap/critical-system incidence does not force
a row-witnessed same-cap second center on these two placements. It is neither
a counterexample to the producer nor evidence that a larger incidence sweep
will close it.

That first metric oracle is now complete for both pinned witnesses. In
`scratch/atail-force/second_center_metric_oracle/`, each 29-row serialization
deduplicates to 12 distinct circles and 36 squared-distance equalities. Under
the valid real gauge `point 0 = (0,0)`, `point 1 = (1,0)`, Singular and msolve
in two variable orders independently return the unit ideal for both profiles.
The incidence survivors therefore have no normalized real equality
realization, even before convex/MEC/cap inequalities are imposed. Bounded
deletion leaves cross-checked unit subsets of 6 rows / 18 equalities and 7 rows
/ 21 equalities. The original oracle is trusted exact CAS and not an exhaustive
placement result, but its first five-row successor is no longer CAS-only.

The `(4,5,6)` round-1 five-row cut has two independent exact proof artifacts.
`scratch/atail-force/second_center_metric_certificate/` replays the rational
identity `1 = Σ h_i g_i` coefficient-for-coefficient and emits a generated
Lean fallback. More importantly,
`scratch/atail-force/five_row_metric_core.lean` gives a compact branch proof,
transports it through `normSim`, and proves both the direct
`SelectedFourClass` incidence consumer and the generic `EdgeClosure` consumer.
The five rows centered at labels `1,2,6,9,10` require sixteen support
memberships (eleven nonredundant equal-distance comparisons) and force labels
`0` and `1` to coincide. Every printed axiom set is core-only. An exhaustive
twelve-family theorem-bank audit finds no existing equality-family match for
this particular core.

The metric CEGAR successor is complete to its declared bounded checkpoint.
`checkpoint-round64.json` is a hash-bound continuation of the 32-round prefix.
Each fixed placement reaches 64 rounds, and all 128 full equality systems plus
all 128 learned cuts fully replay as `CROSSCHECKED_UNIT`. The maximum incidence
search is 4,644 nodes for `(4,5,6)` and 4,380 for `(5,5,5)`; accepted cuts have
5--8 and 5--9 rows respectively. Both cases end
`STOPPED_ROUND_BUDGET`, not exhaustion, with no nonunit candidate. The first
repeated whole-core type occurs at `(5,5,5)` rounds 40 and 62 and exactly
matches the already banked `SixPointCircleChainCollisionCore` under one role
assignment. This demonstrates consumer reuse, not producer coverage.

The named-row provenance audit is decisive for integration. Across all 64
learned cuts in each profile, zero cuts have a supplied-source alias for every
retained row. In the compact `(4,5,6)` core, one row is both `supplied:u` and
`global:1`; the other four are global-only selected rows. Consequently the five
live `CriticalSourceRows` cannot directly instantiate the new consumer. The
missing theorem must force the required selected-K4/global-row support
incidences from the actual cap/order/full-filter or common critical provenance.
It is not another scalar-algebra lemma.

The closer common-system experiment in
`scratch/atail-force/common_system_metric_probe.py` removes the artificial
global-row-at-every-center assumption. It selects one exact blocker row for
every source of a single finite common-system abstraction and couples rows
which choose the same center. The deterministic structural CEGAR accepts only
kernel-backed monotone cuts. Across the two profiles it learns four
`ExactOffCircleCore` cuts and eight three-row nested-equal-chord cuts before
reaching one uncovered four-row equality survivor in each profile. The new
production module `Problem97.Census554.NestedEqualChordCore` proves the
order-sensitive metric obstruction with core axioms only. The checked adapter
`scratch/atail-force/nested_equal_chord_producer_adapter.lean` shows that three
source rows with blocker centers `o,a,b`, the corresponding shell incidences,
and one cyclic cut `o,a,b,c,d` supply its `EdgeClosure` core and all four signed
areas. Thus this motif's consumer and live-vocabulary lift are complete; only
the incidence/order selection is open.

The deeper live adapter
`scratch/atail-force/nested_equal_chord_live_producer.lean` removes the order
selection entirely. For any source in the actual `CriticalShellSystem`,
`orderedBlockerRow` sorts its four blocker-row labels after the center in the
cyclic boundary index and proves `BoundaryFiveOrder o a b c d`. Since the
actual `FaithfulCarrierPattern` already supplies global selected rows centered
at `a` and `b`, the smallest direct producer is exactly
`GlobalNestedPairFields`: force `{o,d}` into the global row at `a` and `{o,c}`
into the global row at `b`. `HasGlobalNestedPairProducer` plus
`false_of_hasGlobalNestedPairProducer` is a checked closure contract with only
`propext`, `Classical.choice`, and `Quot.sound`. It needs neither two additional
critical-shell sources nor equations aligning their blocker centers. The four
global-row lower-bound incidences remain unproved.

The exact one-row extension census
`scratch/atail-force/residual_456_global_row_extension.py` rules out a weaker
global-K4 repair. For every missing center 4--11 it exhaustively enumerates the
locally admissible selected supports and adds one non-exact global row to the
four exact `(4,5,6)` residual rows. The complete current formalized-core scan
still leaves 128--176 supports per center. At every center the first tested
survivor has a proper normalized equality ideal in both msolve variable
orders; Singular agrees for centers 6--11 and times out for 4--5. This proves
neither real nor convex feasibility, but it decisively rejects a proof plan in
which one selected row at one fixed missing center must already hit the
current theorem bank. The next meaningful global-row layer is the coupled pair
at centers `a,b` demanded by `GlobalNestedPairFields`, preferably together
with MEC rather than an unguided larger row menu.

The coupled follow-up
`residual_456_global_nested_pair_census.py` is exact within this one saved
placement, profile, and blocker map. It finds zero
`GlobalNestedPairFields` witnesses across all twelve source choices. For
blocker centers 0, 1, and 3, one required pair is absent from an already locked
exact row. The only unlocked center-2 pattern requires a center-7 row
containing `{1,2}`; all 15 locally admissible candidates are independently
covered by six `DuplicateCenterCore` and nine `ExactOffCircleCore` instances.
No equality oracle is needed. This does not refute the general live producer,
but it proves that bare global-K4 incidence cannot force it on the very
placement under audit. The live route must use MEC/cap/full-filter information
to exclude or reconfigure that placement, or choose a different consumer.

The historical `(4,5,6)` round-5 survivor is an exact falsifier for future
relaxed producer statements. `residual_456_exact_witness.py` constructs its twelve
points in `Q(sqrt(3),sqrt(K))`, where
`K = 6709288214136987 / 738259314849316`. A standalone integer/Fraction
checker proves the 16 support equalities, 32 exact exclusions, 66 distinct
pairs, 120 strict-convex half-plane inequalities, all 36 cap-arc predicates,
nonobtuseness, and the complete saved source-to-blocker/no-`q`-free deletion
map. `residual_456_z3_crosscheck.py` independently negates each claim over
exact QF_NRA and returns `UNSAT`. This is externally exact trusted-checker
evidence, not a Lean-kernel proof or target-faithful counterexample.

The same audit identifies the missing live content precisely. Only centers
0--3 have a fourfold distance class, so the construction fails
`FaithfulCarrierPattern`/the all-center K4 field at centers 4--11. Labels 7,
10, and 11 lie outside the circumcircle through the fixed Moser labels 0, 1,
and 2, so it also fails the MEC disk field. The cap arcs and nonobtuse triangle
themselves do hold. Thus common blocker provenance, exact rows, convex order,
and cap-side data alone cannot be promoted to the universal producer. The
MEC-augmented discovery probe `common_system_mec_optimizer.py` first found no
candidate in 16 deterministic starts. The production
`Problem97.Census554.MECStraddlingRowCore` now replaces that numerical hint
with a proof: for `o=0,a=1,p=2,s=3,x=10,y=7`, three residual rows give
`oa=ap=os=sx=sy`; actual MEC disk membership for `x,y`, nonobtuseness at `a`,
and four inherited orientations force one determinant to be both positive and
negative. The generic metric theorem, `EdgeClosure` core, MEC geometry packet,
and positive/reflected consumers target-build with only `propext`,
`Classical.choice`, and `Quot.sound`. It uses no all-center K4 field. Thus the
saved `(4,5,6)` geometric residual consumer is closed, while universal
incidence/placement production remains open.

The original `(5,5,5)` round-7 survivor is no longer open. The production module
`Problem97.Census554.SixPointTwoCircleOrderCore` extracts the six-label
subsequence `A,P,Q,B,D,C = 0,9,11,1,3,2`. The four residual rows give exactly
five closure facts: `AB=AC`, `AB=AD`, `AB=BC`, `CD=CP`, and `DA=DQ`; strict
cyclic order supplies seven signed-area inequalities. The normalized scalar
argument, generic point theorem, `EdgeClosure` core, and positive/reflected
consumers target-build with only `propext`, `Classical.choice`, and
`Quot.sound`. It uses no exact-row exclusion and ignores the other six labels.
The deterministic matcher closes rounds 7--9 without changing the earlier
checkpoint prefix.

Three later `(5,5,5)` families now have kernel-checked consumers.
`SixPointNestedCenterOrderCore` maps rounds 14--16 by
`(O,A,D,E,X,C)=(0,1,3,4,5,2)` and consumes four rows plus five cyclic signs.
`SixPointCircleChainOrderCore` maps round 17 by
`(O,A,D,E,C,Y)=(0,1,3,4,2,8)` and consumes all five rows plus
`OAC,OAE,OAD,CYO`. Both modules expose positive/reflected `EdgeClosure`
consumers, have actual GeneralCarrier adapters, target-build with core axioms
only, and have deterministic monotone matchers. `SixPointCircleChainWrapOrderCore`
then closes rounds 18 and 19. The wrap
order uses the same equality core with cyclic order `O,Y,A,D,E,C` and signs
`OAC,OAE,OAD,OYA`; its generic theorem and actual GeneralCarrier adapter are
kernel-clean with core axioms only. In the archived pre-arc replay,
`SevenPointSplitBridgeOrderCore` closed rounds 20--22 with the spine
`(O,A,D,E,C)=(0,1,3,4,2)`, fixed `U=6`, and
`W=8,9,10`. Its theorem, reflected consumer, and actual carrier adapter have
the same core-only axiom closure and passed independent audit. The historical
round-23 survivor had digest
`d1c0773c0013f2e241949a3c8abed8025a18bcd02507af284df00df9be4e5971`.

For `(4,5,6)`, the MEC matcher closes historical round 5 and advances to
round 6, digest
`268f0efa08c29ad02c622b5eabe9d9c221737680117c84015eebe05e70ba89f9`.
An exhaustive cyclic-embedding audit rejected the tempting five-point
equilateral consumer: its decisive orientation is reversed in the actual
hull order. No misleading theorem artifact was retained. Both current
survivors have cross-checked nonunit equality ideals; 16-start numerical
searches found no witness, which carries no feasibility verdict.

Finally, `scratch/atail-force/second_center_placement_census/` exactly
enumerates the placement layer admitted by the current `CARD-EQ-12` preconditions.
It validates 253,302 raw/orbit representatives for `(4,5,6)` and 683,424 raw
placements / 113,904 six-element orbits for `(5,5,5)`, for 936,726 raw and
367,206 representatives total. This is placement-only: it does not run the
row-system DFS or metric oracle and is not target-faithful. The scale makes a
blind CEGAR run at every representative the wrong next step.

The exact Lean-facing producer boundary is now smaller still. A single
source-indexed critical shell is enough if its center lies in `p`'s cap,
differs from `p`, and its support meets the dangerous set outside that cap in
cardinality at least two; the checked theorem
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity` performs
the remaining extraction. A localization claim sending dangerous sources
into `cap \ {p}` would not by itself finish the general profile: with
`2 <= |B \ cap| <= 4`, pigeonhole forces a repeated center only when the cap
has size four and all four dangerous points lie outside. The producer must
therefore add genuine geometric non-injectivity/support overlap, or use a
critical source outside `B`.

There is also an exact choice obstruction, now checked in
`scratch/atail-force/dangerous_blocker_collapse.lean`. The localized
no-`q`-free and fixed-triple packets prove that `B` is the complete dangerous
radius class and that deleting any `z in B` blocks `p`. Hence any available
critical system can be overridden on `B` so all four corresponding
`centerAt` values are `p`. This does not exclude a different useful system,
but it rules out treating an arbitrary witness of `hcritical` as if its
dangerous-source centers had forced diversity. The next producer must either
select a source outside `B`, independently produce a non-`p` deletion blocker,
or thread common-system provenance strong enough to identify a row that the
override cannot replace without losing a live hypothesis.

That outside-source route is now audited in
`scratch/atail-force/outside_source_cap_multiplicity.lean`. It proves that the
selected `u` is an ambient point outside `B`, that a common critical system
cannot choose `p` as the blocker after deleting `u`, and that the supplied
`u` row already has center different from `p`. It also checks the independent
cap-coverage and support-complement bounds. What remains is exactly
`URowCapMultiplicityFields`: a single cap index containing both `p` and the
`u`-row center, with at least two points of `uRow.support ∩ (B \ cap)`. Neither
separate cap coverage nor the facts `|uRow.support \ B| >= 2` and
`|uRow.support \ cap| >= 2` align those complements. The checked sufficient
condition `URowCommonCapOffDangerousConfinement` confines every off-dangerous
`u`-row support point to the common cap; this confinement, or a strictly
weaker implication producing the same multiplicity, is the new geometric
theorem to seek.

That candidate has now been adversarially decided at the local surface. The
exact strictly convex Euclidean `(4,5,6)` relaxed residual satisfies common-cap
alignment and the generic `support ∩ cap` upper bound but has only one
dangerous support point outside the common cap. Thus the two independent
complement bounds cannot prove `URowCapMultiplicityFields`, even with this
weakened Euclidean geometry. The residual is not target-faithful: its named
Moser triangle is not an MEC frame, its all-center K4 condition fails, and it
does not carry the full live/no-M44/full-filter package. The full live
implication therefore stays CONJECTURED rather than refuted. Moreover, the
outer caller builds all five rows from `Hcritical`, while the pair theorem
accepts `rows` and `Nonempty (CriticalShellSystem D.A)` independently; the
current residual signature loses that provenance. Any renewed URow proof must
first retain the common system and then use MEC, all-center K4, or a genuinely
stronger live coupling to establish ALIGN and MULT separately. Until such a
lemma is identified, URow cap multiplicity is not the primary producer route.
The MEC omission is already understood exactly: the existing
`MECStraddlingRowCore` excludes this residual (label 10 has positive rational
circumdisk power), but its proof uses only one `u`-row equality and no
dangerous-count or cap field, so it cannot be repurposed as the missing URow
producer. See `scratch/atail-force/residual_456_mec_gate_analysis.md`.

Replay:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/second_center_query/query.py --check
PYTHONPATH=. .venv/bin/python -m unittest \
  scratch/atail-force/second_center_query/test_second_center_query.py
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/second_center_metric_oracle/oracle.py --check
PYTHONPATH=. .venv/bin/python -m unittest \
  scratch/atail-force/second_center_metric_oracle/test_oracle.py
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_cegar/cegar.py \
  --check --checkpoint \
  scratch/atail-force/second_center_metric_cegar/checkpoint-round64.json
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_cegar/audit_row_origins.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/placement_census.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/validate_placement_census.py
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_metric_probe.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_residual_optimizer.py --check --starts 16
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/residual_456_exact_witness.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/residual_456_z3_crosscheck.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_mec_optimizer.py --check --starts 16
UV_CACHE_DIR=/tmp/uv-cache uv run python -m unittest \
  scratch/atail-force/test_common_system_metric_probe.py
```

ATAIL-FORCE is the primary proof lane. The preferred theorem is uniform from
card 11 and uses full exact-radius filters together with convexity, global
order, no-M44, the actual five-row pair interface, or the stronger six-row live
interface. Every proposed relaxed intermediate must be checked against the
W16/W20 bank and the new blocker-graph witnesses; it must name the live
convex/cap/full-filter hypothesis that excludes them. A statement in the same
equality/pattern vocabulary cannot be promoted merely because a bounded sample
dies. The concrete next theorem is now one of three primary incidence
alternatives: the sixteen-support pattern consumed by
`false_of_five_selectedFourClasses`; the reused cyclic-order family, including
the validated wrap, split-bridge, arc-overtake, and five-row-intersection
variants and the current round-21 successor; or
the four global-row memberships
packaged by `HasGlobalNestedPairProducer`. `URowCapMultiplicityFields` remains
a conditional fallback only after its lost common-system provenance is
restored and a new MEC/all-center coupling is identified. Any alternative must
be derived from the live
MEC/cap/full-filter/no-M44 hypotheses and consumed immediately. It must also
exclude the saved exact strict-convex `(4,5,6)` relaxed witness by using its
concrete missing MEC or global-K4 field (or stronger live data). The metric and
convex consumers themselves are no longer missing.

AHEAD CEGAR remains a bounded cards-12--14 fallback. Census554 no longer holds
the compute pool, but the permanent runner is still software-gated: safe
execution requires the cardinality-generic mining worker, a validated bank
snapshot/CNF adapter, a cross-profile lifetime lock, and runner orchestration;
the current witnessed-versus-banked fresh-shape accounting must also be split
before the staleness stop is trusted. Its declared wall, bank-growth, and
shape-staleness stops remain binding, and a policy-stopped run is a durable
nonterminal result rather than a reason to extend the budget. If the
uniform producer naturally requires card at least 15, a checked AHEAD cover may
discharge cards 12--14 before that threshold is introduced on-spine, but card
11 still needs A11-CONSUME. If the producer works from card 11, both finite
census splits are unnecessary for closure.

Any further bounded subsystem is justified only by a forcing principle from
the actual full-filter or critical-row hypotheses and must also be tested as a
shared producer for the LIVE-Q/T1/T3 permutation orbits and the seven LIVE-C
branches. The intended consumption unit is a complete orbit family, not one
of the 55 remaining direct textual holes in isolation.

## Acceptance gates

### 2026-07-14 geometry-faithful producer mining checkpoint

The next mining pass is now target-driven rather than another extension of the
fixed-placement common-system CEGAR.  Adam explicitly authorized this ATAIL
research to proceed in parallel while the LIVE-T1 lane was active.  LIVE-T1 is
now source-closed; the permanent ATAIL implementation is:

- `census/atail_force/producer_surface.py`: role-aware card-11 `(5,5,4)` and
  card-12 `(6,5,4)` / `(5,5,5)` surfaces, with full exact apex classes kept
  separate from selected-four witnesses and with the pair conclusion negated
  exactly on off-surplus labels;
- `census/atail_force/producer_geometry.py`: named QF_NRA atoms for the
  similarity gauge, strict convex order, MEC disk/boundary, cap membership,
  full exact filters, pinned K4 rows, and target negation, with an explicit
  omitted ledger and bounded Z3/cvc5 runners;
- `census/atail_force/producer_bank.py`: all-match scanning over every current
  formalized equality/order core and orientation, rejecting any recognized
  result without a named Lean consumer; and
- `census/atail_force/producer_mus.py`: a bounded MARCO-style multi-core map
  layer whose `UNKNOWN` result is fail-closed.

The first fixed 24-query pattern census is recorded in
`census/atail_force/producer_pattern_census_checkpoint.json`.  It selects the
first eight deterministic target-negating, theorem-bank-clean assignments in
each of the three profiles and runs one three-second cvc5 query per assignment,
without retries or automatic extension.  The result is 24 `UNSAT`, zero
survivors, and four recurring named-core shapes.  This is solver discovery
evidence, not an exhaustive finite theorem and not a Lean proof.  The encoder
fixes one canonical within-cap label order; exhaustive order-orbit coverage is
still omitted.

One recurring obstruction has now been extracted from the solver entirely.
The scratch theorem
`Problem97.ATailForce.OpposedEqualChordMECCore.metric_orientation_incompatibility`
in `scratch/atail-force/opposed_equal_chord_mec_core.lean` says: if distinct
MEC-boundary points `a,b` have in-disk points `c,d` with
`dist a c = dist a b`, `dist b d = dist b a`, and the two inward opposed
orientations, then `False`.  Its reflected negative-orientation form is also
checked.  Direct elaboration is warning-free and both declarations use only
`propext`, `Classical.choice`, and `Quot.sound`.  This kernel accounts for
9/24 sampled assignments.

The other 15/24 sampled assignments share an endpoint-radius containment
shape.  No new metric kernel is needed there: this file already imports
`U2NonSurplusOneHit`, whose
`oppApex1_filter_subset_oppCap1_of_endpointRadius` and symmetric apex-2 theorem
turn membership of the other two Moser vertices in an apex radius class into
containment of the full exact class in the corresponding opposite cap.  The
sampled cores then contradict the named surplus-interior support placement.
This chain is now kernel-checked directly by
`Problem97.ATAILForceScratch.onePointSurplusCapExactRadius_false` in
`scratch/atail-force/one_point_cap_mec_kernel.lean`; its axiom closure is also
exactly `propext`, `Classical.choice`, and `Quot.sound`.  The bounded 24-case
sample is therefore consumer-complete.

The exhaustive solver-free follow-up is implemented in
`census/atail_force/producer_coverage_census.py`.  A deterministic live run classifies
all 369,743 target-negating full exact-class pairs, with precedence fixed as
formalized bank, endpoint containment, production adjacent-cap one-hit,
scratch MEC fallbacks, survivor.  Exact totals are 44,831 bank matches,
108,435 endpoint-containment contradictions, 215,547 adjacent-cap one-hit
contradictions, and 930 survivors.  At this precedence the production one-hit
stage subsumes both scratch MEC stages.  The survivor counts are 96 for
card-11 `(5,5,4)`, 150 for card-12 `(6,5,4)`, and 684 for card-12 `(5,5,5)`.
The deterministic JSON checkpoint and dedicated count, mutation,
consumer-name, and witness-invariant tests are present; checkpoint replay
passes and the full ATAIL test suite passes 73/73.

Thus the first 24 assignments were an easy-prefix sample, not representative
coverage.  The current bank/containment/MEC consumers do **not** close the
unrestricted producer surface.  Any bounded survivor mining is diagnostic
only and must add the live critical map plus a named MEC/cap/full-filter field.
It is not the primary closure route; broad resampling of marginal pairs is not
justified.

The older equality-only MARCO replay was also attempted on the saved
`(4,5,6)` round-0 conflict.  It stopped fail-closed when Singular timed out on
a deletion that both msolve variable orders classified `NONUNIT`; no minimal
core was banked.  A later hash-bound `QQ(i)` substitution witness verifies that
specific proper ideal exactly, but it has not been generalized into the MARCO
oracle contract.  This equality-shadow issue is no longer the primary route:
the geometry census has exposed smaller live MEC/cap consumers.

The immediate closure gates are therefore the parent-level frontier extraction,
robust coupling, and unique-row producer specified below.  A bounded run over
survivors is optional theorem discovery only; it must include the live
source-indexed critical map and name the exact MEC/cap/full-filter field that
excludes each accepted survivor.  Neither the 24-query prefix nor the
369,743-pair finite classification closes a `sorry` by itself.

### 2026-07-14 unique-row branch decision

The Stage-I double-deletion classifier reduces failure to a unique
first-apex row of cardinality four or five, but does not close K-A-PAIR by
itself.  The exact remaining producer is cross-row incidence, not another
same-radius count:

- card four: produce one non-apex blocker in the surplus cap whose exact shell
  contains the chosen outside pair; `outsidePair_unique_capCenter` closes;
- card five with distinct blockers: produce the two reciprocal source-row
  memberships; the checked three-bisector/Dumitrescu consumer closes;
- card five with one common blocker: the outside/adjacent-cap placement closes
  already, while the strict-interior between-case needs either a third
  bisector center or a theorem excluding that placement.

`CriticalShellSystem` provides only diagonal source membership.  Its choices
can be overridden on an exact four-row to use the apex blocker, so none of the
needed diversity or cross-incidence follows from `hcritical` alone.  The new
producer must visibly consume MEC/cap/full-filter or common live-row
provenance.  Parallel branch research for this decision was explicitly
authorized by Adam.

The parent-boundary audit now kernel-checks the exact card-four terminal
interface in `scratch/atail-force/card_four_parent_boundary.lean`. One
retained-system blocker in the surplus cap, distinct from `oppApex1`, whose
exact shell contains both selected points closes immediately by
`outsidePair_unique_capCenter`. The common-system provenance is present when
`Hcritical` constructs `Hdepth5Rows` and `Hf2CriticalRow`, but the current leaf
passes those as separate values and erases their constructor relationship.
Even before that erasure, provenance alone does not produce the field: a
minimal seven-vertex exact incidence falsifier realizes the five-point
surplus cap, exact four-supports, and deletion-critical blocker map while
having no non-apex surplus-cap support containing the pair. Its trust boundary
omits Euclidean convex/MEC order. Therefore moving the incidence data earlier
is necessary for wiring but not itself a proof; the first genuinely new input
must couple MEC/order to blocker localization and cross-membership.

Selector independence sharpens the required statement. It is false to target
`H.centerAt source != oppApex1` for an arbitrary supplied system: the checked
`not_forall_centerAt_ne_of_certified_blocker` uses `overrideAt` to select any
valid blocker, and card four makes the apex a valid blocker for both chosen
sources. The corrected producer is choice-invariant:
`ExistsSurplusPairCriticalBlocker` asserts existence of any non-apex
surplus-cap center, exact critical shell, and deletion-blocker certificate
whose support contains the pair. Its direct consumer is kernel-checked and
does not require constructing a favorable global selector. If later row
machinery needs such a selector, the earliest sound construction point is
after this invariant witness is produced; only then should the retained base
system be overridden and dependent rows rebuilt.

Implementation checkpoint: the classifier, both card-four/card-five
single-deletion polarity lemmas, blocker/apex separation, and the full
distinct-blocker reciprocal-incidence consumer are checked in
`scratch/atail-force/same_radius_double_erase_classifier.lean`.  Direct Lean
elaboration is warning-free.  Their axiom closures are exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The distinct-blocker branch is therefore
reduced in checked Lean to the two reciprocal memberships; no center-separation
or metric consumer remains to be built there.

The Adam-controlled parallel unique-row session has now checked the sharper
one-hit adapter in
`scratch/atail-force/unique-row-producer/card_five_distinct_cap_local_producer.lean`.
On the exact card-five/distinct-blocker arm, the existing
`CardFiveCapOrMutualFields` packet and its `False` consumer follow from the
single disjunctive field `CardFiveDistinctCapLocalCrossHypothesis`: in at
least one direction, the opposite source belongs to the actual selected
shell and that shell's blocker lies in `S.surplusCap`.  The frontier already
supplies every other field.  This is a kernel-checked conditional adapter,
not the unconditional producer: neither the live frontier, faithful global
row, counting bank, nor indexed theorem banks currently derive that cap-local
directed cross hit.  The first open theorem on this arm is therefore a
source-indexed blocker-to-cap transport result using MEC/cap/full-filter
geometry, exactly as recorded in the owned `REPORT.md`.

### Recommended on-spine closure architecture

The current pair residual does discard common-system provenance, but the
initial proposal to bypass it through an independent sixth row is **not valid
in the exact `t2_t20` branch**.  That branch assumes
`t2 = rows.pointOfChoice {source := t2, slot := 0}`.  Consequently, when the
outer wrapper constructs both packets from one `Hcritical`, `f2CriticalRow`
and `rows.rowAt t2` have the same source and are the same chosen system row.
The comparison maps expose a collision, not an additional independent row.
This is already formalized by
`CriticalSourceRows.f2_support_eq_rowAt_of_source_eq` in
`scratch/atail-force/critical_row_coupling.lean`: equal source plus the two
live comparison maps identifies the entire exact support.  The resulting
`t2` row is the dangerous row `{q,t1,t2,t3}`.  It supplies the one-way
incidence `q in selectedAt(t2)`, but no theorem supplies the reciprocal
`t2 in selectedAt(q)`; moreover live `q` lies in the surplus cap, so this
fixed pair cannot be the required off-surplus survivor pair.

Repository-wide source search still finds no Lean consumer outside
`U1LargeCapRouteBTail.lean`:
locally the pair residual is used only by
`exists_removableVertex_of_twoLargeCaps`, then by
`false_of_twoLargeCaps_pCentered_t2Source`, then by
`false_of_largeCap_pCentered_t2Source_exactDangerousRow`, and finally by
`false_of_center_p_t2_t20`.  The actual `false_of_center_p_t2_t20` caller
already has the sixth `f2CriticalRow` and its same-system comparison map; the
top-level wrapper constructs both the five rows and that sixth row from one
concrete `Hcritical`.  The intermediate pair signature discards both facts
and replaces the system by an unrelated `Nonempty` witness.

Therefore a refactor may retain the concrete common system for cleaner
reasoning, but it cannot close the proof merely by moving to
`false_of_center_p_t2_t20`.  A valid removal of the residual chain requires:

1. state a genuinely stronger incidence producer with the concrete common
   `CriticalShellSystem` and the full live MEC/cap/full-filter inputs;
2. make its output exactly one of the checked branch consumers above
   (reciprocal incidence, a cap-local second center, or `False` directly);
3. rewire `false_of_center_p_t2_t20` to that producer; and
4. delete the now-unused pair/removability/two-large-cap residual chain,
   including the duplicate public forwarding declaration.

This can close the textual `DoubleApexOffSurplusSharedRadiusPair` sorry without
proving its weakened interface, but only after the stronger producer is
actually proved.  The `t2_t20` source collision supplies no extra row, so the
producer must use common provenance together with MEC/cap/full-filter geometry
to force the missing cross-incidence or bisector placement.  Deletion is
acceptable only in the same change that rewires every on-spine consumer and
passes the full build and proof-blueprint gates.

- The producer is stated only from hypotheses actually present at the current
  shared-radius declaration.
- No selected-four or finite-token SAT result is promoted to a full geometric
  statement.
- Any solver-derived impossibility has exact generator fidelity and an
  independently replayed certificate before it is called proved.
- Banked witnesses remain regression gates for every new universal lemma.
- No new `sorry`, axiom, or unconsumed theorem is introduced.
- Completion means the existing shared-radius declaration is sorry-free,
  target-build clean, and absent from `proof-blueprint symbols --with-sorry`.

## 2026-07-14 producer decision after exact-pair coverage

The finite exact-pair route is now a negative result, not the next closure
gate.  A deterministic run of

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python -m \
  census.atail_force.producer_coverage_census
```

classified all 369,743 target-negating pairs as follows:

| profile | target-negating pairs | bank | endpoint containment | adjacent-cap one-hit | survivor |
|---|---:|---:|---:|---:|---:|
| card 11 `(5,5,4)` | 35,010 | 4,140 | 11,336 | 19,438 | 96 |
| card 12 `(6,5,4)` | 115,745 | 15,743 | 30,156 | 69,696 | 150 |
| card 12 `(5,5,5)` | 218,988 | 24,948 | 66,943 | 126,413 | 684 |
| **total** | **369,743** | **44,831** | **108,435** | **215,547** | **930** |

This is exhaustive only for the script's finite exact-class/order surface. It
is not a Lean proof and it omits the live deletion-critical map.  In
particular, it falsifies the former gate “classify every exact apex-class pair
by the current consumer bank.”  The immediate implementation task for this
artifact is only to add a pinned checkpoint and mutation/count tests; adding
more marginal consumers is not proof-critical while survivors remain.

The fixed survivor-only round-two solver checkpoint has been regenerated on
this 930-case stream.  Its unchanged policy selects twelve centered quantiles
per profile and gives cvc5 three seconds per query with no retry.  All 36
queries return fail-closed `TIMEOUT`; there are no UNSAT cores or recurring
shapes to mine.  Checkpoint digest
`2ab12c0b155935550fd62272b9cfeeab83e1b2b832bd796cbc034a26b27e3f5e`,
`--check`, and the four focused tests pass.  This is no evidence of
realizability; it is evidence that more marginal QF_NRA sampling is not the
next closure step.

The deterministic bridge audit in
`scratch/atail-force/residue930-bridge/` finds zero existing two-row
equality/order bank hits among the 930.  The smallest universal conditional
sink needs one actual critical-row cross membership plus same-side/open-arc
placement; the existing two-circle order consumer would then cover all 930.
The other complete conditional outputs are exactly the already named
card-five cap-or-mutual packet, the choice-invariant surplus blocker packet,
and the distinct/coincident blocker split.  A variable embedding into
`u1TwoLargeCapObstruction` needs three additional equalities for 49 residues,
four for 470, and five for 411.  The parent common-critical-map boundary
supplies none of those cross memberships, blocker placements, arc placements,
or extra equalities.  Checkpoint SHA-256
`e84357cf22dd41b55bb6959a97d65b3da908f61b3eae9b0ed4c7ef136462ff16`;
the exhaustive `--check` passes.  This identifies the exact next producer
fields but does not prove them.

The rank-one sink is now production-wired at the frontier level as
`SurvivorPairRelocationPacket.false_of_w_mem_selectedAt_q_of_sameSide` in
`ATail/CriticalPairFrontier.lean`.  It assumes exactly the cross membership
of `P.w` in the actual shell selected at `P.q` and one orientation-invariant
strict same-side signed-area product relative to the chord from
`S.oppApex1` to that blocker.  The theorem derives both circle equalities
from the survivor packet and critical shell, then calls the existing
two-circle reflection kernel.  Both the defining module and the full U1 tail
target build; live axiom closure is exactly `propext`, `Classical.choice`, and
`Quot.sound`.  The remaining content is solely production of those two
fields, or a branch-indexed alternate already consumed elsewhere.

The follow-up rank-one producer audit prevents overreading that conditional
sink.  `scratch/atail-force/rank1-producer/cross_membership_orientation.lean`
kernel-proves the exact branch normal form at the blocker selected for `q`:
deleting `w` there either preserves K4, or the chosen critical shell contains
`w`.  In the cross-hit branch, convex noncollinearity and two-circle
reflection force the signed-area product to be strictly **negative**, so
source swapping does not manufacture the positive/same-open-arc hypothesis.
The first missing antecedent is therefore cross-deletion failure
`¬ HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q)`; absent that, the
route feeds the robust-survival branch rather than a contradiction.

The useful normal form is now production-wired in
`ATail/CriticalPairFrontier.lean`.  The public theorems
`cross_deletion_survives_or_cross_membership`,
`signedArea_product_neg_of_cross_membership`, and
`card_five_cross_deletion_survives_or_cross_oppositeSide` expose respectively
the exact deletion split, the reflection-forced negative orientation, and the
combined card-five branch with blocker/apex separation derived internally.
Both the defining module and the full U1 tail target build, and all three
theorems close under exactly `propext`, `Classical.choice`, and `Quot.sound`.
This production step narrows ATAIL-ROBUST-COUPLING but does not close it: the
remaining content is still to consume or contradict the cross-deletion
survival arm.
`hlocalNoQFree` concerns only the original named `q,p` deletion and cannot
instantiate this frontier claim.  Direct Lean validation passes with exactly
the three core axioms.  The survivor arm is the current
ATAIL-ROBUST-COUPLING target.

The robust-survival audit in
`scratch/atail-force/robust-survival-bridge/` now determines that arm sharply.
At `q`'s chosen blocker, K4 after deleting `w` is equivalent to `w` avoiding
the chosen exact four-shell; the surviving positive-radius row is uniquely
that same shell, and the two blocker distances are unequal.  This rules out
all current cross-equality consumers.  It also rules out the proposed
cumulative-erasure recurrence: cumulative deletion is blocked at `q`'s
blocker, while `H.no_qfree_at w` proves `D.A.erase w` does not retain global
K4.  An exact rational eight-point falsifier independently shows that two
separate single-deletion K4 facts do not imply cumulative K4.  The reusable
exact local normal forms are now production declarations in
`ATail/CriticalPairFrontier.lean`; the defining module and full U1 target
build, and their axiom closures are exactly `propext`, `Classical.choice`, and
`Quot.sound`.  No parent contradiction follows yet.

The blocker-cap audit in `scratch/atail-force/blocker-cap-geometry/` now rules
out the last three-center version of that transport.  Lean proves only the
exhaustive split “surplus Moser apex or strict interior of one of the three
caps.”  An exact 13-point real-algebraic model retains strict convexity, the
non-obtuse circumscribed MEC triangle, cap profile `(6,5,5)`, the card-five
first-apex row, both second-apex single-deletion survivors, and the complete
`q`-side critical blocker packet, while placing the actual blocker in an
opposite cap outside surplus.  It omits global K4 and the rest of the critical
map, so it is not a K-A-PAIR counterexample; it proves that the next producer
must add a fourth center/global incidence.

That fourth-center step has a new production normal form.  The banked
`Dumitrescu.perpBisector_apex_bound` gives

```text
centerAt(q) = centerAt(w)
  iff
w in selectedAt(q).support and q in selectedAt(w).support
```

whenever deletion of each source preserves K4 at the first apex.  A
`5 <= SelectedClass.card` corollary derives those survivals automatically.
All four equality/iff declarations are production-built and core-axiom clean.
Thus the robust two-blocker space has exactly three live branches:

1. mutual cross membership and one common blocker;
2. exactly one cross hit and two distinct blockers; or
3. reciprocal omissions and two distinct blockers.

The deterministic audit in
`scratch/atail-force/robust-two-blocker-census/` counts 5,580 static
off-surplus first-row pairs on the 930 surface and 3,318 whose two deletions
are certified by the stored second row.  It cannot count the three blocker
branches because neither the coverage checkpoint nor round two stores a
critical map.  The new theorem eliminates impossible mixed cases; it does not
produce the required hit.

The saved total-map shadows have now been re-adjudicated against the current
production bank.  The historical `(5,5,5)` shadow is already killed by the
reverse equality-convex-five-point core; its irredundant 11-equality
characteristic-zero certificate remains valid fixed evidence but is
superseded and is not a production target.  The historical `(4,5,6)` shadow
has no hit in the current 23-family metric bank.  Exact provenance and replay
are recorded in `scratch/atail-force/global-generator-audit/` and
`scratch/atail-force/row-core-cegar/`.

A fresh `(4,5,6)` CEGAR run against the production bank first exposed three
survivors.  Each carries the same smaller
`FourPointTwoCircleBisectorOrderCore` packet, while separate leaves also use
`NestedEqualChordCore`, `SixPointTwoCircleArcOvertakeOrderCore`, and
`SixPointTwoCircleOrderCore`.  The FourPoint and ArcOvertake kernels and their
three-row carrier adapters are now production-built and directly target-build
clean with only `propext`, `Classical.choice`, and `Quot.sound`.

The first eight-way extended shard run is a bounded discovery checkpoint, not
an exhaustion claim: five shards returned SAT shadows and three stopped
indeterminate at 100,001 nodes, for 587,147 nodes total.  Two of the five
shadows replay to `SixPointTwoCircleOrderCore`; the other three have no hit in
the current or extended production matcher, but their complete row systems
are `CROSSCHECKED_UNIT` over `QQ` by Singular and by msolve in both variable
orders.  MARCO-style multi-core extraction was then applied to amortize those
exact oracle calls.  Six deterministic deletion orders per shadow bank 16
distinct `CROSSCHECKED_UNIT` row subsets, including four five-row subsets.
They occupy 16 distinct free-incidence isomorphism classes, so no uniform
whole-row shape has yet emerged and no minimality is claimed.  Replay and
scope are pinned by `classify_extended_shard_survivors.py`,
`multi_order_unit_shrinker.py`, and `cluster_multi_order_unit_cores.py` under
`scratch/atail-force/second_center_query/`.

Exact synthesis of the four five-row subsets confirms that this is not merely
a labeling artifact.  Eight deterministic QQ minimization orders retain
subsystems with 9, 7, 9, and 11 equalities; all four are UNIT in Singular and
msolve in both variable orders.  Exhaustive role assignment, allowing aliases
except for the two conclusion anchors, gives a diagonal-only coverage matrix:
each motif matches only its source core.  The only common spine is an
equilateral anchor hinge; the contradiction tails are four distinct schemas.
Thus one shared hinge normalization helper may simplify four consumers, but
there is no single concrete five-row equality theorem to promote.  See
`FIVE_ROW_UNIT_CORE_SYNTHESIS.md` and
`five_row_unit_core_analysis.json` in the same directory.

That four-consumer proof step is now completed in checked scratch Lean.
`scratch/atail-force/five-row-hinge-kernels/FivePointHingeCycle.lean` proves
the shared orientation-free equilateral-hinge normalization and all four
uniform Euclidean collision theorems with exactly 7, 9, 9, and 11 distance
equalities.  Every endpoint closes under only `propext`,
`Classical.choice`, and `Quot.sound`; no CAS result is trusted by the Lean
proof.  The exact row-to-role maps consume the four banked five-row cores.
This closes their metric-consumer side only.  Production `EdgeClosure`
packaging is now complete in
`Census554/EquilateralHingeCollisions.lean`: four abstract Core structures and
four `false_of_*Core` endpoints expose exactly those 7/9/9/11 closure packets.
The focused production build, ten endpoint axiom audits, 34 matcher tests, and
classifier replay pass.  All five saved SAT shadows from the first eight-way
run now hit kernel-backed production consumers.  Live row/placement extraction
and the three node-capped shards remain separate gates.

The corrected all-eight-sink rerun uses the four ordered families and four
new hinge families at every complete leaf.  At the same 100,000-node/shard
budget it terminates with one new SAT finite shadow (shard 6 at 60,854 nodes),
seven `INDETERMINATE_NODE_CAP` shards (100,001 nodes each), zero exhausted
shards, and 760,861 nodes total.  An earlier provisional rerun was discarded
because its extended predicate had accidentally omitted the pre-existing
SixPointTwoCircleOrder matcher.  The corrected result is discovery evidence
only: SAT is a combinatorial row shadow avoiding the current bank, not a
Euclidean realization, while node-cap status proves no exhaustion.

The immediate gate is therefore not another fixed-certificate promotion.
`scratch/atail-force/global-producer-contract/Contract.lean` kernel-checks the
ordered-only four-way disjunction and the current all-eight
`ProductionCoreAlternative`, which additionally includes the four hinge
collision cores.  Its smallest branch needs only two arbitrary
`EdgeClosure` paths showing that `u,y` share centers `q,v`, together with
cyclic order `q,u,y,v`; direct row memberships are only a stronger convenience
adapter.  All three scratch consumers close under only `propext`,
`Classical.choice`, and `Quot.sound`.

`CriticalPairFrontier` does not produce this contract, and the natural choice
of its active blocker for `v` is provably impossible.  A cross hit supplies
the second equality but `signedArea_product_neg_of_cross_membership` forces
the pair onto opposite sides of the center chord; cross survival instead
forces the two blocker distances unequal.  The first missing packet is thus
an **off-frontier nonalternating shared-pair continuation**: another global
equality-closure center in the same-side cyclic placement.  If that packet
cannot be forced, the producer must return one of the other seven current
cores.  The alternate endpoint-spending route likewise still needs return-row
endpoint membership or a cross-cap continuation theorem.  Full scope and
theorem-bank preflight are recorded in
`scratch/atail-force/global-producer-contract/REPORT.md`.

The full-live follow-up removes provenance and global-pattern construction
from that gap.  From `hfixed`, `H`, `D.K4`, `D.convex`, and any actual
`CriticalShellSystem`,
`scratch/atail-force/off-frontier-continuation/OffFrontierContinuation.lean`
kernel-constructs an off-frontier source `u`, its blocker `v != p`, a faithful
global row system pinned to the dangerous row `{q,t1,t2,t3}`, and the exact
critical shell as the global row at `v`.  The first atomic missing field is
therefore the positive lower bound

```text
2 <= |{q,t1,t2,t3} intersect selectedAt(u).support|,
```

followed by cap/order localization forcing nonalternating placement.  The
intersection already has upper bound two.  A kernel-checked `Fin 12`
`(5,5,5)` shadow shows that cap cardinalities, all-center rows, common critical
provenance, and intersection upper bounds allow only one dangerous hit and no
common cap.  Hence the lower bound must visibly consume metric/MEC/exact-filter
geometry, not another incidence or provenance lemma.

An exact Euclidean selection audit sharpens that requirement further.
`off-frontier-two-hit-geometry/exact_euclidean_selection_countermodel.py`
checks a 33-point integer carrier with global K4, every single deletion
breaking global K4, exact positive-radius full filters, and a legal common
critical selector.  That selector has at most one dangerous hit on every
off-frontier row, although the same carrier admits a different legal two-hit
shell.  Thus exact-radius/global-K4/deletion/full-filter/provenance data do not
make the two-hit selector-independent.  The carrier is nonconvex and has no
MEC/cap/noM44 packet, so it is not a K-A counterexample; it proves those
omitted convex/MEC/cap fields are load-bearing.  The shortest visible positive
route is apex alignment plus the existing
`selectedClass_capInteriorByIndex_card_ge_two`, together with dangerous-row
interior alignment, or a direct adaptive critical-shell multiplicity theorem.
The bank theorem currently lives outside the U1 tail import closure and does
not itself provide either alignment.

The endpoint-blocker geometry is also now exact on the frontier.  On the
card-five arm, both chosen blockers differ from both surplus-cap endpoints.
On the card-four arm, `oppApex1` is a certified deletion-critical exact shell
for both sources, and `CriticalShellSystem.overrideAt` constructs a valid
supplied system selecting that endpoint twice even under the full conditional
`hNoM44` hypothesis.  Endpoint landing is therefore the existing directed
cross-hit/common-blocker branch, not a contradiction.  The selector-uniform
goal `centerAt source != oppApex1` is false.  The honest choice-invariant
output is `ExistsSurplusPairCriticalBlocker`, or elimination of the card-four
arm before selecting a system.  An exact 12-point strict-convex nonobtuse-MEC
local model realizes the sharp one-hit split and confirms that endpoint
one-hit alone does not close; it lacks global all-center K4 and is not a K-A
counterexample.  See `scratch/atail-force/endpoint-blocker-geometry/`.

The strongest cycle-free positive apex-alignment checkpoint is now
kernel-checked in `scratch/atail-force/blocker-apex-alignment/`.  Upstream cap
cover plus adjacent one-hit bounds produce two distinct off-surplus points in
one exact class at either non-surplus Moser apex.  At the other apex, either
both point deletions preserve K4, or `CriticalShellSystem.overrideAt`
constructs an adapted actual system whose blocker for one source is that
other apex.  Both opposite-apex directions close under core axioms only.  This
proves adaptive alignment without importing the downstream/circular
`PinnedSurplusGeneralM` module.  It does not force the other point into the
adapted shell, identify the arbitrary live selector with the override, or
consume the double-survival arm; those remain the exact coupling fields.

### Primary theorem boundary

The preferred production target is no longer the existential shared-radius
conclusion.  It is a stronger parent-level contradiction, provisionally
named `false_of_twoLargeCaps_commonCriticalMap`, with the actual leaf inputs:

- the MEC-derived `MT`, `hCirc`, `CP`, `hM`, and `leafSurplusPacket`;
- `hNoM44`, the two-large-cap facts, and the exact full-radius filters;
- the concrete `Hcritical : CriticalShellSystem D.A` chosen in the outer
  wrapper; and
- the fixed dangerous row and live selected-source packet.

The theorem must return `False`.  This keeps the load-bearing cap/MEC and
source-indexed data in one contract and allows the final call before the
LIVE-Q/C slot split.  Proving another wrapper around
`DoubleApexOffSurplusSharedRadiusPair` is not a milestone.

### Checked normal form to promote

The first production module should contain no new open theorem.  Promote the
already checked scratch reductions and package them as one
`CriticalPairFrontier` extraction:

1. choose `q,w` with `q != w`, both off the surplus cap and co-radial at
   `S.oppApex1`, using `exists_survivorPairRelocationPacket`;
2. retain that deleting either point preserves K4 at `S.oppApex2` and hence
   separates both actual blocker centers from that apex;
3. apply
   `sameRadius_double_erase_survives_or_unique_class_card_four_or_five` at
   `S.oppApex1`;
4. independently apply
   `SurvivorPairRelocationPacket.double_erase_or_exact_eight_packet` at
   `S.oppApex2`; and
5. expose the resulting product of the two dichotomies without weakening it
   to separate marginal class inventories.

This extraction is bookkeeping.  Its acceptance gate is a focused build,
core-only axiom audit, and a source-level theorem whose hypotheses are exactly
available at the parent call site.

Scratch extraction is now checked in
`scratch/atail-force/critical_pair_frontier.lean`.  The dependent
`CriticalPairFrontier` retains one `SurvivorPairRelocationPacket` together
with both apex splits, so the branches cannot silently choose different
pairs.  `exists_criticalPairFrontier_of_K4` chooses the positive first-apex
radius from global K4, uses the arbitrary-packet adjacent-cap one-hit bound to
obtain three off-surplus points, and builds the complete frontier.  Direct
elaboration passes; both public extraction theorems use exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The acyclic production module now lives
at `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean`, importing only
`U1CarrierInjection` and `U2NonSurplusOneHit`; U1 imports it successfully.
The focused `U1LargeCapRouteBTail` target build passes and live
`proof-blueprint axioms` confirms the same three core axioms.  The
content-bearing branch theorem remains open.

### Content-bearing branch theorem

The next genuinely open theorem is a geometric classifier on
`CriticalPairFrontier`.  It must produce one of these already consumed
outputs, not a new unconsumed packet:

1. **Unique card four:** the choice-invariant
   `ExistsSurplusPairCriticalBlocker S S.oppApex1 q w`.  Its existing
   consumer closes by `outsidePair_unique_capCenter`.
2. **Unique card five, distinct blockers:** a pair satisfying
   `CardFiveCapOrMutualFields`, namely one cap-local cross-incidence or the two
   reciprocal source-row incidences.  Center separation is already proved;
   the existing card-five consumer closes.
3. **Unique card five, coincident blocker:** either relocate the blocker/pair
   to a cap configuration consumed by ordered-cap uniqueness, or place the
   common pair in a selected class centered at one residual shell member.
   `false_of_residual_member_class_contains_common_pair` then closes.
4. **Robust double-deletion arm:** produce the target double-apex pair, one of
   outputs 1--3 for the old or mirrored survivor pair, or a cumulative-erasure
   packet with a strictly smaller carrier and every invariant required for
   another step.  A bare apex flip is rejected: the saved exact shadow cycles
   when prior deletions are forgotten.  If the critical-shell invariant cannot
   be transported to the smaller carrier, this arm must instead produce a
   cross-incidence or `False` directly.

The classifier must visibly use at least one hypothesis omitted by all known
falsifiers: MEC/cap order, a full exact filter, or a source-indexed metric
incidence.  Global K4, blocker cycles, support-cardinality bounds, common
provenance, and the two apex marginals alone are insufficient.

### Implementation and deletion order

1. Pin `producer_coverage_census` with deterministic counts/digests and tests;
   keep its status finite-negative.
2. Promote the frontier extraction and existing card-four/card-five/
   coincident-blocker consumers into one importable module, with no `sorry`.
3. Prove the robust-arm coupling first, because card 11 is forced into robust
   second-apex double-deletion survival; a proof only for the unique-row arm
   does not discharge the live theorem.
4. Prove the three unique-row outputs and combine them with the robust arm in
   `false_of_twoLargeCaps_commonCriticalMap`.
5. Call that theorem in `u1_largeCap_routeB_tail_false` before the f2 slot
   case tree.  Re-run reference mining; if the old pair/removability/
   two-large-cap residual chain and LIVE helper tree have no external callers,
   delete them rather than maintaining 11 dead direct sorries.  Otherwise
   leave only sorry-free compatibility wrappers.
6. Run the focused target build, refresh proof-blueprint index/refs, verify
   that K-A-PAIR and all LIVE-Q/C declarations disappear from
   `symbols --with-sorry`, then run the full publication gates.

Every proposed classifier must be regression-tested against the 930
finite exact-pair survivors, the apex-flip cycle witness, the card-four
seven-vertex falsifier, and the coincident-blocker ten-vertex falsifier.  A
candidate survives those gates only by identifying the exact live geometric
field that excludes each witness.

## 2026-07-14 T3 Adapter Checkpoint

The checked scratch T3 relabel construction is now promoted into
`Erdos9796Proof.P97.U1LargeCapRouteBTail` as
`U1LargeCapRouteBTailRelabel.false_of_center_p_t3_t20_via_pair`.  It permutes
the dangerous triple, transports the fixed packet, rows, live data, and
pairwise distinctness, and calls the existing two-large-cap consumer.  Both
ordered branches of all 12 LIVE-T3 helpers now use this adapter.  The focused
module build passes and the refreshed proof graph reports zero direct T3
sorries.  This is not K-A-PAIR closure: all T3 declarations still inherit its
`sorryAx` until the shared-radius producer is proved.
