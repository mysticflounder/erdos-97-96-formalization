/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

-- Original module: Solutions.Batch3N9.N4d.FormCPEqCProducer
section Batch3N9Unit067
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
def FormCv1A3SelectorV3LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 s
  (Z.a3 : ℝ²) ∈ S.I3 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
def SelectorV2PeqCPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 r
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
theorem b3n9m067_v3_lt_v3v1_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v3 p < dist S.triangle.v3 S.triangle.v1 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v1 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v1 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m067_v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m056_v1_lt_v1v3_of_mem_I2
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m056_v1_lt_v1v3_of_mem_I2 <;> assumption
theorem b3n9m067_v1_lt_v1v2_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_v1_lt_v1v2_of_mem_I3
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_v1_lt_v1v2_of_mem_I3 <;> assumption
theorem b3n9m067_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq <;> assumption
theorem b3n9m067_signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_signedArea2_baseChord_vec2
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_signedArea2_baseChord_vec2 <;> assumption
noncomputable def b3n9m067_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m067_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m067_halfShift_injective : Function.Injective b3n9m067_halfShift := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective <;> assumption
noncomputable def b3n9m067_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m067_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m067_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m067_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m067_halfShift a) (b3n9m067_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m067_halfShift a - b3n9m067_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m067_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m067_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m067_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m067_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m067_halfShift a ∈ b3n9m067_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m067_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m067_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m067_flipY_injective : Function.Injective b3n9m067_flipY := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective <;> assumption
noncomputable def b3n9m067_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m067_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m067_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m067_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m067_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m067_flipY a) (b3n9m067_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m067_flipY a - b3n9m067_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m067_flipY a - b3n9m067_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m067_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m067_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m067_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m067_flipY a ∈ b3n9m067_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m067_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m067_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_exists_base_transportData
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_exists_base_transportData <;> assumption
theorem b3n9m067_pEqC_lower_apex_dist_contradiction
    (A B q : ℝ²) (r δ a b : ℝ) (hr : 0 < r)
    (hA : A = Problem97.CGN.vec2 0 0) (hB : B = Problem97.CGN.vec2 1 0)
    (hq : q = Problem97.CGN.vec2 (1 + a) b)
    (hcirc : a ^ 2 + b ^ 2 = r ^ 2)
    (hdot : a * Real.cos δ + b * Real.sin δ = r / 2)
    (hblo : b < 0) (hδlo : 0 < δ) (hδhi : δ < Real.pi / 3)
    (hcap : dist A q < dist A B) : False := by
  have hsin : 0 < Real.sin δ := by
    apply Real.sin_pos_of_pos_of_lt_pi hδlo
    have := Real.pi_pos; linarith
  have hcos : 0 < Real.cos δ := by
    apply Real.cos_pos_of_mem_Ioo
    constructor
    · have := Real.pi_pos; linarith
    · have := Real.pi_pos; linarith
  have ha_pos : 0 < a := by
    have h1 : 0 < a * Real.cos δ := by nlinarith only [hr, hdot, hblo, hsin]
    rcases lt_trichotomy a 0 with h | h | h
    · nlinarith only [hr, hdot, hblo, hsin, hcos, h]
    · simp [h] at h1
    · exact h
  have hAB_sq : dist A B ^ 2 = 1 := by
    rw [hA, hB, b3n9m067_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist A q ^ 2 = 1 + 2 * a + r ^ 2 := by
    rw [hA, hq, b3n9m067_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith only [hcirc]
  have h1 : 0 ≤ dist A q := dist_nonneg
  have h2 : 0 ≤ dist A B := dist_nonneg
  nlinarith only [ha_pos, hAB_sq, hAq_sq, hr, hcap, h1, h2]
abbrev PEqCLowerApexConfig
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ δ a b : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
    T q = Problem97.CGN.vec2 (1 + a) b ∧
    0 < r ∧
    a ^ 2 + b ^ 2 = r ^ 2 ∧
    a * Real.cos δ + b * Real.sin δ = r / 2 ∧
    b < 0 ∧ 0 < δ ∧ δ < Real.pi / 3
theorem pEqC_row_impossible_of_normalized_config
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.PEqCLowerApexConfig q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v3) :
    False := by
  rcases hconfig with ⟨T, tau, δ, a, b, hv1, hv3, hqT, hr, hcirc, hdot, hblo, hδlo, hδhi⟩
  have hcapT :
      dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v3) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith only [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q), dist_nonneg (x := S.triangle.v1) (y := S.triangle.v3)]

  exact b3n9m067_pEqC_lower_apex_dist_contradiction
    (T S.triangle.v1) (T S.triangle.v3) (T q) r δ a b hr
    hv1 hv3 hqT hcirc hdot hblo hδlo hδhi hcapT
theorem pEqC_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI2 : q ∈ S.I2)
    (hconfig : S.PEqCLowerApexConfig q r) :
    False :=
  S.pEqC_row_impossible_of_normalized_config hconfig (S.b3n9m067_v1_lt_v1v3_of_mem_I2 hqI2)
set_option maxHeartbeats 8000000 in
theorem pEqC_lower_apex_config_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI2 : q ∈ S.I2)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 S.triangle.v2)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v3 S.triangle.v2)
    (hsmall : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2) :
    ∃ r : ℝ, S.PEqCLowerApexConfig q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v13_ne
  rcases b3n9m067_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_3
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m067_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.PEqCLowerApexConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m067_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m067_similarityTransportComp tau0 b3n9m067_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m067_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m067_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m067_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := by
      have hxA : q ∈ A := S.CP.C2_subset (by
        unfold Problem97.FiniteEndpointShell.I2 at hqI2
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI2).2).2)
      have hqC2 : q ∈ S.CP.C2 := by
        unfold Problem97.FiniteEndpointShell.I2 at hqI2
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI2).2).2
      have hq_ne_v1 : q ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I2 at hqI2
        exact (Finset.mem_erase.mp hqI2).1
      have hq_ne_v3 : q ≠ q2 := by
        unfold Problem97.FiniteEndpointShell.I2 at hqI2
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI2).2).1
      have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
        have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
          simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_2
        have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
          simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
        have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
          simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_3
        exact MEC.signedArea2_ne_zero_of_three_dist_eq
          hv1O hv2O hv3O
          S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
      have hq_arc : signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
        have hraw : signedArea2 q q2 q1 * signedArea2 q3 q2 q1 ≤ 0 := by
          simpa [q1, q2, q3, Problem97.OnArcOpposite] using
            ((S.CP.arc_membership q hxA).2.1.mp hqC2)
        have hswapq : signedArea2 q q2 q1 = - signedArea2 q q1 q2 := by
          unfold Problem97.signedArea2
          ring
        have hswap3 : signedArea2 q3 q2 q1 = - signedArea2 q3 q1 q2 := by
          unfold Problem97.signedArea2
          ring
        rw [hswapq, hswap3] at hraw
        simpa using hraw
      have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
        exact False.elim <|
          (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v3_mem
            hq_ne_v1 hq_ne_v3 S.triangle.v13_ne hcol
      have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [hv1, hv2, b3n9m067_signedArea2_baseChord_vec2]; linarith
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) :=
            mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, b3n9m067_signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [b3n9m067_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    have hq_ne_v3 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI2
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI2).2).1
    have hv2_ne_v3 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne
    set r : ℝ := dist (T q2) (T q) with hr_def
    have hd_q : 0 < dist q2 q := by
      rw [dist_pos]; exact fun h => hq_ne_v3 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]
      exact mul_pos tau.scale_pos hd_q
    have hBq_T : dist (T q2) (T q) = r := hr_def.symm
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      simpa [q2, q3] using hBq.symm
    have hDq_T : dist (T q3) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      calc dist q3 q = dist q2 q3 := by simpa [q2, q3] using hDq
        _ = dist q2 q := by simpa [q2, q3] using hBq.symm
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    set dx : ℝ := (T q3) 0 - 1 with hdx_def
    set dy : ℝ := (T q3) 1 with hdy_def
    set a : ℝ := (T q) 0 - 1 with ha_def
    set b : ℝ := (T q) 1 with hb_def
    have hdy_pos : 0 < dy := by rw [hdy_def]; exact hq3y_T
    have hb_neg : b < 0 := by rw [hb_def]; exact hqy_T
    have hcircD : dx ^ 2 + dy ^ 2 = r ^ 2 := by
      have hsq := b3n9m067_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hdx_def, hdy_def]; nlinarith only [hsq]
    have hcircQ : a ^ 2 + b ^ 2 = r ^ 2 := by
      have hsq := b3n9m067_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [ha_def, hb_def]; nlinarith only [hsq]
    have hdot_raw : a * dx + b * dy = r ^ 2 / 2 := by
      have hsq := b3n9m067_dist_sq_eq_coord_sq_add_coord_sq (T q3) (T q)
      rw [hDq_T] at hsq
      rw [ha_def, hb_def, hdx_def, hdy_def]
      nlinarith only [hcircD, hcircQ, hsq]
    have hlong_T : (1 : ℝ) < 1 + 2 * dx + r ^ 2 := by
      have hAB_T : dist (T q1) (T q2) = r * 0 + 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hAD :
          dist (T q1) (T q2) < dist (T q1) (T q3) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hlong, hscale, this, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by rw [hAB_T]; ring
      have hAD_sq := b3n9m067_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
      rw [hv1c0, hv1c1] at hAD_sq
      have hAD_sq' : dist (T q1) (T q3) ^ 2 = 1 + 2 * dx + r ^ 2 := by
        rw [hAD_sq]; nlinarith only [hcircD, hdx_def, hdy_def]
      have hAD' : (1 : ℝ) < dist (T q1) (T q3) := by rw [hAB1] at hAD; exact hAD
      nlinarith only [hcircD, hAB_T, hAD, hAD_sq, hAD', hAD_sq', dist_nonneg (x := T q1) (y := T q3)]
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith only [hsmall, hscale, this, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hBD_T, hAB1] at hBD; exact hBD
    have hadx_big : r ^ 2 / 2 < a * dx := by
      have hbdy_neg : b * dy < 0 := mul_neg_of_neg_of_pos hb_neg hdy_pos
      linarith [hdot_raw]
    have ha_le : a ≤ r := by nlinarith only [hcircQ, hr_pos, sq_nonneg b]
    have ha_ge : -r ≤ a := by nlinarith only [hcircQ, hqy_T, ha_le, sq_nonneg b, hr_pos]
    have hdx_lb : -(r ^ 2) / 2 < dx := by nlinarith only [hlong_T]
    have hdx_gt : r / 2 < dx := by
      have ha_pos : 0 < a := by
        by_contra hanot
        have ha0 : a ≤ 0 := le_of_not_gt hanot
        have hdx_neg : dx < 0 := by
          rcases lt_trichotomy dx 0 with h | h | h
          · exact h
          · exfalso; rw [h, mul_zero] at hadx_big; nlinarith only [hadx_big, hr_pos, mul_pos hr_pos hr_pos]
          · exfalso
            have : a * dx ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha0 (le_of_lt h)
            nlinarith only [hadx_big, this, mul_pos hr_pos hr_pos]
        have hbound : a * dx ≤ -r * dx := by nlinarith only [hdot_raw, hr_lt_one, ha_ge, hq3y_T, hqy_T, hlong_T, hanot, hdx_neg]
        have hdx_lt : dx < -(r / 2) := by
          have : r ^ 2 / 2 < -r * dx := lt_of_lt_of_le hadx_big hbound
          nlinarith only [hadx_big, hbound, hr_lt_one, hr_pos, hlong_T, this]
        nlinarith only [hadx_big, hbound, hr_lt_one, hr_pos, hlong_T, hdx_lt, hdx_lb, mul_pos hr_pos hr_pos]
      have hdx_pos : 0 < dx := by
        by_contra hdxnot
        have hdx0 : dx ≤ 0 := le_of_not_gt hdxnot
        have : a * dx ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_pos) hdx0
        nlinarith only [hlong_T, hadx_big, hdxnot, this, mul_pos hr_pos hr_pos]
      have hrdx : a * dx ≤ r * dx := by nlinarith only [hr_pos, hr_lt_one, ha_le, hdx_pos]
      nlinarith only [hr_pos, hadx_big, hrdx]
    have hcos_le : dx / r ≤ 1 := by
      rw [div_le_one hr_pos]
      nlinarith only [hcircD, hr_pos, hdy_pos, sq_nonneg (dx - r), mul_pos hr_pos hr_pos]
    have hcos_ge : -1 ≤ dx / r := by
      rw [le_div_iff₀ hr_pos]
      nlinarith only [hr_pos, hdx_gt, hcircD, hdy_pos, sq_nonneg (dx + r), mul_pos hr_pos hr_pos]
    set δ : ℝ := Real.arccos (dx / r) with hδ_def
    have hcosδ : Real.cos δ = dx / r := by
      rw [hδ_def, Real.cos_arccos hcos_ge hcos_le]
    have hsinδ : Real.sin δ = dy / r := by
      rw [hδ_def, Real.sin_arccos]
      have hsq : 1 - (dx / r) ^ 2 = (dy / r) ^ 2 := by
        field_simp
        nlinarith only [hcircD]
      rw [hsq, Real.sqrt_sq (by positivity)]
    have hδ_lo : 0 < δ := by
      rw [hδ_def]
      apply Real.arccos_pos.mpr
      rw [div_lt_one hr_pos]
      nlinarith only [hcircD, hr_pos, hq3y_T, hdx_gt, hdy_pos]
    have hδ_hi : δ < Real.pi / 3 := by
      have hcos_gt_half : (1 : ℝ) / 2 < Real.cos δ := by
        rw [hcosδ, lt_div_iff₀ hr_pos]; linarith [hdx_gt]
      have hcos_third : Real.cos (Real.pi / 3) = 1 / 2 := by
        rw [Real.cos_pi_div_three]
      by_contra hnot
      have hge : Real.pi / 3 ≤ δ := le_of_not_gt hnot
      have hδ_le_pi : δ ≤ Real.pi := by
        rw [hδ_def]; exact Real.arccos_le_pi _
      have hmono : Real.cos δ ≤ Real.cos (Real.pi / 3) := by
        apply Real.cos_le_cos_of_nonneg_of_le_pi
        · positivity
        · exact hδ_le_pi
        · exact hge
      rw [hcos_third] at hmono
      linarith [hcos_gt_half, hmono]
    have hdot : a * Real.cos δ + b * Real.sin δ = r / 2 := by
      rw [hcosδ, hsinδ]
      have heq : a * (dx / r) + b * (dy / r) = (a * dx + b * dy) / r := by ring
      rw [heq, hdot_raw]
      field_simp
    have hqT : T q = Problem97.CGN.vec2 (1 + a) b := by
      rw [ha_def, hb_def]
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    refine ⟨r, T, tau, δ, a, b, hv1T, hv2T, hqT, hr_pos, hcircQ, hdot, hb_neg, hδ_lo, hδ_hi⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m067_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m067_similarityTransportComp tauBase b3n9m067_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m067_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem pEqC_row_impossible_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI2 : q ∈ S.I2)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 S.triangle.v2)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v3 S.triangle.v2)
    (hsmall : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.pEqC_lower_apex_config_of_equilateral hqI2 hBq hDq hsmall hlong
  exact S.pEqC_row_impossible_of_lower_witness hqI2 hconfig
theorem pEqC_column_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2PeqCPacket S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA3, ha3eq, hTcard, hI3sub, hC1eq, hC2eq⟩
  rcases hpacket2 with ⟨hI2sub, hpCeq, hqeqC3⟩
  let T := S.witnessClassAt_v3 s
  have hv2T : S.triangle.v2 ∈ T := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a2 : ℝ²) ∈ T ∩ S.CP.C2 ∨ (Z.b2 : ℝ²) ∈ T ∩ S.CP.C2 := by
    rcases hC2eq with hqa2 | hqb2
    · left
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hqa2] at hmem
      exact hmem
    · right
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hqb2] at hmem
      exact hmem
  obtain ⟨q, hqI2, hqT3⟩ : ∃ q : ℝ², q ∈ S.I2 ∧ q ∈ T := by
    rcases hq with hqa2 | hqb2
    · refine ⟨Z.a2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqa2).1
    · refine ⟨Z.b2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqb2).1
  have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 t := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hpCeq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hqT2 : q ∈ S.witnessClassAt_v2 t := hI2sub hqI2
  have hv2rad3 : dist S.triangle.v3 S.triangle.v2 = s := by
    simpa using (Finset.mem_filter.mp hv2T).2
  have hqrad3 : dist S.triangle.v3 q = s := by
    simpa using (Finset.mem_filter.mp hqT3).2
  have hv3rad2 : dist S.triangle.v2 S.triangle.v3 = t := by
    simpa using (Finset.mem_filter.mp hv3T2).2
  have hqrad2 : dist S.triangle.v2 q = t := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hBq : dist S.triangle.v3 q = dist S.triangle.v3 S.triangle.v2 := by
    rw [hqrad3, hv2rad3]
  have hDq : dist S.triangle.v2 q = dist S.triangle.v3 S.triangle.v2 := by
    rw [hqrad2, ← hv3rad2, dist_comm]
  have hsmall : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    have hq_lt_base : dist S.triangle.v3 q < dist S.triangle.v3 S.triangle.v1 :=
      S.b3n9m067_v3_lt_v3v1_of_mem_I2 hqI2
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 q := by rw [hBq]
      _ < dist S.triangle.v3 S.triangle.v1 := hq_lt_base
      _ = dist S.triangle.v1 S.triangle.v3 := by rw [dist_comm]
  have hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3eq] at ha3mem
      exact (Finset.mem_inter.mp ha3mem).1
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      rcases hC with ⟨y, hyI3, hv3eq, hyeq⟩
      have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hv3mem
      exact (Finset.mem_inter.mp hv3mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v3 = dist S.triangle.v1 Z.a3 := by
      have hv3dist : dist S.triangle.v1 S.triangle.v3 = r := by
        simpa using (Finset.mem_filter.mp hv3T1).2
      have ha3dist : dist S.triangle.v1 Z.a3 = r := by
        simpa using (Finset.mem_filter.mp ha3T1).2
      rw [hv3dist, ha3dist]
    have h := S.b3n9m067_v1_lt_v1v2_of_mem_I3 (q := Z.a3) hA3
    rwa [← hbase_eq] at h
  exact S.pEqC_row_impossible_of_equilateral hqI2 hBq hDq hsmall hlong
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit067

-- Original module: Solutions.Batch3N9.N4d.FormCLowerForcesV2
section Batch3N9Unit068
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
abbrev SharedCirclePointForcesV2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  ∀ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) →
    p ∈ S.witnessClassAt_v3 s →
    p ∈ S.witnessClassAt_v1 r →
    p = S.triangle.v2
