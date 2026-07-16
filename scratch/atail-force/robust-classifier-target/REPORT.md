# Robust classifier target audit

Date: 2026-07-14

Status: **TWO REALIZABILITY-SAFE CLASSIFIERS KERNEL-CHECKED; DIRECT GLOBAL
COUPLING REMAINS OPEN.**

## Verdict

The next mining object should be a branch-transition core, not the forbidden
double-apex shared-radius pair and not a theorem eliminating every two-hit
profile.

For a generated row at an outside member of the equilateral continuation,
the exact live hit normal form is now checked in
`../third-row-profile-bank/ThirdRowProfileBank.lean`:

```text
no pair among {z1,z2,O2} is hit
or exact profile {z1,O2}
or exact profile {z2,O2}.
```

The theorem is `low_hit_or_live_apex_pair_profile`.  Its proof sends the
`{z1,z2}` profile to ordered-cap outside-pair uniqueness and sends the
three-hit profile to the U5 tetrahedron terminal.  It deliberately preserves
the two apex-pair profiles, both of which have exact local strictly-convex
realizations.

For either preserved shared pair, the retained total critical map gives the
second checked classifier in `RobustClassifierTarget.lean`:

```text
chosen blocker of endpoint s survives deletion of endpoint t
or chosen blocker(s) = first known bisector center
or chosen blocker(s) = second known bisector center.
```

The theorem
`source_blocker_survives_or_eq_known_commonPair_center` eliminates the only
other case: a genuinely third carrier center equidistant from the same pair
contradicts `Dumitrescu.perpBisector_apex_bound`.  The selected-row and
two-endpoint interfaces are

```text
selected_commonPair_source_blocker_classifier
selected_commonPair_two_source_blocker_classifier.
```

Thus the realizable two-hit arms are not terminal configurations.  They are
transition states whose next information is exact deletion survival or exact
blocker alignment.

## Weakest next robust theorem

The next content theorem should classify several generated outside-member
rows **jointly** into an existing contradiction.  Its input must retain the
parent's concrete `CriticalShellSystem`; reconstructing an unrelated system
after row selection loses the alignment states above.

A sound theorem-facing shape is:

```text
equilateral continuation rows
+ two divergent outside members
+ their generated global rows
+ the same parent CriticalShellSystem
+ no-IsM44 / cap order
->
  an existing U5 equality core
  or an ordered-cap nonalternating shared-pair core
  or a blocker-cycle contradiction
  or False directly.
```

Equivalently, if expressed as a classifier rather than a terminal disjunction,
each generated row should return:

```text
LowHit
or ApexPair(z1,O2, endpoint blocker survival/alignment state)
or ApexPair(z2,O2, endpoint blocker survival/alignment state).
```

The first genuinely unproved step is to show that the joint collection of
these states cannot persist under all-center K4, the one retained total
critical map, and the live MEC/cap/no-`IsM44` geometry.  Proving either
apex-pair profile individually impossible is too strong and fails the local
regression gate.

The eventual production boundary should still be a parent-level direct
`False` theorem, called while the concrete common critical system is in
scope.  The classifiers here are internal normal forms for that proof; they
should not become a replacement existential analogous to K-A-PAIR.

## Bank preflight

The required current/sibling/legacy theorem-bank registries and their JSON
inventories were checked, followed by indexed Lean searches for:

- q-deleted K4 rows sharing a deleted source;
- equilateral/tetrahedron selected-class incompatibilities;
- critical blockers on a known perpendicular bisector;
- reflected-equilateral two-hit profiles; and
- ordered-cap outside-pair centers.

The useful existing endpoints are:

- `u5_unit_triangle_on_p_circle_incompatibility` and the sibling
  three-class tetrahedron theorem;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `Dumitrescu.perpBisector_apex_bound`;
- `cross_deletion_survives_iff_not_mem_selected_support`; and
- `CriticalShellSystem.selectedFourClass_support_eq_shell` after a blocker
  alignment is known.

No indexed or banked theorem contradicts either `{z1,O2}` or `{z2,O2}` from
the live local metric/cap data.  The large U5 bank still supplies consumers,
not the required joint classifier/producer.

## Validation

From `lean/`:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/robust-classifier-target/RobustClassifierTarget.lean

lake env lean -M 16384 \
  ../scratch/atail-force/third-row-profile-bank/ThirdRowProfileBank.lean
```

Both commands exit successfully.  Every new public axiom probe reports
exactly:

```text
propext, Classical.choice, Quot.sound
```

Neither file contains `sorry`, `admit`, a declared axiom, or
`native_decide`.  No production source or closure document was edited by this
audit.
