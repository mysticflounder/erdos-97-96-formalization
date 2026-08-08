# FreshThird aligned + mutual ingress v1: origin and contract

Status: diagnostic-only structural canary.  This packet is not a proof, not a
universal closure, and not a bounded-cardinality lift.  It deliberately does
not import or reuse learned cuts from the stale `freshthird_cross_deletion_metric`
script.  The encoder below contains only the source facts listed here.

## Origin

The source is the retained branch of
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`.
The two selected rows are the rows attached to the two sources of
`TwoCapSourceThirdCanonicalRowSurface P Pρ`.

## Encoded contract

The model has two source rows (`row0`, `row1`), four endpoint labels
`P.source₁`, `P.source₂`, `Pρ.source₁`, `Pρ.source₂`, and a finite abstract
carrier used only to represent row membership.  Every item below is an
explicit Boolean/integer constraint; no geometric or metric clause is added.

1. **Exact selected-row cardinality.**  Each selected row has support cardinality
   four.  This is the `support.card = 4` field in
   `CapSourceThirdCanonicalRowWitness` in
   `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`
   (the corresponding Lean expression is
   `(H.selectedAt source.1 source.2).toCriticalFourShell.support.card = 4`).
   The negative smoke test changes one row to cardinality five and must be
   `unsat`.

2. **Self-membership.**  Each source belongs to its own selected row.  This is
   the `source.1 ∈ ...support` field of `CapSourceThirdCanonicalRowWitness`.

3. **Actual mutual cross-membership.**  `row0` contains source 1 and `row1`
   contains source 0.  This is exactly the two conjuncts of
   `TwoCapSourcesMutualCrossMembership` in
   `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean`:
   `source'.1 ∈ row(source)` and `source.1 ∈ row(source')`.  It is not an
   abstract pair-activation flag.

4. **Unequal first-apex radii.**  The two source radii are distinct.  This is
   the first conjunct of `FreshThirdAlignedRetainedConsumerPacket` and is
   produced by `freshThird_acyclic_canonical_sources_firstApex_radii_ne_of_aligned`
   in `TwoSourceFreshThirdRetainedProducer.lean`:
   `dist S.oppApex1 firstSource.1 ≠ dist S.oppApex1 secondSource.1`.

5. **Singleton first-apex slices.**  The first source's first-apex selected
   class intersected with the strict first cap is exactly its singleton, and
   likewise for the second source.  These are conjuncts two and three of
   `FreshThirdAlignedRetainedConsumerPacket`, produced by
   `firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned`:
   `SelectedClass ... (dist ... source.1) ∩ capInterior = {source.1}`.
   The model represents each slice as a finite membership predicate and enforces
   exactly one member, its owning source.

6. **One of four fixed endpoint deletion choices, per source row.**  Each row
   chooses exactly one arm `(x,y)` from
   `{P.source₁,P.source₂} × {Pρ.source₁,Pρ.source₂}`.  This is
   `FreshThirdAlignedSourceDeletionCoreCases` and its canonicalization theorem
   `freshThird_alignedSourceDeletionCorePacket_cases` in
   `TwoSourceFreshThirdRetainedProducer.lean`.

7. **Endpoint omission from the selected row.**  For the selected arm, both
   endpoints are absent from that source row.  These are the first two fields of
   `FreshThirdAlignedFixedDeletionCorePacket` (`x ∉ support` and
   `y ∉ support`).

8. **Source-row survival after double erase.**  For each row and its selected
   `(x,y)`, the row still has four members after erasing `x` and `y`.  This is
   the `HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) center` conjunct in
   `FreshThirdAlignedFixedDeletionCorePacket`.  In the structural model it is
   represented by the exact surviving support count, with no claim about
   distances.

9. **First-apex failure after double erase.**  For each selected `(x,y)`, the
   double-erased carrier fails to have four equidistant points at `S.oppApex1`.
   This is the immediately following negated `HasNEquidistantPointsAt` conjunct
   in `FreshThirdAlignedFixedDeletionCorePacket`.  The canary records the fact
   as a required Boolean; it does not invent a geometric encoding.

10. **Nonempty minimal deletion core.**  For each selected `(x,y)`, the packet
    carries `Nonempty (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
    D.A {x,y} S.oppApex1)`, the final conjunct of
    `FreshThirdAlignedFixedDeletionCorePacket`.  The canary records this as a
    required Boolean only; it does not pretend to model shell disjointness.

## Smoke-test interpretation

The positive instance is expected `sat`, showing that these structural facts
are jointly consistent in the finite abstraction.  The overfull-row instance
adds `card(row0) = 5` alongside the source contract's exact-cardinality field
and is expected `unsat`.  A solver `unknown` or timeout is a failure and is
reported fail-closed; it is never relabeled as `sat` or `unsat`.

Neither result is a universal statement, a geometric counterexample, or a
Lean theorem.  In particular, this file supplies no lift from the finite
abstract carrier to arbitrary `D.A`, and no consumer-side contradiction.
