# Common-deletion critical expansion

## Outcome

`CommonDeletionTwoCenterPacket` is not a terminal contradiction packet.  It
does, however, have a substantially stronger unconditional continuation than
the earlier two-circle overlap field exposed.

The kernel-checked normal form is:

```text
common deletion at q, with centers c1 != c2
  -> at least three points of B1 union B2 lie outside q's exact critical shell
  -> each is a fresh critical source whose blocker differs from blocker(q)
  -> either
       one fresh source survives deletion at both c1 and c2,
       hence gives a successor CommonDeletionTwoCenterPacket at the same centers;
     or
       two distinct fresh sources are deletion-critical at the same ci,
       and both exact critical shells coincide with the original row Bi.
```

The second arm is sourcewise-installable after the labels are known.  The two
prescribed shells can be installed in a new `CriticalShellSystem`; both fresh
sources then map to the chosen row center, while the deleted source's blocker
is unchanged.  This matches the late-critical-system quantifier order in
`critical-system-rebase/FavorableSystemParentSurface.lean`.

This is **PROVEN**.  It is not yet `False`: the remaining mathematical target
is a consumer for either recursive common-deletion expansion or the
two-source row-aligned critical arm.

## Kernel-checked declarations

The file `CommonDeletionCriticalExpansion.lean` proves:

- `rebaseCommonDeletionSystem`: change the critical system without changing
  either exact q-deleted row;
- `overrideCommonDeletionAt`: install one certified shell after packet labels
  have been selected;
- `dangerousTriple_at_commonDeletion`: the deleted source's retained exact
  shell gives a `U5DangerousTriple`;
- `two_le_row_sdiff_deletedCriticalSupport`: each q-deleted row has at least
  two points outside that shell;
- `three_le_rows_union_sdiff_deletedCriticalSupport`: the two rows jointly
  have at least three such points;
- `freshCriticalSource_of_mem`: every outside point has a chosen blocker
  distinct from the deleted source's blocker;
- `nonempty_threeFreshCriticalSources`: named three-source form;
- `deletedBlocker_distance_ne_of_common_outside_pair`: if the two rows share
  an outside pair, their two centers already exhaust the carrier bisector
  bound, so the deleted source's blocker separates the pair by distance;
- `prescribedCritical_support_eq_of_common_center`: two prescribed critical
  shells at one center have identical exact support;
- `prescribedCritical_support_eq_qDeletedRow`: a prescribed critical shell at
  one row center is exactly that q-deleted four-row;
- `freshSourcePrescribedTransition`: one fresh source either gives a successor
  common-deletion packet or a certified critical shell at one current center;
- `commonDeletion_successor_or_alignedCriticalPair`: the three-source/two-center
  pigeonhole normal form above;
- `AlignedPrescribedCriticalPair.installedSystem_centerAt_first`,
  `.installedSystem_centerAt_second`, and
  `.installedSystem_centerAt_deleted`: exact sourcewise-override behavior;
- `AlignedPrescribedCriticalPair.installedPacket`: the original two rows
  rebased to that sourcewise-installed system;
- `nonempty_commonDeletionCriticalExpansion`: consolidated theorem-facing
  expansion packet; and
- `nonempty_commonDeletionCriticalExpansion_after_rebase`: the same packet
  after any favorable-system choice.

Every printed declaration reports only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.

## Why three fresh sources are unconditional

The two exact q-deleted rows each have cardinality four and overlap in at most
two points, so their union has cardinality at least six.  The exact critical
shell at q has four points and contains q.  Neither q-deleted row contains q,
so at most the other three critical-shell points can cover the row union.
Therefore at least three points remain outside the shell for every late-chosen
critical system.  The older shared-pair-versus-three-source split is thus
unnecessary: its three-source arm always holds.

## Relation to the full parent telescope

The result uses the actual `CounterexampleData` geometry and global K4 through
the prescribed-deletion split.  The common critical system is supplied by the
parent's no-removability hypothesis.  The following retained parent inputs are
not yet consumed by this local expansion:

- MEC and ordered-cap placement;
- `hNoM44`;
- the second-large-cap witness; and
- the live U1 fixed-triple telescope.

Those inputs are the available opportunity for a terminal consumer **if the
one existentially chosen parent tuple routes into this common-deletion
branch**.  The actual parent surface in
`critical-system-rebase/ExistentialParentSurface.lean` only asks for one
second-large-cap/radius/frontier/continuation/favorable-system tuple.  It does
not require this expansion, or cycle elimination, uniformly for every such
choice.  The current theorem is therefore a candidate branch normal form,
not a statement of the unique remaining parent obligation.

## Theorem-bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the existing
two-circle-overlap theorems, current critical-frontier declarations, and U5
incidence consumers.  No banked theorem consumes only a generic
`CommonDeletionTwoCenterPacket`.  The U5 consumers require additional named
incidence/confinement fields, and the older U3-to-U5 audit-frame constructors
use `D.IsM44`, opposite to this lane's `hNoM44` surface.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/common-deletion-consumer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/CommonDeletionCriticalExpansion.olean \
  ../scratch/atail-force/common-deletion-consumer/CommonDeletionCriticalExpansion.lean
