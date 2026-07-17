# Critical-fiber closing-core selector audit

## Scope and status

This lane owns only
`scratch/atail-force/critical-fiber-closing-core-selector/`.  It audits the
adaptive existential choice required by the production contract
`CriticalFiberClosingCore R`.  It does not prove
`nonempty_criticalFiberClosingCore` and does not close a production `sorry`.

The corrected selector is now promoted to production as
`Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector` and imported by
`U1LargeCapRouteBTail`.  Production contains only the source-faithful
collision-or-matching selector and the unavoidable boundary-alternation
consequence.  The finite regression and its Z3 discovery script remain
scratch-only.

## Bank and indexed-corpus search

The required registries were searched before formalization:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the cross-project Lean index via `nthdegree docs search --lean`.

Queries covered a blocker collision inside a retained radius class, an
injective blocker restriction, two deletion-critical sources with one actual
blocker, and exact-shell support locking.  No banked theorem selects either
production closing-core constructor.  The closest current declarations are:

- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`, which gives a
  collision somewhere in the full carrier but does not place its sources in
  the retained radius class;
- `criticalSupports_eq_of_actualBlocker_eq` and
  `source_mem_qBlockerShell_of_actualBlocker_eq`, which transport exact-shell
  data after a blocker equality is already known; and
- the U5 metric/incidence consumers, which require substantially more named
  row data than the critical fiber exports.

The sibling and legacy banks contain bounded row/metric contradiction
consumers, not this geometry-sensitive existential selector.

## Kernel-checked selector

Production `CriticalFiberRetainedRadiusSelector.lean` defines the actual
critical-shell blocker map restricted to sources in

```text
SelectedClass D.A S.oppApex1 radius.
```

It proves the exact classical dichotomy

```text
RetainedRadiusBlockerOutcome R =
  collision inside the retained class
  | injective blocker matching on the whole retained class.
```

In the collision branch, the two preimages are repackaged as the complete
`FrontierCommonDeletionCriticalFiber R`; exact support equality, mutual source
membership, equal radii, and both `no_qfree` facts are retained.  Because both
sources lie on the first-apex radius, the first apex is proved to be a genuine
source-faithful second equidistant center for that pair.

The existing theorem `SurplusCOMPGBank.btw_sep` (also exposed through
`Census554.SeparationCore.SharedPairSeparationCore.satisfiedBy_of_realizes_ccw`)
then determines the natural geometric output: on a full CCW boundary the two
collision sources alternate across the first apex and common blocker.
`exists_boundary_alternation` formalizes this directly from the production
fiber and `D.convex`, with no new hypothesis.

The scratch audit file additionally gives a direct adapter from this collision
to the production `SameCapCollisionPairCore` and hence
`CriticalFiberClosingCore R`, conditional only on the following cap placement:

1. the common blocker and first apex lie in one cap; and
2. both collision sources lie outside that cap.

These adapters remain scratch-only because the same-cap packet is not the
natural output of the selector.  It is an intentionally impossible
localization: if independent cap geometry were to put both centers in one cap
and both sources outside it, the checked terminal would contradict the
mandatory alternation.  The production collision arm's honest positive packet
is the boundary-alternation theorem; closure needs a cap/MEC fact incompatible
with that alternation or a further ordered row.

## The injective arm survives the repaired finite abstraction

The first candidate finite witness copied from the earlier O-row collision
audit was **invalid for the current frontier**.  Its blocker-1 and blocker-8
critical rows each met the retained first-apex class in three points, violating
the production two-circle theorem
`ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two`.
It must not be cited as evidence that injectivity survives the Euclidean
frontier.

The checked file now contains a repaired `Fin 12` regression found only after
adding that theorem as a mandatory gate.  It
simultaneously has:

- a total fixed-point-free blocker map omitting the robust first apex;
- exact four-point critical supports with source membership and support
  locking on equal blocker fibers;
- a five-point retained first-apex radius class surviving every deletion;
- a selected four-row inside that class;
- blocker injectivity on every source in the retained radius class;
- a repeated blocker fiber entirely outside the retained class;
- intersection cardinality at most two between every distinct pair of
  represented exact classes, including every critical shell against the
  retained card-five class;
- one explicit injective cyclic boundary order satisfying every shared-pair
  alternation constraint generated by the displayed exact classes;
- the selected-row closure consequence of minimality: every nonempty
  row-closed subset is the full carrier.

All regression theorems are proved with kernel `decide`, not
`native_decide`.  This is an exhaustive check of the displayed finite object,
not a Euclidean counterexample.  It proves that represented blocker/row/
minimality data plus the exact two-circle and shared-pair-separation gates do
not discard the injective matching arm.  It still does not encode all cap/MEC,
full-filter, or no-`IsM44` geometry, so the arm remains unresolved rather than
geometrically realized.

## Closure consequence

The strongest honest selector currently available is therefore the proved
collision-or-injective dichotomy, not unconditional collision inside the
retained class.

- **Collision arm:** start from the now-checked boundary alternation of the
  source pair.  A same-cap terminal is available only if an independent cap
  theorem forces the incompatible two-centers-inside/two-sources-outside
  placement.
- **Injective arm:** use genuinely geometric information to contradict or
  exploit a source-to-distinct-blocker matching of size at least four.  More
  finite pigeonhole, row-closure, two-circle-intersection, or bare separation
  reasoning cannot do this, as the repaired regression satisfies those
  surfaces.

The next useful producer should consume cap order, MEC/full-filter placement,
or no-`IsM44` on the injective matching.  It should not replace the matching
with an arbitrary anonymous row packet.

## Validation

The focused production build is green:

```text
lake-build Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector \
  Erdos9796Proof.P97.U1LargeCapRouteBTail
Build completed successfully (8214 jobs).
```

Lean LSP verification of both
`nonempty_retainedRadiusBlockerOutcome` and
`RetainedRadiusCollision.exists_boundary_alternation` reports exactly
`propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` occurs.  A direct
source scan of the production module finds no `sorry`, `admit`, `axiom`, or
`native_decide`.  The parent module's pre-existing source `sorry` warnings are
unchanged by the new import.

Both scratch Lean files were also checked directly against the current project
imports with the same standard-only axiom closure.  The finite search script
uses Z3 only to discover a candidate row system and boundary order; every
retained finite assertion is independently replayed by kernel `decide`.
