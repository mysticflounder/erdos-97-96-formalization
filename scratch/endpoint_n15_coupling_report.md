# Exact-`n = 15` endpoint coupling audit

## Scope and verdict

This audits the two live `sorry` leaves in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`:

- `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`
  (`A = J`, line 8368 in the audited worktree); and
- `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core`
  (`X = C`, line 8490 in the audited worktree).

**Verdict:** exact `D.A.card = 15`, the `(6,6,6)` cap profile, the two
q-deleted-row normalizations, and the packet overlap bounds do **not** close
either leaf.  They do force useful new incidence/equality information, but
that information stops strictly before the existing five-role Kalmanson
consumers.  The first missing bridge remains a producer of one of the finite
five-point CCW placement packets (or a comparably strong metric-shadow / third
common-incidence certificate).

The live leaves themselves assume no `D.A.card = 15`; they only receive
`TriApexAllLargeContext`.  Therefore everything below is a specialization
under an additional exact-cardinality hypothesis, not a proof of the current
general leaf signatures.

## Notation and source-visible facts

Write

- `I = S.capInteriorByIndex S.oppIndex1`;
- `O = S.oppApex1`, `C = O.kept`, `M = O.deleted`, `K = C.fresh`;
- `A = H.centerAt C ...`, `B = H.centerAt M ...`;
- `J = Q.J`, `X = H.centerAt J ...`;
- `R_M = O.packet.B₁` and `R_K = C.freshPacket.B₁`;
- `Sigma_A` for the canonical shell selected at source `C`; and
- `Sigma_B` for the canonical shell selected at source `M`.

The following are source-proved inputs.

1. `ATailExactFifteenApexProfile.capByIndex_card_eq_six_of_card_eq_fifteen`
   and `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`
   (`ExactFifteenApexProfile.lean:75,99`) give the exact cap/interior sizes.
   `selectedFourClass_exactApexProfile_of_card_eq_fifteen` (`:313`) gives the
   exact `S6 or D44` classification for every selected four-class at `O`.

2. `ReverseHitFreshEndpointContext` (`FrontierLiveClosure.lean:7315`) records
   `C,M,K,B in I`, `C != M`, `K != C`, `K != M`, and
   `Sigma_B intersect cap = {C,M}`.  The structure does **not** record
   `B != K`; `CommonDeletionTwoCenterPacket` deliberately permits its deleted
   point `q` to equal `center2`.

3. `ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell`
   (`FiveCenterDeletionBoundary.lean:48`) applied to the two packet `row2`s
   gives exactly

       O.packet.B2 = Sigma_A,
       C.freshPacket.B2 = Sigma_B.

   Thus `CommonDeletionTwoCenterPacket.overlap_le_two`
   (`CommonDeletionTwoCenter.lean:46`) becomes

       card (R_M intersect Sigma_A) <= 2,
       card (R_K intersect Sigma_B) <= 2.

   These are upper bounds only.

4. `OrientedRetainedCommonDeletion` (`RetainedMatchingLargeCapConsumer.lean:203`)
   places `C,M` on the retained positive-radius class at `O`.
   `EndpointFreshFirstApexRowSource.C_mem_radius` and `J_mem_radius`
   (`RetainedMatchingEndpointContinuation.lean:105,129`) place `C,J` on that
   class.  The endpoint data alone do not put `K` on it.

## What exact exhaustion really says

The four known interior roles `C,M,K,B` do not automatically exhaust `I`:
only `C,M,K` are pairwise distinct.  Source data prove `B != C` (because
`C in Sigma_B` while the positive-radius shell omits its center) and `B != M`
(`CriticalShellSystem.blockerVertex_ne`), but do not prove `B != K`.
Consequently the immediate exact-cardinality consequence is only

    B = K  or  I = {C,M,K,B}.

This is a mathematically proved consequence of the named source fields plus
`I.card = 4`, but it is not presently packaged as a Lean declaration.
Neither alternative is contradictory: a q-deleted K4 class may be centered
at the deleted point, so `B = K` is allowed by the packet interface.

The richer information comes from the exact apex-profile split.

### S6 branch

Let `T` be the retained six-point class at `O`.  By
`ATailExactFifteenSProfileMutualClassPair.capInteriorByIndex_subset_selectedClass_of_card_eq_fifteen`
(`ExactFifteenSProfileMutualClassPair.lean:68`), `I subset T`.  By
`ATailExactFifteenApexProfile.selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six`
(`ExactFifteenApexProfile.lean:181`), all three selected supports at `O`
(`Q.row.support`, `R_M`, and `R_K`) lie in `T`.

Every four-subset of the six-set `T` meets its four-subset `I` in at least two
points.  The q-deleted rows omit their deleted points.  Since `I` contains the
three pairwise-distinct points `C,M,K`, finite exhaustion therefore gives

    C in R_M or K in R_M,
    C in R_K or M in R_K.

The critical fiber puts `C,K in Sigma_A`, and reverse localization puts
`C,M in Sigma_B`.  Hence the packet overlaps sharpen only to

    1 <= card (R_M intersect Sigma_A) <= 2,
    1 <= card (R_K intersect Sigma_B) <= 2.

They do not yield a third shared point, so neither the two-circle upper bound
nor a three-common-point center-equality theorem fires.

In this branch `K in T`, so the endpoint fiber can be packaged as a
`RetainedRadiusCollision`.  Then
`ATailRetainedCollisionCapLocalization.commonBlocker_mem_firstCapInterior_of_sources_mem`
and `commonShell_inter_firstCap_eq_sources`
(`RetainedCollisionCapLocalization.lean:308,371`) give `A in I` and
`Sigma_A intersect cap = {C,K}`.  Exact packing now yields:

- in the `A = J` leaf, `B = K` (because `J != M`, while all other possible
  collisions among `A,B,C,M,K` are source-excluded);
- in the `X = C` leaf, `A = M or B = K`.

Again neither result is contradictory.  `A = M` and `B = K` are both admitted
by the current q-deleted packet types.  These two conclusions are rigorous
finite consequences of the source-proved inputs, but are not currently named
Lean theorems.

### D44 branch

Use
`ATailExactFifteenApexProfile.twoRichClassSlices_partition_of_capInterior_card_eq_four`
(`ExactFifteenApexProfile.lean:111`) and
`selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`
(`:282`).  The retained four-class has interior slice exactly `{C,M}`; the
other rich four-class contains `K`.  Exact q-deletion then forces

    R_M = the other rich four-class,
    R_K = the retained four-class = Q.row.support.

In particular,

    K in R_M,
    R_K intersect Sigma_B = {C,M},
    R_M is disjoint from R_K.

The equality `R_K = Q.row.support` is the strongest new exact-`n=15`
incidence predicate found in this audit.  It still does not constrain the
global boundary order of `O,A,X,J,C,K`, and it is compatible with both
`A = J` and `X = C`.

These D44 consequences are derived source consequences, not currently named
or independently kernel-checked Lean declarations.

## Existing terminal consumers and the missing bridge

`EndpointFreshFiveRoleKalmanson.lean` already contains complete source proofs:

- `EndpointFreshFiveRoleKalmanson.false_of_firstCenterEqFreshSource_of_crossHit_of_placement`
  (`:251`) closes `A = J` from a `FirstCenterEqFreshSourcePlacement Q`;
- `EndpointFreshFiveRoleKalmanson.false_of_secondCenterEqFirstSource_of_crossHit_of_placement`
  (`:312`) closes `X = C` from a `SecondCenterEqFirstSourcePlacement Q`.

Each placement type has eight direct/reflected five-point CCW constructors
(`:162` and `:210`).  Exact cap membership and the row coincidences above do
not select one of those global orders.  Thus a useful promotion would expose
the exact-profile split and carry one of the following forward:

- S6: the two positive named row/shell-hit disjunctions, together with
  `A = J -> B = K` and `X = C -> (A = M or B = K)`;
- D44: `R_K = Q.row.support`, `K in R_M`, and
  `R_K intersect Sigma_B = {C,M}`.

These are incidence/equality producers, not terminal proofs.  A subsequent
producer must turn them into one of the five-role placement packets, a third
common shell point, or a banked endpoint metric shadow.

## Mandated theorem-bank audit

The registries checked were:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The three JSON inventories contain no declaration matching exact `n=15`, the
`(6,6,6)` profile, `qDeletedK4Class_support_eq_selectedShell`, or either live
endpoint equality name.  `nthdegree docs search --lean` likewise found no
external exact-`n=15` classifier that improves the local profile theorems.

Closest banked consumers, none sufficient here:

- `Problem97.U5QDeletedK4Class.inter_card_le_two`
  (`p97-rvol`, `U5GlobalIncidenceSupport.lean:345`) reproduces only the
  already-available upper bound.
- `Problem97.three_common_equidistant_centers_eq`
  (legacy `N9Geometry.lean:19096`; older general-theorem copy `:19309`)
  requires three positive common points, which the present bounds do not give.
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
  (`p97-rvol`, `U1TwoLargeCapObstruction.lean:77`) is a conditional seven-
  equality consumer and is not import-reachable from this project.
- `Problem97.strictLapPacket_nonreturn`
  (`p97-rvol`, `WitnessLapInterface.lean:133`) requires an unproduced strict
  cyclic lap.
- `Problem97.source_pushout_right` / `source_pushout_left`
  (`p97-rvol`, `U1kSourcePushout.lean:70,95`) require already-produced local
  order interfaces and do not perform the global order gluing.
- `Problem97.EndpointCertificate.Variables.false_of_endpointShadowInBank_of_metricShadow`
  (`EndpointCertificate/RowZeros/Bank.lean:542`) requires the unproduced
  endpoint-bank metric shadow.

The registry's own census conclusion (`general-n-certificate-bank-mining`,
lines 826--858) is consistent with this audit: its 296 U5 consumers, 19 U1
consumers, and endpoint bank provide consumers but no missing geometric
incidence/placement producer.

## Epistemic classification

- **Source-proved:** all explicitly named declarations above, as statements
  and proof bodies in the current source tree.  No fresh build or transitive
  axiom audit was run for this report.
- **Derived source consequence:** the S6 and D44 finite deductions displayed
  above.  They follow rigorously from source-proved fields/theorems but are not
  yet named Lean declarations, so they are not claimed as kernel-certified
  project outputs.
- **Conjecture / missing producer:** that either incidence package forces one
  of the existing five-point CCW placements (or an endpoint metric shadow).
  No such theorem was found.
- **Finite diagnostic:** none used.  No SAT/SMT result or bounded enumeration
  is being presented as proof.

No Lean file was edited and no `sorry` was added.
