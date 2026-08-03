# PatternCode / ConvexFivePointCore bridge audit

## Verdict

**Direct consumption is not available.**  `FreshThirdNormalizedResidualCase`
is an all-large-cap residual packet, while the finite classifier is a fixed
eleven-label `(6,4,4)` branch.  No theorem currently converts the former into
the latter, and the live residual theorem remains the `sorry` at
`FrontierLiveClosure.lean:9738-9745`.

## Exact interface mismatch

* The finite route uses `Label := Fin 11` and `PatternCode := Label -> Label ->
  Bool` (`Census554/CapSelectedFiniteCode.lean:36-48`).  Its native total
  theorem requires both `IncidenceOK P` and `PinnedShellOK P blocker
  pinSource deleted` (`Census554/CapSelectedNativeClosureSound.lean:852-858`).
  Thus it needs a labelled row relation, all six incidence predicates, a
  `Label -> Label` blocker map, and fixed pin/deleted labels.
* `FreshThirdNormalizedResidualCase` only has the constructors
  `firstNonHit`, `secondNonHit`, and `equalCrossRowCenters`
  (`ATail/FrontierLiveClosure.lean:9201-9218`).  Its source surface supplies two
  four-point source rows, a fresh blocker fiber, and interaction/deletion data;
  it supplies none of the finite labels, blocker function, pinned source, or
  deleted-label hypotheses.
* The geometric finite-label bridge needs `BoundaryBlocks`.  That structure
  asserts `A.card = 11`, surplus interior cardinality `4`, and both opposite
  interior cardinalities `2` (`Census554/CapSelectedGeometry.lean:92-117`),
  and its constructor requires the M44 hypotheses plus
  `S.surplusCap.card = 6` (`...:531-536`).  The live source surface instead
  carries `8 <= (S.capByIndex S.oppIndex1).card` (`ATail/FrontierLiveClosure.lean:7939-7941`,
  the all-large-cap profile).
  There is no current derivation of the card-eleven boundary enumeration or
  exact `(6,4,4)` block cardinalities; the profiles cannot be identified by a
  definitional coercion.
* Even after a hypothetical label conversion, `IncidenceOK` is the conjunction
  of `LocalRowsOK`, `RowIntersectionsOK`, `PairCenterCountOK`,
  `CrossSeparationOK`, `Q3OK`, and `CapSelectedCountsOK`, while
  `PinnedShellOK` fixes a four-element row, blocker membership for every
  label, and pin/deletion separation (`CapSelectedFiniteCode.lean:203-227`).
  None of these obligations is present in the fresh-third packet.

## ConvexFivePointCore comparison

The generic bridge is not a shortcut to the finite code.  `GeneralCarrierBridge`
first requires an already-built `FaithfulCarrierPattern` and a
`MetricCoreAlternative`/`ShellMetricCoreAlternative`; it has no producer from
`FreshThirdNormalizedResidualCase`.  `ConvexFivePointCore.Core` itself needs
five labels, `a != b`, `x != y`, four `EdgeClosure` equalities, and two signed
area inequalities (`Census554/ConvexFivePointCore.lean:136-180`).  The
equal-center residual gives at most one exact four-point row and no cyclic
order/sign data or four closure edges; either non-hit constructor gives still
less.  Consequently `convexFivePointCore_sound` cannot be applied to the live
residual without a new producer theorem.

## Possible (non-direct) adapter

A viable future route would be a new all-large/general-cardinality theorem:
construct a `FaithfulCarrierPattern` over the actual carrier, prove a
`ShellMetricCoreAlternative` from the source/interactions, then call
`false_of_shellMetricCoreAlternative`.  The existing pinned bridge is itself
inapplicable: `exists_rightPinnedAlignedCarrier`
(`Census554/PinnedCarrierBridge.lean:92-115`) requires
`PinnedRightSurplusResidualAt`, `CriticalSelectedFourClass`, and
`U3LocalizedNoQFreePacket`, none of which is a field of the fresh-third
surface.  This would be a new general-cardinality producer, not an adapter to
the fixed `PatternCode` classifier and would not discharge the current sorry
by itself.

## Trust and spine status

The generic carrier and convex-core lemmas are source-clean/kernel theorems,
but no call to them occurs from the live normalized-residual theorem.  The
finite classifier/native closure files are not imported by
`ATail/FrontierLiveClosure.lean` (it imports `Census554/GeneralCarrierBridge`,
not `CapSelectedFiniteCode` or `CapSelectedNativeClosureSound`).  Therefore
the finite route is off the live import spine; adding it would still require
the missing geometric, incidence, pinning, and placement producers.  Current
status remains **open / `sorry`**, with no closure or trust promotion.
