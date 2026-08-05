# CommonDeletionTwoCenterPacket → FreshThird consumer audit (2026-08-05)

## Direct packet adapter in the FreshThird section

`FrontierLiveClosure.lean:12201-12232` contains the only FreshThird-local
constructor:

```lean
theorem nonempty_freshThird_fixedQ_commonDeletionPacket_of_alignedSurvivals
    (Q : FreshThirdBlockerFiber P Pρ)
    (q : ℝ²)
    (q_is_fresh : q = Q.source₁.1 ∨ q = Q.source₂.1)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (centers_ne :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2)
    (survives_source :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source.1 source.2))
    (survives_source' :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source'.1 source'.2)) :
    Nonempty (CommonDeletionTwoCenterPacket D H q
      (H.centerAt source.1 source.2)
      (H.centerAt source'.1 source'.2))
```

The center choices are exactly the two actual blocker centers of `source` and
`source'`; `q` is one of the two FreshThird sources.  This is only a packet
adapter.  It adds no support-incidence information about the other FreshThird
source and does not call a FreshThird terminal.

## What the packet reaches elsewhere

The source-clean packet consumer
`exists_reverseHitFresh_nonreturnEndpointClassification`
(`FrontierLiveClosure.lean:8414-8458`) packages a packet with
`O.kept`, `O.deleted`, and a fresh first-cap point into a
`RetainedMatchingTwoStepCommonDeletionWalk`, then invokes the proved
`nonempty_twoStepEndpointOutcome`.  Its output is only:

```lean
∃ W, W.first = O.kept ∧ W.second = O.deleted ∧ W.next = fresh ∧
  (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
   Nonempty (RetainedMatchingThreeDistinctBlockerPath W))
```

The subsequent endpoint/cycle consumers in `FrontierLiveClosure.lean` are
load-bearing `sorry`s (`false_of_retainedOmission_reverseHitFresh_*`), so this
does not constitute a proved FreshThird closure route.

## Smallest proved FreshThird terminal input

The smallest proved terminal input is the single alignment packet consumed by
`false_of_freshThird_sameCapCrossRowAlignment`
(`FrontierLiveClosure.lean:10998-11055`):

```lean
theorem false_of_freshThird_sameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False
```

`FreshThirdSameCapCrossRowAlignment` is one `capIndex : Fin 3` plus exactly
these fields: both the fresh blocker center and source center lie in that
closed cap; the centers differ; both FreshThird sources lie outside that cap;
and both FreshThird sources lie in the source row support.  This is the
smallest source-level output that immediately reaches a proved FreshThird
terminal, and it includes the center choices explicitly (`source` and
`Q.source₁`).  A `CommonDeletionTwoCenterPacket` does not imply this packet:
the missing hypotheses are the common-cap memberships, both off-cap facts,
and both row-support inclusions (plus center inequality).

If the alignment arm is excluded, the next proved terminal is
`false_of_two_freshThirdCrossRowHits_distinctCenters`
(`FrontierLiveClosure.lean:12744-12820`):

```lean
theorem false_of_two_freshThirdCrossRowHits_distinctCenters
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (hfirst : FreshThirdCrossRowHit P Pρ firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ secondSource Q)
    (hcentersNe :
      H.centerAt firstSource.1 firstSource.2 ≠
        H.centerAt secondSource.1 secondSource.2) :
    False
```

Its smallest input is the pair of `FreshThirdCrossRowHit`s and center
inequality; again, no `CommonDeletionTwoCenterPacket` is needed.

Each hit expands to exactly three fields:

```lean
center_source ≠ center_Q ∧
Q.source₁.1 ∈ source_row.support ∧
Q.source₂.1 ∈ source_row.support
```

Consequently, a packet adapter is insufficient to feed this terminal.  The
missing hypotheses are the two support inclusions for *both* source rows and
the inequality between their centers.  Packet fields `survives₁/survives₂`,
`row₁/row₂`, and `overlap_le_two` do not imply those inclusions.

If only one cross-row hit is available, the checked constructor
`nonempty_freshThirdCapSourceInteraction_of_noAlignment` (lines 12842-12920)
needs the complementary `¬ FreshThirdSameCapCrossRowAlignment`; it produces a
`FreshThirdCapSourceInteraction`, not a terminal.  Its
`sourceRowOmission` arm carries a deletion survivor directly, rather than
through `CommonDeletionTwoCenterPacket`.