set_option maxHeartbeats 2000000 in
theorem sharedCirclePointForcesV2_of_formC_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hs : 0 < s)
    (hC : S.IsFormC_v1 r)
    (hA3 : (Z.a3 : ℝ²) ∈ S.I3)
    (h_a3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s) :
    S.SharedCirclePointForcesV2 Z r s := by
  classical
  obtain ⟨-, -, h_v3eq, -⟩ := hC
  intro q hqnamed hqT3 hqT1
  by_cases hqv2 : q = S.triangle.v2
  · exact hqv2
  exfalso
  have hqI1 : q ∈ S.I1 := by
    rw [Z.hI1]
    rcases Finset.mem_insert.mp hqnamed with h | hrest
    · simp [h]
    · rcases Finset.mem_insert.mp hrest with h | h
      · simp [h]
      · exact absurd (by simpa using h) hqv2
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let a : ℝ² := Z.a3
  let center : ℝ² := S.Packet.center
  have hqA : q ∈ A := (Finset.mem_filter.mp hqT1).1
  have haC3 : a ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hA3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA3).2).2
  have haA : a ∈ A := S.CP.C3_subset haC3
  have haT1 : a ∈ S.witnessClassAt_v1 r := by
    have hamem : a ∈ ({a} : Finset ℝ²) := by simp
    rw [← h_a3eq] at hamem
    exact (Finset.mem_inter.mp hamem).1
  have haT3 : a ∈ S.witnessClassAt_v3 s := hI3sub hA3
  have hv3T1 : q2 ∈ S.witnessClassAt_v1 r := by
    have hv3mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
    rw [← h_v3eq] at hv3mem
    exact (Finset.mem_inter.mp hv3mem).1
  have hr_q1q2 : dist q1 q2 = r := by
    simpa [q1, q2] using (Finset.mem_filter.mp hv3T1).2
  have hr_q1a : dist q1 a = r := by
    simpa [q1, a] using (Finset.mem_filter.mp haT1).2
  have hr_q1q : dist q1 q = r := by
    simpa [q1] using (Finset.mem_filter.mp hqT1).2
  have hs_q2a : dist q2 a = s := by
    simpa [q2, a] using (Finset.mem_filter.mp haT3).2
  have hs_q2q : dist q2 q = s := by
    simpa [q2] using (Finset.mem_filter.mp hqT3).2
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v13_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simp [nvec]
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have horth : inner ℝ u nvec = 0 := by
    simp [nvec]
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simp [M]
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by
          dsimp [u]
          abel_nf]
        simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simp [M, u]
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hdist_sq_coeff :
      ∀ a b : ℝ, ‖a • u + b • nvec‖ ^ 2 = (a ^ 2 + b ^ 2) * ‖u‖ ^ 2 := by
    intro a b
    have horth' : inner ℝ (a • u) (b • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]
      ring
    have hnorm :
        ‖a • u + b • nvec‖ ^ 2 = ‖a • u‖ ^ 2 + ‖b • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (a • u) (b • nvec) horth'
    have hu_part : ‖a • u‖ ^ 2 = a ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖a • u‖ ^ 2 = (|a| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
        _ = |a| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = a ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    have hn_part : ‖b • nvec‖ ^ 2 = b ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖b • nvec‖ ^ 2 = (|b| * ‖u‖) ^ 2 := by
          rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
        _ = |b| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = b ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    rw [hnorm, hu_part, hn_part]
    ring
  have hpt_minus_q1 : ∀ z : ℝ²,
      z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q1 = (z - M) - (q1 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
        rw [hsum_pt z, hq1mid]
      _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z + 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
  have hpt_minus_q2 : ∀ z : ℝ²,
      z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q2 = (z - M) - (q2 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
        rw [hsum_pt z, hq2mid]
      _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z - 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
        simp [sub_eq_add_neg]
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have hdist_eq : dist center q1 = dist center q2 := by
        rw [dist_comm center q1, dist_comm center q2]
        simpa [q1, q2, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural, center] using
          S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_3.symm
      have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
        rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
        simpa using hdist_eq
      have h :=
        (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
          (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have hxc_zero : X center = 0 := by
      have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
        have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
        calc
          inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
            rw [hsum_pt center]
          _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
            rw [inner_add_left]
          _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
            rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
            simp
          _ = X center * ‖u‖ ^ 2 := by ring
      have hsqpos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
      nlinarith only [hcenter_perp, hinner, hsqpos]
    calc
      z - center = (z - M) - (center - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
        rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
      _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = X z • u + (Y z - yc) • nvec := by
        rw [← add_smul]
        rfl
  have hdist_q1_sq :
      ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
  have hdist_q2_sq :
      ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hs_sq_pos : 0 < s ^ 2 := by positivity
  have hnorm_u : ‖u‖ = r := by
    rw [← hr_q1q2, dist_eq_norm]
    simp [u, norm_sub_rev]
  have hcommon_eqs :
      ∀ z : ℝ², dist q1 z = r → dist q2 z = s →
        ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 ∧
        ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = s ^ 2 := by
    intro z hz1 hz2
    constructor
    · rw [← hdist_q1_sq z, hz1, ← hnorm_u]
    · rw [← hdist_q2_sq z, hz2]
  obtain ⟨ha_eq1, ha_eq2⟩ := hcommon_eqs a hr_q1a hs_q2a
  obtain ⟨hq_eq1, hq_eq2⟩ := hcommon_eqs q hr_q1q hs_q2q
  have hXdiff : (X q - X a) * (2 * ‖u‖ ^ 2) = 0 := by
    linear_combination hq_eq1 - hq_eq2 - ha_eq1 + ha_eq2
  have hqX_eq : X q = X a := by
    rcases mul_eq_zero.mp hXdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith only [hu_sq_pos, h]
  have hYdiff : (Y q ^ 2 - Y a ^ 2) * ‖u‖ ^ 2 = 0 := by
    linear_combination hq_eq1 - ha_eq1 - (X q + X a + 1) * ‖u‖ ^ 2 * hqX_eq
  have hqY_sq : Y q ^ 2 = Y a ^ 2 := by
    rcases mul_eq_zero.mp hYdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith only [hu_sq_pos, h]
  have hy_cases : Y q = Y a ∨ Y q = -Y a :=
    sq_eq_sq_iff_eq_or_eq_neg.mp hqY_sq
  have h2XaU : 2 * X a * ‖u‖ ^ 2 = ‖u‖ ^ 2 - s ^ 2 := by
    linear_combination ha_eq1 - ha_eq2
  rcases hy_cases with hsame | hopp
  ·
    have hqa3 : q = a := by
      have hsub : q - M = a - M := by
        calc
          q - M = X q • u + Y q • nvec := hsum_pt q
          _ = X a • u + Y a • nvec := by rw [hqX_eq, hsame]
          _ = a - M := (hsum_pt a).symm
      have hadd := congrArg (fun t : ℝ² => t + M) hsub
      simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
    have ha_not_verts : a ∉ S.triangle.verts := by
      have ha_ne_v1 : a ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I3 at hA3
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA3).2).1
      have ha_ne_v2 : a ≠ S.triangle.v2 := by
        unfold Problem97.FiniteEndpointShell.I3 at hA3
        exact (Finset.mem_erase.mp hA3).1
      have ha_ne_v3 : a ≠ q2 := by
        intro h
        have : q2 ∈ S.CP.C3 := by simpa [h] using haC3
        exact S.CP.v3_notin_C3 this
      simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
    have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
    have haI1 : a ∈ S.I1 := by simpa [hqa3] using hqI1
    have haC1 : a ∈ S.CP.C1 := by
      unfold Problem97.FiniteEndpointShell.I1 at haI1
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
    by_cases haC2 : a ∈ S.CP.C2 <;> simp [haC1, haC2, haC3] at hone_a
  ·
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A a haA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_a'
    have hradius : dist center q1 = S.Packet.radius := by
      rw [dist_comm]
      simpa [q1, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_1
    have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
      have hnonneg_a : 0 ≤ dist center a := dist_nonneg
      have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
      nlinarith only [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
    rw [hdist_center_sq a, hdist_center_sq q1, hX_q1, hY_q1] at hdist_sq
    have hyc_pos : 0 < Y a * yc := by
      nlinarith only [hs_sq_pos, ha_eq1, ha_eq2, hdist_sq, h2XaU, hu_sq_pos]
    have hq_out : dist center q > S.Packet.radius := by
      have hdist_sq_q : dist center q ^ 2 > S.Packet.radius ^ 2 := by
        rw [hdist_center_sq q]
        have hradius_sq :
            S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
          have hq1sq := hdist_center_sq q1
          rw [hradius, hX_q1, hY_q1] at hq1sq
          nlinarith only [hq1sq]
        rw [hqX_eq, hopp, hradius_sq]
        nlinarith only [hs_sq_pos, ha_eq1, ha_eq2, hdist_sq, h2XaU, hyc_pos, hu_sq_pos]
      have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      have hdist_nn : 0 ≤ dist center q := dist_nonneg
      nlinarith only [hdist_sq_q, hrad_nn, hdist_nn]
    have hdisk_q : dist center q ≤ S.Packet.radius := by
      have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A q hqA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_q'
    exact absurd hdisk_q (not_le_of_gt hq_out)
theorem selectorShape_v3_lower_forces_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r) (hs : 0 < s)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hC : S.IsFormC_v1 r)
    (hA3 : (Z.a3 : ℝ²) ∈ S.I3)
    (h_a3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    {p : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hpeq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({p} : Finset ℝ²)) :
    S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) := by
  classical
  have hforce : S.SharedCirclePointForcesV2 Z r s :=
    S.sharedCirclePointForcesV2_of_formC_lower Z hs hC hA3 h_a3eq hI3sub
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hpT3 : p ∈ S.witnessClassAt_v3 s := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  rcases Finset.mem_insert.mp hp with hpa1 | hprest
  · have hpa1' : p = Z.a1 := by simpa using hpa1
    have ha1I1 : Z.a1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have ha1T1 : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
    have hpv2 : p = S.triangle.v2 :=
      hforce p hp hpT3 (by simpa [hpa1'] using ha1T1)
    rwa [hpv2] at hpeq
  rcases Finset.mem_insert.mp hprest with hpb1 | hpv2
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    have hb1I1 : Z.b1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have hb1T1 : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
    have hpv2 : p = S.triangle.v2 :=
      hforce p hp hpT3 (by simpa [hpb1'] using hb1T1)
    rwa [hpv2] at hpeq
  · have hpv2' : p = S.triangle.v2 := by simpa using hpv2
    rwa [hpv2'] at hpeq
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit068

-- Original module: Solutions.Batch3N9.N4d.FormCcB1UpperArc
section Batch3N9Unit069
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem b3n9m069_hneg_of_cyclicShift_local
    {n : ℕ} {phi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi (i + cut)) (phi (j + cut)) (phi (k + cut)) < 0 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m054_hneg_of_cyclicShift_local
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m054_hneg_of_cyclicShift_local <;> assumption
theorem b3n9m069_supportCap_interval_of_oppositeFirst_local
    {A C : Finset ℝ²} {n : ℕ} {phi : Fin n → ℝ²}
    {u v w : ℝ²}
    (_hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite u v w x)
    (hv_mem : v ∈ C)
    (hw_mem : w ∈ C)
    {u_idx v_idx w_idx : Fin n}
    (hu : phi u_idx = u)
    (hv : phi v_idx = v)
    (hw : phi w_idx = w)
    (huv : u_idx < v_idx)
    (hvw : v_idx < w_idx) :
    ∀ x : ℝ², x ∈ C ↔ ∃ q : Fin n, v_idx ≤ q ∧ q ≤ w_idx ∧ phi q = x := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m054_supportCap_interval_of_oppositeFirst_local
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m054_supportCap_interval_of_oppositeFirst_local <;> assumption
theorem b3n9m069_c1_vertex_same_open_side_as_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI1 : p ∈ S.I1) :
    0 < signedArea2 p S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
  classical
  have hp_ne_v3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hpI1).1
  have hp_ne_v2 : p ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).1
  have hpC1 : p ∈ S.CP.C1 := by
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).2
  obtain ⟨n, hn, phi, hphi_inj, hphi_image, hccw⟩ :=
    Problem97.CGN.CGN4g0_globalBoundaryOrder_of_convexIndep S.hconv S.hnoncol
  haveI : NeZero n := ⟨by omega⟩
  let i0 : Fin n := 0
  have hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    have hij_ne : phi i ≠ phi j := by
      intro h
      exact (ne_of_lt hij) (hphi_inj h)
    have hkj_ne : phi k ≠ phi j := by
      intro h
      exact (ne_of_gt hjk) (hphi_inj h)
    have hswap : Problem97.signedArea2 (phi j) (phi i) (phi k) =
        -Problem97.signedArea2 (phi i) (phi j) (phi k) := by
      simp [Problem97.signedArea2]
      ring
    have hsign :
        SignType.sign (Problem97.signedArea2 (phi j) (phi i) (phi k)) = 1 := by
      rw [Problem97.signedArea2_sign_eq_oangle_sign (phi j) (phi i) (phi k) hij_ne hkj_ne]
      exact hccw.sign_oangle hij hjk
    have hpos : 0 < Problem97.signedArea2 (phi j) (phi i) (phi k) :=
      (sign_eq_one_iff).mp hsign
    linarith
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v1_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v3_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v2_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv3A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv2A with ⟨i3, _, hi3⟩
  let psi : Fin n → ℝ² := fun t => phi (t + i1)
  have hpsi_inj : Function.Injective psi := by
    intro a b hab
    apply (finCycle i1).injective
    exact hphi_inj hab
  have hpsi_image : Finset.univ.image psi = A := by
    calc
      Finset.univ.image psi = Finset.univ.image (fun t : Fin n => phi (t + i1)) := rfl
      _ = Finset.univ.image phi := by
        ext x
        constructor
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨t, _, rfl⟩
          exact Finset.mem_image_of_mem phi (Finset.mem_univ _)
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨q, _, rfl⟩
          refine Finset.mem_image.mpr ?_
          refine ⟨q - i1, Finset.mem_univ _, ?_⟩
          simpa [psi, finCycle] using (Equiv.apply_symm_apply (finCycle i1) q)
      _ = A := hphi_image
  have hneg_shift :
      ∀ {i j k : Fin n}, i < j → j < k →
        Problem97.signedArea2 (psi i) (psi j) (psi k) < 0 := by
    intro i j k hij hjk
    simpa [psi] using
      (b3n9m069_hneg_of_cyclicShift_local (phi := phi) hneg i1 hij hjk :
        Problem97.signedArea2 (phi (i + i1)) (phi (j + i1)) (phi (k + i1)) < 0)
  have hpsi0 : psi i0 = S.triangle.v1 := by
    simpa [psi, i0, hi1]
  have hshift_i2 : (i2 - i1) + i1 = i2 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i2)
  have hshift_i3 : (i3 - i1) + i1 = i3 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i3)
  have hi2_ne_i1 : i2 ≠ i1 := by
    intro h
    exact S.triangle.v13_ne (by simpa [hi1, hi2] using congrArg phi h.symm)
  have hi3_ne_i1 : i3 ≠ i1 := by
    intro h
    exact S.triangle.v12_ne (by simpa [hi1, hi3] using congrArg phi h.symm)
  have hi2_ne_i3 : i2 ≠ i3 := by
    intro h
    exact S.triangle.v23_ne.symm (by simpa [hi2, hi3] using congrArg phi h)
  have hi2_pos : i0 < i2 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi2_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i2] using h)
  have hi3_pos : i0 < i3 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi3_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i3] using h)
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  have hswap {a b c : ℝ²} :
      Problem97.signedArea2 a b c = -Problem97.signedArea2 a c b := by
    simp [Problem97.signedArea2]
  by_cases h23 : i2 - i1 < i3 - i1
  · have hpsi_i2 : psi (i2 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i2 - i1 ≤ q ∧ q ≤ i3 - i1 ∧ psi q = x := by
      have hC1_arc_swap :
          ∀ x ∈ A,
            x ∈ S.CP.C1 ↔ Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x := by
        intro x hxA
        have hC1_arc := (S.CP.arc_membership x hxA).1
        constructor
        · intro hx
          have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
            hC1_arc.mp hx
          unfold Problem97.OnArcOpposite at hx' ⊢
          have hxswap : signedArea2 x S.triangle.v3 S.triangle.v2 =
              -signedArea2 x S.triangle.v2 S.triangle.v3 := by
            simpa using (hswap (a := x) (b := S.triangle.v3) (c := S.triangle.v2))
          have hvswap : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 =
              -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by
            simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v3) (c := S.triangle.v2))
          calc
            signedArea2 x S.triangle.v3 S.triangle.v2 *
                signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2
                = (-signedArea2 x S.triangle.v2 S.triangle.v3) *
                    (-signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                      rw [hxswap, hvswap]
            _ = signedArea2 x S.triangle.v2 S.triangle.v3 *
                  signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by ring
            _ ≤ 0 := hx'
        · intro hx
          have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x :=
            hx
          unfold Problem97.OnArcOpposite at hx'
          have hxswap : signedArea2 x S.triangle.v2 S.triangle.v3 =
              -signedArea2 x S.triangle.v3 S.triangle.v2 := by
            simpa using (hswap (a := x) (b := S.triangle.v2) (c := S.triangle.v3))
          have hvswap : signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 =
              -signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by
            simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v2) (c := S.triangle.v3))
          have : signedArea2 x S.triangle.v2 S.triangle.v3 *
              signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
            calc
              signedArea2 x S.triangle.v2 S.triangle.v3 *
                  signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3
                  = (-signedArea2 x S.triangle.v3 S.triangle.v2) *
                      (-signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2) := by
                        rw [hxswap, hvswap]
              _ = signedArea2 x S.triangle.v3 S.triangle.v2 *
                    signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by ring
              _ ≤ 0 := hx'
          exact hC1_arc.mpr this
      simpa [psi, hshift_i2, hshift_i3] using
        b3n9m069_supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          hC1_arc_swap
          S.CP.v3_mem_C1 S.CP.v2_mem_C1
          (u_idx := i0) (v_idx := i2 - i1) (w_idx := i3 - i1)
          hpsi0 hpsi_i2 hpsi_i3 hi2_pos h23
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i2
    have hq_ne_right : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i3
    have hqgt : i2 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt3 : q < i3 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := hneg_shift hi2_pos hqgt
    have hv2_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := hneg_shift hi2_pos h23
    have hp_side : Problem97.signedArea2 p S.triangle.v1 S.triangle.v3 < 0 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      simpa [hcyc] using hp_neg
    have hv2_side :
        Problem97.signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 < 0 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      simpa [hcyc] using hv2_neg
    exact mul_pos_of_neg_of_neg hp_side hv2_side
  · have h32 : i3 - i1 < i2 - i1 := by
      have hle : i3 - i1 ≤ i2 - i1 := le_of_not_gt h23
      have hne : i3 - i1 ≠ i2 - i1 := by
        intro h
        apply hi2_ne_i3
        have h' := congrArg (fun t : Fin n => t + i1) h
        simpa [hshift_i2, hshift_i3] using h'.symm
      exact lt_of_le_of_ne hle hne
    have hpsi_i2 : psi (i2 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i3 - i1 ≤ q ∧ q ≤ i2 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        b3n9m069_supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          (fun x hxA => (S.CP.arc_membership x hxA).1) S.CP.v2_mem_C1 S.CP.v3_mem_C1
          (u_idx := i0) (v_idx := i3 - i1) (w_idx := i2 - i1)
          hpsi0 hpsi_i3 hpsi_i2 hi3_pos h32
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i3
    have hq_ne_right : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i2
    have hqgt : i3 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt2 : q < i2 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_mid :
        Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) < 0 :=
      hneg_shift (lt_trans hi3_pos hqgt) hqlt2
    have hv2_mid :
        Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) < 0 :=
      hneg_shift hi3_pos h32
    have hp_side : 0 < Problem97.signedArea2 p S.triangle.v1 S.triangle.v3 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      have hq_side : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
        have hswap_q :
            Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
          simpa using (hswap (a := psi i0) (b := psi q) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := by
          rw [← hswap_q]
          exact hp_mid
        linarith
      simpa [hcyc] using hq_side
    have hv2_side : 0 < Problem97.signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      have hv2_side' : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
        have hswap_3 :
            Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
          simpa using (hswap (a := psi i0) (b := psi (i3 - i1)) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := by
          rw [← hswap_3]
          exact hv2_mid
        linarith
      simpa [hcyc] using hv2_side'
    exact mul_pos hp_side hv2_side
theorem b3n9m069_c3_sameSide_core (p q s t c : ℝ)
    (hCT : 0 ≤ c * t)
    (hARC : t * (2 * p * t - 2 * q * s - q + t) < 0)
    (hD : p ^ 2 + q ^ 2 ≤ 1 / 4 + 2 * c * q)
    (hC : 8 * c * t = 4 * s ^ 2 + 4 * t ^ 2 - 1) :
    0 < q * t := by
  rcases lt_trichotomy t 0 with ht | ht | ht
  · have hc : c ≤ 0 := by nlinarith only [hCT, ht]
    have hARC' : 0 < 2 * p * t - 2 * q * s - q + t := by
      by_contra h; push_neg at h
      nlinarith only [hARC, h, ht, mul_nonpos_of_nonpos_of_nonneg (by linarith : (2 * p * t - 2 * q * s - q + t) ≤ 0) (by linarith : (0 : ℝ) ≤ -t)]


    by_contra hcon; push_neg at hcon
    have hcon' : 0 ≤ q := by nlinarith only [hcon, ht]
    nlinarith only [hARC, hC, hcon, hD, hARC', hcon', ht, hc, mul_nonneg (neg_nonneg.mpr ht.le) (neg_nonneg.mpr hc), sq_nonneg (p - s), mul_nonneg hcon' (neg_nonneg.mpr ht.le), mul_nonneg hcon' (neg_nonneg.mpr hc), sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]




  · exfalso; rw [ht] at hARC; simp at hARC
  · have hc : 0 ≤ c := by nlinarith only [hCT, ht]
    have hARC' : 2 * p * t - 2 * q * s - q + t < 0 := by
      by_contra h; push_neg at h
      nlinarith only [hARC, h, ht, mul_nonneg h (le_of_lt ht)]
    by_contra hcon; push_neg at hcon
    have hcon' : q ≤ 0 := by nlinarith only [hcon, ht]
    nlinarith only [hARC, hC, hcon, hD, hARC', hcon', ht, hc, mul_nonneg ht.le hc, sq_nonneg (p - s), mul_nonneg (neg_nonneg.mpr hcon') (le_of_lt ht), mul_nonneg (neg_nonneg.mpr hcon') hc, sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]




set_option maxHeartbeats 4000000 in
theorem b3n9m069_c3_vertex_same_open_side_as_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {a₃ : ℝ²}
    (ha2 : a₃ ∈ S.I3) :
    0 < signedArea2 a₃ S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  let a : ℝ² := a₃
  let center : ℝ² := S.Packet.center
  have haC2 : a ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp ha2).1
  have haA : a ∈ A := S.CP.C3_subset haC2
  have harc_le :
      signedArea2 a q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
    have hraw : signedArea2 a q1 q3 * signedArea2 q2 q1 q3 ≤ 0 :=
      (S.CP.arc_membership a haA).2.2.1 haC2
    have hswap_a : signedArea2 a q3 q1 = -signedArea2 a q1 q3 := by
      unfold Problem97.signedArea2
      ring
    have hswap_q2 : signedArea2 q2 q3 q1 = -signedArea2 q2 q1 q3 := by
      unfold Problem97.signedArea2
      ring
    rw [hswap_a, hswap_q2]
    simpa using hraw
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v2_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    ·
      apply hconv q3 (by exact_mod_cast h3A)
      have hseg : q3 ∈ segment ℝ a q1 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h⟩
    ·
      apply hconv q1 (by exact_mod_cast h1A)
      have hseg : q1 ∈ segment ℝ q3 a := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h⟩
    ·
      apply hconv a (by exact_mod_cast haA)
      have hseg : a ∈ segment ℝ q1 q3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h.symm⟩
  have hv2v3v1_ne : signedArea2 q2 q3 q1 ≠ 0 := by
    have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      (by simpa [dist_eq_norm] using hv1O)
      S.triangle.v23_ne.symm S.triangle.v12_ne.symm S.triangle.v13_ne.symm
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v13_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
  have horth : inner ℝ u nvec = 0 := by
    simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [nvec, Orientation.areaForm_rightAngleRotation_right]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  have hun : Problem97.stdOrientation.areaForm u nvec = ‖u‖ ^ 2 := by
    simpa using harea_u_right 1
  have hnu : Problem97.stdOrientation.areaForm nvec u = -‖u‖ ^ 2 := by
    rw [Problem97.stdOrientation.areaForm_swap, hun]
  have huu : Problem97.stdOrientation.areaForm u u = 0 := by
    simpa using harea_u_left 1
  have hnn : Problem97.stdOrientation.areaForm nvec nvec = 0 := by simp
  have harea_bilin : ∀ xa ya xb yb : ℝ,
      Problem97.stdOrientation.areaForm (xa • u + ya • nvec) (xb • u + yb • nvec)
        = (xa * yb - ya * xb) * ‖u‖ ^ 2 := by
    intro xa ya xb yb
    simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      smul_eq_mul, huu, hun, hnu, hnn]
    ring
  have harea_gen : ∀ z w x : ℝ²,
      signedArea2 z w x =
        ((X w - X z) * (Y x - Y z) - (Y w - Y z) * (X x - X z)) * ‖u‖ ^ 2 := by
    intro z w x
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff x z,
        harea_bilin]
  have hXc : X center = 0 := by
    have hdist_eq : dist center q1 = dist center q2 := by
      rw [dist_comm center q1, dist_comm center q2]
      simpa [q1, q2, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural, center] using
        S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_3.symm
    have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
      calc
        inner ℝ (center - M) u
            = inner ℝ (X center • u + Y center • nvec) u := by rw [hsum_pt center]
        _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X center * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    have hprod : X center * ‖u‖ ^ 2 = 0 := hinner.symm
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [M] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by dsimp [u]; abel_nf]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hX_q2 : X q2 = (1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
    change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q2 : Y q2 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
    change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    rw [hdiff z center, hXc]; simp [yc]
  have hdist_sq_coeff :
      ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
    intro x y
    have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]; ring
    have hnorm : ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
    have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, hnorm_nvec, mul_pow, sq_abs]
    rw [hnorm, hu_part, hn_part]; ring
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hradius_sq : S.Packet.radius ^ 2 = ((1 / 4 : ℝ) + yc ^ 2) * ‖u‖ ^ 2 := by
    have hr : dist center q1 = S.Packet.radius := by
      rw [dist_comm]; simpa [q1, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_1
    have := hdist_center_sq q1
    rw [hr, hX_q1, hY_q1] at this
    rw [this]; ring
  have hC1 : 8 * yc * Y q3 = 4 * (X q3) ^ 2 + 4 * (Y q3) ^ 2 - 1 := by
    have hr : dist center q3 = S.Packet.radius := by
      rw [dist_comm]; simpa [q3, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_2
    have h := hdist_center_sq q3
    rw [hr, hradius_sq] at h
    have hcancel : (X q3) ^ 2 + (Y q3 - yc) ^ 2 = (1 / 4 : ℝ) + yc ^ 2 :=
      (mul_right_cancel₀ (ne_of_gt hu_sq_pos) h).symm
    nlinarith only [hcancel]
  have hD : (X a) ^ 2 + (Y a) ^ 2 ≤ 1 / 4 + 2 * yc * Y a := by
    have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
      simpa [center] using S.Packet.disk_contains_A a haA
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      rw [dist_eq_norm, norm_sub_rev]; exact hdisk_a'
    have hsq : dist center a ^ 2 ≤ S.Packet.radius ^ 2 := by
      have h0 : 0 ≤ dist center a := dist_nonneg
      have h1 : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      nlinarith only [hdisk_a, h0, h1]
    rw [hdist_center_sq a, hradius_sq] at hsq
    have hsq' : (X a) ^ 2 + (Y a - yc) ^ 2 ≤ (1 / 4 : ℝ) + yc ^ 2 :=
      le_of_mul_le_mul_right (by linarith [hsq]) hu_sq_pos
    nlinarith only [hsq']
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hcenter_q3 : 0 ≤ yc * Y q3 := by
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_3
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_2
    have hinn : inner ℝ (q1 - q3) (q2 - q3) ≥ 0 := by
      simpa [q1, q2, q3, real_inner_comm] using S.Packet.inner_at_v2
    have hprod :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≥ 0 :=
      center_same_side_as_apex_of_nonobtuse hq1O hq2O hq3O hinn
    rw [hca, hc3] at hprod
    have hpos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
    nlinarith only [hprod, hpos]
  have hARC : Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3) < 0 := by
    have hf1 : signedArea2 a q3 q1 =
        ((X q3 - X a) * (Y q1 - Y a) - (Y q3 - Y a) * (X q1 - X a)) * ‖u‖ ^ 2 :=
      harea_gen a q3 q1
    have hf2 : signedArea2 q2 q3 q1 =
        ((X q3 - X q2) * (Y q1 - Y q2) - (Y q3 - Y q2) * (X q1 - X q2)) * ‖u‖ ^ 2 :=
      harea_gen q2 q3 q1
    rw [hf1, hf2, hX_q1, hY_q1, hX_q2, hY_q2] at harc
    have hexpand :
        ((X q3 - X a) * (0 - Y a) - (Y q3 - Y a) * (-(1 / 2) - X a)) * ‖u‖ ^ 2 *
          (((X q3 - (1 / 2)) * (0 - 0) - (Y q3 - 0) * (-(1 / 2) - (1 / 2))) * ‖u‖ ^ 2)
        = (Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3)) *
            ((1 / 2) * (‖u‖ ^ 2 * ‖u‖ ^ 2)) := by ring
    rw [hexpand] at harc
    have hpos : 0 < (1 / 2 : ℝ) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by positivity
    nlinarith only [harc, hpos]
  have hcore : 0 < Y a * Y q3 :=
    b3n9m069_c3_sameSide_core (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)
theorem b3n9m069_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq <;> assumption
noncomputable def b3n9m069_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m069_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m069_halfShift_injective : Function.Injective b3n9m069_halfShift := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective <;> assumption
noncomputable def b3n9m069_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m069_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m069_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m069_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m069_halfShift a) (b3n9m069_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m069_halfShift a - b3n9m069_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m069_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m069_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m069_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m069_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m069_halfShift a ∈ b3n9m069_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m069_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m069_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m069_flipY_injective : Function.Injective b3n9m069_flipY := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective <;> assumption
noncomputable def b3n9m069_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m069_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m069_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m069_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m069_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m069_flipY a) (b3n9m069_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m069_flipY a - b3n9m069_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m069_flipY a - b3n9m069_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m069_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m069_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m069_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m069_flipY a ∈ b3n9m069_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m069_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m069_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  classical
  let A2 : Finset ℝ² := ({q1, q2} : Finset ℝ²)
  let L2 : Problem97.CGN.OrderedCap 2 :=
    { points := ![q1, q2]
      injective := by
        intro i j hij
        fin_cases i <;> fin_cases j
        · rfl
        · exfalso
          exact hqne hij
        · exfalso
          exact hqne hij.symm
        · rfl }
  let P2 : Problem97.CGN.MecCapPacket A2 L2 :=
    { hm := by norm_num
      center := midpoint ℝ q1 q2
      radius := dist q1 q2 / 2
      radius_nonneg := by positivity
      mem_A := by
        intro t
        fin_cases t <;> simp [A2, L2]
      disk_mem := by
        intro t
        fin_cases t
        · simpa [L2, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_left (𝕜 := ℝ) q1 q2)))
        · simpa [L2, dist_comm, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_right (𝕜 := ℝ) q1 q2)))
      first_on_circle := by
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
          Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2,
          midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := by norm_num
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
            real_inner_self_eq_norm_sq] using
            sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hqne.symm))
        · exfalso
          exact Nat.not_lt_zero 1 hijval
        · exfalso
          exact Nat.lt_irrefl 1 hijval
      subchord_open_side_iff_A := by
        intro r s hrs x hxA
        have hrsval : r.val < s.val := Fin.lt_def.mp hrs
        fin_cases r <;> fin_cases s
        · exfalso
          exact Nat.lt_irrefl 0 hrsval
        · constructor
          · intro hx
            exfalso
            simp [A2] at hxA
            rcases hxA with rfl | rfl
            · simp [L2, Problem97.signedArea2] at hx
            · simp [L2, Problem97.signedArea2] at hx
          · intro hx
            rcases hx with ⟨j, hrj, hjs, _⟩
            fin_cases j <;> omega
        · exfalso
          exact Nat.not_lt_zero 1 hrsval
        · exfalso
          exact Nat.lt_irrefl 1 hrsval }
  rcases Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket P2 Hside2 Hord2 with
    ⟨T0, hT0, tau0, hModel⟩
  let LT0 : Problem97.CGN.OrderedCap 2 := L2.map T0 hT0
  let M0 : Problem97.CGN.MinorCapChainModel LT0 := Classical.choice hModel
  refine ⟨T0, tau0, ?_, ?_⟩
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m069_vec2_coord0 (x y : ℝ) : (Problem97.CGN.vec2 x y) 0 = x := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_vec2_coord0
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_vec2_coord0 <;> assumption
theorem b3n9m069_vec2_coord1 (x y : ℝ) : (Problem97.CGN.vec2 x y) 1 = y := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_vec2_coord1
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_vec2_coord1 <;> assumption
theorem b3n9m069_dist_vec2_00_10 :
    dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) = 1 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_dist_vec2_00_10
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_dist_vec2_00_10 <;> assumption
theorem b3n9m069_signedArea2_chart_base (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_signedArea2_chart_base
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_signedArea2_chart_base <;> assumption
theorem b3n9m069_v3v1_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 S.triangle.v1 = s := by
  have hmem : S.triangle.v1 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m069_v3v2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 S.triangle.v2 = s := by
  have hmem : S.triangle.v2 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m069_v3a3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 Z.a3 = s := by
  have hmem : Z.a3 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m069_v3b3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 Z.b3 = s := by
  have hmem : Z.b3 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
structure CB1NormBase {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  T : ℝ² → ℝ²
  tau : Problem97.CGN.SimilarityTransportData T
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0
  hv2y_pos : 0 < (T S.triangle.v2) 1
theorem b3n9m069_exists_v3_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v2) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v3⟩ :=
    b3n9m069_exists_base_transportData S.triangle.v1 S.triangle.v3 S.triangle.v13_ne
  have hhalf_neg : b3n9m069_halfShift (Problem97.CGN.vec2 (-1) 0) = Problem97.CGN.vec2 0 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m069_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  have hhalf_one : b3n9m069_halfShift (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m069_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  let T1 : ℝ² → ℝ² := fun x => b3n9m069_halfShift (T0 x)
  let tau1 : Problem97.CGN.SimilarityTransportData T1 :=
    b3n9m069_similarityTransportComp tau0 b3n9m069_halfShiftSimilarityTransportData
  have hT1v1 : T1 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
    change b3n9m069_halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v3 : T1 S.triangle.v3 = Problem97.CGN.vec2 1 0 := by
    change b3n9m069_halfShift (T0 S.triangle.v3) = _
    rw [hT0v3, hhalf_one]
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hbd3 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hsa0 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hbd3 hbd1 hbd2
      S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
  have hv2_off : (T1 S.triangle.v2) 1 ≠ 0 := by
    intro hzero
    have harea : signedArea2 (T1 S.triangle.v2) (T1 S.triangle.v1) (T1 S.triangle.v3) = 0 := by
      rw [hT1v1, hT1v3, b3n9m069_signedArea2_chart_base, hzero]
    have htrans := tau1.halfplane_sign S.triangle.v2 S.triangle.v1 S.triangle.v3
    rw [harea] at htrans
    have ho : tau1.orientation ≠ 0 := by
      intro h0
      have := tau1.orientation_sq
      rw [h0] at this; norm_num at this
    have hsc : tau1.scale ^ 2 ≠ 0 := pow_ne_zero 2 tau1.scale_pos.ne'
    have : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = 0 := by
      have hcoef : tau1.orientation * tau1.scale ^ 2 ≠ 0 := mul_ne_zero ho hsc
      rcases mul_eq_zero.mp htrans.symm with h | h
      · exact absurd h hcoef
      · exact h
    exact hsa0 this
  rcases lt_trichotomy ((T1 S.triangle.v2) 1) 0 with hneg | hzero | hpos
  ·
    have hflip00 : b3n9m069_flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflip10 : b3n9m069_flipY (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflipy : ∀ p : ℝ², (b3n9m069_flipY p) 1 = -(p 1) := by
      intro p
      simp [b3n9m069_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    let T2 : ℝ² → ℝ² := fun x => b3n9m069_flipY (T1 x)
    let tau2 : Problem97.CGN.SimilarityTransportData T2 :=
      b3n9m069_similarityTransportComp tau1 b3n9m069_flipYSimilarityTransportData
    refine ⟨T2, tau2, ?_, ?_, ?_⟩
    · change b3n9m069_flipY (T1 S.triangle.v1) = _; rw [hT1v1, hflip00]
    · change b3n9m069_flipY (T1 S.triangle.v3) = _; rw [hT1v3, hflip10]
    · change 0 < (b3n9m069_flipY (T1 S.triangle.v2)) 1; rw [hflipy]; linarith
  · exact absurd hzero hv2_off
  · exact ⟨T1, tau1, hT1v1, hT1v3, hpos⟩
noncomputable def cb1_normBase {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    CB1NormBase S :=
  Classical.choice (by
    obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := S.b3n9m069_exists_v3_normalized_transport
    exact ⟨⟨T, tau, hv1, hv3, hv2y_pos⟩⟩)
structure CB1V3AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  T : ℝ² → ℝ²
  tau : Problem97.CGN.SimilarityTransportData T
  c : ℝ
  sg : ℝ
  Oy : ℝ
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg
  hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy
  hcsg : c ^ 2 + sg ^ 2 = 1
  hsg_pos : 0 < sg
  hc_le : c ≤ 0
  hOy_pos : 0 < Oy
  hmec : 2 * sg * Oy = 1 + c
  hcirc_v1 : dist (T S.triangle.v3) (T S.triangle.v1) = 1
  hcirc_v2 : dist (T S.triangle.v3) (T S.triangle.v2) = 1
  hcirc_a3 : dist (T S.triangle.v3) (T Z.a3) = 1
  hcirc_b3 : dist (T S.triangle.v3) (T Z.b3) = 1
  ha3_y : 0 < (T Z.a3) 1
  hb3_y : 0 < (T Z.b3) 1
  hv3_on_mec : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2
  hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2
  ha2_y : (T Z.a2) 1 ≤ 0
  hb2_y : (T Z.b2) 1 ≤ 0
theorem b3n9m069_chart_signedArea_eq_coord1 {T : ℝ² → ℝ²}
    {v1 v3 p : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv3 : T v3 = Problem97.CGN.vec2 1 0) :
    signedArea2 (T p) (T v1) (T v3) = (T p) 1 := by
  rw [hv1, hv3, b3n9m069_signedArea2_chart_base]
theorem b3n9m069_chart_y_product {T : ℝ² → ℝ²}
    (tau : Problem97.CGN.SimilarityTransportData T) {v1 v3 p q : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv3 : T v3 = Problem97.CGN.vec2 1 0) :
    (T p) 1 * (T q) 1 =
      tau.scale ^ 4 *
        (signedArea2 p v1 v3 * signedArea2 q v1 v3) := by
  have hp := tau.halfplane_sign p v1 v3
  have hq := tau.halfplane_sign q v1 v3
  rw [b3n9m069_chart_signedArea_eq_coord1 hv1 hv3] at hp
  rw [b3n9m069_chart_signedArea_eq_coord1 hv1 hv3] at hq
  have hkey : (T p) 1 * (T q) 1
      = (tau.orientation ^ 2 * tau.scale ^ 4) *
        (signedArea2 p v1 v3 * signedArea2 q v1 v3) := by
    rw [hp, hq]; ring
  rw [hkey, tau.orientation_sq, one_mul]
theorem b3n9m069_frame_c3_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hxI2 : x ∈ S.I2) :
    (T x) 1 ≤ 0 := by
  have hxC2 : x ∈ S.CP.C2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hopp_raw : Problem97.OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
    ((S.CP.arc_membership x hxA).2.1.mp hxC2)
  unfold Problem97.OnArcOpposite at hopp_raw
  have hopp :
      signedArea2 x S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≤ 0 := by
    have hxswap :
        signedArea2 x S.triangle.v1 S.triangle.v3 =
          -signedArea2 x S.triangle.v3 S.triangle.v1 := by
      simp [signedArea2]
    have hvswap :
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 =
          -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by
      simp [signedArea2]
    calc
      signedArea2 x S.triangle.v1 S.triangle.v3 *
          signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3
          = (-signedArea2 x S.triangle.v3 S.triangle.v1) *
              (-signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                rw [hxswap, hvswap]
      _ = signedArea2 x S.triangle.v3 S.triangle.v1 *
            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by ring
      _ ≤ 0 := hopp_raw
  have hy := b3n9m069_chart_y_product (T := T) tau (p := x) (q := S.triangle.v2) hv1 hv3
  have hle : (T x) 1 * (T S.triangle.v2) 1 ≤ 0 := by
    rw [hy]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith only [hle, hsg_pos]
theorem b3n9m069_frame_c2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hpI3 : p ∈ S.I3) :
    0 < (T p) 1 := by
  have hside := S.b3n9m069_c3_vertex_same_open_side_as_v2 hpI3
  have hy := b3n9m069_chart_y_product (T := T) tau (p := p) (q := S.triangle.v2) hv1 hv3
  have hpos : 0 < (T p) 1 * (T S.triangle.v2) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith only [hpos, hsg_pos]
theorem b3n9m069_frame_a3_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1) :
    0 < (T Z.a3) 1 :=
  S.b3n9m069_frame_c2_upper tau hv1 hv3 hsg_pos (by rw [Z.hI3]; simp)
theorem b3n9m069_frame_disk
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {Oy R : ℝ}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hR : R = tau.scale * S.Packet.radius)
    (hRsq : R ^ 2 = 1 / 4 + Oy ^ 2) :
    ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_frame_disk
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_frame_disk <;> assumption
set_option maxHeartbeats 4000000 in
theorem b3n9m069_cb1_v3AnchorFrame_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (T : ℝ² → ℝ²) (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hv2y_pos : 0 < (T S.triangle.v2) 1)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = s)
    (hv3v2 : dist S.triangle.v3 S.triangle.v2 = s)
    (hv3a3 : dist S.triangle.v3 Z.a3 = s)
    (hv3b3 : dist S.triangle.v3 Z.b3 = s) :
    ∃ c sg Oy : ℝ,
      T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg ∧
      T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy ∧
      c ^ 2 + sg ^ 2 = 1 ∧ 0 < sg ∧ c ≤ 0 ∧ 0 < Oy ∧ 2 * sg * Oy = 1 + c ∧
      dist (T S.triangle.v3) (T S.triangle.v1) = 1 ∧
      dist (T S.triangle.v3) (T S.triangle.v2) = 1 ∧
      dist (T S.triangle.v3) (T Z.a3) = 1 ∧
      dist (T S.triangle.v3) (T Z.b3) = 1 ∧
      0 < (T Z.a3) 1 ∧
      0 < (T Z.b3) 1 ∧
      dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 ∧
      (∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2) ∧
      (T Z.a2) 1 ≤ 0 ∧ (T Z.b2) 1 ≤ 0 := by
  classical
  have hs_pos : 0 < s := by
    rw [← hv3v1]; exact dist_pos.mpr S.triangle.v13_ne.symm
  have hscale : tau.scale * s = 1 := by
    have hbase : dist (T S.triangle.v3) (T S.triangle.v1) = tau.scale * s := by
      rw [tau.dist_image, hv3v1]
    have hone : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
      rw [hv3, hv1, dist_comm, b3n9m069_dist_vec2_00_10]
    rw [← hbase, hone]
  set c := (T S.triangle.v2) 0 - 1 with hc_def
  set sg := (T S.triangle.v2) 1 with hsg_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  have hv2 : T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg := by
    ext i
    fin_cases i
    · change (T S.triangle.v2) 0 = (Problem97.CGN.vec2 (1 + c) sg) 0
      rw [b3n9m069_vec2_coord0, hc_def]; ring
    · change (T S.triangle.v2) 1 = (Problem97.CGN.vec2 (1 + c) sg) 1
      rw [b3n9m069_vec2_coord1, hsg_def]
  have hsg_pos : 0 < sg := hv2y_pos
  have hcirc_v1 : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
    rw [tau.dist_image, hv3v1, hscale]
  have hcirc_v2 : dist (T S.triangle.v3) (T S.triangle.v2) = 1 := by
    rw [tau.dist_image, hv3v2, hscale]
  have hcirc_a3 : dist (T S.triangle.v3) (T Z.a3) = 1 := by
    rw [tau.dist_image, hv3a3, hscale]
  have hcirc_b3 : dist (T S.triangle.v3) (T Z.b3) = 1 := by
    rw [tau.dist_image, hv3b3, hscale]
  have hc3sq : dist (T S.triangle.v3) (T S.triangle.v2) ^ 2 = 1 := by
    rw [hcirc_v2]; norm_num
  set R := tau.scale * S.Packet.radius with hR_def
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hbd3 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  set ox := (T S.Packet.center) 0 with hox_def
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, hv1, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, hv3, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    have h' : ((1 : ℝ) - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by nlinarith only [h]
    exact h'
  have e3 : (1 + c - ox) ^ 2 + (sg - Oy) ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, hv2, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    exact h
  have ec : c ^ 2 + sg ^ 2 = 1 := by
    have h := hc3sq
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, hv3, hv2, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1,
      b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    nlinarith only [h]
  clear_value c sg Oy ox R
  have hox : ox = 1 / 2 := by nlinarith only [e1, e2]
  have hcsg : c ^ 2 + sg ^ 2 = 1 := ec
  have hmec : 2 * sg * Oy = 1 + c := by nlinarith only [e1, e3, ec, e2, hox]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith only [e1, e2, hox]
  have hv3_on_mec : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 := by
    rw [hb3sq, hRsq]
  have hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy := by
    ext i
    fin_cases i
    · change (T S.Packet.center) 0 = (Problem97.CGN.vec2 (1 / 2) Oy) 0
      rw [b3n9m069_vec2_coord0, ← hox_def]; exact hox
    · change (T S.Packet.center) 1 = (Problem97.CGN.vec2 (1 / 2) Oy) 1
      rw [b3n9m069_vec2_coord1, hOy_def]
  have hc_le : c ≤ 0 := by
    have hpol : dist S.triangle.v1 S.triangle.v2 ^ 2 ≤ s ^ 2 + s ^ 2 := by
      have hinner := S.Packet.inner_at_v3
      have hinner' : 0 ≤ inner ℝ (S.triangle.v2 - S.triangle.v3)
          (S.triangle.v1 - S.triangle.v3) := by
        simpa [real_inner_comm] using hinner
      have hexp := norm_sub_sq_real (S.triangle.v2 - S.triangle.v3)
        (S.triangle.v1 - S.triangle.v3)
      have hrw : S.triangle.v2 - S.triangle.v3 - (S.triangle.v1 - S.triangle.v3)
          = S.triangle.v2 - S.triangle.v1 := by abel
      rw [hrw] at hexp
      have h1 : ‖S.triangle.v2 - S.triangle.v1‖ = dist S.triangle.v1 S.triangle.v2 := by
        rw [← dist_eq_norm, dist_comm]
      have h2 : ‖S.triangle.v2 - S.triangle.v3‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv3v2]
      have h3 : ‖S.triangle.v1 - S.triangle.v3‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv3v1]
      rw [h1, h2, h3] at hexp
      nlinarith only [hinner', hexp]
    have htrans : dist (T S.triangle.v1) (T S.triangle.v2) ^ 2 ≤ 2 := by
      rw [tau.dist_image]
      calc (tau.scale * dist S.triangle.v1 S.triangle.v2) ^ 2
          = tau.scale ^ 2 * dist S.triangle.v1 S.triangle.v2 ^ 2 := by ring
        _ ≤ tau.scale ^ 2 * (s ^ 2 + s ^ 2) :=
            mul_le_mul_of_nonneg_left hpol (by positivity)
        _ = (tau.scale * s) ^ 2 + (tau.scale * s) ^ 2 := by ring
        _ = 2 := by rw [hscale]; norm_num
    have hexpand : dist (T S.triangle.v1) (T S.triangle.v2) ^ 2 = (1 + c) ^ 2 + sg ^ 2 := by
      rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, hv1, hv2, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1,
        b3n9m069_vec2_coord0, b3n9m069_vec2_coord1]
      ring
    rw [hexpand] at htrans
    nlinarith only [ec, htrans, hcsg]
  have hOy_pos : 0 < Oy := by
    have hcgt : -1 < c := by nlinarith only [e1, e2, hRsq, e3, ec, hmec, hv2y_pos, hcsg, hsg_pos]
    have h1c : 0 < 1 + c := by linarith
    have h2sg : 0 < 2 * sg := by linarith
    have hprod : 0 < 2 * sg * Oy := by rw [hmec]; exact h1c
    nlinarith only [hv2y_pos, hmec, hcgt, hprod, h2sg]
  have hv2y_pos' : 0 < (T S.triangle.v2) 1 := hsg_def ▸ hsg_pos
  have ha3_y : 0 < (T Z.a3) 1 := S.b3n9m069_frame_a3_upper Z tau hv1 hv3 hv2y_pos'
  have hb3_y : 0 < (T Z.b3) 1 :=
    S.b3n9m069_frame_c2_upper tau hv1 hv3 hv2y_pos' (by rw [Z.hI3]; simp)
  have ha2_y : (T Z.a2) 1 ≤ 0 :=
    S.b3n9m069_frame_c3_lower tau hv1 hv3 hv2y_pos' (by rw [Z.hI2]; simp)
  have hb2_y : (T Z.b2) 1 ≤ 0 :=
    S.b3n9m069_frame_c3_lower tau hv1 hv3 hv2y_pos' (by rw [Z.hI2]; simp)
  have hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 :=
    S.b3n9m069_frame_disk tau hR_def hRsq
  exact ⟨c, sg, Oy, hv2, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v2,
    hcirc_a3, hcirc_b3, ha3_y, hb3_y, hv3_on_mec, hdisk, ha2_y, hb2_y⟩
