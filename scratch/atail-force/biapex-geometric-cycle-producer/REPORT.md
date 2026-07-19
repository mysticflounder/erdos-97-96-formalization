# Bi-apex geometric-cycle producer audit

Date: 2026-07-17

Scope: scratch-only audit of the proposed continuation

```text
FrontierBiApexRobustResidual
  -> two blocker fibers or one blocker fiber of size at least three
  -> TransGen SelectedRowOrdinalComparison cycle
  -> False.
```

**Scope correction (2026-07-17).** The `Fin 12` and fixed fourteen-role
regressions cited below are local theorem-discovery/API gates only. Their
underlying census profile is `(8,4,5)`, with physical `oppCap2` of cardinality
four, while the live large-physical robust branch requires
`6 ≤ S.oppCap2.card`. No extraction theorem connects that fixed profile to the
live `FrontierBiApexRobustResidual`. See
`two-omission-kalmanson-search/REPORT.md`; finite exhaustion of that profile
would not be live closure evidence.

## Result

The first arrow now has a source-exact, kernel-checked lift in
`BiApexGeometricCycleProducer.lean`:

```lean
FrontierBiApexRobustResidual.nonempty_exactCriticalFiberMultiplicity
```

It returns either:

1. two `FrontierCommonDeletionCriticalFiber`s with different actual blocker
   values; or
2. two overlapping exact critical fibers containing three distinct sources
   in one actual blocker fiber.

The proof uses the production theorem
`exists_two_fibers_or_larger_fiber` and reconstructs the complete exact
selected-support packet for every blocker collision. Its axiom closure is

```text
[propext, Classical.choice, Quot.sound]
```

It does not close a production `sorry`. The proposed second arrow is not yet
covered uniformly from the live parent, but the original `Fin 12` argument
against it was too strong; the correction is recorded below.

## Why the normal form does not yet feed an ordinal cycle

Each exact critical fiber provides one equality pair:

```text
source1, source2 are equidistant from their common actual blocker.
```

The bi-apex multiplicity proof obtains its collisions in the complete
critical blocker endomap. It does **not** say that either collision pair lies
in one selected radius class at the first or second physical apex. In
particular, it does not produce

```lean
dist S.oppApex1 P.source₁.1 = dist S.oppApex1 P.source₂.1
```

or the stronger retained-radius packet

```lean
P.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius
P.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius.
```

That distinction is already explicit in production. A
`RetainedRadiusCollision` carries exactly these two memberships and therefore
has the proved boundary-alternation theorem
`RetainedRadiusCollision.exists_boundary_alternation`. The general blocker
fibers returned by `exists_two_fibers_or_larger_fiber` do not instantiate
that structure. The production `RetainedRadiusBlockerOutcome` also retains a
matching arm, so a theorem asserting that an aligned collision always exists
would incorrectly erase a live alternative.

Consequently, two robust physical apices plus global blocker multiplicity do
not yet identify even the second equality center needed for a crossing
comparison on either returned pair. They also provide no cap placement that
selects a cyclic order for sources from two different fibers.

## Ordinal interface correction

`SelectedRowOrdinalComparison` exposes two one-row cancellations for an
increasing quadruple. It has no constructor for an equality row at the fourth
boundary vertex. The scratch theorem

```lean
dist_secondSide_lt_firstDiagonal_of_ccw_of_lastRow
```

kernel-checks that missing source-valid orientation directly from
`dist_add_dist_lt_diagonal_sum_of_ccw`. Its axiom closure is

```text
[propext, Classical.choice, Quot.sound]
```

There is a second interface consideration: the production five-point terminal
`false_of_selected_rows_in_five_ccw_order` obtains one side of its strict
cycle by cancelling **two** selected-row equalities in one Kalmanson
inequality. Such a step is not represented directly by either current one-row
constructor. However, this does **not** make the old `Fin 12` model a
regression against generic ordinal closure. Once distance terms are quotiented
by all selected-row equalities, its rows 0 and 1 both contain `{2,3}` in the
order `0 < 1 < 2 < 3`; the row-0 strict comparison is therefore an immediate
self-loop. `biapex-strategy-audit/BiApexFiniteBoundary.lean` kernel-checks the
corresponding `SelectedRowOrdinalComparison` cycle, and production
`false_of_two_selected_rows_shared_late_pair` proves the same four-point
cancellation directly.

