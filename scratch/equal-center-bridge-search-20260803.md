# Equal-center bridge search (2026-08-03)

## Target

The target is the `equalCrossRowCenters` constructor of
`FreshThirdNormalizedResidualRemainingCase` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11388-11531`.
In particular, the first unresolved product is
`distinctBlockersDifferentCaps × distinctBlockersDifferentCaps`
(`:11420-11440`).  That arm currently recurses to
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, whose
body is the load-bearing `sorry` at `:11326-11333`.

The six theorem-bank registries were rechecked (the prior global-bank audit is
`scratch/freshthird-global-bank-v31-20260802.md:7-34`): none contains a
`FreshThird`, `twoCapSources`, or `freshThirdBlockerFiber` declaration.  The
indexed Lean searches likewise found no imported direct terminal for this
product.

## Imported/source-clean declarations that actually fit part of the packet

The following declarations were checked with `#print axioms`; each depends
only on `propext`, `Classical.choice`, and `Quot.sound` (no `sorryAx`).

* `freshThirdEqualCenterExactFourRow_of_hits`
  (`FrontierLiveClosure.lean:10636-10644`).  Inputs `C`, `Q`, both
  `FreshThirdCrossRowHit`s, and `hcenters`; output
  `FreshThirdEqualCenterExactFourRow`, i.e. both selected supports are exactly
  `{C.firstSource, C.secondSource, Q.source₁, Q.source₂}`.  This is the useful
  producer in the equal-center branch, but it is positive data only.
* `false_of_freshThirdEqualCenter_sameCapOppIndex`
  (`:10761-10782`).  This is a direct `False` only when a cap index is
  `S.oppIndex1`, the first source center lies in that indexed strict cap, and
  one Q source lies in the corresponding cap.  The coordinator invokes it in
  `closeCanonicalFirst` (`:11389-11401`) for the `sameCapWithInternalFiberSource`
  cases whose index is `oppIndex1`; the distinct-caps × distinct-caps product
  supplies no such index equality or Q-source cap membership.
* `commonCollisionEndpointOmission_of_equalCenterHits`
  (`:10884-10926`) and `allCollisionEndpointsOmitted_of_equalCenterHits`
  (`:10928-10992`).  Both are source-clean omission producers obtained from
  the exact four-row packet; neither proves `False` for a FreshThird fiber.
* `false_of_two_freshThirdCrossRowHits_distinctCenters`
  (`:10994-11084`).  This closes the unequal-center case only and is therefore
  incompatible with `hcenters`.
* `exists_mutualBlockerCapIndices_same_only_first`
  (`:13152-13215`) and `exists_mutualBlockerCapIndices_distinct_otherCaps`
  (`:13368-13448`).  These are source-clean cap-index producers, but require
  `FirstFiberCapSourceWitness` for both sources and an explicit
  `TwoCapSourcesMutualCrossMembership` packet.  They return cap locations,
  not a contradiction; moreover their distinct-blocker hypotheses are the
  opposite of the equal-center hypothesis (`hcenters` gives equal blocker
  vertices).  The exact-row producer can derive mutual membership between
  `C.firstSource` and `C.secondSource`, but does not supply the missing
  first-fiber witness/interface or a terminal.
* `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
  (`:13722-13738`) is source-clean but explicitly requires distinct blocker
  values, so it cannot consume this equal-center branch.
* `ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex`
  (`TwoCenterCapLocalization.lean:121-...`) is source-clean, but requires both
  points of the bisected pair in one strict cap interior and an equal-distance
  condition from that cap's opposite apex.  `FreshThirdBlockerFiber` gives Q
  source shell membership only; it gives neither Q-source cap-interior
  membership nor the required physical-apex equality.

## Near matches rejected

`false_of_twoCapSources_sameBlockerAllEndpointOmission`
(`FrontierLiveClosure.lean:12887-12930`) has a superficially similar
equal-blocker/all-omission shape, but its `#print axioms` includes `sorryAx`.
It also consumes `FreshOutsideFirstBlockerFiber`, common-radius membership,
two `FirstFiberCapSourceWitness`s, and an exact shell/cap intersection, none
of which is present in the `FreshThirdBlockerFiber` interaction product.  It is
not source-clean proof evidence.

The generic producer `CriticalFourShell.support_eq_radius`
(`lean/RVOL/P97/U1CarrierInjection.lean:551`) is source-clean and useful for
transporting shell support to distance equalities, but it does not bridge the
missing cap placement/order hypotheses.

## Fit diagnosis / next leaf

No imported, source-clean declaration closes
`distinctBlockersDifferentCaps × distinctBlockersDifferentCaps`.  The exact
four-row producer plus endpoint-omission producers are the only clean bridges
currently available.  The smallest non-circular next target is a new theorem
with the two cross-row hits, `hcenters`, and both
`distinctBlockersDifferentCaps` payloads as inputs, proving `False` directly
from their two cap-interior memberships, overlap equalities, and cap-index
inequalities.  It must not call the normalized-residual coordinator (or any
wrapper whose transitive axioms include `sorryAx`).

No production Lean files were modified.
