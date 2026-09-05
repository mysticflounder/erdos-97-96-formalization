# Consult 01M1Q5BWVM0TS95PTS8211GC57

## Target

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
  false_of_crossBlockerCoincidence
```

Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`.

## Verdict

There is **no current source-clean, acyclic proof of this theorem from its existing signature**. The hole is not a missing import or a polarity rewrite. The twelve products

```text
4 CrossBlockerCoincidence arms
×
3 GeometricMultiplicityResidual arms
```

are locally compatible with the retained row and blocker data. A valid proof must use a genuinely global invariant—minimality/all-blockers choice, no-`IsM44`, cap localization/counting, or a source-proven cyclic-order/deletion packet. The current upstream theorem bank does not supply that final implication.

This does **not** prove the full theorem false. It identifies the exact point where all currently checked local routes stop.

## What the four cross equalities actually give

For example,

```lean
H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁
```

identifies the actual blocker chosen for `P.source₁` with the point `Pρ.source₁`. It does not put `Pρ.source₁` in its own selected row and does not put either retained pair into the other retained row.

The source-clean consequence is the corresponding omission:

```lean
Pρ.source₁ ∉
  (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support
```

obtained by transporting `CriticalFourShell.center_not_mem_support` along the equality. The other three equality arms give the three symmetric omissions.

A useful low-level helper is therefore:

```lean
lemma crossBlockerCoincidence_corresponding_omission
    (h : CrossBlockerCoincidence P Pρ) :
    -- one of the four equality-indexed omissions, retaining its arm tag
```

This is only normalization; it is not a contradiction.

## Why the positive cross-hit route is unavailable

The exact cap traces are

```lean
SelectedClass D.A S.oppApex1 radius ∩
    S.capInteriorByIndex S.oppIndex1 = {P.source₁, P.source₂}

SelectedClass D.A S.oppApex1 ρ ∩
    S.capInteriorByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂}
```

and the two pairs are disjoint. Consequently, a retained source from one pair cannot be a strict-first-cap member of the other retained selected row. This rules out the four positive `CollisionCrossHit P Pρ` alternatives; it does not derive one.

Hence the checked dichotomy

```lean
Problem97.ATailBlockerMultiplicityGeometry.
  collisionCrossHit_or_geometricMultiplicity
```

cannot close this branch: `hresidual` is precisely the non-cross-hit side, and the cross-coincidence equalities reinforce omissions rather than creating hits.

## Why the two-deletion cycle theorem does not apply

The localized packets

```lean
LPρ / MPρ
LP  / MP
```

are source-return common-deletion and **mutual-omission** packets. The source-clean theorem

```lean
false_of_exactFour_twoDeletion_blockerTwoCycle
```

requires the two deleted sources to occur positively in one another's selected rows, together with blocker inequalities. Those positive cross-memberships are opposite to the omission data retained by `MPρ` and `MP`.

The superficially closer theorem

```lean
false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
```

is downstream in `TwoDeletionCollision`, is itself sorry-dependent, and would create the forbidden dependency cycle. It is not usable here.

## Exact existing upstream tools

The following checked interfaces are useful, but none alone yields `False`:

1. `CriticalFourShell.center_not_mem_support` — converts each cross-blocker equality into its corresponding row omission.
2. `Problem97.ATailBlockerMultiplicityGeometry.collisionCrossHit_or_geometricMultiplicity` — the exhaustive cross-hit versus three-way multiplicity split already consumed by the caller.
3. `Problem97.ATailLocalizedCollisionMutualOmissionCycle.nonempty_localizedCollisionMutualOmissionCycle` — packages the two chosen-source omission cycle and common-deletion data; it is a producer, not a terminal.
4. `Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` — gives the at-most-two same-cap bound once a selected row's center is known to lie in that cap.
5. The source-clean `FirstFiberOverlapDescent` interfaces — in the `FreshOutsideFirstBlockerFiber` arm they reduce the outside-fiber witness to omission/five-center-deletion residuals. `FreshOutsideSecondBlockerFiber.toSwappedFirst` gives the symmetric reduction. Neither reduction has an upstream source-clean `False` consumer.
6. The `TwoCollisionGlobalProducer` and `FiveCenterDeletionBoundary` interfaces — they add source and deletion packets, but still stop at residual/escape outcomes rather than a contradiction.

## Residual-by-residual boundary

### 1. `FreshThirdBlockerFiber`

This supplies two fresh sources with one common fresh blocker, mutual membership in the two fresh-source rows, and inequality from the two retained blockers.

