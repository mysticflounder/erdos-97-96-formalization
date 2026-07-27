# Global exact-four blocker-multiplicity checkpoint

## Scope

This lane targets the final `sorry` in
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`.
It does not edit production source.

The production proof now reaches
`third_fiber_or_larger_known_fiber_of_three_omissions`, whose output has
three arms:

1. a collision fiber at a blocker distinct from both named blockers;
2. a third source in the first named blocker fiber; or
3. a third source in the second named blocker fiber.

## Checked narrowing

`BlockerMultiplicityGeometry.lean` proves
`collisionCrossHit_or_geometricMultiplicity` without adding a closer
hypothesis.

The conclusion is a named cross hit or one of three fully geometric packets:

- `FreshThirdBlockerFiber`: two fresh carrier sources with a common new
  blocker, each lying in the other source's canonical four-shell;
- `FreshOutsideFirstBlockerFiber`: a fresh source in the first named
  four-shell, together with the other point of that shell outside the first
  cap; the two points are exactly the shell-minus-cap remainder and neither
  is a source of the second collision row; or
- the symmetric `FreshOutsideSecondBlockerFiber`.

The exact remainder calculation is separately exposed as
`collisionShell_sdiff_firstCap_card_eq_two`.

Thus, after excluding the desired cross-hit conclusion, a larger-known-fiber
arm is not merely “one more source”: it yields the complete two-point
off-cap remainder of that exact four-shell.

## Exact residual producer

The current hypotheses still do not positively place either normalized
packet into a second row or into a rich strict-cap slice.  One of the
following genuinely global incidence producers is required:

1. **New blocker fiber.**  From `FreshThirdBlockerFiber` plus the retained
   tri-apex/cap/minimality data, produce either a named cross hit or a
   canonical shell whose intersection with one rich apex strict-cap radius
   class has cardinality at least three.
2. **Known blocker fiber.**  From either exact two-point off-cap remainder,
   produce one of:
   - a second selected row containing both remainder points;
   - an alignment of a remainder point with two points of one rich apex
     strict-cap radius class; or
   - a global MEC/full-filter contradiction for that exact off-cap pair.
3. **Cap-equality arms.**  If `hcapEightOrCross` chooses a blocker/source
   equality, it needs an equality-specific global contradiction.  The
   equality itself makes the corresponding named cross hit false: a critical
   four-shell excludes its own center.

The localized mutual-omission cycles supply negative memberships only.  The
cap-eight connector likewise supplies a row omitting named endpoints, not a
positive occurrence of the new sources.  Neither currently consumes the
normalized packets above.

## Why the named-role minimal-deletion split does not close this target

`NamedRoleMinimalDeletion.lean` proves a sound nine-role fresh-center split,
but its fresh blocked center and deletion set are not linked to either
collision shell, either exact off-cap pair, or a rich strict-cap radius
slice.  Its shared-radius-pair arm therefore supplies no target incidence,
and its `MinimalDeletionCore` arm has no terminal consumer here.

The missing fact is a positive occurrence/alignment producer, not another
freshness or omission split.

## Validation

From `lean/`:

```text
lake env lean -M16384 ../scratch/global-exact-four-prover/BlockerMultiplicityGeometry.lean
```

Result: typechecks on Lean 4.27.  Printed axiom profile for the main theorem:

```text
[propext, Classical.choice, Quot.sound]
```

The file contains no `sorry`, `admit`, declared `axiom`, `native_decide`, or
`Lean.trustCompiler`.
