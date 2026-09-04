/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureConstruct

/-!
# Three consecutive sharp chord transitions

This module packages the arithmetic obstruction used by the shell-curvature
chart.  Along the zig-zag of chords

`(i,j) → (i,k) → (j,k) → (j,l)`,

three increments of `π / 3` force the outer turn from `(i,j)` to `(j,l)` to be
exactly `π`.  A proper outer window has turn strictly below `π`, so the two
conditions cannot coexist.
-/

open scoped EuclideanGeometry Real

namespace Problem97
namespace ShellCurvatureConstruction

open EuclideanGeometry

/-- Three consecutive `π / 3` chord-lift transitions cannot fit in a
non-full convex boundary window.  The transitions are, in order, a
same-start increment, a same-terminal increment, and another same-start
increment. -/
theorem false_of_three_consecutive_pi_div_three_chord_transitions
    {n i j k l : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hij : i < j) (hjk : j < k) (hkl : k < l) (hl : l <= n + 1)
    (hnotFull : ¬ (i = 0 /\ l = n + 1))
    (hstart : chordLift point i k - chordLift point i j = Real.pi / 3)
    (hterminal : chordLift point j k - chordLift point i k = Real.pi / 3)
    (hnext : chordLift point j l - chordLift point j k = Real.pi / 3) :
    False := by
  have houter : chordLift point j l - chordLift point i j < Real.pi :=
    chordLift_turn_lt_pi_of_not_full hn hinj hccw hij
      (hjk.trans hkl) hl hnotFull
  have hdecomp :
      chordLift point j l - chordLift point i j =
        (chordLift point i k - chordLift point i j) +
          (chordLift point j k - chordLift point i k) +
          (chordLift point j l - chordLift point j k) := by
    ring
  rw [hdecomp, hstart, hterminal, hnext] at houter
  linarith

end ShellCurvatureConstruction
end Problem97
