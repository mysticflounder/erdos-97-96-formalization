# FirstNonHit sameBlocker x sameBlocker quotient preflight

Status: **NO-GO for solver launch** (read-only audit, 2026-08-11).

## One proposed schema

Use one named-role packet `SameBlockerRetainedLanding` with roles

`q0,q1` (the two `Q` fiber endpoints), `KQ` (the selected Q row),
`c0,c1` (the two canonical source rows), `p0,p1,r0,r1` (the two retained
collision pairs), `o` (`S.oppApex1`), and optionally `s,s'` (two retained-
fiber sources).  The packet's two alternative landing contracts are:

```text
Overlap3(t,u,v,w):
  center(t) != center(q0) /\ u,v,w pairwise distinct /\
  u,v,w in KQ /\ u,v,w in Kt

RetainedCross2(s,s'):
  s != s' /\ s' in Ks /\ s in Ks' /\
  blocker(s) = blocker(s') /\
  both source witnesses, common-radius membership, all four endpoint
  omissions, blocker-cap membership, and Ks ∩ firstCap = {s,s'}.
```

The intended new ingress would be a single theorem asserting
`SameBlockerRetainedLanding -> Overlap3 / RetainedCross2`, followed by the
existing clean consumers for the two alternatives.  This is cardinality-
independent at the *role language* level: it has no `D.A.card`, fixed `n`,
cap-size, or finite-domain axiom.

## Source inventory

* `c0,c1`/`q0,q1`, same blocker and same support: `TwoSourceFreshThirdFiber.lean:1980-2054,2068-2090`; support equality is also
  `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` in
  `ATail/SurvivalCover.lean:48-58`.
* Exact-four/self membership and distinct-center `<= 2`: selected-shell
  data in `TwoSourceFreshThirdFiber.lean:2645-2675`, and
  `SelectedFourClass.inter_card_le_two` consumed at
  `TwoSourceFreshThirdResidual.lean:1180-1250`.
* Omission/deletion polarity: `CriticalPairFrontier.lean:781-790`,
  `cross_deletion_survives_iff_not_mem_selected_support`.
* The existing clean Overlap3 consumer is
  `TwoSourceFreshThirdResidual.lean:1257-1334`, ending at
  `false_of_centerAt_selectedFourClass_inter_card_ge_three`.
* The existing clean RetainedCross2 consumer is
  `TwoSourceFirstFiberCollision.lean:2930-3007`,
  `false_of_twoCapSources_sameBlockerAllEndpointOmission`; its exact
  antecedent is `FreshOutsideFirstBlockerFiber` (`BlockerMultiplicityGeometry.lean:115-155`),
  `FirstFiberCapSourceWitness` (`TwoSourceFreshThirdFiber.lean:989-1000`),
  `TwoCapSourcesMutualCrossMembership` (`TwoSourceFreshThirdFiber.lean:1247-1255`),
  and `AllCollisionEndpointsOmitted`.
* Existing common-omission data only gives
  `FreshThirdAlignedCommonDeletionCorePairPacket`,
  `TwoSourceFreshThirdRetainedProducer.lean:761-797`; it retains omission,
  survival, and minimal-deletion cores, not either landing alternative.

## Eligibility and exact missing representation

The quotient is materially new only as a *disjunctive naming proposal*; it is
not a sound universal ingress.  The Overlap3 disjunct is exactly the open
anchor `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`
(`TwoSourceFreshThirdResidual.lean:1321-1334`), so it cannot be assumed.
The RetainedCross2 disjunct is source-faithful only for the different
`FreshOutsideFirstBlockerFiber` packet.  No theorem transports normalized
`FreshThirdBlockerFiber Q` plus the two `sameBlocker` constructors into that
stronger type or supplies its common radius, full source witnesses,
all-endpoint omissions, cap-intersection equality, and retained-fiber
cross-membership.  The existing common-deletion packet does not provide this
representation.

Thus the exact missing theorem is a carrier-wide lift of the form

```lean
sameBlocker_landing_producer : live_sameBlocker_arm ->
  (Overlap3 Q || RetainedCross2)
```

with the full `RetainedCross2` fields above, or a direct `False` theorem.
Finite named roles do not supply this lift.  `freshthird_firstnonhit_fo_v1`
and `freshthird_firstnonhit_fol_v2` already encode the same Q/C same-blocker
incidence core and synthetic three-overlap/three-blocked controls; the
proposed packet would duplicate them while adding an unconnected
`FreshOutsideFirstBlockerFiber` branch.  The named/source-fan artifacts are
weaker still: selector tags and anonymous rows omit constructor equalities,
deletion survival, cap/order, and exact support overlap.

CEGAR classification: **missing hypothesis/interface**, not search failure.
No solver was launched.  An UNSAT result for this quotient would certify only
the quotient unless the missing lift is proved in Lean.  A bounded-core lift
would additionally need a fixed carrier-independent core theorem preserving
K4, deletion blocking, blocker fibers, caps/order, and metric relations; none
is present.
