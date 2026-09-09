/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

-- Original module: Solutions.Batch3N9.WitnessPacketInterface
section Batch3N9Unit074
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
namespace Problem97
noncomputable def SelectedClass (A : Finset ℝ²) (s : ℝ²) (d : ℝ) : Finset ℝ² :=
  A.filter (fun q => dist s q = d)
@[simp] theorem mem_selectedClass {A : Finset ℝ²} {s : ℝ²} {d : ℝ} {q : ℝ²} :
    q ∈ SelectedClass A s d ↔ q ∈ A ∧ dist s q = d := by
  simp [SelectedClass]
theorem exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
    {n : ℕ} {A : Finset ℝ²} {p : ℝ²}
    (h : HasNEquidistantPointsAt n A p) :
    ∃ r : ℝ, 0 < r ∧ n ≤ (SelectedClass A p r).card := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, by simpa [SelectedClass] using hcard⟩
theorem exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
    {A : Finset ℝ²} {p : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hp : p ∈ A) :
    ∃ r : ℝ, 0 < r ∧ 4 ≤ (SelectedClass A p r).card :=
  exists_selectedClass_card_ge_of_hasNEquidistantPointsAt (hK4 p hp)
theorem dist_self_of_mem_selectedClass {A : Finset ℝ²} {s q : ℝ²} {d : ℝ}
    (hq : q ∈ SelectedClass A s d) : dist q s = d :=
  (dist_comm q s).trans (mem_selectedClass.mp hq).2
end Problem97
end Batch3N9
end Batch3N9Unit074

-- Original module: Solutions.Batch3N9.U2.OneHitBound
section Batch3N9Unit075
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
namespace Problem97
abbrev N8a3AdjacentCapDistanceStrict
    (center : ℝ²) {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) : Prop :=
  ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j)
end Problem97
end Batch3N9
end Batch3N9Unit075

-- Original module: Solutions.Batch3N9.U2.OneHitMonotone
section Batch3N9Unit076
set_option backward.isDefEq.respectTransparency false
namespace Batch3N9
open Real Set
open scoped EuclideanGeometry
namespace Problem97
noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]
noncomputable def capU1 (α : ℝ) : ℝ² := pt (Real.cos α) (Real.sin α)
noncomputable def capU2 (γ : ℝ) : ℝ² := pt (1 + Real.cos (2*π/3 + γ)) (Real.sin (2*π/3 + γ))
theorem capU1U2_dist_sq (α γ : ℝ) :
    dist (capU1 α) (capU2 γ) ^ 2
      = 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ) + 2 * Real.cos (2*π/3 + γ) := by
  have norm_sub_sq : ∀ (a b : ℝ²),
      dist a b ^ 2 = (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 :=
    Problem97.dist_sq_coord
  rw [norm_sub_sq]
  simp only [capU1, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  have hcos_sub : Real.cos (α - 2*π/3 - γ)
      = Real.cos α * Real.cos (2*π/3 + γ) + Real.sin α * Real.sin (2*π/3 + γ) := by
    rw [show α - 2*π/3 - γ = α - (2*π/3 + γ) by ring, Real.cos_sub]
  rw [hcos_sub]
  nlinarith only [Real.sin_sq_add_cos_sq α, Real.sin_sq_add_cos_sq (2*π/3 + γ)]
theorem capU1U2_dist_sq_strictMonoOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictMonoOn (fun γ => dist (capU1 α) (capU2 γ) ^ 2) (Set.Icc 0 (π/3)) := by
  have key : (fun γ => dist (capU1 α) (capU2 γ) ^ 2)
      = (fun γ => 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ)
          + 2 * Real.cos (2*π/3 + γ)) := by
    funext γ; exact capU1U2_dist_sq α γ
  rw [key]
  apply strictMonoOn_of_deriv_pos (convex_Icc 0 (π/3))
  · fun_prop
  · intro γ hγ
    rw [interior_Icc] at hγ
    obtain ⟨hγ0, hγ1⟩ := hγ
    have hd : HasDerivAt
        (fun γ => 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ)
          + 2 * Real.cos (2*π/3 + γ))
        (-2 * Real.sin (α - 2*π/3 - γ) - 2 * Real.sin (2*π/3 + γ)) γ := by
      have h1 : HasDerivAt (fun γ : ℝ => α - 2*π/3 - γ) (-1) γ := by
        simpa using (hasDerivAt_id γ).const_sub (α - 2*π/3)
      have h2 : HasDerivAt (fun γ : ℝ => 2*π/3 + γ) (1) γ := by
        simpa using (hasDerivAt_id γ).const_add (2*π/3)
      have c1 := (h1.cos).const_mul (2 : ℝ)
      have c2 := (h2.cos).const_mul (2 : ℝ)
      have := ((hasDerivAt_const γ (3 - 2 * Real.cos α)).sub c1).add c2
      convert this using 1 <;> (first | rfl | ring)
    rw [hd.deriv]
    have hprod : -2 * Real.sin (α - 2*π/3 - γ) - 2 * Real.sin (2*π/3 + γ)
        = -4 * Real.sin (α/2) * Real.cos (2*π/3 + γ - α/2) := by
      have hsum := Real.sin_add_sin (α - 2*π/3 - γ) (2*π/3 + γ)
      have e1 : (α - 2*π/3 - γ + (2*π/3 + γ)) / 2 = α/2 := by ring
      have e2 : (α - 2*π/3 - γ - (2*π/3 + γ)) / 2 = -(2*π/3 + γ - α/2) := by ring
      rw [e1, e2, Real.cos_neg] at hsum; nlinarith only [hsum]
    rw [hprod]
    have hsin : 0 < Real.sin (α/2) :=
      Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith [Real.pi_pos])
    have hcos : Real.cos (2*π/3 + γ - α/2) < 0 :=
      Real.cos_neg_of_pi_div_two_lt_of_lt (by linarith) (by linarith [Real.pi_pos])
    nlinarith only [hsin, hcos]
theorem capU2_dist_strictMonoOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictMonoOn (fun γ => dist (capU1 α) (capU2 γ)) (Set.Icc 0 (π/3)) := by
  intro a ha b hb hab
  exact lt_of_pow_lt_pow_left₀ 2 dist_nonneg (capU1U2_dist_sq_strictMonoOn hα0 hα1 ha hb hab)
noncomputable def capU3 (δ : ℝ) : ℝ² :=
  pt (1/2 + Real.cos (4*π/3 + δ)) (Real.sqrt 3 / 2 + Real.sin (4*π/3 + δ))
theorem capU1U3_dist_sq (α δ : ℝ) :
    dist (capU1 α) (capU3 δ) ^ 2
      = 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ) := by
  have norm_sub_sq : ∀ (a b : ℝ²),
      dist a b ^ 2 = (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 :=
    Problem97.dist_sq_coord
  rw [norm_sub_sq]
  simp only [capU1, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  have hcos_sub : Real.cos (α - 4*π/3 - δ)
      = Real.cos α * Real.cos (4*π/3 + δ) + Real.sin α * Real.sin (4*π/3 + δ) := by
    rw [show α - 4*π/3 - δ = α - (4*π/3 + δ) by ring, Real.cos_sub]
  rw [hcos_sub]
  linear_combination Real.sin_sq_add_cos_sq α + Real.sin_sq_add_cos_sq (4*π/3 + δ)
    + (1/4) * Real.sq_sqrt (show (0:ℝ) ≤ 3 by norm_num)
theorem capU1U3_dist_sq_strictAntiOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictAntiOn (fun δ => dist (capU1 α) (capU3 δ) ^ 2) (Set.Icc 0 (π/3)) := by
  have key : (fun δ => dist (capU1 α) (capU3 δ) ^ 2)
      = (fun δ => 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ)) := by
    funext δ; exact capU1U3_dist_sq α δ
  rw [key]
  apply strictAntiOn_of_deriv_neg (convex_Icc 0 (π/3))
  · fun_prop
  · intro δ hδ
    rw [interior_Icc] at hδ
    obtain ⟨hδ0, hδ1⟩ := hδ
    have hd : HasDerivAt
        (fun δ => 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ))
        (-2 * Real.sin (α - 4*π/3 - δ) - Real.sin (4*π/3 + δ)
          + Real.sqrt 3 * Real.cos (4*π/3 + δ)) δ := by
      have h1 : HasDerivAt (fun δ : ℝ => α - 4*π/3 - δ) (-1) δ := by
        simpa using (hasDerivAt_id δ).const_sub (α - 4*π/3)
      have h2 : HasDerivAt (fun δ : ℝ => 4*π/3 + δ) (1) δ := by
        simpa using (hasDerivAt_id δ).const_add (4*π/3)
      have hbase : HasDerivAt
          (fun _ : ℝ => (3:ℝ) - Real.cos α - Real.sqrt 3 * Real.sin α) 0 δ :=
        hasDerivAt_const δ _
      have t1 := (h1.cos).const_mul (2 : ℝ)
      have t2 := h2.cos
      have t3 := (h2.sin).const_mul (Real.sqrt 3)
      have := ((hbase.sub t1).add t2).add t3
      convert this using 1 <;> (first | rfl | ring)
    rw [hd.deriv]
    have hsp := Real.sin_sub_sin δ (α - 4*π/3 - δ)
    rw [show (δ - (α - 4*π/3 - δ)) / 2 = 2*π/3 + δ - α/2 by ring,
        show (δ + (α - 4*π/3 - δ)) / 2 = α/2 - 2*π/3 by ring] at hsp
    have hstep : -Real.sin (4*π/3 + δ) + Real.sqrt 3 * Real.cos (4*π/3 + δ)
        = 2 * Real.sin δ := by
      have hc43 : Real.cos (4*π/3) = -(1/2) := by
        rw [show (4:ℝ)*π/3 = π + π/3 by ring, Real.cos_add, Real.cos_pi, Real.sin_pi,
            Real.cos_pi_div_three]; ring
      have hs43 : Real.sin (4*π/3) = -(Real.sqrt 3 / 2) := by
        rw [show (4:ℝ)*π/3 = π + π/3 by ring, Real.sin_add, Real.cos_pi, Real.sin_pi,
            Real.sin_pi_div_three]; ring
      rw [Real.sin_add, Real.cos_add, hc43, hs43]
      linear_combination (Real.sin δ / 2) * Real.mul_self_sqrt (show (0:ℝ) ≤ 3 by norm_num)
    have hD : -2 * Real.sin (α - 4*π/3 - δ) - Real.sin (4*π/3 + δ)
          + Real.sqrt 3 * Real.cos (4*π/3 + δ)
        = 4 * Real.cos (α/2 - 2*π/3) * Real.sin (2*π/3 + δ - α/2) := by
      linear_combination 2 * hsp + hstep
    rw [hD]
    have hcos : Real.cos (α/2 - 2*π/3) < 0 := by
      rw [show α/2 - 2*π/3 = -(2*π/3 - α/2) by ring, Real.cos_neg]
      exact Real.cos_neg_of_pi_div_two_lt_of_lt (by linarith) (by linarith [Real.pi_pos])
    have hsin : 0 < Real.sin (2*π/3 + δ - α/2) :=
      Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith [Real.pi_pos])
    nlinarith only [hcos, hsin]
theorem capU3_dist_strictAntiOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictAntiOn (fun δ => dist (capU1 α) (capU3 δ)) (Set.Icc 0 (π/3)) := by
  intro a ha b hb hab
  exact lt_of_pow_lt_pow_left₀ 2 dist_nonneg
    (capU1U3_dist_sq_strictAntiOn hα0 hα1 ha hb hab)
end Problem97
end Batch3N9
end Batch3N9Unit076

-- Original module: Solutions.Batch3N9.U2.OneHitRealization
section Batch3N9Unit077
namespace Batch3N9
open Real Set
open scoped EuclideanGeometry
namespace Problem97
theorem n8a3_of_distScalingToCapU2
    {T : ℝ² → ℝ²} {scale : ℝ} (hscale : 0 < scale)
    (hdist : ∀ a b : ℝ², dist (T a) (T b) = scale * dist a b)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (γ : Fin m → ℝ) (hγmem : ∀ i, γ i ∈ Set.Icc (0:ℝ) (π/3)) (hγmono : StrictMono γ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  intro i j hij
  have hmono := capU2_dist_strictMonoOn hα0 hα1 (hγmem i) (hγmem j) (hγmono hij)
  simp only [] at hmono
  rw [← hs, ← hL i, ← hL j, hdist, hdist] at hmono
  nlinarith only [hmono, hscale]
theorem n8a3_of_distScalingToCapU3
    {T : ℝ² → ℝ²} {scale : ℝ} (hscale : 0 < scale)
    (hdist : ∀ a b : ℝ², dist (T a) (T b) = scale * dist a b)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (δ : Fin m → ℝ) (hδmem : ∀ i, δ i ∈ Set.Icc (0:ℝ) (π/3)) (hδanti : StrictAnti δ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  intro i j hij
  have hmono := capU3_dist_strictAntiOn hα0 hα1 (hδmem j) (hδmem i) (hδanti hij)
  simp only [] at hmono
  rw [← hs, ← hL i, ← hL j, hdist, hdist] at hmono
  nlinarith only [hmono, hscale]
end Problem97
end Batch3N9
end Batch3N9Unit077

-- Original module: Solutions.Batch3N9.N8.N8aArcTwoCircle
section Batch3N9Unit078
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
namespace Problem97
structure N8ArcCircle where
  support : Finset ℝ²
  circleCenter : ℝ²
  circleRadius : ℝ
  on_circle : ∀ x ∈ support, dist circleCenter x = circleRadius
namespace N8ArcCircle
theorem mem_sphere (P : N8ArcCircle) {x : ℝ²} (hx : x ∈ P.support) :
    x ∈ (⟨P.circleCenter, P.circleRadius⟩ : Sphere ℝ²) := by
  exact EuclideanGeometry.mem_sphere.mpr <| by
    calc
      dist x P.circleCenter = dist P.circleCenter x := dist_comm x P.circleCenter
      _ = P.circleRadius := P.on_circle x hx
end N8ArcCircle
structure N8ApexArcWitness where
  apex : ℝ²
  selectedRadius : ℝ
  arc : N8ArcCircle
  circles_ne : (⟨apex, selectedRadius⟩ : Sphere ℝ²) ≠
    ⟨arc.circleCenter, arc.circleRadius⟩
structure N8AdjacentArcWitness where
  base : N8ApexArcWitness
  m : ℕ
  chain : FiniteEndpoint.OrderedSideChain m
  chain_covers : base.arc.support ⊆ chain.support
  monotone : N8a3AdjacentCapDistanceStrict base.apex chain
namespace N8ApexArcWitness
end N8ApexArcWitness
namespace N8AdjacentArcWitness
theorem selectedClass_inter_card_le_one
    {A : Finset ℝ²} (W : N8AdjacentArcWitness) :
    ((SelectedClass A W.base.apex W.base.selectedRadius) ∩ W.base.arc.support).card ≤ 1 := by
  apply FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius
      W.base.apex W.chain W.monotone W.base.selectedRadius
  · intro x hx
    exact W.chain_covers (Finset.mem_of_mem_inter_right hx)
  · intro x hx
    exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
end N8AdjacentArcWitness
namespace FiniteEndpointShell
theorem N8a3_adjacent_one_hit
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (_hN4e : S.N4eCapContainment)
    (hadj : N8AdjacentArcWitness) :
    ((SelectedClass A hadj.base.apex hadj.base.selectedRadius) ∩
      hadj.base.arc.support).card ≤ 1 := by
  exact hadj.selectedClass_inter_card_le_one
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit078

-- Original module: Solutions.Batch3N9.N8.N8bEndpointPair
section Batch3N9Unit079
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
@[reducible] noncomputable def capByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.CP.C1
  | 1 => S.CP.C2
  | _ => S.CP.C3
@[reducible] noncomputable def capInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I1
  | 1 => S.I2
  | _ => S.I3
theorem capInteriorByIndex_subset
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) :
    S.capInteriorByIndex i ⊆ A := by
  intro x hx
  fin_cases i
  · simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
    exact S.CP.C1_subset hx.2.2
  · simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
    exact S.CP.C2_subset hx.2.2
  · simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
    exact S.CP.C3_subset hx.2.2
@[reducible] def ownLeftEndpointByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v2
  | 1 => S.triangle.v3
  | _ => S.triangle.v1
@[reducible] def ownRightEndpointByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v3
  | 1 => S.triangle.v1
  | _ => S.triangle.v2
@[reducible] noncomputable def leftAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I2
  | 1 => S.I3
  | _ => S.I1
@[reducible] noncomputable def rightAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I3
  | 1 => S.I1
  | _ => S.I2
structure N8SelectedApex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) where
  radius : ℝ
  radius_pos : 0 < radius
  cap_mem : x ∈ S.capInteriorByIndex i
  selected_card : 4 ≤ (SelectedClass A x radius).card
theorem N8SelectedApex.nonempty_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.capInteriorByIndex i) :
    Nonempty (N8SelectedApex S i x) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset i hxcap
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hxA with
    ⟨r, hr, hcard⟩
  exact ⟨{ radius := r
           radius_pos := hr
           cap_mem := hxcap
           selected_card := hcard }⟩
structure N8MoserEndpointPair
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) where
  m₁ : ℝ²
  m₂ : ℝ²
  m₁_moser : m₁ ∈ S.triangle.verts
  m₂_moser : m₂ ∈ S.triangle.verts
  m₁_mem : m₁ ∈ SelectedClass A x radius
  m₂_mem : m₂ ∈ SelectedClass A x radius
  m₁_ne_m₂ : m₁ ≠ m₂
