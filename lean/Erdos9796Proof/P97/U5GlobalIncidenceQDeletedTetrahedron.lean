/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# U5 exact-class tetrahedron incompatibility

This module ports the reusable three-row metric consumer from the sibling
general-`n` theorem bank.  It is deliberately independent of the ATail
producer that supplies the rows.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Three exact q-deleted selected classes cannot form a four-point
equidistant tetrahedron in the plane. -/
theorem U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    {D : CounterexampleData} {q x y a b : ℝ²} {Bx By Bb : Finset ℝ²}
    (Kx : U5QDeletedK4Class D q x Bx)
    (Ky : U5QDeletedK4Class D q y By)
    (Kb : U5QDeletedK4Class D q b Bb)
    (hyBx : y ∈ Bx) (haBx : a ∈ Bx)
    (hxBy : x ∈ By) (haBy : a ∈ By) (hbBy : b ∈ By)
    (hxBb : x ∈ Bb) (hyBb : y ∈ Bb) (haBb : a ∈ Bb) : False := by
  let r : ℝ := Ky.radius
  have hr : 0 < r := Ky.radius_pos
  have hKxRadius : Kx.radius = r := by
    calc
      Kx.radius = dist x y := (Kx.same_radius y hyBx).symm
      _ = dist y x := dist_comm x y
      _ = r := Ky.same_radius x hxBy
  have hKbRadius : Kb.radius = r := by
    calc
      Kb.radius = dist b y := (Kb.same_radius y hyBb).symm
      _ = dist y b := dist_comm b y
      _ = r := Ky.same_radius b hbBy
  have hby : dist b y = r := by
    calc
      dist b y = Kb.radius := Kb.same_radius y hyBb
      _ = r := hKbRadius
  have hbx : dist b x = r := by
    calc
      dist b x = Kb.radius := Kb.same_radius x hxBb
      _ = r := hKbRadius
  have hba : dist b a = r := by
    calc
      dist b a = Kb.radius := Kb.same_radius a haBb
      _ = r := hKbRadius
  have hyx : dist y x = r := Ky.same_radius x hxBy
  have hya : dist y a = r := Ky.same_radius a haBy
  have hxa : dist x a = r := by
    calc
      dist x a = Kx.radius := Kx.same_radius a haBx
      _ = r := hKxRadius
  exact u5_unit_triangle_on_p_circle_incompatibility
    hr hby hbx hba hyx hya hxa

end Problem97
