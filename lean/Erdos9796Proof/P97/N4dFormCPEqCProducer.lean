import Erdos9796Proof.P97.N9EndpointN4e

/-!
# `N4d` Form-`c`, `p' = C` producer

This file mirrors the Form-`b`, `p' = B` producer under the swap
`C₂ ↔ C₃`, `v₂ ↔ v₃`, `I₂ ↔ I₃`, `a₂ ↔ a₃`, `b₂ ↔ b₃` at the same apex `v₁`.
It keeps the mirrored packet shapes and the equilateral lower-apex row closer
local to this file so the large `N9EndpointN4e.lean` module is not edited.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- The Form-`c`, `y = a₃`, lower-side packet: the `v₁` Form-`c` class chooses
`a₃`, and the forced `v₃` selector chooses the named `C₁` witness `v₂` together
with one lower-chain witness from `{a₂,b₂}`. -/
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

/-- The `p' = C` row inside the forced `v₂` selector. The selector contains the
whole lower witness pair `I₂`, meets `C₁` in the named point `v₃`, and meets
`C₃` in one of the two upper witnesses. -/
def SelectorV2PeqCPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 r
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

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

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the
`v₁`-radial order on support cap `C₂`. -/
private theorem v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
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
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
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
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
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
      hi, hLastFirst.1, hLastFirst.2] using hlt

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

private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

private theorem signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

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
    { hm := by decide
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
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2, midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := by decide
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, real_inner_self_eq_norm_sq] using
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
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

/-- Coordinate contradiction for the mirrored `p' = C` lower-apex rows. -/
private theorem pEqC_lower_apex_dist_contradiction
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
    have h1 : 0 < a * Real.cos δ := by nlinarith [hdot, hblo, hsin, hr]
    rcases lt_trichotomy a 0 with h | h | h
    · nlinarith
    · simp [h] at h1
    · exact h
  have hAB_sq : dist A B ^ 2 = 1 := by
    rw [hA, hB, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist A q ^ 2 = 1 + 2 * a + r ^ 2 := by
    rw [hA, hq, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith [hcirc]
  have h1 : 0 ≤ dist A q := dist_nonneg
  have h2 : 0 ≤ dist A B := dist_nonneg
  nlinarith [hcap, hAB_sq, hAq_sq, ha_pos, hr, h1, h2]

/-- Branch-local normalized configuration packet for the `p' = C` rows. -/
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

/-- Consumer step for the `p' = C` rows from the normalized lower-apex packet. -/
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
    nlinarith [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q),
      dist_nonneg (x := S.triangle.v1) (y := S.triangle.v3)]
  exact pEqC_lower_apex_dist_contradiction
    (T S.triangle.v1) (T S.triangle.v3) (T q) r δ a b hr
    hv1 hv3 hqT hcirc hdot hblo hδlo hδhi hcapT

/-- Row-level closure for the `p' = C` equilateral-apex rows once the normalized
configuration is available. -/
theorem pEqC_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI2 : q ∈ S.I2)
    (hconfig : S.PEqCLowerApexConfig q r) :
    False :=
  S.pEqC_row_impossible_of_normalized_config hconfig (S.v1_lt_v1v3_of_mem_I2 hqI2)

