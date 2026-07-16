/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Scratch: paired apex-profile elimination

This file isolates the three positive paired-profile arms suggested by the
exact joint audit.

* If two generated rows hit the same anchor pair, the old continuation center
  and the two generated centers are three distinct carrier points on one
  perpendicular bisector.  `Dumitrescu.perpBisector_apex_bound` closes.
* In the crossed orientation in which the old-row-`y` member hits `{y,a}` and
  the old-row-`x` member hits `{x,a}`, the generated centers are the two
  nontrivial equilateral apices on the adjacent sides `ya` and `xa`.
  Their affine formulas make the three points `b,a,c` collinear, contradicting
  convex independence.
* The reverse mixed orientation is named explicitly but is not declared
  impossible here.

Only production modules are imported.  This is scratch validation, not a
claim that the parent joint-transition packet has already been completely
dispatched into these positive profiles.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailJointProfileEliminationScratch

attribute [local instance] Classical.propDecidable

/-- Three pairwise-distinct carrier centers equidistant from one carrier pair
contradict the planar perpendicular-bisector bound. -/
theorem false_of_three_carrier_bisector_centers
    {D : CounterexampleData}
    {p q center₁ center₂ center₃ : ℝ²}
    (hpA : p ∈ D.A) (hqA : q ∈ D.A) (hpq : p ≠ q)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenter₃A : center₃ ∈ D.A)
    (hcenter₁ : dist center₁ p = dist center₁ q)
    (hcenter₂ : dist center₂ p = dist center₂ q)
    (hcenter₃ : dist center₃ p = dist center₃ q)
    (h₁₂ : center₁ ≠ center₂)
    (h₁₃ : center₁ ≠ center₃)
    (h₂₃ : center₂ ≠ center₃) : False := by
  classical
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hpA hqA hpq
  have hcenter₁Filter :
      center₁ ∈ D.A.filter (fun z => dist z p = dist z q) :=
    Finset.mem_filter.mpr ⟨hcenter₁A, hcenter₁⟩
  have hcenter₂Filter :
      center₂ ∈ D.A.filter (fun z => dist z p = dist z q) :=
    Finset.mem_filter.mpr ⟨hcenter₂A, hcenter₂⟩
  have hcenter₃Filter :
      center₃ ∈ D.A.filter (fun z => dist z p = dist z q) :=
    Finset.mem_filter.mpr ⟨hcenter₃A, hcenter₃⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z p = dist z q)).card := by
    rw [Finset.two_lt_card]
    exact ⟨center₁, hcenter₁Filter,
      center₂, hcenter₂Filter,
      center₃, hcenter₃Filter, h₁₂, h₁₃, h₂₃⟩
  omega

/-- Selected-row adapter for the same `{x,a}` assignment.  The three
bisector centers are `y,b,c`. -/
theorem false_of_same_xa_profile_pair
    {D : CounterexampleData} {x y a b c : ℝ²}
    (Kx : SelectedFourClass D.A x)
    (Ky : SelectedFourClass D.A y)
    (Kb : SelectedFourClass D.A b)
    (Kc : SelectedFourClass D.A c)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hcKx : c ∈ Kx.support)
    (hxKb : x ∈ Kb.support) (haKb : a ∈ Kb.support)
    (hxKc : x ∈ Kc.support) (haKc : a ∈ Kc.support)
    (hyc : y ≠ c) (hbc : b ≠ c) : False := by
  have hya : y ∈ D.A := Kx.support_subset_A hyKx
  have hba : b ∈ D.A := Ky.support_subset_A hbKy
  have hca : c ∈ D.A := Kx.support_subset_A hcKx
  have hxa : x ∈ D.A := Ky.support_subset_A hxKy
  have haa : a ∈ D.A := Kx.support_subset_A haKx
  have hxy : x ≠ a := by
    intro h
    apply Kx.center_not_mem
    simpa [h] using haKx
  have hyb : y ≠ b := by
    intro h
    apply Ky.center_not_mem
    simpa [h] using hbKy
  exact false_of_three_carrier_bisector_centers
    hxa haa hxy hya hba hca
    ((Ky.support_eq_radius x hxKy).trans
      (Ky.support_eq_radius a haKy).symm)
    ((Kb.support_eq_radius x hxKb).trans
      (Kb.support_eq_radius a haKb).symm)
    ((Kc.support_eq_radius x hxKc).trans
      (Kc.support_eq_radius a haKc).symm)
    hyb hyc hbc

