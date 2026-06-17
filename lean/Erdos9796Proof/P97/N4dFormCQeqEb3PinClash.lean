import Erdos9796Proof.P97.N4dFormCPEqCProducer
import Erdos9796Proof.P97.N4dFormCLowerForcesV2

/-!
# `N4d` Form-`c` q'=E b₃ column -- the pin-clash closer

This file mirrors `N4dQeqEb2PinClash.lean` under
`C₂ ↔ C₃`, `v₂ ↔ v₃`, `I₂ ↔ I₃`, `a₂ ↔ a₃`, `b₂ ↔ b₃`.
It is self-contained with respect to the FormC orchestrator: the q'=E packet is
taken in its unfolded form, so this file does not import
`N4dExcludesFormCv1.lean`.
-/

open scoped EuclideanGeometry InnerProductSpace
open Finset

namespace Problem97

/- ### Chart coordinate helpers -/

private theorem dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

private theorem vec2_c0 (a b : ℝ) : (Problem97.CGN.vec2 a b) 0 = a := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem vec2_c1 (a b : ℝ) : (Problem97.CGN.vec2 a b) 1 = b := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem sa2_chart_base_local (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

private theorem signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

private theorem nonobtuse_v₃_numerator_nonneg_local (v₁ v₂ v₃ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hno : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    0 ≤ v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2 := by
  rw [PiLp.inner_apply] at hno
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
    RCLike.inner_apply, conj_trivial] at hno
  nlinarith [hno]

/- ### Transport helpers copied locally from the FormC producer -/

private noncomputable def similarityTransportComp
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
    nlinarith
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring

private noncomputable def halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)

