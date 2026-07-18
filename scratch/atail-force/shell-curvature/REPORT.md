# Lemmas 30 and 37: Lean checkpoint

Status: **promoted to a kernel-checked production geometry interface; the
unwrapped-lift constructor and cap/block consumer remain open.**

The original Lean checkpoint remains in `ShellCurvature.lean`.  Its production
successor is
`lean/Erdos9796Proof/P97/ConvexCyclicOrder/ShellCurvature.lean`.  The production
module has no `sorry`, `admit`, or project axiom.

## What is formalized

`Problem97.ShellCurvature.CounterclockwiseAngleChart` retains the source
geometry rather than replacing it with unrelated real variables. It contains:

- actual polygon vertices;
- real edge- and chord-direction lifts tied to `Problem97.arcAngle`;
- strict monotonicity of lifted edge directions;
- the convex chord-direction bounds from equation (58); and
- the principal `≤ π` bound on a forward chord turn.

The production interface additionally records the standard counterclockwise
ordered-triple signs.  It proves
`standardCounterclockwiseConvexPolygon_reverseLinear`, which makes the
project's chirality convention explicit: linearly reversing an upstream
`EuclideanGeometry.IsCcwConvexPolygon` enumeration gives the standard
counterclockwise signs used in Lemmas 30 and 37.  Those signs now derive the
positive apex orientations in the equal-radius headline theorems; callers no
longer pass them as independent hypotheses.

The following load-bearing steps are proved:

1. Mathlib's oriented Pons asinorum theorem derives the doubled
   `Real.Angle` forms of equations (59) and (60) from equal distances.
2. Positive apex orientation and the chart's principal-turn bound select the
   correct real branch, producing the exact `π / 2 + angle / 2` identities.
3. The chord-direction bounds give all four inequalities (102) and (103).
4. The exterior-turn sum over `Finset.Icc q2 q3` telescopes, so both endpoint
   turns `q2` and `q3` are present.
5. The exact complementary-arc identity gives the weak bound in (104), and
   positivity of the two apex angles makes it strictly less than `π`.

The shell-facing headline theorems consume actual equal-radius hypotheses:

- `two_sided_quarter_turn_separation_of_equal_radius` is the curvature
  conclusion of Lemma 30.
- `closed_middle_arc_add_center_turn_lt_pi_of_equal_radius` is Lemma 37,
  including the sharpened `π - (a + c) / 2` bound.

## Remaining integration boundary

This checkpoint does **not** claim that the production source graph now proves
the full pen-and-paper lemmas.

1. Construct `CounterclockwiseAngleChart` from the reversed project polygon
   enumeration.  The finite chirality reversal is proved, but the current
   upstream API still does not provide compatible unwrapped real edge/chord
   directions satisfying the chord interval and periodicity fields.
2. Connect Lemma 30's separate statement that the two middle targets are
   cross-block to the existing cap/block combinatorics. This scratch file owns
   only the curvature conclusion.
3. Feed the resulting source-facing theorem into the retained-shell or
   Kalmanson consumer that needs a source-valid antecedent.

The required theorem-bank and indexed-corpus searches found no existing
edge-argument/chord-direction chart theorem to reuse. The useful existing
ingredient was Mathlib's
`EuclideanGeometry.oangle_eq_pi_sub_two_zsmul_oangle_of_dist_eq`.

## Validation

Original scratch check:

```text
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/shell-curvature/ShellCurvature.lean
```

Result: exit 0 with no warnings.

Production check:

```text
lake-build Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature
```

Result: exit 0; the module was indexed and its kernel call graph was mined.

`#print axioms` on the two headline equal-radius theorems, the isosceles lift,
and the exact complement theorem reported only:

```text
propext, Classical.choice, Quot.sound
```

The source scan found no `sorry`, `admit`, or declared `axiom`, and no line
exceeds 100 characters.

## Checkpoint replay after the build-gate release

The user released the historical ShellCurvature no-Lean/no-Lake gate on
2026-07-17.  A fresh checkpoint replay then established:

- LSP elaboration of the production file completed with no diagnostics;
- the scoped `lake-build Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature`
  target completed successfully;
- the original scratch module compiled with `-DwarningAsError=true`; and
- fresh axiom checks on the chirality bridge, endpoint isosceles lift,
  quarter-turn theorem, complementary accounting theorem, and closed-arc
  theorem reported only `propext`, `Classical.choice`, and `Quot.sound`.

A reference audit found no consumer outside this module.  This is therefore a
kernel-checked, unimported supporting geometry checkpoint, not a closed
Problem-97 spine obligation.  The adapter and cap/block consumer listed above
remain the exact integration boundary.