noncomputable def cb1_v3AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    CB1V3AnchorFrame S Z := by
  classical
  obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := S.cb1_normBase
  have hfacts := S.b3n9m069_cb1_v3AnchorFrame_facts Z T tau hv1 hv3 hv2y_pos
      (S.b3n9m069_v3v1_dist_of_hexact Z hexact)
      (S.b3n9m069_v3v2_dist_of_hexact Z hexact)
      (S.b3n9m069_v3a3_dist_of_hexact Z hexact)
      (S.b3n9m069_v3b3_dist_of_hexact Z hexact)
  set c := hfacts.choose with hc_eq
  set sg := hfacts.choose_spec.choose with hsg_eq
  set Oy := hfacts.choose_spec.choose_spec.choose with hOy_eq
  obtain ⟨hv2, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v2,
      hcirc_a3, hcirc_b3, ha3_y, hb3_y, hv3_on_mec, hdisk, ha2_y, hb2_y⟩ :=
    hfacts.choose_spec.choose_spec.choose_spec
  exact
    { T := T
      tau := tau
      c := c
      sg := sg
      Oy := Oy
      hv1 := hv1
      hv3 := hv3
      hv2 := hv2
      hO := hO
      hcsg := hcsg
      hsg_pos := hsg_pos
      hc_le := hc_le
      hOy_pos := hOy_pos
      hmec := hmec
      hcirc_v1 := hcirc_v1
      hcirc_v2 := hcirc_v2
      hcirc_a3 := hcirc_a3
      hcirc_b3 := hcirc_b3
      ha3_y := ha3_y
      hb3_y := hb3_y
      hv3_on_mec := hv3_on_mec
      hdisk := hdisk
      ha2_y := ha2_y
      hb2_y := hb2_y }
