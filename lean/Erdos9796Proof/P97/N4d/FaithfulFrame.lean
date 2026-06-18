import Erdos9796Proof.P97.N4d.BisectorKill
import Erdos9796Proof.P97.A1B2FrameNormalization
import Erdos9796Proof.P97.N4d.ExcludesFormAv1

/-!
# W2 `q'=a₂` faithful-frame extractor for `bisectorKill`

This module is the **bridge** from the abstract Section-3 endpoint shell into
the coordinate hypotheses of `Problem97.bisectorKill`
(`Erdos9796Proof/P97/N4dBisectorKill.lean`) for the W2 `q'=a₂` non-witness
upper-arc row (the `SORRY-GATE` at `N4dFormBXb2UpperArc.lean:319`, residual
step (2) of its map).

The settled mathematics is in
`docs/n-lane/97-n4d-qeqe-spec-b-residual-handproofs-2026-06-10.md` §2 (the
faithful frame) and §4 (the five SPOF instantiations).  This file delivers the
**v₂-anchor** half: the dead pairs `{v₁,a₂}` and `{v₃,a₂}`, which kill at both
`a₃` and `b₃` and need **no** `hcard` (all three members `v₁, v₃, a₂` lie on
`circle(v₂,1)`).

**What we produce.**  A similarity chart `T` (a `CGN.SimilarityTransportData`)
that normalizes the row's fixed-shell quad to the faithful frame
`v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, `v₃ ↦ (1+c, sg)` (`c²+sg²=1`, `sg>0`, `c≤0`), with
MEC centre `T O = (½, Oy)`, `Oy>0`, `R² = ¼ + Oy²`; the cap-sign facts
(`a₂` upper, `a₃,b₃` lower); and the `circle(v₂,1)` memberships of
`v₁, v₃, a₂`.  From these we hand the cover slice every hypothesis of
`bisectorKill` for `(B := T v₂, O := T O, P, Q ∈ {T v₁, T v₃, T a₂},
X ∈ {T a₃, T b₃})` **except** `hXeq` — the K4-equidistance demand, which is
the cover slice's job.

**Scope.**  No new `axiom`, no `native_decide`/`decide` cert.  The W2 sorry is
left exactly as is; this file is consumed by a later cover slice.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/- ### Private transport atoms (copies of the `A1B2FrameNormalization` /
`N9EndpointN4e` privates; dedup by making those public when the W3 gate lifts). -/

private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

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

/- ### Chart coordinate helpers -/

private theorem vec2_coord0 (x y : ℝ) : (Problem97.CGN.vec2 x y) 0 = x := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem vec2_coord1 (x y : ℝ) : (Problem97.CGN.vec2 x y) 1 = y := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem dist_vec2_00_10 :
    dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) = 1 := by
  have hsq : dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2 = 1 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq]
    simp [vec2_coord0, vec2_coord1]
  have hnn : 0 ≤ dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) :=
    dist_nonneg
  calc dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0)
      = Real.sqrt (dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2) :=
        (Real.sqrt_sq hnn).symm
    _ = Real.sqrt 1 := by rw [hsq]
    _ = 1 := Real.sqrt_one

private theorem signedArea2_chart_base (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring


/- ### Row dist facts from `hexact`

From `hexact : S(v₂) = {a₂, b₂, v₃, v₁}` every named member sits at
`v₂`-distance `s`.  We package the three we need: `|v₂v₁| = |v₂v₃| = |v₂a₂| = s`.
These are the `circle(v₂, s)` memberships that, after scaling `1/s`, become the
`circle(v₂, 1)` memberships of `bisectorKill`'s `hBeq`. -/

/-- `|v₂v₁| = s`, read off `hexact`. -/
private theorem v2v1_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 S.triangle.v1 = s := by
  have hmem : S.triangle.v1 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₂v₃| = s`, read off `hexact`. -/
private theorem v2v3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 S.triangle.v3 = s := by
  have hmem : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₂a₂| = s`, read off `hexact`. -/
private theorem v2a2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 Z.a2 = s := by
  have hmem : Z.a2 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₂b₂| = s`, read off `hexact`. -/
private theorem v2b2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 Z.b2 = s := by
  have hmem : Z.b2 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/- ### A normalized base transport with `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, `v₃` upper -/

/-- A normalized base transport packaged as data: a similarity chart `T` with
`v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, and `v₃` in the upper half-plane. -/
structure NormBase {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  /-- The similarity chart. -/
  T : ℝ² → ℝ²
  /-- Transport data. -/
  tau : Problem97.CGN.SimilarityTransportData T
  /-- `v₁ ↦ (0,0)`. -/
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  /-- `v₂ ↦ (1,0)`. -/
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0
  /-- `v₃` strictly upper. -/
  hv3y_pos : 0 < (T S.triangle.v3) 1

/-- A similarity chart normalizing the base edge `v₁v₂` to `(0,0)`–`(1,0)`,
chosen so the apex `v₃` lands strictly in the upper half-plane.  Uses only that
`v₁ ≠ v₂` and `v₃` is off the base line (`0 < signedArea2 v₃ v₁ v₂` up to sign,
delivered here from `v₂v₃ ≠ 0` and `v₃ ≠ v₁` via the non-degenerate triangle —
the orientation is fixed by composing with `flipY` when needed). -/
private theorem exists_v2_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v3) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v2⟩ :=
    exists_base_transportData S.triangle.v1 S.triangle.v2 S.triangle.v12_ne
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
  have hT1v2 : T1 S.triangle.v2 = Problem97.CGN.vec2 1 0 := by
    change halfShift (T0 S.triangle.v2) = _
    rw [hT0v2, hhalf_one]
  -- `v₃` is off the base line: `(T1 v₃) 1 ≠ 0`, else `v₁, v₂, v₃` are collinear.
  -- The three triangle vertices are non-collinear: they are pairwise distinct
  -- points on the MEC circle.
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hsa0 : signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hbd3 hbd1 hbd2
      S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
  have hv3_off : (T1 S.triangle.v3) 1 ≠ 0 := by
    intro hzero
    have harea : signedArea2 (T1 S.triangle.v3) (T1 S.triangle.v1) (T1 S.triangle.v2) = 0 := by
      rw [hT1v1, hT1v2, signedArea2_chart_base, hzero]
    have htrans := tau1.halfplane_sign S.triangle.v3 S.triangle.v1 S.triangle.v2
    rw [harea] at htrans
    have ho : tau1.orientation ≠ 0 := by
      intro h0
      have := tau1.orientation_sq
      rw [h0] at this; norm_num at this
    have hsc : tau1.scale ^ 2 ≠ 0 := pow_ne_zero 2 tau1.scale_pos.ne'
    have : signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 = 0 := by
      have hcoef : tau1.orientation * tau1.scale ^ 2 ≠ 0 := mul_ne_zero ho hsc
      rcases mul_eq_zero.mp htrans.symm with h | h
      · exact absurd h hcoef
      · exact h
    exact hsa0 this
  rcases lt_trichotomy ((T1 S.triangle.v3) 1) 0 with hneg | hzero | hpos
  · -- flip
    have hflip00 : flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
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
    · change flipY (T1 S.triangle.v1) = _; rw [hT1v1, hflip00]
    · change flipY (T1 S.triangle.v2) = _; rw [hT1v2, hflip10]
    · change 0 < (flipY (T1 S.triangle.v3)) 1; rw [hflipy]; linarith
  · exact absurd hzero hv3_off
  · exact ⟨T1, tau1, hT1v1, hT1v2, hpos⟩

/-- The normalized base transport as data (chosen classically from the
existence theorem). -/
noncomputable def normBase {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    NormBase S :=
  Classical.choice (by
    obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.exists_v2_normalized_transport
    exact ⟨⟨T, tau, hv1, hv2, hv3y_pos⟩⟩)

/- ### The v₂-anchor faithful frame

The structure `V2AnchorFrame S Z` bundles a similarity chart `T` and the
faithful-frame coordinate facts the v₂-anchor `bisectorKill` instantiations need:

* `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, `v₃ ↦ (1+c, sg)` with `c² + sg² = 1`, `sg > 0`,
  `c ≤ 0`;