theorem mem_oppositeCap_of_selected
    {A : Finset ℝ²}
    {x va ve w : ℝ²} {radius d r : ℝ}
    (hxA : x ∈ A) {Ce : Finset ℝ²}
    (hdist_va_x : dist va x = d)
    (hva_mem : va ∈ SelectedClass A x radius)
    (hve_mem : ve ∈ SelectedClass A x radius)
    (hCeEq : A.filter (fun y => dist ve y = r) = Ce)
    (hw_mem : w ∈ Ce) (hw_dist : dist ve w = d) :
    x ∈ Ce := by
  classical
  have hxva : dist x va = radius := (mem_selectedClass.mp hva_mem).2
  have hrad : radius = d := by rw [← hxva, dist_comm]; exact hdist_va_x
  have hxve : dist x ve = radius := (mem_selectedClass.mp hve_mem).2
  have hdist_ve_x : dist ve x = d := by rw [dist_comm, hxve, hrad]
  have hw_filter : w ∈ A.filter (fun y => dist ve y = r) := by rw [hCeEq]; exact hw_mem
  have hrd : r = d := by rw [← hw_dist]; exact ((Finset.mem_filter.mp hw_filter).2).symm
  rw [← hCeEq, Finset.mem_filter]
  exact ⟨hxA, by rw [hrd]; exact hdist_ve_x⟩
theorem two_caps_nonmoser_false_12
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h1 : x ∈ S.CP.C1) (h2 : x ∈ S.CP.C2) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h1, if_pos h2] at h; split at h <;> omega
theorem two_caps_nonmoser_false_13
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h1 : x ∈ S.CP.C1) (h3 : x ∈ S.CP.C3) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h1, if_pos h3] at h; split at h <;> omega
theorem two_caps_nonmoser_false_23
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h2 : x ∈ S.CP.C2) (h3 : x ∈ S.CP.C3) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h2, if_pos h3] at h; split at h <;> omega
theorem nonOwnPair_index_false
    {A : Finset ℝ²}
    {x va vb vc : ℝ²} {radius : ℝ}
    {m₁ m₂ : ℝ²}
    (hm₁ : m₁ = va ∨ m₁ = vb ∨ m₁ = vc) (hm₂ : m₂ = va ∨ m₂ = vb ∨ m₂ = vc)
    (hne : m₁ ≠ m₂)
    (hown : ¬((m₁ = vb ∧ m₂ = vc) ∨ (m₁ = vc ∧ m₂ = vb)))
    (hm₁mem : m₁ ∈ SelectedClass A x radius) (hm₂mem : m₂ ∈ SelectedClass A x radius)
    (hContraB : va ∈ SelectedClass A x radius → vb ∈ SelectedClass A x radius → False)
    (hContraC : va ∈ SelectedClass A x radius → vc ∈ SelectedClass A x radius → False) :
    False := by
  classical
  rcases hm₁ with rfl | rfl | rfl <;> rcases hm₂ with rfl | rfl | rfl <;>
    first
    | exact absurd rfl hne
    | exact hContraB hm₁mem hm₂mem
    | exact hContraB hm₂mem hm₁mem
    | exact hContraC hm₁mem hm₂mem
    | exact hContraC hm₂mem hm₁mem
    | exact hown (Or.inl ⟨rfl, rfl⟩)
    | exact hown (Or.inr ⟨rfl, rfl⟩)
theorem N8b_endpoint_pair_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : N8SelectedApex S i x)
    (hMoser2 : N8MoserEndpointPair S i x hx.radius)
    (hnotown : ¬((hMoser2.m₁ = S.ownLeftEndpointByIndex i ∧
                  hMoser2.m₂ = S.ownRightEndpointByIndex i) ∨
                 (hMoser2.m₁ = S.ownRightEndpointByIndex i ∧
                  hMoser2.m₂ = S.ownLeftEndpointByIndex i))) :
    False := by
  classical
  obtain ⟨m₁, m₂, m₁_moser, m₂_moser, m₁_mem, m₂_mem, m₁_ne_m₂⟩ := hMoser2
  have hown : ¬((m₁ = S.ownLeftEndpointByIndex i ∧ m₂ = S.ownRightEndpointByIndex i) ∨
               (m₁ = S.ownRightEndpointByIndex i ∧ m₂ = S.ownLeftEndpointByIndex i)) :=
    hnotown
  classical
    obtain ⟨d, hdpos, hC1d, hC2d, hC3d⟩ := S.n7_circle_placement hN4e
    obtain ⟨r1, hr1, hC1eq⟩ := S.exact_cap_class_at_v1 hN4e
    obtain ⟨r2, hr2, hC2eq⟩ := S.exact_cap_class_at_v2 hN4e
    obtain ⟨r3, hr3, hC3eq⟩ := S.exact_cap_class_at_v3 hN4e
    have hm₁v : m₁ = S.triangle.v1 ∨ m₁ = S.triangle.v2 ∨ m₁ = S.triangle.v3 := by
      simpa only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        using m₁_moser
    have hm₂v : m₂ = S.triangle.v1 ∨ m₂ = S.triangle.v2 ∨ m₂ = S.triangle.v3 := by
      simpa only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        using m₂_moser
    fin_cases i
    ·
      have hxI1 : x ∈ S.I1 := hx.cap_mem
      have hxC1 : x ∈ S.CP.C1 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI1)
      have hxA : x ∈ A := S.CP.C1_subset hxC1
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨fun h => S.CP.v1_notin_C1 (h ▸ hxC1),
          (Finset.mem_erase.mp (Finset.mem_erase.mp hxI1).2).1,
          (Finset.mem_erase.mp hxI1).1⟩
      exact nonOwnPair_index_false (va := S.triangle.v1) (vb := S.triangle.v2)
        (vc := S.triangle.v3) hm₁v hm₂v m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_12 S hxA hxnon hxC1
            (mem_oppositeCap_of_selected hxA (hC1d x hxC1) hva hvb hC2eq
              S.CP.v3_mem_C2 (hC2d _ S.CP.v3_mem_C2)))
        (fun hva hvc =>
          two_caps_nonmoser_false_13 S hxA hxnon hxC1
            (mem_oppositeCap_of_selected hxA (hC1d x hxC1) hva hvc hC3eq
              S.CP.v2_mem_C3 (hC3d _ S.CP.v2_mem_C3)))
    ·
      have hxI2 : x ∈ S.I2 := hx.cap_mem
      have hxC2 : x ∈ S.CP.C2 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI2)
      have hxA : x ∈ A := S.CP.C2_subset hxC2
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨(Finset.mem_erase.mp hxI2).1,
          fun h => S.CP.v2_notin_C2 (h ▸ hxC2),
          (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1⟩
      have hm₁v' : m₁ = S.triangle.v2 ∨ m₁ = S.triangle.v3 ∨ m₁ = S.triangle.v1 := by
        rcases hm₁v with h | h | h
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
        · exact Or.inr (Or.inl h)
      have hm₂v' : m₂ = S.triangle.v2 ∨ m₂ = S.triangle.v3 ∨ m₂ = S.triangle.v1 := by
        rcases hm₂v with h | h | h
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
        · exact Or.inr (Or.inl h)
      exact nonOwnPair_index_false (va := S.triangle.v2) (vb := S.triangle.v3)
        (vc := S.triangle.v1)
        hm₁v' hm₂v' m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_23 S hxA hxnon hxC2
            (mem_oppositeCap_of_selected hxA (hC2d x hxC2) hva hvb hC3eq
              S.CP.v1_mem_C3 (hC3d _ S.CP.v1_mem_C3)))
        (fun hva hvc =>
          two_caps_nonmoser_false_12 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC2d x hxC2) hva hvc hC1eq
              S.CP.v3_mem_C1 (hC1d _ S.CP.v3_mem_C1)) hxC2)
    ·
      have hxI3 : x ∈ S.I3 := hx.cap_mem
      have hxC3 : x ∈ S.CP.C3 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3)
      have hxA : x ∈ A := S.CP.C3_subset hxC3
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨(Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).1,
          (Finset.mem_erase.mp hxI3).1,
          fun h => S.CP.v3_notin_C3 (h ▸ hxC3)⟩
      have hm₁v' : m₁ = S.triangle.v3 ∨ m₁ = S.triangle.v1 ∨ m₁ = S.triangle.v2 := by
        rcases hm₁v with h | h | h
        · exact Or.inr (Or.inl h)
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
      have hm₂v' : m₂ = S.triangle.v3 ∨ m₂ = S.triangle.v1 ∨ m₂ = S.triangle.v2 := by
        rcases hm₂v with h | h | h
        · exact Or.inr (Or.inl h)
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
      exact nonOwnPair_index_false (va := S.triangle.v3) (vb := S.triangle.v1)
        (vc := S.triangle.v2)
        hm₁v' hm₂v' m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_13 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC3d x hxC3) hva hvb hC1eq
              S.CP.v2_mem_C1 (hC1d _ S.CP.v2_mem_C1)) hxC3)
        (fun hva hvc =>
          two_caps_nonmoser_false_23 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC3d x hxC3) hva hvc hC2eq
              S.CP.v1_mem_C2 (hC2d _ S.CP.v1_mem_C2)) hxC3)
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit079

-- Original module: Solutions.Batch3N9.N8.FourSubpacket
/- Original per-file notice from N8/FourSubpacket.lean:
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
section Batch3N9Unit080
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit080

-- Original module: Solutions.Batch3N9.N8.N8hiSameCap
section Batch3N9Unit081
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
structure N8SameCapClassPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (x : ℝ²) (i : Fin 3) where
  center : ℝ²
  radius : ℝ
  radius_pos : 0 < radius
  x_on_selected_circle : dist x center = radius
structure N8iCapCenterPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {hN4e : S.N4eCapContainment}
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i) where
  sameCapMate : ℝ²
  fullWidthPoint : ℝ²
  mate_on_selected_circle : dist sameCapMate hx.center = hx.radius
  ref_on_selected_circle : dist fullWidthPoint hx.center = hx.radius
  x_mate_eq_radius : dist x sameCapMate = hx.radius
  x_ref_eq_radius : dist x fullWidthPoint = hx.radius
  mate_open_width :
    |(arcAngle hx.center x - arcAngle hx.center sameCapMate).toReal| <
      Real.pi / 3
  ref_full_width :
    |(arcAngle hx.center x - arcAngle hx.center fullWidthPoint).toReal| =
      Real.pi / 3
theorem N8i_capcenter_fullwidth_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i)
    (hCapCenterMoser : S.N8iCapCenterPacket hx) :
    False := by
  have hsameWidth :
      |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.sameCapMate).toReal| =
        |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.fullWidthPoint).toReal| := by
    apply
      (arcAngle_chord_length_eq_iff
        hx.center hx.radius hx.radius_pos
        x hCapCenterMoser.sameCapMate hCapCenterMoser.fullWidthPoint
        hx.x_on_selected_circle
        hCapCenterMoser.mate_on_selected_circle
        hCapCenterMoser.ref_on_selected_circle).mp
    calc
      dist x hCapCenterMoser.sameCapMate = hx.radius := hCapCenterMoser.x_mate_eq_radius
      _ = dist x hCapCenterMoser.fullWidthPoint := hCapCenterMoser.x_ref_eq_radius.symm
  have hfull :
      |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.sameCapMate).toReal| =
        Real.pi / 3 := by
    exact hsameWidth.trans hCapCenterMoser.ref_full_width
  linarith [hCapCenterMoser.mate_open_width, hfull, Real.pi_pos]
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit081

-- Original module: Solutions.Batch3N9.U2.SimilarityNormalization
section Batch3N9Unit082
namespace Batch3N9
open Real Set
open scoped EuclideanGeometry
namespace Problem97
noncomputable def normSim (p₁ p₂ x : ℝ²) : ℝ² :=
  pt (((x 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (x 1 - p₁ 1) * (p₂ 1 - p₁ 1))
        / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2))
     (((x 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (x 0 - p₁ 0) * (p₂ 1 - p₁ 1))
        / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2))
theorem b3n9m082_normSq_sub (u v : ℝ²) :
    dist u v ^ 2 = (u 0 - v 0) ^ 2 + (u 1 - v 1) ^ 2 :=
  Problem97.dist_sq_coord u v
theorem b3n9m082_normSim_ℓ2_pos {p₁ p₂ : ℝ²} (hp : p₁ ≠ p₂) :
    0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
  have hd : 0 < dist p₁ p₂ := dist_pos.mpr hp
  have hsq : dist p₁ p₂ ^ 2 = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    rw [b3n9m082_normSq_sub]; ring
  nlinarith only [hsq, hd]
theorem normSim_dist_image (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) (a b : ℝ²) :
    dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) = (dist p₁ p₂)⁻¹ * dist a b := by
  have hℓ2 : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (b3n9m082_normSim_ℓ2_pos hp)
  have hD : 0 < dist p₁ p₂ := dist_pos.mpr hp
  have hX : 0 ≤ dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) := dist_nonneg
  have h2 : 0 ≤ (dist p₁ p₂)⁻¹ * dist a b :=
    mul_nonneg (inv_nonneg.mpr hD.le) dist_nonneg
  have hkey : dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) ^ 2 * dist p₁ p₂ ^ 2
      = dist a b ^ 2 := by
    rw [b3n9m082_normSq_sub (normSim p₁ p₂ a) (normSim p₁ p₂ b), b3n9m082_normSq_sub p₁ p₂, b3n9m082_normSq_sub a b]
    simp only [normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    field_simp
    ring
  have hsq : dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) ^ 2
      = ((dist p₁ p₂)⁻¹ * dist a b) ^ 2 := by
    rw [mul_pow, inv_pow]
    field_simp
    linear_combination hkey
  rw [← Real.sqrt_sq hX, hsq, Real.sqrt_sq h2]
theorem normSim_fst (p₁ p₂ : ℝ²) : normSim p₁ p₂ p₁ = pt 0 0 := by
  simp only [normSim, pt, sub_self, zero_mul, add_zero, zero_div]
theorem normSim_snd (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) : normSim p₁ p₂ p₂ = pt 1 0 := by
  have hℓ2 : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (b3n9m082_normSim_ℓ2_pos hp)
  have e1 : ((p₂ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₂ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 1 := by
    rw [div_eq_iff hℓ2]; ring
  have e2 : ((p₂ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₂ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 0 := by
    rw [div_eq_iff hℓ2]; ring
  rw [normSim, e1, e2]
theorem normSim_thd (p₁ p₂ p₃ : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃) :
    normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) := by
  have hℓ2 : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := b3n9m082_normSim_ℓ2_pos hp
  have hℓ2' : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt hℓ2
  have eqA : (p₃ 0 - p₁ 0) ^ 2 + (p₃ 1 - p₁ 1) ^ 2
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    have h : dist p₃ p₁ ^ 2 = dist p₁ p₂ ^ 2 := by rw [h31]
    rw [b3n9m082_normSq_sub p₃ p₁, b3n9m082_normSq_sub p₁ p₂] at h; linear_combination h
  have eqB : (p₃ 0 - p₂ 0) ^ 2 + (p₃ 1 - p₂ 1) ^ 2
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    have h : dist p₂ p₃ ^ 2 = dist p₁ p₂ ^ 2 := by rw [h23]
    rw [b3n9m082_normSq_sub p₂ p₃, b3n9m082_normSq_sub p₁ p₂] at h; linear_combination h
  have hNX : 2 * ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by linear_combination eqA - eqB
  have hNY2 : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
      = 3 / 4 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) ^ 2 := by
    have ringid : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
        = ((p₃ 0 - p₁ 0) ^ 2 + (p₃ 1 - p₁ 1) ^ 2)
            * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)
          - ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1)) ^ 2 := by ring
    have hNXhalf : (p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1)
        = ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) / 2 := by linarith [hNX]
    rw [ringid, eqA, hNXhalf]; ring
  have hX : ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 1 / 2 := by
    rw [div_eq_iff hℓ2']; linarith [hNX]
  have hNYpos : 0 < (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1) := by
    have heq : signedArea2 p₁ p₂ p₃
        = (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1) := by
      simp only [signedArea2]; ring
    rw [← heq]; exact hori
  have hsqrt3sq : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
  have hRHS : (0 : ℝ) ≤ Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) := by
    positivity
  have hNYval : (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)
      = Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) := by
    have hsq : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
        = (Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)) ^ 2 := by
      rw [hNY2, mul_pow, div_pow, hsqrt3sq]; ring
    have := congrArg Real.sqrt hsq
    rwa [Real.sqrt_sq hNYpos.le, Real.sqrt_sq hRHS] at this
  have hY : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = Real.sqrt 3 / 2 := by
    rw [div_eq_iff hℓ2', hNYval]
  simp only [normSim]
  rw [hX, hY]
theorem normSim_dist_fst (p₁ p₂ s : ℝ²) (hp : p₁ ≠ p₂) :
    dist (normSim p₁ p₂ s) (pt 0 0) = (dist p₁ p₂)⁻¹ * dist s p₁ := by
  rw [← normSim_fst p₁ p₂, normSim_dist_image p₁ p₂ hp s p₁]
theorem exists_capU1_of_dist_origin_one (q : ℝ²) (hq : dist q (pt 0 0) = 1) :
    ∃ α : ℝ, -π < α ∧ α ≤ π ∧ q = capU1 α := by
  have hcoord : (q 0) ^ 2 + (q 1) ^ 2 = 1 := by
    have h := b3n9m082_normSq_sub q (pt 0 0)
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith only [h]
  set z : ℂ := ⟨q 0, q 1⟩ with hz
  have hnsq : Complex.normSq z = 1 := by
    rw [hz, Complex.normSq_mk]; nlinarith only [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg, Complex.neg_pi_lt_arg z, Complex.arg_le_pi z, ?_⟩
  have hcos : Real.cos z.arg = q 0 := by
    rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 := by
    rw [Complex.sin_arg, habs, div_one]
  rw [capU1, hcos, hsin]
  ext i
  fin_cases i <;> rfl
theorem signedArea2_normSim (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) (a b c : ℝ²) :
    signedArea2 (normSim p₁ p₂ a) (normSim p₁ p₂ b) (normSim p₁ p₂ c)
      = ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ * signedArea2 a b c := by
  have hL : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (b3n9m082_normSim_ℓ2_pos hp)
  simp only [signedArea2, normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  field_simp
  ring
theorem capU1_arg_range (α : ℝ) (hlo : -π < α) (hhi : α ≤ π)
    (hC : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2)) < 0) :
    0 < α ∧ α < π / 3 := by
  have hCeq : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2))
      = Real.sqrt 3 / 2 - Real.cos (α - π / 6) := by
    simp only [signedArea2, capU1, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      Real.cos_sub, Real.cos_pi_div_six, Real.sin_pi_div_six]; ring
  rw [hCeq] at hC
  have hcos : Real.cos (π / 6) < Real.cos (α - π / 6) := by
    rw [Real.cos_pi_div_six]; linarith
  have h0 : (0 : ℝ) ≤ π / 6 := by positivity
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h
    rw [show α - π / 6 = -(π / 6 - α) by ring, Real.cos_neg] at hcos
    by_cases hb : π / 6 - α ≤ π
    · have hle : π / 6 ≤ π / 6 - α := by linarith
      have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hb hle
      linarith
    · push_neg at hb
      have h1 : π / 2 ≤ π / 6 - α := by linarith [Real.pi_pos]
      have h2 : π / 6 - α ≤ π + π / 2 := by linarith
      have hnp := Real.cos_nonpos_of_pi_div_two_le_of_le h1 h2
      have hp6 : (0 : ℝ) < Real.cos (π / 6) := by rw [Real.cos_pi_div_six]; positivity
      linarith
  · by_contra h
    push_neg at h
    have h2 : α - π / 6 ≤ π := by linarith
    have hle : π / 6 ≤ α - π / 6 := by linarith
    have := Real.cos_le_cos_of_nonneg_of_le_pi h0 h2 hle
    linarith