theorem b3n9m069_v1_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∈ A := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_v1_mem_A
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m060_v1_mem_A <;> assumption
theorem b3n9m069_v2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v2 ∈ A :=
  S.triangle.v2_mem
theorem b3n9m069_a3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.a3 ∈ A := by
  have h : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
  exact S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)
theorem b3n9m069_b3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.b3 ∈ A := by
  have h : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
  exact S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)
namespace CB1V3AnchorFrame
variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}
theorem T_injective (F : CB1V3AnchorFrame S Z) : Function.Injective F.T := by
  intro a b hab
  by_contra hne
  have hd : 0 < dist a b := dist_pos.mpr hne
  have heq : dist (F.T a) (F.T b) = F.tau.scale * dist a b := F.tau.dist_image a b
  rw [hab, dist_self] at heq
  have hpos : 0 < F.tau.scale * dist a b := mul_pos F.tau.scale_pos hd
  rw [← heq] at hpos
  exact lt_irrefl 0 hpos
theorem x_dist_le_anchor (F : CB1V3AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) := by
  have hX := F.hdisk x hx
  have hv3sq := F.hv3_on_mec
  have h : dist (F.T x) (F.T S.Packet.center) ^ 2
      ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ^ 2 := by
    rw [hv3sq]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.T x) (F.T S.Packet.center) := dist_nonneg
  have hv3nn : (0 : ℝ) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) := dist_nonneg
  nlinarith only [hX, hv3sq, hv3nn, h, hXnn]
theorem a3_x_le_two (F : CB1V3AnchorFrame S Z) : (F.T Z.a3) 0 ≤ 2 := by
  have h := F.hcirc_a3
  have hsq : dist (F.T S.triangle.v3) (F.T Z.a3) ^ 2 = 1 := by rw [h]; norm_num
  rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.hv3, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at hsq
  nlinarith only [hsq, sq_nonneg ((F.T Z.a3) 1)]
theorem circ_disk_x_floor (F : CB1V3AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.T S.triangle.v3) (F.T p) = 1) :
    (F.T p) 0 ≤ 2 * F.Oy * (F.T p) 1 := by
  have hunit : ((F.T p) 0 - 1) ^ 2 + (F.T p) 1 ^ 2 = 1 := by
    have h : dist (F.T S.triangle.v3) (F.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.hv3, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    nlinarith only [h]
  have hdisk := F.hdisk p hpA
  rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.hO, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at hdisk
  nlinarith only [hunit, hdisk]
theorem bisectorKill_args_v1a3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T Z.a3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.a3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.a3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv1c0 : (F.T S.triangle.v1) 0 = 0 := by rw [F.hv1, b3n9m069_vec2_coord0]
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m069_vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have ha3x : (F.T Z.a3) 0 ≤ 2 := F.a3_x_le_two
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hOy : 0 < F.Oy := F.hOy_pos
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_a3]
  · rw [hv1c1, hv3c1]; linarith [ha3y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [ha3x, ha3y, hOy]
  ·
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.a3) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [ha3y, hcontr]
  ·
    intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v2a3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v2) = dist (F.T S.triangle.v3) (F.T Z.a3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.a3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v2 ≠ F.T Z.a3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 + F.c := by rw [F.hv2, b3n9m069_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have ha3x : (F.T Z.a3) 0 ≤ 2 := F.a3_x_le_two
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hOy : 0 < F.Oy := F.hOy_pos
  have hsg : 0 < F.sg := F.hsg_pos
  have hmec : 2 * F.sg * F.Oy = 1 + F.c := F.hmec
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_a3]
  · rw [hv2c1, hv3c1]; linarith [hsg, ha3y]
  · rw [hv2c0, hv2c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [ha3x, hmec, ha3y, hOy]
  ·
    intro heq
    have ha3I3 : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
    have hne : S.triangle.v2 ≠ Z.a3 :=
      fun h => (Finset.mem_erase.mp ha3I3).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v1b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m069_vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_v1_mem_A) F.hcirc_v1
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_b3]
  · rw [hv1c1, hv3c1]; linarith [hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [hv1floor, hb3floor, hv1c1]
  ·
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.b3) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [hb3y, hcontr]
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v2b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v2) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v2 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have hsg : 0 < F.sg := F.hsg_pos
  have hv2floor : (F.T S.triangle.v2) 0 ≤ 2 * F.Oy * (F.T S.triangle.v2) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_v2_mem_A) F.hcirc_v2
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_b3]
  · rw [hv2c1, hv3c1]; linarith [hsg, hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [hv2floor, hb3floor]
  ·
    intro heq
    have hb3I3 : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
    have hne : S.triangle.v2 ≠ Z.b3 :=
      fun h => (Finset.mem_erase.mp hb3I3).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_a3b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T Z.a3) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T Z.a3) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T Z.a3) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T Z.a3 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have ha3floor : (F.T Z.a3) 0 ≤ 2 * F.Oy * (F.T Z.a3) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_a3_mem_A Z) F.hcirc_a3
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a3, F.hcirc_b3]
  · rw [hv3c1]; linarith [ha3y, hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [ha3floor, hb3floor]
  ·
    intro heq
    have ha3_ne_b3 : Z.a3 ≠ Z.b3 := by
      have hI3card : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by
        simpa [Z.hI3] using S.I3_card_eq_two
      intro h; simp [h] at hI3card
    exact ha3_ne_b3 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v1v2 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T S.triangle.v2) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T S.triangle.v2 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m069_vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, b3n9m069_vec2_coord1]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, b3n9m069_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m069_vec2_coord1]
  have hsg : 0 < F.sg := F.hsg_pos
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_v1_mem_A) F.hcirc_v1
  have hv2floor : (F.T S.triangle.v2) 0 ≤ 2 * F.Oy * (F.T S.triangle.v2) 1 :=
    F.circ_disk_x_floor (S.b3n9m069_v2_mem_A) F.hcirc_v2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_v2]
  · rw [hv1c1, hv3c1]; linarith [hsg, hv2c1]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [hv1floor, hv2floor, hv1c1]
  ·
    intro heq
    exact S.triangle.v12_ne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
end CB1V3AnchorFrame
theorem b3n9m069_frame_c1_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hpI1 : p ∈ S.I1) :
    0 < (T p) 1 := by
  have hside := S.b3n9m069_c1_vertex_same_open_side_as_v2 hpI1
  have hy := b3n9m069_chart_y_product (T := T) tau (p := p) (q := S.triangle.v2) hv1 hv3
  have hpos : 0 < (T p) 1 * (T S.triangle.v2) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith only [hpos, hsg_pos]
structure CB1V1AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  base : CB1V3AnchorFrame S Z
  ha1A : Z.a1 ∈ A
  hb1A : Z.b1 ∈ A
  hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1
  hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1
  hcirc_v3 : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1
  ha1_y : 0 < (base.T Z.a1) 1
  hb1_y : 0 < (base.T Z.b1) 1
noncomputable def cb1_v1AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {r s : ℝ}
    (hC2pin : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    CB1V1AnchorFrame S Z := by
  classical
  let base := S.cb1_v3AnchorFrame_of_hexact Z hexact
  have hv3_in : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v3 ∈ S.witnessClassAt_v1 r ∩ S.CP.C2 := by
      rw [hC2pin]; simp
    exact (Finset.mem_inter.mp hmem).1
  have hv1v3 : dist S.triangle.v1 S.triangle.v3 = r :=
    (Finset.mem_filter.mp hv3_in).2
  have hr : 0 < r := by
    rw [← hv1v3]; exact dist_pos.mpr S.triangle.v13_ne
  have hcore := S.coreSelector_v1 hr hcard
  have hI1sub : S.I1 ⊆ S.witnessClassAt_v1 r := hcore.2.1
  have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
  have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
  have ha1_in : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
  have hb1_in : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
  have ha1A : Z.a1 ∈ A := (Finset.mem_filter.mp ha1_in).1
  have hb1A : Z.b1 ∈ A := (Finset.mem_filter.mp hb1_in).1
  have hv1a1 : dist S.triangle.v1 Z.a1 = r := (Finset.mem_filter.mp ha1_in).2
  have hv1b1 : dist S.triangle.v1 Z.b1 = r := (Finset.mem_filter.mp hb1_in).2
  have hscale : base.tau.scale * r = 1 := by
    have hbase : dist (base.T S.triangle.v1) (base.T S.triangle.v3)
        = base.tau.scale * r := by
      rw [base.tau.dist_image, hv1v3]
    have hone : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1 := by
      rw [base.hv1, base.hv3, b3n9m069_dist_vec2_00_10]
    rw [← hbase, hone]
  have hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1 := by
    rw [base.tau.dist_image, hv1a1, hscale]
  have hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1 := by
    rw [base.tau.dist_image, hv1b1, hscale]
  have hcirc_v3 : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1 := by
    rw [base.tau.dist_image, hv1v3, hscale]
  have hsg_pos : 0 < (base.T S.triangle.v2) 1 := by rw [base.hv2, b3n9m069_vec2_coord1]; exact base.hsg_pos
  have ha1_y : 0 < (base.T Z.a1) 1 :=
    S.b3n9m069_frame_c1_upper base.tau base.hv1 base.hv3 hsg_pos ha1I1
  have hb1_y : 0 < (base.T Z.b1) 1 :=
    S.b3n9m069_frame_c1_upper base.tau base.hv1 base.hv3 hsg_pos hb1I1
  exact
    { base := base
      ha1A := ha1A
      hb1A := hb1A
      hcirc_a1 := hcirc_a1
      hcirc_b1 := hcirc_b1
      hcirc_v3 := hcirc_v3
      ha1_y := ha1_y
      hb1_y := hb1_y }
namespace CB1V1AnchorFrame
variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}
theorem x_dist_le_anchor (F : CB1V1AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.base.T x) (F.base.T S.Packet.center)
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := by
  have hX := F.base.hdisk x hx
  have hv1_on_mec : dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2
      = 1 / 4 + F.base.Oy ^ 2 := by
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, F.base.hO,
      b3n9m069_vec2_coord0, b3n9m069_vec2_coord1, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1]
    ring
  have h : dist (F.base.T x) (F.base.T S.Packet.center) ^ 2
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2 := by
    rw [hv1_on_mec]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.base.T x) (F.base.T S.Packet.center) := dist_nonneg
  have hv1nn : (0 : ℝ) ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := dist_nonneg
  nlinarith only [hX, hv1_on_mec, hv1nn, h, hXnn]
theorem circ_disk_x_floor (F : CB1V1AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    1 - 2 * F.base.Oy * (F.base.T p) 1 ≤ (F.base.T p) 0 := by
  have hunit : (F.base.T p) 0 ^ 2 + (F.base.T p) 1 ^ 2 = 1 := by
    have h : dist (F.base.T S.triangle.v1) (F.base.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at h
    nlinarith only [h]
  have hdisk := F.base.hdisk p hpA
  rw [b3n9m069_dist_sq_eq_coord_sq_add_coord_sq, F.base.hO, b3n9m069_vec2_coord0, b3n9m069_vec2_coord1] at hdisk
  nlinarith only [hunit, hdisk]
theorem T_injective (F : CB1V1AnchorFrame S Z) : Function.Injective F.base.T :=
  F.base.T_injective
theorem bisectorKill_args_a1b1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T Z.a1)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T Z.a1 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m069_vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a1, F.hcirc_b1]
  · rw [hv1c1]; linarith [ha1y, hb1y]
  · rw [hv1c0, hv1c1, hOc0, hOc1]
    nlinarith only [ha1floor, hb1floor, ha1y, hb1y, hOy]
  ·
    intro heq
    have ha1_ne_b1 : Z.a1 ≠ Z.b1 := by
      have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
        simpa [Z.hI1] using S.I1_card_eq_two
      intro h; simp [h] at hI1card
    exact ha1_ne_b1 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v3a1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v3)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.a1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v3) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v3 ≠ F.base.T Z.a1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord1]
  have hv3c0 : (F.base.T S.triangle.v3) 0 = 1 := by rw [F.base.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.base.T S.triangle.v3) 1 = 0 := by rw [F.base.hv3, b3n9m069_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m069_vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_a1]
  · rw [hv1c1, hv3c1]; linarith [ha1y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [ha1floor, ha1y, hOy]
  · refine ⟨?_, ?_⟩
    ·
      intro heq
      have ha1_ne_v3 : Z.a1 ≠ S.triangle.v3 := by
        have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
        exact (Finset.mem_erase.mp ha1I1).1
      exact ha1_ne_v3 (F.T_injective heq.symm)
    · intro heq
      exact hxne (F.T_injective heq)
theorem bisectorKill_args_v3b1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v3)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v3) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v3 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m069_vec2_coord1]
  have hv3c0 : (F.base.T S.triangle.v3) 0 = 1 := by rw [F.base.hv3, b3n9m069_vec2_coord0]
  have hv3c1 : (F.base.T S.triangle.v3) 1 = 0 := by rw [F.base.hv3, b3n9m069_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m069_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m069_vec2_coord1]
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_b1]
  · rw [hv1c1, hv3c1]; linarith [hb1y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith only [hb1floor, hb1y, hOy]
  · refine ⟨?_, ?_⟩
    ·
      intro heq
      have hb1_ne_v3 : Z.b1 ≠ S.triangle.v3 := by
        have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
        exact (Finset.mem_erase.mp hb1I1).1
      exact hb1_ne_v3 (F.T_injective heq.symm)
    · intro heq
      exact hxne (F.T_injective heq)
end CB1V1AnchorFrame
theorem b3n9m069_classify_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I1) :
    p ∈ A ∧ p ∈ S.CP.C1 ∧ p ∉ S.CP.C3 ∧ p ∉ S.CP.C2 := by
  have hC1 : p ∈ S.CP.C1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hp).1
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne1 : p ≠ S.triangle.v1 := fun h => S.CP.v1_notin_C1 (h ▸ hC1)
  have hA : p ∈ A := S.CP.C1_subset hC1
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, hC1, ?_, ?_⟩
  · intro hC3; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
theorem b3n9m069_classify_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I3) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∈ S.CP.C3 ∧ p ∉ S.CP.C2 := by
  have hC3 : p ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp hp).1
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne3 : p ≠ S.triangle.v3 := fun h => S.CP.v3_notin_C3 (h ▸ hC3)
  have hA : p ∈ A := S.CP.C3_subset hC3
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, hC3, ?_⟩
  · intro hC1; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC3, hC2, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone
theorem b3n9m069_classify_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I2) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∉ S.CP.C3 ∧ p ∈ S.CP.C2 := by
  have hC2 : p ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp hp).1
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne2 : p ≠ S.triangle.v2 := fun h => S.CP.v2_notin_C2 (h ▸ hC2)
  have hA : p ∈ A := S.CP.C2_subset hC2
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, ?_, hC2⟩
  · intro hC1; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC3, hC2, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone
theorem b3n9m069_ne_of_mem_not_mem {α : Type*} {C : Finset α} {p q : α}
    (hp : p ∈ C) (hq : q ∉ C) : p ≠ q := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m061_ne_of_mem_not_mem
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m061_ne_of_mem_not_mem <;> assumption
theorem b3n9m069_cb1_A_eq_named {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    A = ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.a2, Z.b2}
      : Finset ℝ²) := by
  classical
  have ha1 := S.b3n9m069_classify_I1 (show Z.a1 ∈ S.I1 by rw [Z.hI1]; simp)
  have hb1 := S.b3n9m069_classify_I1 (show Z.b1 ∈ S.I1 by rw [Z.hI1]; simp)
  have ha3 := S.b3n9m069_classify_I3 (show Z.a3 ∈ S.I3 by rw [Z.hI3]; simp)
  have hb3 := S.b3n9m069_classify_I3 (show Z.b3 ∈ S.I3 by rw [Z.hI3]; simp)
  have ha2 := S.b3n9m069_classify_I2 (show Z.a2 ∈ S.I2 by rw [Z.hI2]; simp)
  have hb2 := S.b3n9m069_classify_I2 (show Z.b2 ∈ S.I2 by rw [Z.hI2]; simp)
  have v1c1 : S.triangle.v1 ∉ S.CP.C1 := S.CP.v1_notin_C1
  have v1c2 : S.triangle.v1 ∈ S.CP.C3 := S.CP.v1_mem_C3
  have v1c3 : S.triangle.v1 ∈ S.CP.C2 := S.CP.v1_mem_C2
  have v3c1 : S.triangle.v3 ∈ S.CP.C1 := S.CP.v3_mem_C1
  have v3c2 : S.triangle.v3 ∉ S.CP.C3 := S.CP.v3_notin_C3
  have v3c3 : S.triangle.v3 ∈ S.CP.C2 := S.CP.v3_mem_C2
  have v2c1 : S.triangle.v2 ∈ S.CP.C1 := S.CP.v2_mem_C1
  have v2c2 : S.triangle.v2 ∈ S.CP.C3 := S.CP.v2_mem_C3
  have v2c3 : S.triangle.v2 ∉ S.CP.C2 := S.CP.v2_notin_C2
  obtain ⟨_, a1c1, a1c2, a1c3⟩ := ha1
  obtain ⟨_, b1c1, b1c2, b1c3⟩ := hb1
  obtain ⟨_, a3c1, a3c2, a3c3⟩ := ha3
  obtain ⟨_, b3c1, b3c2, b3c3⟩ := hb3
  obtain ⟨_, a2c1, a2c2, a2c3⟩ := ha2
  obtain ⟨_, b2c1, b2c2, b2c3⟩ := hb2
  have e_a1b1 : Z.a1 ≠ Z.b1 := by
    have h : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by simpa [Z.hI1] using S.I1_card_eq_two
    intro h'; simp [h'] at h
  have e_a3b3 : Z.a3 ≠ Z.b3 := by
    have h : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by simpa [Z.hI3] using S.I3_card_eq_two
    intro h'; simp [h'] at h
  have e_a2b2 : Z.a2 ≠ Z.b2 := by
    have h : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by simpa [Z.hI2] using S.I2_card_eq_two
    intro h'; simp [h'] at h
  have e_v1v3 : S.triangle.v1 ≠ S.triangle.v3 := b3n9m069_ne_of_mem_not_mem v1c2 v3c2
  have e_v1v2 : S.triangle.v1 ≠ S.triangle.v2 := b3n9m069_ne_of_mem_not_mem v1c3 v2c3
  have e_v1a1 : S.triangle.v1 ≠ Z.a1 := b3n9m069_ne_of_mem_not_mem v1c2 a1c2
  have e_v1b1 : S.triangle.v1 ≠ Z.b1 := b3n9m069_ne_of_mem_not_mem v1c2 b1c2
  have e_v1a3 : S.triangle.v1 ≠ Z.a3 := b3n9m069_ne_of_mem_not_mem v1c3 a3c3
  have e_v1b3 : S.triangle.v1 ≠ Z.b3 := b3n9m069_ne_of_mem_not_mem v1c3 b3c3
  have e_v1a2 : S.triangle.v1 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem v1c2 a2c2
  have e_v1b2 : S.triangle.v1 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem v1c2 b2c2
  have e_v3v2 : S.triangle.v3 ≠ S.triangle.v2 := b3n9m069_ne_of_mem_not_mem v3c3 v2c3
  have e_v3a1 : S.triangle.v3 ≠ Z.a1 := b3n9m069_ne_of_mem_not_mem v3c3 a1c3
  have e_v3b1 : S.triangle.v3 ≠ Z.b1 := b3n9m069_ne_of_mem_not_mem v3c3 b1c3
  have e_v3a3 : S.triangle.v3 ≠ Z.a3 := b3n9m069_ne_of_mem_not_mem v3c1 a3c1
  have e_v3b3 : S.triangle.v3 ≠ Z.b3 := b3n9m069_ne_of_mem_not_mem v3c1 b3c1
  have e_v3a2 : S.triangle.v3 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem v3c1 a2c1
  have e_v3b2 : S.triangle.v3 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem v3c1 b2c1
  have e_v2a1 : S.triangle.v2 ≠ Z.a1 := b3n9m069_ne_of_mem_not_mem v2c2 a1c2
  have e_v2b1 : S.triangle.v2 ≠ Z.b1 := b3n9m069_ne_of_mem_not_mem v2c2 b1c2
  have e_v2a3 : S.triangle.v2 ≠ Z.a3 := b3n9m069_ne_of_mem_not_mem v2c1 a3c1
  have e_v2b3 : S.triangle.v2 ≠ Z.b3 := b3n9m069_ne_of_mem_not_mem v2c1 b3c1
  have e_v2a2 : S.triangle.v2 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem v2c1 a2c1
  have e_v2b2 : S.triangle.v2 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem v2c1 b2c1
  have e_a1a3 : Z.a1 ≠ Z.a3 := b3n9m069_ne_of_mem_not_mem a1c1 a3c1
  have e_a1b3 : Z.a1 ≠ Z.b3 := b3n9m069_ne_of_mem_not_mem a1c1 b3c1
  have e_a1a2 : Z.a1 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem a1c1 a2c1
  have e_a1b2 : Z.a1 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem a1c1 b2c1
  have e_b1a3 : Z.b1 ≠ Z.a3 := b3n9m069_ne_of_mem_not_mem b1c1 a3c1
  have e_b1b3 : Z.b1 ≠ Z.b3 := b3n9m069_ne_of_mem_not_mem b1c1 b3c1
  have e_b1a2 : Z.b1 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem b1c1 a2c1
  have e_b1b2 : Z.b1 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem b1c1 b2c1
  have e_a3a2 : Z.a3 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem a3c2 a2c2
  have e_a3b2 : Z.a3 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem a3c2 b2c2
  have e_b3a2 : Z.b3 ≠ Z.a2 := b3n9m069_ne_of_mem_not_mem b3c2 a2c2
  have e_b3b2 : Z.b3 ≠ Z.b2 := b3n9m069_ne_of_mem_not_mem b3c2 b2c2
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact S.triangle.v1_mem
    · exact S.triangle.v3_mem
    · exact S.triangle.v2_mem
    · exact S.CP.C1_subset a1c1
    · exact S.CP.C1_subset b1c1
    · exact S.CP.C3_subset a3c2
    · exact S.CP.C3_subset b3c2
    · exact S.CP.C2_subset a2c3
    · exact S.CP.C2_subset b2c3
  · rw [S.hcard9]
    have hcard :
        ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.a2, Z.b2}
          : Finset ℝ²).card = 9 := by
      rw [Finset.card_insert_of_notMem (by
            simp [e_v1v3, e_v1v2, e_v1a1, e_v1b1, e_v1a3, e_v1b3, e_v1a2, e_v1b2]),
          Finset.card_insert_of_notMem (by
            simp [e_v3v2, e_v3a1, e_v3b1, e_v3a3, e_v3b3, e_v3a2, e_v3b2]),
          Finset.card_insert_of_notMem (by
            simp [e_v2a1, e_v2b1, e_v2a3, e_v2b3, e_v2a2, e_v2b2]),
          Finset.card_insert_of_notMem (by simp [e_a1b1, e_a1a3, e_a1b3, e_a1a2, e_a1b2]),
          Finset.card_insert_of_notMem (by simp [e_b1a3, e_b1b3, e_b1a2, e_b1b2]),
          Finset.card_insert_of_notMem (by simp [e_a3b3, e_a3a2, e_a3b2]),
          Finset.card_insert_of_notMem (by simp [e_b3a2, e_b3b2]),
          Finset.card_insert_of_notMem (by simp [e_a2b2]),
          Finset.card_singleton]
    rw [hcard]
