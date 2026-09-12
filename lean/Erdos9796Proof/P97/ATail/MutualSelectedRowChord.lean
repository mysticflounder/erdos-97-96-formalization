import Erdos9796Proof.P97.ATail.FirstApexInteriorPairCirclePower
import Erdos9796Proof.P97.ATail.ExactFiveMutualReturnChord
import Erdos9796Proof.Geometry.SimilarityFrame
/-!
# Long-chord and sharp-radius bounds for mutual selected blocker rows

This source adapter retains both mutual incidences and the strict-interior
pair hypotheses. Its consumer is the guarded initially distinct branch in
`FrontierLiveClosure.Rigid221Closure`; no arbitrary rows are assumed mutual.
-/
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97.MutualSelectedRowChord
private theorem polarization (q w c : ℝ²) :
    2 * inner ℝ (q - c) (w - c) =
      dist c q ^ 2 + dist c w ^ 2 - dist q w ^ 2 := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hh : (q - c) - (w - c) = q - w := by abel
  rw [hh]
  simp only [dist_eq_norm, norm_sub_rev c]
  ring

private theorem mutual_endpoint_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c b : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (hcqw : dist c q = dist c w)
    (hcb : dist c b = dist c q) (hbq : dist b q = dist b c) :
    b ≠ q ∧ b ≠ w ∧ b ≠ S.oppApex1 ∧ c ≠ q ∧ c ≠ w := by
  have hcq : c ≠ q := by
    intro he
    have hh : dist q w = 0 := by simpa [he] using hcqw.symm
    exact hqw (dist_eq_zero.mp hh)
  have hcw : c ≠ w := by
    intro he
    have hh : dist w q = 0 := by simpa [he] using hcqw
    exact hqw (dist_eq_zero.mp hh).symm
  have hpos : 0 < dist c q := dist_pos.mpr hcq
  have hbqdist : dist b q = dist c q := by rw [hbq, dist_comm b c, hcb]
  have hbne : b ≠ q := by
    intro he
    have hh := hbqdist
    rw [he, dist_self] at hh
    linarith
  have hbwn : b ≠ w := by
    intro he
    have hinner := FirstApexInteriorPairGeometry.bisectorCenter_inner_nonpos_firstApexInterior
      hq hw hqw hcA hcO hcqw
    have hid := polarization q w c
    have hqwDist : dist q w = dist c q := by simpa [he, dist_comm q w] using hbqdist
    rw [← hcqw, hqwDist] at hid
    nlinarith [sq_pos_of_pos hpos]
  have hbo : b ≠ S.oppApex1 := by
    intro he
    have hdrop := FirstApexInteriorPairGeometry.bisectorCenter_radius_lt_of_selected_pair
      hq hw hqw hr hcA hcO hcqw
    have hqr := (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
    rw [he, hqr] at hbqdist
    linarith
  exact ⟨hbne, hbwn, hbo, hcq, hcw⟩

private noncomputable def chordFunctional (O P Q : ℝ²) : ℝ² →ᵃ[ℝ] ℝ :=
  AffineMap.mk' (fun x => -signedArea2 x P Q * signedArea2 O P Q)
    (((Q 1 - P 1) * signedArea2 O P Q) • (EuclideanSpace.proj (𝕜 := ℝ) (ι := Fin 2) 0).toLinearMap +
     ((P 0 - Q 0) * signedArea2 O P Q) • (EuclideanSpace.proj (𝕜 := ℝ) (ι := Fin 2) 1).toLinearMap)
    0 (by
      intro x
      simp [signedArea2, EuclideanSpace.proj]
      ring)

open Erdos9796Proof.Geometry
private theorem bisector_frame_fst {q w p : Plane} (F : SimilarityFrame q w)
    (heq : dist p q = dist p w) : F p 0 = 0 := by
  have hh := congrArg (fun t : ℝ => t ^ 2) ((F.dist_eq_iff p q w).2 heq)
  rw [F.map_q₁, F.map_q₂, dist_sq_coord, dist_sq_coord] at hh
  simp only [planePoint, PiLp.add_apply, PiLp.single_apply] at hh
  norm_num at hh
  nlinarith

private theorem bisector_frame_sq {q w p : Plane} (F : SimilarityFrame q w)
    (hp : F p 0 = 0) :
    (F.scale * dist p q) ^ 2 = 1 + (F p 1) ^ 2 := by
  rw [← F.dist_map, F.map_q₁, dist_sq_coord]
  simp [planePoint, PiLp.add_apply, hp]

private theorem frame_chord_sq {q w : Plane} (F : SimilarityFrame q w) :
    (F.scale * dist q w) ^ 2 = 4 := by
  rw [← F.dist_map, F.map_q₁, F.map_q₂, dist_sq_coord]
  norm_num [planePoint, PiLp.add_apply, PiLp.single_apply]

private theorem first_apex_eq_triangle_vertex
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    S.oppApex1 = (S.triangleByIndex S.oppIndex1).v1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.oppApex1, SurplusCapPacket.triangleByIndex,
      SurplusCapPacket.oppIndex1, hi, Fin.val_zero, Fin.val_one]

