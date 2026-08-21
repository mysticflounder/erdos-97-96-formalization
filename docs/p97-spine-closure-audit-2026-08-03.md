# P97 Spine Closure Audit — 2026-08-03

Audit of `proof-blueprint spine` for the publish target `Problem97.erdos97_rhs`,
with ranked recommendations for faster closure. Live truth is always
`proof-blueprint spine`; numbers below are the 2026-08-03 snapshot.

## Post-audit computational update

The v33--v35 work completed after the initial snapshot repairs the CEGAR
harness conclusion below but strengthens the mathematical diagnosis. A
source-frozen v35 canary at commit `61d11be0` authenticated all twelve hard
exact-15 `DDD` cases and the new 1,320-clause nonapex full-shell transitivity
bank. It still returned twelve `UNKNOWN` results: 186 assignments were each
metrically inconsistent, but no Boolean case was exhausted. Compared with
v34, the assignment count fell 17.3% while wall time rose 1.5%.

Accordingly, the harness is no longer the immediate blocker and the
transitivity-only CEGAR lineage is terminal. For the v35 retained-omission
cases, the first missing producer is an order-sensitive metric contradiction
or equivalent source-entitled rule for the one-inside/one-outside cap arm.
For the separate FreshThird residual, the first missing producer is reverse
selected-class incidence/common radius for its candidate-source and
mutual-blocker rows. No current general-n theorem bank supplies either bridge
directly.

The recommendation below to expose the three FreshThird arms is therefore
computational granularity only. Those arms belong to the separate five-leaf
FreshThird family, not the retained-omission eight-leaf family. They should
remain internal labels or `PARKED-SPEC`s until a producer proves a genuine
narrowing/closure; promoting them would change the FreshThird and global
frontiers, but would not literally create a ninth retained-omission leaf. Full
authentication and telemetry are recorded in
`scratch/retained-omission-e1/round5-general-cegar/V35-TRANSITIVITY-CANARY-TERMINAL.md`.

The authenticated v36 selected-row-alternation Boolean pilot then tested the
next available source-clean consumer on all twelve v35 `DDD` hard cases. Both
the `qrow` variant and the full pairwise selected-row variant remained 12/12
SAT. V37 then strengthened all twelve cases with both the banked exact
adjacent-cap singleton theorem and the hypothetical branch-localized escaping
row with at least two `Q.row` hits. They still remained 12/12 SAT. The overlap
can split one point inside and one outside the chosen adjacent cap, so the
candidate v36 producer is not terminal-strength. No full metric round should
be launched from this contract. These are negative Boolean-pilot results, not
counterexamples or leaf closures; the authenticated report is
`scratch/retained-omission-e1/round5-general-cegar/V36-SELECTED-ROW-ALTERNATION-PILOT.md`.

The mandatory post-v37 bank audit found one genuine narrowing theorem:
`selectedFourClass_outside_overlap_card_le_one`. Together with
`SelectedFourClass.inter_card_le_two`, it localizes the forced overlap exactly
to `{J, x_out}`, where `J` is the unique point inside the chosen adjacent cap
and `x_out` lies outside it. This is a proved producer/localizer, not a
terminal; no audited bank forbids the surviving mixed placement. The first
proof-engineering step is a thin live-packet adapter for that localizer, after
which only a symmetry-orbit cyclic-role census is justified. The detailed
classification is in
`scratch/retained-omission-e1/round5-general-cegar/POST-V37-GLOBAL-BANK-AND-EFFICIENCY-AUDIT.md`.

The bounded four-role census then leaves exactly two oriented alternating
classes, `A,J,B,x_out` and `A,x_out,B,J`; zero of the two is consumed by an
existing Kalmanson terminal. This exhausts the current aggregate contract and
identifies the missing statement as an endpoint/branch-specific contradiction
for those two mixed placements. See
`scratch/retained-omission-e1/round5-general-cegar/POST-V37-CYCLIC-ROLE-CENSUS.md`.

A subsequent no-obligation quantifier extraction sharpens the search contract
without changing that diagnosis.  The general bank now proves that every
nonempty proper carrier subset contains one center at which every selected
four-class escapes the subset, and consequently every positive-radius full
`SelectedClass` at that center has subset multiplicity at most three.  These
are `exists_center_all_selectedFourClass_escape_of_proper_subset` and
`exists_center_selectedClass_inter_card_le_three_of_proper_subset`.  Their
exact-six endpoint specializations are
`endpointFresh_exists_seedCenter_all_selectedRows_escape_twoShellSeed_of_sharedBlocker`
and
`endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker`;
focused axiom checks on the general bank contain only `propext`,
`Classical.choice`, and `Quot.sound`.  This is a reusable pinned-multiplicity
producer for successor finite models.  The strengthened endpoint theorem
`endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three`
also excludes the first apex and common blocker as the pinned center, since
their exposed rows already contribute four seed points on one physical shell.
It does not identify one of the remaining six seed roles or imply a cap/order
placement, so neither adjacent-cap leaf closes and the two alternating mixed
placements remain unexcluded.