/-- Selected-row adapter for the same `{y,a}` assignment.  The three
bisector centers are `x,b,c`. -/
theorem false_of_same_ya_profile_pair
    {D : CounterexampleData} {x y a b c : ℝ²}
    (Kx : SelectedFourClass D.A x)
    (Ky : SelectedFourClass D.A y)
    (Kb : SelectedFourClass D.A b)
    (Kc : SelectedFourClass D.A c)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hcKx : c ∈ Kx.support)
    (hyKb : y ∈ Kb.support) (haKb : a ∈ Kb.support)
    (hyKc : y ∈ Kc.support) (haKc : a ∈ Kc.support)
    (hxb : x ≠ b) (hbc : b ≠ c) : False := by
  have hxa : x ∈ D.A := Ky.support_subset_A hxKy
  have hya : y ∈ D.A := Kx.support_subset_A hyKx
  have haa : a ∈ D.A := Ky.support_subset_A haKy
  have hba : b ∈ D.A := Ky.support_subset_A hbKy
  have hca : c ∈ D.A := Kx.support_subset_A hcKx
  have hya_ne : y ≠ a := by
    intro h
    apply Ky.center_not_mem
    simpa [h] using haKy
  have hxc : x ≠ c := by
    intro h
    apply Kx.center_not_mem
    simpa [h] using hcKx
  exact false_of_three_carrier_bisector_centers
    hya haa hya_ne hxa hba hca
    ((Kx.support_eq_radius y hyKx).trans
      (Kx.support_eq_radius a haKx).symm)
    ((Kb.support_eq_radius y hyKb).trans
      (Kb.support_eq_radius a haKb).symm)
    ((Kc.support_eq_radius y hyKc).trans
      (Kc.support_eq_radius a haKc).symm)
    hxb hxc hbc

/-- The other apex of an equilateral triangle is the reflection of the first
apex across the midpoint of the common edge. -/
private theorem other_equilateral_apex_eq_add_sub
    {p q r s : ℝ²} {d : ℝ}
    (hd : 0 < d)
    (hpq : dist p q = d) (hpr : dist p r = d) (hqr : dist q r = d)
    (hsq : dist s q = d) (hsr : dist s r = d)
    (hsp : s ≠ p) :
    s = q + r - p := by
  let t : ℝ² := q + r - p
  have hqr_ne : q ≠ r := by
    intro h
    have : dist q r = 0 := by simp [h]
    linarith [hqr]
  have htq : dist t q = d := by
    rw [dist_eq_norm]
    have ht : t - q = r - p := by
      dsimp [t]
      module
    rw [ht, ← dist_eq_norm, dist_comm]
    exact hpr
  have htr : dist t r = d := by
    rw [dist_eq_norm]
    have ht : t - r = q - p := by
      dsimp [t]
      module
    rw [ht, ← dist_eq_norm, dist_comm]
    exact hpq
  have hpt : p ≠ t := by
    intro h
    have hpmid : p = midpoint ℝ q r := by
      ext i
      have hi := congrArg (fun z : ℝ² => z i) h
      dsimp [t] at hi
      simp [midpoint, AffineMap.lineMap_apply]
      linarith
    have hmidDist : dist q p = dist q r / 2 := by
      rw [hpmid, dist_comm q, dist_midpoint_left]
      norm_num [Real.norm_eq_abs]
      ring
    rw [dist_comm q p, hpq, hqr] at hmidDist
    linarith
  have hcirc : (⟨q, d⟩ : Sphere ℝ²) ≠ ⟨r, d⟩ := by
    intro h
    exact hqr_ne (congrArg (fun z : Sphere ℝ² => z.1) h)
  exact two_circle_third_point_eq hcirc hpt
    hpq htq hpr htr hsq hsr hsp

/-- The crossed orientation eliminated by the exact audit:

* `b` is an old-row-`y` member and its generated row hits `{y,a}`;
* `c` is an old-row-`x` member and its generated row hits `{x,a}`.