private theorem mutual_selectedRows_geometry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c b : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (Kc : SelectedFourClass D.A c) (Kb : SelectedFourClass D.A b)
    (hqKc : q ∈ Kc.support) (hwKc : w ∈ Kc.support) (hbKc : b ∈ Kc.support)
    (hqKb : q ∈ Kb.support) (hcKb : c ∈ Kb.support) :
    c ∈ S.capInteriorByIndex S.oppIndex1 ∧ b ∉ S.capByIndex S.oppIndex1 ∧
      b ≠ q ∧ b ≠ w ∧ b ≠ S.oppApex1 ∧ c ≠ q ∧ c ≠ w := by
  have heq := (Kc.support_eq_radius q hqKc).trans (Kc.support_eq_radius w hwKc).symm
  have hcb := (Kc.support_eq_radius b hbKc).trans (Kc.support_eq_radius q hqKc).symm
  have hbq := (Kb.support_eq_radius q hqKb).trans (Kb.support_eq_radius c hcKb).symm
  obtain ⟨hbqne, hbwne, hbone, hcqne, hcwne⟩ :=
    mutual_endpoint_ne hq hw hqw hr hcA hcO heq hcb hbq
  have hcI := FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
    hq hw hqw hcA hcO heq
  have hcard := CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.oppIndex1 Kc (S.capInteriorByIndex_subset_capByIndex _ hcI)
  have hboff : b ∉ S.capByIndex S.oppIndex1 := by
    intro hb
    have hqcap := S.capInteriorByIndex_subset_capByIndex _ (Finset.mem_inter.mp hq).2
    have hwcap := S.capInteriorByIndex_subset_capByIndex _ (Finset.mem_inter.mp hw).2
    have hthree : 2 < (Kc.support ∩ S.capByIndex S.oppIndex1).card := by
      apply Finset.two_lt_card.mpr
      exact ⟨q, Finset.mem_inter.mpr ⟨hqKc, hqcap⟩,
        w, Finset.mem_inter.mpr ⟨hwKc, hwcap⟩,
        b, Finset.mem_inter.mpr ⟨hbKc, hb⟩, hqw, hbqne.symm, hbwne.symm⟩
    omega
  exact ⟨hcI, hboff, hbqne, hbwne, hbone, hcqne, hcwne⟩