* the MEC centre `T O = (½, Oy)` with `Oy > 0` and the MEC relation
  `2·sg·Oy = 1 + c` (so `R² = ¼ + Oy²`);
* `a₂ ↦ (a₂ₓ, a₂_y)` upper (`a₂_y > 0`) on `circle(v₂,1)` (so `a₂ₓ ≤ 2`);
* the `circle(v₂,1)` memberships of `v₁, v₃, a₂`;
* the closed-disk facts (`dist (T x) (T O) ≤ R` for `x ∈ A`);
* the cap-`C₃` signs `a₃_y ≤ 0`, `b₃_y ≤ 0`.

From these the v₂-anchor `bisectorKill` hypotheses-minus-`hXeq` follow by
elementary coordinate algebra (the §4 reductions). -/
structure V2AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  /-- The similarity chart. -/
  T : ℝ² → ℝ²
  /-- Transport data for `T`. -/
  tau : Problem97.CGN.SimilarityTransportData T
  /-- Faithful apex `x`-offset (`v₃ = (1+c, sg)`). -/
  c : ℝ
  /-- Faithful apex height (`v₃ = (1+c, sg)`). -/
  sg : ℝ
  /-- MEC centre height (`O = (½, Oy)`). -/
  Oy : ℝ
  /-- `v₁ ↦ (0,0)`. -/
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  /-- `v₂ ↦ (1,0)`. -/
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0
  /-- `v₃ ↦ (1+c, sg)`. -/
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg
  /-- MEC centre `O ↦ (½, Oy)`. -/
  hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy
  /-- `c² + sg² = 1` (unit base edge). -/
  hcsg : c ^ 2 + sg ^ 2 = 1
  /-- Apex strictly upper. -/
  hsg_pos : 0 < sg
  /-- Non-obtuse at `v₂`. -/
  hc_le : c ≤ 0
  /-- MEC centre strictly upper. -/
  hOy_pos : 0 < Oy
  /-- MEC relation `2·sg·Oy = 1 + c`. -/
  hmec : 2 * sg * Oy = 1 + c
  /-- `v₁` on `circle(v₂, 1)`. -/
  hcirc_v1 : dist (T S.triangle.v2) (T S.triangle.v1) = 1
  /-- `v₃` on `circle(v₂, 1)`. -/
  hcirc_v3 : dist (T S.triangle.v2) (T S.triangle.v3) = 1
  /-- `a₂` on `circle(v₂, 1)`. -/
  hcirc_a2 : dist (T S.triangle.v2) (T Z.a2) = 1
  /-- `b₂` on `circle(v₂, 1)`. -/
  hcirc_b2 : dist (T S.triangle.v2) (T Z.b2) = 1
  /-- `a₂` strictly upper (cap-`C₂` sign). -/
  ha2_y : 0 < (T Z.a2) 1
  /-- `b₂` strictly upper (cap-`C₂` sign). -/
  hb2_y : 0 < (T Z.b2) 1
  /-- `v₂` on the MEC circle: `dist (T v₂) (T O) = R`. -/
  hv2_on_mec : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2
  /-- Every `A`-point lands in the closed MEC disk. -/
  hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2
  /-- `a₃` on the cap-`C₃` (lower) side. -/
  ha3_y : (T Z.a3) 1 ≤ 0
  /-- `b₃` on the cap-`C₃` (lower) side. -/
  hb3_y : (T Z.b3) 1 ≤ 0

/- ### Producer for `V2AnchorFrame`

We assemble the frame from the row's exact-packet hypothesis `hexact`
(`S(v₂) = {a₂, b₂, v₃, v₁}`, giving the three `circle(v₂, s)` memberships) and
the committed shell structure (the circumscribed-MEC packet's boundary /
non-obtuse / disk facts, and the cap-side invariants for `a₂ ∈ I₂` and
`a₃, b₃ ∈ I₃`). -/

/-- Transported chart-base signed-area equals the second coordinate:
`signedArea2 (T p) (vec2 0 0) (vec2 1 0) = (T p) 1` once the ends are normalized. -/
private theorem chart_signedArea_eq_coord1 {T : ℝ² → ℝ²}
    {v1 v2 p : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv2 : T v2 = Problem97.CGN.vec2 1 0) :
    signedArea2 (T p) (T v1) (T v2) = (T p) 1 := by
  rw [hv1, hv2, signedArea2_chart_base]

/-- A transported half-plane sign product, reduced to the product of the two
`y`-coordinates: `(T p) 1 * (T q) 1 = (orientation² · scale⁴) · (sa p · sa q)`. -/
private theorem chart_y_product {T : ℝ² → ℝ²}
    (tau : Problem97.CGN.SimilarityTransportData T) {v1 v2 p q : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv2 : T v2 = Problem97.CGN.vec2 1 0) :
    (T p) 1 * (T q) 1 =
      tau.scale ^ 4 *
        (signedArea2 p v1 v2 * signedArea2 q v1 v2) := by
  have hp := tau.halfplane_sign p v1 v2
  have hq := tau.halfplane_sign q v1 v2
  rw [chart_signedArea_eq_coord1 hv1 hv2] at hp
  rw [chart_signedArea_eq_coord1 hv1 hv2] at hq
  have hkey : (T p) 1 * (T q) 1
      = (tau.orientation ^ 2 * tau.scale ^ 4) *
        (signedArea2 p v1 v2 * signedArea2 q v1 v2) := by
    rw [hp, hq]; ring
  rw [hkey, tau.orientation_sq, one_mul]