The old rows make both generated triangles have the same side length as the
base equilateral triangle.  The two nontrivial-apex hypotheses select the
opposite equilateral constructions. -/
structure CrossedCollinearProfile
    (A : Finset ℝ²) (x y a b c : ℝ²)
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (Kc : SelectedFourClass A c) : Prop where
  y_mem_rowX : y ∈ Kx.support
  a_mem_rowX : a ∈ Kx.support
  x_mem_rowY : x ∈ Ky.support
  a_mem_rowY : a ∈ Ky.support
  b_mem_rowY : b ∈ Ky.support
  c_mem_rowX : c ∈ Kx.support
  y_mem_rowB : y ∈ Kb.support
  a_mem_rowB : a ∈ Kb.support
  x_mem_rowC : x ∈ Kc.support
  a_mem_rowC : a ∈ Kc.support
  b_ne_x : b ≠ x
  c_ne_y : c ≠ y

/-- The reverse mixed orientation, which the exact audit leaves as the
strictly-convex residual.  It is named separately so it cannot be silently
identified with `CrossedCollinearProfile`. -/
structure MixedResidualProfile
    (A : Finset ℝ²) (x y a b c : ℝ²)
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (Kc : SelectedFourClass A c) : Prop where
  y_mem_rowX : y ∈ Kx.support
  a_mem_rowX : a ∈ Kx.support
  x_mem_rowY : x ∈ Ky.support
  a_mem_rowY : a ∈ Ky.support
  b_mem_rowY : b ∈ Ky.support
  c_mem_rowX : c ∈ Kx.support
  x_mem_rowB : x ∈ Kb.support
  a_mem_rowB : a ∈ Kb.support
  y_mem_rowC : y ∈ Kc.support
  a_mem_rowC : a ∈ Kc.support

/-- The crossed positive profile forces `b,a,c` collinear. -/
theorem CrossedCollinearProfile.collinear
    {A : Finset ℝ²} {x y a b c : ℝ²}
    {Kx : SelectedFourClass A x}
    {Ky : SelectedFourClass A y}
    {Kb : SelectedFourClass A b}
    {Kc : SelectedFourClass A c}
    (P : CrossedCollinearProfile A x y a b c Kx Ky Kb Kc) :
    Collinear ℝ ({b, a, c} : Set ℝ²) := by
  let d := Kx.radius
  have hxy : dist x y = d := Kx.support_eq_radius y P.y_mem_rowX
  have hxa : dist x a = d := Kx.support_eq_radius a P.a_mem_rowX
  have hyd : Ky.radius = d := by
    calc
      Ky.radius = dist y x := (Ky.support_eq_radius x P.x_mem_rowY).symm
      _ = dist x y := dist_comm y x
      _ = d := hxy
  have hya : dist y a = d := by
    rw [Ky.support_eq_radius a P.a_mem_rowY, hyd]
  have hyb : dist y b = d := by
    rw [Ky.support_eq_radius b P.b_mem_rowY, hyd]
  have hbd : Kb.radius = d := by
    calc
      Kb.radius = dist b y := (Kb.support_eq_radius y P.y_mem_rowB).symm
      _ = dist y b := dist_comm b y
      _ = d := hyb
  have hby : dist b y = d := by
    rw [Kb.support_eq_radius y P.y_mem_rowB, hbd]
  have hba : dist b a = d := by
    rw [Kb.support_eq_radius a P.a_mem_rowB, hbd]
  have hxc : dist x c = d := Kx.support_eq_radius c P.c_mem_rowX
  have hcd : Kc.radius = d := by
    calc
      Kc.radius = dist c x := (Kc.support_eq_radius x P.x_mem_rowC).symm
      _ = dist x c := dist_comm c x
      _ = d := hxc
  have hcx : dist c x = d := by
    rw [Kc.support_eq_radius x P.x_mem_rowC, hcd]
  have hca : dist c a = d := by
    rw [Kc.support_eq_radius a P.a_mem_rowC, hcd]
  have hbEq : b = y + a - x :=
    other_equilateral_apex_eq_add_sub Kx.radius_pos
      hxy hxa hya hby hba P.b_ne_x
  have hcEq : c = x + a - y :=
    other_equilateral_apex_eq_add_sub Kx.radius_pos
      (by simpa [dist_comm] using hxy)
      hya (by simpa [dist_comm] using hxa)
      hcx hca P.c_ne_y
  apply collinear_of_signedArea2_eq_zero b a c
  rw [hbEq, hcEq]
  simp [signedArea2]
  ring

