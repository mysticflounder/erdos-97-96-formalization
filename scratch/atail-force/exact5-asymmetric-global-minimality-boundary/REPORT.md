# Exact-five asymmetric global-minimality boundary

Date: 2026-07-21

Status: **KERNEL-CHECKED NEGATIVE ROUTE GATE. NO SOURCE `sorry` CLOSED.**

## Result

On either asymmetric constructor of
`ExactFiveGlobalCoverStarOutcome`, let

```lean
N : SourceTwoHitNormalForm Q profile M
```

be the production normal form. Its exact critical shell is centered at the
physical target `M.target` and contains both named outside points. Therefore
deleting either outside point already destroys K4 at that same known center.
The checked scratch theorems are:

```lean
SourceTwoHitNormalForm.outside_deletions_block_at_target
SourceTwoHitNormalForm.nonempty_outside₁_singletonMinimalDeletionCore
```

The second theorem constructs the explicit stutter

```lean
Nonempty (MinimalDeletionCore D.A {N.outside₁} M.target.1)
```

Consequently, applying global minimality to
`{N.outside₁, N.outside₂}` cannot force a fresh center or a two-source
deletion core. It may legitimately return the existing hub with this
singleton core.

## Closure consequence

Do not add another minimal-deletion adapter on the asymmetric outside pair.
The remaining terminal theorem must couple the total fixed critical system
to the common planar convex/MEC geometry and produce one of the already
terminal outputs:

- `dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂`;
- a contract-complete alternative `IsM44` packet; or
- direct `False` from the same full parent.

The existing fixed-H outside-row split also does not force a distinct second
center: omission yields common-deletion data, while a hit can return the
existing blocker. The exact finite-metric and local MEC regressions remain the
acceptance gates against incidence-only or local-geometry-only arguments.

## Validation

The file was elaborated directly from `lean/`. Both declarations print axiom
closures containing exactly:

```text
propext
Classical.choice
Quot.sound
```

No `sorry`, `admit`, custom axiom, `unsafe`, or `native_decide` is used.