theorem b3n9m069_hXeq_transport_v3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.T x) (F.T P) = dist (F.T x) (F.T Q) := by
  rw [F.tau.dist_image, F.tau.dist_image, hP, hQ]
theorem b3n9m069_hXeq_transport_v1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.base.T x) (F.base.T P) = dist (F.base.T x) (F.base.T Q) := by
  rw [F.base.tau.dist_image, F.base.tau.dist_image, hP, hQ]
theorem b3n9m069_kill_v1a3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 Z.a3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1a3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.a3) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v2a3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v2 = r) (hQ : dist Z.a2 Z.a3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2a3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v2) (F.T Z.a3) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v1b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.b3) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v2b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v2 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v2) (F.T Z.b3) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_a3b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 Z.a3 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a3b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T Z.a3) (F.T Z.b3) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v1v2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 S.triangle.v2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1v2 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T S.triangle.v2) (F.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_a1b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 Z.a1 = r) (hQ : dist Z.a2 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a1b1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T Z.a1) (F.base.T Z.b1) (F.base.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v3a1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 S.triangle.v3 = r) (hQ : dist Z.a2 Z.a1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3a1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v3) (F.base.T Z.a1) (F.base.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_v3b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 S.triangle.v3 = r) (hQ : dist Z.a2 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3b1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v3) (F.base.T Z.b1) (F.base.T Z.a2)
    hXdisk (b3n9m069_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m069_kill_KA {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    {p q : ℝ²}
    (hp : p ∈ ({S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} : Finset ℝ²))
    (hq : q ∈ ({S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a2 p = r) (hqr : dist Z.a2 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl | rfl
  · exact hpq rfl
  · exact b3n9m069_kill_v1v2 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v1a3 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v1b3 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v1v2 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl
  · exact b3n9m069_kill_v2a3 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v2b3 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v1a3 F ha2A ha2y ha2v3 hqr hpr
  · exact b3n9m069_kill_v2a3 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl
  · exact b3n9m069_kill_a3b3 F ha2A ha2y ha2v3 hpr hqr
  · exact b3n9m069_kill_v1b3 F ha2A ha2y ha2v3 hqr hpr
  · exact b3n9m069_kill_v2b3 F ha2A ha2y ha2v3 hqr hpr
  · exact b3n9m069_kill_a3b3 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl
theorem b3n9m069_kill_KB {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    {p q : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a2 p = r) (hqr : dist Z.a2 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl
  · exact hpq rfl
  · exact b3n9m069_kill_a1b1 F ha2A ha2y ha2v1 hpr hqr
  · exact b3n9m069_kill_v3a1 F ha2A ha2y ha2v1 hqr hpr
  · exact b3n9m069_kill_a1b1 F ha2A ha2y ha2v1 hqr hpr
  · exact hpq rfl
  · exact b3n9m069_kill_v3b1 F ha2A ha2y ha2v1 hqr hpr
  · exact b3n9m069_kill_v3a1 F ha2A ha2y ha2v1 hpr hqr
  · exact b3n9m069_kill_v3b1 F ha2A ha2y ha2v1 hpr hqr
  · exact hpq rfl
theorem b3n9m069_cb1_a2_k4_cover {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC2pin : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    False := by
  classical
  let F2 := S.cb1_v3AnchorFrame_of_hexact Z hexact
  let F1 := S.cb1_v1AnchorFrame_of_hexact Z hC2pin hcard hexact
  have ha2I2 : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
  obtain ⟨ha2A, _, _, _⟩ := S.b3n9m069_classify_I2 ha2I2
  have ha2ne : Z.a2 ≠ S.triangle.v1 ∧ Z.a2 ≠ S.triangle.v3 := by
    have hne1 : Z.a2 ≠ S.triangle.v1 := (Finset.mem_erase.mp ha2I2).1
    have hne3 : Z.a2 ≠ S.triangle.v3 :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1
    exact ⟨hne1, hne3⟩
  obtain ⟨r2, hr2pos, hTcard⟩ := S.hK4 Z.a2 ha2A
  set T : Finset ℝ² := A.filter (fun x => dist Z.a2 x = r2) with hTdef
  have hT4 : 4 ≤ T.card := hTcard
  have ha2notT : Z.a2 ∉ T := by
    rw [hTdef]; simp only [Finset.mem_filter]
    rintro ⟨_, hd⟩; rw [dist_self] at hd; exact absurd hd.symm (ne_of_gt hr2pos)
  have hTsub : T ⊆ ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.b2}
      : Finset ℝ²) := by
    intro x hxT
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    have hxne_a2 : x ≠ Z.a2 := fun h => ha2notT (h ▸ hxT)
    have hx9 : x ∈ ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3,
        Z.a2, Z.b2} : Finset ℝ²) := by rw [← S.b3n9m069_cb1_A_eq_named Z]; exact hxA
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx9 ⊢
    rcases hx9 with h|h|h|h|h|h|h|h|h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h)))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))))
    · exact absurd h hxne_a2
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))))
  set KA : Finset ℝ² := {S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} with hKA
  set KB : Finset ℝ² := {Z.a1, Z.b1, S.triangle.v3} with hKB
  have hpigeon : 2 ≤ (T ∩ KA).card ∨ 2 ≤ (T ∩ KB).card := by
    by_contra h
    push_neg at h
    obtain ⟨hAlt, hBlt⟩ := h
    have hsub : T ⊆ KA ∪ KB ∪ {Z.b2} := by
      intro x hx
      have := hTsub hx
      simp only [hKA, hKB, Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at this ⊢
      tauto
    have h1 : T ⊆ (T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b2}) := by
      intro x hx
      have := hsub hx
      simp only [Finset.mem_union, Finset.mem_inter] at this ⊢
      tauto
    have hb : (T ∩ {Z.b2}).card ≤ 1 := by
      calc (T ∩ {Z.b2}).card ≤ ({Z.b2} : Finset ℝ²).card :=
            Finset.card_le_card Finset.inter_subset_right
        _ = 1 := Finset.card_singleton _
    have hle3 : T.card ≤ 3 := by
      calc T.card ≤ ((T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b2})).card := Finset.card_le_card h1
        _ ≤ (T ∩ KA).card + (T ∩ KB).card + (T ∩ {Z.b2}).card := by
            refine le_trans (Finset.card_union_le _ _) ?_
            exact Nat.add_le_add_right (Finset.card_union_le _ _) _
        _ ≤ 3 := by omega
    omega
  have ha2yF2 : (F2.T Z.a2) 1 ≤ 0 := F2.ha2_y
  have ha2yF1 : (F1.base.T Z.a2) 1 ≤ 0 := F1.base.ha2_y
  rcases hpigeon with hKA2 | hKB2
  · obtain ⟨p, hpKA, q, hqKA, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KA).card)
    have hpT := Finset.mem_of_mem_inter_left hpKA
    have hqT := Finset.mem_of_mem_inter_left hqKA
    have hpKA' := Finset.mem_of_mem_inter_right hpKA
    have hqKA' := Finset.mem_of_mem_inter_right hqKA
    have hpr : dist Z.a2 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a2 q = r2 := (Finset.mem_filter.mp hqT).2
    exact b3n9m069_kill_KA F2 ha2A ha2yF2 ha2ne.2 hpKA' hqKA' hpq hpr hqr
  · obtain ⟨p, hpKB, q, hqKB, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KB).card)
    have hpT := Finset.mem_of_mem_inter_left hpKB
    have hqT := Finset.mem_of_mem_inter_left hqKB
    have hpKB' := Finset.mem_of_mem_inter_right hpKB
    have hqKB' := Finset.mem_of_mem_inter_right hqKB
    have hpr : dist Z.a2 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a2 q = r2 := (Finset.mem_filter.mp hqT).2
    exact b3n9m069_kill_KB F1 ha2A ha2yF1 ha2ne.1 hpKB' hqKB' hpq hpr hqr
theorem n4d_cB1_impossible_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC : S.IsFormC_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (ha3I3 : (Z.a3 : ℝ²) ∈ S.I3)
    (ha3C3 : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))
    (hs : 0 < s)
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (q : ℝ²) (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hqC1 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({q} : Finset ℝ²))
    (hv1C2 : S.witnessClassAt_v3 s ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) :
    False := by
  classical
  have hCcopy := hC
  rcases hC with ⟨y, hyI3, hv3C2, hyC3⟩
  have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hv3C2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hr : 0 < r := by
    have hv3dist : dist S.triangle.v1 S.triangle.v3 = r :=
      (Finset.mem_filter.mp hv3T1).2
    rw [← hv3dist]
    exact dist_pos.mpr S.triangle.v13_ne
  have hqC1_v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) := by
    exact S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hCcopy ha3I3 ha3C3 hI3sub hq hqC1
  have ha3T : Z.a3 ∈ S.witnessClassAt_v3 s := hI3sub ha3I3
  have hb3T : Z.b3 ∈ S.witnessClassAt_v3 s := by
    have hb3I3 : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
    exact hI3sub hb3I3
  have hv2T : S.triangle.v2 ∈ S.witnessClassAt_v3 s := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hqC1_v2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hv1T : S.triangle.v1 ∈ S.witnessClassAt_v3 s := by
    have hmem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hv1C2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hsubset :
      S.witnessClassAt_v3 s ⊆
        insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) := by
    intro x hxT
    by_cases hxI3 : x ∈ S.I3
    · rw [Z.hI3] at hxI3
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxI3 ⊢
      rcases hxI3 with rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
    · have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
      by_cases hxC1 : x ∈ S.CP.C1
      · have hxmem : x ∈ S.witnessClassAt_v3 s ∩ S.CP.C1 :=
          Finset.mem_inter.mpr ⟨hxT, hxC1⟩
        rw [hqC1_v2] at hxmem
        have hx : x = S.triangle.v2 := by simpa using hxmem
        simp [hx]
      · by_cases hxC2 : x ∈ S.CP.C2
        · have hxmem : x ∈ S.witnessClassAt_v3 s ∩ S.CP.C2 :=
            Finset.mem_inter.mpr ⟨hxT, hxC2⟩
          rw [hv1C2] at hxmem
          have hx : x = S.triangle.v1 := by simpa using hxmem
          simp [hx]
        · have hxC3 : x ∈ S.CP.C3 := by
            have hxne_v1 : x ≠ S.triangle.v1 := by
              intro hx
              exact hxC2 (by rw [hx]; exact S.CP.v1_mem_C2)
            have hxne_v2 : x ≠ S.triangle.v2 := by
              intro hx
              exact hxC1 (by rw [hx]; exact S.CP.v2_mem_C1)
            have hxne_v3 : x ≠ S.triangle.v3 := by
              intro hx
              have hdist : dist S.triangle.v3 x = s := (Finset.mem_filter.mp hxT).2
              rw [hx, dist_self] at hdist
              linarith
            have hxnon : x ∉ S.triangle.verts := by
              simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
              push_neg; exact ⟨hxne_v1, hxne_v2, hxne_v3⟩
            have hone := S.CP.nonmoser_in_one x hxA hxnon
            by_cases hxC3 : x ∈ S.CP.C3
            · exact hxC3
            · have : (0 : ℕ) = 1 := by
                simpa [hxC1, hxC2, hxC3] using hone
              omega
          have hxI3' : x ∈ S.I3 := by
            rw [show S.I3 = (S.CP.C3.erase S.triangle.v1).erase S.triangle.v2 from rfl]
            have hxne2 : x ≠ S.triangle.v2 := by
              intro hx
              exact hxC1 (by rw [hx]; exact S.CP.v2_mem_C1)
            have hxne1 : x ≠ S.triangle.v1 := by
              intro hx
              exact hxC2 (by rw [hx]; exact S.CP.v1_mem_C2)
            simp [hxC3, hxne2, hxne1]
          exact False.elim (hxI3 hxI3')
  have hfour_subset :
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) ⊆
        S.witnessClassAt_v3 s := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ha3T
    · exact hb3T
    · exact hv2T
    · exact hv1T
  have hcard_named :
      (insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))).card = 4 := by
    apply le_antisymm
    · rw [← hTcard]
      exact Finset.card_le_card hfour_subset
    · have hle := Finset.card_le_card hsubset
      rw [hTcard] at hle
      exact hle
  have hexact :
      S.witnessClassAt_v3 s =
        insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) := by
    apply Finset.eq_of_subset_of_card_le hsubset
    rw [hTcard, hcard_named]
  exact S.b3n9m069_cb1_a2_k4_cover Z hv3C2 hcard hexact
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit069

-- Original module: Solutions.Batch3N9.N4d.FormCcA3QeqC
section Batch3N9Unit070
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem b3n9m070_v1_lt_v1v3_of_mem_I2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  first
  | exact Batch3N9.Problem97.b3n9m066_v1_lt_v1v3_of_mem_I2_local
  | apply Batch3N9.Problem97.b3n9m066_v1_lt_v1v3_of_mem_I2_local <;> assumption
theorem b3n9m070_v1_lt_v1v2_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m070_mem_C2_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ S.CP.C2 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
theorem b3n9m070_mem_C3_of_mem_I3_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I3) :
    x ∈ S.CP.C3 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
theorem b3n9m070_mem_A_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ A :=
  S.CP.C2_subset (b3n9m070_mem_C2_of_mem_I2_local hx)
theorem b3n9m070_not_triangle_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∉ S.triangle.verts := by
  have hxv1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hx).1
  have hxv3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).1
  have hxC2 : x ∈ S.CP.C2 := b3n9m070_mem_C2_of_mem_I2_local hx
  have hxv2 : x ≠ S.triangle.v2 := by
    intro h
    exact S.CP.v2_notin_C2 (h ▸ hxC2)
  simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
theorem b3n9m070_ne_of_mem_I2_of_mem_I3_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x y : ℝ²} (hx : x ∈ S.I2) (hy : y ∈ S.I3) :
    x ≠ y := by
  intro hxy
  have hxA : x ∈ A := b3n9m070_mem_A_of_mem_I2_local hx
  have hxnon : x ∉ S.triangle.verts := b3n9m070_not_triangle_of_mem_I2_local hx
  have hxC2 : x ∈ S.CP.C2 := b3n9m070_mem_C2_of_mem_I2_local hx
  have hxC3 : x ∈ S.CP.C3 := by simpa [hxy] using b3n9m070_mem_C3_of_mem_I3_local hy
  have hone := S.CP.nonmoser_in_one x hxA hxnon
  by_cases hxC1 : x ∈ S.CP.C1
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone
theorem b3n9m070_c3_sameSide_core (p q s t c : ℝ)
    (hCT : 0 ≤ c * t)
    (hARC : t * (2 * p * t - 2 * q * s - q + t) < 0)
    (hD : p ^ 2 + q ^ 2 ≤ 1 / 4 + 2 * c * q)
    (hC : 8 * c * t = 4 * s ^ 2 + 4 * t ^ 2 - 1) :
    0 < q * t := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m069_c3_sameSide_core
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m069_c3_sameSide_core <;> assumption
set_option maxHeartbeats 4000000 in
theorem b3n9m070_c3_vertex_same_open_side_as_v2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {a₃ : ℝ²}
    (ha2 : a₃ ∈ S.I3) :
    0 < signedArea2 a₃ S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  let a : ℝ² := a₃
  let center : ℝ² := S.Packet.center
  have haC2 : a ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp ha2).1
  have haA : a ∈ A := S.CP.C3_subset haC2
  have harc_le :
      signedArea2 a q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
    have hraw : signedArea2 a q1 q3 * signedArea2 q2 q1 q3 ≤ 0 :=
      (S.CP.arc_membership a haA).2.2.1 haC2
    have hswap_a : signedArea2 a q3 q1 = -signedArea2 a q1 q3 := by
      unfold Problem97.signedArea2
      ring
    have hswap_q2 : signedArea2 q2 q3 q1 = -signedArea2 q2 q1 q3 := by
      unfold Problem97.signedArea2
      ring
    rw [hswap_a, hswap_q2]
    simpa using hraw
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v2_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    ·
      apply hconv q3 (by exact_mod_cast h3A)
      have hseg : q3 ∈ segment ℝ a q1 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h⟩
    ·
      apply hconv q1 (by exact_mod_cast h1A)
      have hseg : q1 ∈ segment ℝ q3 a := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h⟩
    ·
      apply hconv a (by exact_mod_cast haA)
      have hseg : a ∈ segment ℝ q1 q3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h.symm⟩
  have hv2v3v1_ne : signedArea2 q2 q3 q1 ≠ 0 := by
    have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      (by simpa [dist_eq_norm] using hv1O)
      S.triangle.v23_ne.symm S.triangle.v12_ne.symm S.triangle.v13_ne.symm
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v13_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
  have horth : inner ℝ u nvec = 0 := by
    simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [nvec, Orientation.areaForm_rightAngleRotation_right]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  have hun : Problem97.stdOrientation.areaForm u nvec = ‖u‖ ^ 2 := by
    simpa using harea_u_right 1
  have hnu : Problem97.stdOrientation.areaForm nvec u = -‖u‖ ^ 2 := by
    rw [Problem97.stdOrientation.areaForm_swap, hun]
  have huu : Problem97.stdOrientation.areaForm u u = 0 := by
    simpa using harea_u_left 1
  have hnn : Problem97.stdOrientation.areaForm nvec nvec = 0 := by simp
  have harea_bilin : ∀ xa ya xb yb : ℝ,
      Problem97.stdOrientation.areaForm (xa • u + ya • nvec) (xb • u + yb • nvec)
        = (xa * yb - ya * xb) * ‖u‖ ^ 2 := by
    intro xa ya xb yb
    simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      smul_eq_mul, huu, hun, hnu, hnn]
    ring
  have harea_gen : ∀ z w x : ℝ²,
      signedArea2 z w x =
        ((X w - X z) * (Y x - Y z) - (Y w - Y z) * (X x - X z)) * ‖u‖ ^ 2 := by
    intro z w x
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff x z,
        harea_bilin]
  have hXc : X center = 0 := by
    have hdist_eq : dist center q1 = dist center q2 := by
      rw [dist_comm center q1, dist_comm center q2]
      simpa [q1, q2, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural, center] using
        S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_3.symm
    have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
      calc
        inner ℝ (center - M) u
            = inner ℝ (X center • u + Y center • nvec) u := by rw [hsum_pt center]
        _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X center * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    have hprod : X center * ‖u‖ ^ 2 = 0 := hinner.symm
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [M] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by dsimp [u]; abel_nf]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hX_q2 : X q2 = (1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
    change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q2 : Y q2 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
    change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    rw [hdiff z center, hXc]; simp [yc]
  have hdist_sq_coeff :
      ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
    intro x y
    have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]; ring
    have hnorm : ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
    have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, hnorm_nvec, mul_pow, sq_abs]
    rw [hnorm, hu_part, hn_part]; ring
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hradius_sq : S.Packet.radius ^ 2 = ((1 / 4 : ℝ) + yc ^ 2) * ‖u‖ ^ 2 := by
    have hr : dist center q1 = S.Packet.radius := by
      rw [dist_comm]; simpa [q1, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_1
    have := hdist_center_sq q1
    rw [hr, hX_q1, hY_q1] at this
    rw [this]; ring
  have hC1 : 8 * yc * Y q3 = 4 * (X q3) ^ 2 + 4 * (Y q3) ^ 2 - 1 := by
    have hr : dist center q3 = S.Packet.radius := by
      rw [dist_comm]; simpa [q3, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_2
    have h := hdist_center_sq q3
    rw [hr, hradius_sq] at h
    have hcancel : (X q3) ^ 2 + (Y q3 - yc) ^ 2 = (1 / 4 : ℝ) + yc ^ 2 :=
      (mul_right_cancel₀ (ne_of_gt hu_sq_pos) h).symm
    nlinarith only [hcancel]
  have hD : (X a) ^ 2 + (Y a) ^ 2 ≤ 1 / 4 + 2 * yc * Y a := by
    have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
      simpa [center] using S.Packet.disk_contains_A a haA
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      rw [dist_eq_norm, norm_sub_rev]; exact hdisk_a'
    have hsq : dist center a ^ 2 ≤ S.Packet.radius ^ 2 := by
      have h0 : 0 ≤ dist center a := dist_nonneg
      have h1 : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      nlinarith only [hdisk_a, h0, h1]
    rw [hdist_center_sq a, hradius_sq] at hsq
    have hsq' : (X a) ^ 2 + (Y a - yc) ^ 2 ≤ (1 / 4 : ℝ) + yc ^ 2 :=
      le_of_mul_le_mul_right (by linarith [hsq]) hu_sq_pos
    nlinarith only [hsq']
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hcenter_q3 : 0 ≤ yc * Y q3 := by
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_3
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_2
    have hinn : inner ℝ (q1 - q3) (q2 - q3) ≥ 0 := by
      simpa [q1, q2, q3, real_inner_comm] using S.Packet.inner_at_v2
    have hprod :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≥ 0 :=
      center_same_side_as_apex_of_nonobtuse hq1O hq2O hq3O hinn
    rw [hca, hc3] at hprod
    have hpos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
    nlinarith only [hprod, hpos]
  have hARC : Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3) < 0 := by
    have hf1 : signedArea2 a q3 q1 =
        ((X q3 - X a) * (Y q1 - Y a) - (Y q3 - Y a) * (X q1 - X a)) * ‖u‖ ^ 2 :=
      harea_gen a q3 q1
    have hf2 : signedArea2 q2 q3 q1 =
        ((X q3 - X q2) * (Y q1 - Y q2) - (Y q3 - Y q2) * (X q1 - X q2)) * ‖u‖ ^ 2 :=
      harea_gen q2 q3 q1
    rw [hf1, hf2, hX_q1, hY_q1, hX_q2, hY_q2] at harc
    have hexpand :
        ((X q3 - X a) * (0 - Y a) - (Y q3 - Y a) * (-(1 / 2) - X a)) * ‖u‖ ^ 2 *
          (((X q3 - (1 / 2)) * (0 - 0) - (Y q3 - 0) * (-(1 / 2) - (1 / 2))) * ‖u‖ ^ 2)
        = (Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3)) *
            ((1 / 2) * (‖u‖ ^ 2 * ‖u‖ ^ 2)) := by ring
    rw [hexpand] at harc
    have hpos : 0 < (1 / 2 : ℝ) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by positivity
    nlinarith only [harc, hpos]
  have hcore : 0 < Y a * Y q3 :=
    b3n9m070_c3_sameSide_core (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)
theorem b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq <;> assumption
theorem b3n9m070_signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_signedArea2_baseChord_vec2
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_signedArea2_baseChord_vec2 <;> assumption
noncomputable def b3n9m070_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m070_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m070_halfShift_injective : Function.Injective b3n9m070_halfShift := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective <;> assumption
noncomputable def b3n9m070_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m070_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m070_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m070_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m070_halfShift a) (b3n9m070_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m070_halfShift a - b3n9m070_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m070_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m070_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m070_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m070_halfShift a ∈ b3n9m070_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m070_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m070_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m070_flipY_injective : Function.Injective b3n9m070_flipY := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective <;> assumption
noncomputable def b3n9m070_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m070_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m070_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m070_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m070_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m070_flipY a) (b3n9m070_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m070_flipY a - b3n9m070_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m070_flipY a - b3n9m070_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m070_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m070_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m070_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m070_flipY a ∈ b3n9m070_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m070_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m070_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m069_exists_base_transportData
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m069_exists_base_transportData <;> assumption
theorem b3n9m070_qEqC_reflection_below_contradiction_v13
    (r θ δ : ℝ) (hr : 0 < r)
    (hcosθ : Real.cos θ = -(r / 2)) (hsinθ : 0 < Real.sin θ)
    (hθ0 : 0 ≤ θ) (hθπ : θ ≤ Real.pi)
    (hcosδ : -(r / 2) < Real.cos δ) (hsinδ : 0 < Real.sin δ)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hqbelow : Real.sin (2 * δ - θ) < 0)
    (hAq : Real.cos (2 * δ - θ) < -(r / 2)) : False := by
  have hδpos : 0 < δ := by
    rcases lt_or_eq_of_le hδ0 with h | h
    · exact h
    · exfalso; rw [← h, Real.sin_zero] at hsinδ; exact lt_irrefl _ hsinδ
  have hδ_lt_θ : δ < θ := by
    rcases lt_trichotomy δ θ with hlt | heq | hgt
    · exact hlt
    · exfalso; rw [heq, hcosθ] at hcosδ; exact lt_irrefl _ hcosδ
    · exfalso
      have hcc := Real.cos_lt_cos_of_nonneg_of_le_pi hθ0 hδπ hgt
      rw [hcosθ] at hcc
      linarith [hcc, hcosδ]
  set w : ℝ := 2 * δ - θ with hw_def
  have hw_lo : -Real.pi < w := by rw [hw_def]; linarith [hδpos, hθπ]
  have hw_hi : w < Real.pi := by rw [hw_def]; linarith [hδ_lt_θ, hθπ]
  have hw_neg : w < 0 := by
    by_contra hge
    push_neg at hge
    exact absurd (Real.sin_nonneg_of_nonneg_of_le_pi hge (le_of_lt hw_hi))
      (not_le.mpr hqbelow)
  have hneg_w_lo : 0 ≤ -w := by linarith [hw_neg]
  have hneg_w_lt : -w < θ := by rw [hw_def]; linarith [hδpos]
  have hcos_gt : Real.cos θ < Real.cos (-w) :=
    Real.cos_lt_cos_of_nonneg_of_le_pi hneg_w_lo hθπ hneg_w_lt
  rw [Real.cos_neg] at hcos_gt
  rw [hcosθ] at hcos_gt
  linarith [hAq, hcos_gt]
