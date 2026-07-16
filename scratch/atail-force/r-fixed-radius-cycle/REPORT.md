# Fixed-single-radius actual-blocker cycle audit

## Result

**NEGATIVE on the current finite radius/incidence/order surface. OPEN on the
full Euclidean/MEC surface.**

Putting every source and blocker of a normalized actual-blocker cycle on one
`oppApex1` circle does **not** immediately feed any existing closing bank
consumer. Cyclic cap order alone supplies no coherent orientation of the
blocker edges in boundary order, and it supplies neither the endpoint
incidence required by `SameCapIncompatibleEdge` nor the three strict pushes
already carried by `StrictLapPacket`.

The kernel-checked finite boundary
`FixedRadiusOrderedFiniteBoundary.lean` realizes the strongest presently
available discrete version of the hypothesis:

- a literal cyclic permutation of all 12 labels;
- three contiguous cyclic five-point caps;
- two consecutive interior vertices of the first opposite cap;
- one fixed first-apex radius row containing both cycle sources and blockers;
- a genuine blocker two-cycle;
- the total exact four-row table, source incidence, and no fixed blockers;
- both directed cross omissions; and
- no non-first-apex recorded row containing the pair.

Thus no theorem using only those fields can force a cap endpoint, rank drop,
common second center, or third common point.

This file is deliberately labeled a finite abstraction. It does not realize
the rows as Euclidean circles and does not encode strict convexity, MEC
minimality, or the full all-center K4 metric law. Therefore it does not refute
a strengthened theorem that visibly consumes those geometric hypotheses.

## Why the fixed radius is not already a metric contradiction

For consecutive actual-blocker vertices `q → b → c`, the banked theorem
`secondBlocker_mem_sourceShell_iff_edgeLengths_eq` says that `c` lies on the
critical shell selected at `q` exactly when

```text
dist b c = dist b q.
```

The common equality

```text
dist oppApex1 q = dist oppApex1 b = dist oppApex1 c = r
```

does not imply that edge-length equality. It says that the vertices are on
one carrier circle, not that the blocker steps are equal chords. Hence the
fixed-radius hypothesis does not make the next blocker into the missing third
point of the current critical shell.

Even an added equal-chord hypothesis would leave a genuine period-two arm:
for a two-cycle the edge equality is tautological, and two interior points of
one ordered cap do not contradict convex position.

## Exact first closing target

The smallest direct bank-feeding target is not `fixedRadiusCycle → False`.
It is a terminal production theorem at one named cycle index. For a
source-exact family `W`, a named HIT index `i`, and
`P_i := W.pairAt i`, the exact conclusion to produce is

```lean
∃ z : ℝ²,
  z ∈ (H.selectedAt P_i.x
      (mem_selectedClass.mp P_i.x_mem_class).1).toCriticalFourShell.support ∧
  z ∈ SelectedClass D.A S.oppApex1 (W.rhoAt i) ∧
  z ≠ P_i.x ∧
  z ≠ P_i.y
```

with the already-required HIT fact

```lean
P_i.y ∈ (H.selectedAt P_i.x _).toCriticalFourShell.support.
```

This closes immediately through the existing theorem
`AmbientRobustHistoryPair.false_of_actualBlocker_hit_thirdCommonPoint`.

It is enough for the fixed-radius hypothesis to cover the cycle sources. Since
`P_i.x` is both the named source and a member of the pair-specific
`W.rhoAt i` class about the same apex, membership in the fixed `r` class forces
`W.rhoAt i = r`; consequently `P_i.y` is on the fixed circle as well. That
still supplies only the two already-known common points `P_i.x` and `P_i.y`.
The theorem above must produce the third one.

## Residual theorem status

- **PROVEN:** the finite ordered-cap/fixed-radius/two-cycle model above passes
  `by decide` and has no `sorry`.
- **PROVEN:** the common carrier radius does not supply the edge equality
  required by `secondBlocker_mem_sourceShell_iff_edgeLengths_eq`.
- **SEARCH-VERIFIED AGAINST THE CURRENT BANK:** no existing closing consumer
  found in the local/sibling registries or indexed Lean corpora accepts only
  fixed cycle radius plus cap order.
- **OPEN:** exclusion of a period-two fixed-radius actual-blocker cycle from
  full Euclidean strict-convex/MEC/global-K4 data.
- **OPEN:** production of the named third common point in the HIT arm.

The productive next search should therefore target the full-geometric
period-two residual, or directly target the named third point. Mining another
rank or cap-order classifier over the present discrete interface will repeat
the countermodel.