theorem normSim_centre_image (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂)
    (hchord : signedArea2 s p₂ p₃ < 0) :
    ∃ α : ℝ, normSim p₁ p₂ s = capU1 α ∧ 0 < α ∧ α < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := b3n9m082_normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  have hone : dist (normSim p₁ p₂ s) (pt 0 0) = 1 := by
    rw [normSim_dist_fst p₁ p₂ s hp, hs1, inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨α, hαlo, hαhi, hαeq⟩ := exists_capU1_of_dist_origin_one _ hone
  have hC : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2)) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp s p₂ p₃
    rw [hαeq, normSim_snd p₁ p₂ hp, h3img] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hα0, hα1⟩ := capU1_arg_range α hαlo hαhi hC
  exact ⟨α, hαeq, hα0, hα1⟩
theorem exists_capU2_of_dist_v2_one (q : ℝ²) (hq : dist q (pt 1 0) = 1) :
    ∃ γ : ℝ, -(5 * π / 3) < γ ∧ γ ≤ π / 3 ∧ q = capU2 γ := by
  have hcoord : (q 0 - 1) ^ 2 + (q 1) ^ 2 = 1 := by
    have h := b3n9m082_normSq_sub q (pt 1 0)
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith only [h]
  set z : ℂ := ⟨q 0 - 1, q 1⟩ with hz
  have hnsq : Complex.normSq z = 1 := by
    rw [hz, Complex.normSq_mk]; nlinarith only [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg - 2 * π / 3, by have := Complex.neg_pi_lt_arg z; linarith,
    by have := Complex.arg_le_pi z; linarith, ?_⟩
  have hcos : Real.cos z.arg = q 0 - 1 := by rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 := by rw [Complex.sin_arg, habs, div_one]
  have hq0 : q 0 = 1 + Real.cos (2 * π / 3 + (z.arg - 2 * π / 3)) := by
    rw [show 2 * π / 3 + (z.arg - 2 * π / 3) = z.arg by ring, hcos]; ring
  have hq1 : q 1 = Real.sin (2 * π / 3 + (z.arg - 2 * π / 3)) := by
    rw [show 2 * π / 3 + (z.arg - 2 * π / 3) = z.arg by ring, hsin]
  rw [capU2]
  ext i
  fin_cases i
  · simpa only [pt, Fin.mk_zero, Matrix.cons_val_zero] using hq0
  · simpa only [pt, Fin.mk_one, Matrix.cons_val_one, Matrix.cons_val_zero] using hq1
theorem capU2_arg_range (γ : ℝ) (hlo : -(5 * π / 3) < γ) (hhi : γ ≤ π / 3)
    (hC : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0) < 0) :
    0 < γ ∧ γ < π / 3 := by
  have hCeq : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0)
      = Real.sqrt 3 / 2 + Real.cos (5 * π / 6 + γ) := by
    rw [show (5 : ℝ) * π / 6 + γ = (2 * π / 3 + γ) + π / 6 by ring,
      Real.cos_add, Real.cos_pi_div_six, Real.sin_pi_div_six]
    simp only [signedArea2, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hCeq] at hC
  have hcos2 : Real.cos (5 * π / 6 + γ) < -(Real.sqrt 3 / 2) := by linarith
  have c56 : Real.cos (5 * π / 6) = -(Real.sqrt 3 / 2) := by
    rw [show (5 : ℝ) * π / 6 = π - π / 6 by ring, Real.cos_sub, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_six]; ring
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h
    have hθhi : 5 * π / 6 + γ ≤ 5 * π / 6 := by linarith
    have habs : |5 * π / 6 + γ| ≤ 5 * π / 6 := by rw [abs_le]; constructor <;> linarith
    have hpi : 5 * π / 6 ≤ π := by linarith [Real.pi_pos]
    have := Real.cos_le_cos_of_nonneg_of_le_pi (abs_nonneg _) hpi habs
    rw [Real.cos_abs, c56] at this
    linarith
  · by_contra h
    push_neg at h
    have hγ : γ = π / 3 := le_antisymm hhi h
    rw [hγ] at hcos2
    have c76 : Real.cos (5 * π / 6 + π / 3) = -(Real.sqrt 3 / 2) := by
      rw [show (5 : ℝ) * π / 6 + π / 3 = π + π / 6 by ring, Real.cos_add, Real.cos_pi,
        Real.sin_pi, Real.cos_pi_div_six]; ring
    rw [c76] at hcos2
    linarith
theorem normSim_chainImage_capU2 (p₁ p₂ p₃ w : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hw2 : dist w p₂ = dist p₁ p₂)
    (hchord : signedArea2 w p₃ p₁ < 0) :
    ∃ γ : ℝ, normSim p₁ p₂ w = capU2 γ ∧ 0 < γ ∧ γ < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := b3n9m082_normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  have hone : dist (normSim p₁ p₂ w) (pt 1 0) = 1 := by
    rw [← normSim_snd p₁ p₂ hp, normSim_dist_image p₁ p₂ hp w p₂, hw2,
      inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨γ, hγlo, hγhi, hγeq⟩ := exists_capU2_of_dist_v2_one _ hone
  have hC : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp w p₃ p₁
    rw [hγeq, h3img, normSim_fst p₁ p₂] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hγ0, hγ1⟩ := capU2_arg_range γ hγlo hγhi hC
  exact ⟨γ, hγeq, hγ0, hγ1⟩
theorem exists_capU3_of_dist_v3_one (q : ℝ²) (hq : dist q (pt (1 / 2) (Real.sqrt 3 / 2)) = 1) :
    ∃ δ : ℝ, -(π / 3) < δ ∧ δ ≤ 5 * π / 3 ∧ q = capU3 δ := by
  have hcoord : (q 0 - 1 / 2) ^ 2 + (q 1 - Real.sqrt 3 / 2) ^ 2 = 1 := by
    have h := b3n9m082_normSq_sub q (pt (1 / 2) (Real.sqrt 3 / 2))
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    nlinarith only [h]
  set z : ℂ := ⟨q 0 - 1 / 2, q 1 - Real.sqrt 3 / 2⟩ with hz
  have hnsq : Complex.normSq z = 1 := by rw [hz, Complex.normSq_mk]; nlinarith only [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg + 2 * π / 3, by have := Complex.neg_pi_lt_arg z; linarith,
    by have := Complex.arg_le_pi z; linarith, ?_⟩
  have hcos : Real.cos z.arg = q 0 - 1 / 2 := by rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 - Real.sqrt 3 / 2 := by rw [Complex.sin_arg, habs, div_one]
  have key : (4 : ℝ) * π / 3 + (z.arg + 2 * π / 3) = z.arg + 2 * π := by ring
  have hq0 : q 0 = 1 / 2 + Real.cos (4 * π / 3 + (z.arg + 2 * π / 3)) := by
    rw [key, Real.cos_add_two_pi, hcos]; ring
  have hq1 : q 1 = Real.sqrt 3 / 2 + Real.sin (4 * π / 3 + (z.arg + 2 * π / 3)) := by
    rw [key, Real.sin_add_two_pi, hsin]; ring
  rw [capU3]
  ext i
  fin_cases i
  · simpa only [pt, Fin.mk_zero, Matrix.cons_val_zero] using hq0
  · simpa only [pt, Fin.mk_one, Matrix.cons_val_one, Matrix.cons_val_zero] using hq1
theorem capU3_arg_range (δ : ℝ) (hlo : -(π / 3) < δ) (hhi : δ ≤ 5 * π / 3)
    (hC : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0) < 0) :
    0 < δ ∧ δ < π / 3 := by
  have hc32 : Real.cos (3 * π / 2) = 0 := by
    rw [show (3 : ℝ) * π / 2 = π + π / 2 by ring, Real.cos_add, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_two, Real.sin_pi_div_two]; ring
  have hs32 : Real.sin (3 * π / 2) = -1 := by
    rw [show (3 : ℝ) * π / 2 = π + π / 2 by ring, Real.sin_add, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_two, Real.sin_pi_div_two]; ring
  have hsc : Real.cos (δ - π / 6) = -Real.sin (4 * π / 3 + δ) := by
    rw [show δ - π / 6 = (4 * π / 3 + δ) - 3 * π / 2 by ring, Real.cos_sub, hc32, hs32]; ring
  have hCeq : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0)
      = Real.sqrt 3 / 2 - Real.cos (δ - π / 6) := by
    rw [hsc]
    simp only [signedArea2, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hCeq] at hC
  have hcosgt : Real.cos (π / 6) < Real.cos (δ - π / 6) := by rw [Real.cos_pi_div_six]; linarith
  have h0 : (0 : ℝ) ≤ π / 6 := by positivity
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h
    have hnp : δ - π / 6 ≤ 0 := by linarith
    have hge : π / 6 ≤ |δ - π / 6| := by rw [abs_of_nonpos hnp]; linarith
    have hle : |δ - π / 6| ≤ π := by rw [abs_of_nonpos hnp]; linarith [Real.pi_pos]
    have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hle hge
    rw [Real.cos_abs] at this
    linarith
  · by_contra h
    push_neg at h
    have hp_ge : π / 6 ≤ δ - π / 6 := by linarith
    by_cases hpi : δ - π / 6 ≤ π
    · have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hpi hp_ge
      linarith
    · push_neg at hpi
      have h1 : π / 2 ≤ δ - π / 6 := by linarith [Real.pi_pos]
      have h2 : δ - π / 6 ≤ π + π / 2 := by linarith
      have hnp := Real.cos_nonpos_of_pi_div_two_le_of_le h1 h2
      have hp6 : (0 : ℝ) < Real.cos (π / 6) := by rw [Real.cos_pi_div_six]; positivity
      linarith
theorem normSim_chainImage_capU3 (p₁ p₂ p₃ w : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hw3 : dist w p₃ = dist p₁ p₂)
    (hchord : signedArea2 w p₁ p₂ < 0) :
    ∃ δ : ℝ, normSim p₁ p₂ w = capU3 δ ∧ 0 < δ ∧ δ < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := b3n9m082_normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  have hone : dist (normSim p₁ p₂ w) (pt (1 / 2) (Real.sqrt 3 / 2)) = 1 := by
    rw [← h3img, normSim_dist_image p₁ p₂ hp w p₃, hw3, inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨δ, hδlo, hδhi, hδeq⟩ := exists_capU3_of_dist_v3_one _ hone
  have hC : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp w p₁ p₂
    rw [hδeq, normSim_fst p₁ p₂, normSim_snd p₁ p₂ hp] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hδ0, hδ1⟩ := capU3_arg_range δ hδlo hδhi hC
  exact ⟨δ, hδeq, hδ0, hδ1⟩
theorem n8a3_normSimChain_capU2 (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3)) (hγmono : StrictMono γ)
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  obtain ⟨α, hsα, hα0, hα1⟩ := normSim_centre_image p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord
  exact n8a3_of_distScalingToCapU2 (inv_pos.mpr (dist_pos.mpr hp))
    (normSim_dist_image p₁ p₂ hp) L hα0 hα1 γ hγmem hγmono hsα hL
theorem n8a3_normSimChain_capU3 (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3)) (hδanti : StrictAnti δ)
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  obtain ⟨α, hsα, hα0, hα1⟩ := normSim_centre_image p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord
  exact n8a3_of_distScalingToCapU3 (inv_pos.mpr (dist_pos.mpr hp))
    (normSim_dist_image p₁ p₂ hp) L hα0 hα1 δ hδmem hδanti hsα hL
theorem signedArea2_capU2_eq_sin (a b : ℝ) :
    signedArea2 (pt 1 0) (capU2 a) (capU2 b) = Real.sin (b - a) := by
  simp only [signedArea2, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [show b - a = (2 * π / 3 + b) - (2 * π / 3 + a) by ring, Real.sin_sub]
  ring
theorem signedArea2_capU3_eq_sin (a b : ℝ) :
    signedArea2 (pt (1 / 2) (Real.sqrt 3 / 2)) (capU3 a) (capU3 b) = Real.sin (b - a) := by
  simp only [signedArea2, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [show b - a = (4 * π / 3 + b) - (4 * π / 3 + a) by ring, Real.sin_sub]
  ring
theorem b3n9m082_sin_nonpos_of_nonpos_of_neg_pi_le {x : ℝ} (hge : -π ≤ x) (hle : x ≤ 0) :
    Real.sin x ≤ 0 := by
  rw [show x = -(-x) by ring, Real.sin_neg]
  have : 0 ≤ Real.sin (-x) :=
    Real.sin_nonneg_of_nonneg_of_le_pi (by linarith) (by linarith)
  linarith
theorem normSim_capU2_strictMono_of_orient (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i))
    (horient : ∀ i j, i < j → 0 < signedArea2 p₂ (L.points i) (L.points j)) :
    StrictMono γ := by
  intro i j hij
  have hconst : 0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (b3n9m082_normSim_ℓ2_pos hp)
  have hpos : 0 < signedArea2 (normSim p₁ p₂ p₂) (normSim p₁ p₂ (L.points i))
      (normSim p₁ p₂ (L.points j)) := by
    rw [signedArea2_normSim p₁ p₂ hp p₂ (L.points i) (L.points j)]
    exact mul_pos hconst (horient i j hij)
  rw [normSim_snd p₁ p₂ hp, hL i, hL j, signedArea2_capU2_eq_sin] at hpos
  by_contra hcon
  push_neg at hcon
  have hle : γ i - γ j ≤ π := by
    have := (hγmem i).2; have := (hγmem j).1; linarith [Real.pi_pos]
  have hsin : Real.sin (γ j - γ i) ≤ 0 :=
    b3n9m082_sin_nonpos_of_nonpos_of_neg_pi_le (x := γ j - γ i) (by linarith) (by linarith)
  linarith
theorem normSim_capU3_strictAnti_of_orient (p₁ p₂ p₃ : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i))
    (horient : ∀ i j, i < j → signedArea2 p₃ (L.points i) (L.points j) < 0) :
    StrictAnti δ := by
  intro i j hij
  have hconst : 0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (b3n9m082_normSim_ℓ2_pos hp)
  have hneg : signedArea2 (normSim p₁ p₂ p₃) (normSim p₁ p₂ (L.points i))
      (normSim p₁ p₂ (L.points j)) < 0 := by
    rw [signedArea2_normSim p₁ p₂ hp p₃ (L.points i) (L.points j)]
    exact mul_neg_of_pos_of_neg hconst (horient i j hij)
  rw [normSim_thd p₁ p₂ p₃ hp h31 h23 hori, hL i, hL j, signedArea2_capU3_eq_sin] at hneg
  by_contra hcon
  push_neg at hcon
  have hge : 0 ≤ δ j - δ i := by linarith
  have hle : δ j - δ i ≤ π := by
    have := (hδmem j).2; have := (hδmem i).1; linarith [Real.pi_pos]
  have : 0 ≤ Real.sin (δ j - δ i) := Real.sin_nonneg_of_nonneg_of_le_pi hge hle
  linarith
theorem n8a3_normSimChain_capU2_oriented (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i))
    (horient : ∀ i j, i < j → 0 < signedArea2 p₂ (L.points i) (L.points j)) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_normSimChain_capU2 p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord L γ hγmem
    (normSim_capU2_strictMono_of_orient p₁ p₂ hp L γ hγmem hL horient) hL
theorem n8a3_normSimChain_capU3_oriented (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i))
    (horient : ∀ i j, i < j → signedArea2 p₃ (L.points i) (L.points j) < 0) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_normSimChain_capU3 p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord L δ hδmem
    (normSim_capU3_strictAnti_of_orient p₁ p₂ p₃ hp h31 h23 hori L δ hδmem hL horient) hL
end Problem97
end Batch3N9
end Batch3N9Unit082

-- Original module: Solutions.Batch3N9.N8.N8CapCoordNorm
section Batch3N9Unit083
namespace Batch3N9
open Real Set
open scoped EuclideanGeometry
open scoped RealInnerProductSpace
open EuclideanGeometry
open Finset
namespace Problem97
theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = - signedArea2 a c b := by
  simp only [signedArea2]; ring