abbrev QEqCReflectionConfigV13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ θ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
    0 < r ∧
    Real.cos θ = -(r / 2) ∧ 0 < Real.sin θ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
    -(r / 2) < Real.cos δ ∧ 0 < Real.sin δ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
    T q =
      Problem97.CGN.vec2
        (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) ∧
    Real.sin (2 * δ - θ) < 0
theorem qEqC_row_impossible_of_normalized_config_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.QEqCReflectionConfigV13 q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v3) :
    False := by
  rcases hconfig with
    ⟨T, tau, θ, δ, hv1, hv2, hr, hcosθ, hsinθ, hθ0, hθπ,
      hcosδ, hsinδ, hδ0, hδπ, hqT, hqbelow⟩
  have hcapT : dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v3) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith only [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q), dist_nonneg (x := S.triangle.v1) (y := S.triangle.v3)]

  have hAB1 : dist (T S.triangle.v1) (T S.triangle.v3) = 1 := by
    rw [hv1, hv2, dist_eq_norm]
    have hvec :
        Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [hvec, EuclideanSpace.norm_eq]
    norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist (T S.triangle.v1) (T q) ^ 2
      = 1 + 2 * r * Real.cos (2 * δ - θ) + r ^ 2 := by
    rw [hv1, hqT, b3n9m070_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith only [Real.sin_sq_add_cos_sq (2 * δ - θ)]
  have hAq : Real.cos (2 * δ - θ) < -(r / 2) := by
    rw [hAB1] at hcapT
    have hAq_nonneg : 0 ≤ dist (T S.triangle.v1) (T q) := dist_nonneg
    nlinarith only [hcapT, hAq_sq, hr, hAq_nonneg]
  exact b3n9m070_qEqC_reflection_below_contradiction_v13 r θ δ hr hcosθ hsinθ hθ0 hθπ
    hcosδ hsinδ hδ0 hδπ hqbelow hAq
theorem qEqC_row_impossible_of_lower_witness_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I2)
    (hconfig : S.QEqCReflectionConfigV13 q r) :
    False :=
  S.qEqC_row_impossible_of_normalized_config_v13 hconfig
    (b3n9m070_v1_lt_v1v3_of_mem_I2_local S hqI3)
theorem b3n9m070_qEqC_reflection_coords_v13
    (r cθ sθ cδ sδ cη sη : ℝ) (hr : 0 < r)
    (hcθ : cθ = -(r / 2)) (hsθ : 0 < sθ) (hθpyth : cθ ^ 2 + sθ ^ 2 = 1)
    (hcδ : -(r / 2) < cδ) (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ)
    (hne : ¬ (cη = cθ ∧ sη = sθ)) :
    ∃ θ δ : ℝ,
      Real.cos θ = cθ ∧ Real.sin θ = sθ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - θ) ∧ sη = Real.sin (2 * δ - θ) := by
  have hcθ_mem : -1 ≤ cθ ∧ cθ ≤ 1 := by
    constructor <;> nlinarith [hθpyth, sq_nonneg sθ, sq_nonneg cθ]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith [hδpyth, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith only [hηpyth, hsη, sq_nonneg sη, sq_nonneg cη]
  set θ : ℝ := Real.arccos cθ with hθ_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosθ : Real.cos θ = cθ := Real.cos_arccos hcθ_mem.1 hcθ_mem.2
  have hsinθ : Real.sin θ = sθ := by
    rw [hθ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cθ ^ 2) = Real.sqrt (sθ ^ 2) := by congr 1; nlinarith only [hθpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsθ)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith only [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith only [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  have hcoseq : Real.cos (η - δ) = Real.cos (θ - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosθ, hsinθ, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos θ ∧ Real.sin η = Real.sin θ) := by
    rw [hcosη, hsinη, hcosθ, hsinθ]; exact hne
  have hrefl : Real.cos η = Real.cos (2 * δ - θ) ∧ Real.sin η = Real.sin (2 * δ - θ) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = θ + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - θ) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨θ, δ, hcosθ, hsinθ, Real.arccos_nonneg cθ, Real.arccos_le_pi cθ,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]
set_option maxHeartbeats 8000000 in
theorem qEqC_reflection_config_of_shell_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I2)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v3)
    (hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 C)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3)
    (hqC : q ≠ C) :
    ∃ r : ℝ, S.QEqCReflectionConfigV13 q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v13_ne
  rcases b3n9m070_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_3
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m070_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.QEqCReflectionConfigV13 q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m070_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m070_similarityTransportComp tau0 b3n9m070_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hxA : q ∈ A := S.CP.C2_subset (by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).2)
    have hqC3 : q ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).2
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_2
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
    have hq_arc : signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
      have hraw : signedArea2 q q2 q1 * signedArea2 q3 q2 q1 ≤ 0 := by
        simpa [q1, q2, q3, Problem97.OnArcOpposite] using
          ((S.CP.arc_membership q hxA).2.1.mp hqC3)
      have hswapq : signedArea2 q q2 q1 = - signedArea2 q q1 q2 := by
        unfold Problem97.signedArea2
        ring
      have hswap3 : signedArea2 q3 q2 q1 = - signedArea2 q3 q1 q2 := by
        unfold Problem97.signedArea2
        ring
      rw [hswapq, hswap3] at hraw
      simpa using hraw
    have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
      intro hz
      have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
        (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
      exact False.elim <|
        (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v3_mem
          hq_ne_v1 hq_ne_v2 S.triangle.v13_ne hcol
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, b3n9m070_signedArea2_baseChord_vec2]; linarith
    have hqy_T : (T q) 1 < 0 := by
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, b3n9m070_signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    have hC_base_ne : signedArea2 C q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hCside; exact lt_irrefl _ hCside
    have hCy_T : 0 < (T C) 1 := by
      have hC_img_prod :
          0 < signedArea2 (T0 C) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign C q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 C q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 C q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hCside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hC_img_pos : 0 < signedArea2 (T0 C) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 C) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, b3n9m070_signedArea2_baseChord_vec2] at hC_img_pos
      dsimp [T]
      simp only [b3n9m070_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 C) 1 / 2 := by linarith
      simpa using this
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne
    set r : ℝ := dist (T q2) (T C) with hr_def
    have hC_ne_v2 : C ≠ q2 := by
      intro h; rw [h] at hC_base_ne
      exact hC_base_ne (by
        have : signedArea2 q2 q1 q2 = 0 := by
          simp [signedArea2]
        simpa [q1, q2] using this)
    have hd_C : 0 < dist q2 C := by rw [dist_pos]; exact fun h => hC_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_C
    have hBC_T : dist (T q2) (T C) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 C := by simpa [q2] using hBq
      rw [this]
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q3 = dist q2 C := by simpa [q2, q3] using hBD
      rw [this]
    have hDq_T : dist (T q3) (T q) = dist (T q3) (T C) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 q = dist q3 C := by simpa [q3] using hDq
      rw [this]
    set cθ : ℝ := ((T C) 0 - 1) / r with hcθ_def
    set sθ : ℝ := (T C) 1 / r with hsθ_def
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hθpyth : cθ ^ 2 + sθ ^ 2 = 1 := by
      have hsq := b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T C)
      rw [hBC_T, hv2c0, hv2c1] at hsq
      rw [hcθ_def, hsθ_def]; field_simp; nlinarith only [hsq]
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 := by
      have hsq := b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hcδ_def, hsδ_def]; field_simp; nlinarith only [hsq]
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 := by
      have hsq := b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [hcη_def, hsη_def]; field_simp; nlinarith only [hsq]
    have hsθ_pos : 0 < sθ := by rw [hsθ_def]; positivity
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsη_neg : sη < 0 := by
      rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hAC_T : dist (T q1) (T C) = 1 := by
      rw [tau.dist_image]
      have : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
      rw [hAB1] at this
      have hAC' : dist q1 C = dist q1 q2 := by simpa [q1, q2] using hAC
      rw [hAC']; linarith [this]
    have hcθ_eq : cθ = -(r / 2) := by
      have hACsq : (T C) 0 ^ 2 + (T C) 1 ^ 2 = 1 := by
        have h := b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T C)
        rw [hAC_T, hv1c0, hv1c1] at h
        nlinarith only [h]
      have hcirc : ((T C) 0 - 1) ^ 2 + (T C) 1 ^ 2 = r ^ 2 := by
        have h := hθpyth
        rw [hcθ_def, hsθ_def] at h
        field_simp at h
        nlinarith only [h]
      have hTC0 : (T C) 0 = 1 - r ^ 2 / 2 := by nlinarith only [hACsq, hcirc]
      rw [hcθ_def, hTC0]; field_simp; ring
    have hcδ_gt : -(r / 2) < cδ := by
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hsc, hlong, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 := by
        have h := b3n9m070_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
        rw [hv1c0, hv1c1] at h
        nlinarith only [hAD, h, dist_nonneg (x := T q1) (y := T q3)]
      have hBDsq : ((T q3) 0 - 1) ^ 2 + (T q3) 1 ^ 2 = r ^ 2 := by
        have h := hδpyth
        rw [hcδ_def, hsδ_def] at h
        field_simp at h
        nlinarith only [h]
      rw [hcδ_def, lt_div_iff₀ hr_pos]
      nlinarith only [hADsq, hBDsq]
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hTC0 : (T C) 0 = 1 + r * cθ := by rw [hcθ_def]; field_simp; ring
    have hTC1 : (T C) 1 = r * sθ := by rw [hsθ_def]; field_simp
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    have hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ := by
      have hsqeq : dist (T q3) (T q) ^ 2 = dist (T q3) (T C) ^ 2 := by rw [hDq_T]
      rw [b3n9m070_dist_sq_eq_coord_sq_add_coord_sq, b3n9m070_dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTC0, hTC1, hTD0, hTD1, hTq0, hTq1] at hsqeq
      have hrne : r ≠ 0 := ne_of_gt hr_pos
      have hkey : (cη * cδ + sη * sδ) * r ^ 2 = (cθ * cδ + sθ * sδ) * r ^ 2 := by
        nlinarith only [hsqeq, hθpyth, hηpyth, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact mul_right_cancel₀ (ne_of_gt hr2pos) hkey
    have hne : ¬ (cη = cθ ∧ sη = sθ) := by
      rintro ⟨hc, hs⟩
      apply hqC
      have h0 : (T q) 0 = (T C) 0 := by rw [hTq0, hTC0, hc]
      have h1 : (T q) 1 = (T C) 1 := by rw [hTq1, hTC1, hs]
      have hTqC : T q = T C := by
        ext i; fin_cases i
        · exact h0
        · exact h1
      have hd0 : dist (T q) (T C) = 0 := by rw [hTqC]; simp
      rw [tau.dist_image] at hd0
      have : dist q C = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp this
    obtain ⟨θ, δ, hcosθ, hsinθ, hθ0, hθπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      b3n9m070_qEqC_reflection_coords_v13 r cθ sθ cδ sδ cη sη hr_pos hcθ_eq hsθ_pos hθpyth
        hcδ_gt hsδ_pos hδpyth hηpyth hsη_neg hradical hne
    have hcosθ' : Real.cos θ = -(r / 2) := by rw [hcosθ]; exact hcθ_eq
    have hsinθ' : 0 < Real.sin θ := by rw [hsinθ]; exact hsθ_pos
    have hcosδ' : -(r / 2) < Real.cos δ := by rw [hcosδ]; exact hcδ_gt
    have hsinδ' : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hqbelow' : Real.sin (2 * δ - θ) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - θ) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - θ) := by rw [hTq1, hsη_eq]
    have hqcoord : T q =
        Problem97.CGN.vec2 (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) := by
      ext i; fin_cases i
      · change (T q) 0 = _
        rw [hTq0']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      · change (T q) 1 = _
        rw [hTq1']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    exact ⟨r, T, tau, θ, δ, hv1T, hv2T, hr_pos,
      hcosθ', hsinθ', hθ0, hθπ, hcosδ', hsinδ', hδ0, hδπ, hqcoord, hqbelow'⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m070_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m070_similarityTransportComp tauBase b3n9m070_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m070_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem qEqC_row_impossible_of_reflection_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I2)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v3)
    (hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 C)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3)
    (hqC : q ≠ C) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.qEqC_reflection_config_of_shell_v13 hqI3 hAC hBD hBq hDq hlong hCside hqC
  exact S.qEqC_row_impossible_of_lower_witness_v13 hqI3 hconfig
theorem n4d_cA_3_q_eq_C_impossible_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 t)
    (p : ℝ²) (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpC1 : S.witnessClassAt_v2 t ∩ S.CP.C1 = ({p} : Finset ℝ²))
    (ha3C3 : S.witnessClassAt_v2 t ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) :
    False := by
  classical
  rcases hlower with ⟨hA3, ha3eq, _hTcard, hI3sub, hC1eq, hC2eq⟩
  let T := S.witnessClassAt_v3 s
  have hv2T : S.triangle.v2 ∈ T := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a2 : ℝ²) ∈ T ∩ S.CP.C2 ∨ (Z.b2 : ℝ²) ∈ T ∩ S.CP.C2 := by
    rcases hC2eq with hqa2 | hqb2
    · left
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hqa2] at hmem
      exact hmem
    · right
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hqb2] at hmem
      exact hmem
  obtain ⟨q, hqI2, hqT3⟩ : ∃ q : ℝ², q ∈ S.I2 ∧ q ∈ T := by
    rcases hq with hqa2 | hqb2
    · refine ⟨Z.a2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqa2).1
    · refine ⟨Z.b2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqb2).1
  have hAC : dist S.triangle.v1 Z.a3 = dist S.triangle.v1 S.triangle.v3 := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3eq] at ha3mem
      exact (Finset.mem_inter.mp ha3mem).1
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      rcases hC with ⟨_, _, hv3eq, _⟩
      have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hv3mem
      exact (Finset.mem_inter.mp hv3mem).1
    have ha3dist : dist S.triangle.v1 Z.a3 = r := by
      simpa using (Finset.mem_filter.mp ha3T1).2
    have hv3dist : dist S.triangle.v1 S.triangle.v3 = r := by
      simpa using (Finset.mem_filter.mp hv3T1).2
    rw [ha3dist, hv3dist]
  have ha3T3 : Z.a3 ∈ T := hI3sub hA3
  have hv2rad3 : dist S.triangle.v3 S.triangle.v2 = s := by
    simpa [T] using (Finset.mem_filter.mp hv2T).2
  have ha3rad3 : dist S.triangle.v3 Z.a3 = s := by
    simpa [T] using (Finset.mem_filter.mp ha3T3).2
  have hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 Z.a3 := by
    rw [hv2rad3, ha3rad3]
  have hqrad3 : dist S.triangle.v3 q = s := by
    simpa [T] using (Finset.mem_filter.mp hqT3).2
  have hBq : dist S.triangle.v3 q = dist S.triangle.v3 Z.a3 := by
    rw [hqrad3, ha3rad3]
  have ha3T2 : Z.a3 ∈ S.witnessClassAt_v2 t := by
    have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
    rw [← ha3C3] at ha3mem
    exact (Finset.mem_inter.mp ha3mem).1
  have hqT2 : q ∈ S.witnessClassAt_v2 t := hI2sub hqI2
  have ha3rad2 : dist S.triangle.v2 Z.a3 = t := by
    simpa using (Finset.mem_filter.mp ha3T2).2
  have hqrad2 : dist S.triangle.v2 q = t := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hDq : dist S.triangle.v2 q = dist S.triangle.v2 Z.a3 := by
    rw [hqrad2, ha3rad2]
  have hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    have h := b3n9m070_v1_lt_v1v2_of_mem_I3_local S (q := Z.a3) hA3
    rwa [hAC] at h
  have hCside :
      0 < signedArea2 Z.a3 S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 :=
    b3n9m070_c3_vertex_same_open_side_as_v2_local S hA3
  have hqC : q ≠ Z.a3 := by
    exact b3n9m070_ne_of_mem_I2_of_mem_I3_local hqI2 hA3
  exact S.qEqC_row_impossible_of_reflection_v13 hqI2 hAC hBD hBq hDq hlong hCside hqC
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit070

-- Original module: Solutions.Batch3N9.N4d.FormCQeqEb3PinClash
section Batch3N9Unit071
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
theorem b3n9m071_dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  first
  | exact Batch3N9.Problem97.b3n9m065_dist_sq_coords
  | apply Batch3N9.Problem97.b3n9m065_dist_sq_coords <;> assumption
theorem b3n9m071_vec2_c0 (a b : ℝ) : (Problem97.CGN.vec2 a b) 0 = a := by
  first
  | exact Batch3N9.Problem97.b3n9m065_vec2_c0
  | apply Batch3N9.Problem97.b3n9m065_vec2_c0 <;> assumption
theorem b3n9m071_vec2_c1 (a b : ℝ) : (Problem97.CGN.vec2 a b) 1 = b := by
  first
  | exact Batch3N9.Problem97.b3n9m065_vec2_c1
  | apply Batch3N9.Problem97.b3n9m065_vec2_c1 <;> assumption
