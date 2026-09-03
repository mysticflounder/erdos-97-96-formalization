# B1 endpoint-order negative control

Date: 2026-09-03

## Scope

`scratch/negative-controls/B1EndpointProducerFiniteCountermodel.lean` is a
finite order/incidence negative control for the card-six endpoint packet.  It
imports the production definitions of `SurplusCOMPGBank.btw`,
`separatedPair`, and `separatedPair_exchange`, but it does not construct a
`B1GlobalTransportContext` and makes no Euclidean realizability claim.

The file was initially left at the scratch root by a read-only audit subagent.
Before retention it was moved to the exact owned path above and registered in
lane `b1-endpoint-order-negative-control-20260903`.

## Checked projection

On an explicit `Fin 18` boundary order, the control proves:

- a six-point physical class covered by three disjoint pairs;
- three exact-row support sets of cardinality four;
- `separatedPair` for the deleted, `u`, and `v` pairs against their respective
  apex/blocker cuts;
- the three exchanged separation statements;
- the common blocker strictly between the deleted endpoints;
- failure of the same-boundary-arc predicate for both live pairs.

Focused Lean elaboration of the retained file passed with exit code zero and
no diagnostics.

## Interpretation

The control shows that the retained endpoint order facts are compatible with
both live pairs alternating across their respective apex/blocker cuts.  Thus
the existing blocker-between conclusion cannot produce
`B1WinningLiveSliceSameBoundaryArc` by finite order reasoning alone.

`separated_matching_unique` does not apply to the current facts: the three
separations use three different cuts.  The omitted-peer and fresh-pair packets
also provide at most one shared point between the relevant rows, so
`selectedFourClass_shared_pair_separated` cannot create a new common-cut
constraint from them.

The missing canonical-branch producer can therefore be stated as:

```lean
theorem b1_goodCanonicalEndpoint_cardArc
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (W : B1FiveSixWaveIngress C)
    (R : B1GoodCanonicalDeletionEndpointResidual C W.escape) :
    match W.cardCase with
    | .cardFive _ => B1CardFiveWinningSliceArc C
    | .cardSix _ => B1CardSixWinningSliceArc C
```

That statement is not proved by the control.  It records the additional
global cap conclusion required to feed the existing winning-slice terminal.
The present order/incidence projection demonstrates that such a theorem must
use information stronger than the endpoint residual itself.
