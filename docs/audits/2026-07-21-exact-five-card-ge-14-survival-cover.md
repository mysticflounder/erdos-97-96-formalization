# Exact-five card-≥14 survival-cover audit

Date: 2026-07-21

Scope: read-only/source audit of the `14 ≤ D.A.card` subbranch of

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
```

No production or shared documentation was edited.

## Result

**PROVEN BY SOURCE INSPECTION:** the exported card-≥14
`SurvivalCover` *consumer* does not advance the exact-five robust branch.  Its
robust output is already a field of `B`.  The raw producer retains a genuinely
new source-faithful third-center common-deletion packet, but no current theorem
turns that packet into first-apex co-radiality, `CriticalFiberClosingCore`, or a
complete alternative `IsM44` packet.

Therefore card ≥14 is not presently a terminal exact-five split.  Reusing
`sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer` inside the live
exact-five theorem would only create a proof cycle/redundant endpoint.

## Theorem-bank preflight

The required registries were searched before evaluating a new local producer:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were also run for card-≥14 survival covers, exact-five
second-apex common deletion, first-apex co-radiality, critical-fiber closing
cores, and alternative `IsM44` support triangles.  They returned the current
production modules and known terminal consumers, but no hidden aggregate
closer matching this input.

## Why the exported consumer merely recovers `B`

The live exact-five theorem carries

```lean
B : FrontierBiApexRobustResidual R
```

and `FrontierBiApexRobustResidual` has the field

```lean
B.secondApex_robust : FullyDeletionRobustAt D S.oppApex2
```

(`PhysicalSecondApexCommonDeletion.lean:171-176`).

The output of

```lean
sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer
```

is only

```lean
Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
  Nonempty (PhysicalSecondApexCriticalResidual D S)
