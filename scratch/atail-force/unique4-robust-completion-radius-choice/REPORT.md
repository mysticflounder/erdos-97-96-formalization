# Robust completion radius-choice checkpoint

## Status

**SOURCE-CHECKED ROW CHOICE; CYCLIC PLACEMENT OPEN.**

`RobustCompletionRadiusChoice.lean` removes the physical-apex restriction from
the existing deletion-robust radius classification.  At an arbitrary carrier
center, global K4 and `FullyDeletionRobustAt` imply exactly one of:

- a positive radius class with at least five carrier points; or
- two K4 radius classes at distinct radii, represented by support-disjoint
  `SelectedFourClass` rows.

The converse is also checked, so at a carrier center this is an exact normal
form for full singleton-deletion robustness.

## Concrete two-row flexibility

The large-class arm has been strengthened to two support-distinct selected
four-rows at the same radius.  The construction replaces one member of a
chosen four-subset by a fifth member of the complete radius class.  Therefore
the two rows generally share three support points; they are proved distinct,
not disjoint.

The distinct-radius arm supplies two support-disjoint rows.  In both arms the
checked packet `RobustCompletionRowChoice` exposes separate
`leftCompletionRow` and `rightCompletionRow` fields at one common center.
This is the row-selection interface needed by the weaker aggregate consumer
`TwoCompletionRowMiddleArcPlacement`: one completion row need not supply both
outer arcs.

This is existential flexibility, not arbitrary-choice flexibility.  The
theorem supplies two concrete rows; it does not say that every pair of rows at
the center has the needed boundary placement.

## Adaptation of the global deletion trichotomy

The checked theorem
`exists_strictCap_robustCompletionChoice_or_singletonCore` consumes
`exists_strictCap_collision_or_singletonCore_or_packedCore` and produces:

- on either the collision or nontrivial packed-core arm, a strict-cap carrier
  center omitted from the fixed `CriticalShellSystem`, its full robustness
  classification, and the concrete two-row completion choice; or
- the singleton `MinimalDeletionCore` arm, retained separately with its
  source deletion data.

The robust packet intentionally forgets collision-specific and packing-
specific witnesses after extracting their common load-bearing consequences.
The singleton arm is not assigned a robustness classification, because its
source theorem does not provide one.

## Exact remaining obligation

The radius classification does **not** prove
`ThreeRowMiddleArcPlacement` or its weaker two-row replacement
`TwoCompletionRowMiddleArcPlacement`.  In particular it does not establish:

- that the left completion row's left outer arc occurs before the first
  fixed-image row;
- that the two fixed-image row arcs occur in the required order; or
- that the right completion row's right outer arc occurs after the second
  fixed-image row.

The next mathematical producer must combine the strict-cap location and
omitted-image/global-deletion data with convex boundary order to prove those
three gap inequalities, or reach another existing terminal.  Merely choosing
two rows at the robust center is now source-closed and should not be mined
again.

## Validation

The focused Lean check ran with warnings as errors:

```bash
cd lean
LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
/tmp/unique4-robust-completion-modules \
lake env lean -R .. -M 16384 -DwarningAsError=true \
../scratch/atail-force/unique4-robust-completion-radius-choice/RobustCompletionRadiusChoice.lean
```

All printed declarations close over only:

```text
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` occurs in this checkpoint.

Before formalizing the classifier, the local theorem-bank registries and the
indexed Lean corpus were searched.  No arbitrary-carrier-center equivalent or
existing two-row same-radius choice packet was found.
