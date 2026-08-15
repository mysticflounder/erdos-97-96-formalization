# Schema v10: aligned same-cap transport audit

## Scope

Read-only audit of the equal-center, noncanonical same-cap arm when the
`hingress` packet is on the `FreshThirdAlignedRetainedConsumerPacket` side.
No production theorem or generated documentation was changed.

## Consumer and its exact prerequisites

`TwoSourceCanonicalSurface.lean:490-530` contains
`false_of_commonRadius_equalCenters_noncanonicalSameCap`.  It requires a
`TwoCapSourceThirdCanonicalRowSurface C`, two membership proofs

```lean
C.firstSource.1  ∈ SelectedClass D.A S.oppApex1 commonRadius
C.secondSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius
```

plus `ApexRichClassStructure`, the interaction's
`sourceCenter_mem : centerAt ... ∈ capInteriorByIndex capIndex`,
`capIndex ≠ S.oppIndex1`, and equal centers.  The packet wrapper at
`TwoSourceCanonicalSurface.lean:536-551` only forwards
`C.firstSource_mem` and `C.secondSource_mem` from
`CommonRadiusTwoCapSourceThirdCanonicalRowSurface`.

The geometric proof first derives that both rows have the same radius and
the exact canonical-cap pair, then invokes strict cap-interior disjointness.
Thus the common-radius hypotheses are load-bearing; they are not optional
metadata.

## Only producer of the common-radius packet

`TwoSourceFreshThirdFiber.lean:785-803` gives the import-safe producer

```lean
exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained
  (P := P) (Pρ := Pρ) (T := T)
  C.cap_card_ge_eight hnotRetained
```

where `hnotRetained : ¬ FirstCapMultiPointRadiiRetained ...`.  It packages a
radius with `commonRadius_card : 2 ≤ (...) .card`, both radius inequalities,
and the two source memberships.  Destructuring the resulting `Nonempty`
followed by

```lean
false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
  (P := P) (Pρ := Pρ) Cρ T.oppApex1_rich
  sourceCenter_mem hcapIndex hcenters
```

is the smallest transport for this consumer, but it is available only on the
`Or.inr` (non-retained) branch.

## Why the aligned branch cannot construct `Cρ`

`TwoSourceFreshThirdRetainedProducer.lean:465-487` defines
`FreshThirdAlignedRetainedConsumerPacket`.  Its first three conjuncts are:

* the two source first-apex radii are unequal;
* each source's canonical-cap selected-class slice is exactly its singleton;
* the cross-retained endpoint/deletion payload.

The common-radius wrapper instead requires a *single* radius whose canonical
cap slice has cardinality at least two (`commonRadius_card`) and whose radius
is distinct from both retained radii.  The aligned packet supplies neither
fact; its singleton equations actively rule out the needed `≥ 2` witness for
the two source radii.  Setting `commonRadius` to either source distance would
therefore fail the cardinality field, and no other radius is present in the
packet.  The equal-center equation and a noncanonical cap membership do not
create a missing common-radius witness.

The indexed theorem-bank search found no aligned-side theorem that converts
these singleton slices into a `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`
or directly applies the common-radius consumer.  The nearby
`false_of_freshThirdEqualCenter_sameCapOppIndex` theorem
(`TwoSourceFreshThirdFiber.lean:2085-2200`) handles the *canonical* cap
(`capIndex = S.oppIndex1`), so it does not discharge this noncanonical arm.

## Verdict / smallest safe interface change

There is no import-safe transport from
`FreshThirdAlignedRetainedConsumerPacket C` to `CommonRadius...` and no direct
application of `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet`
under `Or.inl`.  Preserve the full disjunction:

* `Or.inr`: use the producer above, then the packet consumer;
* `Or.inl`: add a separate aligned-side consumer whose hypotheses explicitly
  use the singleton slice equations and the endpoint/deletion payload (or add
  a new source-level bridge proving a contradiction from those data and the
  noncanonical interaction).

Any proof that fabricates a common radius on the aligned side is missing the
first antecedent not present in the ingress contract and is not a valid
transport.