private theorem halfShift_injective : Function.Injective halfShift := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (halfShift a) (halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        halfShift a - halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
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
      nlinarith
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith
  · intro S a
    have hmap : halfShift '' convexHull ℝ S = convexHull ℝ (halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show halfShift a ∈ halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private noncomputable def flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)

private theorem flipY_injective : Function.Injective flipY := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (flipY a) (flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖flipY a - flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖flipY a - flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith
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
    have hmap : flipY '' convexHull ℝ S = convexHull ℝ (flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show flipY a ∈ flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private theorem exists_base_transportData
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

/- ### Mirrored radial-order ladders -/

namespace FiniteEndpointShell

/-- Any `I₁` vertex is strictly closer to `v₂` than the opposite endpoint `v₃`. -/
private theorem v2_lt_v2v3_of_mem_I1
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

/-- Any `I₂` vertex lies strictly before the far endpoint `v₁` in the
`v₃`-radial order on support cap `C₂`. -/
private theorem v3_lt_v3v1_of_mem_I2
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

/-- Any `I₃` vertex lies strictly before the far endpoint `v₂` in the
`v₁`-radial order on support cap `C₃`. -/
private theorem v1_lt_v1v2_of_mem_I3
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

/- ### The faithful-frame facts for the `v₁v₃` base -/

private theorem exists_v3_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v2) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v3⟩ :=
    exists_base_transportData S.triangle.v1 S.triangle.v3 S.triangle.v13_ne
  have hhalf_neg : halfShift (Problem97.CGN.vec2 (-1) 0) = Problem97.CGN.vec2 0 0 := by
    ext i <;> fin_cases i <;>
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  have hhalf_one : halfShift (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
    ext i <;> fin_cases i <;>
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  let T1 : ℝ² → ℝ² := fun x => halfShift (T0 x)
  let tau1 : Problem97.CGN.SimilarityTransportData T1 :=
    similarityTransportComp tau0 halfShiftSimilarityTransportData
  have hT1v1 : T1 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
    change halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v3 : T1 S.triangle.v3 = Problem97.CGN.vec2 1 0 := by
    change halfShift (T0 S.triangle.v3) = _
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
      rw [hT1v1, hT1v3, sa2_chart_base_local, hzero]
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
  · have hflip00 : flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflip10 : flipY (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflipy : ∀ p : ℝ², (flipY p) 1 = -(p 1) := by
      intro p
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    let T2 : ℝ² → ℝ² := fun x => flipY (T1 x)
    let tau2 : Problem97.CGN.SimilarityTransportData T2 :=
      similarityTransportComp tau1 flipYSimilarityTransportData
    refine ⟨T2, tau2, ?_, ?_, ?_⟩
    · change flipY (T1 S.triangle.v1) = _
      rw [hT1v1, hflip00]
    · change flipY (T1 S.triangle.v3) = _
      rw [hT1v3, hflip10]
    · change 0 < (flipY (T1 S.triangle.v2)) 1
      rw [hflipy]
      linarith
  · exact absurd hzero hv2_off
  · exact ⟨T1, tau1, hT1v1, hT1v3, hpos⟩

set_option maxHeartbeats 4000000 in
/-- The MEC circumcentre lands at `O = (1/2, Oy)` with `Oy ≥ 0` in the
normalized `v₁v₃` base frame. -/
private theorem frame_circumcenter_facts
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
    nlinarith [hexp, horig, hinner0, hsc, mul_nonneg hsc hinner0]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, vec2_c1]
  have h3x : (T S.triangle.v3) 0 = 1 := by rw [hv3, vec2_c0]
  have h3y : (T S.triangle.v3) 1 = 0 := by rw [hv3, vec2_c1]
  have hnum : 0 ≤ (T S.triangle.v2) 0 ^ 2 - (T S.triangle.v2) 0 + (T S.triangle.v2) 1 ^ 2 :=
    nonobtuse_v₃_numerator_nonneg_local _ _ _ h1x h1y h3x h3y hinner_frame
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
    rw [dist_sq_coords, h1x, h1y] at h
    simpa [hox_def, hOy_def] using h
  have e3 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [dist_sq_coords, h3x, h3y] at h
    nlinarith [h]
  have e2 : (Vx - ox) ^ 2 + (Vy - Oy) ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [dist_sq_coords] at h
    simpa [hVx_def, hVy_def, hox_def, hOy_def] using h
  clear_value Vx Vy ox Oy R
  have hox : ox = 1 / 2 := by nlinarith [e1, e3]
  have hOy_nonneg : 0 ≤ Oy := by
    have hmecnum : 2 * Vy * Oy = Vx ^ 2 - Vx + Vy ^ 2 := by nlinarith [e1, e2, hox]
    nlinarith [hmecnum, hnum, hVy_pos]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith [e1, hox]
  exact ⟨hox, hOy_nonneg, hRsq⟩

/-- A cap-`C₂` interior point lands below the base chord in the normalized
`v₁v₃` frame. -/
private theorem frame_below_chord
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
  rw [hv1, hv3, sa2_chart_base_local] at hp hq
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
  nlinarith [hle, hv2y_pos]

/-- Every `A`-point lands in the closed MEC disk in the normalized frame
(squared form, radius `scale·radius`). -/
private theorem frame_disk_pt
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

/- ### The verified scalar core, copied locally from the FormB pin-clash file -/

set_option maxHeartbeats 1000000 in
-- Scalar `nlinarith` certificate copied from the FormB source; the algebra is
-- small, but the nonlinear certificate exceeds the default heartbeat budget.
/-- In the normalized frame with the base-endpoint pin `(x-1)^2+y^2 = s^2`,
the apex pin `(X-1)^2+Y^2 = s^2`, below-chord `y ≤ 0`, disk-containment, and
`|v₁ apex| > 1`, the squared apex distance to the double-pinned point exceeds
`s^2`. -/
private theorem pinclash_scalar (s X Y x y Oy : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hsdef : (X - 1) ^ 2 + Y ^ 2 = s ^ 2)
    (hcirc : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hY : 0 < Y) (hy : y ≤ 0) (hOy : 0 ≤ Oy)
    (hdisk : (x - 1 / 2) ^ 2 + (y - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2)
    (hl : 1 < X ^ 2 + Y ^ 2) :
    s ^ 2 < (X - x) ^ 2 + (Y - y) ^ 2 := by
  have hOyy : Oy * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hOy hy
  have hband : x ≤ 1 - s ^ 2 := by nlinarith [hdisk, hcirc, hOyy]
  have h1x_nonneg : 0 ≤ 1 - x := by nlinarith [hband, sq_nonneg s]
  have hsq : (1 - x) ^ 2 ≤ s ^ 2 := by nlinarith [hcirc, sq_nonneg y]
  have h1x_le_s : 1 - x ≤ s := by nlinarith [hsq, h1x_nonneg, hs0]
  have hS2 : 1 - X < s ^ 2 / 2 := by nlinarith [hsdef, hl]
  have hYy : Y * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hY) hy
  have hip : (X - 1) * (x - 1) + Y * y < s ^ 2 / 2 := by
    rcases le_or_gt X 1 with hX | hX
    · have h1X : 0 ≤ 1 - X := by linarith
      have hb : (1 - X) * (1 - x) ≤ (1 - X) * s :=
        mul_le_mul_of_nonneg_left h1x_le_s h1X
      have hb2 : (1 - X) * s < s ^ 2 / 2 * s := mul_lt_mul_of_pos_right hS2 hs0
      nlinarith [hb, hb2, hYy, hs0, hs1,
        mul_pos (mul_pos hs0 hs0) (show (0 : ℝ) < 1 - s by linarith)]
    · have hnp : (X - 1) * (x - 1) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
      nlinarith [hnp, hYy, hs0]
  nlinarith [hip, hsdef, hcirc]

/- ### The frame-transported mirrored core -/

set_option maxHeartbeats 2000000 in
/-- The FormC mirror of the pin-clash core, in original-space geometric inputs.
The clash input is non-strict so the endpoint case `p = v₃` is also covered. -/
private theorem pinclash_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x₂ : ℝ²}
    (hx2I2 : x₂ ∈ S.I2) (hx2A : x₂ ∈ A)
    (hv3pin : dist S.triangle.v3 x₂ = dist S.triangle.v3 S.triangle.v2)
    (hclash_le : dist S.triangle.v2 x₂ ≤ dist S.triangle.v2 S.triangle.v3)
    (hell : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hs1orig : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := exists_v3_normalized_transport S
  obtain ⟨hOx, hOy_nonneg, hRsq⟩ := frame_circumcenter_facts S tau hv1 hv3 hv2y_pos
  have hyy_le : (T x₂) 1 ≤ 0 := frame_below_chord S tau hv1 hv3 hv2y_pos hx2I2
  have hdisk_x2 := frame_disk_pt S tau hx2A
  rw [hRsq] at hdisk_x2
  have h3x : (T S.triangle.v3) 0 = 1 := by rw [hv3, vec2_c0]
  have h3y : (T S.triangle.v3) 1 = 0 := by rw [hv3, vec2_c1]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, vec2_c1]
  have hsc_pos : 0 < tau.scale := tau.scale_pos
  have hbase_sq : dist (T S.triangle.v3) (T S.triangle.v1) ^ 2 = 1 := by
    rw [dist_sq_coords, h3x, h3y, h1x, h1y]
    norm_num
  have hbase_one : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
    nlinarith [hbase_sq, dist_nonneg (x := T S.triangle.v3) (y := T S.triangle.v1)]
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
    nlinarith [hv12_gt]
  have hclash_le_sq :
      dist (T S.triangle.v2) (T x₂) ^ 2 ≤ dist (T S.triangle.v3) (T S.triangle.v2) ^ 2 := by
    exact pow_le_pow_left₀ dist_nonneg hclash_frame_le 2
  have hsq_v3v2 := dist_sq_coords (T S.triangle.v3) (T S.triangle.v2)
  have hsq_v3x2 := dist_sq_coords (T S.triangle.v3) (T x₂)
  have hsq_v1v2 := dist_sq_coords (T S.triangle.v1) (T S.triangle.v2)
  have hsq_v2x2 := dist_sq_coords (T S.triangle.v2) (T x₂)
  have hsq_x2O := dist_sq_coords (T x₂) (T S.Packet.center)
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
    pinclash_scalar sh X Y xx yy Oy hsh_pos hs1 hsdef hcirc
      hv2y_pos hyy_le hOy_nonneg hdisk hl
  rw [← hsq_v2x2] at hconc
  linarith [hconc, hclash_le_sq]

/- ### Packet-level assembly -/

/-- Feed the named `C₂`/`C₁` representatives into the mirrored pin-clash core. -/
private theorem pinclash_from_reps
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
      exact le_of_lt (v2_lt_v2v3_of_mem_I1 S hpI1)
    rcases Finset.mem_insert.mp hprest with hpb1 | hpv3
    · have hpI1 : p ∈ S.I1 := by
        rw [Z.hI1]
        simp [hpb1]
      exact le_of_lt (v2_lt_v2v3_of_mem_I1 S hpI1)
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
    exact v1_lt_v1v2_of_mem_I3 S hA3
  have hs1orig : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    rw [← hv3pin]
    exact v3_lt_v3v1_of_mem_I2 S hx2I2
  exact pinclash_core S hx2I2 hx2A hv3pin hclash_le hell hs1orig

/-- FormC mirror of the q'=E pin-clash closer in the `y = a₃` branch, with the
`SelectorV2Qb3Packet` body unfolded to avoid an import cycle. -/
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
    exact pinclash_from_reps Z hC hA3 hA3eq hv2C1 hI2sub hx2I2 hx2T3 hp hpT2
  · have hx2T3 : (Z.b2 : ℝ²) ∈ S.witnessClassAt_v3 s := by
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hb2C2] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx2I2 : (Z.b2 : ℝ²) ∈ S.I2 := by
      rw [Z.hI2]
      simp
    exact pinclash_from_reps Z hC hA3 hA3eq hv2C1 hI2sub hx2I2 hx2T3 hp hpT2

end FiniteEndpointShell

end Problem97