theorem b3n9m071_sa2_chart_base_local (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  first
  | exact Batch3N9.Problem97.b3n9m065_sa2_chart_base_local
  | apply Batch3N9.Problem97.b3n9m065_sa2_chart_base_local <;> assumption
theorem b3n9m071_nonobtuse_v₃_numerator_nonneg_local (v₁ v₂ v₃ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hno : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    0 ≤ v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2 := by
  rw [PiLp.inner_apply] at hno
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
    RCLike.inner_apply, conj_trivial] at hno
  nlinarith only [hno]
noncomputable def b3n9m071_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m071_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m071_halfShift_injective : Function.Injective b3n9m071_halfShift := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective <;> assumption
noncomputable def b3n9m071_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m071_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m071_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m071_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m071_halfShift a) (b3n9m071_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m071_halfShift a - b3n9m071_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m071_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m071_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m071_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m071_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m071_halfShift a ∈ b3n9m071_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m071_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m071_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m071_flipY_injective : Function.Injective b3n9m071_flipY := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective <;> assumption
noncomputable def b3n9m071_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m071_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m071_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m071_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m071_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m071_flipY a) (b3n9m071_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m071_flipY a - b3n9m071_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m071_flipY a - b3n9m071_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m071_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m071_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m071_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m071_flipY a ∈ b3n9m071_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m071_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m071_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  classical
  have htwo : 2 ≤ 2 := by norm_num
  let A2 : Finset ℝ² := ({q1, q2} : Finset ℝ²)
  let L2 : Problem97.CGN.OrderedCap 2 :=
    { points := ![q1, q2]
      injective := by
        intro i j hij
        fin_cases i <;> fin_cases j
        · rfl
        · exfalso
          exact hqne hij
        · exfalso
          exact hqne hij.symm
        · rfl }
  let P2 : Problem97.CGN.MecCapPacket A2 L2 :=
    { hm := htwo
      center := midpoint ℝ q1 q2
      radius := dist q1 q2 / 2
      radius_nonneg := by positivity
      mem_A := by
        intro t
        fin_cases t <;> simp [A2, L2]
      disk_mem := by
        intro t
        fin_cases t
        · simpa [L2, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_left (𝕜 := ℝ) q1 q2)))
        · simpa [L2, dist_comm, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_right (𝕜 := ℝ) q1 q2)))
      first_on_circle := by
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
          Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2,
          midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := htwo
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
            real_inner_self_eq_norm_sq] using
            sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hqne.symm))
        · exfalso
          exact Nat.not_lt_zero 1 hijval
        · exfalso
          exact Nat.lt_irrefl 1 hijval
      subchord_open_side_iff_A := by
        intro r s hrs x hxA
        have hrsval : r.val < s.val := Fin.lt_def.mp hrs
        fin_cases r <;> fin_cases s
        · exfalso
          exact Nat.lt_irrefl 0 hrsval
        · constructor
          · intro hx
            exfalso
            simp [A2] at hxA
            rcases hxA with rfl | rfl
            · simp [L2, Problem97.signedArea2] at hx
            · simp [L2, Problem97.signedArea2] at hx
          · intro hx
            rcases hx with ⟨j, hrj, hjs, _⟩
            fin_cases j <;> omega
        · exfalso
          exact Nat.not_lt_zero 1 hrsval
        · exfalso
          exact Nat.lt_irrefl 1 hrsval }
  rcases Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket P2 Hside2 Hord2 with
    ⟨T0, hT0, tau0, hModel⟩
  let LT0 : Problem97.CGN.OrderedCap 2 := L2.map T0 hT0
  let M0 : Problem97.CGN.MinorCapChainModel LT0 := Classical.choice hModel
  refine ⟨T0, tau0, ?_, ?_⟩
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex htwo)
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex htwo) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex htwo) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex htwo)
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex htwo) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex htwo) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
namespace FiniteEndpointShell
theorem b3n9m071_v2_lt_v2v3_of_mem_I1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI1 : q ∈ S.I1) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v3 := by
  classical
  have hqC1 : q ∈ S.CP.C1 :=
    Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI1)
  have hq_ne_v3 : q ≠ S.triangle.v3 :=
    (Finset.mem_erase.mp hqI1).1
  have hq_ne_v2 : q ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hqI1).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC1
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v3
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v3 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v3
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v3 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m071_v3_lt_v3v1_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v3 p < dist S.triangle.v3 S.triangle.v1 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m067_v3_lt_v3v1_of_mem_I2
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m067_v3_lt_v3v1_of_mem_I2 <;> assumption
theorem b3n9m071_v1_lt_v1v2_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_v1_lt_v1v2_of_mem_I3
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_v1_lt_v1v2_of_mem_I3 <;> assumption
theorem b3n9m071_exists_v3_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v2) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v3⟩ :=
    b3n9m071_exists_base_transportData S.triangle.v1 S.triangle.v3 S.triangle.v13_ne
  have hhalf_neg : b3n9m071_halfShift (Problem97.CGN.vec2 (-1) 0) = Problem97.CGN.vec2 0 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m071_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  have hhalf_one : b3n9m071_halfShift (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m071_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  let T1 : ℝ² → ℝ² := fun x => b3n9m071_halfShift (T0 x)
  let tau1 : Problem97.CGN.SimilarityTransportData T1 :=
    b3n9m071_similarityTransportComp tau0 b3n9m071_halfShiftSimilarityTransportData
  have hT1v1 : T1 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
    change b3n9m071_halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v3 : T1 S.triangle.v3 = Problem97.CGN.vec2 1 0 := by
    change b3n9m071_halfShift (T0 S.triangle.v3) = _
    rw [hT0v3, hhalf_one]
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hsa0 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hbd2 hbd1 hbd3
      S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
  have hv2_off : (T1 S.triangle.v2) 1 ≠ 0 := by
    intro hzero
    have harea : signedArea2 (T1 S.triangle.v2) (T1 S.triangle.v1) (T1 S.triangle.v3) = 0 := by
      rw [hT1v1, hT1v3, b3n9m071_sa2_chart_base_local, hzero]
    have htrans := tau1.halfplane_sign S.triangle.v2 S.triangle.v1 S.triangle.v3
    rw [harea] at htrans
    have ho : tau1.orientation ≠ 0 := by
      intro h0
      have := tau1.orientation_sq
      rw [h0] at this
      norm_num at this
    have hsc : tau1.scale ^ 2 ≠ 0 := pow_ne_zero 2 tau1.scale_pos.ne'
    have : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = 0 := by
      have hcoef : tau1.orientation * tau1.scale ^ 2 ≠ 0 := mul_ne_zero ho hsc
      rcases mul_eq_zero.mp htrans.symm with h | h
      · exact absurd h hcoef
      · exact h
    exact hsa0 this
  rcases lt_trichotomy ((T1 S.triangle.v2) 1) 0 with hneg | hzero | hpos
  · have hflip00 : b3n9m071_flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflip10 : b3n9m071_flipY (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflipy : ∀ p : ℝ², (b3n9m071_flipY p) 1 = -(p 1) := by
      intro p
      simp [b3n9m071_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    let T2 : ℝ² → ℝ² := fun x => b3n9m071_flipY (T1 x)
    let tau2 : Problem97.CGN.SimilarityTransportData T2 :=
      b3n9m071_similarityTransportComp tau1 b3n9m071_flipYSimilarityTransportData
    refine ⟨T2, tau2, ?_, ?_, ?_⟩
    · change b3n9m071_flipY (T1 S.triangle.v1) = _
      rw [hT1v1, hflip00]
    · change b3n9m071_flipY (T1 S.triangle.v3) = _
      rw [hT1v3, hflip10]
    · change 0 < (b3n9m071_flipY (T1 S.triangle.v2)) 1
      rw [hflipy]
      linarith
  · exact absurd hzero hv2_off
  · exact ⟨T1, tau1, hT1v1, hT1v3, hpos⟩
set_option maxHeartbeats 4000000 in
theorem b3n9m071_frame_circumcenter_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hv2y_pos : 0 < (T S.triangle.v2) 1) :
    (T S.Packet.center) 0 = 1 / 2 ∧ 0 ≤ (T S.Packet.center) 1 ∧
      (tau.scale * S.Packet.radius) ^ 2 = 1 / 4 + (T S.Packet.center) 1 ^ 2 := by
  classical
  have hinner_frame : 0 ≤ (inner ℝ (T S.triangle.v1 - T S.triangle.v2)
      (T S.triangle.v3 - T S.triangle.v2) : ℝ) := by
    have hexp := norm_sub_sq_real (T S.triangle.v1 - T S.triangle.v2)
      (T S.triangle.v3 - T S.triangle.v2)
    have hrw : (T S.triangle.v1 - T S.triangle.v2) - (T S.triangle.v3 - T S.triangle.v2)
        = T S.triangle.v1 - T S.triangle.v3 := by abel
    rw [hrw] at hexp
    have n12 : ‖T S.triangle.v1 - T S.triangle.v2‖
        = tau.scale * dist S.triangle.v1 S.triangle.v2 := by rw [← dist_eq_norm, tau.dist_image]
    have n32 : ‖T S.triangle.v3 - T S.triangle.v2‖
        = tau.scale * dist S.triangle.v3 S.triangle.v2 := by rw [← dist_eq_norm, tau.dist_image]
    have n13 : ‖T S.triangle.v1 - T S.triangle.v3‖
        = tau.scale * dist S.triangle.v1 S.triangle.v3 := by rw [← dist_eq_norm, tau.dist_image]
    rw [n12, n32, n13] at hexp
    have horig := norm_sub_sq_real (S.triangle.v1 - S.triangle.v2)
      (S.triangle.v3 - S.triangle.v2)
    have hrw2 : (S.triangle.v1 - S.triangle.v2) - (S.triangle.v3 - S.triangle.v2)
        = S.triangle.v1 - S.triangle.v3 := by abel
    rw [hrw2] at horig
    have hinner0_raw : 0 ≤ (inner ℝ (S.triangle.v3 - S.triangle.v2)
        (S.triangle.v1 - S.triangle.v2) : ℝ) := S.Packet.inner_at_v2
    have hinner0 : 0 ≤ (inner ℝ (S.triangle.v1 - S.triangle.v2)
        (S.triangle.v3 - S.triangle.v2) : ℝ) := by
      simpa [real_inner_comm] using hinner0_raw
    have m12 : ‖S.triangle.v1 - S.triangle.v2‖ = dist S.triangle.v1 S.triangle.v2 :=
      (dist_eq_norm _ _).symm
    have m32 : ‖S.triangle.v3 - S.triangle.v2‖ = dist S.triangle.v3 S.triangle.v2 :=
      (dist_eq_norm _ _).symm
    have m13 : ‖S.triangle.v1 - S.triangle.v3‖ = dist S.triangle.v1 S.triangle.v3 :=
      (dist_eq_norm _ _).symm
    rw [m12, m32, m13] at horig
    have hsc : 0 ≤ tau.scale ^ 2 := sq_nonneg _
    nlinarith only [hexp, hsc, hinner0, horig, mul_nonneg hsc hinner0]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, b3n9m071_vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, b3n9m071_vec2_c1]
  have h3x : (T S.triangle.v3) 0 = 1 := by rw [hv3, b3n9m071_vec2_c0]
  have h3y : (T S.triangle.v3) 1 = 0 := by rw [hv3, b3n9m071_vec2_c1]
  have hnum : 0 ≤ (T S.triangle.v2) 0 ^ 2 - (T S.triangle.v2) 0 + (T S.triangle.v2) 1 ^ 2 :=
    b3n9m071_nonobtuse_v₃_numerator_nonneg_local _ _ _ h1x h1y h3x h3y hinner_frame
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  set R := tau.scale * S.Packet.radius with hR_def
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  set Vx := (T S.triangle.v2) 0 with hVx_def
  set Vy := (T S.triangle.v2) 1 with hVy_def
  set ox := (T S.Packet.center) 0 with hox_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  have hVy_pos : 0 < Vy := hv2y_pos
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [b3n9m071_dist_sq_coords, h1x, h1y] at h
    simpa [hox_def, hOy_def] using h
  have e3 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [b3n9m071_dist_sq_coords, h3x, h3y] at h
    nlinarith only [h]
  have e2 : (Vx - ox) ^ 2 + (Vy - Oy) ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [b3n9m071_dist_sq_coords] at h
    simpa [hVx_def, hVy_def, hox_def, hOy_def] using h
  clear_value Vx Vy ox Oy R
  have hox : ox = 1 / 2 := by nlinarith only [e1, e3]
  have hOy_nonneg : 0 ≤ Oy := by
    have hmecnum : 2 * Vy * Oy = Vx ^ 2 - Vx + Vy ^ 2 := by nlinarith only [e1, e2, e3, hnum, hox]
    nlinarith only [hnum, hmecnum, hv2y_pos, hVy_pos]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith only [e1, e3, hox]
  exact ⟨hox, hOy_nonneg, hRsq⟩
theorem b3n9m071_frame_below_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hv2y_pos : 0 < (T S.triangle.v2) 1)
    (hxI2 : x ∈ S.I2) :
    (T x) 1 ≤ 0 := by
  have hxC2 : x ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hxI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hopp : signedArea2 x S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≤ 0 := by
    have hraw : signedArea2 x S.triangle.v3 S.triangle.v1 *
        signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
      simpa [Problem97.OnArcOpposite] using
        ((S.CP.arc_membership x hxA).2.1.mp hxC2)
    have hswapx : signedArea2 x S.triangle.v3 S.triangle.v1 =
        - signedArea2 x S.triangle.v1 S.triangle.v3 := by
      unfold Problem97.signedArea2
      ring
    have hswap2 : signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 =
        - signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
      unfold Problem97.signedArea2
      ring
    rw [hswapx, hswap2] at hraw
    simpa using hraw
  have hp := tau.halfplane_sign x S.triangle.v1 S.triangle.v3
  have hq := tau.halfplane_sign S.triangle.v2 S.triangle.v1 S.triangle.v3
  rw [hv1, hv3, b3n9m071_sa2_chart_base_local] at hp hq
  have hprod : (T x) 1 * (T S.triangle.v2) 1
      = tau.scale ^ 4 *
        (signedArea2 x S.triangle.v1 S.triangle.v3
          * signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3) := by
    have hkey : (T x) 1 * (T S.triangle.v2) 1
        = (tau.orientation ^ 2 * tau.scale ^ 4) *
          (signedArea2 x S.triangle.v1 S.triangle.v3
            * signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3) := by
      rw [hp, hq]
      ring
    rw [hkey, tau.orientation_sq, one_mul]
  have hle : (T x) 1 * (T S.triangle.v2) 1 ≤ 0 := by
    rw [hprod]
    exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith only [hle, hv2y_pos]
theorem b3n9m071_frame_disk_pt
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hxA : x ∈ A) :
    dist (T x) (T S.Packet.center) ^ 2 ≤ (tau.scale * S.Packet.radius) ^ 2 := by
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]
    exact S.Packet.disk_contains_A x hxA
  have hle : dist (T x) (T S.Packet.center) ≤ tau.scale * S.Packet.radius := by
    rw [tau.dist_image]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  exact pow_le_pow_left₀ dist_nonneg hle 2
set_option maxHeartbeats 1000000 in
theorem b3n9m071_pinclash_scalar (s X Y x y Oy : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hsdef : (X - 1) ^ 2 + Y ^ 2 = s ^ 2)
    (hcirc : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hY : 0 < Y) (hy : y ≤ 0) (hOy : 0 ≤ Oy)
    (hdisk : (x - 1 / 2) ^ 2 + (y - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2)
    (hl : 1 < X ^ 2 + Y ^ 2) :
    s ^ 2 < (X - x) ^ 2 + (Y - y) ^ 2 := by
  have hOyy : Oy * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hOy hy
  have hband : x ≤ 1 - s ^ 2 := by nlinarith only [hcirc, hdisk, hOyy]
  have h1x_nonneg : 0 ≤ 1 - x := by nlinarith only [hdisk, hOyy, hband, sq_nonneg s]
  have hsq : (1 - x) ^ 2 ≤ s ^ 2 := by nlinarith only [hcirc, sq_nonneg y]
  have h1x_le_s : 1 - x ≤ s := by nlinarith only [hcirc, hs1, hdisk, hOyy, hs0, hsq, h1x_nonneg]
  have hS2 : 1 - X < s ^ 2 / 2 := by nlinarith only [hsdef, hl]
  have hYy : Y * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hY) hy
  have hip : (X - 1) * (x - 1) + Y * y < s ^ 2 / 2 := by
    rcases le_or_gt X 1 with hX | hX
    · have h1X : 0 ≤ 1 - X := by linarith
      have hb : (1 - X) * (1 - x) ≤ (1 - X) * s :=
        mul_le_mul_of_nonneg_left h1x_le_s h1X
      have hb2 : (1 - X) * s < s ^ 2 / 2 * s := mul_lt_mul_of_pos_right hS2 hs0
      nlinarith only [hYy, hb, hb2, hs0, hs1, mul_pos (mul_pos hs0 hs0) (show (0 : ℝ) < 1 - s by linarith)]

    · have hnp : (X - 1) * (x - 1) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
      nlinarith only [hYy, hnp, hs0]
  nlinarith only [hsdef, hcirc, hip]
set_option maxHeartbeats 2000000 in
theorem b3n9m071_pinclash_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x₂ : ℝ²}
    (hx2I2 : x₂ ∈ S.I2) (hx2A : x₂ ∈ A)
    (hv3pin : dist S.triangle.v3 x₂ = dist S.triangle.v3 S.triangle.v2)
    (hclash_le : dist S.triangle.v2 x₂ ≤ dist S.triangle.v2 S.triangle.v3)
    (hell : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hs1orig : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := b3n9m071_exists_v3_normalized_transport S
  obtain ⟨hOx, hOy_nonneg, hRsq⟩ := b3n9m071_frame_circumcenter_facts S tau hv1 hv3 hv2y_pos
  have hyy_le : (T x₂) 1 ≤ 0 := b3n9m071_frame_below_chord S tau hv1 hv3 hv2y_pos hx2I2
  have hdisk_x2 := b3n9m071_frame_disk_pt S tau hx2A
  rw [hRsq] at hdisk_x2
  have h3x : (T S.triangle.v3) 0 = 1 := by rw [hv3, b3n9m071_vec2_c0]
  have h3y : (T S.triangle.v3) 1 = 0 := by rw [hv3, b3n9m071_vec2_c1]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, b3n9m071_vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, b3n9m071_vec2_c1]
  have hsc_pos : 0 < tau.scale := tau.scale_pos
  have hbase_sq : dist (T S.triangle.v3) (T S.triangle.v1) ^ 2 = 1 := by
    rw [b3n9m071_dist_sq_coords, h3x, h3y, h1x, h1y]
    norm_num
  have hbase_one : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
    nlinarith only [hbase_sq, dist_nonneg (x := T S.triangle.v3) (y := T S.triangle.v1)]
  have hscale_pin : tau.scale * dist S.triangle.v3 S.triangle.v1 = 1 := by
    rw [← tau.dist_image]
    exact hbase_one
  have hd_v3v2 : dist (T S.triangle.v3) (T S.triangle.v2)
      = tau.scale * dist S.triangle.v3 S.triangle.v2 := tau.dist_image _ _
  have hd_v2x2 : dist (T S.triangle.v2) (T x₂)
      = tau.scale * dist S.triangle.v2 x₂ := tau.dist_image _ _
  have hd_v3x2 : dist (T S.triangle.v3) (T x₂)
      = tau.scale * dist S.triangle.v3 x₂ := tau.dist_image _ _
  have hd_v1v2 : dist (T S.triangle.v1) (T S.triangle.v2)
      = tau.scale * dist S.triangle.v1 S.triangle.v2 := tau.dist_image _ _
  have hv32_pos : 0 < dist S.triangle.v3 S.triangle.v2 := dist_pos.mpr S.triangle.v23_ne.symm
  have hsh_pos : 0 < dist (T S.triangle.v3) (T S.triangle.v2) := by
    rw [hd_v3v2]
    exact mul_pos hsc_pos hv32_pos
  have hs1 : dist (T S.triangle.v3) (T S.triangle.v2) < 1 := by
    rw [hd_v3v2, ← hscale_pin]
    exact mul_lt_mul_of_pos_left hs1orig hsc_pos
  have hpin_frame : dist (T S.triangle.v3) (T x₂) = dist (T S.triangle.v3) (T S.triangle.v2) := by
    rw [hd_v3x2, hv3pin, ← hd_v3v2]
  have hclash_frame_le : dist (T S.triangle.v2) (T x₂) ≤ dist (T S.triangle.v3) (T S.triangle.v2) := by
    rw [hd_v2x2, hd_v3v2]
    have hd : dist S.triangle.v2 x₂ ≤ dist S.triangle.v3 S.triangle.v2 := by
      rw [dist_comm S.triangle.v3 S.triangle.v2]
      exact hclash_le
    exact mul_le_mul_of_nonneg_left hd hsc_pos.le
  have hv12_gt : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v2) := by
    have hv13 : dist S.triangle.v3 S.triangle.v1 = dist S.triangle.v1 S.triangle.v3 := dist_comm _ _
    rw [hd_v1v2, ← hscale_pin, hv13]
    exact mul_lt_mul_of_pos_left hell hsc_pos
  have hv12_gt_sq : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v2) ^ 2 := by
    nlinarith only [hsh_pos, hv12_gt, hs1]
  have hclash_le_sq :
      dist (T S.triangle.v2) (T x₂) ^ 2 ≤ dist (T S.triangle.v3) (T S.triangle.v2) ^ 2 := by
    exact pow_le_pow_left₀ dist_nonneg hclash_frame_le 2
  have hsq_v3v2 := b3n9m071_dist_sq_coords (T S.triangle.v3) (T S.triangle.v2)
  have hsq_v3x2 := b3n9m071_dist_sq_coords (T S.triangle.v3) (T x₂)
  have hsq_v1v2 := b3n9m071_dist_sq_coords (T S.triangle.v1) (T S.triangle.v2)
  have hsq_v2x2 := b3n9m071_dist_sq_coords (T S.triangle.v2) (T x₂)
  have hsq_x2O := b3n9m071_dist_sq_coords (T x₂) (T S.Packet.center)
  rw [h3x, h3y] at hsq_v3v2 hsq_v3x2
  rw [h1x, h1y] at hsq_v1v2
  rw [hOx] at hsq_x2O
  rw [hpin_frame] at hsq_v3x2
  set X := (T S.triangle.v2) 0
  set Y := (T S.triangle.v2) 1
  set xx := (T x₂) 0
  set yy := (T x₂) 1
  set Oy := (T S.Packet.center) 1
  set sh := dist (T S.triangle.v3) (T S.triangle.v2)
  have hsdef : (X - 1) ^ 2 + Y ^ 2 = sh ^ 2 := by linarith [hsq_v3v2]
  have hcirc : (xx - 1) ^ 2 + yy ^ 2 = sh ^ 2 := by linarith [hsq_v3x2]
  have hl : 1 < X ^ 2 + Y ^ 2 := by
    rw [hsq_v1v2] at hv12_gt_sq
    linarith [hv12_gt_sq]
  have hdisk : (xx - 1 / 2) ^ 2 + (yy - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
    rw [hsq_x2O] at hdisk_x2
    linarith [hdisk_x2]
  have hconc : sh ^ 2 < (X - xx) ^ 2 + (Y - yy) ^ 2 :=
    b3n9m071_pinclash_scalar sh X Y xx yy Oy hsh_pos hs1 hsdef hcirc
      hv2y_pos hyy_le hOy_nonneg hdisk hl
  rw [← hsq_v2x2] at hconc
  linarith [hconc, hclash_le_sq]
theorem b3n9m071_pinclash_from_reps
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hA3 : (Z.a3 : ℝ²) ∈ S.I3)
    (hA3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))
    (hv2C1 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 t)
    {x₂ : ℝ²} (hx2I2 : x₂ ∈ S.I2) (hx2T3 : x₂ ∈ S.witnessClassAt_v3 s)
    {p : ℝ²} (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpT2 : p ∈ S.witnessClassAt_v2 t) :
    False := by
  classical
  have hx2A : x₂ ∈ A :=
    S.CP.C2_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp hx2I2).2).2)
  have hv2T3 : S.triangle.v2 ∈ S.witnessClassAt_v3 s := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2C1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hd_v3v2 : dist S.triangle.v3 S.triangle.v2 = s := (Finset.mem_filter.mp hv2T3).2
  have hd_v3x2 : dist S.triangle.v3 x₂ = s := (Finset.mem_filter.mp hx2T3).2
  have hv3pin : dist S.triangle.v3 x₂ = dist S.triangle.v3 S.triangle.v2 := by
    rw [hd_v3x2, hd_v3v2]
  have hx2T2 : x₂ ∈ S.witnessClassAt_v2 t := hI2sub hx2I2
  have hd_v2x2 : dist S.triangle.v2 x₂ = t := (Finset.mem_filter.mp hx2T2).2
  have hd_v2p : dist S.triangle.v2 p = t := (Finset.mem_filter.mp hpT2).2
  have hclash_le : dist S.triangle.v2 x₂ ≤ dist S.triangle.v2 S.triangle.v3 := by
    rw [hd_v2x2, ← hd_v2p]
    rcases Finset.mem_insert.mp hp with hpa1 | hprest
    · have hpI1 : p ∈ S.I1 := by
        rw [Z.hI1]
        simp [hpa1]
      exact le_of_lt (b3n9m071_v2_lt_v2v3_of_mem_I1 S hpI1)
    rcases Finset.mem_insert.mp hprest with hpb1 | hpv3
    · have hpI1 : p ∈ S.I1 := by
        rw [Z.hI1]
        simp [hpb1]
      exact le_of_lt (b3n9m071_v2_lt_v2v3_of_mem_I1 S hpI1)
    · have hpv3' : p = S.triangle.v3 := by simpa using hpv3
      rw [hpv3']
  have hd_v1a3 : dist S.triangle.v1 Z.a3 = r := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hA3eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp ha3T1).2
  have hd_v1v3 : dist S.triangle.v1 S.triangle.v3 = r := by
    rcases hC with ⟨_, _, hv3eq, _⟩
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp hv3T1).2
  have hell : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    rw [hd_v1v3, ← hd_v1a3]
    exact b3n9m071_v1_lt_v1v2_of_mem_I3 S hA3
  have hs1orig : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    rw [← hv3pin]
    exact b3n9m071_v3_lt_v3v1_of_mem_I2 S hx2I2
  exact b3n9m071_pinclash_core S hx2I2 hx2A hv3pin hclash_le hell hs1orig
