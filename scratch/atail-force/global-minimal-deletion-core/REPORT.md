# Global minimal-deletion-core bridge

Date: 2026-07-16

Status: **KERNEL-CHECKED POSITIVE BRIDGE; SINGLETON ARM INSTALLED;
FRESH CENTER STRICT-CAP LOCALIZED; FRONT-A CLOSURE STILL OPEN.**

Adoption note: after the originating lane was stopped to avoid duplicated
work, the main closure lane independently recompiled this checkpoint and
adopted it unchanged as the checked predecessor of the provisional
`RobustSecondApexMinimalDeletion` theorem.  Downstream integration belongs in
`robust-second-apex-minimal-deletion/`; this directory remains the single home
of the global extractor and must not be reimplemented in either robust-radius
arm.

## Strongest checked output

`GlobalMinimalDeletionCore.lean` turns global cardinal minimality into a
source-faithful local obstruction.  For a prescribed nonempty deletion set
`U ⊆ D.A` with nonempty complement, it produces

```text
center ∈ D.A \ U,
nonempty V ⊆ U,
K4 fails at center after deleting V,
restoring any one member of V restores K4 at center.
```

The set `V` is chosen with minimum cardinality among the blocking subsets of
`U` at `center`.  If two members of `V` have the same radius from `center`,
that collision is returned literally.  Otherwise the existing checked
`MinimalDeletionCore` constructor supplies one exact ambient four-shell
through every source in `V`, with pairwise-disjoint supports.

The refined frontier application uses

```text
U = {P.q, P.w, H.centerAt P.q P.q_mem_A} ∪ S.triangle.verts.
```

This set has cardinality at most six.  Its complement therefore remains
nonempty under the live bound `9 < D.A.card`.  Since all three Moser vertices
are deleted, the fresh center is not a Moser vertex and hence lies in the
strict interior of one indexed cap:

```text
∃ k : Fin 3, center ∈ S.capInteriorByIndex k.
```

The first opposite apex and the actual `q`-blocker are two distinct carrier
centers equidistant from the frontier pair.  The checked three-center
perpendicular-bisector theorem therefore gives

```text
dist center P.q != dist center P.w.
```

The theorem

```text
SurvivorPairRelocationPacket.
  exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
```

returns exactly one of:

1. a shared-radius collision among distinct members of `V`;
2. a genuine `MinimalDeletionCore D.A V center` with
   `2 ≤ V.card` and `4 * V.card ≤ D.A.card`; or
3. an `InstalledSingletonFrontierOmission P V center`.

The `q,w` pair itself cannot be the collision in arm 1.

## Four-role location refinement

There is also a sharper four-role version based on

```text
U = {P.q, P.w, S.oppApex1, H.centerAt P.q P.q_mem_A}.
```

It keeps the collision set smaller and performs a complete location split for
the fresh center.  The theorem

```text
SurvivorPairRelocationPacket.
  exists_fourRoleFresh_collision_or_locatedCore_or_installedSingleton
```

proves that the center is either:

- a Moser vertex other than the first opposite apex; or
- a point in one strict indexed cap interior.

For a multi-source core this becomes `LocatedCorePacking`:

- in the strict-cap case,
  `2 * V.card ≤ (D.A \ S.capByIndex k).card`;
- in the Moser case, the cap opposite the center has cardinality at least six.

Consequently:

- in a `555` profile, the Moser-center multi-core arm is impossible, so the
  center must be strict-cap interior;
- in a `654` profile, a Moser-center multi-core can occur only at the Moser
  vertex opposite the unique six-point cap.

These implications are separately packaged as checked
`LocatedCorePacking` lemmas.  They do not eliminate the collision or
singleton arms.

## Singleton arm

A singleton core is no longer left as an unnamed escape.  If `V = {source}`,
the fresh exact shell is installed into the current `CriticalShellSystem` by
the checked pointwise `overrideAt` operation.  Because the fresh center has
different radii to `P.q` and `P.w`, its exact shell omits at least one of
those frontier points.  The installed packet retains:

- the unique source and its exact shell;
- the literal blocker proof for deleting that source;
- the chosen omitted target in `{P.q, P.w}`;
- K4 survival at the fresh center after deleting that target; and
- the same geometric survivor pair rebased to the modified shell system.