```

(`SurvivalCover.lean:339-354`).  In the live exact-five context this
proposition already has the immediate proof

```lean
Or.inl ⟨B.secondApex_robust⟩
```

without using card ≥14, the survival cover, `Q`, `profile`, or `outcome`.
The critical arm would contradict `B.secondApex_robust`, but the disjunction
does not force that arm.  Hence the consumer supplies no new endpoint force.

The same issue appears in
`exactFour_or_companionCommonDeletion_or_physicalSecondApexEndpoint`
(`SurvivalCoverParentBoundary.lean:45-67`).  On its third arm, the physical
second-apex endpoint is already inhabited by `B`; the first two arms are an
exact-card-four first-apex class or another common-deletion packet, neither of
which is a terminal for the present exact-five theorem.

## What the raw card-≥14 producer really gives

On the additional directed-arm inputs

```lean
hnotFour : (SelectedClass D.A S.oppApex1 radius).card ≠ 4
hwSupport : F.pair.w ∈
  (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
hcard : 14 ≤ D.A.card
```

`exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`
produces (`SurvivalCover.lean:219-235`):

- `deleted = F.pair.q ∨ deleted = F.pair.w`;
- an actual critical source outside the known `q`-blocker fiber;
- its actual blocker `c = H.centerAt source`;
- deletion of `deleted` survives at `c`;
- `c ≠ S.oppApex2`; and
- `CommonDeletionTwoCenterPacket D H deleted c S.oppApex2`.

In the live `B` context this can be sharpened without new mathematics:

- `c ≠ S.oppApex1`, by `B.firstApex_robust.centerAt_ne H`;
- `c ≠ S.oppApex2`, already exported (and also follows from
  `B.secondApex_robust.centerAt_ne H`);
- `c ≠ H.centerAt F.pair.q F.pair.q_mem_A`, by membership outside
  `qBlockerFiber`; and
- `source.1 ≠ deleted`, since equality would contradict
  `H.no_qfree_at source.1 source.2` and the exported survival at `c`.

So the raw theorem does produce a genuinely third actual blocker and one
source-faithful common-deletion packet.  This is stronger than `B` itself.
However, it is still nonterminal.

## Why the raw packet does not feed the three requested sinks

### 1. First-apex co-radiality

The exact asymmetric terminal is

```lean
SourceTwoHitNormalForm.false_of_firstApex_coRadial
  N
  (dist S.oppApex1 N.outside₁ =
    dist S.oppApex1 N.outside₂)
```

(`ExactFiveMutualOneHitGeometry.lean:341-352`).  The survival-cover packet
does not identify its row with an asymmetric star row, does not name
`N.outside₁,N.outside₂`, and exports no first-apex distance equality.

The row at `S.oppApex2` in the packet is a selected four-subset of the unique
ambient exact-five class.  Although it has at least two strict physical-cap
points, the two-circle intersection bound allows precisely those two points to
be the overlap with the other row.  Thus the packet does not force a physical
point in the second-apex row but outside the other row; this is the already
identified missing anchored occurrence.

### 2. `CriticalFiberClosingCore`

`CriticalFiberClosingCore` requires a chosen repeated actual-blocker fiber and
then either:

- an `OrderedCrossRowCore` with the required boundary order, first-apex
  equality, and positive cross-row membership; or
- a `SameCapCollisionPairCore` with a second source-faithful equidistance
  center through the two fiber sources.

The card-≥14 packet gives one actual blocker, not a repeated blocker fiber.
It gives deletion survival at that blocker, which is negative/robust data; it
does not give either required positive cross membership or a second center
through a fixed repeated-fiber source pair.

### 3. Alternative `IsM44`

The no-`IsM44` hypothesis consumes a complete alternative
`SurplusCapPacket`: three MEC boundary vertices, the nonobtuse circumscribed
support branch, the full closed-cap partition, and exact `(m,4,4)` cap counts.
The survival-cover argument is purely a source-fiber/cardinality pigeonhole
argument.  It produces no new MEC boundary vertex, no retriangulation, and no
exact alternate cap counts.

## Exact-five “unused row” route is unavailable

One superficially promising reuse is

```lean
LargeCapUniqueFiveUnusedCriticalRow
→ LargeCapUniqueFiveTwoCommonDeletionSources.
```

It cannot be instantiated here.  Its producer

```lean
nonempty_largeCapUniqueFiveUnusedCriticalRow
```

requires

```lean
6 ≤ S.oppCap2.card
```

(`LargeCapUniqueFive.lean:227-232`), whereas `Q` supplies

```lean
S.oppCap2.card = 5
```

(`BiApexRobustCapBounds.lean:236-242`).  The “unused” source is precisely a
sixth point of the closed cap outside the exact-five radius class, so this is
not a coercion or adapter gap.

## Strongest honest uniform card-≥14 target

There is no currently proved uniform card-≥14 producer that directly feeds
one of the requested sinks.  The next useful theorem must couple the newly
chosen actual blocker row to the already named exact-five star and export a
terminal payload.  A suitable result shape is:

```lean
-- CONJECTURED: outcome-dependent details may be represented by a sum type.
theorem exactFive_card_ge_fourteen_terminalOccurrence
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (outcome : ExactFiveGlobalCoverStarOutcome Q profile)
    (hcard : 14 ≤ D.A.card) :
    Nonempty (FirstApexCoRadialExactFiveOutcome outcome) ∨
      Nonempty (CriticalFiberClosingCore R) ∨
      ∃ T : SurplusCapPacket D.A, T.IsM44
```

`FirstApexCoRadialExactFiveOutcome` is schematic: it should contain the
*existing* asymmetric normal form plus exactly the equality consumed by
`SourceTwoHitNormalForm.false_of_firstApex_coRadial`, rather than introducing
another intermediate packet.

If a smaller first milestone is desired, preserve the raw card-≥14 packet
and prove one of these source-level occurrences:

1. its actual selected row is one of the named star rows and supplies the
   relevant asymmetric outside pair;
2. its blocker fiber repeats on a named star source pair and supplies the
   exact ordered/same-cap constructor fields; or
3. its blocker lies on the MEC in a position that constructs the complete
   alternative `IsM44` packet.

Without one of those positive geometric/incidence couplings, another wrapper
around `CommonDeletionTwoCenterPacket` will not close the sorry.

## Epistemic status

- **PROVEN/source-exact:** the exported consumer is subsumed by `B`.
- **PROVEN/source-exact:** the raw producer supplies one third-center
  source-faithful common-deletion packet under `hnotFour`, `hwSupport`, and
  card ≥14.
- **PROVEN/source-exact:** the exact-five unused-row route requires a six-point
  second cap and is unavailable.
- **AUDIT RESULT:** no indexed theorem-bank consumer converts the raw packet
  to first-apex co-radiality, `CriticalFiberClosingCore`, or `IsM44`.
- **CONJECTURED:** `exactFive_card_ge_fourteen_terminalOccurrence` (or one of
  its three terminal-specific branches) is the missing aggregate theorem.