The bounded v38 full-metric canary encoded this pinned multiplicity producer
with one exact-one selector and 210 guarded physical-shell caps.  Its full
formula already entails the two role exclusions above; regression checks make
both contrary assumptions separately and obtain `UNSAT`.  The single
canonical canary itself returned only `UNKNOWN` (`canceled`) at a 20-second
solver timeout, and it inherits v37's hypothetical forced producer.  Thus it
is an encoding/provenance check, not a conditional or unconditional leaf
closure, and no broad successor was launched.  Evidence is in
`scratch/retained-omission-e1/round5-general-cegar/V38-PINNED-SEED-CENTER-MULTIPLICITY-CANARY.md`.

## Spine state

- Open: 93/36005 nodes; 29 open obligations — 28 `sorry` theorems plus the
  induced `sorryAx`. All 28 sit inside `ATailFrontierLiveClosure`.
- Axiom posture: core + `Lean.trustCompiler`; 20 trusted certificate leaves
  covered by `#print axioms`.
- Spine source: 283957 lines across 36005 declarations; 675 unimported files
  (3310 symbols, 3 orphan `sorry`s) never reached by any lake import chain.

### Open-leaf families

| Family | Leaves | Anchors | Status |
|---|---|---|---|
| Rigid221 / exact-four mutual-omission cluster | 13 | 0 | Unworked backlog |
| firstApexUniqueRadius exactFive residuals | 2 | 0 | Thin support (5 closed deps each) |
| retainedOmission triApexAllLarge core | 8 | 5 | Active lane |
| TwoSourceExactCollisionRowsTerminal (FreshThird) | 5 | 1 | Blocked per 2026-08-03 audits |

Double-leverage leaves (two consumers each, so one closure removes two tree
edges):

- `false_of_exactFourMutualOmissionRigid221_minimalCore`
- `TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber`

## Bottleneck: FreshThird `normalized_remaining`

`TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
is blocked on both routes simultaneously (sources:
`scratch/freshthird-adapter-route-audit-20260803.md`,
`scratch/freshthird-current-cegar-audit-20260803.md`):

1. **Lean route.** The adapter audit found no non-circular source-clean closure
   with the current C/Q interface. The first missing producer is a common
   first-apex radius / mutual C-row incidence producer; the non-hit branches
   genuinely lack both, and the equal-center branch has equal blockers.
2. **Solver route.** The completed n=17 (6,8,6) incidence probe is SAT in all
   three arms (`firstNonHit`, `secondNonHit`, `equalCrossRowCenters`). No
   incidence-level cut can close this leaf as stated — the contradiction must
   use metric/order data. The only proposed cut (four-point Kalmanson) is
   conditional on the equal-center both-hit arm plus a cyclic order
   c < q < u < v that the FreshThird packet does not supply.
3. **Harness.** Production CEGAR runs are producing near-zero signal: v29 all
   67 unknown; v30 all 67 errors (child-contract validation); v31 3 unknown +
   2 allowlist errors with the repair canary timing out.

Round10's eleven completed DDD `unsat` artifacts do not implement the advertised
schema-10/full-multiplicity CND contract. The `ProcessPoolExecutor` workers did
not inherit the parent's monkey patches, so the retained encodings are
schema-6 cap-local worker outputs. They cover 11 of the 24 exact-15 `DDD` role
tuples. This is authenticated computational evidence, and schema-6 UNSAT is
stronger than the intended CND result within each fixed tuple, but there is no
proved symmetry bridge covering the other tuples and no exact-15-to-general-n
adapter: the live general leaves imply only `n >= 15`, not `n = 15`.
Consequently these artifacts currently promote no retained-omission leaf and,
as before, no normalized FreshThird residual.

## Recommendations, ranked by expected closure speed-up

### 1. Build the missing producers; keep solver strata computational

The SAT-in-all-arms result means the aggregate leaf cannot close at the
incidence level. Keep `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` as internal solver strata so that each can receive a
targeted metric refinement. Promote no new Lean leaf until an ordered-cap,
common-radius, or reciprocal-incidence producer makes one stratum strictly
smaller or closes it. The conditional Kalmanson cut becomes consumable for the
equal-center arm only after its cyclic-order premise is proved.

Corollary: pause further case-splitting on the FreshThird lane until a
producer lands. Splits without new producers multiply leaves without
shrinking target freedom.

On the retained-omission lane, v36 rules out selected-row alternation alone and
v37 rules out the proposed branch-localized two-hit producer even after the
banked adjacent-cap singleton theorem is imposed.  The endpoint local-geometry
audit further gives exact rational witnesses for every residual `A = J` and
`X = C` named-role order, so a role-specific placement theorem is not
source-producible from those local facts.  The next accepted theorem must use
global full-carrier/K4 data to couple an anonymous O-centered deletion row to
the exact blocker shells, and it must name its adapter to an existing
kernel-complete contradiction consumer before proof work begins.

The reusable finite-set part has now been banked as
`SelectedFourClass.exact_overlap_of_cap_singleton` in
`P97/U1CarrierInjection.lean`.  It proves that a two-point overlap with exact
singleton cap trace is `{J, x_out}` and that the outside overlap is exactly
`{x_out}`.  This is producer-only progress: the live leaf still lacks the
endpoint-specific ingress that supplies the selected full classes and the
two-hit premise, and the two admissible alternating placements remain open.

### 2. Preserve the repaired harness; spend compute only behind a new theorem

V33--v35 repaired the child-contract, tracker-admission, source-freeze,
telemetry, and spawned-worker checks. The authenticated v35 terminal result
shows that the remaining stall is mathematical, not another harness failure.
Cache normalization/reconstruction work before a future production run, but
launch that run only after its semantic contract contains a new proved
metric/order or reciprocal-incidence consequence. V37 is the bounded test of
the branch-localized two-hit proposal; its 12/12-SAT result means that proposal
must not be escalated into another full round.

### 3. Close the mirror pair with one proof

`false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2459`) and
`..._JInRightAdjacentCap_...` (`:2481`) are verbatim-identical statements
except `leftAdjacentCapByIndex` vs `rightAdjacentCapByIndex`; the docstring
calls the right leaf "the reflected placement branch". Factor a
side-parameterized core lemma — or a packet reflection involution, if one
exists {{NEEDS_RESEARCH}} — and close two leaves with one proof. Check
whether `firstCenterEqFreshSource` / `secondCenterEqFirstSource` admit the
same treatment before proving either independently {{NEEDS_RESEARCH}}.

### 4. Treat the 11 Round10 UNSATs as partial exact-15 tuple evidence

The completed artifacts
(`round10-full-multiplicity-cnd/artifacts/20260802T202236.997745Z-caplocal-pid44841/`)
are authenticated schema-6 cap-local UNSATs for 11/24 exact-15 `DDD` tuples,
not schema-10/CND results. They cannot discharge any current general leaf:
there is neither a proved symmetry reduction from 24 tuples to these 11 nor a
bridge from a fixed exact-15 tuple to a leaf quantified over `n >= 15`.
Preserve the artifacts as stronger fixed-tuple evidence, but do not promote
them through `native_decide` unless both bridges are proved and the remaining
tuple coverage is supplied.

### 5. Triage the Rigid221 cluster as a hypothesis lattice, not leaf-by-leaf

Thirteen leaves with no anchors, mostly differing by one row-count hypothesis
(`sourceRowHeavy` / `oppositeRowHeavy` / `sparseRows`, `blockerDeleted` /
`blockerV` / `blockerVRow`). Map the lattice and check whether a single
generalized row-counting bound — a widening of `CapSelectedRowCounting`,
which currently covers only the removed equal-center same-cap oppIndex1
branch — dominates several leaves at once {{NEEDS_RESEARCH}}.

### 6. Hygiene

- **Name collisions with distinct bodies (8).** Six across
  `Erdos9796Proof/P97/ATail/CrossedArmQ1G7Producer.lean` and
  `Erdos9796Proof/P97/ATail/CrossedArmSevenPointEuclideanObstruction.lean`
  (`e2/e5/e7/e8/e9Polynomial`, `false_of_q1_br_eq_bv`, `q1Polynomial`), plus
  `ExactFiveCommonShellV7.evalClauseD_binary_implication` across two support
  files. Duplicate declarations with diverging bodies are a correctness
  hazard for anything resolving by name; consolidate into one support file.
- **Orphan sorries.** The 675 unimported files carry 3 orphan `sorry`s,
  violating the no-orphan-sorry rule; archive or prune.
- **Anchor cleanup.** Five anchors point at
  `false_of_retainedOmission_triApexAllLarge_core`, several of them stale
  retarget notes. Collapse to one anchor per live lane (triApexAllLarge core;
  FreshThird residual) so the anchor list reflects the actual two-lane state.

## Sequencing

The spine is a serial conjunction of 28 leaves, so total closure time is
bounded by the two missing-producer lanes in items 1–2. The FreshThird lane
needs common-radius/reciprocal-incidence or metric-order data.  The retained-
omission endpoint lane first needs a global deletion-row/full-shell coupling;
the existing exact-15 D44 chain has no general-cardinality ingress or live
consumer, while the existing Kalmanson bank has no placement producer.  Item 3
and the Rigid221 lattice work in item 5 can shrink the leaf count in parallel.
Item 4 is evidence preservation and bridge work, not current leaf closure;
item 6 is cheap iteration hygiene.

### Producer-to-consumer composition gate

Before a proposed theorem is called a closure target, its plan entry must name
all four edges: the on-spine live source, the exact proposition produced from
that source, a checked adapter, and an existing kernel-complete `False`
consumer.  Missing source coverage makes a theorem a narrow case producer;
missing consumer reach makes it a banked but off-spine producer.  Neither is a
leaf closure, even if the theorem has stronger conclusions inside its own
hypothesis slice.

## FreshThird consumer audit update (2026-08-03)

The equal-center/noncanonical and mixed one-inside/one-outside packets were
checked against the available source-clean cap, bisector, cyclic-order, and
Kalmanson consumers.  Neither has an import-reachable terminal.  The first
missing bridge is now concrete: either derive a strict boundary/order and
shell-to-chord equality packet, or strengthen the residual with common
selected-class radius and reciprocal row membership.  Existing both-outside
cap consumers and retained-collision adapters are not type-correct here.

The live theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`; the focused reports are archived
in `scratch/freshthird-equalcenter-terminal-search-20260803.md` and
`scratch/freshthird-metric-order-consumer-search-20260803.md`.