theorem onArcOpposite_swap (vi vj vk v : ℝ²) :
    OnArcOpposite vi vj vk v ↔ OnArcOpposite vi vk vj v := by
  unfold OnArcOpposite
  rw [signedArea2_swap23 v vk vj, signedArea2_swap23 vi vk vj]
  constructor <;> intro h <;> nlinarith only [h]
theorem signedArea2_ne_zero_of_equilateral
    {v₁ v₂ v₃ : ℝ²} {d : ℝ} (hd : 0 < d)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hp12 : v₁ ≠ v₂) (hp23 : v₂ ≠ v₃) (hp13 : v₁ ≠ v₃) :
    signedArea2 v₁ v₂ v₃ ≠ 0 := by
  intro hz
  have hcol : Collinear ℝ ({v₁, v₂, v₃} : Set ℝ²) :=
    collinear_of_signedArea2_eq_zero v₁ v₂ v₃ hz
  have e21 : dist v₂ v₁ = d := by rw [dist_comm]; exact e12
  have e31 : dist v₃ v₁ = d := by rw [dist_comm]; exact e13
  have e32 : dist v₃ v₂ = d := by rw [dist_comm]; exact e23
  rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
  · have hs : Sbtw ℝ v₁ v₂ v₃ := ⟨hw, hp12.symm, hp23⟩
    have hd' := hs.dist_lt_max_dist v₁
    rw [dist_self, e21, e31, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'
  · have hs : Sbtw ℝ v₂ v₃ v₁ := ⟨hw, hp23.symm, hp13.symm⟩
    have hd' := hs.dist_lt_max_dist v₂
    rw [dist_self, e32, e12, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'
  · have hs : Sbtw ℝ v₃ v₁ v₂ := ⟨hw, hp13, hp12⟩
    have hd' := hs.dist_lt_max_dist v₃
    rw [dist_self, e13, e23, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'
theorem exists_apex_frame
    {v₁ v₂ v₃ x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hp12 : v₁ ≠ v₂) (hp23 : v₂ ≠ v₃) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hx1 : dist v₁ x = d)
    (harc : OnArcOpposite v₁ v₂ v₃ x)
    (hxv2 : x ≠ v₂) (hxv3 : x ≠ v₃) :
    ∃ a₂ a₃ : ℝ²,
      v₁ ≠ a₂ ∧
      dist v₁ a₂ = dist a₃ v₁ ∧ dist v₁ a₂ = dist a₂ a₃ ∧
      0 < signedArea2 v₁ a₂ a₃ ∧
      dist x v₁ = dist v₁ a₂ ∧
      signedArea2 x a₂ a₃ < 0 := by
  have hxv1 : dist x v₁ = d := by rw [dist_comm]; exact hx1
  have e21 : dist v₂ v₁ = d := by rw [dist_comm]; exact e12
  have e31 : dist v₃ v₁ = d := by rw [dist_comm]; exact e13
  have e32 : dist v₃ v₂ = d := by rw [dist_comm]; exact e23
  have hxchord_ne : signedArea2 x v₂ v₃ ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hxv1 e21 e31 hxv2 hp23 hxv3
  have htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0 :=
    signedArea2_ne_zero_of_equilateral hd e12 e13 e23 hp12 hp23 hp13
  have harc' : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harc
  rcases lt_or_gt_of_ne htri_ne with hneg | hpos
  ·
    have hpos_swap : 0 < signedArea2 v₁ v₃ v₂ := by
      rw [signedArea2_swap23 v₁ v₃ v₂]; linarith
    have hxpos : 0 < signedArea2 x v₂ v₃ := by
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exfalso; nlinarith only [harc', hneg, hc]
      · exact hc
    refine ⟨v₃, v₂, hp13, ?_, ?_, hpos_swap, ?_, ?_⟩
    · rw [e13, e21]
    · rw [e13, e32]
    · rw [hxv1, e13]
    · rw [signedArea2_swap23 x v₃ v₂]; linarith
  ·
    have hxneg : signedArea2 x v₂ v₃ < 0 := by
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exact hc
      · exfalso; nlinarith only [harc', hpos, hc]
    refine ⟨v₂, v₃, hp12, ?_, ?_, hpos, ?_, hxneg⟩
    · rw [e12, e31]
    · rw [e12, e23]
    · rw [hxv1, e12]
noncomputable def twoPointChain (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    FiniteEndpoint.OrderedSideChain 2 where
  points := ![w₁, w₂]
  injective := by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all
theorem twoPointChain_support (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    (twoPointChain w₁ w₂ hne).support = ({w₁, w₂} : Finset ℝ²) := by
  ext z
  simp only [FiniteEndpoint.OrderedSideChain.mem_support_iff, twoPointChain, Finset.mem_insert,
    Finset.mem_singleton]
  refine ⟨?_, ?_⟩
  · rintro ⟨i, rfl⟩; fin_cases i <;> simp
  · rintro (rfl | rfl); exacts [⟨0, rfl⟩, ⟨1, rfl⟩]
theorem n8a3_twoPoint_capU2pos {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ} (hne : w₁ ≠ w₂)
    (hp12 : v₁ ≠ v₂)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hpos : 0 < signedArea2 v₁ v₂ v₃)
    (hx1 : dist v₁ x = d) (hxchord : signedArea2 x v₂ v₃ < 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (hw1chord : signedArea2 w₁ v₃ v₁ < 0) (hw2chord : signedArea2 w₂ v₃ v₁ < 0)
    (horient01 : 0 < signedArea2 v₂ w₁ w₂) :
    N8a3AdjacentCapDistanceStrict x (twoPointChain w₁ w₂ hne) := by
  have h31 : dist v₁ v₂ = dist v₃ v₁ := by rw [e12, dist_comm, e13]
  have h23 : dist v₁ v₂ = dist v₂ v₃ := by rw [e12, e23]
  obtain ⟨γ₁, hγ1eq, hγ10, hγ11⟩ :=
    normSim_chainImage_capU2 v₁ v₂ v₃ w₁ hp12 h31 h23 hpos (by rw [hw1d, e12]) hw1chord
  obtain ⟨γ₂, hγ2eq, hγ20, hγ21⟩ :=
    normSim_chainImage_capU2 v₁ v₂ v₃ w₂ hp12 h31 h23 hpos (by rw [hw2d, e12]) hw2chord
  apply n8a3_normSimChain_capU2_oriented v₁ v₂ v₃ x hp12 h31 h23 hpos
    (by rw [dist_comm, hx1, e12]) hxchord (twoPointChain w₁ w₂ hne) ![γ₁, γ₂]
  · intro i; fin_cases i
    · exact ⟨hγ10.le, hγ11.le⟩
    · exact ⟨hγ20.le, hγ21.le⟩
  · intro i; fin_cases i
    · exact hγ1eq
    · exact hγ2eq
  · intro i j hij; fin_cases i <;> fin_cases j <;> simp_all [twoPointChain]
theorem n8a3_twoPoint_capU3neg {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ} (hne : w₁ ≠ w₂)
    (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hneg : signedArea2 v₁ v₂ v₃ < 0)
    (hx1 : dist v₁ x = d) (hxchord3 : signedArea2 x v₃ v₂ < 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (hw1chord3 : signedArea2 w₁ v₁ v₃ < 0) (hw2chord3 : signedArea2 w₂ v₁ v₃ < 0)
    (horient01 : signedArea2 v₂ w₁ w₂ < 0) :
    N8a3AdjacentCapDistanceStrict x (twoPointChain w₁ w₂ hne) := by
  have hposF : 0 < signedArea2 v₁ v₃ v₂ := by rw [signedArea2_swap23 v₁ v₃ v₂]; linarith
  have h31 : dist v₁ v₃ = dist v₂ v₁ := by rw [e13, dist_comm, e12]
  have h23 : dist v₁ v₃ = dist v₃ v₂ := by rw [e13, dist_comm, e23]
  obtain ⟨δ₁, hδ1eq, hδ10, hδ11⟩ :=
    normSim_chainImage_capU3 v₁ v₃ v₂ w₁ hp13 h31 h23 hposF (by rw [hw1d, e13]) hw1chord3
  obtain ⟨δ₂, hδ2eq, hδ20, hδ21⟩ :=
    normSim_chainImage_capU3 v₁ v₃ v₂ w₂ hp13 h31 h23 hposF (by rw [hw2d, e13]) hw2chord3
  apply n8a3_normSimChain_capU3_oriented v₁ v₃ v₂ x hp13 h31 h23 hposF
    (by rw [dist_comm, hx1, e13]) hxchord3 (twoPointChain w₁ w₂ hne) ![δ₁, δ₂]
  · intro i; fin_cases i
    · exact ⟨hδ10.le, hδ11.le⟩
    · exact ⟨hδ20.le, hδ21.le⟩
  · intro i; fin_cases i
    · exact hδ1eq
    · exact hδ2eq
  · intro i j hij; fin_cases i <;> fin_cases j <;> simp_all [twoPointChain]
theorem exists_adjacentMonotoneChain {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ}
    (hne : w₁ ≠ w₂) (hp12 : v₁ ≠ v₂) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0)
    (hx1 : dist v₁ x = d) (harcx : OnArcOpposite v₁ v₂ v₃ x)
    (hxchord_ne : signedArea2 x v₂ v₃ ≠ 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (harcw1 : OnArcOpposite v₂ v₃ v₁ w₁) (harcw2 : OnArcOpposite v₂ v₃ v₁ w₂)
    (hw1cn : signedArea2 w₁ v₃ v₁ ≠ 0) (hw2cn : signedArea2 w₂ v₃ v₁ ≠ 0)
    (horient_ne : signedArea2 v₂ w₁ w₂ ≠ 0) :
    ∃ (chain : FiniteEndpoint.OrderedSideChain 2),
      chain.support = ({w₁, w₂} : Finset ℝ²) ∧ N8a3AdjacentCapDistanceStrict x chain := by
  have hcyc : signedArea2 v₂ v₃ v₁ = signedArea2 v₁ v₂ v₃ := by simp only [signedArea2]; ring
  rcases lt_or_gt_of_ne htri_ne with hneg | hpos
  ·
    have hxchord3 : signedArea2 x v₃ v₂ < 0 := by
      have hprod : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harcx
      have hxpos : 0 < signedArea2 x v₂ v₃ := by
        rcases lt_or_gt_of_ne hxchord_ne with hc | hc
        · exfalso; nlinarith only [hprod, hneg, hc]
        · exact hc
      rw [signedArea2_swap23 x v₃ v₂]; linarith
    have hw1c3 : signedArea2 w₁ v₁ v₃ < 0 := by
      have hprod : signedArea2 w₁ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw1
      rw [hcyc] at hprod
      have : 0 < signedArea2 w₁ v₃ v₁ := by
        rcases lt_or_gt_of_ne hw1cn with hc | hc
        · exfalso; nlinarith only [hprod, hneg, hc]
        · exact hc
      rw [signedArea2_swap23 w₁ v₁ v₃]; linarith
    have hw2c3 : signedArea2 w₂ v₁ v₃ < 0 := by
      have hprod : signedArea2 w₂ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw2
      rw [hcyc] at hprod
      have : 0 < signedArea2 w₂ v₃ v₁ := by
        rcases lt_or_gt_of_ne hw2cn with hc | hc
        · exfalso; nlinarith only [hprod, hneg, hc]
        · exact hc
      rw [signedArea2_swap23 w₂ v₁ v₃]; linarith
    rcases lt_or_gt_of_ne horient_ne with hwlt | hwgt
    · exact ⟨twoPointChain w₁ w₂ hne, twoPointChain_support w₁ w₂ hne,
        n8a3_twoPoint_capU3neg hne hp13 e12 e13 e23 hneg hx1 hxchord3 hw1d hw2d hw1c3 hw2c3 hwlt⟩
    · have hswap : signedArea2 v₂ w₂ w₁ < 0 := by
        rw [signedArea2_swap23 v₂ w₂ w₁]; linarith
      refine ⟨twoPointChain w₂ w₁ hne.symm, ?_, ?_⟩
      · rw [twoPointChain_support, Finset.pair_comm]
      · exact @n8a3_twoPoint_capU3neg v₁ v₂ v₃ x w₂ w₁ d hne.symm hp13 e12 e13 e23 hneg
          hx1 hxchord3 hw2d hw1d hw2c3 hw1c3 hswap
  ·
    have hxchord : signedArea2 x v₂ v₃ < 0 := by
      have hprod : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harcx
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exact hc
      · exfalso; nlinarith only [hprod, hpos, hc]
    have hposcyc : 0 < signedArea2 v₂ v₃ v₁ := by rw [hcyc]; exact hpos
    have hw1c : signedArea2 w₁ v₃ v₁ < 0 := by
      have hprod : signedArea2 w₁ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw1
      rcases lt_or_gt_of_ne hw1cn with hc | hc
      · exact hc
      · exfalso; nlinarith only [hprod, hcyc, hc, hpos]
    have hw2c : signedArea2 w₂ v₃ v₁ < 0 := by
      have hprod : signedArea2 w₂ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw2
      rcases lt_or_gt_of_ne hw2cn with hc | hc
      · exact hc
      · exfalso; nlinarith only [hprod, hcyc, hc, hpos]
    rcases lt_or_gt_of_ne horient_ne with hwlt | hwgt
    · have hswap : 0 < signedArea2 v₂ w₂ w₁ := by
        rw [signedArea2_swap23 v₂ w₂ w₁]; linarith
      refine ⟨twoPointChain w₂ w₁ hne.symm, ?_, ?_⟩
      · rw [twoPointChain_support, Finset.pair_comm]
      · exact @n8a3_twoPoint_capU2pos v₁ v₂ v₃ x w₂ w₁ d hne.symm hp12 e12 e13 e23 hpos
          hx1 hxchord hw2d hw1d hw2c hw1c hswap
    · exact ⟨twoPointChain w₁ w₂ hne, twoPointChain_support w₁ w₂ hne,
        n8a3_twoPoint_capU2pos hne hp12 e12 e13 e23 hpos hx1 hxchord hw1d hw2d hw1c hw2c hwgt⟩
theorem build_adjacentArcWitness {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d r : ℝ}
    (hne : w₁ ≠ w₂) (hp12 : v₁ ≠ v₂) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0)
    (hx1 : dist v₁ x = d) (harcx : OnArcOpposite v₁ v₂ v₃ x)
    (hxv2 : x ≠ v₂)
    (hxchord_ne : signedArea2 x v₂ v₃ ≠ 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (harcw1 : OnArcOpposite v₂ v₃ v₁ w₁) (harcw2 : OnArcOpposite v₂ v₃ v₁ w₂)
    (hw1cn : signedArea2 w₁ v₃ v₁ ≠ 0) (hw2cn : signedArea2 w₂ v₃ v₁ ≠ 0)
    (horient_ne : signedArea2 v₂ w₁ w₂ ≠ 0)
    (capPts : Finset ℝ²) (hcap : capPts = ({w₁, w₂} : Finset ℝ²))
    (hcapdist : ∀ z ∈ capPts, dist v₂ z = d) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧ W.base.arc.support = capPts := by
  obtain ⟨chain, hchainsupp, hmono⟩ :=
    exists_adjacentMonotoneChain hne hp12 hp13 e12 e13 e23 htri_ne hx1 harcx hxchord_ne
      hw1d hw2d harcw1 harcw2 hw1cn hw2cn horient_ne
  let arc : N8ArcCircle :=
    { support := capPts, circleCenter := v₂, circleRadius := d, on_circle := hcapdist }
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨arc.circleCenter, arc.circleRadius⟩ := by
    intro h; exact hxv2 (congrArg EuclideanGeometry.Sphere.center h)
  have hcovers : arc.support ⊆ chain.support := by
    change capPts ⊆ chain.support; rw [hchainsupp, hcap]
  exact ⟨{ base := { apex := x, selectedRadius := r, arc := arc, circles_ne := hcircles_ne }
           m := 2, chain := chain, chain_covers := hcovers, monotone := hmono }, rfl, rfl, rfl⟩
theorem no_equidistant_apex_at_side
    (a b c x : ℝ²) (D : ℝ) (hD : 0 < D)
    (hab : dist a b = D) (hbc : dist b c = D) (hca : dist c a = D)
    (hxa : dist x a = D) (hxb : dist x b = D) (hxc : dist x c = D) : False := by
  set u := a - x with hu
  set v := b - x with hv
  set w := c - x with hw
  have nu : ‖u‖ = D := by rw [hu, ← dist_eq_norm, dist_comm]; exact hxa
  have nv : ‖v‖ = D := by rw [hv, ← dist_eq_norm, dist_comm]; exact hxb
  have nw : ‖w‖ = D := by rw [hw, ← dist_eq_norm, dist_comm]; exact hxc
  have iuv : ⟪u, v⟫ = D ^ 2 / 2 := by
    have h1 : ‖u - v‖ = D := by
      have huv : u - v = a - b := by rw [hu, hv]; abel
      rw [huv, ← dist_eq_norm]; exact hab
    have e := norm_sub_sq_real u v; rw [h1, nu, nv] at e; nlinarith only [e]
  have ivw : ⟪v, w⟫ = D ^ 2 / 2 := by
    have h1 : ‖v - w‖ = D := by
      have hvw : v - w = b - c := by rw [hv, hw]; abel
      rw [hvw, ← dist_eq_norm]; exact hbc
    have e := norm_sub_sq_real v w; rw [h1, nv, nw] at e; nlinarith only [e]
  have iuw : ⟪u, w⟫ = D ^ 2 / 2 := by
    have h1 : ‖u - w‖ = D := by
      have huw : u - w = a - c := by rw [hu, hw]; abel
      rw [huw, ← dist_eq_norm, dist_comm]; exact hca
    have e := norm_sub_sq_real u w; rw [h1, nu, nw] at e; nlinarith only [e]
  have iuu : ⟪u, u⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nu]
  have ivv : ⟪v, v⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nv]
  have iww : ⟪w, w⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nw]
  have hLI : LinearIndependent ℝ ![u, v, w] := by
    rw [Fintype.linearIndependent_iff]
    intro g hg
    have hsum : g 0 • u + g 1 • v + g 2 • w = 0 := by
      have hg' := hg; simp [Fin.sum_univ_three] at hg'
      convert hg' using 2
    have eu : g 0 * ⟪u, u⟫ + g 1 * ⟪u, v⟫ + g 2 * ⟪u, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪u, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    have ev : g 0 * ⟪v, u⟫ + g 1 * ⟪v, v⟫ + g 2 * ⟪v, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪v, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    have ew : g 0 * ⟪w, u⟫ + g 1 * ⟪w, v⟫ + g 2 * ⟪w, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪w, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    rw [real_inner_comm u v, iuv, ivv, ivw] at ev
    rw [real_inner_comm u w, real_inner_comm v w, iuw, ivw, iww] at ew
    rw [iuu, iuv, iuw] at eu
    have hD2 : (0 : ℝ) < D ^ 2 := by positivity
    have hsum : (g 0 + g 1 + g 2) * (2 * D ^ 2) = 0 := by linear_combination eu + ev + ew
    have hs : g 0 + g 1 + g 2 = 0 := by
      rcases mul_eq_zero.mp hsum with h | h
      · exact h
      · exfalso; linarith
    have h0 : g 0 * D ^ 2 = 0 := by linear_combination 2 * eu - D ^ 2 * hs
    have h1 : g 1 * D ^ 2 = 0 := by linear_combination 2 * ev - D ^ 2 * hs
    have h2 : g 2 * D ^ 2 = 0 := by linear_combination 2 * ew - D ^ 2 * hs
    intro i; fin_cases i
    · exact (mul_eq_zero.mp h0).resolve_right (by linarith)
    · exact (mul_eq_zero.mp h1).resolve_right (by linarith)
    · exact (mul_eq_zero.mp h2).resolve_right (by linarith)
  have hcard := hLI.fintype_card_le_finrank
  simp [finrank_euclideanSpace] at hcard
namespace FiniteEndpointShell
theorem exists_apexFrameData
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) :
    ∃ v₁ v₂ v₃ : ℝ²,
      v₁ ≠ v₂ ∧
      dist v₁ v₂ = dist v₃ v₁ ∧ dist v₁ v₂ = dist v₂ v₃ ∧
      0 < signedArea2 v₁ v₂ v₃ ∧
      dist x v₁ = dist v₁ v₂ ∧
      signedArea2 x v₂ v₃ < 0 := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  fin_cases i
  ·
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I1 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harc : OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
      ((S.CP.arc_membership x hxA).1).mp hxC
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp12 hp23 hp13 e12 e13 e23 hx1 harc hxv2 hxv3
    exact ⟨S.triangle.v1, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩
  ·
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I2 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harc : OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp23 hp13.symm hp12.symm e23
        (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13) hx1 harc hxv3 hxv1
    exact ⟨S.triangle.v2, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩
  ·
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I3 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harc : OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp13.symm hp12 hp23.symm
        (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12 hx1 harc hxv1 hxv2
    exact ⟨S.triangle.v3, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩
theorem build_shell_adjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} (hdpos : 0 < d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hxA : x ∈ A) (hxb : x ≠ vb) (hxc : x ≠ vc)
    (harcx : OnArcOpposite va vb vc x) (hx1 : dist va x = d)
    (Iadj : Finset ℝ²) (hadjcard : Iadj.card = 2) (hadjsub : Iadj ⊆ A)
    (hunpack : ∀ w ∈ Iadj, w ≠ vc ∧ w ≠ va ∧ OnArcOpposite vb vc va w ∧ dist vb w = d) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧ W.base.arc.support = Iadj := by
  classical
  have htri_ne : signedArea2 va vb vc ≠ 0 :=
    signedArea2_ne_zero_of_equilateral hdpos eab eac ebc hab hbc hac
  have hncoll : ∀ {a b c : ℝ²}, a ∈ A → b ∈ A → c ∈ A → a ≠ b → a ≠ c → b ≠ c →
      signedArea2 a b c ≠ 0 := by
    intro a b c ha hb hc hab' hac' hbc' hz
    exact ConvexIndep.not_three_collinear S.hconv ha hb hc hab' hac' hbc'
      (collinear_of_signedArea2_eq_zero a b c hz)
  have hxchord_ne : signedArea2 x vb vc ≠ 0 := hncoll hxA hbA hcA hxb hxc hbc
  obtain ⟨w₁, w₂, hw12ne, hIeq⟩ := Finset.card_eq_two.mp hadjcard
  have hw1mem : w₁ ∈ Iadj := by rw [hIeq]; simp
  have hw2mem : w₂ ∈ Iadj := by rw [hIeq]; simp
  obtain ⟨hw1c, hw1a, harcw1, hw1d⟩ := hunpack w₁ hw1mem
  obtain ⟨hw2c, hw2a, harcw2, hw2d⟩ := hunpack w₂ hw2mem
  have hw1A : w₁ ∈ A := hadjsub hw1mem
  have hw2A : w₂ ∈ A := hadjsub hw2mem
  have hw1cn : signedArea2 w₁ vc va ≠ 0 := hncoll hw1A hcA haA hw1c hw1a hac.symm
  have hw2cn : signedArea2 w₂ vc va ≠ 0 := hncoll hw2A hcA haA hw2c hw2a hac.symm
  have hv_b_w1 : vb ≠ w₁ := by intro h; rw [← h, dist_self] at hw1d; linarith
  have hv_b_w2 : vb ≠ w₂ := by intro h; rw [← h, dist_self] at hw2d; linarith
  have horient_ne : signedArea2 vb w₁ w₂ ≠ 0 := hncoll hbA hw1A hw2A hv_b_w1 hv_b_w2 hw12ne
  refine build_adjacentArcWitness (r := r) hw12ne hab hac eab eac ebc htri_ne hx1 harcx hxb
    hxchord_ne (by rw [dist_comm]; exact hw1d) (by rw [dist_comm]; exact hw2d)
    harcw1 harcw2 hw1cn hw2cn horient_ne Iadj hIeq ?_
  intro z hz
  exact (hunpack z hz).2.2.2
theorem exists_leftAdjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i)
    (r : ℝ) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧
        W.base.arc.support = S.leftAdjacentInteriorByIndex i := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hcards := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  fin_cases i
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harcx : OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
      ((S.CP.arc_membership x hxA).1).mp hxC
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I2
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp12 hp13 hp23 hv1A hv2A hv3A
      e12 e13 e23 hxA hxv2 hxv3 harcx hx1 S.I2 hcards.2.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C2_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv1, hwv3, hwC2⟩ := hw
      exact ⟨hwv3, hwv1, ((S.CP.arc_membership w (S.CP.C2_subset hwC2)).2.1).mp hwC2, hC2 _ hwC2⟩
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harcx : OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I3
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp23 hp12.symm hp13.symm hv2A hv3A hv1A
      e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
      hxA hxv3 hxv1 harcx hx1 S.I3 hcards.2.2.2.2.2 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C3_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv2, hwv1, hwC3⟩ := hw
      exact ⟨hwv1, hwv2, ((S.CP.arc_membership w (S.CP.C3_subset hwC3)).2.2).mp hwC3, hC3 _ hwC3⟩
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harcx : OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I1
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp13.symm hp23.symm hp12 hv3A hv1A hv2A
      (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
      hxA hxv1 hxv2 harcx hx1 S.I1 hcards.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C1_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv3, hwv2, hwC1⟩ := hw
      exact ⟨hwv2, hwv3, ((S.CP.arc_membership w (S.CP.C1_subset hwC1)).1).mp hwC1, hC1 _ hwC1⟩
theorem exists_rightAdjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i)
    (r : ℝ) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧
        W.base.arc.support = S.rightAdjacentInteriorByIndex i := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hcards := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  fin_cases i
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harcx : OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).1).mp hxC)
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I3
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp13 hp12 hp23.symm hv1A hv3A hv2A
      e13 e12 (by rw [dist_comm]; exact e23) hxA hxv3 hxv2 harcx hx1 S.I3 hcards.2.2.2.2.2 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C3_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv2, hwv1, hwC3⟩ := hw
      exact ⟨hwv2, hwv1,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C3_subset hwC3)).2.2).mp hwC3),
        hC3 _ hwC3⟩
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harcx : OnArcOpposite S.triangle.v2 S.triangle.v1 S.triangle.v3 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).2.1).mp hxC)
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I1
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp12.symm hp23 hp13 hv2A hv1A hv3A
      (by rw [dist_comm]; exact e12) e23 e13
      hxA hxv1 hxv3 harcx hx1 S.I1 hcards.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C1_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv3, hwv2, hwC1⟩ := hw
      exact ⟨hwv3, hwv2,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C1_subset hwC1)).1).mp hwC1),
        hC1 _ hwC1⟩
  ·
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harcx : OnArcOpposite S.triangle.v3 S.triangle.v2 S.triangle.v1 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).2.2).mp hxC)
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I2
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp23.symm hp13.symm hp12.symm hv3A hv2A hv1A
      (by rw [dist_comm]; exact e23) (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e12)
      hxA hxv2 hxv1 harcx hx1 S.I2 hcards.2.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C2_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv1, hwv3, hwC2⟩ := hw
      exact ⟨hwv1, hwv3,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C2_subset hwC2)).2.1).mp hwC2),
        hC2 _ hwC2⟩
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit083

