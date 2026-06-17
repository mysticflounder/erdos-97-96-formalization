import Erdos9796Proof.P97.A1ContextProducers

/-!
# A1 b₂-frame core normalization + the `H2`/`H3` chord-bound producers

Shared coordinate infrastructure for the `H2`–`H7` context producers of the
A1 row layer (design table:
`docs/n-lane/97-row-layer-nonadmissible-census-2026-06-05.md`; frame:
`docs/n-lane/97-n4d-qeqe-b2-residual-attack-2026-06-02.md` §1).

`A1B2FrameCoreChart` is the similarity chart that normalizes the A1
fixed-shell core quad: `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, with the scaled
`v₂`-shell radius `s = |v₂v₃| ∈ (0,1)`, both `a₂` and `v₃` in the upper
half-plane, the non-obtuse-at-`v₂` bound `(T v₃)₀ ≤ 1`, and the shell
bound `1 < |v₁v₃|`.  Every chart fact is produced from committed shell
structure:

* `s < 1` — cap order on `C₃` (`v2_dist_lt_v2v1_of_mem_I3` at `a₃ ∈ I₃`);
* `1 < |v₁v₃|` — cap order on `C₂` (`v1_dist_lt_v1v3_of_mem_I2` at
  `a₂ ∈ I₂`);
* `(T v₃)₀ ≤ 1` — the circumscribed-MEC packet's non-obtuse angle at `v₂`
  (`S.Packet.inner_at_v2`), polarized into squared distances and
  transported;
* `a₂` upper — `c2_vertex_same_open_side_as_v3` transported through
  `halfplane_sign`.

From the chart, the `H2`/`H3` chord bounds are one shared `nlinarith`
certificate (`chart_chord_sq_lt`): writing `a₂` and `v₃` on the radius-`s`
circle about `(1,0)`, the lens pins `ax = 1 − s²/2` and
`1 − s²/2 < cx ≤ 1`, so the perpendicular components satisfy
`0 < ay < cy` and the chord obeys `|a₂v₃|² < s²/2` — strictly below both
`s² = |a₂v₂|²` (H3) and `1 = |a₂v₁|²` (H2).  This is the "margin 0.234 /
0.732" bound of the census table, in exact form.

The private transport atoms (`similarityTransportComp`, `halfShift`,
`flipY`, `exists_base_transportData`, `dist_sq_eq_coord_sq_add_coord_sq`)
are verbatim copies of the `private` originals in `N9EndpointN4e.lean`;
dedup by making those public when the W3 gate lifts.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-! ### Private transport atoms (copies of `N9EndpointN4e` privates) -/

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

/-! ### Chart coordinate helpers -/

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

/-! ### The A1 b₂-frame core chart -/

/-- The A1 b₂-frame **core chart**: a similarity transport normalizing the
fixed-shell core quad `(v₁, v₂, a₂, v₃)` into the frame of the b₂-residual
attack doc — `v₁ = (0,0)`, `v₂ = (1,0)`, scaled `v₂`-shell radius
`s = |v₂v₃| ∈ (0,1)`, `a₂` and `v₃` upper, non-obtuse at `v₂`
(`(T v₃)₀ ≤ 1`), and `1 < |v₁v₃|`.  Extensions for `H4`–`H7` transport the
`b₂`/`a₃`/`b₃` pins through the same `tau`. -/
def A1B2FrameCoreChart {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T, ∃ s : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    0 < s ∧ s < 1 ∧
    dist (T S.triangle.v1) (T Z.a2) = 1 ∧
    dist (T S.triangle.v2) (T Z.a2) = s ∧
    0 < (T Z.a2) 1 ∧
    dist (T S.triangle.v2) (T S.triangle.v3) = s ∧
    0 < (T S.triangle.v3) 1 ∧
    (T S.triangle.v3) 0 ≤ 1 ∧
    1 < dist (T S.triangle.v1) (T S.triangle.v3)

/-- Flip-invariant chart facts, for any transport with normalized base
endpoints.  Applied to the half-shifted base transport and (if `v₃` lands
lower) once more to its `flipY` composite. -/
private theorem chart_facts_of_ends
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s0 : ℝ}
    (hv1v2 : dist S.triangle.v1 S.triangle.v2 = r)
    (ha2v1 : dist S.triangle.v1 Z.a2 = r)
    (ha2v2 : dist S.triangle.v2 Z.a2 = s0)
    (hv3v2 : dist S.triangle.v2 S.triangle.v3 = s0)
    (ha3v2 : dist S.triangle.v2 Z.a3 = s0)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hT1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hT2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0) :
    ∃ s : ℝ, 0 < s ∧ s < 1 ∧
      dist (T S.triangle.v1) (T Z.a2) = 1 ∧
      dist (T S.triangle.v2) (T Z.a2) = s ∧
      dist (T S.triangle.v2) (T S.triangle.v3) = s ∧
      (T S.triangle.v3) 0 ≤ 1 ∧
      1 < dist (T S.triangle.v1) (T S.triangle.v3) ∧
      0 < (T Z.a2) 1 * (T S.triangle.v3) 1 := by
  classical
  have hr_pos : 0 < r := hv1v2 ▸ dist_pos.mpr S.triangle.v12_ne
  have hs0_pos : 0 < s0 := hv3v2 ▸ dist_pos.mpr S.triangle.v23_ne
  -- the chart base has length 1, pinning the scale: `tau.scale * r = 1`
  have hscale : tau.scale * r = 1 := by
    have hbase : dist (T S.triangle.v1) (T S.triangle.v2) = tau.scale * r := by
      rw [tau.dist_image, hv1v2]
    have hone : dist (T S.triangle.v1) (T S.triangle.v2) = 1 := by
      rw [hT1, hT2, dist_vec2_00_10]
    rw [← hbase, hone]
  refine ⟨tau.scale * s0, mul_pos tau.scale_pos hs0_pos, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · -- `s < 1`: cap order on `C₃` places `a₃ ∈ I₃` strictly closer to `v₂`
    -- than `v₁`, so `s0 < r`.
    have ha3I3 : Z.a3 ∈ S.I3 := by
      rw [Z.hI3]
      simp
    have h := S.v2_dist_lt_v2v1_of_mem_I3 ha3I3
    rw [ha3v2, dist_comm, hv1v2] at h
    calc tau.scale * s0 < tau.scale * r := mul_lt_mul_of_pos_left h tau.scale_pos
      _ = 1 := hscale
  · rw [tau.dist_image, ha2v1, hscale]
  · rw [tau.dist_image, ha2v2]
  · rw [tau.dist_image, hv3v2]
  · -- `(T v₃)₀ ≤ 1`: the non-obtuse angle at `v₂`, polarized and transported.
    have hpol : dist S.triangle.v1 S.triangle.v3 ^ 2 ≤ s0 ^ 2 + r ^ 2 := by
      have hinner := S.Packet.inner_at_v2
      have hexp := norm_sub_sq_real (S.triangle.v3 - S.triangle.v2)
        (S.triangle.v1 - S.triangle.v2)
      have hrw : S.triangle.v3 - S.triangle.v2 - (S.triangle.v1 - S.triangle.v2)
          = S.triangle.v3 - S.triangle.v1 := by abel
      rw [hrw] at hexp
      have h1 : ‖S.triangle.v3 - S.triangle.v1‖ = dist S.triangle.v1 S.triangle.v3 := by
        rw [← dist_eq_norm, dist_comm]
      have h2 : ‖S.triangle.v3 - S.triangle.v2‖ = s0 := by
        rw [← dist_eq_norm, dist_comm, hv3v2]
      have h3 : ‖S.triangle.v1 - S.triangle.v2‖ = r := by
        rw [← dist_eq_norm, hv1v2]
      rw [h1, h2, h3] at hexp
      nlinarith [hinner, hexp]
    have hchart_sq : dist (T S.triangle.v1) (T S.triangle.v3) ^ 2
        ≤ (tau.scale * s0) ^ 2 + 1 := by
      rw [tau.dist_image]
      calc (tau.scale * dist S.triangle.v1 S.triangle.v3) ^ 2
          = tau.scale ^ 2 * dist S.triangle.v1 S.triangle.v3 ^ 2 := by ring
        _ ≤ tau.scale ^ 2 * (s0 ^ 2 + r ^ 2) :=
            mul_le_mul_of_nonneg_left hpol (by positivity)
        _ = (tau.scale * s0) ^ 2 + (tau.scale * r) ^ 2 := by ring
        _ = (tau.scale * s0) ^ 2 + 1 := by rw [hscale, one_pow]
    rw [hT1] at hchart_sq
    have hv13 := dist_sq_eq_coord_sq_add_coord_sq (T S.triangle.v1) (T S.triangle.v3)
    rw [hT1, vec2_coord0, vec2_coord1] at hv13
    have hd23 : dist (T S.triangle.v2) (T S.triangle.v3) = tau.scale * s0 := by
      rw [tau.dist_image, hv3v2]
    have hv23 := dist_sq_eq_coord_sq_add_coord_sq (T S.triangle.v2) (T S.triangle.v3)
    rw [hd23, hT2, vec2_coord0, vec2_coord1] at hv23
    nlinarith [hchart_sq, hv13, hv23]
  · -- `1 < |T v₁ − T v₃|`: cap order on `C₂` places `a₂ ∈ I₂` strictly
    -- before `v₃` in the `v₁`-radial order, so `r < |v₁v₃|`.
    have ha2I2 : Z.a2 ∈ S.I2 := by
      rw [Z.hI2]
      simp
    have h := S.v1_dist_lt_v1v3_of_mem_I2 ha2I2
    rw [ha2v1] at h
    calc (1 : ℝ) = tau.scale * r := hscale.symm
      _ < tau.scale * dist S.triangle.v1 S.triangle.v3 :=
          mul_lt_mul_of_pos_left h tau.scale_pos
      _ = dist (T S.triangle.v1) (T S.triangle.v3) := (tau.dist_image _ _).symm
  · -- `a₂` and `v₃` on the same side of the base chord, transported.
    have ha2I2 : Z.a2 ∈ S.I2 := by
      rw [Z.hI2]
      simp
    have hside := S.c2_vertex_same_open_side_as_v3 ha2I2
    have ht_a2 := tau.halfplane_sign Z.a2 S.triangle.v1 S.triangle.v2
    have ht_v3 := tau.halfplane_sign S.triangle.v3 S.triangle.v1 S.triangle.v2
    have ha : signedArea2 (T Z.a2) (T S.triangle.v1) (T S.triangle.v2) = (T Z.a2) 1 := by
      rw [hT1, hT2, signedArea2_chart_base]
    have hv : signedArea2 (T S.triangle.v3) (T S.triangle.v1) (T S.triangle.v2)
        = (T S.triangle.v3) 1 := by
      rw [hT1, hT2, signedArea2_chart_base]
    have hkey : (T Z.a2) 1 * (T S.triangle.v3) 1
        = tau.orientation ^ 2 * tau.scale ^ 4 *
          (signedArea2 Z.a2 S.triangle.v1 S.triangle.v2 *
           signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
      rw [← ha, ← hv, ht_a2, ht_v3]
      ring
    rw [tau.orientation_sq, one_mul] at hkey
    rw [hkey]
    exact mul_pos (pow_pos tau.scale_pos 4) hside

/-- **Existence of the A1 b₂-frame core chart.**  The hypotheses are the
fixed-shell equidistance pins exactly as the spine wiring's
`A1FixedShellPacket` provides them. -/
theorem a1_b2Frame_coreChart
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s0 : ℝ}
    (hv1v2 : dist S.triangle.v1 S.triangle.v2 = r)
    (ha2v1 : dist S.triangle.v1 Z.a2 = r)
    (ha2v2 : dist S.triangle.v2 Z.a2 = s0)
    (hv3v2 : dist S.triangle.v2 S.triangle.v3 = s0)
    (ha3v2 : dist S.triangle.v2 Z.a3 = s0) :
    A1B2FrameCoreChart S Z := by
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
    show halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v2 : T1 S.triangle.v2 = Problem97.CGN.vec2 1 0 := by
    show halfShift (T0 S.triangle.v2) = _
    rw [hT0v2, hhalf_one]
  obtain ⟨s, hs_pos, hs1, hd1, hd2, hd3, hcx, hd13, hprod⟩ :=
    chart_facts_of_ends S Z hv1v2 ha2v1 ha2v2 hv3v2 ha3v2 tau1 hT1v1 hT1v2
  rcases lt_trichotomy ((T1 S.triangle.v3) 1) 0 with hneg | hzero | hpos
  · -- `v₃` landed lower: compose with the `flipY` reflection.
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
    have hT2v1 : T2 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
      show flipY (T1 S.triangle.v1) = _
      rw [hT1v1, hflip00]
    have hT2v2 : T2 S.triangle.v2 = Problem97.CGN.vec2 1 0 := by
      show flipY (T1 S.triangle.v2) = _
      rw [hT1v2, hflip10]
    obtain ⟨s', hs'_pos, hs'1, hd1', hd2', hd3', hcx', hd13', hprod'⟩ :=
      chart_facts_of_ends S Z hv1v2 ha2v1 ha2v2 hv3v2 ha3v2 tau2 hT2v1 hT2v2
    have hv3y : 0 < (T2 S.triangle.v3) 1 := by
      show 0 < (flipY (T1 S.triangle.v3)) 1
      rw [hflipy]
      linarith
    have ha2y : 0 < (T2 Z.a2) 1 := by
      by_contra h
      push_neg at h
      nlinarith [hprod', hv3y]
    exact ⟨T2, tau2, s', hT2v1, hT2v2, hs'_pos, hs'1, hd1', hd2', ha2y, hd3', hv3y,
      hcx', hd13'⟩
  · exfalso
    rw [hzero, mul_zero] at hprod
    exact lt_irrefl 0 hprod
  · have ha2y : 0 < (T1 Z.a2) 1 := by
      by_contra h
      push_neg at h
      nlinarith [hprod, hpos]
    exact ⟨T1, tau1, s, hT1v1, hT1v2, hs_pos, hs1, hd1, hd2, ha2y, hd3, hpos, hcx, hd13⟩

/-! ### The shared `H2`/`H3` chord bound -/

set_option maxHeartbeats 800000 in
/-- The chord certificate in the core chart: `a₂` and `v₃` both sit on the
radius-`s` circle about `v₂ = (1,0)`; the radius-1 pin forces
`ax = 1 − s²/2`, the shell bound `1 < |v₁v₃|` forces `1 − cx < s²/2`, and
non-obtuseness gives `cx ≤ 1`; both upper.  Then the perpendicular
components satisfy `0 < ay < cy`, the inner product against `v₂` exceeds
`(3/4)s²`, and the chord obeys `|a₂v₃|² < s²/2`.

The heartbeat budget is raised: the stacked `nlinarith` certificate searches
exceed the default per-declaration budget. -/
private theorem chart_chord_sq_lt
    {s ax ay cx cy : ℝ}
    (hs_pos : 0 < s) (hs1 : s < 1)
    (ha1 : ax ^ 2 + ay ^ 2 = 1)
    (ha2 : (1 - ax) ^ 2 + ay ^ 2 = s ^ 2)
    (hay : 0 < ay)
    (hc2 : (1 - cx) ^ 2 + cy ^ 2 = s ^ 2)
    (hcy : 0 < cy)
    (hcx : cx ≤ 1)
    (hc1 : 1 < cx ^ 2 + cy ^ 2) :
    (ax - cx) ^ 2 + (ay - cy) ^ 2 < s ^ 2 / 2 := by
  have hax : ax = 1 - s ^ 2 / 2 := by
    linear_combination (ha1 - ha2) / 2
  have hβ : 1 - cx < s ^ 2 / 2 := by nlinarith [hc1, hc2]
  have hβ0 : 0 ≤ 1 - cx := by linarith
  have hay2 : ay ^ 2 = s ^ 2 - s ^ 4 / 4 := by
    rw [hax] at ha2
    linear_combination ha2
  have hcy2 : cy ^ 2 = s ^ 2 - (1 - cx) ^ 2 := by linear_combination hc2
  have hlt : (1 - cx) ^ 2 < s ^ 4 / 4 := by nlinarith [hβ, hβ0]
  have hay_lt_cy : ay < cy := by nlinarith [hay, hcy, hay2, hcy2, hlt]
  have haycy : ay * cy > ay ^ 2 := by nlinarith [hay, hay_lt_cy]
  have hs2 : s ^ 2 ≤ 1 := by nlinarith [hs_pos, hs1]
  have hs4 : s ^ 4 ≤ s ^ 2 := by nlinarith [sq_nonneg s, hs2]
  have hinner : (1 - ax) * (1 - cx) + ay * cy > 3 / 4 * s ^ 2 := by
    nlinarith [hax, hβ0, haycy, hs4, hay2, hs_pos]
  nlinarith [ha2, hc2, hinner]

set_option maxHeartbeats 800000 in
/-- The chord bound in chart terms, shared by the `H2` and `H3` producers:
under the core-chart facts, `|T a₂ − T v₃|² < s²/2`.  The coordinate
equations come from squaring the chart distances; the `v₁`-side facts are
kept on the `vec2 0 0` atom throughout (rewriting `T v₁` inside a `dist`
desynchronizes the `nlinarith` atom set). -/
private theorem chart_a2v3_chord_sq_lt
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    {T : ℝ² → ℝ²} {s : ℝ}
    (hT1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hT2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hs_pos : 0 < s) (hs1 : s < 1)
    (hd1 : dist (T S.triangle.v1) (T Z.a2) = 1)
    (hd2 : dist (T S.triangle.v2) (T Z.a2) = s)
    (hay : 0 < (T Z.a2) 1)
    (hd3 : dist (T S.triangle.v2) (T S.triangle.v3) = s)
    (hcy : 0 < (T S.triangle.v3) 1)
    (hcx : (T S.triangle.v3) 0 ≤ 1)
    (hd13 : 1 < dist (T S.triangle.v1) (T S.triangle.v3)) :
    dist (T Z.a2) (T S.triangle.v3) ^ 2 < s ^ 2 / 2 := by
  -- coordinate equations for `a₂` and `v₃` in the chart
  have ha1' := dist_sq_eq_coord_sq_add_coord_sq (T S.triangle.v1) (T Z.a2)
  rw [hd1, hT1, vec2_coord0, vec2_coord1] at ha1'
  have ha2' := dist_sq_eq_coord_sq_add_coord_sq (T S.triangle.v2) (T Z.a2)
  rw [hd2, hT2, vec2_coord0, vec2_coord1] at ha2'
  have hc2' := dist_sq_eq_coord_sq_add_coord_sq (T S.triangle.v2) (T S.triangle.v3)
  rw [hd3, hT2, vec2_coord0, vec2_coord1] at hc2'
  rw [hT1] at hd13
  have hd13sq : 1 < dist (Problem97.CGN.vec2 (0 : ℝ) 0) (T S.triangle.v3) ^ 2 := by
    nlinarith [hd13,
      dist_nonneg (x := Problem97.CGN.vec2 (0 : ℝ) 0) (y := T S.triangle.v3)]
  have hc1' := dist_sq_eq_coord_sq_add_coord_sq (Problem97.CGN.vec2 (0 : ℝ) 0)
    (T S.triangle.v3)
  rw [vec2_coord0, vec2_coord1] at hc1'
  have Ha1 : ((T Z.a2) 0) ^ 2 + ((T Z.a2) 1) ^ 2 = 1 := by linear_combination -ha1'
  have Ha2 : (1 - (T Z.a2) 0) ^ 2 + ((T Z.a2) 1) ^ 2 = s ^ 2 := by linear_combination -ha2'
  have Hc2 : (1 - (T S.triangle.v3) 0) ^ 2 + ((T S.triangle.v3) 1) ^ 2 = s ^ 2 := by
    linear_combination -hc2'
  have Hc1 : 1 < ((T S.triangle.v3) 0) ^ 2 + ((T S.triangle.v3) 1) ^ 2 := by
    nlinarith [hd13sq, hc1']
  have hkey : ((T Z.a2) 0 - (T S.triangle.v3) 0) ^ 2
      + ((T Z.a2) 1 - (T S.triangle.v3) 1) ^ 2 < s ^ 2 / 2 :=
    chart_chord_sq_lt hs_pos hs1 Ha1 Ha2 hay Hc2 hcy hcx Hc1
  have hchord := dist_sq_eq_coord_sq_add_coord_sq (T Z.a2) (T S.triangle.v3)
  rw [hchord]
  exact hkey

/-- **H2 producer**: `dist(a₂,v₃) ≠ dist(a₂,v₁)`.  In the core chart
`|a₂v₃|² < s²/2 < 1 = |a₂v₁|²`. -/
theorem a1_context_h2_producer
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s0 : ℝ}
    (hv1v2 : dist S.triangle.v1 S.triangle.v2 = r)
    (ha2v1 : dist S.triangle.v1 Z.a2 = r)
    (ha2v2 : dist S.triangle.v2 Z.a2 = s0)
    (hv3v2 : dist S.triangle.v2 S.triangle.v3 = s0)
    (ha3v2 : dist S.triangle.v2 Z.a3 = s0) :
    dist Z.a2 S.triangle.v3 ≠ dist Z.a2 S.triangle.v1 := by
  obtain ⟨T, tau, s, hT1, hT2, hs_pos, hs1, hd1, hd2, hay, hd3, hcy, hcx, hd13⟩ :=
    a1_b2Frame_coreChart S Z hv1v2 ha2v1 ha2v2 hv3v2 ha3v2
  have hbound := chart_a2v3_chord_sq_lt S Z hT1 hT2 hs_pos hs1 hd1 hd2 hay hd3 hcy
    hcx hd13
  intro heq
  have hchart_eq : dist (T Z.a2) (T S.triangle.v3) = dist (T Z.a2) (T S.triangle.v1) :=
    (tau.dist_eq_iff Z.a2 S.triangle.v3 S.triangle.v1).mpr heq
  have h1 : dist (T Z.a2) (T S.triangle.v1) = 1 := by
    rw [dist_comm]
    exact hd1
  rw [hchart_eq, h1] at hbound
  nlinarith [hbound, hs_pos, hs1]

/-- **H3 producer**: `dist(a₂,v₃) ≠ dist(a₂,v₂)`.  In the core chart
`|a₂v₃|² < s²/2 < s² = |a₂v₂|²`. -/
theorem a1_context_h3_producer
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s0 : ℝ}
    (hv1v2 : dist S.triangle.v1 S.triangle.v2 = r)
    (ha2v1 : dist S.triangle.v1 Z.a2 = r)
    (ha2v2 : dist S.triangle.v2 Z.a2 = s0)
    (hv3v2 : dist S.triangle.v2 S.triangle.v3 = s0)
    (ha3v2 : dist S.triangle.v2 Z.a3 = s0) :
    dist Z.a2 S.triangle.v3 ≠ dist Z.a2 S.triangle.v2 := by
  obtain ⟨T, tau, s, hT1, hT2, hs_pos, hs1, hd1, hd2, hay, hd3, hcy, hcx, hd13⟩ :=
    a1_b2Frame_coreChart S Z hv1v2 ha2v1 ha2v2 hv3v2 ha3v2
  have hbound := chart_a2v3_chord_sq_lt S Z hT1 hT2 hs_pos hs1 hd1 hd2 hay hd3 hcy
    hcx hd13
  intro heq
  have hchart_eq : dist (T Z.a2) (T S.triangle.v3) = dist (T Z.a2) (T S.triangle.v2) :=
    (tau.dist_eq_iff Z.a2 S.triangle.v3 S.triangle.v2).mpr heq
  have h2 : dist (T Z.a2) (T S.triangle.v2) = s := by
    rw [dist_comm]
    exact hd2
  rw [hchart_eq, h2] at hbound
  nlinarith [hbound, mul_pos hs_pos hs_pos]

end FiniteEndpointShell

end Problem97
