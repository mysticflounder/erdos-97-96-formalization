# Audit: aligned singleton-radius/nonbisector target (2026-07-31)

Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`.

## Exact interface

The section variables (FrontierLiveClosure.lean:7401--7439) are:

* `P`, `Pρ : RetainedInteriorBlockerCollision` at distinct first-apex radii,
  with `hρne`, exact-four cardinalities `hfrontierFour`/`hρfour`, and exact
  two-source cap-intersection equations `hfrontierInteriorEq`/`hρInteriorEq`;
* tri-apex residual `T`, disjoint source pairs `hpairsDisjoint`, distinct
  collision blockers `hblockersNe`;
* localized common-deletion/mutual-omission packets `LPρ, MPρ, LP, MP` and
  freshness equalities `hLPρ`, `hLP`.

The target adds (lines 11047--11061):

* `Q : FreshOutsideFirstBlockerFiber P Pρ`;
* a cap-source carrier `source` and `hsource : FirstFiberCapSourceWitness P Pρ source`;
* `hsingleton`, the exact singleton strict-first-cap slice at
  `dist S.oppApex1 source.1`;
* `haligned : FirstCapMultiPointRadiiRetained (radius := radius) (ρ := ρ)`;
* `hsecondNe`, strict non-bisection of `Q.source.1` and
  `Q.otherOutsidePoint` by the second collision blocker.

## Current proof/dependency

The body (lines 11062--11069) does not use `hsingleton`, `haligned`, or
`hsecondNe` to derive a contradiction.  It packages `hsource` as
`CapSourceThirdCanonicalRowSurface P Pρ` and `Q` as the
`Nonempty (FreshOutsideFirstBlockerFiber P Pρ)` arm, then calls

`false_of_capSourceThirdCanonicalRowSurface P Pρ ... hcapSource
  (Or.inr (Or.inl ⟨Q⟩))`.

That callee is an explicit `sorry` at lines 7491--7495.  A focused check
(`lake env lean ../scratch/aligned_target_axioms.lean`, from `lean/`) reports:

```text
target depends on [propext, sorryAx, Classical.choice, Quot.sound]
false_of_capSourceThirdCanonicalRowSurface depends on [propext, sorryAx, Classical.choice, Quot.sound]
```

Thus this declaration is source-clean only in the narrow body sense; it is not
kernel-closed and inherits the global cap-source obligation's `sorryAx`.

## Source-clean nearby facts/routes

These declarations have no `sorryAx` in their checked bodies and are useful
ingredients, but none closes the target by itself:

* `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (lines 7751--7784)
  proves exactly `hsecondNe` from ordered-cap uniqueness; it yields an
  inequality, not `False`.
* `firstFiber_shell_eq_explicitFour` and
  `firstFiber_sourceFaithfulCriticalCover_eq_firstShell` (lines 7616 and
  10153 onward) expose the first shell's exact four-point census and blocker
  equality.  The global-row overlap/cardinality lemmas immediately following
  them are also source-clean, but only produce a continuation witness.
* `exists_secondRowOutsidePoint_ne_firstOutsidePair` (around line 9569),
  `secondRowOutsidePoint_blocker_ne_first` (around line 9737), and
  `freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint` (around line
  9781) use `hsecondNe` to produce a new second-row point/fiber dichotomy.
  Their continuation still feeds the cap-source terminal; it does not close
  the branch.
* `firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned` (around line
  9268) is the source-clean producer of `hsingleton` from `hsource` and
  `haligned`; it is not a contradiction.
* The two-source split (`exists_two_firstFiberCapSourceWitness`,
  `mutualCrossMembership_or_oneSidedDeletionSurvival`) and the terminals
  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` and
  `false_of_twoCapSources_complementaryMembership` are source-clean.  They
  require a second cap-source witness.  The equal-blocker fresh-third and
  one-sided branches eventually call the same sorry-backed
  `false_of_capSourceThirdCanonicalRowSurface`.

The target therefore needs a genuinely new source-clean proof of the global
cap-source/multiplicity obstruction (the callee at 7491), or an independent
geometric contradiction consuming the full residual packet.  Reusing the
existing adapters only preserves the `sorryAx` dependency.