private theorem frame_radius_bounds
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (heq : dist c q = dist c w) (hshort : dist q w ≤ r)
    (F : SimilarityFrame q w) :
    F c 0 = 0 ∧ F S.oppApex1 0 = 0 ∧
      (F c 1)^2 ≤ 1 ∧ 3 ≤ (F S.oppApex1 1)^2 ∧
      (F c 1)^2 < (F S.oppApex1 1)^2 := by
  have hqr := (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
  have hwr := (mem_selectedClass.mp (Finset.mem_inter.mp hw).1).2
  have hcx := bisector_frame_fst F heq
  have hox := bisector_frame_fst F (hqr.trans hwr.symm)
  have hcSq := bisector_frame_sq F hcx
  have hoSq := bisector_frame_sq F hox
  rw [hqr] at hoSq
  have hpSq := frame_chord_sq F
  have hinner := FirstApexInteriorPairGeometry.bisectorCenter_inner_nonpos_firstApexInterior
    hq hw hqw hcA hcO heq
  have hid := polarization q w c
  rw [← heq] at hid
  have hin : 2 * dist c q ^ 2 ≤ dist q w ^ 2 := by linarith
  have hin' := mul_nonneg (sq_nonneg F.scale) (sub_nonneg.mpr hin)
  have hcBound : (F c 1)^2 ≤ 1 := by nlinarith [hin']
  have hshort' : F.scale * dist q w ≤ F.scale * r :=
    mul_le_mul_of_nonneg_left hshort F.scale_pos.le
  have hshortSq := (sq_le_sq₀ (mul_nonneg F.scale_pos.le dist_nonneg)
    (mul_nonneg F.scale_pos.le hr)).2 hshort'
  have hoBound : 3 ≤ (F S.oppApex1 1)^2 := by nlinarith
  have hdrop := FirstApexInteriorPairGeometry.bisectorCenter_radius_lt_of_selected_pair
    hq hw hqw hr hcA hcO heq
  have hd' := mul_lt_mul_of_pos_left hdrop F.scale_pos
  have hdropSq := (sq_lt_sq₀ (mul_nonneg F.scale_pos.le dist_nonneg)
    (mul_nonneg F.scale_pos.le hr)).2 hd'
  exact ⟨hcx, hox, hcBound, hoBound, by nlinarith⟩


private theorem frame_radius_bounds_acute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (_hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (heq : dist c q = dist c w) (F : SimilarityFrame q w) :
    F c 0 = 0 ∧ F S.oppApex1 0 = 0 ∧
      (F c 1)^2 ≤ 1 ∧ 1 < (F S.oppApex1 1)^2 ∧
      (F c 1)^2 < (F S.oppApex1 1)^2 := by
  have hqr := (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
  have hwr := (mem_selectedClass.mp (Finset.mem_inter.mp hw).1).2
  have hcx := bisector_frame_fst F heq
  have hox := bisector_frame_fst F (hqr.trans hwr.symm)
  have hcSq := bisector_frame_sq F hcx
  have hoSq := bisector_frame_sq F hox
  rw [hqr] at hoSq
  have hpSq := frame_chord_sq F
  have hinner := FirstApexInteriorPairGeometry.bisectorCenter_inner_nonpos_firstApexInterior
    hq hw hqw hcA hcO heq
  have hid := polarization q w c
  rw [← heq] at hid
  have hin : 2 * dist c q ^ 2 ≤ dist q w ^ 2 := by linarith
  have hin' := mul_nonneg (sq_nonneg F.scale) (sub_nonneg.mpr hin)
  have hcBound : (F c 1)^2 ≤ 1 := by nlinarith [hin']
  have houter := FirstApexInteriorPairGeometry.inner_pos_of_oppApex1_capInterior_pair
    (Finset.mem_inter.mp hq).2 (Finset.mem_inter.mp hw).2
  have hoId := polarization q w S.oppApex1
  rw [hqr, hwr] at hoId
  have hoGap : 0 < 2 * r^2 - dist q w^2 := by linarith
  have hoScaled := mul_pos (sq_pos_of_pos F.scale_pos) hoGap
  have hoBound : 1 < (F S.oppApex1 1)^2 := by nlinarith [hoScaled]
  exact ⟨hcx, hox, hcBound, hoBound, by linarith⟩

private theorem frame_mutual_eqs {q w b c : Plane} (F : SimilarityFrame q w)
    (hcx : F c 0 = 0)
    (hbq : dist b q = dist c q) (hbc : dist b c = dist c q) :
    (F b 0 + 1)^2 + (F b 1)^2 = 1 + (F c 1)^2 ∧
      (F b 0)^2 + (F b 1 - F c 1)^2 = 1 + (F c 1)^2 := by
  have hcsq := bisector_frame_sq F hcx
  constructor
  · have hh : dist (F b) (F q)^2 = (F.scale * dist c q)^2 := by
      rw [F.dist_map, hbq]
    rw [hcsq, F.map_q₁, dist_sq_coord] at hh
    simpa [planePoint, PiLp.add_apply] using hh
  · have hh : dist (F b) (F c)^2 = (F.scale * dist c q)^2 := by
      rw [F.dist_map, hbc]
    rw [hcsq, dist_sq_coord] at hh
    simpa [hcx] using hh


private theorem bisector_frame_height_mul_neg
    {A : Finset ℝ²} {q w o c : ℝ²}
    (F : SimilarityFrame q w)
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hq : q ∈ A) (hw : w ∈ A) (ho : o ∈ A) (hc : c ∈ A)
    (hcq : c ≠ q) (hcw : c ≠ w)
    (hc0 : F c 0 = 0) (ho0 : F o 0 = 0)
    (hSq : (F c 1) ^ 2 < (F o 1) ^ 2) :
    F c 1 * F o 1 < 0 := by
  have ho1ne : F o 1 ≠ 0 := by
    intro ho1
    rw [ho1] at hSq
    nlinarith
  have hco : c ≠ o := by
    intro h
    subst c
    exact (lt_irrefl _ hSq)
  have himage :
      F '' ({q, w, o} : Set ℝ²) = ({F q, F w, F o} : Set ℝ²) := by
    ext z
    constructor
    · rintro ⟨x, hx, rfl⟩
      have hx' : x = q ∨ x = w ∨ x = o := by
        simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using hx
      rcases hx' with rfl | rfl | rfl <;> simp
    · intro hz
      have hz' : z = F q ∨ z = F w ∨ z = F o := by
        simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using hz
      rcases hz' with rfl | rfl | rfl
      · exact ⟨q, by simp, rfl⟩
      · exact ⟨w, by simp, rfl⟩
      · exact ⟨o, by simp, rfl⟩
  by_contra hnot
  have hprod : 0 ≤ F c 1 * F o 1 := le_of_not_gt hnot
  rcases lt_or_gt_of_ne ho1ne with honeg | hopos
  · have hcneg : F c 1 ≤ 0 := by nlinarith
    have holtc : F o 1 < F c 1 := by nlinarith [hSq]
    let lam : ℝ := (-F c 1) / (-F o 1)
    have hlam0 : 0 ≤ lam := by
      dsimp [lam]
      exact div_nonneg (by linarith) (by linarith)
    have hlam1 : lam ≤ 1 := by
      dsimp [lam]
      apply (div_le_iff₀ (by linarith : 0 < -F o 1)).2
      nlinarith
    have hmid : midpoint ℝ (F q) (F w) = planePoint 0 0 := by
      rw [F.map_q₁, F.map_q₂, midpoint_eq_smul_add]
      ext i
      fin_cases i <;> simp [planePoint]
    have hline :
        AffineMap.lineMap (midpoint ℝ (F q) (F w)) (F o) lam = F c := by
      rw [hmid, AffineMap.lineMap_apply_module]
      ext i
      fin_cases i
      · simp [planePoint, hc0, ho0]
      · simp [planePoint]
        dsimp [lam]
        field_simp [ho1ne]
    have hseg : F c ∈ segment ℝ (midpoint ℝ (F q) (F w)) (F o) := by
      rw [segment_eq_image_lineMap]
      exact ⟨lam, ⟨hlam0, hlam1⟩, hline⟩
    have hmem : F c ∈ convexHull ℝ ({F q, F w, F o} : Set ℝ²) :=
      Problem97.mem_convexHull_of_midpoint_segment hseg
    have hmapmem : c ∈ convexHull ℝ ({q, w, o} : Set ℝ²) := by
      apply (F.convexHull_mem_iff).mp
      rw [himage]
      exact hmem
    have hsub : ({q, w, o} : Set ℝ²) ⊆
        Set.diff (A : Set ℝ²) (Set.singleton c) := by
      intro z hz
      rcases hz with rfl | rfl | rfl
      · exact ⟨by exact_mod_cast hq, by intro h; exact hcq h.symm⟩
      · exact ⟨by exact_mod_cast hw, by intro h; exact hcw h.symm⟩
      · exact ⟨by exact_mod_cast ho, by intro h; exact hco h.symm⟩
    exact hconv c hc (convexHull_mono hsub hmapmem)
  · have hcpos : 0 ≤ F c 1 := by nlinarith
    have hclto : F c 1 < F o 1 := by nlinarith [hSq]
    let lam : ℝ := F c 1 / F o 1
    have hlam0 : 0 ≤ lam := by
      dsimp [lam]
      exact div_nonneg hcpos (le_of_lt hopos)
    have hlam1 : lam ≤ 1 := by
      dsimp [lam]
      apply (div_le_iff₀ hopos).2
      nlinarith
    have hmid : midpoint ℝ (F q) (F w) = planePoint 0 0 := by
      rw [F.map_q₁, F.map_q₂, midpoint_eq_smul_add]
      ext i
      fin_cases i <;> simp [planePoint]
    have hline :
        AffineMap.lineMap (midpoint ℝ (F q) (F w)) (F o) lam = F c := by
      rw [hmid, AffineMap.lineMap_apply_module]
      ext i
      fin_cases i
      · simp [planePoint, hc0, ho0]
      · simp [planePoint]
        dsimp [lam]
        field_simp [ho1ne]
    have hseg : F c ∈ segment ℝ (midpoint ℝ (F q) (F w)) (F o) := by
      rw [segment_eq_image_lineMap]
      exact ⟨lam, ⟨hlam0, hlam1⟩, hline⟩
    have hmem : F c ∈ convexHull ℝ ({F q, F w, F o} : Set ℝ²) :=
      Problem97.mem_convexHull_of_midpoint_segment hseg
    have hmapmem : c ∈ convexHull ℝ ({q, w, o} : Set ℝ²) := by
      apply (F.convexHull_mem_iff).mp
      rw [himage]
      exact hmem
    have hsub : ({q, w, o} : Set ℝ²) ⊆
        Set.diff (A : Set ℝ²) (Set.singleton c) := by
      intro z hz
      rcases hz with rfl | rfl | rfl
      · exact ⟨by exact_mod_cast hq, by intro h; exact hcq h.symm⟩
      · exact ⟨by exact_mod_cast hw, by intro h; exact hcw h.symm⟩
      · exact ⟨by exact_mod_cast ho, by intro h; exact hco h.symm⟩
    exact hconv c hc (convexHull_mono hsub hmapmem)

private theorem normalize_heights {u v : ℝ}
    (hu : u ^ 2 ≤ 1) (hv : 3 ≤ v ^ 2) (huv : u * v < 0) :
    ∃ σ h k : ℝ, (σ = 1 ∨ σ = -1) ∧
      Real.sqrt 3 ≤ h ∧ 0 < k ∧ k ≤ 1 ∧ u = σ * k ∧ v = -σ * h := by
  have hs : (Real.sqrt 3)^2 = 3 := Real.sq_sqrt (by norm_num)
  have hs0 : 0 ≤ Real.sqrt 3 := Real.sqrt_nonneg _
  rcases mul_neg_iff.mp huv with ⟨hu0, hv0⟩ | ⟨hu0, hv0⟩
  · refine ⟨1, -v, u, Or.inl rfl, ?_, ?_, ?_, by ring, by ring⟩
    all_goals nlinarith
  · refine ⟨-1, v, -u, Or.inr rfl, ?_, ?_, ?_, by ring, by ring⟩
    all_goals nlinarith


private theorem normalize_acute_heights {u v : ℝ}
    (hu : u ^ 2 ≤ 1) (hv : 1 < v ^ 2) (huv : u * v < 0) :
    ∃ σ h k : ℝ, (σ = 1 ∨ σ = -1) ∧
      1 < h ∧ 0 < k ∧ k ≤ 1 ∧ u = σ * k ∧ v = -σ * h := by
  rcases mul_neg_iff.mp huv with ⟨hu0, hv0⟩ | ⟨hu0, hv0⟩
  · refine ⟨1, -v, u, Or.inl rfl, ?_, ?_, ?_, by ring, by ring⟩
    all_goals nlinarith
  · refine ⟨-1, v, -u, Or.inr rfl, ?_, ?_, ?_, by ring, by ring⟩
    all_goals nlinarith

private theorem cap_separator_signs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {q c b : ℝ²}
    (hq : q ∈ S.capInteriorByIndex S.oppIndex1)
    (hc : c ∈ S.capInteriorByIndex S.oppIndex1)
    (hbA : b ∈ D.A) (hb : b ∉ S.capByIndex S.oppIndex1) :
    ∃ L : ℝ² →ᵃ[ℝ] ℝ, 0 < L q ∧ 0 < L c ∧ L S.oppApex1 < 0 ∧ L b < 0 := by
  let P := (S.triangleByIndex S.oppIndex1).v2
  let Q := (S.triangleByIndex S.oppIndex1).v3
  have hqside := S.signedArea2_mul_neg_of_mem_capInteriorByIndex D.convex _ hq
  have hcside := S.signedArea2_mul_neg_of_mem_capInteriorByIndex D.convex _ hc
  have hbside := S.signedArea2_mul_pos_of_not_mem_capByIndex _ hbA hb
  rw [← first_apex_eq_triangle_vertex S] at hqside hcside hbside
  let L := chordFunctional S.oppApex1 P Q
  have heval (x : ℝ²) : L x = -signedArea2 x P Q * signedArea2 S.oppApex1 P Q := rfl
  have hne : signedArea2 S.oppApex1 P Q ≠ 0 := by
    intro he
    change signedArea2 q P Q * signedArea2 S.oppApex1 P Q < 0 at hqside
    rw [he, mul_zero] at hqside
    exact (lt_irrefl 0) hqside
  refine ⟨L, ?_, ?_, ?_, ?_⟩
  · rw [heval]
    change signedArea2 q P Q * signedArea2 S.oppApex1 P Q < 0 at hqside
    nlinarith
  · rw [heval]
    change signedArea2 c P Q * signedArea2 S.oppApex1 P Q < 0 at hcside
    nlinarith
  · rw [heval]
    nlinarith [sq_pos_of_ne_zero hne]
  · rw [heval]
    change 0 < signedArea2 b P Q * signedArea2 S.oppApex1 P Q at hbside
    nlinarith


/-- Two mutually incident selected rows, one containing both strict-interior
endpoints, force their chord to exceed the first-apex radius. No minimum-pair
or interior-cardinality assumption is used in this geometric inequality. -/
theorem radius_lt_dist_of_mutual_selectedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c b : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (Kc : SelectedFourClass D.A c) (Kb : SelectedFourClass D.A b)
    (hqKc : q ∈ Kc.support) (hwKc : w ∈ Kc.support) (hbKc : b ∈ Kc.support)
    (hqKb : q ∈ Kb.support) (hcKb : c ∈ Kb.support) :
    r < dist q w := by
  by_contra hnot
  have hshort : dist q w ≤ r := le_of_not_gt hnot
  have hrpos : 0 < r := (dist_pos.mpr hqw).trans_le hshort
  have hqA := Kc.support_subset_A hqKc
  have hwA := Kc.support_subset_A hwKc
  have hbA := Kc.support_subset_A hbKc
  have hOA : S.oppApex1 ∈ D.A := by
    rw [first_apex_eq_triangle_vertex S]
    exact (S.triangleByIndex S.oppIndex1).v1_mem
  have heq := (Kc.support_eq_radius q hqKc).trans (Kc.support_eq_radius w hwKc).symm
  have hcb := (Kc.support_eq_radius b hbKc).trans (Kc.support_eq_radius q hqKc).symm
  have hbq := (Kb.support_eq_radius q hqKb).trans (Kb.support_eq_radius c hcKb).symm
  have hbq' : dist b q = dist c q := by rw [hbq, dist_comm b c, hcb]
  have hbc : dist b c = dist c q := by rw [dist_comm b c, hcb]
  obtain ⟨hcI, hboff, hbqne, hbwne, hbone, hcqne, hcwne⟩ :=
    mutual_selectedRows_geometry hq hw hqw hr hcA hcO Kc Kb hqKc hwKc hbKc hqKb hcKb
  obtain ⟨L, hLq, hLc, hLO, hLb⟩ :=
    cap_separator_signs (Finset.mem_inter.mp hq).2 hcI hbA hboff
  let F := Erdos9796Proof.Geometry.ofDistinct hqw
  obtain ⟨hcx, hox, hcsq, hosq, hdrop⟩ :=
    frame_radius_bounds hq hw hqw hr hcA hcO heq hshort F
  have hheight := bisector_frame_height_mul_neg F D.convex hqA hwA hOA hcA
    hcqne hcwne hcx hox hdrop
  obtain ⟨σ, h, k, hσ, hsh, hk, hk1, hck, hoh⟩ :=
    normalize_heights hcsq hosq hheight
  let y := σ * F b 1
  have hby : F b 1 = σ * y := by
    rcases hσ with rfl | rfl <;> dsimp [y] <;> ring
  have hOq : S.oppApex1 ≠ q := by
    intro he
    have hh := (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
    rw [he, dist_self] at hh
    linarith
  have hFO : F.map S.oppApex1 = planePoint 0 (-σ * h) := by
    ext i
    fin_cases i
    · simpa [planePoint, PiLp.add_apply] using hox
    · simpa [planePoint, PiLp.add_apply] using hoh
  have hFc : F.map c = planePoint 0 (σ * k) := by
    ext i
    fin_cases i
    · simpa [planePoint, PiLp.add_apply] using hcx
    · simpa [planePoint, PiLp.add_apply] using hck
  have hFb : F.map b = planePoint (F b 0) (σ * y) := by
    ext i
    fin_cases i
    · simp [planePoint, PiLp.add_apply]
    · simpa [planePoint, PiLp.add_apply] using hby
  obtain ⟨heq1, heq2⟩ := frame_mutual_eqs F hcx hbq' hbc
  have heq1' : (F b 0 + 1) ^ 2 + y ^ 2 = 1 + k ^ 2 := by
    rw [hby, hck] at heq1
    rcases hσ with rfl | rfl <;> nlinarith only [heq1]
  have heq2' : (F b 0) ^ 2 + (y - k) ^ 2 = 1 + k ^ 2 := by
    rw [hby, hck] at heq2
    rcases hσ with rfl | rfl <;> nlinarith only [heq2]
  exact ExactFiveMutualReturnChord.normalized_mutual_return_false
    D.convex hqA hwA hOA hcA hbA hbone hbqne hbwne hcqne hOq F.map F.injective
    hσ (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3)) (Real.sqrt_pos.mpr (by norm_num))
    hsh hk hk1 F.map_q₁ F.map_q₂ hFO hFc hFb heq1' heq2' L hLq hLc hLO hLb

/-- Mutually incident actual rows satisfy the sharp radius bound, without any
minimum-pair or interior-cardinality assumption. -/
theorem radius_lt_sqrt_three_sub_one_mul_of_mutual_selectedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c b : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩ S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w) (hr : 0 ≤ r) (hcA : c ∈ D.A) (hcO : c ≠ S.oppApex1)
    (Kc : SelectedFourClass D.A c) (Kb : SelectedFourClass D.A b)
    (hqKc : q ∈ Kc.support) (hwKc : w ∈ Kc.support) (hbKc : b ∈ Kc.support)
    (hqKb : q ∈ Kb.support) (hcKb : c ∈ Kb.support) :
    Kc.radius < (Real.sqrt 3 - 1) * r := by
  have hqA := Kc.support_subset_A hqKc
  have hwA := Kc.support_subset_A hwKc
  have hbA := Kc.support_subset_A hbKc
  have hOA : S.oppApex1 ∈ D.A := by
    rw [first_apex_eq_triangle_vertex S]
    exact (S.triangleByIndex S.oppIndex1).v1_mem
  have heq := (Kc.support_eq_radius q hqKc).trans (Kc.support_eq_radius w hwKc).symm
  have hrpos : 0 < r := lt_of_le_of_lt dist_nonneg
    (FirstApexInteriorPairGeometry.bisectorCenter_radius_lt_of_selected_pair
      hq hw hqw hr hcA hcO heq)
  have hcb := (Kc.support_eq_radius b hbKc).trans (Kc.support_eq_radius q hqKc).symm
  have hbq := (Kb.support_eq_radius q hqKb).trans (Kb.support_eq_radius c hcKb).symm
  have hbq' : dist b q = dist c q := by rw [hbq, dist_comm b c, hcb]
  have hbc : dist b c = dist c q := by rw [dist_comm b c, hcb]
  obtain ⟨hcI, hboff, hbqne, hbwne, hbone, hcqne, hcwne⟩ :=
    mutual_selectedRows_geometry hq hw hqw hr hcA hcO Kc Kb hqKc hwKc hbKc hqKb hcKb
  obtain ⟨L, hLq, hLc, hLO, hLb⟩ :=
    cap_separator_signs (Finset.mem_inter.mp hq).2 hcI hbA hboff
  let F := Erdos9796Proof.Geometry.ofDistinct hqw
  obtain ⟨hcx, hox, hcsq, hosq, hdrop⟩ :=
    frame_radius_bounds_acute hq hw hqw hr hcA hcO heq F
  have hheight := bisector_frame_height_mul_neg F D.convex hqA hwA hOA hcA
    hcqne hcwne hcx hox hdrop
  obtain ⟨σ, h, k, hσ, hh, hk, hk1, hck, hoh⟩ :=
    normalize_acute_heights hcsq hosq hheight
  let y := σ * F b 1
  have hby : F b 1 = σ * y := by
    rcases hσ with rfl | rfl <;> dsimp [y] <;> ring
  have hOq : S.oppApex1 ≠ q := by
    intro he
    have hh := (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
    rw [he, dist_self] at hh
    linarith
  have hFO : F.map S.oppApex1 = planePoint 0 (-σ * h) := by
    ext i
    fin_cases i
    · simpa [planePoint, PiLp.add_apply] using hox
    · simpa [planePoint, PiLp.add_apply] using hoh
  have hFc : F.map c = planePoint 0 (σ * k) := by
    ext i
    fin_cases i
    · simpa [planePoint, PiLp.add_apply] using hcx
    · simpa [planePoint, PiLp.add_apply] using hck
  have hFb : F.map b = planePoint (F b 0) (σ * y) := by
    ext i
    fin_cases i
    · simp [planePoint, PiLp.add_apply]
    · simpa [planePoint, PiLp.add_apply] using hby
  obtain ⟨heq1, heq2⟩ := frame_mutual_eqs F hcx hbq' hbc
  have heq1' : (F b 0 + 1) ^ 2 + y ^ 2 = 1 + k ^ 2 := by
    rw [hby, hck] at heq1
    rcases hσ with rfl | rfl <;> nlinarith only [heq1]
  have heq2' : (F b 0) ^ 2 + (y - k) ^ 2 = 1 + k ^ 2 := by
    rw [hby, hck] at heq2
    rcases hσ with rfl | rfl <;> nlinarith only [heq2]
  have hs : (Real.sqrt 3)^2 = 3 := Real.sq_sqrt (by norm_num)
  have hspos : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have hksharp := ExactFiveMutualReturnChord.normalized_mutual_return_height_lt
    D.convex hqA hwA hOA hcA hbA hbone hbqne hbwne hcqne hOq F.map F.injective
    hσ hs hspos hh hk hk1 F.map_q₁ F.map_q₂ hFO hFc hFb heq1' heq2'
    L hLq hLc hLO hLb
  have hs1 : 1 < Real.sqrt 3 := by nlinarith only [hs, hspos]
  have hs2 : Real.sqrt 3 < 2 := by nlinarith only [hs, hspos]
  have hksq : k^2 < (2 - Real.sqrt 3)^2 :=
    (sq_lt_sq₀ hk.le (by linarith)).2 hksharp
  have hcScale := bisector_frame_sq F hcx
  rw [Kc.support_eq_radius q hqKc, hck] at hcScale
  have hcScale' : (F.scale * Kc.radius)^2 = 1 + k^2 := by
    rcases hσ with rfl | rfl <;> nlinarith only [hcScale]
  have hoScale := bisector_frame_sq F hox
  rw [(mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2] at hoScale
  have hrScale : 2 < (F.scale * r)^2 := by linarith only [hosq, hoScale]
  have hcBound : (F.scale * Kc.radius)^2 < (Real.sqrt 3 - 1)^2 * 2 := by
    nlinarith only [hksq, hs, hcScale']
  have hmul := mul_lt_mul_of_pos_left hrScale
    (sq_pos_of_pos (sub_pos.mpr hs1))
  have hscaledSq : (F.scale * Kc.radius)^2 <
      (F.scale * ((Real.sqrt 3 - 1) * r))^2 := by
    nlinarith only [hcBound, hmul]
  have hcNonneg : 0 ≤ Kc.radius := by
    rw [← Kc.support_eq_radius q hqKc]
    exact dist_nonneg
  have hscaled := (sq_lt_sq₀ (mul_nonneg F.scale_pos.le hcNonneg)
    (mul_nonneg F.scale_pos.le (mul_nonneg (by linarith) hr))).1 hscaledSq
  nlinarith only [hscaled, F.scale_pos]

end Problem97.MutualSelectedRowChord
