# Direct-root route follow-up (2026-07-31)

Target roots: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`

* `false_of_crossBlockerCoincidence` (`FrontierLiveClosure.lean:7452`) takes
  `CrossBlockerCoincidence P Pρ` and
  `GeometricMultiplicityResidual P Pρ`, plus the full tri-apex/cycle context.
* `false_of_capSourceThirdCanonicalRowSurface` (`:7491`) takes the cap-eight
  source row packet and the same residual/context.

## Cross-blocker audit

`CrossBlockerCoincidence` is exactly the four alternatives

```text
center(P.source₁) = Pρ.source₁
center(P.source₁) = Pρ.source₂
center(Pρ.source₁) = P.source₁
center(Pρ.source₁) = P.source₂.
```

The local packets do not turn any one of these into `False`:

* `P.blocker_mem_capInterior` and
  `Pρ.source₁/₂_mem_capInterior` make a blocker/source equality compatible
  with cap membership.
* `P.sources_ne`, `Pρ.sources_ne`, and `hpairsDisjoint` only exclude equality
  of source points, not equality of a blocker center with the other row's
  source.
* `hblockersNe` excludes equality of the two actual blocker centers, but each
  coincidence arm equates one blocker with a *source point*.
* `MPρ`/`MP` supply `fresh_not_mem_collisionSource_shell`,
  `collisionSource_not_mem_fresh_shell`, and distinct blocker centers.  Under
  an alias such as `center(P.source₁)=Pρ.source₁`, these are consistent with
  the canonical fact that a shell's own center is outside its support; they do
  not produce a support membership in the opposite row.

Thus a direct source-clean proof cannot be constructed from the current local
lemmas.  The exact missing bridge is a carrier-wide support/cap theorem that
turns each alias into a reciprocal cross-row incidence (or another global
contradiction using minimality/no-M44/tri-apex data).  The existing local
Euclidean facts only provide omissions and an overlap upper bound.

## Cap-source root audit

`CapSourceThirdCanonicalRowSurface` exposes one source in the indexed cap,
outside both collision pairs, with two `CrossPairDeletionView`s.  The checked
terminal `false_of_freshThird_sameCapCrossRowAlignment` proves `False` only
after an additional `FreshThirdSameCapCrossRowAlignment` package is supplied.
The residual arm `Nonempty (FreshThirdBlockerFiber P Pρ)` gives two fresh
sources in one another's shells, but no theorem currently supplies all of:

1. a common cap index containing both the fresh blocker center and the
   cap-source center;
2. both fresh sources outside that cap; and
3. both fresh sources in the cap-source canonical row.

Consequently the cap-source root has the same precise gap: a positive
alignment/localization producer (or a separate global terminal).  Existing
`exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals` and selected
support overlap lemmas do not provide this conjunction.

## Status

No production files were edited.  The two roots remain genuine source-clean
obligations; wrappers below them are compatibility adapters and do not close
either root.