-- Original module: Solutions.Batch3N9.N8.N8kDistribution
section Batch3N9Unit084
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open EuclideanGeometry
open Finset
namespace Problem97
lemma b3n9m084_angular_prop_dist (x v2 v3 o : ℝ²)
    (hdist_xv2v3 : dist x v2 = dist x v3)
    (hdist_v2v3o : dist v2 v3 = dist v2 o)
    (hdist_xo : dist x o = dist x v3)
    (hsa : signedArea2 o x v2 = -signedArea2 x v2 v3) :
    dist x v2 ^ 2 * signedArea2 o v2 v3 = dist v2 v3 ^ 2 * signedArea2 x v2 v3 := by
  have dist_sq : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 :=
    Problem97.dist_sq_coord
  have h1 : (x 0 - v2 0) ^ 2 + (x 1 - v2 1) ^ 2 =
            (x 0 - v3 0) ^ 2 + (x 1 - v3 1) ^ 2 := by
    have := dist_sq x v2 ▸ dist_sq x v3 ▸ (congr_arg (· ^ 2) hdist_xv2v3); linarith
  have h2 : (v2 0 - v3 0) ^ 2 + (v2 1 - v3 1) ^ 2 =
            (v2 0 - o 0) ^ 2 + (v2 1 - o 1) ^ 2 := by
    have := dist_sq v2 v3 ▸ dist_sq v2 o ▸ (congr_arg (· ^ 2) hdist_v2v3o); linarith
  have h3 : (x 0 - o 0) ^ 2 + (x 1 - o 1) ^ 2 =
            (x 0 - v3 0) ^ 2 + (x 1 - v3 1) ^ 2 := by
    have := dist_sq x o ▸ dist_sq x v3 ▸ (congr_arg (· ^ 2) hdist_xo); linarith
  simp only [signedArea2] at *
  rw [dist_sq x v2, dist_sq v2 v3]
  linear_combination
    ((v2 0 - o 0) * (x 1 - o 1) - (v2 1 - o 1) * (x 0 - o 0)) * h1 +
    (-(v2 0 - o 0) * (v3 1 - o 1) + 3/2 * (v2 0 - o 0) * (x 1 - o 1) +
     (v2 1 - o 1) * (v3 0 - o 0) - 3/2 * (v2 1 - o 1) * (x 0 - o 0) -
     (v3 0 - o 0) * (x 1 - o 1) + (v3 1 - o 1) * (x 0 - o 0)) * h2 +
    (-1/2 * (v2 0 - o 0) * (x 1 - o 1) + 1/2 * (v2 1 - o 1) * (x 0 - o 0)) * h3 +
    (-(v2 0 - o 0) * (x 0 - o 0) - (v2 1 - o 1) * (x 1 - o 1)) * hsa
set_option maxRecDepth 4000 in
lemma b3n9m084_rc_refl_closed (x a e : ℝ²) :
    EuclideanGeometry.reflection (affineSpan ℝ ({x, a} : Set ℝ²)) e =
      ((2:ℝ) • ((Submodule.span ℝ ({x - a} : Set ℝ²)).starProjection (e - x)) - (e - x)) + x := by
  have hx_mem : x ∈ affineSpan ℝ ({x, a} : Set ℝ²) := left_mem_affineSpan_pair ..
  have hdir : (affineSpan ℝ ({x, a} : Set ℝ²)).direction
      = Submodule.span ℝ ({x - a} : Set ℝ²) := by
    rw [direction_affineSpan, vectorSpan_pair]; rfl
  rw [EuclideanGeometry.reflection_apply_of_mem _ e hx_mem, Submodule.reflection_apply]
  simp only [hdir, vsub_eq_sub, vadd_eq_add]; module
set_option maxRecDepth 4000 in
lemma b3n9m084_rc_o_coord (x a e : ℝ²) (i : Fin 2) :
    (EuclideanGeometry.reflection (affineSpan ℝ ({x, a} : Set ℝ²)) e) i
      = (2:ℝ) * ((inner ℝ (x - a) (e - x)) / (‖x - a‖^2)) * ((x - a) i)
        - (e - x) i + x i := by
  rw [b3n9m084_rc_refl_closed, Submodule.starProjection_singleton]
  simp only [PiLp.add_apply, PiLp.sub_apply, PiLp.smul_apply, smul_eq_mul,
    RCLike.ofReal_real_eq_id, id_eq]
  ring
lemma b3n9m084_rc_inner_coord (u v : ℝ²) : (inner ℝ u v) = u 0 * v 0 + u 1 * v 1 := by
  rw [EuclideanSpace.inner_eq_star_dotProduct]
  simp [dotProduct, Fin.sum_univ_two, mul_comm]
lemma b3n9m084_rc_nsq_coord (u : ℝ²) : ‖u‖^2 = (u 0)^2 + (u 1)^2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (by positivity)]
  simp [Fin.sum_univ_two]
set_option maxRecDepth 4000 in
lemma b3n9m084_signedArea2_reflection_chord (x c e w : ℝ²) :
    signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
      * dist x c ^ 2
      = 2 * signedArea2 x c e * ⟪c - x, e - w⟫_ℝ := by
  rcases eq_or_ne x c with rfl | hxc
  · simp [signedArea2, dist_self, sub_self, inner_zero_left, mul_zero]
  · rw [dist_eq_norm]
    have hden : (x 0 - c 0)^2 + (x 1 - c 1)^2 ≠ 0 := by
      intro hz; apply hxc
      have h0 : x 0 - c 0 = 0 := by nlinarith only [hz, sq_nonneg (x 0 - c 0), sq_nonneg (x 1 - c 1)]
      have h1 : x 1 - c 1 = 0 := by nlinarith only [hz, sq_nonneg (x 0 - c 0), sq_nonneg (x 1 - c 1)]
      ext j; fin_cases j <;> simp_all <;> linarith
    have e0 : (x - c) 0 = x 0 - c 0 := by simp
    have e1 : (x - c) 1 = x 1 - c 1 := by simp
    have e2 : (e - x) 0 = e 0 - x 0 := by simp
    have e3 : (e - x) 1 = e 1 - x 1 := by simp
    have e4 : (c - x) 0 = c 0 - x 0 := by simp
    have e5 : (c - x) 1 = c 1 - x 1 := by simp
    have e6 : (e - w) 0 = e 0 - w 0 := by simp
    have e7 : (e - w) 1 = e 1 - w 1 := by simp
    unfold signedArea2
    rw [show (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) 0 = _
          from b3n9m084_rc_o_coord x c e 0,
        show (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) 1 = _
          from b3n9m084_rc_o_coord x c e 1,
        b3n9m084_rc_inner_coord (x - c) (e - x), b3n9m084_rc_inner_coord (c - x) (e - w), b3n9m084_rc_nsq_coord (x - c),
        e0, e1, e2, e3, e4, e5, e6, e7]
    field_simp
    ring
lemma b3n9m084_dist_apex_chord_endpoint_lt
    {va vb vc x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hxa : dist va x = d) (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hbc : vb ≠ vc) (hxc : x ≠ vc)
    (harc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0) :
    dist x vb < d := by
  have nrm : ∀ p q : ℝ², ‖p - q‖ = dist p q := fun p q => by rw [dist_eq_norm]
  have hxan : ‖x - va‖ ^ 2 = ‖vb - va‖ ^ 2 := by
    rw [nrm, nrm, dist_comm x va, hxa, dist_comm vb va, eab]
  have hbcn : ‖vb - va‖ ^ 2 = ‖vc - va‖ ^ 2 := by
    rw [nrm, nrm, dist_comm vb va, eab, dist_comm vc va, eac]
  have hoff := inner_chord_eq_two_mul_inner_midpoint_off_sphere vb vc x va hbcn
  have hbr := inner_midpoint_eq_signedArea_prod_of_chord_sphere vb vc x va hbcn
  have hSqpos : 0 < ‖vc - vb‖ ^ 2 := by
    have : vc - vb ≠ 0 := sub_ne_zero.mpr (Ne.symm hbc); positivity
  have hrhs : signedArea2 va vb vc * signedArea2 x vb vc ≤ 0 := by rw [mul_comm]; exact harc
  have hinner_le : ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ ≤ 0 := by
    have hh : ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ * ‖vc - vb‖ ^ 2 ≤ 0 := by
      rw [hbr]; exact hrhs
    exact nonpos_of_mul_nonpos_left hh hSqpos
  have hcomm : ⟪midpoint ℝ vb vc - va, midpoint ℝ vb vc - x⟫_ℝ
      = ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ := real_inner_comm _ _
  have hcorr : ‖x - va‖ ^ 2 - ‖vb - va‖ ^ 2 = 0 := by rw [hxan]; ring
  have hthales : ⟪vb - x, vc - x⟫_ℝ ≤ 0 := by rw [hoff, hcomm]; linarith [hinner_le, hcorr]
  have hexp : ‖vb - vc‖ ^ 2 = ‖vb - x‖ ^ 2 + ‖vc - x‖ ^ 2 - 2 * ⟪vb - x, vc - x⟫_ℝ := by
    have h : vb - vc = (vb - x) - (vc - x) := by abel
    rw [h, @norm_sub_sq_real]; ring
  have hvcx_pos : 0 < ‖vc - x‖ ^ 2 := by
    have : vc - x ≠ 0 := sub_ne_zero.mpr (Ne.symm hxc); positivity
  have hdbc : ‖vb - vc‖ = d := by rw [nrm]; exact ebc
  have hlt : ‖vb - x‖ ^ 2 < d ^ 2 := by rw [← hdbc, hexp]; nlinarith only [hxan, hoff, hinner_le, hcomm, hvcx_pos, hthales]
  have hdist : dist x vb = ‖vb - x‖ := by rw [dist_eq_norm, norm_sub_rev]
  rw [hdist]
  nlinarith only [hd, hlt, norm_nonneg (vb - x), sq_nonneg (‖vb - x‖ - d), sq_nonneg (‖vb - x‖ + d)]