/-- A cap-`C₃` interior point lands strictly below the base line in the
normalized frame: `(T x) 1 ≤ 0`.  (Generic over `x ∈ I₃`; used for both
`a₃` and `b₃`.) -/
private theorem frame_c3_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hxI3 : x ∈ S.I3) :
    (T x) 1 ≤ 0 := by
  have hxC3 : x ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).2
  have hxA : x ∈ A := S.CP.C3_subset hxC3
  have hopp : Problem97.OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
    ((S.CP.arc_membership x hxA).2.2.mp hxC3)
  unfold Problem97.OnArcOpposite at hopp
  have hy := chart_y_product (T := T) tau (p := x) (q := S.triangle.v3) hv1 hv2
  have hle : (T x) 1 * (T S.triangle.v3) 1 ≤ 0 := by
    rw [hy]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith [hle, hsg_pos]

/-- The `C₂` interior point `p ∈ I₂` lands strictly above the base line:
`0 < (T p) 1`.  (Generic over `p ∈ I₂`; used for both `a₂` and `b₂`.) -/
private theorem frame_c2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hpI2 : p ∈ S.I2) :
    0 < (T p) 1 := by
  have hside := S.c2_vertex_same_open_side_as_v3 hpI2
  have hy := chart_y_product (T := T) tau (p := p) (q := S.triangle.v3) hv1 hv2
  have hpos : 0 < (T p) 1 * (T S.triangle.v3) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith [hpos, hsg_pos]

/-- The `C₂` interior point `a₂` lands strictly above the base line:
`0 < (T a₂) 1`. -/
private theorem frame_a2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1) :
    0 < (T Z.a2) 1 :=
  S.frame_c2_upper tau hv1 hv2 hsg_pos (by rw [Z.hI2]; simp)

/-- Every `A`-point lands in the closed MEC disk in the normalized frame. -/
private theorem frame_disk
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {Oy R : ℝ}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hR : R = tau.scale * S.Packet.radius)
    (hRsq : R ^ 2 = 1 / 4 + Oy ^ 2) :
    ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
  intro x hx
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.disk_contains_A x hx
  have hle : dist (T x) (T S.Packet.center) ≤ R := by
    rw [tau.dist_image, hR]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  have hsq : dist (T x) (T S.Packet.center) ^ 2 ≤ R ^ 2 :=
    pow_le_pow_left₀ dist_nonneg hle 2
  rw [hRsq] at hsq; exact hsq

