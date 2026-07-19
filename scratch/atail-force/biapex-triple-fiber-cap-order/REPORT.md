# Bi-apex triple-fiber cap-order audit

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT CAP RESIDUAL; NO ORDINAL CYCLE YET. NO
PRODUCTION `sorry` IS CLOSED.**

## Required theorem-bank preflight

Before deriving the scratch reduction, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also queried the indexed Lean corpus with `nthdegree docs search --lean`
for:

- three distinct sources with one actual blocker and one exact critical
  support;
- a common-center four-shell combined with convex cap order; and
- blocker-fiber cardinality three and Kalmanson strict cycles.

The closest hits were the existing support-locking API,
`SameCapBlockerEdge`, `WitnessLapInterface`, the production
`BiApexBlockerMultiplicity` reduction, and the current Kalmanson consumers.
No banked theorem turns the larger-fiber packet alone into a cross-row
incidence or strict cycle.

## Exact correction to the row interpretation

The larger-fiber arm of

```text
FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
```

produces three distinct sources `source₁`, `source₂`, `source₃` with one
blocker value.  These are **not three independent geometric rows**.  The
critical support-locking theorem identifies all three source-indexed rows
with one exact four-point shell centered at the common blocker.

`BiApexTripleFiberCapOrder.lean` kernel-checks this normalization.  In
particular:

```text
source_mem_other_shell_of_blocker_eq
TripleFiberWitness.exists_fourth_with_commonShell_eq
```

show that all three sources lie in one exact critical support and that there
is a unique fourth shell point:

```text
commonShell.support = {source₁, source₂, source₃, fourth}.
```

The deletion-critical facts at the three source indices add no further local
incidence: deleting any one of three named members of an exact four-shell
already destroys that shell at its center.

## Full-parent cap reduction

The scratch type `TripleFiberWitness R` remains indexed by the complete
production `FrontierBiApexRobustResidual parent`.  The proof uses both
physical-apex robustness facts to exclude the two physical opposite apices
from the blocker image.

The resulting theorem is:

```text
TripleFiberWitness.nonempty_capPlacementResidual
```

with two exact arms.

### 1. Triangle-blocker arm

If the common blocker is a Moser vertex, it must be the one remaining vertex
opposite the surplus cap:

```text
commonBlocker = S.oppositeVertexByIndex S.surplusIdx.
```

For each non-surplus cap this blocker is an ordered-cap endpoint, so the
common exact shell has at most one member in that cap.  Consequently:

```text
2 ≤ (commonShell.support ∩ S.surplusCap).card
```

and at least one of the three fiber sources lies in the strict surplus-cap
interior.  The stronger two-hit statement is kernel-checked as

```text
two_le_commonShell_inter_surplusCap_of_triangleBlocker.
```

### 2. Interior-blocker arm

If the common blocker lies in `S.capInteriorByIndex i`, ordered-cap
one-sided distance injectivity gives

```text
(commonShell.support ∩ S.capByIndex i).card ≤ 2.
```

The three fiber sources are distinct shell members, so at least one source
lies outside that cap.

### External continuation

The retained parent bound `9 < D.A.card` also produces an external source
outside the common four-shell.  Support locking proves that its actual
blocker differs from the triple-fiber blocker:

```text
TripleFiberWitness.exists_external_source_with_distinct_blocker.
```

This is the first genuinely different actual row available on the branch.
No membership of a triple-fiber point in that external row follows from the
current surface.

## Why this does not yet make a Kalmanson cycle

One exact row through four shell points produces only the usual acyclic
distance monotonicities after the five roles are put in cyclic order.  A
strict cycle requires another center and a cross-support equality.  The
larger fiber itself supplies neither: its three source-indexed rows all
collapse to the common shell.

The next honest producer boundary is therefore one of:

1. prove that the external source's actual row contains two specified members
   of the common shell, with the cap placement needed by an existing ordinal
   consumer;
2. produce the same cross-row equality from a physical-apex row retained in
   the parent; or
3. prove one of the two exact cap residuals contradictory by a new MEC or
   full-filter theorem.

The statement must expose which of those additional geometric facts is used;
finite blocker multiplicity and support locking are exhausted here.

## Regression gate

`TripleFiberCapFiniteBoundary.lean` is a kernel-checked finite abstraction,
not a Euclidean counterexample.  It simultaneously retains:

- two omitted blocker values;
- two deletion-robust five-point apex classes;
- a total fixed-point-free source-exact blocker map;
- a three-source blocker fiber with exact four-point support locking;
- the triangle-blocker cap residual, including at most one shell hit in each
  opposite cap and a strict surplus-interior source; and
- cap coverage of the whole finite carrier.

Nevertheless

```text
no_distinct_center_cross_pair_checked
```

shows that no distinct-center row contains two members of the triple fiber.
Any claimed next step using only the retained finite incidence and cap-count
fields is rejected by this fixture.  Genuine Euclidean cap order, MEC, full
radius-filter, or another explicitly named parent equality must enter.

## Validation

Focused elaboration from `lean/` succeeded for both files:

```text
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/biapex-triple-fiber-cap-order/\
BiApexTripleFiberCapOrder.lean

lake env lean -R .. -M 16384 \
  ../scratch/atail-force/biapex-triple-fiber-cap-order/\
TripleFiberCapFiniteBoundary.lean
```

Every printed declaration has axiom closure contained in:

```text
propext
Classical.choice
Quot.sound
```

A source scan found no `sorry`, `admit`, `axiom`, `native_decide`, `unsafe`,
or local heartbeat override.  Only files under
`scratch/atail-force/biapex-triple-fiber-cap-order/` were created.