lemma b3n9m084_sameSide_prod_pos_apexVertex
    {va vb vc x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hxa : dist va x = d) (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb)
    (hxc_lt : dist x vc < d) :
    0 < signedArea2 x vb va * signedArea2 vb va vc := by
  have ds : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 :=
    Problem97.dist_sq_coord
  have hmid : ∀ i : Fin 2, (midpoint ℝ vb va) i = ((vb i + va i) / 2 : ℝ) := by
    intro i; rw [midpoint_eq_smul_add]; simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]; ring
  have hIexp : ⟪midpoint ℝ vb va - x, midpoint ℝ vb va - vc⟫_ℝ
      = ((vb 0 + va 0) / 2 - x 0) * ((vb 0 + va 0) / 2 - vc 0)
        + ((vb 1 + va 1) / 2 - x 1) * ((vb 1 + va 1) / 2 - vc 1) := by
    rw [@PiLp.inner_apply]; simp only [Fin.sum_univ_two, RCLike.inner_apply, conj_trivial,
      PiLp.sub_apply, hmid]; ring
  have hxc_lt' : dist x vc ^ 2 < d ^ 2 := by
    have h0 : 0 ≤ dist x vc := dist_nonneg
    nlinarith only [hd, hxc_lt, h0]
  have hI : 0 < ⟪midpoint ℝ vb va - x, midpoint ℝ vb va - vc⟫_ℝ := by
    rw [hIexp]
    have h2 := ds va vb; have h3 := ds va vc; have h4 := ds vb vc
    rw [eab] at h2; rw [eac] at h3; rw [ebc] at h4
    have hgx : (x 0 - va 0) ^ 2 + (x 1 - va 1) ^ 2 = d ^ 2 := by rw [← ds x va, dist_comm, hxa]
    have hL3'' : 0 < ((x 0 - va 0) ^ 2 + (x 1 - va 1) ^ 2) - ((x 0 - vc 0) ^ 2 + (x 1 - vc 1) ^ 2) := by
      rw [hgx, ← ds x vc]; linarith [hxc_lt']
    nlinarith only [h2, h3, h4, hgx, hL3'', hd, sq_nonneg (x 0 - vc 0), sq_nonneg (x 1 - vc 1), sq_nonneg (x 0 - vb 0), sq_nonneg (x 1 - vb 1)]

  have heq : ‖vb - vc‖ = ‖va - vc‖ := by
    rw [← dist_eq_norm, ← dist_eq_norm, show dist vb vc = d from ebc,
        show dist va vc = d from eac]
  have hlib := signedArea_prod_pos_of_inner_midpoint_pos heq hab hI
  have hcyc : signedArea2 vc vb va = signedArea2 vb va vc := by simp only [signedArea2]; ring
  rw [hcyc] at hlib; exact hlib
lemma b3n9m084_reflected_chord_prod_pos
    {x c e w : ℝ²} (hxc : x ≠ c)
    (hT : 0 < signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w) :
    0 < signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
          * signedArea2 c e w := by
  have hdxc2 : 0 < dist x c ^ 2 := by have := dist_pos.mpr hxc; positivity
  have hbridge := b3n9m084_signedArea2_reflection_chord x c e w
  have hprod : signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
        * signedArea2 c e w * dist x c ^ 2
      = 2 * (signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w) := by
    linear_combination signedArea2 c e w * hbridge
  nlinarith only [hT, hprod, hdxc2]
lemma b3n9m084_inner_chord_eq_dist_diff (x c e w : ℝ²) :
    2 * ⟪c - x, e - w⟫_ℝ
      = (dist c w ^ 2 - dist c e ^ 2) + (dist x e ^ 2 - dist x w ^ 2) := by
  have ds : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 :=
    Problem97.dist_sq_coord
  have hInner : ⟪c - x, e - w⟫_ℝ
      = (c 0 - x 0) * (e 0 - w 0) + (c 1 - x 1) * (e 1 - w 1) := by
    rw [@PiLp.inner_apply]; simp [Fin.sum_univ_two, RCLike.inner_apply, mul_comm]
  rw [hInner, ds c w, ds c e, ds x e, ds x w]; ring
lemma b3n9m084_m1_adjacent_empty
    {A : Finset ℝ²} {x c e o : ℝ²} {r d : ℝ}
    {Iadj : Finset ℝ²}
    (hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨c, d⟩)
    (heo : e ≠ o)
    (hex : dist x e = r) (heC : dist c e = d)
    (hox : dist x o = r) (hoC : dist c o = d)
    (hIcirc : ∀ z ∈ Iadj, dist c z = d)
    (heI : e ∉ Iadj) (hoI : o ∉ Iadj) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  by_contra hcard0
  obtain ⟨w, hw⟩ := Finset.card_pos.mp (Nat.pos_of_ne_zero hcard0)
  have hwsel : w ∈ SelectedClass A x r := Finset.mem_of_mem_inter_left hw
  have hwI : w ∈ Iadj := Finset.mem_of_mem_inter_right hw
  have hwx : dist w x = r := dist_self_of_mem_selectedClass hwsel
  have hwC : dist c w = d := hIcirc w hwI
  set s₁ : Sphere ℝ² := ⟨x, r⟩ with hs1
  set s₂ : Sphere ℝ² := ⟨c, d⟩ with hs2
  have hes1 : e ∈ s₁ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hex)
  have hos1 : o ∈ s₁ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hox)
  have hes2 : e ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact heC)
  have hos2 : o ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hoC)
  have hws1 : w ∈ s₁ := EuclideanGeometry.mem_sphere.mpr hwx
  have hws2 : w ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hwC)
  rcases two_circle_common_point_eq_endpoint hcircles_ne heo hes1 hos1 hes2 hos2 hws1 hws2 with h | h
  · rw [h] at hwI; exact heI hwI
  · rw [h] at hwI; exact hoI hwI
lemma b3n9m084_m1_kill_targeted
    {A : Finset ℝ²} {x c e w : ℝ²} {r d : ℝ} {Iadj : Finset ℝ²}
    (hxc : x ≠ c)
    (hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨c, d⟩)
    (hxe : dist x e = r) (hce : dist c e = d)
    (hIcirc : ∀ z ∈ Iadj, dist c z = d)
    (heI : e ∉ Iadj)
    (hcap : ∀ z ∈ Iadj, signedArea2 z e w * signedArea2 c e w ≤ 0)
    (hT : 0 < signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w)
    (hline : e ∉ affineSpan ℝ ({x, c} : Set ℝ²)) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  set sline : AffineSubspace ℝ ℝ² := affineSpan ℝ ({x, c} : Set ℝ²) with hsline
  have hxs : x ∈ sline := by rw [hsline]; exact subset_affineSpan _ _ (by simp)
  have hcs : c ∈ sline := by rw [hsline]; exact subset_affineSpan _ _ (by simp)
  haveI : Nonempty sline := ⟨⟨x, hxs⟩⟩
  set o := EuclideanGeometry.reflection sline e with ho
  have hox : dist x o = r := (EuclideanGeometry.dist_reflection_eq_of_mem sline hxs e).trans hxe
  have hoC : dist c o = d := (EuclideanGeometry.dist_reflection_eq_of_mem sline hcs e).trans hce
  have heo : e ≠ o := by
    intro h
    have hself : EuclideanGeometry.reflection sline e = e := h.symm
    rw [EuclideanGeometry.reflection_eq_self_iff] at hself
    exact hline hself
  have hcapside : 0 < signedArea2 o e w * signedArea2 c e w :=
    b3n9m084_reflected_chord_prod_pos hxc hT
  have hoI : o ∉ Iadj := by
    intro hmem
    have := hcap o hmem
    linarith [hcapside, this]
  exact b3n9m084_m1_adjacent_empty hcircles_ne heo hxe hce hox hoC hIcirc heI hoI
namespace FiniteEndpointShell
noncomputable def moserCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.triangle.verts).card
noncomputable def sameCapCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card
noncomputable def leftAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card
noncomputable def rightAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card
theorem apexFrame_moserCount_le_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) (r : ℝ) :
    S.moserCount x r ≤ 2 := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have e31 : dist S.triangle.v3 S.triangle.v1 = d := by rw [dist_comm]; exact e13
  by_contra hgt
  push_neg at hgt
  have hm3 : S.moserCount x r = 3 := by
    have hle : S.moserCount x r ≤ 3 := by
      simp only [moserCount]
      calc (SelectedClass A x r ∩ S.triangle.verts).card
          ≤ S.triangle.verts.card := Finset.card_le_card Finset.inter_subset_right
        _ = 3 := S.triangle.verts_card
    omega
  have hsub : S.triangle.verts ⊆ SelectedClass A x r := by
    have hinter : (SelectedClass A x r ∩ S.triangle.verts) = S.triangle.verts := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
      rw [S.triangle.verts_card]; rw [← hm3]; rfl
    intro y hy
    have hmem : y ∈ SelectedClass A x r ∩ S.triangle.verts := by rw [hinter]; exact hy
    exact Finset.mem_of_mem_inter_left hmem
  have hv1 : S.triangle.v1 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv2 : S.triangle.v2 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv3 : S.triangle.v3 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have dx1 : dist x S.triangle.v1 = r := (mem_selectedClass.mp (hsub hv1)).2
  have dx2 : dist x S.triangle.v2 = r := (mem_selectedClass.mp (hsub hv2)).2
  have dx3 : dist x S.triangle.v3 = r := (mem_selectedClass.mp (hsub hv3)).2
  have hrd : r = d := by
    fin_cases i
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
      have hd1 : dist S.triangle.v1 x = d := hC1 _ hx.2.2
      rw [← dx1, dist_comm]; exact hd1
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
      have hd2 : dist S.triangle.v2 x = d := hC2 _ hx.2.2
      rw [← dx2, dist_comm]; exact hd2
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
      have hd3 : dist S.triangle.v3 x = d := hC3 _ hx.2.2
      rw [← dx3, dist_comm]; exact hd3
  subst hrd
  exact no_equidistant_apex_at_side S.triangle.v1 S.triangle.v2 S.triangle.v3 x r hdpos
    e12 e23 e31 dx1 dx2 dx3
theorem selected_le_groupSum
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) (radius : ℝ) (hradius_pos : 0 < radius) :
    (SelectedClass A x radius).card ≤
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius := by
  classical
  have hx_notin : x ∉ SelectedClass A x radius := by
    intro hh
    have : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at this; linarith
  have hchain : ∀ (P Q R T : Finset ℝ²),
      SelectedClass A x radius ⊆ P ∪ Q ∪ R ∪ T →
      (SelectedClass A x radius).card ≤ P.card + Q.card + R.card + T.card := by
    intro P Q R T hsub
    calc (SelectedClass A x radius).card
        ≤ (P ∪ Q ∪ R ∪ T).card := Finset.card_le_card hsub
      _ ≤ P.card + Q.card + R.card + T.card := by
          refine le_trans (Finset.card_union_le _ _) ?_
          refine add_le_add (le_trans (Finset.card_union_le _ _) ?_) le_rfl
          exact add_le_add (Finset.card_union_le _ _) le_rfl
  have hqfacts : ∀ q ∈ SelectedClass A x radius, q ∉ S.triangle.verts →
      (q ∈ S.I1 ∨ q ∈ S.I2 ∨ q ∈ S.I3) := by
    intro q hq hqv
    have hqA : q ∈ A := (mem_selectedClass.mp hq).1
    have hone := S.CP.nonmoser_in_one q hqA hqv
    have hqnv : q ≠ S.triangle.v1 ∧ q ≠ S.triangle.v2 ∧ q ≠ S.triangle.v3 := by
      simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hqv
      push_neg at hqv; exact hqv
    by_cases h1 : q ∈ S.CP.C1
    · refine Or.inl ?_
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase]
      exact ⟨hqnv.2.2, hqnv.2.1, h1⟩
    · by_cases h2 : q ∈ S.CP.C2
      · refine Or.inr (Or.inl ?_)
        rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.1, hqnv.2.2, h2⟩
      · have h3 : q ∈ S.CP.C3 := by
          by_contra h3; simp only [if_neg h1, if_neg h2, if_neg h3] at hone; omega
        refine Or.inr (Or.inr ?_)
        rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.2.1, hqnv.1, h3⟩
  change (SelectedClass A x radius).card ≤
      (SelectedClass A x radius ∩ S.triangle.verts).card +
        (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card +
        (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card +
        (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card
  fin_cases i <;>
  · apply hchain
    intro q hq
    have hqx : q ≠ x := fun h => hx_notin (h ▸ hq)
    by_cases hqv : q ∈ S.triangle.verts
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hq, hqv⟩)))
    · rcases hqfacts q hq hqv with hI | hI | hI <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_right _ ?_))
         exact Finset.mem_inter.mpr ⟨hq, Finset.mem_erase.mpr ⟨hqx, hI⟩⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)
      | (refine Finset.mem_union_right _ ?_
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)
theorem capInterior_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) :
    (S.capInteriorByIndex i).card = 2 := by
  have hc := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  fin_cases i <;> simp only [FiniteEndpointShell.capInteriorByIndex] <;> simp_all
theorem sameCapCount_le_one
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) {x : ℝ²} (radius : ℝ)
    (hxcap : x ∈ S.capInteriorByIndex i) :
    S.sameCapCount i x radius ≤ 1 := by
  have herase : ((S.capInteriorByIndex i).erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxcap, S.capInterior_card_eq_two]
  calc S.sameCapCount i x radius
      ≤ ((S.capInteriorByIndex i).erase x).card :=
        Finset.card_le_card Finset.inter_subset_right
    _ = 1 := herase