This is a real choice-late improvement.  It is not by itself a contradiction:
the remaining proof needs a progress invariant showing that such overrides
eventually force a favorable positive incidence, a removable point, or a
finite orbit contradiction.

## Packing consequences

Two independent checked packing inequalities are available.

Global shell packing:

```text
4 * V.card ≤ D.A.card.
```

Every core source owns a disjoint exact four-point support.  This gives the
sharp small-cardinality consequences:

- if `D.A.card = 11` (profile `554`), the genuine core has exactly two
  sources;
- if `D.A.card = 12` (profiles `555` and `654`), the genuine core has two or
  three sources.

These are packaged as

```text
exists_strictCapFresh_collision_or_twoSourceCore_or_installedSingleton
exists_strictCapFresh_collision_or_twoThreeCore_or_installedSingleton.
```

Cap-complement packing:

```text
2 * V.card ≤ (D.A \ S.capByIndex k).card
```

whenever the core center lies in `S.capByIndex k`.  The cap-chain theorem
allows at most two targets of each exact shell in the center's cap, so every
shell consumes at least two distinct targets outside it.  This inequality is
potentially stronger than global packing when the center cap is large.

The fixed-cardinality corollaries are partial results only.  The front-A
claim ranges over unbounded carrier cardinalities.

## Exact remaining gap

The bridge does not prove O10 or close the live K-A-PAIR theorem.  It leaves
three geometric obligations:

1. classify and eliminate the remaining shared-radius pairs among
   the four-role set (or the six-role strict-cap set), using the fresh-center
   location split;
2. eliminate the two/three-source disjoint-shell cores in the balanced small
   profiles, and the packed multi-source cores at larger cardinalities; or
3. turn the installed singleton omission into a monotone override/finite-orbit
   argument rather than merely rebasing the frontier.

The existing strengthened incidence shadows show that support-table or
blocker-graph information alone does not force a contradiction.  A next
consumer must visibly use Euclidean cap order, MEC geometry, `hNoM44`/H7, or
another comparably strong field.

## Live interface boundary

The named production residual

```text
Problem97.U1LargeCapRouteBTailMetricResidualTarget.
  DoubleApexOffSurplusSharedRadiusPair
```

retains `∀ x, ¬ IsRemovableVertex D.A x`, but does not retain `D.Minimal`.
The upstream theorem
`Problem97.removableVertexOfLarge_of_nonIsM44` constructs `hmin` immediately
before deriving non-removability and calling the route-B tail, so the data is
available one layer above the current residual but is dropped from the tail
interface.

Non-removability cannot replace minimality in this extractor.  From K4 on
`A \ U`, enlarging to `A.erase x` introduces the additional centers in
`U \ {x}`; those centers need not retain witness circles.  Thus the global
four-equidistant property is not upward-monotone in the carrier.  Any live
use of this bridge must either thread `hmin` through the route-B interfaces or
find a different argument that controls those newly introduced centers.

No production theorem was changed in this scratch lane.

## Bank preflight

Before each new finite-pattern step, the required sibling, legacy, and older
general theorem-bank registries were checked, together with focused
`nthdegree docs search --lean` queries.  The closest reusable results were:

- `double_erase_survives_or_two_disjoint_exact_shells`;
- `exists_minimalDeletionCore`;
- `CriticalShellSystem.overrideAt` and its exact selected-class lemmas;
- `false_of_three_carrier_bisector_centers`; and
- the cap selected-row intersection bound.

No banked declaration supplied the global minimal-deletion extractor, the
installed singleton frontier omission, the strict-cap-localized composition,
or the disjoint-shell cardinal packing theorem.  The implementation reuses
the existing exact-shell, rebase, cap-chain, and bisector consumers rather
than reproving them.

## Validation

The scratch rebase dependency was compiled to a temporary olean, then the
main file was checked from `lean/`:

```bash
env LEAN_PATH=/tmp/p97-global-minimal-deletion-core-oleans:./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 \
  -o /tmp/p97-global-minimal-deletion-core-oleans/CriticalSystemRebase.olean \
  ../scratch/atail-force/critical-system-rebase/CriticalSystemRebase.lean

env LEAN_PATH=/tmp/p97-global-minimal-deletion-core-oleans:./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/global-minimal-deletion-core/GlobalMinimalDeletionCore.lean
```

The final check exits `0` without linter warnings.  Every printed declaration
has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, `native_decide`, or new axiom.
