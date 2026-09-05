# Erratum: B1 two-deletion consult

Date: 2026-09-04

This is the durable superseding erratum for completed Pro consult
`01M1NYCWZTSKGQKNA168CKA3V8`, whose retained response is conversation message
`#12515`. The consult record may remain completed, but its proposed
unconditional `B1CardSixTwoDeletionCrossResidual` must not be implemented or
cited as a source-clean consequence.

## Circular dependency

The response proposes obtaining a directed cross-deletion omission and then
using that omission to prove that the two deleted-source actual blockers are
distinct. Current source does not support that order:

- `exactFour_twoDeletion_crossOmission` takes `hdeletedBlockersNe` as an input;
- therefore its output cannot be used to establish that same blocker
  inequality without an independent theorem;
- the card-six producer supplies two joint-deletion packets with distinct
  deleted sources, but it does not supply injectivity of the actual-blocker map.

This was independently identified in `#12529`, `#12533`, `#12544`, `#12556`,
and `#12565`. Message `#12645` additionally validates that the downstream
survival-square packet lacks the bisector/support-incidence premise needed to
recover the missing live-pair order conclusion.

## Source-faithful replacement

The strongest currently justified split is:

1. deleted blockers equal, yielding the B1/global-transport arm; or
2. deleted blockers unequal, after which
   `exactFour_twoDeletion_crossOmission` yields a directed omission and the
   existing two-deletion machinery dispatches to its named open outcomes.

That split is already implemented in
`ATail/FrontierLiveClosure/TwoDeletion/Coordinator.lean` by
`twoDeletionOutcome_of_ingress`. It does not close B1: the equal-blocker arm
is the active global-transport branch, while the unequal-blocker arm reaches
known open terminals. Repackaging the split is not progress unless a new
source theorem supplies the missing global incidence/order information.

## Earlier order-packet correction

The earlier recommendation around `#9007` should also be read narrowly. The
minimal terminal antecedent is the one-sided
`B1WinningLiveSliceSameBoundaryArc`; the symmetric
`B1LiveSlicesSameBoundaryArc` packet is stronger and is not required for the
shared-pair contradiction. Neither packet follows from the present lossy B1
normal form or survival-square projection.

## Current status

This erratum changes no theorem status. The B1 terminal
`false_of_b1PhysicalClassFiveSixNormalForm` remains open. A valid closure must
preserve or newly prove source-level cap/bisector incidence, a winning live-pair
order witness, or an equivalent genuinely global antecedent.