set_option maxHeartbeats 4000000 in
-- The coordinate-algebra derivation (≈20 `have`s threading the nested transport
-- `T = flipY ∘ halfShift ∘ T0` through `nlinarith` certificates) exceeds the
-- default heartbeat budget; the underlying algebra is light.
/-- **The v₂-anchor faithful-frame scalar facts.**  Given a normalized base
transport and the row's `circle(v₂, s)` distance pins, derive the faithful
coordinates `c, sg, Oy` and every `V2AnchorFrame` field as a packaged
existential.  (Isolated from the structure assembly so the heavy coordinate
algebra carries its own heartbeat budget.) -/
private theorem v2AnchorFrame_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (T : ℝ² → ℝ²) (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = s)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = s)
    (hv2a2 : dist S.triangle.v2 Z.a2 = s)
    (hv2b2 : dist S.triangle.v2 Z.b2 = s) :
    ∃ c sg Oy : ℝ,
      T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg ∧
      T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy ∧
      c ^ 2 + sg ^ 2 = 1 ∧ 0 < sg ∧ c ≤ 0 ∧ 0 < Oy ∧ 2 * sg * Oy = 1 + c ∧
      dist (T S.triangle.v2) (T S.triangle.v1) = 1 ∧
      dist (T S.triangle.v2) (T S.triangle.v3) = 1 ∧
      dist (T S.triangle.v2) (T Z.a2) = 1 ∧
      dist (T S.triangle.v2) (T Z.b2) = 1 ∧
      0 < (T Z.a2) 1 ∧
      0 < (T Z.b2) 1 ∧
      dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 ∧
      (∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2) ∧
      (T Z.a3) 1 ≤ 0 ∧ (T Z.b3) 1 ≤ 0 := by
  classical
  have hs_pos : 0 < s := by
    rw [← hv2v1]; exact dist_pos.mpr S.triangle.v12_ne.symm
  -- Scale pin: `tau.scale * s = 1`.
  have hscale : tau.scale * s = 1 := by
    have hbase : dist (T S.triangle.v2) (T S.triangle.v1) = tau.scale * s := by
      rw [tau.dist_image, hv2v1]
    have hone : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
      rw [hv2, hv1, dist_comm, dist_vec2_00_10]
    rw [← hbase, hone]
  -- Set the faithful coordinates.
  set c := (T S.triangle.v3) 0 - 1 with hc_def
  set sg := (T S.triangle.v3) 1 with hsg_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  -- `v₃ = (1 + c, sg)`.
  have hv3 : T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg := by
    ext i
    fin_cases i
    · change (T S.triangle.v3) 0 = (Problem97.CGN.vec2 (1 + c) sg) 0
      rw [vec2_coord0, hc_def]; ring
    · change (T S.triangle.v3) 1 = (Problem97.CGN.vec2 (1 + c) sg) 1
      rw [vec2_coord1, hsg_def]
  -- `sg > 0`.
  have hsg_pos : 0 < sg := hv3y_pos
  -- Transported circle(v₂,1) memberships (squared form).
  have hcirc_v1 : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
    rw [tau.dist_image, hv2v1, hscale]
  have hcirc_v3 : dist (T S.triangle.v2) (T S.triangle.v3) = 1 := by
    rw [tau.dist_image, hv2v3, hscale]
  have hcirc_a2 : dist (T S.triangle.v2) (T Z.a2) = 1 := by
    rw [tau.dist_image, hv2a2, hscale]
  have hcirc_b2 : dist (T S.triangle.v2) (T Z.b2) = 1 := by
    rw [tau.dist_image, hv2b2, hscale]
  have hc3sq : dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 = 1 := by
    rw [hcirc_v3]; norm_num
  -- Transported MEC boundary squared-dist facts (all = R²), `R := scale·radius`.
  set R := tau.scale * S.Packet.radius with hR_def
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  -- Centre coordinates and the MEC relation, via the verified algebra.
  -- Expand the four squared-dist facts into coordinate form ONCE (fresh names).
  set ox := (T S.Packet.center) 0 with hox_def
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv1, vec2_coord0, vec2_coord1] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv2, vec2_coord0, vec2_coord1] at h
    have h' : ((1 : ℝ) - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by nlinarith [h]
    exact h'
  have e3 : (1 + c - ox) ^ 2 + (sg - Oy) ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv3, vec2_coord0, vec2_coord1] at h
    exact h
  have ec : c ^ 2 + sg ^ 2 = 1 := by
    have h := hc3sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv2, hv3, vec2_coord0, vec2_coord1,
      vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- Make the faithful coordinates opaque so the remaining algebra/sign analyses
  -- do not attempt to `whnf` through the (deeply nested) transport `T`.
  clear_value c sg Oy ox R
  have hox : ox = 1 / 2 := by nlinarith [e1, e2]
  have hcsg : c ^ 2 + sg ^ 2 = 1 := ec
  have hmec : 2 * sg * Oy = 1 + c := by nlinarith [e1, e3, ec, hox]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith [e1, hox]
  have hv2_on_mec : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 := by
    rw [hb2sq, hRsq]
  -- `T O = (½, Oy)`.
  have hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy := by
    ext i
    fin_cases i
    · change (T S.Packet.center) 0 = (Problem97.CGN.vec2 (1 / 2) Oy) 0
      rw [vec2_coord0, ← hox_def]; exact hox
    · change (T S.Packet.center) 1 = (Problem97.CGN.vec2 (1 / 2) Oy) 1
      rw [vec2_coord1, hOy_def]
  -- `c ≤ 0` from the non-obtuse angle at `v₂` (`S.Packet.inner_at_v2`).
  have hc_le : c ≤ 0 := by
    -- `inner_at_v2 : 0 ≤ ⟪v₃ - v₂, v₁ - v₂⟫`.  Transport via dist² polarization.
    -- In the frame: ⟪(c, sg), (-1, 0)⟫ = -c ≥ 0 ⟹ c ≤ 0.
    have hpol : dist S.triangle.v1 S.triangle.v3 ^ 2 ≤ s ^ 2 + s ^ 2 := by
      have hinner := S.Packet.inner_at_v2
      have hexp := norm_sub_sq_real (S.triangle.v3 - S.triangle.v2)
        (S.triangle.v1 - S.triangle.v2)
      have hrw : S.triangle.v3 - S.triangle.v2 - (S.triangle.v1 - S.triangle.v2)
          = S.triangle.v3 - S.triangle.v1 := by abel
      rw [hrw] at hexp
      have h1 : ‖S.triangle.v3 - S.triangle.v1‖ = dist S.triangle.v1 S.triangle.v3 := by
        rw [← dist_eq_norm, dist_comm]
      have h2 : ‖S.triangle.v3 - S.triangle.v2‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv2v3]
      have h3 : ‖S.triangle.v1 - S.triangle.v2‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv2v1]
      rw [h1, h2, h3] at hexp
      nlinarith [hinner, hexp]
    -- transported: |T v₁ - T v₃|² ≤ (scale·s)² + (scale·s)² = 2, and
    -- |T v₁ - T v₃|² = (1+c)² + sg² = 2 + 2c, so 2 + 2c ≤ 2 ⟹ c ≤ 0.
    have htrans : dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 ≤ 2 := by
      rw [tau.dist_image]
      calc (tau.scale * dist S.triangle.v1 S.triangle.v3) ^ 2
          = tau.scale ^ 2 * dist S.triangle.v1 S.triangle.v3 ^ 2 := by ring
        _ ≤ tau.scale ^ 2 * (s ^ 2 + s ^ 2) :=
            mul_le_mul_of_nonneg_left hpol (by positivity)
        _ = (tau.scale * s) ^ 2 + (tau.scale * s) ^ 2 := by ring
        _ = 2 := by rw [hscale]; norm_num
    have hexpand : dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 = (1 + c) ^ 2 + sg ^ 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, hv1, hv3, vec2_coord0, vec2_coord1,
        vec2_coord0, vec2_coord1]
      ring
    rw [hexpand] at htrans
    nlinarith [htrans, hcsg]
  -- `Oy > 0`: from `2·sg·Oy = 1 + c`, `sg > 0`, and `1 + c > 0` (since `c² + sg² = 1`,
  -- `sg > 0` ⟹ `c > -1`).
  have hOy_pos : 0 < Oy := by
    have hcgt : -1 < c := by nlinarith [hcsg, hsg_pos]
    have h1c : 0 < 1 + c := by linarith
    have h2sg : 0 < 2 * sg := by linarith
    have hprod : 0 < 2 * sg * Oy := by rw [hmec]; exact h1c
    nlinarith [hprod, h2sg]
  -- `(T v₃) 1 > 0` in raw form (for the cap-sign helpers).
  have hv3y_pos' : 0 < (T S.triangle.v3) 1 := hsg_def ▸ hsg_pos
  -- Cap-sign and disk facts, delegated to the dedicated helpers.
  have ha2_y : 0 < (T Z.a2) 1 := S.frame_a2_upper Z tau hv1 hv2 hv3y_pos'
  have hb2_y : 0 < (T Z.b2) 1 :=
    S.frame_c2_upper tau hv1 hv2 hv3y_pos' (by rw [Z.hI2]; simp)
  have ha3_y : (T Z.a3) 1 ≤ 0 :=
    S.frame_c3_lower tau hv1 hv2 hv3y_pos' (by rw [Z.hI3]; simp)
  have hb3_y : (T Z.b3) 1 ≤ 0 :=
    S.frame_c3_lower tau hv1 hv2 hv3y_pos' (by rw [Z.hI3]; simp)
  have hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 :=
    S.frame_disk tau hR_def hRsq
  exact ⟨c, sg, Oy, hv3, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v3,
    hcirc_a2, hcirc_b2, ha2_y, hb2_y, hv2_on_mec, hdisk, ha3_y, hb3_y⟩