lemma b3n9m084_m1_kill_RI {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} {Iadj : Finset ℝ²} (hdpos : 0 < d)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (hxA : x ∈ A) (hxa : dist va x = d)
    (hxb : x ≠ vb) (hxc : x ≠ vc)
    (hvm_sel : dist x vc = r)
    (hapex_arc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0)
    (hIcirc : ∀ z ∈ Iadj, dist vb z = d)
    (hvc_notin : vc ∉ Iadj)
    (hIcap : ∀ z ∈ Iadj, signedArea2 z vc va * signedArea2 vb vc va ≤ 0) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨vb, d⟩ := fun h => hxb (congrArg Sphere.center h)
  have hcyc : signedArea2 vb vc va = signedArea2 va vb vc := by simp only [signedArea2]; ring
  have hAne : signedArea2 x vb vc ≠ 0 := by
    have := (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA hbA hcA hxb hxc hbc
    exact fun h => this (collinear_of_signedArea2_eq_zero _ _ _ h)
  have hC'ne : signedArea2 vb vc va ≠ 0 := by
    rw [hcyc]; exact signedArea2_ne_zero_of_equilateral hdpos eab eac ebc hab hbc hac
  have hAC_lt : signedArea2 x vb vc * signedArea2 vb vc va < 0 := by
    rw [hcyc]; exact lt_of_le_of_ne hapex_arc (mul_ne_zero hAne (hcyc ▸ hC'ne))
  have hswap : signedArea2 x vc vb * signedArea2 va vc vb ≤ 0 := by
    have h1 : signedArea2 x vc vb = - signedArea2 x vb vc := by simp only [signedArea2]; ring
    have h2 : signedArea2 va vc vb = - signedArea2 va vb vc := by simp only [signedArea2]; ring
    rw [h1, h2]; nlinarith only [hapex_arc]
  have hstrict : dist x vc < d :=
    b3n9m084_dist_apex_chord_endpoint_lt hdpos hxa eac eab (by rw [dist_comm]; exact ebc) hbc.symm hxb hswap
  have hB : ⟪vb - x, vc - va⟫_ℝ < 0 := by
    have h2b := b3n9m084_inner_chord_eq_dist_diff x vb vc va
    rw [show dist vb va = d by rw [dist_comm]; exact eab, show dist vb vc = d from ebc, hvm_sel,
        show dist x va = d by rw [dist_comm]; exact hxa] at h2b
    have hrd : r < d := by rw [← hvm_sel]; exact hstrict
    nlinarith only [h2b, hdpos, hvm_sel, hstrict, hrd, dist_nonneg (x := x) (y := vc)]
  have hT : 0 < signedArea2 x vb vc * ⟪vb - x, vc - va⟫_ℝ * signedArea2 vb vc va := by
    have h := mul_pos_of_neg_of_neg hAC_lt hB; nlinarith only [h]
  have hline : vc ∉ affineSpan ℝ ({x, vb} : Set ℝ²) := fun hmem =>
    (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hcA hxA hbA hxc.symm hbc.symm hxb
      (collinear_insert_of_mem_affineSpan_pair hmem)
  exact b3n9m084_m1_kill_targeted hxb hcircles_ne hvm_sel ebc hIcirc hvc_notin hIcap hT hline
lemma b3n9m084_m1_kill_RII {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} {Iadj : Finset ℝ²} (hdpos : 0 < d)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (hxA : x ∈ A) (hxa : dist va x = d)
    (hxb : x ≠ vb) (hxc : x ≠ vc)
    (hvm_sel : dist x va = r)
    (hapex_arc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0)
    (hIcirc : ∀ z ∈ Iadj, dist vb z = d)
    (hva_notin : va ∉ Iadj)
    (hIcap : ∀ z ∈ Iadj, signedArea2 z va vc * signedArea2 vb va vc ≤ 0) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨vb, d⟩ := fun h => hxb (congrArg Sphere.center h)
  have hce : dist vb va = d := by rw [dist_comm]; exact eab
  have hxa_ne : va ≠ x := fun h => by rw [← h, dist_self] at hxa; linarith
  have hstrict : dist x vc < d := by
    have hswap : signedArea2 x vc vb * signedArea2 va vc vb ≤ 0 := by
      have h1 : signedArea2 x vc vb = - signedArea2 x vb vc := by simp only [signedArea2]; ring
      have h2 : signedArea2 va vc vb = - signedArea2 va vb vc := by simp only [signedArea2]; ring
      rw [h1, h2]; nlinarith only [hapex_arc]
    exact b3n9m084_dist_apex_chord_endpoint_lt hdpos hxa eac eab (by rw [dist_comm]; exact ebc) hbc.symm hxb hswap
  have hAC_pos : 0 < signedArea2 x vb va * signedArea2 vb va vc :=
    b3n9m084_sameSide_prod_pos_apexVertex hdpos hxa eab eac ebc hab hstrict
  have hB : 0 < ⟪vb - x, va - vc⟫_ℝ := by
    have h2b := b3n9m084_inner_chord_eq_dist_diff x vb va vc
    rw [show dist vb vc = d from ebc, show dist vb va = d by rw [dist_comm]; exact eab,
        show dist x va = d by rw [dist_comm]; exact hxa] at h2b
    have hxc_lt' : dist x vc ^ 2 < d ^ 2 := by nlinarith only [hdpos, hstrict, dist_nonneg (x := x) (y := vc)]
    nlinarith only [h2b, hxc_lt']
  have hT : 0 < signedArea2 x vb va * ⟪vb - x, va - vc⟫_ℝ * signedArea2 vb va vc := by
    have h := mul_pos hAC_pos hB; nlinarith only [h]
  have hline : va ∉ affineSpan ℝ ({x, vb} : Set ℝ²) := fun hmem =>
    (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) haA hxA hbA hxa_ne hab hxb
      (collinear_insert_of_mem_affineSpan_pair hmem)
  exact b3n9m084_m1_kill_targeted hxb hcircles_ne hvm_sel hce hIcirc hva_notin hIcap hT hline
lemma b3n9m084_m1_branch_false {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) {x : ℝ²} {i : Fin 3} {r : ℝ}
    (hx_cap : x ∈ S.capInteriorByIndex i) (hr_pos : 0 < r)
    (hmc : (SelectedClass A x r ∩ S.triangle.verts).card = 1)
    (hl1ge : 1 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card)
    (hr1ge : 1 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card) : False := by
  classical
  obtain ⟨vm, hvm_eq⟩ := Finset.card_eq_one.mp hmc
  have hvm_mem : vm ∈ SelectedClass A x r ∩ S.triangle.verts := by
    rw [hvm_eq]; exact Finset.mem_singleton_self vm
  have hvm_sel : dist x vm = r := (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hvm_mem)).2
  have hvm_verts : vm ∈ S.triangle.verts := Finset.mem_of_mem_inter_right hvm_mem
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  have hI1circ : ∀ z ∈ S.I1, dist S.triangle.v1 z = d := by
    intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz; exact hC1 z hz.2.2
  have hI2circ : ∀ z ∈ S.I2, dist S.triangle.v2 z = d := by
    intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz; exact hC2 z hz.2.2
  have hI3circ : ∀ z ∈ S.I3, dist S.triangle.v3 z = d := by
    intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz; exact hC3 z hz.2.2
  simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hvm_verts
  have hfinTwo (h : 2 < 3) : (⟨2, h⟩ : Fin 3) = 2 := rfl
  fin_cases i <;> simp only [Fin.mk_zero, Fin.mk_one, hfinTwo] at hl1ge hr1ge
  ·
    have hxI1 : x ∈ S.I1 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hxI1
    obtain ⟨hxv3, hxv2, hxC1⟩ := hxI1
    have hxA : x ∈ A := S.CP.C1_subset hxC1
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC1
    have hxarc : signedArea2 x S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
      ((S.CP.arc_membership x hxA).1).mp hxC1
    rcases hvm_verts with rfl | rfl | rfl
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 0).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RII S hdpos e12 e13 e23 hp12 hp13 hp23 hv1A hv2A hv3A hxA
          hx1 hxv2 hxv3 hvm_sel hxarc hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v1 S.triangle.v3 = -signedArea2 z S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 0).card = 0 := by
        simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos e13 e12 (by rw [dist_comm]; exact e23) hp13 hp12 hp23.symm
          hv1A hv3A hv2A hxA hx1 hxv3 hxv2 hvm_sel ?_ hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v3 S.triangle.v2 = -signedArea2 x S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v2 S.triangle.v1 = -signedArea2 z S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 0).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos e12 e13 e23 hp12 hp13 hp23 hv1A hv2A hv3A hxA
          hx1 hxv2 hxv3 hvm_sel hxarc hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
  ·
    have hxI2 : x ∈ S.I2 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hxI2
    obtain ⟨hxv1, hxv3, hxC2⟩ := hxI2
    have hxA : x ∈ A := S.CP.C2_subset hxC2
    have hx2 : dist S.triangle.v2 x = d := hC2 _ hxC2
    have hxarc : signedArea2 x S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC2
    rcases hvm_verts with rfl | rfl | rfl
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 1).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
          hp23 hp12.symm hp13.symm hv2A hv3A hv1A hxA hx2 hxv3 hxv1 hvm_sel
          hxarc hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 1).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RII S hdpos e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
          hp23 hp12.symm hp13.symm hv2A hv3A hv1A hxA hx2 hxv3 hxv1 hvm_sel
          hxarc hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v2 S.triangle.v1 = -signedArea2 z S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 1).card = 0 := by
        simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos (by rw [dist_comm]; exact e12) e23 e13
          hp12.symm hp23 hp13 hv2A hv1A hv3A hxA hx2 hxv1 hxv3 hvm_sel ?_ hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v1 S.triangle.v3 = -signedArea2 x S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v3 S.triangle.v2 = -signedArea2 z S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
  ·
    have hxI3 : x ∈ S.I3 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hxI3
    obtain ⟨hxv2, hxv1, hxC3⟩ := hxI3
    have hxA : x ∈ A := S.CP.C3_subset hxC3
    have hx3 : dist S.triangle.v3 x = d := hC3 _ hxC3
    have hxarc : signedArea2 x S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC3
    rcases hvm_verts with rfl | rfl | rfl
    ·
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 2).card = 0 := by
        simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos (by rw [dist_comm]; exact e23) (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e12)
          hp23.symm hp13.symm hp12.symm hv3A hv2A hv1A hxA hx3 hxv2 hxv1 hvm_sel ?_ hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v2 S.triangle.v1 = -signedArea2 x S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v1 S.triangle.v3 = -signedArea2 z S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 2).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RI S hdpos (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
          hp13.symm hp23.symm hp12 hv3A hv1A hv2A hxA hx3 hxv1 hxv2 hvm_sel
          hxarc hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    ·
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 2).card = 0 := by
        simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
        refine b3n9m084_m1_kill_RII S hdpos (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
          hp13.symm hp23.symm hp12 hv3A hv1A hv2A hxA hx3 hxv1 hxv2 hvm_sel
          hxarc hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v3 S.triangle.v2 = -signedArea2 z S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith only [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
set_option maxHeartbeats 1600000 in
theorem N8k_single_apex_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : N8SelectedApex S i x) :
    False := by
  set r := hx.radius with hr_def
  set m := S.moserCount x r with hm_def
  set s := S.sameCapCount i x r with hs_def
  set l := S.leftAdjCount i x r with hl_def
  set r_count := S.rightAdjCount i x r with hr_count_def
  have hcover : 4 ≤ m + s + l + r_count :=
    le_trans hx.selected_card (S.selected_le_groupSum i r hx.radius_pos)
  by_cases hl2 : 2 ≤ l
  ·
    classical
    have hwit : ∃ W : N8AdjacentArcWitness,
        W.base.apex = x ∧ W.base.selectedRadius = r ∧
          W.base.arc.support = S.leftAdjacentInteriorByIndex i :=
      S.exists_leftAdjacentArcWitness hN4e i hx.cap_mem r
    obtain ⟨W, hWapex, hWrad, hWsupp⟩ := hwit
    have hone := S.N8a3_adjacent_one_hit hN4e W
    rw [hWapex, hWrad, hWsupp] at hone
    have hge2 : 2 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card := by
      simpa [hl_def, FiniteEndpointShell.leftAdjCount] using hl2
    omega
  · by_cases hr2 : 2 ≤ r_count
    ·
      classical
      have hwit : ∃ W : N8AdjacentArcWitness,
          W.base.apex = x ∧ W.base.selectedRadius = r ∧
            W.base.arc.support = S.rightAdjacentInteriorByIndex i :=
        S.exists_rightAdjacentArcWitness hN4e i hx.cap_mem r
      obtain ⟨W, hWapex, hWrad, hWsupp⟩ := hwit
      have hone := S.N8a3_adjacent_one_hit hN4e W
      rw [hWapex, hWrad, hWsupp] at hone
      have hge2 : 2 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card := by
        simpa [hr_count_def, FiniteEndpointShell.rightAdjCount] using hr2
      omega
    · by_cases hm2 : 2 ≤ m
      ·
        have hm2_nat : 2 ≤ (SelectedClass A x r ∩ S.triangle.verts).card := hm2
        classical
        rcases Finset.exists_subset_card_eq (s := SelectedClass A x r ∩ S.triangle.verts) hm2_nat
          with ⟨E, hEsub, hEcard⟩
        rw [Finset.card_eq_two] at hEcard
        rcases hEcard with ⟨m₁, m₂, hm₁m₂_ne, hEeq⟩
        have hm₁_sel : m₁ ∈ SelectedClass A x r := by
          exact Finset.mem_of_mem_inter_left (hEsub (by simp [hEeq]))
        have hm₂_sel : m₂ ∈ SelectedClass A x r := by
          exact Finset.mem_of_mem_inter_left (hEsub (by simp [hEeq]))
        have hm₁_verts : m₁ ∈ S.triangle.verts := by
          exact Finset.mem_of_mem_inter_right (hEsub (by simp [hEeq]))
        have hm₂_verts : m₂ ∈ S.triangle.verts := by
          exact Finset.mem_of_mem_inter_right (hEsub (by simp [hEeq]))
        let hMoser2 : N8MoserEndpointPair S i x r :=
          { m₁ := m₁
            m₂ := m₂
            m₁_moser := hm₁_verts
            m₂_moser := hm₂_verts
            m₁_mem := hm₁_sel
            m₂_mem := hm₂_sel
            m₁_ne_m₂ := hm₁m₂_ne }
        by_cases hown :
            (m₁ = S.ownLeftEndpointByIndex i ∧ m₂ = S.ownRightEndpointByIndex i) ∨
            (m₁ = S.ownRightEndpointByIndex i ∧ m₂ = S.ownLeftEndpointByIndex i)
        ·
          classical
          have hl1 : l ≤ 1 := by omega
          have hr1 : r_count ≤ 1 := by omega
          have hs1 : s ≤ 1 := S.sameCapCount_le_one i r hx.cap_mem
          obtain ⟨_Wl, _, _, _⟩ := S.exists_leftAdjacentArcWitness hN4e i hx.cap_mem r
          obtain ⟨_Wr, _, _, _⟩ := S.exists_rightAdjacentArcWitness hN4e i hx.cap_mem r
          obtain ⟨_v₁, _v₂, _v₃, _, _, _, _, _hx1, _⟩ := S.exists_apexFrameData hN4e i hx.cap_mem
          have hm3 : m ≤ 3 := by
            simp only [hm_def, FiniteEndpointShell.moserCount]
            calc (SelectedClass A x r ∩ S.triangle.verts).card
                ≤ S.triangle.verts.card :=
                  Finset.card_le_card Finset.inter_subset_right
              _ = 3 := S.triangle.verts_card
          have hm_le2 : m ≤ 2 := by
            rw [hm_def]
            exact S.apexFrame_moserCount_le_two hN4e i hx.cap_mem r
          have hadj_l0 : l = 0 := by
            simp only [hl_def, FiniteEndpointShell.leftAdjCount]
            obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
            have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
            have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
            have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
            fin_cases i
            · simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v3 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I1 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I1, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv3, hxv2, hxC1⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C1_subset hxC1
              have hncol : S.triangle.v3 ∉ affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v3_mem hxA S.triangle.v2_mem
                  hxv3.symm S.triangle.v23_ne.symm hxv2
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I2
              have hw_C2 : w ∈ S.CP.C2 := by
                rw [I2, Finset.mem_erase, Finset.mem_erase] at hw_I2; exact hw_I2.2.2
              set s := affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv2s : S.triangle.v2 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v3
              have hv3_r : dist x S.triangle.v3 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v3).trans hv3_r
              have ho_d : dist S.triangle.v2 o = d :=
                (dist_reflection_eq_of_mem s hv2s S.triangle.v3).trans e23
              have hv3_ne_o : S.triangle.v3 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v3).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v2, d⟩ from
                    fun h => hxv2 (congrArg Sphere.center h))
                  hv3_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v3 ▸ hv3_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 S.triangle.v3 ▸ e23))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 w ▸ hC2 w hw_C2))
                with hwv3 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv3 ▸ hw_I2)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I2)
                  (by
                      intro ho_I2
                      simp only [I2, mem_erase] at ho_I2
                      obtain ⟨ho_ne_v1, ho_ne_v3, ho_C2⟩ := ho_I2
                      have ho_A : o ∈ A := S.CP.C2_subset ho_C2
                      have hxv2_r : dist x S.triangle.v2 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v3 o) x S.triangle.v2 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv3_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact e23)
                          hv3_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v2 = -signedArea2 x S.triangle.v2 S.triangle.v3 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v2)
                                   (y := S.triangle.v3) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v3 x S.triangle.v2 =
                            signedArea2 x S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v2 ^ 2 * signedArea2 o S.triangle.v2 S.triangle.v3 =
                          dist S.triangle.v2 S.triangle.v3 ^ 2 * signedArea2 x S.triangle.v2 S.triangle.v3 :=
                        b3n9m084_angular_prop_dist x S.triangle.v2 S.triangle.v3 o
                          (by rw [hxv2_r, hv3_r]) (by rw [e23, ho_d])
                          (by rw [ho_r, hv3_r]) hsa
                      have hxC1_arc := (S.CP.arc_membership x hxA).1.mp hxC1
                      have hdxv2_sq : 0 < dist x S.triangle.v2 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv2)
                      have hd23_sq : 0 < dist S.triangle.v2 S.triangle.v3 ^ 2 := by
                        rw [e23]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v2 S.triangle.v3 *
                          signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
                        have h1 : dist x S.triangle.v2 ^ 2 *
                            (signedArea2 o S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) =
                            dist S.triangle.v2 S.triangle.v3 ^ 2 *
                            (signedArea2 x S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                          linear_combination signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 * hprop
                        nlinarith only [h1, hd23_sq, hxC1_arc, hdxv2_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd23_sq) hxC1_arc]
                      have ho_C1 : o ∈ S.CP.C1 := (S.CP.arc_membership o ho_A).1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact S.CP.v2_notin_C2 (h ▸ ho_C2)
                          · exact hv3_ne_o (mem_singleton.mp hov).symm
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C2, ite_true, ite_false] at hone
                        omega)
            · simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v1 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I2 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I2, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv1, hxv3, hxC2⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C2_subset hxC2
              have hncol : S.triangle.v1 ∉ affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v1_mem hxA S.triangle.v3_mem
                  hxv1.symm S.triangle.v13_ne hxv3
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I3
              have hw_C3 : w ∈ S.CP.C3 := by
                rw [I3, Finset.mem_erase, Finset.mem_erase] at hw_I3; exact hw_I3.2.2
              set s := affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv3s : S.triangle.v3 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v1
              have hv1_r : dist x S.triangle.v1 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv1_d : dist S.triangle.v3 S.triangle.v1 = d := by
                rw [dist_comm]; exact e13
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v1).trans hv1_r
              have ho_d : dist S.triangle.v3 o = d :=
                (dist_reflection_eq_of_mem s hv3s S.triangle.v1).trans hv1_d
              have hv1_ne_o : S.triangle.v1 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v1).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v3, d⟩ from
                    fun h => hxv3 (congrArg Sphere.center h))
                  hv1_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v1 ▸ hv1_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 S.triangle.v1 ▸ hv1_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 w ▸ hC3 w hw_C3))
                with hwv1 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv1 ▸ hw_I3)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I3)
                  (by
                      intro ho_I3
                      simp only [I3, mem_erase] at ho_I3
                      obtain ⟨ho_ne_v2, ho_ne_v1, ho_C3⟩ := ho_I3
                      have ho_A : o ∈ A := S.CP.C3_subset ho_C3
                      have hxv3_r : dist x S.triangle.v3 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v1 o) x S.triangle.v3 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv1_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv1_d)
                          hv1_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v3 =
                          -signedArea2 x S.triangle.v3 S.triangle.v1 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v3)
                                   (y := S.triangle.v1) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v1 x S.triangle.v3 =
                            signedArea2 x S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v3 ^ 2 *
                          signedArea2 o S.triangle.v3 S.triangle.v1 =
                          dist S.triangle.v3 S.triangle.v1 ^ 2 *
                          signedArea2 x S.triangle.v3 S.triangle.v1 :=
                        b3n9m084_angular_prop_dist x S.triangle.v3 S.triangle.v1 o
                          (by rw [hxv3_r, hv1_r]) (by rw [hv1_d, ho_d])
                          (by rw [ho_r, hv1_r]) hsa
                      have hxC2_arc := (S.CP.arc_membership x hxA).2.1.mp hxC2
                      have hdxv3_sq : 0 < dist x S.triangle.v3 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv3)
                      have hd31_sq : 0 < dist S.triangle.v3 S.triangle.v1 ^ 2 := by
                        rw [hv1_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v3 S.triangle.v1 *
                          signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
                        have h1 : dist x S.triangle.v3 ^ 2 *
                            (signedArea2 o S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) =
                            dist S.triangle.v3 S.triangle.v1 ^ 2 *
                            (signedArea2 x S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                          linear_combination
                            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 * hprop
                        nlinarith only [h1, hd31_sq, hxC2_arc, hdxv3_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd31_sq) hxC2_arc]
                      have ho_C2 : o ∈ S.CP.C2 := (S.CP.arc_membership o ho_A).2.1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact S.CP.v3_notin_C3 (mem_singleton.mp hov ▸ ho_C3)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C2, ho_C3, ite_true, ite_false] at hone
                        omega)
            · simp only [leftAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v2 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I3 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I3, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv2, hxv1, hxC3⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C3_subset hxC3
              have hncol : S.triangle.v2 ∉ affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v2_mem hxA S.triangle.v1_mem
                  hxv2.symm S.triangle.v12_ne.symm hxv1
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I1
              have hw_C1 : w ∈ S.CP.C1 := by
                rw [I1, Finset.mem_erase, Finset.mem_erase] at hw_I1; exact hw_I1.2.2
              set s := affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv1s : S.triangle.v1 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v2
              have hv2_r : dist x S.triangle.v2 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v2).trans hv2_r
              have ho_d : dist S.triangle.v1 o = d :=
                (dist_reflection_eq_of_mem s hv1s S.triangle.v2).trans e12
              have hv2_ne_o : S.triangle.v2 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v2).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v1, d⟩ from
                    fun h => hxv1 (congrArg Sphere.center h))
                  hv2_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v2 ▸ hv2_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 S.triangle.v2 ▸ e12))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 w ▸ hC1 w hw_C1))
                with hwv2 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv2 ▸ hw_I1)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I1)
                  (by
                      intro ho_I1
                      simp only [I1, mem_erase] at ho_I1
                      obtain ⟨ho_ne_v3, ho_ne_v2, ho_C1⟩ := ho_I1
                      have ho_A : o ∈ A := S.CP.C1_subset ho_C1
                      have hxv1_r : dist x S.triangle.v1 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v2 o) x S.triangle.v1 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv2_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact e12)
                          hv2_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v1 =
                          -signedArea2 x S.triangle.v1 S.triangle.v2 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v1)
                                   (y := S.triangle.v2) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v2 x S.triangle.v1 =
                            signedArea2 x S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v1 ^ 2 *
                          signedArea2 o S.triangle.v1 S.triangle.v2 =
                          dist S.triangle.v1 S.triangle.v2 ^ 2 *
                          signedArea2 x S.triangle.v1 S.triangle.v2 :=
                        b3n9m084_angular_prop_dist x S.triangle.v1 S.triangle.v2 o
                          (by rw [hxv1_r, hv2_r]) (by rw [e12, ho_d])
                          (by rw [ho_r, hv2_r]) hsa
                      have hxC3_arc := (S.CP.arc_membership x hxA).2.2.mp hxC3
                      have hdxv1_sq : 0 < dist x S.triangle.v1 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv1)
                      have hd12_sq : 0 < dist S.triangle.v1 S.triangle.v2 ^ 2 := by
                        rw [e12]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v1 S.triangle.v2 *
                          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 := by
                        have h1 : dist x S.triangle.v1 ^ 2 *
                            (signedArea2 o S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) =
                            dist S.triangle.v1 S.triangle.v2 ^ 2 *
                            (signedArea2 x S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
                          linear_combination
                            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 * hprop
                        nlinarith only [h1, hd12_sq, hxC3_arc, hdxv1_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd12_sq) hxC3_arc]
                      have ho_C3 : o ∈ S.CP.C3 := (S.CP.arc_membership o ho_A).2.2.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C3, ite_true, ite_false] at hone
                        omega)
          have hadj_r0 : r_count = 0 := by
            simp only [hr_count_def, FiniteEndpointShell.rightAdjCount]
            obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
            have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
            have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
            have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
            fin_cases i
            · simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v2 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I1 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I1, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv3, hxv2, hxC1⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C1_subset hxC1
              have hncol : S.triangle.v2 ∉ affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v2_mem hxA S.triangle.v3_mem
                  hxv2.symm S.triangle.v23_ne hxv3
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I3
              have hw_C3 : w ∈ S.CP.C3 := by
                rw [I3, Finset.mem_erase, Finset.mem_erase] at hw_I3; exact hw_I3.2.2
              set s := affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv3s : S.triangle.v3 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v2
              have hv2_r : dist x S.triangle.v2 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv2_d : dist S.triangle.v3 S.triangle.v2 = d := by
                rw [dist_comm]; exact e23
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v2).trans hv2_r
              have ho_d : dist S.triangle.v3 o = d :=
                (dist_reflection_eq_of_mem s hv3s S.triangle.v2).trans hv2_d
              have hv2_ne_o : S.triangle.v2 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v2).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v3, d⟩ from
                    fun h => hxv3 (congrArg Sphere.center h))
                  hv2_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v2 ▸ hv2_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 S.triangle.v2 ▸ hv2_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 w ▸ hC3 w hw_C3))
                with hwv2 | hwo
              · exact absurd (hwv2 ▸ hw_I3) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I3)
                  (by
                      intro ho_I3
                      simp only [I3, mem_erase] at ho_I3
                      obtain ⟨ho_ne_v2, ho_ne_v1, ho_C3⟩ := ho_I3
                      have ho_A : o ∈ A := S.CP.C3_subset ho_C3
                      have hxv3_r : dist x S.triangle.v3 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v2 o) x S.triangle.v3 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv2_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv2_d)
                          hv2_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v3 =
                          -signedArea2 x S.triangle.v3 S.triangle.v2 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v3)
                                   (y := S.triangle.v2) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v2 x S.triangle.v3 =
                            signedArea2 x S.triangle.v3 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v3 ^ 2 *
                          signedArea2 o S.triangle.v2 S.triangle.v3 =
                          dist S.triangle.v3 S.triangle.v2 ^ 2 *
                          signedArea2 x S.triangle.v2 S.triangle.v3 := by
                        have hprop_swap := b3n9m084_angular_prop_dist x S.triangle.v3 S.triangle.v2 o
                          (by rw [hxv3_r, hv2_r]) (by rw [hv2_d, ho_d])
                          (by rw [ho_r, hv2_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v3 S.triangle.v2 =
                            -signedArea2 o S.triangle.v2 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v3 S.triangle.v2 =
                            -signedArea2 x S.triangle.v2 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC1_arc := (S.CP.arc_membership x hxA).1.mp hxC1
                      have hdxv3_sq : 0 < dist x S.triangle.v3 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv3)
                      have hd32_sq : 0 < dist S.triangle.v3 S.triangle.v2 ^ 2 := by
                        rw [hv2_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v2 S.triangle.v3 *
                          signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
                        have h1 : dist x S.triangle.v3 ^ 2 *
                            (signedArea2 o S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) =
                            dist S.triangle.v3 S.triangle.v2 ^ 2 *
                            (signedArea2 x S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                          linear_combination
                            signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 * hprop
                        nlinarith only [h1, hd32_sq, hxC1_arc, hdxv3_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd32_sq) hxC1_arc]
                      have ho_C1 : o ∈ S.CP.C1 := (S.CP.arc_membership o ho_A).1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact absurd (mem_singleton.mp hov ▸ ho_C3) S.CP.v3_notin_C3
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C3, ite_true, ite_false] at hone
                        omega)
            · simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v3 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I2 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I2, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv1, hxv3, hxC2⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C2_subset hxC2
              have hncol : S.triangle.v3 ∉ affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v3_mem hxA S.triangle.v1_mem
                  hxv3.symm S.triangle.v13_ne.symm hxv1
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I1
              have hw_C1 : w ∈ S.CP.C1 := by
                rw [I1, Finset.mem_erase, Finset.mem_erase] at hw_I1; exact hw_I1.2.2
              set s := affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv1s : S.triangle.v1 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v3
              have hv3_r : dist x S.triangle.v3 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv3_d : dist S.triangle.v1 S.triangle.v3 = d := e13
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v3).trans hv3_r
              have ho_d : dist S.triangle.v1 o = d :=
                (dist_reflection_eq_of_mem s hv1s S.triangle.v3).trans hv3_d
              have hv3_ne_o : S.triangle.v3 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v3).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v1, d⟩ from
                    fun h => hxv1 (congrArg Sphere.center h))
                  hv3_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v3 ▸ hv3_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 S.triangle.v3 ▸ hv3_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 w ▸ hC1 w hw_C1))
                with hwv3 | hwo
              · exact absurd (hwv3 ▸ hw_I1) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I1)
                  (by
                      intro ho_I1
                      simp only [I1, mem_erase] at ho_I1
                      obtain ⟨ho_ne_v3, ho_ne_v2, ho_C1⟩ := ho_I1
                      have ho_A : o ∈ A := S.CP.C1_subset ho_C1
                      have hxv1_r : dist x S.triangle.v1 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v3 o) x S.triangle.v1 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv3_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv3_d)
                          hv3_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v1 =
                          -signedArea2 x S.triangle.v1 S.triangle.v3 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v1)
                                   (y := S.triangle.v3) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v3 x S.triangle.v1 =
                            signedArea2 x S.triangle.v1 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v1 ^ 2 *
                          signedArea2 o S.triangle.v3 S.triangle.v1 =
                          dist S.triangle.v1 S.triangle.v3 ^ 2 *
                          signedArea2 x S.triangle.v3 S.triangle.v1 := by
                        have hprop_swap := b3n9m084_angular_prop_dist x S.triangle.v1 S.triangle.v3 o
                          (by rw [hxv1_r, hv3_r]) (by rw [hv3_d, ho_d])
                          (by rw [ho_r, hv3_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v1 S.triangle.v3 =
                            -signedArea2 o S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v1 S.triangle.v3 =
                            -signedArea2 x S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC2_arc := (S.CP.arc_membership x hxA).2.1.mp hxC2
                      have hdxv1_sq : 0 < dist x S.triangle.v1 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv1)
                      have hd13_sq : 0 < dist S.triangle.v1 S.triangle.v3 ^ 2 := by
                        rw [hv3_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v3 S.triangle.v1 *
                          signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
                        have h1 : dist x S.triangle.v1 ^ 2 *
                            (signedArea2 o S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) =
                            dist S.triangle.v1 S.triangle.v3 ^ 2 *
                            (signedArea2 x S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                          linear_combination
                            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 * hprop
                        nlinarith only [h1, hd13_sq, hxC2_arc, hdxv1_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd13_sq) hxC2_arc]
                      have ho_C2 : o ∈ S.CP.C2 := (S.CP.arc_membership o ho_A).2.1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C2, ite_true, ite_false] at hone
                        omega)
            · simp only [rightAdjacentInteriorByIndex, Fin.val_zero, Fin.val_one, Fin.val_two]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v1 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I3 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I3, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv2, hxv1, hxC3⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C3_subset hxC3
              have hncol : S.triangle.v1 ∉ affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²) :=
                fun hmem => (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) S.triangle.v1_mem hxA S.triangle.v2_mem
                  hxv1.symm S.triangle.v12_ne hxv2
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I2
              have hw_C2 : w ∈ S.CP.C2 := by
                rw [I2, Finset.mem_erase, Finset.mem_erase] at hw_I2; exact hw_I2.2.2
              set s := affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv2s : S.triangle.v2 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v1
              have hv1_r : dist x S.triangle.v1 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv1_d : dist S.triangle.v2 S.triangle.v1 = d := by
                rw [dist_comm]; exact e12
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v1).trans hv1_r
              have ho_d : dist S.triangle.v2 o = d :=
                (dist_reflection_eq_of_mem s hv2s S.triangle.v1).trans hv1_d
              have hv1_ne_o : S.triangle.v1 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v1).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v2, d⟩ from
                    fun h => hxv2 (congrArg Sphere.center h))
                  hv1_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v1 ▸ hv1_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 S.triangle.v1 ▸ hv1_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 w ▸ hC2 w hw_C2))
                with hwv1 | hwo
              · exact absurd (hwv1 ▸ hw_I2) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I2)
                  (by
                      intro ho_I2
                      simp only [I2, mem_erase] at ho_I2
                      obtain ⟨ho_ne_v1, ho_ne_v3, ho_C2⟩ := ho_I2
                      have ho_A : o ∈ A := S.CP.C2_subset ho_C2
                      have hxv2_r : dist x S.triangle.v2 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v1 o) x S.triangle.v2 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv1_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv1_d)
                          hv1_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v2 =
                          -signedArea2 x S.triangle.v2 S.triangle.v1 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v2)
                                   (y := S.triangle.v1) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v1 x S.triangle.v2 =
                            signedArea2 x S.triangle.v2 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v2 ^ 2 *
                          signedArea2 o S.triangle.v1 S.triangle.v2 =
                          dist S.triangle.v2 S.triangle.v1 ^ 2 *
                          signedArea2 x S.triangle.v1 S.triangle.v2 := by
                        have hprop_swap := b3n9m084_angular_prop_dist x S.triangle.v2 S.triangle.v1 o
                          (by rw [hxv2_r, hv1_r]) (by rw [hv1_d, ho_d])
                          (by rw [ho_r, hv1_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v2 S.triangle.v1 =
                            -signedArea2 o S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v2 S.triangle.v1 =
                            -signedArea2 x S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC3_arc := (S.CP.arc_membership x hxA).2.2.mp hxC3
                      have hdxv2_sq : 0 < dist x S.triangle.v2 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv2)
                      have hd21_sq : 0 < dist S.triangle.v2 S.triangle.v1 ^ 2 := by
                        rw [hv1_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v1 S.triangle.v2 *
                          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 := by
                        have h1 : dist x S.triangle.v2 ^ 2 *
                            (signedArea2 o S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) =
                            dist S.triangle.v2 S.triangle.v1 ^ 2 *
                            (signedArea2 x S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
                          linear_combination
                            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 * hprop
                        nlinarith only [h1, hd21_sq, hxC3_arc, hdxv2_sq, mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd21_sq) hxC3_arc]
                      have ho_C3 : o ∈ S.CP.C3 := (S.CP.arc_membership o ho_A).2.2.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact absurd (h ▸ ho_C2) S.CP.v2_notin_C2
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C2, ho_C3, ite_true, ite_false] at hone
                        omega)
          omega
        ·
          exact S.N8b_endpoint_pair_split hN4e hx hMoser2 hown
      ·
        classical
        have hpos : 0 < (SelectedClass A x r).card :=
          lt_of_lt_of_le (by norm_num) hx.selected_card
        obtain ⟨v, hv⟩ := Finset.card_pos.mp hpos
        have hxv : dist x v = r := (mem_selectedClass.mp hv).2
        let hx_pkt : S.N8SameCapClassPacket hN4e x i :=
          { center := v
            radius := r
            radius_pos := hx.radius_pos
            x_on_selected_circle := hxv }
        by_cases hCapCenter : Nonempty (S.N8iCapCenterPacket hx_pkt)
        ·
          obtain ⟨hi⟩ := hCapCenter
          exact S.N8i_capcenter_fullwidth_false hN4e hx_pkt hi
        ·
          have hm1 : m ≤ 1 := by omega
          have hl1 : l ≤ 1 := by omega
          have hr1 : r_count ≤ 1 := by omega
          have hs1le : s ≤ 1 := S.sameCapCount_le_one i r hx.cap_mem
          have hs1 : 1 ≤ s := by omega
          have hl1ge : 1 ≤ l := by omega
          have hr1ge : 1 ≤ r_count := by omega
          have hm1ge : 1 ≤ m := by omega
          have hmc : (SelectedClass A x r ∩ S.triangle.verts).card = 1 := by
            have : m = 1 := le_antisymm hm1 hm1ge
            simpa [hm_def, FiniteEndpointShell.moserCount] using this
          have hl1geC : 1 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card := by
            simpa [hl_def, FiniteEndpointShell.leftAdjCount] using hl1ge
          have hr1geC : 1 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card := by
            simpa [hr_count_def, FiniteEndpointShell.rightAdjCount] using hr1ge
          exact S.b3n9m084_m1_branch_false hN4e hx.cap_mem hx.radius_pos hmc hl1geC hr1geC
theorem N8k_capInterior_false_of_hasNEquidistantProperty
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    (hK4 : HasNEquidistantProperty 4 A)
    {x : ℝ²} {i : Fin 3}
    (hxcap : x ∈ S.capInteriorByIndex i) :
    False := by
  rcases N8SelectedApex.nonempty_of_hasNEquidistantProperty
      (S := S) (i := i) (x := x) hK4 hxcap with ⟨hx⟩
  exact S.N8k_single_apex_false hN4e hx
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit084
