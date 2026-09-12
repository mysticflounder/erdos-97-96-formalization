/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MinimalAdmissibleInteriorPair

/-!
# A short minimum admissible interior chord

This module formalizes the bounded subcase in §4 of
`docs/audits/2026-09-06-exactfive-mutual-return-chord.md`, covered by §3c of
`docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md`.
Its intended consumer is `ExactFiveMutualReturnChord`, then the initially distinct
mutual-incidence branch of `Rigid221Closure`, toward `Problem97.erdos97_rhs`.

The proof uses the nonobtuse supporting cone and distinct second-apex distances.
A fixed second-apex radius class contains at most one interior anchor. Of four
anchors, three therefore avoid that class, and a short pair among those three
preserves it under joint deletion. This proves only the guarded chord bound.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97.FirstApexExactFiveInteriorFrontier

open ATailDeletionRobustness

private theorem first_apex_eq_triangle_vertex
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    S.oppApex1 = (S.triangleByIndex S.oppIndex1).v1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.triangleByIndex,
      SurplusCapPacket.oppIndex1, hi, Fin.val_zero, Fin.val_one]

private theorem interior_inner_nonneg
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {x y : ℝ²} (hx : x ∈ interiorPointSet (D := D) (S := S) radius)
    (hy : y ∈ interiorPointSet (D := D) (S := S) radius) :
    0 ≤ ⟪x - S.oppApex1, y - S.oppApex1⟫_ℝ := by
  classical
  let T := S.triangleByIndex S.oppIndex1
  let C := S.circPacketByIndex S.oppIndex1
  have hxI := (Finset.mem_inter.mp hx).2
  have hyI := (Finset.mem_inter.mp hy).2
  have hxSide := S.signedArea2_mul_neg_of_mem_capInteriorByIndex D.convex S.oppIndex1 hxI
  have hySide := S.signedArea2_mul_neg_of_mem_capInteriorByIndex D.convex S.oppIndex1 hyI
  have hnondeg : signedArea2 T.v1 T.v2 T.v3 ≠ 0 := by
    intro hzero
    change signedArea2 x T.v2 T.v3 * signedArea2 T.v1 T.v2 T.v3 < 0 at hxSide
    simp [hzero] at hxSide
  obtain ⟨a, b, ha, hb, hxcone⟩ := exists_cone_coeffs_of_cap_region
    C.moser_on_boundary_1 C.moser_on_boundary_2 C.moser_on_boundary_3
    (C.disk_contains_A x (S.capInteriorByIndex_subset _ hxI)) hxSide.le hnondeg
  obtain ⟨c, d, hc, hd, hycone⟩ := exists_cone_coeffs_of_cap_region
    C.moser_on_boundary_1 C.moser_on_boundary_2 C.moser_on_boundary_3
    (C.disk_contains_A y (S.capInteriorByIndex_subset _ hyI)) hySide.le hnondeg
  rw [first_apex_eq_triangle_vertex S, hxcone, hycone]
  simp only [inner_add_left, inner_add_right, real_inner_smul_left, real_inner_smul_right]
  have hcross := C.inner_at_v1
  have hcross' : 0 ≤ ⟪T.v3 - T.v1, T.v2 - T.v1⟫_ℝ := by
    rw [real_inner_comm]
    exact hcross
  exact add_nonneg
    (add_nonneg (mul_nonneg hc (mul_nonneg ha (real_inner_self_nonneg)))
      (mul_nonneg hc (mul_nonneg hb hcross')))
    (add_nonneg (mul_nonneg hd (mul_nonneg ha hcross))
      (mul_nonneg hd (mul_nonneg hb (real_inner_self_nonneg))))

private theorem inner_coords (u v : ℝ²) :
    ⟪u, v⟫_ℝ = u 0 * v 0 + u 1 * v 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (v _)]

/-- The Gram determinant of three planar vectors vanishes. -/
private theorem gram_three_eq_zero (u v w : ℝ²) :
    ⟪u, u⟫_ℝ * ⟪v, v⟫_ℝ * ⟪w, w⟫_ℝ +
      2 * ⟪u, v⟫_ℝ * ⟪u, w⟫_ℝ * ⟪v, w⟫_ℝ -
      ⟪u, u⟫_ℝ * ⟪v, w⟫_ℝ ^ 2 -
      ⟪v, v⟫_ℝ * ⟪u, w⟫_ℝ ^ 2 -
      ⟪w, w⟫_ℝ * ⟪u, v⟫_ℝ ^ 2 = 0 := by
  simp only [inner_coords]
  ring

private theorem inner_dist_identity (O x y : ℝ²) :
    2 * ⟪x - O, y - O⟫_ℝ = dist O x ^ 2 + dist O y ^ 2 - dist x y ^ 2 := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hsub : (x - O) - (y - O) = x - y := by abel
  rw [hsub]
  simp only [dist_eq_norm, norm_sub_rev O]
  ring

private theorem three_rays_short_pair
    {O x y z : ℝ²} {r : ℝ} (hr : 0 < r)
    (hx : dist O x = r) (hy : dist O y = r) (hz : dist O z = r)
    (hxy : 0 ≤ ⟪x - O, y - O⟫_ℝ)
    (hxz : 0 ≤ ⟪x - O, z - O⟫_ℝ)
    (hyz : 0 ≤ ⟪y - O, z - O⟫_ℝ) :
    dist x y ≤ r ∨ dist x z ≤ r ∨ dist y z ≤ r := by
  by_contra h
  push Not at h
  let R := r ^ 2
  let a := ⟪x - O, y - O⟫_ℝ
  let b := ⟪x - O, z - O⟫_ℝ
  let c := ⟪y - O, z - O⟫_ℝ
  have hR : 0 < R := sq_pos_of_pos hr
  have ha : 2 * a < R := by
    have hid := inner_dist_identity O x y
    rw [hx, hy] at hid
    nlinarith [sq_nonneg (dist x y - r)]
  have hb : 2 * b < R := by
    have hid := inner_dist_identity O x z
    rw [hx, hz] at hid
    nlinarith [sq_nonneg (dist x z - r)]
  have hc : 2 * c < R := by
    have hid := inner_dist_identity O y z
    rw [hy, hz] at hid
    nlinarith [sq_nonneg (dist y z - r)]
  have ha2 : 4 * a ^ 2 < R ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr ha) (show 0 < R + 2 * a by dsimp [a]; linarith)]
  have hb2 : 4 * b ^ 2 < R ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr hb) (show 0 < R + 2 * b by dsimp [b]; linarith)]
  have hc2 : 4 * c ^ 2 < R ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr hc) (show 0 < R + 2 * c by dsimp [c]; linarith)]
  have hsum : 0 < R ^ 2 - a ^ 2 - b ^ 2 - c ^ 2 := by
    nlinarith [sq_pos_of_pos hR]
  have hdet := gram_three_eq_zero (x - O) (y - O) (z - O)
  have hself (p : ℝ²) (hp : dist O p = r) : ⟪p - O, p - O⟫_ℝ = R := by
    have hh := inner_dist_identity O p p
    rw [hp, dist_self] at hh
    dsimp [R]
    nlinarith
  rw [hself x hx, hself y hy, hself z hz] at hdet
  have hproduct : 0 ≤ a * b * c := mul_nonneg (mul_nonneg hxy hxz) hyz
  nlinarith [mul_pos hR hsum]

