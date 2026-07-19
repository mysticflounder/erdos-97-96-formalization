/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Exact linear Kalmanson survivor for the on-cap collision marginal

This file kernel-checks a finite integer distance model for two complete
four-point rows in the surviving serial boundary order

```text
s1 < A < s2 < B < f < x < y < z.
```

It is a model of the full triangle and strict Kalmanson linear abstraction and
of every squared-distance nonacute inequality on the named cap subchain.  It
is not a realization by points in `ℝ²` and not a `CounterexampleData`.
-/

namespace Problem97
namespace ATailCollisionOnCapKalmansonScratch

abbrev Label := Fin 8

def s1 : Label := 0
def A : Label := 1
def s2 : Label := 2
def B : Label := 3
def f : Label := 4
def x : Label := 5
def y : Label := 6
def z : Label := 7

/-- The exact integer model found by the rational LRA audit. -/
def linearDistance : Label → Label → Nat := ![
  ![0, 448, 832, 2880, 5472, 384, 336, 238],
  ![448, 0, 448, 2816, 5444, 448, 448, 383],
  ![832, 448, 0, 2744, 5408, 704, 760, 728],
  ![2880, 2816, 2744, 0, 2744, 2656, 2744, 2744],
  ![5472, 5444, 5408, 2744, 0, 5152, 5272, 5304],
  ![384, 448, 704, 2656, 5152, 0, 120, 184],
  ![336, 448, 760, 2744, 5272, 120, 0, 100],
  ![238, 383, 728, 2744, 5304, 184, 100, 0]
]

def collisionSupport : Finset Label := {s1, s2, x, y}
def freshSupport : Finset Label := {f, s2, y, z}

theorem linearDistance_symmetric :
    ∀ left right, linearDistance left right = linearDistance right left := by
  decide

theorem linearDistance_self : ∀ point, linearDistance point point = 0 := by
  decide

theorem linearDistance_pos_of_ne :
    ∀ {left right}, left ≠ right → 0 < linearDistance left right := by
  decide

/-- Every triangle inequality holds in the exact integer model. -/
theorem linearDistance_triangle :
    ∀ left middle right,
      linearDistance left right ≤
        linearDistance left middle + linearDistance middle right := by
  decide

/-- Both strict Kalmanson inequalities hold for every increasing quadruple. -/
theorem linearDistance_strictKalmanson :
    ∀ {a b c d : Label}, a < b → b < c → c < d →
      linearDistance a b + linearDistance c d <
          linearDistance a c + linearDistance b d ∧
        linearDistance a d + linearDistance b c <
          linearDistance a c + linearDistance b d := by
  decide

/-- Every increasing triple of the first five (cap) labels is nonacute at
its middle point in squared-distance form. -/
theorem linearDistance_cap_nonacute :
    ∀ {left middle right : Label},
      left < middle → middle < right → right < x →
        linearDistance left middle ^ 2 + linearDistance middle right ^ 2 ≤
          linearDistance left right ^ 2 := by
  decide

/-- The model also satisfies the general Ptolemy metric inequality for every
ordered quadruple.  Thus adding the standard Euclidean Ptolemy inequality is
still not enough to reject this shadow. -/
theorem linearDistance_ptolemy :
    ∀ a b c d,
      linearDistance a c * linearDistance b d ≤
        linearDistance a b * linearDistance c d +
          linearDistance b c * linearDistance a d := by
  decide

/-- Twice the Gram entry of the vectors from `base` to `left,right`, computed
from the abstract distance table. -/
def gramTwice (base left right : Label) : Int :=
  (linearDistance base left : Int) ^ 2 +
    (linearDistance base right : Int) ^ 2 -
      (linearDistance left right : Int) ^ 2

/-- The three-by-three twice-Gram determinant for the vectors `AB,Af,Ax`.
Its negativity identifies exactly where this otherwise strong metric shadow
fails genuine Euclidean realizability. -/
def gramDeterminantABfx : Int :=
  gramTwice A B B *
      (gramTwice A f f * gramTwice A x x - gramTwice A f x * gramTwice A x f) -
    gramTwice A B f *
      (gramTwice A f B * gramTwice A x x - gramTwice A f x * gramTwice A x B) +
    gramTwice A B x *
      (gramTwice A f B * gramTwice A x f - gramTwice A f f * gramTwice A x B)

theorem gramDeterminantABfx_neg : gramDeterminantABfx < 0 := by
  decide

/-- The first center has exactly the displayed four-point row among the eight
named vertices. -/
theorem collisionSupport_exact :
    ∀ point, point ≠ A →
      (linearDistance A point = 448 ↔ point ∈ collisionSupport) := by
  decide

/-- The second center has exactly the displayed four-point row among the
eight named vertices. -/
theorem freshSupport_exact :
    ∀ point, point ≠ B →
      (linearDistance B point = 2744 ↔ point ∈ freshSupport) := by
  decide

/-- The two outside pair incidences are distinct, even though they share one
endpoint. -/
theorem outsidePairs_distinct : ({x, y} : Finset Label) ≠ {y, z} := by
  decide

/-- The named cap roles occur in the only orientation surviving the linear
audit: both centers lie between their same-cap row points, on opposite sides
of the shared cap support. -/
theorem serial_cap_order :
    s1 < A ∧ A < s2 ∧ s2 < B ∧ B < f := by
  decide

#print axioms linearDistance_triangle
#print axioms linearDistance_strictKalmanson
#print axioms linearDistance_cap_nonacute
#print axioms linearDistance_ptolemy
#print axioms gramDeterminantABfx_neg
#print axioms collisionSupport_exact
#print axioms freshSupport_exact
#print axioms outsidePairs_distinct
#print axioms serial_cap_order

end ATailCollisionOnCapKalmansonScratch
end Problem97