For a uniform producer-bank adapter, the remaining interface choices are:

- adding all one-row cancellation orientations and a source-valid multi-row
  comparison constructor; or
- using a relation over full linear Kalmanson/Farkas certificates rather than
  only the present two hand-selected steps.

An API extension would make additional already-proved inequalities
representable. It would not by itself prove that every live parent reaches one
of the represented cycles; that coverage is the remaining issue.

## Smallest honest live producer

For a chosen exact critical fiber `P`, the first missing geometric datum is a
second source-faithful equality center for `P.source₁,P.source₂`. The most
useful form is the existing retained-radius alignment

```text
P.source1 and P.source2 lie in the retained first-apex radius class.
```

That yields the first-apex equality and a boundary alternation against the
common blocker. On the collision continuation already factored in production,
the next exact row incidence is

```lean
K ∈ (H.selectedAt J J_mem_A).toCriticalFourShell.support
```

for a genuinely different pair `J,K`. This is equivalent to an actual
critical row at `J` providing `XJ = XK`. However, it is not sufficient by
itself: a live closer must additionally use cap/MEC placement, a full-radius
filter, another prescribed-deletion row, or `noM44` to force a cyclic order
that the local equalities cannot realize.

Thus the source-valid route should remain split:

```text
retained-radius collision:
  aligned collision + actual different-pair cross row + global cap/order fact
    -> full Kalmanson certificate -> False

retained-radius matching:
  existing retained-matching continuation

global second blocker fiber / larger fiber:
  auxiliary information only until one returned fiber is aligned with a
  physical-apex row or a cap-local two-center consumer.
```

The raw two-fiber-or-larger-fiber theorem is not a replacement for this
alignment split.

## Regression gates

Two existing gates were re-elaborated against the current branch.

1. `biapex-strategy-audit/BiApexFiniteBoundary.lean`, as a **non-live local
   incidence regression**, still kernel-checks that
   the named specialized `J,K` cross-row completion is not forced by the raw
   finite prefix. It is **not** a Kalmanson-clean survivor: equality
   normalization exposes an immediate generic ordinal loop, also
   kernel-checked in that file.
2. `retained-collision-second-fiber/DifferentPairAcyclicModel.lean`
   kernel-checks an exact rational strictly convex local model with the
   collision equality, first-apex equality, one different-pair cross-row
   equality, and the forced alternation, but no local contradiction. The
   companion exhaustive audit leaves five of seven alternation-compatible
   cyclic order types acyclic; all five have exact rational realizations.

Any proposed specialized `J,K` producer must respect these gates unless it
visibly consumes a global hypothesis absent from them. They do not block the
generic equality-quotiented ordinal route. In particular, the current next
gate must be a live cap-size-parametric extraction or a direct Lean theorem,
not another fixed `(8,4,5)` coverage search and not acceptance of this
`Fin 12` model as a survivor.

## Existing-bank preflight

Before formalizing the lift, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md`;
- the indexed production ATail modules; and
- `nthdegree docs search --lean` for the normalized bi-apex blocker-fiber,
  selected-row ordinal-cycle, cap-boundary, and critical-row statements.

No banked theorem supplies the missing physical-apex alignment, different-pair
cross incidence, or residual cap-order closer.

## Validation

The new scratch file was elaborated with:

```text
lake env lean -R .. -M 16384 -s 65536 \
  -o /private/tmp/p97-biapex-geometric-cycle-producer.olean \
  ../scratch/atail-force/biapex-geometric-cycle-producer/BiApexGeometricCycleProducer.lean
```

The two regression modules were independently re-elaborated to temporary
oleans. All three commands exited successfully, and the printed axiom sets
contain no `sorryAx`.
