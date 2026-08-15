# FirstNonHit endpoint-transport preflight

Date: 2026-08-11

## Verdict

**NO-RUN / INELIGIBLE.** No solver was launched. The current source interface
does not provide a new clause that can connect an endpoint-selected row to the
live `firstNonHit`/`secondInteraction` packet. A new FOL, QF_LIA, metric, or
Kalmanson wave would therefore duplicate the existing diagnostic waves and
would not have a cardinality-independent Lean ingress.

## Exact source map

The live anchor is
`TwoSourceExactCollisionRowsTerminal.exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`.
Its inputs are:

* `C : TwoCapSourceThirdCanonicalRowSurface P Pρ`;
* `Q : FreshThirdBlockerFiber P Pρ`;
* `hingress : FreshThirdAcyclicCanonicalConsumerPacket C`;
* `data : FreshThirdCapSourceNonHit C.firstSource Q`;
* `secondInteraction : FreshThirdCapSourceInteraction C.secondSource Q`.

The intended producer is exactly:

```lean
∃ source, H.centerAt source.1 source.2 ≠
    H.centerAt Q.source₁.1 Q.source₁.2 ∧
  3 ≤ ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card
```

The clean consumer is
`false_of_centerAt_selectedFourClass_inter_card_ge_three`. The existing
`selectedRow_inter_card_ge_three_of_blocked_deletions` can consume a source
row only after a source theorem supplies three distinct Q-row points that are
all blocked at that source center. Neither `data` nor `secondInteraction`
supplies those points.

There is a nearby source-clean endpoint theorem,
`freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_freshShell`.
It supplies an order-selected endpoint row, its `qOutside/qBetween` identity,
and two points outside the fresh shell. It does not transport that row into
the current `C/Q` packet, does not supply three Q-row incidences, and does not
provide the required distinct-center overlap. Its type is therefore not an
ingress for this anchor.

## Candidate cardinality-independent schema

If a source producer is first proved, the solver should use a finite **role
quotient**, not a finite carrier cardinality. The proposed source-facing
contract is:

```lean
theorem firstNonHit_endpoint_transport_or_overlap_or_false
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (h : FreshThirdAcyclicCanonicalConsumerPacket C)
    (d : FreshThirdCapSourceNonHit C.firstSource Q)
    (i : FreshThirdCapSourceInteraction C.secondSource Q) :
  DirectFalse C Q ∨
  (∃ B : BoundaryIndexing D.A,
     EndpointRowAt B Q ∧
       (∃ source, centerNe source Q ∧
          ∃ W ⊆ QRowSupport, 3 ≤ W.card ∧
            ∀ w ∈ W, deletionBlockedAt w source)) ∨
  (∃ source, centerNe source Q ∧ 3 ≤ card (sourceRow ∩ QRowSupport))
```

This is a *contract*, not an assumption to encode. A production run is
eligible only after source-clean lemmas establish every encoded field:
endpoint identity (`qOutside`/`qBetween`), physical boundary injection and
order, cap membership, selected-row support equality, deletion survival, and
the universal alias/role partition. There is no `n ≤ N` or fixed number of
anonymous carrier slots. A finite certificate would then prove only the
finite role disjunction; a separate Lean theorem must lift that disjunction to
the universal source contract.

Preferred landing is the final overlap disjunct, consumed immediately by
`false_of_centerAt_selectedFourClass_inter_card_ge_three`. A metric/order
disjunct is eligible only if it lands in an already clean Kalmanson or
two-center consumer with explicit physical representatives.

## Duplicate/ineligible prior waves

* `scratch/p97-consumer-first/freshthird_firstnonhit_fo_v1`: base abstraction
  is SAT; the three-overlap and three-blocked-deletion UNSAT files validate the
  consumer only. It has no endpoint transport or cap-order clause.
* The 128 source-labelled QF_LIA slices: SAT after omitting endpoint-row links,
  constructor equalities, deletion survival, cap membership/order, and exact
  overlap fields. Enlarging this wave repeats the same quotient.
* Exact metric/Kalmanson CEGAR: fixed representative/branch encodings obtain
  metric UNSAT or timeout/unknown, but rely on anonymous slots, fixed alias
  partitions, and no source-to-physical universal lift.
* Rank/Kalmanson probes: no source-entitled boundary/order map and therefore no
  clean consumer ingress.

The missing ingredient is a source-level row-relocation/endpoint-transport
theorem (or a direct contradiction) that supplies the contract above. Until
that theorem lands, solver output cannot close the FirstNonHit `sorry`.
