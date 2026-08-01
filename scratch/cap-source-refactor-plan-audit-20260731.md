# Cap-source refactor-plan audit (2026-07-31)

Scope: source-only audit of
`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md`
against the current `TwoCollisionGlobalProducer` and
`TwoSourceExactCollisionRowsTerminal` sources.  No Lean build or production
edit was performed.

## Current state versus the plan

The plan's opening caveat is stale for this checkout.  The named declaration
is present at `FrontierLiveClosure.lean:7656` with the already-consolidated
signature

```lean
false_of_capSourceThirdCanonicalRowSurface
  (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
  (hresidual : GeometricMultiplicityResidual P Pρ) : False
```

It is still a literal `by sorry`, hence a direct load-bearing obligation.  The
outer publish coordinator calls it on the cap-source arm at lines 11511--11527
(the sibling `false_of_crossBlockerCoincidence` is the other direct root).
`GeometricMultiplicityResidual` is already the exhaustive checked three-way
disjunction `FreshThird ∨ FreshOutsideFirst ∨ FreshOutsideSecond`, so the
plan's coordinator shape matches the semantic frontier.

The proposed refactor is therefore directionally correct, but it is not yet
implemented: current compatibility declarations dispatch *back to* this
root.  In particular, `false_of_capSource_freshThirdBlockerFiber` (line 7764)
and `false_of_twoCapSources_oneSidedDeletionSurvival` (line 9358) call the
root directly; `false_of_twoCapSources_firstFiber` (line 9385) eventually does
the same.  Making the root dispatch to those existing names would create a
cycle, not a checked coordinator.  New source-clean branch leaves (or renamed
existing leaves whose bodies no longer call the root) must be proved first.

## Two-source proposal: feasibility and boundary

The stronger producer already exists and is kernel-checked:

* `exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals`
  (`TwoCollisionGlobalProducer.lean:343--361`) gives two distinct sources,
  each with the complete third-blocker/cross-pair deletion packet.
* The common-radius variant is at `:388--410`.
* `FrontierLiveClosure.lean:7821--7896` lifts these packets to the existing
  `FirstFiberCapSourceWitness` form and is used by the enlarged-first-fiber
  analysis.

Thus a `TwoCapSourceThirdCanonicalRowSurface` structure is feasible as a
wrapper around the existing existential theorem.  It is not currently a
production type: `CapSourceThirdCanonicalRowSurface` remains a long nested
conjunction (`TwoCollisionGlobalProducer.lean:552--577`), and the global
`hglobalCapSplit` still produces that single-source surface.  A wholesale
replacement would ripple through the swap theorem (`:581--591`), the global
split, all compatibility adapters, and the final coordinator.  A lower-risk
route is to retain the single-source public interface, construct the two-source
packet locally from its cap bound plus the section's already-available
`T.oppApex2_rich` and `hpairsDisjoint`, and only introduce named structures at
the new child boundary.

The structure must preserve the actual `CriticalShellSystem` selected-support
and `CrossPairDeletionView` data.  Replacing those with an arbitrary chosen
four-subset would lose the support provenance used by the deletion and metric
lemmas and would change the obligation, not merely repackage it.

## Exact feasible implementation order

1. Freeze the current root hypotheses and publish-spine call.  Add a
   two-source packet constructor using the existing checked producer; do not
   change `hglobalCapSplit` yet.
2. Prove genuinely source-clean branch leaves for the three residual arms.
   The existing same-cap alignment lemma (line 7688) only closes the positive
   alignment subcase; it is not a replacement for the negative/no-alignment
   fresh-third obligation.  The proposed two-source fresh-third residual is a
   new theorem target, not an existing declaration.
3. Rewire the compatibility adapters to those new leaves (or make them
   explicitly private compatibility-only wrappers).  They must not call the
   coordinator once the coordinator dispatches to leaves.
4. Replace the root body by a checked `rcases hresidual` dispatch.  Keep the
   full ambient section packet available to every branch; do not silently
   weaken it to only the cap surface and a fiber witness.
5. Run the transitive axiom/proof-spine audit.  Acceptance requires the root
   and final publish target to be free of `sorryAx`, an exhaustive three-arm
   dispatch, and no adapter cycle.  A structure-only change or a checked
   wrapper does not count as closure.

## Risks / obligation classification

* **Circularity (high):** current adapters are downstream of the root.  They
  cannot serve as the root's children without first changing their bodies and
  establishing independent leaves.
* **False strengthening (high):** two-source data is constructible only with
  the cap-eight bound, disjoint collision pairs, and robust second apex.  A
  child that accepts an arbitrary `TwoCapSource...` packet must either retain
  those provenance fields or prove every field needed by the ambient metric
  arguments.
* **Fresh-third gap (high):** the checked same-cap positive-alignment
  contradiction does not produce the missing positive alignment.  The current
  one-source `without_sameCapCrossRow` theorem is merely an adapter to the
  `sorry` root.
* **Interface churn (medium):** converting the nested conjunction to a
  structure changes positional destructuring and the swap/global-split
  interfaces.  Prefer an additive wrapper until the leaves are stable.
* **Spine scope (medium):** the sibling cross-blocker root remains independent;
  combining that arm into the cap-source theorem would alter the two-root
  frontier and is outside this plan.

## Verdict

Proceed with the refactor, but classify it as an obligation-preserving
coordinator/producer refactor, not as progress toward closure by itself.  The
load-bearing mathematics remains the two-source interaction residuals (at
least the fresh-third no-alignment branch and the one-sided-deletion branch).
The plan's “checked coordinator” endpoint is valid only after those children
are independent, exhaustive, and wired without calling the coordinator.
