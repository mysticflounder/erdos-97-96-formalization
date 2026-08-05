# Critical-fiber producer/consumer trace (2026-08-05)

## Scope and status

This is a source audit only; no production Lean file was edited.  The
`CriticalFiberClosingCore` module is a checked terminal contract, not a
producer module.  Its only load-bearing open point in the current FreshThird
spine is the normalized residual theorem at
`FrontierLiveClosure.lean:12819-12826`.

## Core contract and checked consumers

* `CriticalFiberClosingCore.lean:117-152` defines `OrderedCrossRowCore`.  A
  producer must supply `C,K`, fiber orientation, a second row source `J`,
  `J_mem_A`, a convex six-point boundary with indices and order
  `O < A < X < J < C < K`, all six boundary labels, the robust equality
  `dist O J = dist O C`, and `K` in the exact `J` shell.
* `CriticalFiberClosingCore.lean:154-198` is source-clean
  `OrderedCrossRowCore.false`; it is a Kalmanson contradiction and does not
  construct a core.
* `CriticalFiberClosingCore.lean:204-216` defines
  `HasSourceFaithfulSecondCenter`; `:219-240` defines
  `SameCapCollisionPairCore` (same cap for the common blocker and a distinct
  second center, both `C,K` outside, plus the source-faithful packet).
  `:242-258` proves the second-center equidistance, and `:260-308` is the
  source-clean cap-uniqueness contradiction.
* `CriticalFiberClosingCore.lean:317-339` defines the sum type
  `CriticalFiberClosingCore := ordered | sameCap` and its false eliminator.
  A repository-wide symbol search found no source-clean construction of this
  inductive and no caller of `false_of_criticalFiberClosingCore`.

The live source-clean ordered consumer is
`FrontierLiveClosure.lean:8547-8589`,
`false_of_endpointFreshCrossHit_of_orderedPlacement`.  It literally builds an
`OrderedCrossRowCore` from an `EndpointFreshOrderedCrossRowPlacement` and a
`K_mem_J_shell` proof, then calls `.false`; the robust equality is already
obtained from the two row shell equalities (`:8586-8588`).  Thus this adapter
is complete once a producer supplies the six-index placement and shell hit.

`RetainedCollisionCapLocalization.lean` has no inductive-core producer.  It
constructs local `SameCapCollisionPairCore` packets at `:139-151` and
`:291-304`, immediately consuming `.false`; the remaining theorems
(`:92-113`, `:153-170`, `:172-264`, `:306-412`) are cardinality, source-row
center, or first-cap localization lemmas, not constructors for the global
core.  `RetainedCollisionDifferentPairConsumer.lean:13-17` explicitly marks
itself `COMPAT-ONLY/BANK`; its source-clean producers and sibling ordered
consumers (`:81-111`, `:113-320`) are unimported and do not construct
`OrderedCrossRowCore`.

Import-only references do not add consumers: `U1LargeCapRouteBTail.lean:32`
and `RetainedMatchingEndpointContinuation.lean:7` import the core, but a
symbol search finds no core constructor or false-eliminator call in their
bodies.  `RetainedCollisionCapLocalization` is imported by endpoint
localization modules, but only its own local same-cap consumers are used.

## FreshThird residual boundary

`FrontierLiveClosure.lean:12775-12795` defines
`FreshThirdNormalizedResidualRemainingCase`: first non-hit, second non-hit,
or both cross-row hits with equal centers and two non-canonical interactions.
The distinct-three-center branch is already closed by the checked theorem at
`:12799-12810`.  The first unresolved leaf is exactly
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` at
`:12819-12826` (the body is `sorry`).  The coordinator at `:12828-13012`
normalizes the residual and delegates surviving branches to that leaf.

## Smallest missing bridge

The surviving FreshThird same-cap interaction is intentionally too weak for
the existing same-cap core.  Its constructor (`FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource`, currently
`FrontierLiveClosure.lean:11910-11932`) gives distinct centers, both sources
in the source row, overlap equality, both centers in one *noncanonical* cap,
`capIndex != oppIndex1`, and only
`source₁ ∈ cap ∨ source₂ ∈ cap`.  It does **not** give both sources outside the
cap, nor a `RetainedRadiusCollision`/source-faithful second-center packet.
Consequently `SameCapCollisionPairCore` cannot be constructed from the
normalized residual by any existing adapter.  The closest checked closure,
`selectedFourClass_outside_overlap_card_le_one` (around
`FrontierLiveClosure.lean:9097`), needs both source points outside; the
retained collision lemmas likewise require a `RetainedRadiusCollision` and
both-off-cap/source-faithful row hypotheses.

The ordered route is no shorter: the residual carries no `J`, `J_mem_A`,
six boundary points/order, or `K`-in-`J`-shell witness.  Those are precisely
the fields required by `OrderedCrossRowCore` and by the checked adapter at
`:8547-8589`.

Therefore the first concrete theorem needed is branch-specific, not a new
generic core consumer.  Either prove the unresolved residual leaf directly,

```lean
theorem false_of_freshThirdNormalizedResidualRemainingCase
  (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
  (Q : FreshThirdBlockerFiber P Pρ)
  (hremaining : FreshThirdNormalizedResidualRemainingCase P Pρ C Q) : False
```

or produce one of the following auditable packets from each surviving branch:

1. **Same-cap packet:** both `Q` sources are outside the shared cap, together
   with a source-faithful second center (an actual row containing both
   sources, or an explicit adapter to `RetainedRadiusCollision`).  This is
   enough to instantiate `SameCapCollisionPairCore` and use the existing
   `.false`; proving only the current disjunction “at least one source inside”
   is insufficient.
2. **Ordered packet:** an `EndpointFreshOrderedCrossRowPlacement`-equivalent
   witness supplying `J`, all six boundary labels and strict cyclic order,
   plus `K ∈ selectedAt J` shell.  The existing endpoint adapter then builds
   `OrderedCrossRowCore` and closes it.

No source-clean theorem currently supplies either packet.  Thus the precise
first missing producer is a metric/order terminal for the residual, with the
both-off-cap + source-faithful pair being the smallest additional hypotheses
that would unlock the existing same-cap core.