/-- **The v₂-anchor faithful-frame producer.**  From the row's exact-packet
hypothesis `hexact` and the committed shell structure, build the
`V2AnchorFrame`. -/
noncomputable def v2AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    V2AnchorFrame S Z := by
  classical
  obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.normBase
  have hfacts := S.v2AnchorFrame_facts Z T tau hv1 hv2 hv3y_pos
      (S.v2v1_dist_of_hexact Z hexact)
      (S.v2v3_dist_of_hexact Z hexact)
      (S.v2a2_dist_of_hexact Z hexact)
      (S.v2b2_dist_of_hexact Z hexact)
  -- Extract the three real coordinates classically; the remaining facts are
  -- propositions and can be projected directly.
  set c := hfacts.choose with hc_eq
  set sg := hfacts.choose_spec.choose with hsg_eq
  set Oy := hfacts.choose_spec.choose_spec.choose with hOy_eq
  obtain ⟨hv3, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v3,
      hcirc_a2, hcirc_b2, ha2_y, hb2_y, hv2_on_mec, hdisk, ha3_y, hb3_y⟩ :=
    hfacts.choose_spec.choose_spec.choose_spec
  exact
    { T := T
      tau := tau
      c := c
      sg := sg
      Oy := Oy
      hv1 := hv1
      hv2 := hv2
      hv3 := hv3
      hO := hO
      hcsg := hcsg
      hsg_pos := hsg_pos
      hc_le := hc_le
      hOy_pos := hOy_pos
      hmec := hmec
      hcirc_v1 := hcirc_v1
      hcirc_v3 := hcirc_v3
      hcirc_a2 := hcirc_a2
      hcirc_b2 := hcirc_b2
      ha2_y := ha2_y
      hb2_y := hb2_y
      hv2_on_mec := hv2_on_mec
      hdisk := hdisk
      ha3_y := ha3_y
      hb3_y := hb3_y }

/-- `v₁ ∈ A` (a Moser vertex of the shell). -/
private theorem v1_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∈ A :=
  S.triangle.v1_mem

/-- `v₃ ∈ A` (a Moser vertex of the shell). -/
private theorem v3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v3 ∈ A :=
  S.triangle.v3_mem

/-- `a₂ ∈ A` (a `C₂`-interior named point). -/
private theorem a2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.a2 ∈ A := by
  have h : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
  exact S.CP.C2_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)

/-- `b₂ ∈ A` (a `C₂`-interior named point). -/
private theorem b2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.b2 ∈ A := by
  have h : Z.b2 ∈ S.I2 := by rw [Z.hI2]; simp
  exact S.CP.C2_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)

namespace V2AnchorFrame

variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}

/-- The chart `T` is injective (it is a positive-scale similarity). -/
theorem T_injective (F : V2AnchorFrame S Z) : Function.Injective F.T := by
  intro a b hab
  by_contra hne
  have hd : 0 < dist a b := dist_pos.mpr hne
  have heq : dist (F.T a) (F.T b) = F.tau.scale * dist a b := F.tau.dist_image a b
  rw [hab, dist_self] at heq
  have hpos : 0 < F.tau.scale * dist a b := mul_pos F.tau.scale_pos hd
  rw [← heq] at hpos
  exact lt_irrefl 0 hpos

/-- `bisectorKill`'s `hBy0`: the v₂-anchor's `y`-coordinate is `0`. -/
theorem anchor_y_zero (F : V2AnchorFrame S Z) : (F.T S.triangle.v2) 1 = 0 := by
  rw [F.hv2, vec2_coord1]

/-- `bisectorKill`'s `hXdisk`: any `A`-point `x` lies in the closed MEC disk,
whose boundary contains the anchor `v₂` — so `dist (T x) (T O) ≤ dist (T v₂) (T O)`. -/
theorem x_dist_le_anchor (F : V2AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) := by
  have hX := F.hdisk x hx
  have hv2sq := F.hv2_on_mec
  have h : dist (F.T x) (F.T S.Packet.center) ^ 2
      ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ^ 2 := by
    rw [hv2sq]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.T x) (F.T S.Packet.center) := dist_nonneg
  have hv2nn : (0 : ℝ) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) := dist_nonneg
  nlinarith [h, hXnn, hv2nn]

/-- `a₂`'s `x`-coordinate is at most `2` (from the `circle(v₂,1)` membership). -/
theorem a2_x_le_two (F : V2AnchorFrame S Z) : (F.T Z.a2) 0 ≤ 2 := by
  have h := F.hcirc_a2
  have hsq : dist (F.T S.triangle.v2) (F.T Z.a2) ^ 2 = 1 := by rw [h]; norm_num
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.hv2, vec2_coord0, vec2_coord1] at hsq
  nlinarith [hsq, sq_nonneg ((F.T Z.a2) 1)]

/-- A `circle(v₂,1)` point `p` is distinct from the anchor `v₂` (which is the
circle's centre, `dist v₂ v₂ = 0 ≠ 1`). -/
theorem circ_ne_anchor (F : V2AnchorFrame S Z) {p : ℝ²}
    (hp : dist (F.T S.triangle.v2) (F.T p) = 1) : F.T p ≠ F.T S.triangle.v2 := by
  intro heq
  rw [heq, dist_self] at hp
  exact one_ne_zero hp.symm

/-- The disk-bound `x`-floor for a `circle(v₂, 1)` point `p`: with `v₂ = (1,0)`,
`O = (½, Oy)` and `p` in the closed MEC disk, `p_x ≤ 2·Oy·p_y`.  (The v₂-anchor
`hinner` reduction for every dead pair reduces to a sum of `p_x − 2·Oy·p_y ≤ 0`
contributions and a `−1`, so this floor discharges all of them uniformly.) -/
theorem circ_disk_x_floor (F : V2AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.T S.triangle.v2) (F.T p) = 1) :
    (F.T p) 0 ≤ 2 * F.Oy * (F.T p) 1 := by
  -- unit-circle pin in chart: `(p_x − 1)² + p_y² = 1`.
  have hunit : ((F.T p) 0 - 1) ^ 2 + (F.T p) 1 ^ 2 = 1 := by
    have h : dist (F.T S.triangle.v2) (F.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.hv2, vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- closed-disk pin in chart: `(p_x − ½)² + (p_y − Oy)² ≤ ¼ + Oy²`.
  have hdisk := F.hdisk p hpA
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.hO, vec2_coord0, vec2_coord1] at hdisk
  nlinarith [hunit, hdisk]

/- ### The two v₂-anchor `bisectorKill` argument bundles

For each dead pair `(P, Q)` ∈ `{(v₁, a₂), (v₃, a₂)}` and each lower point `x`
(`a₃` or `b₃`), the following lemmas package **every** hypothesis of
`Problem97.bisectorKill (F.T v₂) (F.T O) (F.T P) (F.T Q) (F.T x)` **except
`hXeq`** (the K4-equidistance demand the cover slice supplies):

* `hXdisk`, `hBeq`, `hBy0`, `hXy`, `hdy`, `hinner`, `hPQ`, `hXne`.

The cover slice then closes the row with
`Problem97.bisectorKill _ _ _ _ _ hXdisk hXeq hBeq hBy0 hXy hdy hinner hPQ hXne`. -/

