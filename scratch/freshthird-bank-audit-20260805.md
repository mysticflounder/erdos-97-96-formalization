# FreshThird theorem-bank audit (2026-08-05)

## Scope and anchor

The live anchor is
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`,
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:471-478`.
Its input is
`FreshThirdNormalizedResidualRemainingCase P Pρ C Q` (`:169-189`), whose
constructors are `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` (the latter has two cross-row hits, equal centers, and
two `FreshThirdNonCanonicalInteraction`s).  `#print axioms` reports
`sorryAx` for the anchor, so it is not a source-clean consumer.

The root `FrontierLiveClosure.lean` imports `TwoSourceFreshThirdFiber` and
`TwoSourceFreshThirdResidual` (`:15-16`), but not the retained Kalmanson bank
below.

## Indexed Lean search

`nthdegree docs search --lean "FreshThirdNormalizedResidualRemainingCase"`
returned only the private constructor normalizer
`freshThirdNormalizedResidualRemainingCase_of_residual`
(`TwoSourceFreshThirdResidual.lean:196-204`) plus the anchor and its private
common-radius helper.  No other declaration consumes the remaining-case type.

The exact source-clean nearby declarations (all have only
`propext`, `Classical.choice`, and `Quot.sound` in `#print axioms`) are:

* `freshThirdNormalizedResidualCase_of_crossRowResidual`
  (`TwoSourceFreshThirdFiber.lean:1490-1509`), import-reachable through the
  root.  It converts the broad residual and both interaction packets to the
  three-way normalized packet; it does not prove `False` or construct the
  remaining-case consumer.  Missing next hypothesis: a branch terminal for
  each remaining constructor.
* `false_of_freshThird_sameCapCrossRowAlignment`
  (`TwoSourceFreshThirdFiber.lean:150-190`), import-reachable.  It consumes a
  separate `FreshThirdSameCapCrossRowAlignment` packet, which requires both
  fresh sources outside one common cap.  The retained noncanonical arm gives
  only `sourceCap`/`freshCap` interior membership (and may be mixed
  inside/outside), so the first missing facts are the two off-cap memberships
  and the alignment producer.
* `freshThirdEqualCenterExactFourRow_of_hits`
  (`TwoSourceFreshThirdFiber.lean:1538-1546`), import-reachable.  It consumes
  the equal-center constructor's two hits and returns exact four-point row
  supports; it is a producer, not a contradiction.
* `false_of_freshThirdEqualCenter_sameCapOppIndex`
  (`TwoSourceFreshThirdFiber.lean:1663-1680+`), import-reachable.  It closes
  only the canonical same-cap arm and explicitly needs
  `capIndex = S.oppIndex1`; the retained packet has the noncanonical branch
  `capIndex ≠ S.oppIndex1`.  That equality (or a new noncanonical terminal) is
  the first missing hypothesis.
* `false_of_two_freshThirdCrossRowHits_distinctCenters`
  (`TwoSourceFreshThirdFiber.lean:1896-1904`), import-reachable.  It closes
  two hits only when the two source-row centers are unequal.  The remaining
  equal-center constructor supplies the opposite equality, and the two
  non-hit constructors lack a second hit; hence no branch matches.

The only complete Kalmanson packet found by indexed search is in
`lean/Erdos9796Proof/P97/ATail/RetainedCollisionDifferentPairConsumer.lean`:

* `Problem97.ATailRetainedCollisionDifferentPairConsumer.OrderedDifferentPairCrossHit.false`
  (`:120-177`) and
  `...AlternateOrderedDifferentPairCrossHit.false` (`:223-264`) are
  source-clean (`#print axioms` has no `sorryAx`).  They require a
  `RetainedRadiusCollision`, a fresh first-apex row point with
  `K_mem_J_shell`, an injective/image/CCW boundary, and a six-role strict
  cyclic order (`O<J<C<A<X<K` or `O<C<J<X<A<K`).  The module header marks it
  `COMPAT-ONLY/BANK`; `rg` finds no import of this module, and importing only
  `FrontierLiveClosure` leaves the declarations unknown.  Thus it is not
  import-reachable and its first missing bridge is a producer transporting the
  FreshThird retained packet to that collision/boundary/cross-incidence
  structure.

## Local theorem-bank registries

The mandated registries
`certificates/p97_rvol_general_n_mining.{md,json}`
`certificates/erdos97_legacy_general_n_mining.{md,json}` and
`certificates/erdos_general_theorem_p97_mining.{md,json}` contain no
`FreshThird`, `FreshThirdNormalizedResidualRemainingCase`, or matching
Kalmanson declaration.  Their cross/incidence hits are unrelated U5/C5D3B
schemas (for example `Problem97.C5D3B.carrier_inter_qCircle_eq_crossings_of_mem_exactRadiusClass_sdiff_outside_C1_union_C2`);
the registry JSON records `source_path: null` and
`import_reachability: null` for those entries, and none has the FreshThird
types.

## Audit conclusion

No source-clean, import-reachable theorem consumes
`FreshThirdNormalizedResidualRemainingCase` or produces the required positive
cross-row/Kalmanson packet from it.  The first missing hypothesis is a new
source-faithful producer that supplies either (i) a contradiction for
`firstNonHit`/`secondNonHit`, or (ii) for the equal-center noncanonical arm,
the missing cap/order incidence (at minimum a non-`oppIndex1` terminal,
or a full convex boundary plus six-role Kalmanson packet).  The residual
anchor remains the sole load-bearing `sorry`.