set_option maxHeartbeats 8000000 in
-- Large heartbeat budget: mirror of the Form-`b` similarity transport and
-- lower-apex angle-bound proof, with the `C₂` arc-sign orientation converted.
/-- Build the prose-normalized `PEqCLowerApexConfig` from shell-level
equilateral data for the `p' = C` lower-apex rows. -/
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
  rcases exists_base_transportData q1 q2 hq1ne with
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
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.PEqCLowerApexConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
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
          S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v3_mem
            hq_ne_v1 hq_ne_v3 S.triangle.v13_ne hcol
      have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
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
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
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
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hdx_def, hdy_def]; nlinarith [hsq]
    have hcircQ : a ^ 2 + b ^ 2 = r ^ 2 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [ha_def, hb_def]; nlinarith [hsq]
    have hdot_raw : a * dx + b * dy = r ^ 2 / 2 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q3) (T q)
      rw [hDq_T] at hsq
      rw [ha_def, hb_def, hdx_def, hdy_def]
      nlinarith [hsq, hcircD, hcircQ]
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
        nlinarith [this, hscale, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by rw [hAB_T]; ring
      have hAD_sq := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
      rw [hv1c0, hv1c1] at hAD_sq
      have hAD_sq' : dist (T q1) (T q3) ^ 2 = 1 + 2 * dx + r ^ 2 := by
        rw [hAD_sq]; nlinarith [hcircD, hdx_def, hdy_def]
      have hAD' : (1 : ℝ) < dist (T q1) (T q3) := by rw [hAB1] at hAD; exact hAD
      nlinarith [hAD', hAD_sq', dist_nonneg (x := T q1) (y := T q3)]
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith [this, hscale, dist_nonneg (x := q1) (y := q2)]
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
    have ha_le : a ≤ r := by nlinarith [hcircQ, sq_nonneg b, hr_pos]
    have ha_ge : -r ≤ a := by nlinarith [hcircQ, sq_nonneg b, hr_pos]
    have hdx_lb : -(r ^ 2) / 2 < dx := by nlinarith [hlong_T]
    have hdx_gt : r / 2 < dx := by
      have ha_pos : 0 < a := by
        by_contra hanot
        have ha0 : a ≤ 0 := le_of_not_gt hanot
        have hdx_neg : dx < 0 := by
          rcases lt_trichotomy dx 0 with h | h | h
          · exact h
          · exfalso; rw [h, mul_zero] at hadx_big; nlinarith [hr_pos, mul_pos hr_pos hr_pos]
          · exfalso
            have : a * dx ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha0 (le_of_lt h)
            nlinarith [hadx_big, mul_pos hr_pos hr_pos]
        have hbound : a * dx ≤ -r * dx := by nlinarith [ha_ge, hdx_neg]
        have hdx_lt : dx < -(r / 2) := by
          have : r ^ 2 / 2 < -r * dx := lt_of_lt_of_le hadx_big hbound
          nlinarith [this, hr_pos]
        nlinarith [hdx_lt, hdx_lb, hr_pos, hr_lt_one, mul_pos hr_pos hr_pos]
      have hdx_pos : 0 < dx := by
        by_contra hdxnot
        have hdx0 : dx ≤ 0 := le_of_not_gt hdxnot
        have : a * dx ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_pos) hdx0
        nlinarith [hadx_big, mul_pos hr_pos hr_pos]
      have hrdx : a * dx ≤ r * dx := by nlinarith [ha_le, hdx_pos]
      nlinarith [hadx_big, hrdx, hr_pos]
    have hcos_le : dx / r ≤ 1 := by
      rw [div_le_one hr_pos]
      nlinarith [hcircD, hdy_pos, sq_nonneg (dx - r), mul_pos hr_pos hr_pos]
    have hcos_ge : -1 ≤ dx / r := by
      rw [le_div_iff₀ hr_pos]
      nlinarith [hcircD, hdy_pos, sq_nonneg (dx + r), mul_pos hr_pos hr_pos]
    set δ : ℝ := Real.arccos (dx / r) with hδ_def
    have hcosδ : Real.cos δ = dx / r := by
      rw [hδ_def, Real.cos_arccos hcos_ge hcos_le]
    have hsinδ : Real.sin δ = dy / r := by
      rw [hδ_def, Real.sin_arccos]
      have hsq : 1 - (dx / r) ^ 2 = (dy / r) ^ 2 := by
        field_simp
        nlinarith [hcircD]
      rw [hsq, Real.sqrt_sq (by positivity)]
    have hδ_lo : 0 < δ := by
      rw [hδ_def]
      apply Real.arccos_pos.mpr
      rw [div_lt_one hr_pos]
      nlinarith [hdy_pos]
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
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- Row-level closure for the `p' = C` equilateral-apex rows, wired end to end
from shell-level equilateral data. -/
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

/-- The `p' = C` lower-side producer for Form `c` at apex `v₁`. -/
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
      S.v3_lt_v3v1_of_mem_I2 hqI2
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
    have h := S.v1_lt_v1v2_of_mem_I3 (q := Z.a3) hA3
    rwa [← hbase_eq] at h
  exact S.pEqC_row_impossible_of_equilateral hqI2 hBq hDq hsmall hlong

end FiniteEndpointShell

end Problem97