/-- **`bisectorKill` argument bundle, dead pair `{v₁, a₂}`.**  `B := T v₂`,
`O := T O`, `P := T v₁`, `Q := T a₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1a2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T Z.a2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.a2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.a2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  -- coordinates of the named points
  have hv1c0 : (F.T S.triangle.v1) 0 = 0 := by rw [F.hv1, vec2_coord0]
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha2x : (F.T Z.a2) 0 ≤ 2 := F.a2_x_le_two
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hOy : 0 < F.Oy := F.hOy_pos
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_a2]
  · rw [hv1c1, hv2c1]; linarith [ha2y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [ha2x, ha2y, hOy]
  · -- `T v₁ ≠ T a₂`: `v₁` is on the base line (`y = 0`), `a₂` is strictly above.
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.a2) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [ha2y, hcontr]
  · -- `T x ≠ T v₂` from `x ≠ v₂` and `T` injective.
    intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₃, a₂}`.**  `B := T v₂`,
`O := T O`, `P := T v₃`, `Q := T a₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`.
The `hinner` reduction collapses to the same `a₂ₓ/2 − 1 − Oy·a₂_y < 0` as the
`{v₁, a₂}` pair after substituting the MEC relation `2·sg·Oy = 1 + c`. -/
theorem bisectorKill_args_v3a2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v3) = dist (F.T S.triangle.v2) (F.T Z.a2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.a2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v3 ≠ F.T Z.a2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 + F.c := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha2x : (F.T Z.a2) 0 ≤ 2 := F.a2_x_le_two
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hOy : 0 < F.Oy := F.hOy_pos
  have hsg : 0 < F.sg := F.hsg_pos
  have hmec : 2 * F.sg * F.Oy = 1 + F.c := F.hmec
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_a2]
  · rw [hv3c1, hv2c1]; linarith [hsg, ha2y]
  · rw [hv3c0, hv3c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [ha2x, ha2y, hOy, hmec]
  · -- `T v₃ ≠ T a₂`: distinct points (their images differ); via `T` injective
    -- and `v₃ ≠ a₂` (a₂ ∈ I₂ excludes the apex `v₃`).
    intro heq
    have ha2I2 : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
    have hne : S.triangle.v3 ≠ Z.a2 :=
      fun h => (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/- ### The four additional v₂-anchor `bisectorKill` argument bundles

The cover at `a₃` of all `C(8,4) = 70` candidate 4-subsets uses, beyond the
two banked v₂-anchor pairs `{v₁,a₂}`/`{v₃,a₂}`, these four more v₂-anchor
pairs `{v₁,b₂}`, `{v₃,b₂}`, `{a₂,b₂}`, `{v₁,v₃}` — all members on
`circle(v₂, 1)`.  Their `hinner` discharge is uniform: for any two
`circle(v₂,1)` members `P, Q` in the closed MEC disk,
`⟨d, v₂−O⟩ = P_x/2 + Q_x/2 − 1 − Oy·(P_y+Q_y) ≤ −1 < 0` via the disk floor
`p_x ≤ 2·Oy·p_y` (`circ_disk_x_floor`).  Together with the three banked
v₁-anchor pairs these nine pairs cover all 70 subsets in every branch. -/

/-- **`bisectorKill` argument bundle, dead pair `{v₁, b₂}`.**  `B := T v₂`,
`O := T O`, `P := T v₁`, `Q := T b₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.v1_mem_A) F.hcirc_v1
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_b2]
  · rw [hv1c1, hv2c1]; linarith [hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [hv1floor, hb2floor, hv1c1]
  · -- `T v₁ ≠ T b₂`: `v₁` is on the base line (`y = 0`), `b₂` is strictly above.
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.b2) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [hb2y, hcontr]
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₃, b₂}`.**  `B := T v₂`,
`O := T O`, `P := T v₃`, `Q := T b₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v3b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v3) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v3 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have hsg : 0 < F.sg := F.hsg_pos
  have hv3floor : (F.T S.triangle.v3) 0 ≤ 2 * F.Oy * (F.T S.triangle.v3) 1 :=
    F.circ_disk_x_floor (S.v3_mem_A) F.hcirc_v3
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_b2]
  · rw [hv3c1, hv2c1]; linarith [hsg, hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [hv3floor, hb2floor]
  · -- `T v₃ ≠ T b₂`: `b₂ ∈ I₂` excludes the apex `v₃`.
    intro heq
    have hb2I2 : Z.b2 ∈ S.I2 := by rw [Z.hI2]; simp
    have hne : S.triangle.v3 ≠ Z.b2 :=
      fun h => (Finset.mem_erase.mp (Finset.mem_erase.mp hb2I2).2).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{a₂, b₂}`.**  `B := T v₂`,
`O := T O`, `P := T a₂`, `Q := T b₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_a2b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T Z.a2) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T Z.a2) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T Z.a2) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T Z.a2 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have ha2floor : (F.T Z.a2) 0 ≤ 2 * F.Oy * (F.T Z.a2) 1 :=
    F.circ_disk_x_floor (S.a2_mem_A Z) F.hcirc_a2
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a2, F.hcirc_b2]
  · rw [hv2c1]; linarith [ha2y, hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [ha2floor, hb2floor]
  · -- `T a₂ ≠ T b₂`: `a₂ ≠ b₂` (`I₂.card = 2`) via `T` injective.
    intro heq
    have ha2_ne_b2 : Z.a2 ≠ Z.b2 := by
      have hI2card : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
        simpa [Z.hI2] using S.I2_card_eq_two
      intro h; simp [h] at hI2card
    exact ha2_ne_b2 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₁, v₃}`.**  `B := T v₂`,
`O := T O`, `P := T v₁`, `Q := T v₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₂`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1v3 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T S.triangle.v3) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T S.triangle.v3 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, vec2_coord1]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hsg : 0 < F.sg := F.hsg_pos
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.v1_mem_A) F.hcirc_v1
  have hv3floor : (F.T S.triangle.v3) 0 ≤ 2 * F.Oy * (F.T S.triangle.v3) 1 :=
    F.circ_disk_x_floor (S.v3_mem_A) F.hcirc_v3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_v3]
  · rw [hv1c1, hv2c1]; linarith [hsg, hv3c1]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [hv1floor, hv3floor, hv1c1]
  · -- `T v₁ ≠ T v₃` via `T` injective and `v₁ ≠ v₃`.
    intro heq
    exact S.triangle.v13_ne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

end V2AnchorFrame

/- ### The v₁-anchor faithful frame

The v₁-anchored dead pairs `{a₁,b₁}`, `{v₂,a₁}`, `{v₂,b₁}` (handproof §4
"v₁-anchored", census §2.3) are killed by `bisectorKill` with anchor
`B := T v₁ = (0,0)`.  The faithful frame (chart `T`, scalars `c, sg, Oy`, MEC
disk facts, cap-`C₃` lower signs) is **identical** to `V2AnchorFrame`, so we
reuse it verbatim as the `base` field and only add the v₁-specific facts:

