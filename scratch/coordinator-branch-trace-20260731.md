# Two-source exact-collision coordinator branch trace (2026-07-31)

Scope: current source audit only; no production edit or build was performed.

## Result

**No branch supplies a source-clean contradiction for either terminal root.**
Both roots are explicit load-bearing `sorry`s:

- `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`,
  `FrontierLiveClosure.lean:7452-7456`;
- `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`,
  `FrontierLiveClosure.lean:7491-7495`.

The coordinator has an implemented route up to these two calls.  It does
have a separate positive `CollisionCrossHit` exit; its immediate caller
turns that exit into `False` using the checked cross-omission rectangle.  That
does not close either terminal root.

## Coordinator and branches

`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`FrontierLiveClosure.lean:11207-11373`) first maps the global finite split:

1. `hcapEightOrCross` (`:11246-11251`) is mapped at `:11271-11276` to
   `TwoCollisionGlobalSplit P Pρ`, namely
   `CapSourceThirdCanonicalRowSurface P Pρ ∨ CrossBlockerCoincidence P Pρ`
   (`TwoCollisionGlobalProducer.lean:604-615`).  The cap-eight arm is
   converted to the cap-source surface by
   `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`
   (`TwoCollisionGlobalProducer.lean:619-643`), using the supplied robust
   second apex and disjoint source pairs.
2. The three-apex omission argument produces blocker multiplicity at
   `FrontierLiveClosure.lean:11336-11342`, then
   `collisionCrossHit_or_geometricMultiplicity` splits it at `:11343`.
   Its residual is exactly one of a fresh third fiber, fresh outside first
   fiber, or fresh outside second fiber
   (`BlockerMultiplicityGeometry.lean:339-350`).
3. The `CollisionCrossHit` arm returns the right disjunct at `:11344`.
   It is not a root call.  The sole positive caller,
   `exists_three_hit_of_two_collisionRows_capCross_normalForm`
   (`FrontierLiveClosure.lean:11391-11505`), eliminates each of its four
   alternatives using `hcrossOmissions` at `:11501-11505`.  Thus this is a
   checked contradiction conditional on that caller's complete omission
   rectangle.
4. Only in the *geometric-residual* arm does the coordinator enter the global
   split.  The cap-source side calls the cap-source root at `:11345-11359`;
   the cross-blocker-coincidence side calls the coincidence root at
   `:11360-11373`.  Each invocation provides every formal antecedent in the
   terminal section interface (`:7401-7443`) plus its respective branch packet
   and `hresidual`; the only unproved component is the root body itself.

## Missing inputs versus missing proofs

There is no unfilled *application-hypothesis* gap on either root call.  Their
shared ambient interface requires distinct radii, both exact-four rows, both
exact strict-cap pair equations, tri-apex residual `T`, pair disjointness,
distinct actual blockers, and both localized mutual-omission cycles
(`FrontierLiveClosure.lean:7401-7443`); the coordinator passes all of these
at `:11347-11358` and `:11361-11372`.

The branch-specific antecedents are instead:

- coincidence root: `CrossBlockerCoincidence P Pρ` (one of the four concrete
  equalities, `TwoCollisionGlobalProducer.lean:480-492`) **and**
  `GeometricMultiplicityResidual P Pρ`;
- cap-source root: `CapSourceThirdCanonicalRowSurface P Pρ`
  (`TwoCollisionGlobalProducer.lean:552-577`) **and** the same geometric
  residual.

Both packets are produced in the coordinator's residual branch, but neither
is a contradiction without filling its corresponding root.  The existing
direct wrappers at `FrontierLiveClosure.lean:7586`, `:7603`, `:9208`, and
`:11064` merely re-expose the cap-source root and remain transitively
non-source-clean.