/-- Convex independence eliminates the crossed collinear profile. -/
theorem CrossedCollinearProfile.false_of_convexIndep
    {D : CounterexampleData} {x y a b c : ℝ²}
    {Kx : SelectedFourClass D.A x}
    {Ky : SelectedFourClass D.A y}
    {Kb : SelectedFourClass D.A b}
    {Kc : SelectedFourClass D.A c}
    (P : CrossedCollinearProfile D.A x y a b c Kx Ky Kb Kc) : False := by
  have hbA : b ∈ D.A := Ky.support_subset_A P.b_mem_rowY
  have haA : a ∈ D.A := Kx.support_subset_A P.a_mem_rowX
  have hcA : c ∈ D.A := Kx.support_subset_A P.c_mem_rowX
  have hba : b ≠ a := by
    intro h
    apply Kb.center_not_mem
    simpa [h] using P.a_mem_rowB
  have hac : a ≠ c := by
    intro h
    apply Kc.center_not_mem
    simpa [h] using P.a_mem_rowC
  have hxy : x ≠ y := by
    intro h
    apply Kx.center_not_mem
    simpa [h] using P.y_mem_rowX
  have hbc : b ≠ c := by
    intro h
    have hbEq : b = y + a - x := by
      let d := Kx.radius
      have hxyDist : dist x y = d :=
        Kx.support_eq_radius y P.y_mem_rowX
      have hxaDist : dist x a = d :=
        Kx.support_eq_radius a P.a_mem_rowX
      have hyd : Ky.radius = d := by
        calc
          Ky.radius = dist y x :=
            (Ky.support_eq_radius x P.x_mem_rowY).symm
          _ = dist x y := dist_comm y x
          _ = d := hxyDist
      have hyaDist : dist y a = d := by
        rw [Ky.support_eq_radius a P.a_mem_rowY, hyd]
      have hybDist : dist y b = d := by
        rw [Ky.support_eq_radius b P.b_mem_rowY, hyd]
      have hbd : Kb.radius = d := by
        calc
          Kb.radius = dist b y :=
            (Kb.support_eq_radius y P.y_mem_rowB).symm
          _ = dist y b := dist_comm b y
          _ = d := hybDist
      exact other_equilateral_apex_eq_add_sub Kx.radius_pos
        hxyDist hxaDist hyaDist
        (by rw [Kb.support_eq_radius y P.y_mem_rowB, hbd])
        (by rw [Kb.support_eq_radius a P.a_mem_rowB, hbd]) P.b_ne_x
    have hcEq : c = x + a - y := by
      let d := Kx.radius
      have hxyDist : dist x y = d :=
        Kx.support_eq_radius y P.y_mem_rowX
      have hxaDist : dist x a = d :=
        Kx.support_eq_radius a P.a_mem_rowX
      have hyd : Ky.radius = d := by
        calc
          Ky.radius = dist y x :=
            (Ky.support_eq_radius x P.x_mem_rowY).symm
          _ = dist x y := dist_comm y x
          _ = d := hxyDist
      have hyaDist : dist y a = d := by
        rw [Ky.support_eq_radius a P.a_mem_rowY, hyd]
      have hxcDist : dist x c = d :=
        Kx.support_eq_radius c P.c_mem_rowX
      have hcd : Kc.radius = d := by
        calc
          Kc.radius = dist c x :=
            (Kc.support_eq_radius x P.x_mem_rowC).symm
          _ = dist x c := dist_comm c x
          _ = d := hxcDist
      exact other_equilateral_apex_eq_add_sub Kx.radius_pos
        (by simpa [dist_comm] using hxyDist)
        hyaDist (by simpa [dist_comm] using hxaDist)
        (by rw [Kc.support_eq_radius x P.x_mem_rowC, hcd])
        (by rw [Kc.support_eq_radius a P.a_mem_rowC, hcd]) P.c_ne_y
    apply hxy
    ext i
    have hi := congrArg (fun z : ℝ² => z i) h
    rw [hbEq, hcEq] at hi
    change y i + a i - x i = x i + a i - y i at hi
    linarith
  exact D.convex.not_three_collinear hbA haA hcA
    hba hbc hac P.collinear

#print axioms false_of_three_carrier_bisector_centers
#print axioms false_of_same_xa_profile_pair
#print axioms false_of_same_ya_profile_pair
#print axioms CrossedCollinearProfile.collinear
#print axioms CrossedCollinearProfile.false_of_convexIndep

end ATailJointProfileEliminationScratch
end Problem97
