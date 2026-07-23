# Selected-four-class shell-curvature adapter

Date: 2026-07-22

Status: **SOURCE-COMPLETE SCRATCH ADAPTER, WERROR-CLEAN.**  This lane changes no
production or protected shell-curvature file.

## Result

[`SelectedFourClassCurvature.lean`](SelectedFourClassCurvature.lean) extends the
production `ShellBoundaryIndexing` API to an arbitrary
`SelectedFourClass A center` whose center is known to lie in `A`.

It defines the four centered-chart support indices and their canonical
increasing order, then proves

```lean
image_selectedCenteredChart_point_supportOrder
```

which states that the four sorted chart points enumerate `K.support` exactly.
The public index lemmas give positivity and strict containment in the centered
fundamental window.

The main theorem is

```lean
selectedFourClass_has_globalSelectedQuarterTurnArcs
    (B : ShellBoundaryIndexing A)
    (K : SelectedFourClass A center)
    (hcenter : center ∈ A) :
    B.HasGlobalSelectedQuarterTurnArcs K hcenter
```

where the conclusion unfolds to the two strong transported inequalities

```text
pi / 2 < curvature(global chart, s, s + i1)
pi / 2 < curvature(global chart, s + i2, s + card A).
```

Here `s` is the global lift coordinate of `center`, while `i1` and `i2` are
the second and third support positions in the centered increasing order.
These are exactly the two arc choices used by the exact-two curvature ledger.

The source-facing constructor

```lean
exists_globalSelectedQuarterTurnArcs
    (hconv : ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (K : SelectedFourClass A center)
    (hcenter : center ∈ A) :
    ∃ B : ShellBoundaryIndexing A,
      B.HasGlobalSelectedQuarterTurnArcs K hcenter
```

constructs the common boundary indexing as well.

## Hypothesis audit

The only premise needed beyond `SelectedFourClass` and an existing global
boundary indexing is

```lean
hcenter : center ∈ A.
```

`SelectedFourClass` stores membership of its four support points in `A`, but
does not store carrier membership of its center.  Global-K4 completion rows are
centered at carrier points, so their source construction supplies this premise.

No complete-radius-class equality, deleted source, blocker-image membership,
criticality, or uniqueness assumption is used.  The proof calls the production
theorem

```lean
openWindow_two_sided_quarter_turn_separation_of_equal_radius
```

which needs only four ordered equal-radius points, and then uses the production
centered-to-global transport theorem.

For the constructor without a supplied `ShellBoundaryIndexing`, noncollinearity
is also explicit.  In the live `CounterexampleData` setting it follows from
convex independence and the existing carrier cardinality bound, exactly as in
`exists_perRow_quarterTurnSeparation_for_criticalSourceRows`.

The genuine remaining gap is therefore not row transport.  It is the uniform
source occurrence theorem identified in the exact-two curvature audit: choose
four of these transported arcs with pairwise disjoint open turn supports.

## Theorem-bank preflight

The required registered P97 theorem-bank documents were searched for selected
four classes, boundary ordering, curvature, and quarter-turn results.  Focused
`nthdegree docs search --lean` queries found the production raw theorem,
critical-shell adapters, and global transport, but no selected-four-class
adapter.  No finite certificate theorem was reproved.

## Validation

From `lean/`:

```bash
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/\
    SelectedFourClassCurvature.lean
```

Result: exit 0.  The three printed interfaces have axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.