## FreshThird cap-size/composition inventory (2026-08-03)

The bounded inventory in
`scratch/freshthird-cap-size-composition-inventory-20260803.md` gives a useful
search filter for the remaining residual.  The designated-cap requirement
`cap_card_ge_eight` removes `n = 15,16`; the only fixed-index `n = 17`
profile is `(6,8,6)`, and the fixed-index `n = 18` profiles are
`(6,9,6)`, `(7,8,6)`, and `(6,8,7)`.  These profiles determine only the
number of endpoint-fresh selector slots.  They do not provide a geometric
realization, a kernel-checked contradiction, or a universal-`n` reduction.
The `n = 17` SAT artifacts therefore remain diagnostic, and the live
normalized-remaining theorem remains open with zero closure credit.

## FreshThird profile-motif implications (2026-08-04)

The profile motifs do not justify a production Lean case enumerator or change
the closure count.  They do refine the next-producer plan:

1. Treat the persistent thin-cap stratum `m=2`, namely
   `(6+a,8,n-11-a)` for `0 <= a <= n-17`, as a uniform arbitrary-surplus
   branch, not as an `n=17` finite case.
2. Audit whether the coordinator can legally relabel the designated cap to a
   largest cap.  If so, a separate producer can use
   `c_d >= ceil((n+3)/3)` and obtain growing local slack.  If not, the `m=2`
   stratum remains present in every cap-profile case split; it may still be
   discharged by a geometric impossibility theorem or a profile-independent
   terminal rather than a dedicated `m=2` producer.
3. Use the capacity-dominant strata only to prioritize future external
   diagnostics after a source-clean producer exists; their selector counts
   are not proof hypotheses.

The live theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`.  No new `sorry`, profile split,
or solver result is promoted from this arithmetic audit.

### FreshThird index-interface boundary (2026-08-04)

The proposed largest-cap shortcut is not yet available to the coordinator.
`TwoCapSourceThirdCanonicalRowSurface` and
`CapSourceThirdCanonicalRowWitness` mention `S.oppIndex1` directly in their
cardinality and cap-interior data, and the normalized residual retains that
index through its blocker/source fields.  The existing packet redesignation
helpers do not transport this packet and residual to a new index.  Consequently
the cap-profile route must either handle the thin-cap (`m=2`) stratum directly
or separately add and verify a full FreshThird transport theorem before using a
largest-cap branch.  A profile-independent terminal remains a third route.
This audit changes sequencing only; the live theorem stays
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER` with zero closure credit.

## FreshThird bridge audit follow-up (2026-08-03)

Two independent audits checked the exact-four/cap-interior and same-cap
alignment banks against the actual `FreshThirdBlockerFiber` interface.  The
reports are `scratch/freshthird-cap-interior-bridge-audit-20260803.md` and
`scratch/freshthird-samecap-alignment-audit-20260803.md`.  They confirm that
the non-hit arms are row-local and that the noncanonical equal-center arm has
only an OR cap-membership fact.  The nearest consumers require, respectively,
both endpoints outside one cap, a `RetainedRadiusCollision` with a common
first-apex radius, distinct centers, or canonical-cap membership.  None is
derivable from the current packet, so an adapter to those consumers would be
circular.  The next productive step is a new metric/order or reciprocal-
incidence producer; further case splitting alone is not a closure route.
