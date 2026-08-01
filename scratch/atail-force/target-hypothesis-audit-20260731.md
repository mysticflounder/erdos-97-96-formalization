# Target-hypothesis audit (2026-07-31)

Scope: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`; source-only audit, with no production edits.

## Target and axiom boundary

The target is at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11047-11069`. Its arguments `hsingleton` (`:11051-11054`), `haligned` (`:11055-11057`), and `hsecondNe` (`:11058-11061`) are not consumed. The body only packages `hsource` as `CapSourceThirdCanonicalRowSurface` and `Q` as the fresh-first arm, then calls `false_of_capSourceThirdCanonicalRowSurface` (`:7491-7495`), whose body is a load-bearing `sorry`. Thus the target is not source-clean and has a transitive `sorryAx`.

## Existing source-clean consumers

* `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (`FrontierLiveClosure.lean:7751-7780+`) proves exactly the supplied `hsecondNe` from ordered-cap uniqueness. It is a checked inequality only; no terminal consumes that inequality to derive `False`.
* Private `firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned` (`:9268-9331`) derives the same singleton equation from `hsource` and `haligned`; it does not contradict the equation. The supplied `hsingleton` is therefore redundant compatibility data.
* `selectedFourClass_outside_overlap_card_le_one` (`:7300-7309`, proof continues through `:7340+`) gives at most one common support point outside a cap for distinct cap centers. It needs two positive common outside points; `Q.source` and `Q.otherOutsidePoint` are only known in the *first* collision shell (`FreshOutsideFirstBlockerFiber` fields `BlockerMultiplicityGeometry.lean:115-157`), not in the second blocker shell.
* `false_of_firstFiber_bothOutsideHits_and_firstPairHit` (`FirstFiberOverlapDescent.lean:804-897`) requires both Q points plus a collision endpoint in the source row; `hsource` supplies none of these positive source-row hits.
* `false_of_firstFiber_twoOutsideHits_of_capCenter` (`FirstFiberOverlapDescent.lean:901-956`) requires both Q points in the source row and `H.centerAt source` in the first cap. `hsource` only puts `source.1` in the cap interior; it gives no center-in-cap premise.
* `false_of_two_cap_centers_equidistant_outside_pair` is private (`TwoCenterCapLocalization.lean:60-70`) and is used inside the preceding inequality proof. It would close an equality, but its needed equality is precisely what `hsecondNe` negates, not what the hypotheses establish.

## Assessment

No existing source-clean theorem/cardinality/finite contradiction combines `hsingleton`, `haligned`, `hsecondNe`, `Q`, and `hsource` to prove `False`. The local checked facts stop at (i) singleton-radius bookkeeping and (ii) the nonbisector inequality. The first missing bridge remains the global cap-source terminal

```text
CapSourceThirdCanonicalRowSurface P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False
```

(`false_of_capSourceThirdCanonicalRowSurface`, `:7491-7495`), or an equivalent consumer of the retained deletion/tri-apex residual. A direct proof/refutation from the target hypotheses alone is therefore not currently possible without proving that load-bearing global bridge (or adding a genuinely new positive-incidence producer).