The cap-row bound can close only after proving both:

```lean
freshBlocker ∈ S.capByIndex i
```

and at least three distinct sources in that same cap whose actual blocker is `freshBlocker`. The packet supplies two fresh sources. A cross-blocker equality concerns a retained blocker equaling a retained source point; it does not supply a third source sharing the **fresh** blocker. The missing fact is therefore a global blocker-fiber/cap-incidence producer, not an equality rewrite.

### 2. `FreshOutsideFirstBlockerFiber`

The fresh source shares the first retained blocker, while the row's two off-cap points are identified. The overlap-descent machinery can produce a five-center deletion or omission continuation. It does not prove the required cyclic order, third overlap, or minimality contradiction.

The first missing premise is a source-proven global continuation tying that five-center packet to either:

- a three-source same-cap blocker fiber, or
- a boundary-indexed exact-row/deletion-order terminal.

### 3. `FreshOutsideSecondBlockerFiber`

This is the exact symmetric case via `toSwappedFirst`, with the same missing global continuation.

## Sound proof decomposition

A faithful implementation should not create twelve independent opaque leaves. First retain the dependent arm tags:

```lean
inductive CrossCoincidenceArm
  | firstBlocker_eq_ρ1
  | firstBlocker_eq_ρ2
  | secondBlocker_eq_1
  | secondBlocker_eq_2

inductive MultiplicityArm
  | freshThird
  | outsideFirst
  | outsideSecond

structure CrossBlockerMultiplicityCase (P) (Pρ) where
  coincidenceArm : CrossCoincidenceArm
  multiplicityArm : MultiplicityArm
  coincidenceProof : -- exact equality selected by coincidenceArm
  multiplicityWitness : -- exact packet selected by multiplicityArm
```

The present theorem can mechanically construct this case. The new mathematics must be one global theorem consuming the full case plus `T`, `LPρ/MPρ`, and `LP/MP`:

```lean
theorem crossBlockerMultiplicity_globalContinuation
    (Case : CrossBlockerMultiplicityCase P Pρ)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    GlobalCrossBlockerTerminal P Pρ Case
```

`GlobalCrossBlockerTerminal` must be a proof-relevant sum whose constructors already feed checked terminals, for example:

1. a cap-localized blocker fiber containing three named distinct sources, contradicted by `selectedFourClass_inter_capByIndex_card_le_two`;
2. a source-proven six-center boundary/deletion-order packet carrying the exact rows and source identities needed by an existing cyclic-order terminal; or
3. an intrinsic common-blocker/mutual-omission terminal selected from the all-blockers relation before committing to the current chosen blocker map.

It must not merely restate `hcoincidence`, `hresidual`, or an unnamed “third row.”

## Recommended route: bypass the choice-dependent H1 split

The highest-leverage acyclic refactor is to move the caller earlier and use the global all-blockers relation before choosing the fixed `CriticalShellSystem` section:

1. choose two fresh strict-first-cap sources from the all-blockers relation;
2. split their first-apex radii into common-radius or aligned-singleton modes;
3. split their eligible blocker sets into common-blocker or mutual-omission modes;
4. obtain the four intrinsic terminals `CR-CB`, `CR-MO`, `AR-CB`, and `AR-MO`;
5. prove the two genuine terminal families: common canonical blocker and mutual omission/deletion square.

This bypasses `CrossBlockerCoincidence` without claiming its equalities are impossible. It also avoids importing `TwoSourceClosure` or `TwoSourceRetainedMinimalCore` backward.

If the current theorem must remain on the spine, the same intrinsic all-blockers packet must be added as an explicit premise or produced immediately above it. The existing signature, which exposes only one preselected blocker per source, does not contain enough positive incidence to recover that packet.

## Final classification

```text
Mechanical 12-way expansion:                         source-clean
Equality -> corresponding omission:                 source-clean
Positive CollisionCrossHit from equality:           impossible from current data
FreshOutside overlap/five-center normalization:      source-clean producer only
Two-deletion blocker-cycle terminal:                 signature mismatch
Downstream blocker-coincidence terminal:             cyclic and sorry-dependent
Current false_of_crossBlockerCoincidence:             genuinely open
Required new input:                                  global all-blockers/cap/order incidence
Preferred architecture:                              intrinsic fresh-source bypass
```

No Lean source edit is justified until the global continuation or intrinsic all-blockers producer is proved. A wrapper around the twelve cases would only rename the existing hole.