* `a₁, b₁, v₂ ∈ circle(v₁, 1)` (the chart radius-`1` memberships) — the B3
  `hcard` content: with `4 ≤ (witnessClassAt_v1 r).card` the v₁-class is exactly
  `{a₁, b₁, b₂, v₂}` (`coreSelector_v1` gives `I1 ⊆ class`, the `hbranch` pins
  put `b₂, v₂` in it), so every member sits at `v₁`-distance `r`, which the
  chart scales to `1` since `|v₁v₂| = r` is the unit base edge;
* `a₁, b₁` cap-`C₁` `y`-positivity (`0 < (T a₁) 1`, `0 < (T b₁) 1`), via the
  same `same_open_side_as_v3` idiom as `a₂` but on the `C₁` cap.

The `bisectorKill` `hinner` reduction `−½·d_x − Oy·d_y < 0` needs no
`x`-positivity: each circle(v₁,1) member also lies in the MEC disk, which (with
`v₁` on the disk boundary) forces `p_x ≥ 1 − 2·Oy·p_y`, hence
`½·d_x + Oy·d_y ≥ 1 > 0` for every dead pair. -/

/-- The `C₁` interior point `p ∈ I₁` lands strictly above the base line:
`0 < (T p) 1`.  (Generic over `p ∈ I₁`; used for both `a₁` and `b₁`.)  Same
idiom as `frame_a2_upper`, on the `C₁` cap via `c1_vertex_same_open_side_as_v3`. -/
private theorem frame_c1_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hpI1 : p ∈ S.I1) :
    0 < (T p) 1 := by
  have hside := S.c1_vertex_same_open_side_as_v3 hpI1
  have hy := chart_y_product (T := T) tau (p := p) (q := S.triangle.v3) hv1 hv2
  have hpos : 0 < (T p) 1 * (T S.triangle.v3) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith [hpos, hsg_pos]

/-- **The v₁-anchor faithful frame.**  Carries a `V2AnchorFrame` (the shared
faithful frame — same chart `T`, scalars `c, sg, Oy`, MEC disk facts, cap-`C₃`
lower signs) plus the v₁-anchor-specific facts: the `circle(v₁, 1)` memberships
of `a₁, b₁, v₂`, the cap-`C₁` `y`-positivity of `a₁, b₁`, and `a₁, b₁ ∈ A`. -/
structure V1AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  /-- The shared faithful frame (chart, scalars, MEC, disk, cap-`C₃`). -/
  base : V2AnchorFrame S Z
  /-- `a₁ ∈ A`. -/
  ha1A : Z.a1 ∈ A
  /-- `b₁ ∈ A`. -/
  hb1A : Z.b1 ∈ A
  /-- `a₁` on `circle(v₁, 1)`. -/
  hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1
  /-- `b₁` on `circle(v₁, 1)`. -/
  hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1
  /-- `v₂` on `circle(v₁, 1)` (the unit base edge). -/
  hcirc_v2 : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1
  /-- `a₁` strictly upper (cap-`C₁` `y`-sign). -/
  ha1_y : 0 < (base.T Z.a1) 1
  /-- `b₁` strictly upper (cap-`C₁` `y`-sign). -/
  hb1_y : 0 < (base.T Z.b1) 1

/-- **The v₁-anchor faithful-frame producer.**  From the row's C₃-pin
`hC3pin` (which puts `v₂` into the v₁-class at radius `r` — the `hbranch`'s
`FormBv1B2Packet` C₃ component), the cardinality hypothesis `hcard` (which, via
`coreSelector_v1`, forces `I1 = {a₁, b₁}` into the v₁-class), and the
exact-packet hypothesis `hexact` (for the shared frame), build the
`V1AnchorFrame`.  Stated on the bare C₃-pin (rather than the downstream
`FormBv1B2SelectorV2Qv1Packet`, which is defined in the importing
`N4dFormBXb2UpperArc` module) so this producer stays upstream of the packet
restatements; the target theorem supplies the pin by destructuring `hbranch`. -/
noncomputable def v1AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {r s : ℝ}
    (hC3pin : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    V1AnchorFrame S Z := by
  classical
  let base := S.v2AnchorFrame_of_hexact Z hexact
  -- `v₂ ∈ witnessClassAt_v1 r` (from the C₃-pin) ⟹ `|v₁v₂| = r`.
  have hv2_in : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v2 ∈ S.witnessClassAt_v1 r ∩ S.CP.C3 := by
      rw [hC3pin]; simp
    exact (Finset.mem_inter.mp hmem).1
  have hv1v2 : dist S.triangle.v1 S.triangle.v2 = r :=
    (Finset.mem_filter.mp hv2_in).2
  have hr : 0 < r := by
    rw [← hv1v2]; exact dist_pos.mpr S.triangle.v12_ne
  -- `I1 ⊆ witnessClassAt_v1 r` (core selector), so `a₁, b₁` are at radius `r`.
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
  -- Chart scale pin: `tau.scale * r = 1` (the base edge `|v₁v₂| = r` is unit).
  have hscale : base.tau.scale * r = 1 := by
    have hbase : dist (base.T S.triangle.v1) (base.T S.triangle.v2)
        = base.tau.scale * r := by
      rw [base.tau.dist_image, hv1v2]
    have hone : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1 := by
      rw [base.hv1, base.hv2, dist_vec2_00_10]
    rw [← hbase, hone]
  -- Transport the three `circle(v₁, r)` memberships into chart `circle(v₁, 1)`.
  have hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1 := by
    rw [base.tau.dist_image, hv1a1, hscale]
  have hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1 := by
    rw [base.tau.dist_image, hv1b1, hscale]
  have hcirc_v2 : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1 := by
    rw [base.tau.dist_image, hv1v2, hscale]
  -- Cap-`C₁` `y`-positivity of `a₁, b₁`.
  have hsg_pos : 0 < (base.T S.triangle.v3) 1 := by rw [base.hv3, vec2_coord1]; exact base.hsg_pos
  have ha1_y : 0 < (base.T Z.a1) 1 :=
    S.frame_c1_upper base.tau base.hv1 base.hv2 hsg_pos ha1I1
  have hb1_y : 0 < (base.T Z.b1) 1 :=
    S.frame_c1_upper base.tau base.hv1 base.hv2 hsg_pos hb1I1
  exact
    { base := base
      ha1A := ha1A
      hb1A := hb1A
      hcirc_a1 := hcirc_a1
      hcirc_b1 := hcirc_b1
      hcirc_v2 := hcirc_v2
      ha1_y := ha1_y
      hb1_y := hb1_y }

namespace V1AnchorFrame

variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}

