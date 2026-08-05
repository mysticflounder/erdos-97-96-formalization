# FreshThird cap-specialization audit (2026-08-03)

## Conclusion

No existing **source-clean** contradiction consumes the remaining normalized
FreshThird branches.  The only direct normalized consumer,
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`FrontierLiveClosure.lean:11324-11331`), is still `by sorry`.  The surrounding
`...normalized_residual`, `...residual`, `...core`, and cap-source adapters are
wrappers around that leaf, so they are not transitively source-clean.

The residual interface is (`:11280-11300`):

```lean
inductive FreshThirdNormalizedResidualRemainingCase (C) (Q) : Prop where
| firstNonHit (data : FreshThirdCapSourceNonHit ... C.firstSource Q)
    (secondInteraction : FreshThirdCapSourceInteraction ... C.secondSource Q)
| secondNonHit (firstInteraction : FreshThirdCapSourceInteraction ... C.firstSource Q)
    (data : FreshThirdCapSourceNonHit ... C.secondSource Q)
| equalCrossRowCenters
    (firstHit secondHit : FreshThirdCrossRowHit ...)
    (centers_eq : center C.firstSource = center C.secondSource)
    (firstInteraction secondInteraction : FreshThirdNonCanonicalInteraction ...)
```

## Existing source-clean terminals and blockers

* `false_of_freshThird_sameCapCrossRowAlignment`
  (`:9411-9417`):
  ```lean
  (Q : FreshThirdBlockerFiber P Pρ)
  (source : CarrierVertex D.A)
  (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) : False
  ```
  This is the already-excluded alignment where both fresh sources are outside
  one common cap.  A `firstNonHit`/`secondNonHit` packet is instead
  `sameBlocker` or `sourceRowOmission` (`:10462-10482`), and the noncanonical
  same-cap constructor has one fresh source **inside** its cap plus
  `capIndex ≠ oppIndex1` (`:10557-10580`); neither supplies `halign`.

* `false_of_two_freshThirdCrossRowHits_distinctCenters`
  (`:10992-11000`):
  ```lean
  (Q : FreshThirdBlockerFiber P Pρ)
  (firstSource secondSource : CarrierVertex D.A)
  (hfirst hsecond : FreshThirdCrossRowHit ...)
  (hcentersNe : center firstSource ≠ center secondSource) : False
  ```
  It only closes the three-center arm.  The remaining equal-center constructor
  has the opposite equality `centers_eq`, so this theorem cannot apply; non-hit
  constructors do not provide both hits.

* `false_of_freshThirdEqualCenter_sameCapOppIndex`
  (`:10759-10780`):
  ```lean
  (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
  (Q : FreshThirdBlockerFiber P Pρ)
  (hfirst hsecond : FreshThirdCrossRowHit ...)
  (hcenters : center C.firstSource = center C.secondSource)
  (source₁_mem source₂_mem : sourceᵢ ∈ first-row.support)
  (capIndex : Fin 3)
  (sourceCenter_mem : center C.firstSource ∈ capInteriorByIndex capIndex)
  (fiberSource_mem_cap : Q.source₁ ∈ capByIndex capIndex ∨ Q.source₂ ∈ capByIndex capIndex)
  (hcapIndex : capIndex = S.oppIndex1) : False
  ```
  This closes only the canonical equal-center/same-cap case.  The residual
  `FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource` carries
  `hcapIndex : capIndex ≠ S.oppIndex1`; the theorem's final equality premise is
  therefore exactly negated.  The distinct-cap constructor is likewise not a
  canonical `oppIndex1` arm.

* `false_of_equalBlockers_complementaryMembership` (`:9841-9879`; used at
  `:10914-10918`) is source-clean, but requires two `FirstFiberCapSourceWitness`
  rows, mutual collision-pair membership, equal actual blockers, and
  complementary membership of both collision pairs.  FreshThird's equal-center
  packet gives overlap of the two selected supports on `{Q.source₁,Q.source₂}`,
  not those collision-pair hypotheses; non-hit branches provide none of them.

## Non-hit normalization is not a contradiction

`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit`
(`:10491-10508`) merely maps an interaction plus `¬ FreshThirdCrossRowHit` to
`FreshThirdCapSourceNonHit`; its constructors are `sameBlocker` and
`sourceRowOmission`, with no `False` result.  Thus it cannot discharge either
`firstNonHit` or `secondNonHit`.

The source-clean constructor-specific wrapper
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(`:11337-11345`) immediately delegates all non-hit and noncanonical same-cap
cases to the sorry leaf (`:11360-11517`).  Consequently there is no sound
existing theorem to specialize to these residual branches; the missing bridge
is a new deletion/non-hit contradiction and/or a proof that noncanonical same-cap
forces the canonical `oppIndex1` cap, not an adapter to a current terminal.
