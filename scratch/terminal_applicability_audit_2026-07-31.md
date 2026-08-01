# Bottom all-large-caps terminal applicability audit (2026-07-31)

Scope: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`; no production
files were edited.  The declaration checks used the existing Lean artifact
(`proof-blueprint axioms`; a fresh `lake-build` was not run because another
build held the project lock).

## Verdict

The four terminal declarations are source-clean in their own bodies, but they
are **not kernel-closed / publish-usable**.  Kernel `#print axioms` reports
`sorryAx` for all four.  The bi-apex wrapper additionally reports
`Lean.trustCompiler` (from the computational proof path), so it has a wider
trust boundary than the tri-apex wrappers.

| declaration | source body | kernel axioms (live check) | applicability |
|---|---|---|---|
| `false_of_frontierAllLargeCapsTriApex_all_low_hits` (L12298--12315) | checked case split; no local `sorry` | `propext`, `Classical.choice`, `Quot.sound`, **`sorryAx`** | usable only as a scoped wrapper; its omission leaf is an open `sorry` theorem (L6767--6778), and the collision leaf routes through the low-hit chain (L12230--12266) |
| `false_of_frontierAllLargeCapsTriApexUniformMetricResidual` (L12358--12374) | checked `obtain` + circle intersection bound + `omega` | same plus **`sorryAx`** | metric contradiction is source-checked, but its producer is ex-falso from the previous low-hit wrapper (L12337--12353), hence not closed |
| `false_of_frontierAllLargeCapsTriApexRobustResidual` (L12379--12389) | one-line checked consumer of UniformMetric | same plus **`sorryAx`** | no stronger status than UniformMetric |
| `false_of_frontierAllLargeCapsBiApexRobustResidual` (L12399--12452) | checked packet rotations, fresh-frontier consumers, and tri-apex construction | `propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`, **`Lean.trustCompiler`**, **`sorryAx`** | structurally routes the bi-apex residual to tri-apex, but remains non-closed; `trustCompiler` is an additional computational trust dependency |

The exact blueprint audit for the tri-apex robust theorem also rejects the
spine because `sorryAx` is unapproved.  Thus “source-clean” here means only
that the displayed theorem bodies contain no `sorry`; it does not mean
kernel-clean.

## Hypothesis mapping to `TwoSourceExactCollisionRowsTerminal`

The current two-source target already *accepts* the all-large-caps package as
arguments, rather than deriving it.  In
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
`B`, `L`, `N` are implicit premises and `T` is an explicit premise
(L11207--11232), alongside the two collision rows and cycle data.  The same
shape is repeated by the downstream positive producer (L11400--11414).

* `B : FrontierBiApexRobustResidual R` can be produced from a common-deletion
  parent only by the robust arm of
  `frontierCommonDeletionParent_biApexRobust_or_critical`
  (`PhysicalSecondApexCommonDeletion.lean` L188--200); the critical arm does
  not produce `B`.
* Given `B`, `L : FrontierLargeOppositeCapsBiApexRobustResidual B` is produced
  by the large-cap branch of
  `biApexRobust_exactFiveSecond_or_largeOppositeCaps`
  (`BiApexRobustCapBounds.lean` L317--330).  The exact-five branch yields no
  `L`.
* Given `L`, `N` is constructible by
  `⟨surplusCap_card_ge_six_of_largeOppositeCaps L⟩`, exactly as used by the
  bi-apex terminal (L12458--12467).
* `T : FrontierAllLargeCapsTriApexRobustResidual N` is **not** produced by
  the two-source rows, by `B`, by `L`, or by `N`.  It is a strictly stronger
  package carrying three `ApexRichClassStructure` fields plus the cover and
  no-single-centre conditions (L6574--6601).  The two-source target simply
  threads `T` into its consumers (e.g. L11229--11232 and calls at L113xx).
  The only visible construction in this file is local to the bi-apex rotation
  proof, where fresh-parent data and `uniqueFourCover_of_triApexRobust` build
  a `T` immediately before calling the tri-apex terminal (L12417--12452).

Therefore the bottom terminals are applicable to a two-source target **only
on a branch where `B`, `L`, `N`, and especially `T` have already been supplied
or constructed**.  The collision rows themselves do not discharge these
premises.  In the current target, `T` is an assumption (not a derived
consequence), so invoking these terminals does not close the target's missing
producer obligation.

