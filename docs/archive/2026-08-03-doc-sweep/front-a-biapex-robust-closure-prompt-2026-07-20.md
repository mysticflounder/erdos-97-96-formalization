# Exact-five global-cover-star closure

Prove the current live theorem:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (outcome : ExactFiveGlobalCoverStarOutcome Q profile) :
    False
```

## Exact checked reduction

The fixed `H`, full `F/R/B/Q/profile`, global K4, minimality, no-`IsM44`,
bi-apex deletion robustness, and retained parent rows are available.  The
strict physical second-cap set has exactly three points.

`ATail/ExactFiveGlobalCrossDeletionPair.lean` proves that the global-cover
graph on the three physical vertices has at least two incident edges.  The
live `outcome` has exactly these constructors:

```lean
ExactFiveGlobalCoverStarOutcome.allRowsOneHit star hall
ExactFiveGlobalCoverStarOutcome.spoke₁TwoHit star normal
ExactFiveGlobalCoverStarOutcome.spoke₂TwoHit star normal
```

The star consists of a hub and two spokes.  Each hub-spoke pair has a
carrier-wide singleton-deletion K4 cover.  The hub's actual critical support
meets the physical set only at the hub.  In either two-hit constructor,
`normal` is `SourceTwoHitNormalForm` for the globally covered spoke-hub pair;
the cover is not lost through reorientation.

Thus there are exactly two mathematical outcomes:

1. **Asymmetric.** A mutual pair has a two-hit row.  Its blocker is the other
   endpoint; its physical-cap intersection is exactly the source and the
   third physical point; and its remaining support is a named two-point pair
   outside the closed physical cap.  If that outside pair is co-radial from
   `S.oppApex1`, the existing theorem
   `SourceTwoHitNormalForm.false_of_firstApex_coRadial` gives `False`.
2. **Fully symmetric.** The complete `star` and
   `AllPhysicalActualCriticalRowsOneHit H profile` are retained:
   every physical actual-critical row meets the physical set only at its own
   source.  Hence every two distinct physical sources mutually omit one
   another, their three actual blocker centers are pairwise distinct, and
   each exact shell has exactly three support points outside the physical
   three-set.

## Completed leaf

Do not spend effort on the exact-card-13, same-first-apex-radius asymmetric
cell.  Scratch Lean now proves both spoke orientations through the actual
parent data:

```lean
false_of_exactFive_card13_sameRadius_spoke₁
false_of_exactFive_card13_sameRadius_spoke₂
```

The proof constructs the canonical role/table/cover objects, proves all 1,899
finite source assertions, and reaches a verified LRAT contradiction.  Its
warning-as-error axiom audit has no `sorryAx`.

The exact-card-13 `allRowsOneHit` surface is also no longer a mathematical
search target.  Three deterministic aggregate ordinal-rank CNFs cover the
left-, middle-, and right-hub orbits; CaDiCaL returns `UNSAT` for all three and
independent DRAT replay verifies each exact proof. A 7,256-assertion source
core has now been rebuilt in all three original boundary frames, and each exact
Lean-emitted CNF has a dependency-sliced multipart LRAT endpoint accepted by
the authoritative Lean 4.27 kernel with no `sorryAx`. The source-semantic
ingress and all 7,256 generated adapters are complete in every orbit. All 342
source chunks and the left/middle/right closures rebuild warning-clean against
the current certificate chain, and the combined import has no `sorryAx`.
`false_of_exactFive_card13_allRowsOneHit` dispatches the exact source-orbit
constructor to those endpoints. Together with the two asymmetric terminals,
`false_of_exactFive_card13_sameRadius` closes the entire exact-card-13
same-first-apex-radius outcome. None of these cases should be re-solved here.

The cap-six `LargeCapUniqueFiveLowHit` / common-deletion normal form is not
available: it requires `6 ≤ S.oppCap2.card`, while this branch has
`S.oppCap2.card = 5`.

The source-clean cardinality dispatcher proves `13 ≤ D.A.card`.  Card 13 is
exactly the `(5,6,5)` cap profile.  Card at least 14 splits as

```text
7 ≤ S.oppCap1.card  OR  6 ≤ S.surplusCap.card.
```

The existing card-at-least-14 survival-cover consumer can return the already
held second-apex robustness, so it is not a terminal for either mode.

## Required result

Derive `False` from exactly the theorem inputs above.  New mathematical work
must cover only the distinct-first-apex-radius asymmetric cell and the
higher-cardinality cells. The exact-card-13 all-one and same-radius outcomes
are closed scratch proof work and should not be re-solved geometrically. It is
enough to prove the
corresponding unsolved portion of the following source-level implication:

```text
asymmetric normal form
  + its aligned global-cover star and the full F/R/B/Q/profile parent
  -> its named outside pair is co-radial from S.oppApex1
     OR a genuine alternative IsM44 SurplusCapPacket;

14 <= D.A.card
  + any of the three global-cover-star outcomes
  + the full F/R/B/Q/profile parent
  -> False directly, a terminal co-radial/closing-core occurrence,
     OR a genuine alternative IsM44 SurplusCapPacket.
```

The first co-radial output feeds
`SourceTwoHitNormalForm.false_of_firstApex_coRadial`.  The packet output
contradicts `R.noM44`.

The star is not terminal: each covered edge gives only negative support
incidence.  An exact 13-vertex critical-hypergraph model satisfies criticality,
strong connectivity, all-one-hit, and a global-cover star while having no
nontrivial blocker fiber.  It is not Euclidean/MEC data.  A successful proof
must therefore make the convex/MEC packet or `R.noM44` load-bearing; do not
attempt another pure incidence or connectivity conversion.

Do not re-prove the parent-row bridge, the all-reverse split, or the
double-two-hit classifier: all are already kernel-checked in
`ATail/ParentExactFiveSecondCap.lean`, and the all-reverse arm is impossible.

## Rigor requirements

- Use the fixed `H`; do not silently reassign blockers.  If a different
  critical system is chosen, justify the quantifier change and transport the
  complete `F/R/B/Q` parent contract.
- Keep complete radius classes distinct from selected four-point supports.
- Do not assume genericity, distinct radii, distinct blockers, or unproved
  MEC-boundary membership.
- Every constructed row or packet must be the exact antecedent of a named
  existing consumer, or be consumed immediately.
- Label claims `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`.
- If closure fails, report only the first missing source-level implication,
  the exact parent fields it uses, and the named terminal it would feed.
