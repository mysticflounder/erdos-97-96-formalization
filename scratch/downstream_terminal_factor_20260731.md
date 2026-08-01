# Downstream-terminal factor audit (2026-07-31)

## Result

Neither residual root has a source-clean sublemma that can be moved earlier to
close it.  Both are genuine global contradiction leaves and remain the only
literal `sorry`s in this namespace:

- `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`
  (`FrontierLiveClosure.lean:7452-7456`) takes
  `CrossBlockerCoincidence P Pρ` plus
  `GeometricMultiplicityResidual P Pρ` and returns `False`.
- `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
  (`:7491-7495`) takes
  `CapSourceThirdCanonicalRowSurface P Pρ` plus the same residual and returns
  `False`.

The imported producers are source-clean but only produce data, not a
contradiction.  `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`
(`ATail/TwoCollisionGlobalProducer.lean:619-643`) constructs the cap-source
surface from the cap-eight branch.  `collisionCrossHit_or_geometricMultiplicity`
(`ATail/BlockerMultiplicityGeometry.lean:356-383`) gives a cross-hit or the
three-arm residual.  `capSourceThirdCanonicalRowSurface_swap`
(`TwoCollisionGlobalProducer.lean:581-602`) is only symmetry transport.

## Why downstream extraction is circular

The first downstream coordinator,
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`FrontierLiveClosure.lean:11207-11373`), computes the finite blocker
multiplicity and then calls both roots in its residual branch
(`:11343-11373`).  The checked normal form
`exists_three_hit_of_two_collisionRows_capCross_normal_form`
(`:11391-11505`) calls that coordinator (`:11494-11505`), and
`exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
(`:11521-11711`) calls the normal form (`:11707-11711`).  Finally
`false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits`
(`:11729-11767`) calls this producer (`:11763-11767`).  Thus any attempt to
prove either root by reusing the downstream producer/coordinator chain creates
the dependency cycle

```
root (7452 or 7491)
  -> source-exact coordinator (11207)
  -> cap-cross normal form (11391)
  -> exact-four producer (11521)
  -> low-hit terminal (11729).
```

The compatibility adapters after the roots do not provide an alternate route:
`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`
and `false_of_capSource_freshThirdBlockerFiber` (`:7578-7608`),
`false_of_twoCapSources_oneSidedDeletionSurvival` (`:9193-9214`), and
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
(`:11047-11069`) all directly delegate to
`false_of_capSourceThirdCanonicalRowSurface`.

## Stronger checked facts that do not close the roots

`false_of_freshThird_sameCapCrossRowAlignment` (`:7521-7570`) is source-clean,
but it requires a positive `FreshThirdSameCapCrossRowAlignment`; neither
`CapSourceThirdCanonicalRowSurface` nor
`GeometricMultiplicityResidual` supplies that same-cap alignment.  The
source-clean split `mutualCrossMembership_or_oneSidedDeletionSurvival`
(`:8079-8095`) similarly only partitions the case; each branch eventually
delegates to the cap-source root.  The localized common-deletion and
mutual-omission packets are used upstream to obtain cross omissions and blocker
distinctness, but do not force any of the four cross-blocker equalities to yield
reciprocal shell membership.

## Recommendation

Keep both declarations as the explicit coordinator-interface frontier.  Do not
extract/move a downstream theorem into their proofs.  The next legitimate
target is a new source-clean global bridge proving `False` from either
`CapSourceThirdCanonicalRowSurface ∨ CrossBlockerCoincidence` together with
`GeometricMultiplicityResidual`, using retained tri-apex/minimality/
localized-deletion data.  Local overlap/ordered-cap lemmas can only close the
strict stronger alignment subcase and cannot discharge the full roots.