theorem qEqE_b3_column_pinclash_false_core
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 t)
    (p : ℝ²) (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpC1 : S.witnessClassAt_v2 t ∩ S.CP.C1 = ({p} : Finset ℝ²))
    (hb3C3 : S.witnessClassAt_v2 t ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) :
    False := by
  classical
  rcases hlower with ⟨hA3, hA3eq, -, -, hv2C1, hC2choice⟩
  have hpT2 : p ∈ S.witnessClassAt_v2 t := by
    have hmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpC1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  rcases hC2choice with ha2C2 | hb2C2
  · have hx2T3 : (Z.a2 : ℝ²) ∈ S.witnessClassAt_v3 s := by
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2C2] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx2I2 : (Z.a2 : ℝ²) ∈ S.I2 := by
      rw [Z.hI2]
      simp
    exact b3n9m071_pinclash_from_reps Z hC hA3 hA3eq hv2C1 hI2sub hx2I2 hx2T3 hp hpT2
  · have hx2T3 : (Z.b2 : ℝ²) ∈ S.witnessClassAt_v3 s := by
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hb2C2] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx2I2 : (Z.b2 : ℝ²) ∈ S.I2 := by
      rw [Z.hI2]
      simp
    exact b3n9m071_pinclash_from_reps Z hC hA3 hA3eq hv2C1 hI2sub hx2I2 hx2T3 hp hpT2
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit071

-- Original module: Solutions.Batch3N9.N4d.ExcludesFormCv1
section Batch3N9Unit072
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
def SelectorV3Qv1FullPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 s
  T.card = 4 ∧
    S.I3 ⊆ T ∧
      ∃ p : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
            T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)
def SelectorV2Qa3Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 t
  S.I2 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)
def SelectorV2Qb3Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 t
  S.I2 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)
def FormCv1B3SelectorV3LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 s
  (Z.b3 : ℝ²) ∈ S.I3 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
def Xa3Pin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ _ : (Z.a3 : ℝ²) ∈ S.I3,
    S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)
def AInSCPin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  0 < s ∧ SelectorV3Qv1FullPacket S Z s
def ZeroDefectCapLayout.b3n9m072_swapI3
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.b3
  b3 := Z.a3
  hI1 := Z.hI1
  hI2 := Z.hI2
  hI3 := by simpa [Finset.pair_comm] using Z.hI3
theorem b3n9m072_v3_lt_v3v1_of_mem_I2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v3 p < dist S.triangle.v3 S.triangle.v1 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v1 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v1 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m072_v1_lt_v1v2_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  first
  | exact Batch3N9.Problem97.b3n9m066_v1_lt_v1v2_of_mem_I3_local
  | apply Batch3N9.Problem97.b3n9m066_v1_lt_v1v2_of_mem_I3_local <;> assumption
def ZeroDefectCapLayout.b3n9m072_swapI1
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.b1
  b1 := Z.a1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := by simpa [Finset.pair_comm] using Z.hI1
  hI2 := Z.hI2
  hI3 := Z.hI3
theorem b3n9m072_I1_v2_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I1 ∧
      dist S.triangle.v2 near < dist S.triangle.v2 far ∧
      dist S.triangle.v2 far < dist S.triangle.v2 S.triangle.v3 := by
  classical
  have hC1four : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points)
          L.injective
      _ = S.CP.C1.card := by rw [hLC]
      _ = 4 := hC1four
  subst m
  let i0 : Fin 4 := ⟨0, by omega⟩
  let i1 : Fin 4 := ⟨1, by omega⟩
  let i2 : Fin 4 := ⟨2, by omega⟩
  let i3 : Fin 4 := ⟨3, by omega⟩
  have hi12 : i1 < i2 := by
    apply Fin.lt_def.mpr
    simp [i1, i2]
  have hi23 : i2 < i3 := by
    apply Fin.lt_def.mpr
    simp [i2, i3]
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v3 := by
      simpa [hidx3, i3] using hFirstLast.2
    have hnearfar : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmono hi12
      simpa [hfirst0] using htmp
    have hfarv3 : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 S.triangle.v3 := by
      have htmp :
          dist (L.points i0) (L.points i2) < dist (L.points i0) (L.points i3) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0, hidx3]
          using hmono hi23
      simpa [hfirst0, hlast3] using htmp
    have hnearC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hfarC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hnear_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hfar_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hnearI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      have hne : L.points i1 ≠ L.points i2 := by
        intro h
        have : i1 = i2 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hnearfar, hfarv3⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
  · have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v3 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hLastFirst.2
    have hi1rev : i1.rev = i2 := by
      ext
      simp [i1, i2, Fin.val_rev]
    have hi2rev : i2.rev = i1 := by
      ext
      simp [i1, i2, Fin.val_rev]
    have hi3rev : i3.rev = i0 := by
      ext
      simp [i0, i3, Fin.val_rev]
    have hnearfar : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmono hi12
      simpa [hlast3] using htmp
    have hfarv3 : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 S.triangle.v3 := by
      have htmp :
          dist (L.points i3) (L.points i1) < dist (L.points i3) (L.points i0) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi2rev, hi3rev] using hmono hi23
      simpa [hlast3, hfirst0] using htmp
    have hnearC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hfarC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hnear_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hfar_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hnearI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      have hne : L.points i2 ≠ L.points i1 := by
        intro h
        have : i2 = i1 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hnearfar, hfarv3⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
theorem b3n9m072_selectorShape_v2_q_eq_v1_impossible_of_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {t : ℝ}
    (hpacket : SelectorV2Qv1Packet S Z t)
    (hb1a1 : dist S.triangle.v2 Z.b1 < dist S.triangle.v2 Z.a1)
    (ha1v3 : dist S.triangle.v2 Z.a1 < dist S.triangle.v2 S.triangle.v3)
    (hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  let T := S.witnessClassAt_v2 t
  rcases hpacket with ⟨_, _, p, hp, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have hpeqd : dist S.triangle.v2 p = dist S.triangle.v2 S.triangle.v1 := by
    exact (Finset.mem_filter.mp hpT).2.trans ((Finset.mem_filter.mp hv1T).2.symm)
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · subst hpa1
    linarith
  rcases Finset.mem_insert.mp hp with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    subst hpb1'
    linarith
  have hpv3' : p = S.triangle.v3 := by simpa using hpv3
  subst hpv3'
  linarith
theorem b3n9m072_selectorShape_v2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {t : ℝ}
    (hpacket : SelectorV2Qv1Packet S Z t)
    (hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  rcases S.b3n9m072_I1_v2_distance_chain with ⟨near, far, hI1eq, hnearfar, hfarv3⟩
  have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
    simpa [Z.hI1] using S.I1_card_eq_two
  have hab_ne : Z.a1 ≠ Z.b1 := by
    intro h
    simp [h] at hI1card
  have haI1 : Z.a1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  have hbI1 : Z.b1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  rw [← hI1eq] at haI1 hbI1
  rcases Finset.mem_insert.mp haI1 with haNear | haFar
  · have hbFar : Z.b1 = far := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · exfalso
        exact hab_ne (haNear.trans hbNear.symm)
      · simpa using hbFar
    have hpacket' : SelectorV2Qv1Packet S (Z.b3n9m072_swapI1) t := by
      simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.b3n9m072_swapI1, Finset.insert_comm] using hpacket
    apply b3n9m072_selectorShape_v2_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z.b3n9m072_swapI1) (t := t) hpacket'
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI1, haNear, hbFar] using hnearfar
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI1, hbFar] using hfarv3
    · exact hv3v1
  · have haFar' : Z.a1 = far := by
      simpa using haFar
    have hbNear : Z.b1 = near := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · simpa using hbNear
      · exfalso
        have hbFar' : Z.b1 = far := by simpa using hbFar
        exact hab_ne (haFar'.trans hbFar'.symm)
    apply b3n9m072_selectorShape_v2_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z) (t := t) hpacket
    · simpa [hbNear, haFar'] using hnearfar
    · simpa [haFar'] using hfarv3
    · exact hv3v1
theorem n4d_cB1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC : S.IsFormC_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxa3 : Xa3Pin S Z r)
    (hAinSC : AInSCPin S Z s) :
    False := by
  classical
  obtain ⟨ha3I3, ha3C3⟩ := hxa3
  obtain ⟨hs, hsel⟩ := hAinSC
  obtain ⟨hTcard, hI3sub, q, hq, hqC1, hv1C2⟩ := hsel
  exact n4d_cB1_impossible_core S Z hC hcard ha3I3 ha3C3 hs hTcard hI3sub q hq hqC1 hv1C2
theorem n4d_cA_3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA3, ha3eq, hTcard, hI3sub, hC1eq, hC2eq⟩
  let T := S.witnessClassAt_v3 s
  have hv2T : S.triangle.v2 ∈ T := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a2 : ℝ²) ∈ T ∩ S.CP.C2 ∨ (Z.b2 : ℝ²) ∈ T ∩ S.CP.C2 := by
    rcases hC2eq with hqa2 | hqb2
    · left
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hqa2] at hmem
      exact hmem
    · right
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hqb2] at hmem
      exact hmem
  obtain ⟨q, hqI2, hqT3⟩ : ∃ q : ℝ², q ∈ S.I2 ∧ q ∈ T := by
    rcases hq with hqa2 | hqb2
    · refine ⟨Z.a2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqa2).1
    · refine ⟨Z.b2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqb2).1
  have hv2rad : dist S.triangle.v3 S.triangle.v2 = s := by
    simpa [T] using (Finset.mem_filter.mp hv2T).2
  have hqrad : dist S.triangle.v3 q = s := by
    simpa [T] using (Finset.mem_filter.mp hqT3).2
  have hq_lt_base : dist S.triangle.v3 q < dist S.triangle.v3 S.triangle.v1 :=
    b3n9m072_v3_lt_v3v1_of_mem_I2_local S hqI2
  have hbase_lt_long : dist S.triangle.v3 S.triangle.v1 < dist S.triangle.v2 S.triangle.v1 := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3eq] at ha3mem
      exact (Finset.mem_inter.mp ha3mem).1
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      rcases hC with ⟨_, _, hv3eq, _⟩
      have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hv3mem
      exact (Finset.mem_inter.mp hv3mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v3 = dist S.triangle.v1 Z.a3 := by
      have hv3dist : dist S.triangle.v1 S.triangle.v3 = r := by
        simpa using (Finset.mem_filter.mp hv3T1).2
      have ha3dist : dist S.triangle.v1 Z.a3 = r := by
        simpa using (Finset.mem_filter.mp ha3T1).2
      rw [hv3dist, ha3dist]
    have h := b3n9m072_v1_lt_v1v2_of_mem_I3_local S hA3
    simpa [hbase_eq, dist_comm] using h
  have hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1 := by
    calc
      dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v3 S.triangle.v2 := by rw [dist_comm]
      _ = dist S.triangle.v3 q := by rw [hv2rad, hqrad]
      _ < dist S.triangle.v3 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v2 S.triangle.v1 := hbase_lt_long
  exact b3n9m072_selectorShape_v2_q_eq_v1_impossible S Z hpacket2 hv3v1
theorem n4d_cA_3_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qa3Packet S Z t) :
    False := by
  classical
  obtain ⟨hI2sub, p, hp, hpC1, ha3C3⟩ := hpacket2
  exact n4d_cA_3_q_eq_C_impossible_core S Z hC hlower hI2sub p hp hpC1 ha3C3
theorem qEqE_b3_column_pinclash_false
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qb3Packet S Z t) :
    False := by
  classical
  obtain ⟨hI2sub, p, hp, hpC1, hb3C3⟩ := hpacket2
  exact qEqE_b3_column_pinclash_false_core Z hC hlower hI2sub p hp hpC1 hb3C3
theorem n4d_cB_3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1B3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hB3, hb3eq, hTcard, hI3sub, hC1eq, hC2eq⟩
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.b3n9m072_swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hB3
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hb3eq
  have hpacket2' : SelectorV2Qv1Packet S Z.b3n9m072_swapI3 t := by
    simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.b3n9m072_swapI3] using hpacket2
  exact S.n4d_cA_3_q_eq_v1_impossible (Z := Z.b3n9m072_swapI3) hC hlower' hpacket2'
theorem n4d_cB_5_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hB3 : (Z.b3 : ℝ²) ∈ S.I3)
    (hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²))
    (hC2eq :
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
    (hpacket : SelectorV2Qa3Packet S Z t) :
    False := by
  classical
  rcases hpacket with ⟨hI2sub, p, hp, hpC1, hqC3⟩
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.b3n9m072_swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hB3
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hb3eq
  have hpacket' : SelectorV2Qb3Packet S Z.b3n9m072_swapI3 t := by
    refine ⟨hI2sub, p, ?_, hpC1, ?_⟩
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hp
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hqC3
  exact qEqE_b3_column_pinclash_false (S := S) (Z := Z.b3n9m072_swapI3) hC hlower' hpacket'
theorem n4d_cB_4_q_eq_E_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hB3 : (Z.b3 : ℝ²) ∈ S.I3)
    (hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²))
    (hC2eq :
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
    (hpacket : SelectorV2Qb3Packet S Z t) :
    False := by
  classical
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.b3n9m072_swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hB3
    · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hb3eq
  have hpacket' : SelectorV2Qa3Packet S Z.b3n9m072_swapI3 t := by
    simpa [SelectorV2Qa3Packet, SelectorV2Qb3Packet, ZeroDefectCapLayout.b3n9m072_swapI3] using hpacket
  exact S.n4d_cA_3_q_eq_C_impossible (Z := Z.b3n9m072_swapI3) hC hlower' hpacket'
theorem N4dExcludesFormC_v1_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormC_v1 := by
  classical
  intro r hr hcard hesc hC
  let Z : ZeroDefectCapLayout S := S.zeroDefectCapLayout
  rcases S.formC_v1_split Z hC with ⟨ha3, hxa3⟩ | ⟨hb3, hxb3⟩
  · rcases S.selectorShape_v3_split Z with ⟨s, hs, hsplit3⟩
    rcases hsplit3 with ⟨hTcard3, hI3sub, hcases3⟩
    rcases hcases3 with hqv1 | hlower
    · have hA3 : Xa3Pin S Z r := ⟨ha3, hxa3⟩
      have hAinSC : AInSCPin S Z s := by
        refine ⟨hs, ?_⟩
        rcases hqv1 with ⟨p, hp, hpC1, hv1C2⟩
        exact ⟨hTcard3, hI3sub, p, hp, hpC1, hv1C2⟩
      exact S.n4d_cB1_impossible Z hC hcard hA3 hAinSC
    · rcases hlower with hqa2 | hqb2
      · rcases hqa2 with ⟨p3, hp3, hp3C1, ha2C2⟩
        have hp3v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hC ha3 hxa3 hI3sub hp3 hp3C1
        have hlowerPacket : FormCv1A3SelectorV3LowerPacket S Z r s := by
          exact ⟨ha3, hxa3, hTcard3, hI3sub, hp3v2, Or.inl ha2C2⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cA_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · exact S.n4d_cA_3_q_eq_C_impossible Z hC hlowerPacket ⟨hI2sub, hqa3⟩
          · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpa1 | hp2
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpa1] using hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpb1 | hpv3
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpb1] using hp2, hp2C1, hb3C3⟩
            · have hpv3' : p2 = S.triangle.v3 := by simpa using hpv3
              rw [hpv3'] at hp2C1
              exact S.pEqC_column_impossible Z hC hlowerPacket
                (by
                  exact ⟨hI2sub, hp2C1, Or.inr hb3C3⟩)
      · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
        have hp3v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hC ha3 hxa3 hI3sub hp3 hp3C1
        have hlowerPacket : FormCv1A3SelectorV3LowerPacket S Z r s := by
          exact ⟨ha3, hxa3, hTcard3, hI3sub, hp3v2, Or.inr hb2C2⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cA_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · exact S.n4d_cA_3_q_eq_C_impossible Z hC hlowerPacket ⟨hI2sub, hqa3⟩
          · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpa1 | hp2
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpa1] using hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpb1 | hpv3
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpb1] using hp2, hp2C1, hb3C3⟩
            · have hpv3' : p2 = S.triangle.v3 := by simpa using hpv3
              rw [hpv3'] at hp2C1
              exact S.pEqC_column_impossible Z hC hlowerPacket
                (by
                  exact ⟨hI2sub, hp2C1, Or.inr hb3C3⟩)
  · rcases S.selectorShape_v3_split Z with ⟨s, hs, hsplit3⟩
    rcases hsplit3 with ⟨hTcard3, hI3sub, hcases3⟩
    rcases hcases3 with hqv1 | hlower
    · have hA3 : Xa3Pin S (Z.b3n9m072_swapI3) r := by
        refine ⟨?_, ?_⟩
        · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hb3
        · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hxb3
      have hAinSC : AInSCPin S (Z.b3n9m072_swapI3) s := by
        refine ⟨hs, ?_⟩
        rcases hqv1 with ⟨p, hp, hpC1, hv1C2⟩
        refine ⟨hTcard3, ?_, p, ?_, hpC1, hv1C2⟩
        · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hI3sub
        · simpa [ZeroDefectCapLayout.b3n9m072_swapI3] using hp
      exact S.n4d_cB1_impossible (Z := Z.b3n9m072_swapI3) hC hcard hA3 hAinSC
    · rcases hlower with hqa2 | hqb2
      · rcases hqa2 with ⟨p3, hp3, hp3C1, ha2C2⟩
        have hB3 : (Z.b3 : ℝ²) ∈ S.I3 := hb3
        have hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) := hxb3
        have hI3sub3 : S.I3 ⊆ S.witnessClassAt_v3 s := hI3sub
        have hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 (Z := Z.b3n9m072_swapI3) hr hs hcard hC hb3 hxb3 hI3sub hp3 hp3C1
        have hC2eq :
            (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
              (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :=
          Or.inl ha2C2
        have hlowerPacket : FormCv1B3SelectorV3LowerPacket S Z r s := by
          exact ⟨hB3, hb3eq, hTcard3, hI3sub3, hC1eq, hC2eq⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cB_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · have hpacket : SelectorV2Qa3Packet S Z t := by
              dsimp [SelectorV2Qa3Packet]
              exact ⟨hI2sub, hqa3⟩
            exact S.n4d_cB_5_q_eq_C_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq hpacket
          · rcases hqb3 with ⟨p, hp, hpeq, hqeqC3⟩
            exact S.n4d_cB_4_q_eq_E_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq
              ⟨hI2sub, p, hp, hpeq, hqeqC3⟩
      · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
        have hB3 : (Z.b3 : ℝ²) ∈ S.I3 := hb3
        have hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) := hxb3
        have hI3sub3 : S.I3 ⊆ S.witnessClassAt_v3 s := hI3sub
        have hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 (Z := Z.b3n9m072_swapI3) hr hs hcard hC hb3 hxb3 hI3sub hp3 hp3C1
        have hC2eq :
            (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
              (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :=
          Or.inr hb2C2
        have hlowerPacket : FormCv1B3SelectorV3LowerPacket S Z r s := by
          exact ⟨hB3, hb3eq, hTcard3, hI3sub3, hC1eq, hC2eq⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cB_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · have hpacket : SelectorV2Qa3Packet S Z t := by
              dsimp [SelectorV2Qa3Packet]
              exact ⟨hI2sub, hqa3⟩
            exact S.n4d_cB_5_q_eq_C_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq hpacket
          · rcases hqb3 with ⟨p, hp, hpeq, hqeqC3⟩
            exact S.n4d_cB_4_q_eq_E_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq
              ⟨hI2sub, p, hp, hpeq, hqeqC3⟩
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit072