```

The direct single-file check completed successfully.  No production target or
full `lake-build` was run in this lane.

## Finite successor endpoint

`CommonDeletionSuccessorCycle.lean` now kernel-proves the exact endpoint of
iterating the successor arm.  For one fixed pair of centers, either:

1. some surviving deleted source has an `AlignedPrescribedCriticalPair` in
   one of its two selected exact rows; or
2. the chosen fresh-source successor map has a periodic orbit of period at
   least two.

Every edge in the periodic orbit remains in one of the two current rows,
avoids the current source's exact critical shell, changes the retained
blocker, and changes the deleted source.  Finiteness supplies recurrence, but
it cannot make the period one because every fresh successor differs from its
source.

The file also gives two provenance-preserving adapters:

- `nonEquilateral_alignedPrescribedPair_or_successorCycle` keeps
  `S.oppApex2` and the two concrete continuation centers `P.z₁`, `P.z₂`
  visible; and
- `globalEscape_alignedPrescribedPair_or_successorCycle_or_apexAlignment`
  keeps the strict-`oppCap2` survivor center, the concrete global escape
  source, both possible initial deleted sources, and the existing
  `ApexDoubleCriticalResidual` branch visible.

The generic periodic arm is not contradictory.  Successive packets may
choose different exact rows and radii, so a repeated deleted source does not
by itself identify two row supports or produce a second-center equidistance
pair.

## Exact cycle regression

`successor_cycle_countermodel.py` pins an exact 24-vertex finite regression
with model digest

```text
f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
```

Inside the explicitly stated symmetric distance-equality abstraction, it
simultaneously verifies:

- global K4 at every center;
- one or three exact four-point radius classes at every center;
- intersection at most two for every exact four-class at distinct centers;
- a total deletion-critical shell/blocker assignment;
- deletion survival at both fixed centers for every carrier source;
- exact common-deletion packets and at least three fresh successors at every
  source; and
- the genuine successor cycle `1 -> 4 -> 8 -> 1`, with every edge outside
  the current critical shell and changing the chosen blocker.

No source is deletion-critical at either fixed center, so the aligned
prescribed-pair branch is absent throughout this model.  This is a regression
against any proposed geometry-free termination theorem.  The model is **not**
a Euclidean realization and does not encode convexity, MEC placement, ordered
caps, or the full `CounterexampleData` axioms; it therefore does not refute a
producer which visibly consumes those parent fields.

## Exact provenance-aware branch residual

Generic recursion termination is not a valid target.  If the existentially
chosen parent tuple is closed through this common-deletion route, the local
candidate is a provenance-aware consumer for the disjunction above:

- in the aligned arm, use the concrete cap/MEC roles of the fixed center to
  turn two source shells equal to one current row into a second-center
  equality, forbidden placement, or another named terminal packet; or
- in the periodic arm, transport the concrete strict-cap/global-escape roles
  through an orbit edge and derive a monotone placement change or a repeated
  metric support which the abstract regression intentionally does not carry.

For the non-equilateral wrapper those roles are the second apex and the two
strict `oppCap2` continuation centers.  For the cross/global-source wrapper
they are the strict `oppCap2` survivor center and the escape source outside
that cap.  Inside this branch, `hNoM44` and its second-large-cap witness do not
constrain the orbit until a theorem ties that witness to one of these sources,
blockers, or exact rows.

This is not mandatory for parent closure: a favorable existential choice of
`j`, `r`, frontier, continuation, and late critical system may route to a
different eliminator and bypass the periodic alternative entirely.  The
cycle result should be used as a regression gate and as a normal form when
the chosen route actually exposes `CommonDeletionTwoCenterPacket`, not
promoted back to universal `LateCriticalSystemParentContent`.

The additional checks were run from the repository root and `lean/`
respectively:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/common-deletion-consumer/successor_cycle_countermodel.py

LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/common-deletion-consumer \
  -R ../scratch/atail-force/global-source-selection \
  -R ../scratch/atail-force/cross-survival-eliminator \
  -R ../scratch/atail-force/frontier-continuation-dispatcher \
  -R ../scratch/atail-force/continuation-bank-match \
  -R ../scratch/atail-force/non-equilateral-continuation \
  -R ../scratch/atail-force/critical-system-rebase \
  -R ../scratch/atail-force/continuation-cap-order-classifier \
  -R ../scratch/atail-force/continuation-geometry-classifier \
  -R ../scratch/atail-force/joint-transition-core \
  -M 16384 \
  ../scratch/atail-force/common-deletion-consumer/CommonDeletionSuccessorCycle.lean
```

The Lean declarations print only `propext`, `Classical.choice`, and
`Quot.sound`; no `sorryAx` is introduced.