private theorem interior_second_apex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {x y : ℝ²} (hx : x ∈ interiorPointSet (D := D) (S := S) radius)
    (hy : y ∈ interiorPointSet (D := D) (S := S) radius) (hne : x ≠ y) :
    dist S.oppApex2 x ≠ dist S.oppApex2 y := by
  classical
  have hfirst : S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi, Fin.val_zero, Fin.val_one]
  have hsecond : S.oppApex2 = S.rightOuterVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp only [SurplusCapPacket.oppApex2, SurplusCapPacket.rightOuterVertexByIndex,
        SurplusCapPacket.oppIndex1, hi, Fin.val_zero, Fin.val_one]
  have hxT := (Finset.mem_inter.mp hx).1
  have hyT := (Finset.mem_inter.mp hy).1
  rw [hfirst] at hxT hyT
  simpa only [hsecond, dist_comm] using
    S.capInterior_pair_dist_ne_rightOuter_of_selectedClass S.oppIndex1
      (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2 hne hxT hyT

/-- A rich second-apex class meets the interior anchors at most once, leaving
three anchors from which a short jointly surviving pair can be chosen. -/
private theorem exists_short_admissible_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (hradius : 0 < radius)
    (hfour : 4 ≤ (interiorPointSet (D := D) (S := S) radius).card)
    (hsecond : HasNEquidistantPointsAt 4 D.A S.oppApex2) :
    ∃ q w : ℝ², admissibleInteriorPair (D := D) (S := S) radius (q, w) ∧
      dist q w ≤ radius := by
  classical
  obtain ⟨rho, hrho, hrow⟩ := hsecond
  let I := interiorPointSet (D := D) (S := S) radius
  let K := SelectedClass D.A S.oppApex2 rho
  have hrow' : 4 ≤ K.card := hrow
  have hinter : (I ∩ K).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    by_contra hne
    apply interior_second_apex_dist_ne (Finset.mem_inter.mp hx).1
      (Finset.mem_inter.mp hy).1 hne
    exact (mem_selectedClass.mp (Finset.mem_inter.mp hx).2).2.trans
      (mem_selectedClass.mp (Finset.mem_inter.mp hy).2).2.symm
  have hthree : 2 < (I \ K).card := by
    have hsplit := Finset.card_sdiff_add_card_inter I K
    change 4 ≤ I.card at hfour
    omega
  obtain ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz⟩ := Finset.two_lt_card_iff.mp hthree
  have hxI := (Finset.mem_sdiff.mp hx).1
  have hyI := (Finset.mem_sdiff.mp hy).1
  have hzI := (Finset.mem_sdiff.mp hz).1
  have hdist (p : ℝ²) (hp : p ∈ I) : dist S.oppApex1 p = radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hp).1).2
  have hadmissible {q w : ℝ²} (hq : q ∈ I \ K) (hw : w ∈ I \ K) (hne : q ≠ w) :
      admissibleInteriorPair (D := D) (S := S) radius (q, w) := by
    refine ⟨(Finset.mem_sdiff.mp hq).1, (Finset.mem_sdiff.mp hw).1, hne,
      rho, hrho, le_trans hrow' (Finset.card_le_card ?_)⟩
    intro p hp
    obtain ⟨hpA, hpdist⟩ := mem_selectedClass.mp hp
    refine Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨?_,
      Finset.mem_erase.mpr ⟨?_, hpA⟩⟩, hpdist⟩
    · intro hpw
      have hpw' : p = w := hpw
      exact (Finset.mem_sdiff.mp hw).2 (hpw' ▸ hp)
    · intro hpq
      have hpq' : p = q := hpq
      exact (Finset.mem_sdiff.mp hq).2 (hpq' ▸ hp)
  rcases three_rays_short_pair hradius (hdist x hxI) (hdist y hyI) (hdist z hzI)
      (interior_inner_nonneg hxI hyI) (interior_inner_nonneg hxI hzI)
      (interior_inner_nonneg hyI hzI) with hshort | hshort | hshort
  · exact ⟨x, y, hadmissible hx hy hxy, hshort⟩
  · exact ⟨x, z, hadmissible hx hz hxz, hshort⟩
  · exact ⟨y, z, hadmissible hy hz hyz, hshort⟩

/-- With at least four strict-interior anchors and a fully deletion robust second
apex, the minimum admissible chord is no longer than the first-apex radius.
This is the bounded short-chord guard for the mutual double-hit exclusion. -/
theorem MinimalAdmissibleInteriorPair.dist_le_radius_of_four_le_interior_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (M : MinimalAdmissibleInteriorPair D S radius H)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    (hfour : 4 ≤ (interiorPointSet (D := D) (S := S) radius).card) :
    dist M.frontier.frontier.pair.q M.frontier.frontier.pair.w ≤ radius := by
  classical
  obtain ⟨rho, hrho, hrow⟩ :=
    hsecond.survives M.frontier.frontier.pair.q M.frontier.frontier.pair.q_mem_A
  have hsecondA : HasNEquidistantPointsAt 4 D.A S.oppApex2 := by
    refine ⟨rho, hrho, le_trans hrow (Finset.card_le_card ?_)⟩
    intro p hp
    obtain ⟨hpA, hpdist⟩ := Finset.mem_filter.mp hp
    exact Finset.mem_filter.mpr ⟨(Finset.mem_erase.mp hpA).2, hpdist⟩
  obtain ⟨q, w, ⟨hq, hw, hne, hsurvives⟩, hshort⟩ :=
    exists_short_admissible_pair M.frontier.frontier.radius_pos hfour hsecondA
  exact (M.minimal hq hw hne hsurvives).trans hshort

end Problem97.FirstApexExactFiveInteriorFrontier
