# FreshThird aligned + mutual ingress v1: origin and contract

Status: diagnostic-only bounded structural canary.  This is not a proof, not
universal closure, and not a bounded-cardinality lift.  It must not be read as
an implication from a finite SAT result to arbitrary `D.A`.  The encoder does
not import or reuse learned cuts from the stale
`freshthird_cross_deletion_metric` script.

## Exact source packet

The outer source contract is the first constructor of
`FreshThirdAcyclicHardResidual` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean`:

```text
FreshThirdAlignedRetainedConsumerPacket C ∧
TwoCapSourcesMutualCrossMembership C.firstSource C.secondSource ∧
FreshThirdAlignedCommonDeletionCorePairPacket C ∧
FreshThirdAlignedMutualFirstFiberResidual C Q
```

The canary names and encodes exactly these retained structural facts:

1. `FreshThirdAlignedRetainedConsumerPacket` in
   `TwoSourceFreshThirdRetainedProducer.lean:714+` supplies unequal first-apex
   radii, two singleton first-apex slices, one source deletion-core packet for
   each source, and the proposition
   `FirstCapMultiPointRadiiRetained (S := S) (radius := radius) (ρ := ρ)`.
   The canary represents the first three by an unequal integer pair and two
   one-member predicates, represents each source packet below, and retains the
   last proposition as the required Boolean
   `firstCapMultiPointRadiiRetained`.  It does not guess what that proposition
   means geometrically.

2. `CapSourceThirdCanonicalRowWitness` in
   `TwoSourceCanonicalSurface.lean` supplies each selected row's exact
   `support.card = 4` and `source.1 ∈ support`.  These are the row-cardinality
   and self-membership constraints.

3. `TwoCapSourcesMutualCrossMembership` in
   `TwoSourceFreshThirdFiber.lean:1247+` is encoded as actual reciprocal
   membership: row 0 contains source 1 and row 1 contains source 0.  This is
   not an abstract pair-activation flag.

4. `FreshThirdAlignedSourceDeletionCoreCases` and
   `freshThird_alignedSourceDeletionCorePacket_cases` in
   `TwoSourceFreshThirdRetainedProducer.lean` provide one of the four fixed
   endpoint arms `(P.source₁/P.source₂) × (Pρ.source₁/Pρ.source₂)` for each
   source row.  The canary uses two bounded integer choices for these arms.

5. For the chosen arm, `FreshThirdAlignedFixedDeletionCorePacket` supplies
   endpoint omission, surviving `HasNEquidistantPointsAt 4` after the two
   erases, negated first-apex `HasNEquidistantPointsAt 4`, and
   `Nonempty MinimalDeletionCore`.  The canary encodes the first field as
   endpoint nonmembership, the second only as surviving selected-row count 4,
   and the latter two as required Boolean facts
   `firstApexFailure` and `minimalDeletionCoreNonempty`; no geometric clause is
   invented.

6. `FreshThirdAlignedCommonDeletionCorePairPacket` in
   `TwoSourceFreshThirdRetainedProducer.lean:566+`, produced by
   `freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission`, supplies
   one common omitted endpoint in either collision pair, with each row pairing
   it with an endpoint from the other pair.  The canary encodes only this
   existential arm relation: the two P choices agree or the two Pρ choices
   agree.  It allows the other endpoint to differ.

7. `FreshThirdAlignedEqualBlockerResidual` in
   `TwoSourceClosure.lean:1157+` supplies the exact equal-blocker fact
   `H.blockerVertex firstSource = H.blockerVertex secondSource`, an existential
   `i : Fin 3` with both blocker centers in `S.capInteriorByIndex i`, and exact
   equality of the two selected supports.  The canary represents the blocker
   equality by equal abstract blocker IDs, the common index by an integer in
   `0..2` with both membership predicates enabled, and selected-support
   equality by equality of every row-membership Boolean.

8. The equal-blocker branch of
   `freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership` in
   `TwoSourceClosure.lean:1189+` obtains the common index through
   `exists_blockerCenter_mem_capInteriorByIndex` in
   `TwoSourceFreshThirdFiber.lean:1923+` and obtains support equality through
   `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` in
   `ATail/SurvivalCover.lean:48+`.  These are the exact theorem sources for
   the two corresponding canary constraints.

9. The same equal-blocker branch carries the conditional first-cap
   consequence at `TwoSourceClosure.lean:1304+`:

   ```text
   i = S.oppIndex1 →
     selectedSupport(first) ∩ S.capByIndex S.oppIndex1 =
       {firstSource, secondSource} ∧
     AllCollisionEndpointsOmitted P Pρ firstSource secondSource
   ```

   The canary represents `S.oppIndex1` by an unconstrained index in `0..2`,
   represents the exact intersection by explicit abstract membership bits
   (`shellIntersectsFirstCap_*`), and represents
   `AllCollisionEndpointsOmitted` by endpoint omission bits tied to both row
   supports.  These constraints are guarded by
   `commonCapInteriorIndex == oppIndex1`; the common index is never globally
   forced to `oppIndex1`.  The source definition of
   The exact shell equality is produced by
   `selectedShell_inter_firstCap_eq_sourcePair` in
   `TwoSourceClosure.lean:1313+`; the source definition of
   `AllCollisionEndpointsOmitted` is
   `TwoSourceFreshThirdFiber.lean:1308+`, and its producer is
   `allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq` at
   `TwoSourceFreshThirdFiber.lean:1325+`.

The abstract carrier has labels `source0`, `source1`, `p1`, `p2`, `q1`, `q2`,
and bookkeeping labels `f0`, `f1`.  The fillers are needed to realize every
one of the 12 ordered arm pairs sharing a P or Q endpoint and the guarded
all-endpoint-omission branch while both equal supports still have four
members; they are explicitly not asserted to be geometric points.  No
distances, shell equations, collinearity, cap intersections, or other
speculative geometry are encoded outside the named conditional membership
vector.

## Deliberate omissions

There is no unconditional first-cap localization of the common blocker center:
the common index remains existential and may differ from `S.oppIndex1`.  The
only `S.capByIndex S.oppIndex1` and shell-intersection constraints are the
source-conditional implication in item 9.  There is no extra shell equality
outside that named implication.  There is also no bounded-cardinality lift, no
universal quantifier, and no consumer-side contradiction.

## Smoke interpretation

The positive unconstrained contract must be `sat`.  The overfull-row control
adds `card(row0) = 5` beside the source `card = 4` field and must be `unsat`.
The no-common-endpoint control fixes arms `(0,3)` and must be `unsat`.  The
guard-activation control forces only the diagnostic implication's antecedent
and must be `sat`, confirming that the exact two-source intersection and all
four endpoint omissions are representable.  All 12 normalized arm pairs
sharing one P or Q endpoint must remain `sat`; a normalized arm is pruned only
if its constraints are inconsistent, and none is here.  Any solver `unknown`
or timeout fails closed; it is never relabeled `sat` or `unsat`.

Every generated SMT artifact and the results file remain under this scratch
directory.  These finite statuses are diagnostics only and are not Lean
theorems.