/-- `bisectorKill`'s `hBy0`: the v₁-anchor's `y`-coordinate is `0`. -/
theorem anchor_y_zero (F : V1AnchorFrame S Z) : (F.base.T S.triangle.v1) 1 = 0 := by
  rw [F.base.hv1, vec2_coord1]

/-- `bisectorKill`'s `hXdisk`: any `A`-point `x` lies in the closed MEC disk,
whose boundary contains the anchor `v₁` — so `dist (T x) (T O) ≤ dist (T v₁) (T O)`. -/
theorem x_dist_le_anchor (F : V1AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.base.T x) (F.base.T S.Packet.center)
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := by
  have hX := F.base.hdisk x hx
  -- `v₁` on the MEC circle: `dist (T v₁) (T O)² = ¼ + Oy²`.
  have hv1_on_mec : dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2
      = 1 / 4 + F.base.Oy ^ 2 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, F.base.hO,
      vec2_coord0, vec2_coord1, vec2_coord0, vec2_coord1]
    ring
  have h : dist (F.base.T x) (F.base.T S.Packet.center) ^ 2
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2 := by
    rw [hv1_on_mec]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.base.T x) (F.base.T S.Packet.center) := dist_nonneg
  have hv1nn : (0 : ℝ) ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := dist_nonneg
  nlinarith [h, hXnn, hv1nn]

/-- The disk-bound `x`-floor for a `circle(v₁, 1)` point `p`: with `v₁ = (0,0)`,
`O = (½, Oy)` and `p` in the closed MEC disk, `p_x ≥ 1 − 2·Oy·p_y`.  (`hinner`
needs no cap-`C₁` `x`-positivity — this disk floor alone yields
`½·d_x + Oy·d_y ≥ 1` for every dead pair.) -/
theorem circ_disk_x_floor (F : V1AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    1 - 2 * F.base.Oy * (F.base.T p) 1 ≤ (F.base.T p) 0 := by
  -- unit-circle pin in chart: `p_x² + p_y² = 1`.
  have hunit : (F.base.T p) 0 ^ 2 + (F.base.T p) 1 ^ 2 = 1 := by
    have h : dist (F.base.T S.triangle.v1) (F.base.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- closed-disk pin in chart: `(p_x − ½)² + (p_y − Oy)² ≤ ¼ + Oy²`.
  have hdisk := F.base.hdisk p hpA
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hO, vec2_coord0, vec2_coord1] at hdisk
  nlinarith [hunit, hdisk]

/-- A `circle(v₁,1)` point `p` is distinct from the anchor `v₁` (the centre,
`dist v₁ v₁ = 0 ≠ 1`). -/
theorem circ_ne_anchor (F : V1AnchorFrame S Z) {p : ℝ²}
    (hp : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    F.base.T p ≠ F.base.T S.triangle.v1 := by
  intro heq
  rw [heq, dist_self] at hp
  exact one_ne_zero hp.symm

/-- The chart is injective (inherited from the base frame's positive-scale
similarity). -/
theorem T_injective (F : V1AnchorFrame S Z) : Function.Injective F.base.T :=
  F.base.T_injective

/- ### The three v₁-anchor `bisectorKill` argument bundles

For each dead pair `(P, Q) ∈ {(a₁, b₁), (v₂, a₁), (v₂, b₁)}` and each lower
point `x` (`a₃` or `b₃`), the lemmas below package **every** hypothesis of
`Problem97.bisectorKill (F.base.T v₁) (F.base.T O) (F.base.T P) (F.base.T Q)
(F.base.T x)` **except `hXeq`** (the K4-equidistance demand the cover slice
supplies): `hXdisk`, `hBeq`, `hBy0`, `hXy`, `hdy`, `hinner`, `hPQ`, `hXne`.

The cover slice then closes the row with
`Problem97.bisectorKill _ _ _ _ _ hXdisk hXeq hBeq hBy0 hXy hdy hinner hPQ hXne`. -/

/-- **`bisectorKill` argument bundle, dead pair `{a₁, b₁}`.**  `B := T v₁`,
`O := T O`, `P := T a₁`, `Q := T b₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_a1b1 (F : V1AnchorFrame S Z) {x : ℝ²}
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
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
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
    nlinarith [ha1floor, hb1floor, ha1y, hb1y, hOy]
  · -- `T a₁ ≠ T b₁` from `a₁ ≠ b₁` (`I1.card = 2`) and `T` injective.
    intro heq
    have ha1_ne_b1 : Z.a1 ≠ Z.b1 := by
      have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
        simpa [Z.hI1] using S.I1_card_eq_two
      intro h; simp [h] at hI1card
    exact ha1_ne_b1 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₂, a₁}`.**  `B := T v₁`,
`O := T O`, `P := T v₂`, `Q := T a₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v2a1 (F : V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v2)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.a1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v2) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v2 ≠ F.base.T Z.a1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hv2c0 : (F.base.T S.triangle.v2) 0 = 1 := by rw [F.base.hv2, vec2_coord0]
  have hv2c1 : (F.base.T S.triangle.v2) 1 = 0 := by rw [F.base.hv2, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_a1]
  · rw [hv1c1, hv2c1]; linarith [ha1y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [ha1floor, ha1y, hOy]
  · -- `T v₂ ≠ T a₁`: `a₁ ∈ I1` excludes `v₂`, via `T` injective.
    intro heq
    have ha1_ne_v2 : Z.a1 ≠ S.triangle.v2 := by
      have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp ha1I1).2).1
    exact ha1_ne_v2 (F.T_injective heq.symm)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₂, b₁}`.**  `B := T v₁`,
`O := T O`, `P := T v₂`, `Q := T b₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v2b1 (F : V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v2)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v2) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v2 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hv2c0 : (F.base.T S.triangle.v2) 0 = 1 := by rw [F.base.hv2, vec2_coord0]
  have hv2c1 : (F.base.T S.triangle.v2) 1 = 0 := by rw [F.base.hv2, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_b1]
  · rw [hv1c1, hv2c1]; linarith [hb1y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith [hb1floor, hb1y, hOy]
  · -- `T v₂ ≠ T b₁`: `b₁ ∈ I1` excludes `v₂`, via `T` injective.
    intro heq
    have hb1_ne_v2 : Z.b1 ≠ S.triangle.v2 := by
      have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hb1I1).2).1
    exact hb1_ne_v2 (F.T_injective heq.symm)
  · intro heq
    exact hxne (F.T_injective heq)

end V1AnchorFrame

end FiniteEndpointShell

end Problem97
