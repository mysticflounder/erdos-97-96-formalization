# Exact-five profile 0034 source-order adapter

Date: 2026-09-04

## Result

The theorem
`RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder`
is proved in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctProfile0034SourceAdapter`.
It connects the seven-turn profile-0034 obstruction to the live exact-five
source data.

The theorem takes:

- the exact-five normal form and its robust four-incidence packet;
- the positive fourth-prefix memberships `blocker ∈ row₀`, `O ∈ row₁`, and
  `O ∈ row₂`;
- one named point `p ∈ row₀` and one named point `s ∈ row₁`; and
- boundary witnesses placing
  `blocker,p,s,retained,deleted,oppApex2,oppApex1` at seven strictly increasing
  indices.

It derives every metric assumption of
`Profile0034.boundaryOrder_common_obstruction`. No distance equation or area
sign is left as an independent geometric premise once the membership and
boundary witnesses are supplied.

## Source transport

The row packet supplies:

```text
dist(blocker,oppApex1) = dist(blocker,retained)
dist(blocker,oppApex1) = dist(oppApex1,retained)
dist(oppApex1,retained) = dist(oppApex1,p)
dist(blocker,oppApex1) = dist(blocker,s)
dist(oppApex2,oppApex1) = dist(oppApex2,retained).
```

The deleted point is absent from the selected first row, so its equation must
come from the original exact-five class. The existing source lemmas
`retained_mem_firstApex_selectedClass` and
`deleted_mem_firstApex_selectedClass` give

```text
dist(oppApex1,retained) = dist(oppApex1,deleted).
```

The packet's injective convex boundary then turns the six strict index steps
into the seven signed-area conditions used by the geometric theorem.

## Reuse preflight

A bounded indexed search found no existing packet-level consumer with this
seven-role order. The nearest theorem,
`false_of_secondRowPoint_opposedTurns`, requires `oppApex2 ∈ row₀` and two
explicit signed-area products. The new adapter does not require that
membership and derives all seven signs from one boundary chain.

## Verification and scope

A focused `lake env lean` check exits zero. The imported geometric theorem was
compiled first because the shared build had not yet emitted its new object
file. An independent adversarial audit passed against source SHA-256
`b2b168542ef0612c007f4b1633471e0c5a84eb5fd89bd22d6882a5409f3c40f0`.
The exported theorem uses only `propext`, `Classical.choice`, and `Quot.sound`;
it has no `sorry`, native computation, unsafe declaration, or custom axiom.

This theorem closes the authenticated profile-0034 ordered cell without the
diagnostic `blocker = surplus apex` alias. It does not prove that the live
four-incidence packet always contains suitable `p,s`, or that their indices
have the required order. The first missing antecedent is now a finite
source-level point-selection and boundary-order split. Until that split covers
every applicable continuation case, the on-spine five-incidence theorem
remains open.
