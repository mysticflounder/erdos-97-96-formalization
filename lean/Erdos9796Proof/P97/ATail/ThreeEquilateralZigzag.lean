/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralThreeFanCollision
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Three-equilateral-zigzag collinearity

Three edge-sharing equilateral triangles on the five points `A,B,C,D,E`
force `B,C,D` onto one line when the two successive apex choices are
distinct.  A second theorem extracts the metric hypotheses from ten positive
row memberships and contradicts convex independence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailThreeEquilateralZigzag

/-- Three edge-sharing equilateral triangles force the terminal three points
onto one line, expressed by vanishing signed area. -/
theorem three_equilateral_zigzag_signedArea2_eq_zero
    {A B C D E : ℝ²}
    (hAC : A ≠ C) (hBE : B ≠ E) (hAD : A ≠ D)
    (hABC :
      dist A B = dist A C ∧
        dist B A = dist B C)
    (hACE :
      dist A C = dist A E ∧
        dist C A = dist C E)
    (hCDE :
      dist C D = dist C E ∧
        dist D C = dist D E) :
    signedArea2 B C D = 0 := by
  have hCB_CE : dist C B = dist C E := by
    calc
      dist C B = dist B C := dist_comm _ _
      _ = dist B A := hABC.2.symm
      _ = dist A B := dist_comm _ _
      _ = dist A C := hABC.1
      _ = dist C A := dist_comm _ _
      _ = dist C E := hACE.2
  exact Census554.EqualityCore.threeFan_signedArea2_eq_zero_of_distinct
    (B := A) (O := C) (A := E) (S := B) (Q := D)
    hAC hACE.2.symm hCB_CE hCDE.1 hACE.1.symm hABC.1 hCDE.2
    hBE.symm hAD

/-- A realized row pattern with the ten displayed zigzag memberships cannot
place its three terminal labels in a convex-independent carrier. -/
theorem false_of_realizes_three_equilateral_zigzag
    {α : Type*}
    {P : Census554.EqualityCore.RowPattern α} {pointOf : α → ℝ²}
    {V : Finset ℝ²}
    (hconv : ConvexIndep V)
    (hreal : Census554.EqualityCore.Realizes P pointOf)
    {a b c d e : α}
    (hac : a ≠ c) (hbe : b ≠ e) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hbA : b ∈ P a) (hcA : c ∈ P a) (heA : e ∈ P a)
    (haB : a ∈ P b) (hcB : c ∈ P b)
    (haC : a ∈ P c) (hdC : d ∈ P c) (heC : e ∈ P c)
    (hcD : c ∈ P d) (heD : e ∈ P d)
    (hbV : pointOf b ∈ V) (hcV : pointOf c ∈ V)
    (hdV : pointOf d ∈ V) :
    False := by
  have hpAC : pointOf a ≠ pointOf c := by
    intro h
    exact hac (hreal.injective h)
  have hpBE : pointOf b ≠ pointOf e := by
    intro h
    exact hbe (hreal.injective h)
  have hpAD : pointOf a ≠ pointOf d := by
    intro h
    exact had (hreal.injective h)
  have hpBC : pointOf b ≠ pointOf c := by
    intro h
    exact hbc (hreal.injective h)
  have hpBD : pointOf b ≠ pointOf d := by
    intro h
    exact hbd (hreal.injective h)
  have hpCD : pointOf c ≠ pointOf d := by
    intro h
    exact hcd (hreal.injective h)
  have hABC :
      dist (pointOf a) (pointOf b) = dist (pointOf a) (pointOf c) ∧
        dist (pointOf b) (pointOf a) = dist (pointOf b) (pointOf c) :=
    ⟨hreal.equidist a b hbA c hcA,
      hreal.equidist b a haB c hcB⟩
  have hACE :
      dist (pointOf a) (pointOf c) = dist (pointOf a) (pointOf e) ∧
        dist (pointOf c) (pointOf a) = dist (pointOf c) (pointOf e) :=
    ⟨hreal.equidist a c hcA e heA,
      hreal.equidist c a haC e heC⟩
  have hCDE :
      dist (pointOf c) (pointOf d) = dist (pointOf c) (pointOf e) ∧
        dist (pointOf d) (pointOf c) = dist (pointOf d) (pointOf e) :=
    ⟨hreal.equidist c d hdC e heC,
      hreal.equidist d c hcD e heD⟩
  have hzero : signedArea2 (pointOf b) (pointOf c) (pointOf d) = 0 :=
    three_equilateral_zigzag_signedArea2_eq_zero
      hpAC hpBE hpAD hABC hACE hCDE
  have hcol :
      Collinear ℝ ({pointOf b, pointOf c, pointOf d} : Set ℝ²) :=
    collinear_of_signedArea2_eq_zero _ _ _ hzero
  exact hconv.not_three_collinear hbV hcV hdV hpBC hpBD hpCD hcol

end ATailThreeEquilateralZigzag
end Problem97
