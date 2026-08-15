# FirstNonHit retained/cyclic ingress audit v1

Date: 2026-08-13

Status: **NO-RUN / SOURCE-ENTITLEMENT HARD GATE**

No SAT/SMT process was launched. This was the mandatory source-clause and
prior-artifact audit preceding a bounded wave. It found no materially new
metric, cap, or cyclic-order clause that is both available from this anchor's
retained ingress and connected to the exact target negation. Running the
existing quotient again would therefore be a duplicate experiment.

## Active consumer

The load-bearing producer is:

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
  exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three
```

Its conclusion asks for an actual carrier source whose blocker center differs
from the canonical `Q` center and whose actual selected support overlaps the
`Q.source₁` selected support in at least three points. The immediate consumer
`false_of_freshThird_firstNonHit` passes this packet to
`false_of_centerAt_selectedFourClass_inter_card_ge_three`.

The exact equivalent producer contract is already proved by
`exists_blockedDeletionTriple_iff_exists_selectedRow_overlap_card_ge_three`:
three points of the `Q` selected support must have deletions blocked at one
distinct **actual** center. This audit used the negation of that exact packet;
it did not weaken the target to an arbitrary four-point class.

## Retained ingress audited

The retained arm of `FreshThirdAcyclicCanonicalConsumerPacket C` supplies:

- distinct first-apex radii for `C.firstSource` and `C.secondSource`;
- singleton intersections of those two radius classes with the first cap;
- one aligned deletion-core packet for each source; and
- the retained first-cap multipoint-radius packet.

The branch data additionally supplies
`FreshThirdCapSourceNonHit C.firstSource Q` and a full
`FreshThirdCapSourceInteraction C.secondSource Q`.

This is not enough to assert mutual cross-membership between the two `C`
sources, and it supplies no third incidence between an actual `C` row and the
selected support of `Q`.

## Prior quotient overlap

The strongest existing bounded source-labelled abstraction is
`freshthird_firstnonhit_global_blocker_quotient_v1`. Its source map already
contains:

- the exact `Q` blocker boundary;
- the global actual-blocker map, fiber bound, and fiber-image/support link;
- source-faithful deletion-fan clauses;
- repeated-blocker and common-same-blocker consequences;
- the retained first-apex mutual-deletion/location packet;
- exact first- and second-source interaction tags; and
- the exact negation of the desired actual-row producer.

That quotient was dual-SAT with validated readback and controls. Its minimized
survivor assigns all four `Q`-support deletions to the canonical blocker, while
the off-`Q` source rows have zero overlap with `Q`. The missing information was
already identified as an actual-row relocation / three-incidence clause.

The earlier `freshthird_firstnonhit_transport_preflight` independently reached
the same gate: the available endpoint selected row is not an actual
`H.selectedAt source` row and cannot be transported into this `C/Q` packet.

## One bounded theorem-bank preflight

Query:

```text
Under FreshThird aligned retained ingress, a retained first-apex exact four
selected class or adjacent-cap deletion-core packet yields a boundary cyclic
order or cap placement that couples it to canonical actual rows/Q, strong
enough to force three points of Q selected support in one actual selected row
```

The relevant returned declarations were:

- `retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent`;
- `firstApex_selectedFourClass_support_eq_retained_of_aligned`;
- `freshThird_acyclic_firstApex_K4Radius_eq_retained_of_aligned`;
- `freshThird_retainedExactFourTwoRadiusAdjacentCapGrid`;
- `freshThird_alignedMutualBlockerBoundaryPacket`;
- `freshThird_qRow_exact_blocker_boundary`;
- `freshThird_canonicalDifferentCap_fivePointKalmansonOrder`; and
- `freshThird_exactSupport_threeRowCyclicSeparations`.

This was one candidate-driven reuse preflight, not repeated Lean-corpus
searching during proof work.

## Candidate-clause audit

### 1. Canonical five-point Kalmanson order

`freshThird_canonicalDifferentCap_fivePointKalmansonOrder` requires a source
center distinct from the `Q` center **and both** `Q.source₁` and `Q.source₂` in
that source's actual selected row.

It is unavailable for the first-source non-hit constructors:

- `sameBlocker` contradicts the required center inequality;
- `sourceRowOmission` supplies a surviving deletion precisely by omitting one
  of the two `Q` sources, contradicting the required two memberships.

For a different-cap second-source interaction the theorem can describe the
already-known exact two-point overlap, but it does not manufacture a third
`Q`-row point.

### 2. Exact-support three-row cyclic triangle

`freshThird_exactSupport_threeRowCyclicSeparations` is a common-radius theorem,
not a retained-arm theorem. It again assumes the two `Q` memberships and exact
two-point source/`Q` overlap. Its third row is an auxiliary
`SelectedFourClass`, not an actual `H.selectedAt source` row. The deletion fan
for that auxiliary row concerns its own support and does not turn three
`Q`-support deletions into one actual blocker fiber.

Thus it cannot be added to the retained FirstNonHit quotient without either
changing the branch or assuming the desired relocation bridge.

### 3. Retained exact-four / adjacent-cap grid

The retained exact-four theorems determine the first-apex row's four named
points and their cap locations. They do not relate that row to the `Q` selected
support or identify it with an actual `H.selectedAt source` row. Encoding them
would add labels and cap membership but no clause capable of excluding the
existing zero-overlap survivor.

### 4. Aligned mutual-blocker boundary packet

`freshThird_alignedMutualBlockerBoundaryPacket` is the one materially stronger
live cyclic/cap coupling found. It produces distinct blocker-cap indices,
zero-cut boundary data, and cyclic separation for the two canonical `C` rows.
However it requires the additional antecedent

```lean
TwoCapSourcesMutualCrossMembership H C.firstSource C.secondSource
```

which is absent from the active producer's retained ingress. The source only
obtains this after a separate
`mutualCrossMembership_or_oneSidedDeletionSurvival` split in another residual.
Even in the mutual arm, the packet couples `C.firstSource` to
`C.secondSource`; it contains no third incidence with `Q` and therefore does
not exclude the prior quotient's zero-`Q`-overlap realization.

The declaration has an ordinary proof body in the inspected source. This wave
did not separately run a transitive axiom audit for it because it was rejected
at the antecedent/consumer boundary.

## Precise hard gate

The first missing source-level theorem remains an **actual-row relocation**
producer. In blocked-deletion normal form, the needed shape is:

```lean
theorem firstNonHit_retained_exists_actual_blockedDeletionTriple
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket C)
    (data : FreshThirdCapSourceNonHit C.firstSource Q)
    (secondInteraction : FreshThirdCapSourceInteraction C.secondSource Q) :
    ∃ source,
      H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
      ∃ blocked,
        blocked ⊆
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
        blocked.card = 3 ∧
        ∀ w ∈ blocked,
          ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
            (H.centerAt source.1 source.2)
```

An acceptable weaker intermediate would transport one branch of the retained
mutual/cyclic source packet to **three named `Q` deletions at the same actual
blocker**. It must preserve actual-source provenance; an existential arbitrary
selected row is insufficient.

The first missing antecedent for the best existing cyclic candidate is
`TwoCapSourcesMutualCrossMembership H C.firstSource C.secondSource`. Supplying
that antecedent alone is still insufficient: the next missing bridge is a
three-point connection from the `C` cyclic packet to `Q`'s selected support.

## Decision and scope classification

- **No new source-entitled clause:** hard gate.
- **No solver run:** therefore no SAT, UNSAT, timeout, or frozen artifact to
  interpret.
- **No universal closure:** the active Lean producer remains open.
- **No post-wave theorem mining:** there is no new wave data to mine.
- **No second Lean search:** the single preflight already isolated the concrete
  candidate and its first missing antecedent.

The earlier dual-SAT result remains only a bounded, source-labelled quotient
survivor. It is neither a P97 counterexample nor evidence that the universal
producer is false.
