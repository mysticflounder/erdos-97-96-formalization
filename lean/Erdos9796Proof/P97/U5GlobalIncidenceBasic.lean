/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5ModeADeletion

/-!
# U5 global-incidence basic interface

This file records the approved non-local escape hatch for the U5d-d2c
same-circle incompatibility.

It gives the forced repeated-circle theorem a small theorem-facing interface.
The row/global producer payload is carried by `U5CandidateDescriptor`, so
concrete row constructors must provide either the same-circle export or the
audited bounded support payload.  Once a selected q-free candidate is placed on
the dangerous `p`-circle, this file also proves that it supplies a surviving
`K4` witness after deleting `q`.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- The theorem-facing data of a dangerous fixed triple around `p` after
deleting `q`.  The three points of `T` lie in the q-deleted skeleton, avoid the
center `p`, and share the radius `dist p q`. -/
structure U5DangerousTriple (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) where
  q_mem : q ∈ D.A
  p_mem : p ∈ D.A
  p_ne_q : p ≠ q
  T_subset : T ⊆ (D.skeleton q).erase p
  T_card : T.card = 3
  T_noncollinear : ¬ Collinear ℝ (T : Set ℝ²)
  q_radius_pos : 0 < dist p q
  T_same_radius : ∀ t ∈ T, dist p t = dist p q

/-- Extract named labels from the theorem-facing dangerous triple.  The finite
audit works with labels `t1,t2,t3`; this lemma is the bridge from the
`Finset` representation to those names. -/
theorem U5DangerousTriple.exists_triple_labels
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    (h : U5DangerousTriple D q p T) :
    ∃ t1 t2 t3 : ℝ²,
      t1 ≠ t2 ∧ t1 ≠ t3 ∧ t2 ≠ t3 ∧
      T = {t1, t2, t3} ∧
      ¬ Collinear ℝ ({t1, t2, t3} : Set ℝ²) ∧
      dist p t1 = dist p q ∧ dist p t2 = dist p q ∧
      dist p t3 = dist p q := by
  have hcard := h.T_card
  rw [Finset.card_eq_three] at hcard
  rcases hcard with ⟨t1, t2, t3, ht12, ht13, ht23, hT⟩
  refine ⟨t1, t2, t3, ht12, ht13, ht23, hT, ?_, ?_, ?_, ?_⟩
  · simpa [hT] using h.T_noncollinear
  · exact h.T_same_radius t1 (by simp [hT])
  · exact h.T_same_radius t2 (by simp [hT])
  · exact h.T_same_radius t3 (by simp [hT])

/-- The part of a selected U5d-d2b candidate that is independent of the
same-circle incompatibility: the candidate is present after deleting `q` and is not one of
the three dangerous triple points. -/
structure U5SelectedCandidateSkeleton (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) where
  candidate_mem : u ∈ (D.skeleton q).erase p
  candidate_notin_T : u ∉ T

/-- Same-circle export in the theorem-facing radius form: the selected candidate
lies on the same `p`-centered circle as the dangerous triple and `q`. -/
def U5SameCircleExport (D : CounterexampleData) (q p : ℝ²)
    (_T : Finset ℝ²) (u : ℝ²) : Prop :=
  u ∈ (D.skeleton q).erase p ∧ dist p u = dist p q

/-- Equality of squared `p`-radii gives the same-circle export once the
selected candidate is known to survive deleting `q`.

This is the theorem-facing square-completion endpoint used by `U5d-d2c`: after
the row algebra proves `dist p u ^ 2 = dist p t ^ 2` for a dangerous triple
point `t`, the nonnegativity of distances converts it to the radius equality
needed by `U5SameCircleExport`. -/
theorem u5SameCircleExport_of_dist_sq_eq
    {D : CounterexampleData} {q p t u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht_radius : dist p t = dist p q)
    (hsq : dist p u ^ 2 = dist p t ^ 2) :
    U5SameCircleExport D q p T u := by
  refine ⟨hsel.candidate_mem, ?_⟩
  have hdist : dist p u = dist p t :=
    (sq_eq_sq₀ (dist_nonneg) (dist_nonneg)).mp hsq
  exact hdist.trans ht_radius

/-- The affine same-circle equation is exactly the square-completion input.

This is the algebraic bridge used by the U5d-d2c prose stack: after row
elimination produces
`2 * inner ℝ p (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2`, square-completion gives the
theorem-facing equality of squared `p`-radii. -/
theorem dist_sq_eq_of_affine_circle_eq {p t u : ℝ²}
    (haff :
      (2 : ℝ) * inner ℝ p (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2) :
    dist p u ^ 2 = dist p t ^ 2 := by
  rw [dist_eq_norm, dist_eq_norm, norm_sub_sq_real, norm_sub_sq_real]
  rw [inner_sub_right] at haff
  nlinarith

/-- Equality of squared distances to a center gives the affine same-circle
equation. -/
theorem affine_circle_eq_of_dist_sq_eq {p t u : ℝ²}
    (hsq : dist p u ^ 2 = dist p t ^ 2) :
    (2 : ℝ) * inner ℝ p (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2 := by
  rw [dist_eq_norm, dist_eq_norm, norm_sub_sq_real, norm_sub_sq_real] at hsq
  rw [inner_sub_right]
  nlinarith

/-- Equal squared distances to two centers place `u - t` on the radical-axis
direction between those centers. -/
theorem radical_axis_eq_of_dist_sq_eqs {q p t u : ℝ²}
    (hq : dist q u ^ 2 = dist q t ^ 2)
    (hp : dist p u ^ 2 = dist p t ^ 2) :
    inner ℝ (p - q) (u - t) = 0 := by
  have hqa := affine_circle_eq_of_dist_sq_eq hq
  have hpa := affine_circle_eq_of_dist_sq_eq hp
  rw [inner_sub_left]
  nlinarith

/-- Two centers equidistant from the same three noncollinear points are equal. -/
theorem eq_of_equidistant_three_noncollinear
    {a b c x y : ℝ²}
    (harea : signedArea2 a b c ≠ 0)
    (hxab : dist x a = dist x b)
    (hxac : dist x a = dist x c)
    (hyab : dist y a = dist y b)
    (hyac : dist y a = dist y c) :
    x = y := by
  have hxab_sq : dist x a ^ 2 = dist x b ^ 2 := by rw [hxab]
  have hyab_sq : dist y a ^ 2 = dist y b ^ 2 := by rw [hyab]
  have hxac_sq : dist x a ^ 2 = dist x c ^ 2 := by rw [hxac]
  have hyac_sq : dist y a ^ 2 = dist y c ^ 2 := by rw [hyac]
  have hab : inner ℝ (x - y) (a - b) = 0 := by
    exact radical_axis_eq_of_dist_sq_eqs hyab_sq hxab_sq
  have hac : inner ℝ (x - y) (a - c) = 0 := by
    exact radical_axis_eq_of_dist_sq_eqs hyac_sq hxac_sq
  have hba : inner ℝ (x - y) (b - a) = 0 := by
    rw [show b - a = -(a - b) by abel, inner_neg_right, hab, neg_zero]
  have hca : inner ℝ (x - y) (c - a) = 0 := by
    rw [show c - a = -(a - c) by abel, inner_neg_right, hac, neg_zero]
  by_contra hxy
  have hn : x - y ≠ 0 := sub_ne_zero.mpr hxy
  have hba_coord :
      (b - a) 0 * (x - y) 0 + (b - a) 1 * (x - y) 1 = 0 := by
    simpa [inner, Fin.sum_univ_two, mul_comm] using hba
  have hca_coord :
      (c - a) 0 * (x - y) 0 + (c - a) 1 * (x - y) 1 = 0 := by
    simpa [inner, Fin.sum_univ_two, mul_comm] using hca
  have hdet0 :
      (c 0 - a 0) * (b 1 - a 1) -
          (b 0 - a 0) * (c 1 - a 1) = 0 := by
    by_cases hn0 : (x - y) 0 = 0
    · have hn1 : (x - y) 1 ≠ 0 := by
        intro hn1
        apply hn
        ext i
        fin_cases i
        · exact hn0
        · exact hn1
      have hb1 : (b - a) 1 = 0 := by
        have hprod : (b - a) 1 * (x - y) 1 = 0 := by
          simpa [hn0] using hba_coord
        exact (mul_eq_zero.mp hprod).resolve_right hn1
      have hc1 : (c - a) 1 = 0 := by
        have hprod : (c - a) 1 * (x - y) 1 = 0 := by
          simpa [hn0] using hca_coord
        exact (mul_eq_zero.mp hprod).resolve_right hn1
      simpa using (by
        rw [show c 1 - a 1 = (c - a) 1 by rfl,
          show b 1 - a 1 = (b - a) 1 by rfl, hb1, hc1]
        ring :
          (c 0 - a 0) * (b 1 - a 1) -
              (b 0 - a 0) * (c 1 - a 1) = 0)
    · have hb0 : (b - a) 0 = -((x - y) 1 / (x - y) 0) * (b - a) 1 := by
        field_simp [hn0]
        linear_combination hba_coord
      have hc0 : (c - a) 0 = -((x - y) 1 / (x - y) 0) * (c - a) 1 := by
        field_simp [hn0]
        linear_combination hca_coord
      rw [show b 0 - a 0 = (b - a) 0 by rfl,
        show c 0 - a 0 = (c - a) 0 by rfl,
        show b 1 - a 1 = (b - a) 1 by rfl,
        show c 1 - a 1 = (c - a) 1 by rfl,
        hb0, hc0]
      ring
  unfold signedArea2 at harea
  have harea0 :
      (b 0 - a 0) * (c 1 - a 1) -
          (c 0 - a 0) * (b 1 - a 1) = 0 := by
    linear_combination -hdet0
  exact harea harea0

/-- A row-center squared-distance equality plus the radical-axis equation gives
the target-center squared-distance equality. -/
theorem dist_sq_eq_of_dist_sq_eq_of_radical_axis {q p t u : ℝ²}
    (hq : dist q u ^ 2 = dist q t ^ 2)
    (hrad : inner ℝ (p - q) (u - t) = 0) :
    dist p u ^ 2 = dist p t ^ 2 := by
  have hrow : (2 : ℝ) * inner ℝ q (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2 :=
    affine_circle_eq_of_dist_sq_eq hq
  exact dist_sq_eq_of_affine_circle_eq (by
    calc
      (2 : ℝ) * inner ℝ p (u - t)
          = (2 : ℝ) * inner ℝ ((p - q) + q) (u - t) := by
              rw [sub_add_cancel]
      _ = (2 : ℝ) *
            (inner ℝ (p - q) (u - t) + inner ℝ q (u - t)) := by
              rw [inner_add_left]
      _ = (2 : ℝ) * inner ℝ q (u - t) := by rw [hrad, zero_add]
      _ = ‖u‖ ^ 2 - ‖t‖ ^ 2 := hrow)

/-- The theorem-facing affine same-circle equation gives the U5 same-circle
export once the selected candidate survives deleting `q`. -/
theorem u5SameCircleExport_of_affine_circle_eq
    {D : CounterexampleData} {q p t u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht_radius : dist p t = dist p q)
    (haff :
      (2 : ℝ) * inner ℝ p (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2) :
    U5SameCircleExport D q p T u :=
  u5SameCircleExport_of_dist_sq_eq hsel ht_radius
    (dist_sq_eq_of_affine_circle_eq haff)

/-- A q-free witness is the selected candidate skeleton data plus the
same-circle export. -/
structure U5QFreeWitness (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) where
  selected : U5SelectedCandidateSkeleton D q p T u
  same_circle : U5SameCircleExport D q p T u

/-- A concrete q-deleted `K4` witness class at a center.  This is the
theorem-facing shape used by the bounded eight-point reduction: every selected
class is q-free, lives after deleting its center, and has a positive common
radius. -/
structure U5QDeletedK4Class (D : CounterexampleData) (q center : ℝ²)
    (B : Finset ℝ²) : Type where
  subset : B ⊆ (D.skeleton q).erase center
  card_four : 4 ≤ B.card
  q_not_mem : q ∉ B
  radius : ℝ
  radius_pos : 0 < radius
  same_radius : ∀ y ∈ B, dist center y = radius

/-- A q-allowed four-point witness class at a center.

This is the same witness shape as `U5QDeletedK4Class`, but it drops the
`q ∉ B` condition so the row-specific c5d3b producer interface can admit
`q` in the ambient support. -/
structure U5QAllowedK4Class (D : CounterexampleData) (center : ℝ²)
    (B : Finset ℝ²) : Type where
  subset : B ⊆ D.skeleton center
  card_four : 4 ≤ B.card
  radius : ℝ
  radius_pos : 0 < radius
  same_radius : ∀ y ∈ B, dist center y = radius

/-- Forget the q-free condition. -/
def U5QDeletedK4Class.toQAllowedK4Class
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    U5QAllowedK4Class D center B where
  subset := by
    intro y hy
    have hy_center : y ∈ (D.skeleton q).erase center := K.subset hy
    have hy_skeleton_q : y ∈ D.skeleton q := (Finset.mem_erase.mp hy_center).2
    have hy_A : y ∈ D.A := (Finset.mem_erase.mp hy_skeleton_q).2
    have hy_ne_center : y ≠ center := (Finset.mem_erase.mp hy_center).1
    exact Finset.mem_erase.mpr ⟨hy_ne_center, hy_A⟩
  card_four := K.card_four
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.same_radius

/-- Global `K4` supplies an exact q-allowed four-point star class at any
ambient center.

This separates the easy existence information from the open support-
confinement question: the selected class may still lie outside the bounded
support used by the finite audit. -/
theorem U5QAllowedK4Class.exists_card_four_of_globalK4
    {D : CounterexampleData} {center : ℝ²}
    (hcenter : center ∈ D.A) :
    ∃ B : Finset ℝ², Nonempty (U5QAllowedK4Class D center B) ∧
      B.card = 4 := by
  rcases D.K4 center hcenter with ⟨r, hr_pos, hcard⟩
  let C : Finset ℝ² := D.A.filter fun y => dist center y = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with ⟨B, hBC, hBcard⟩
  refine ⟨B, ⟨?_, hBcard⟩⟩
  refine ⟨
    { subset := ?_
      card_four := ?_
      radius := r
      radius_pos := hr_pos
      same_radius := ?_ }⟩
  · intro y hy
    have hyC : y ∈ C := hBC hy
    have hyA : y ∈ D.A := (Finset.mem_filter.mp hyC).1
    have hyr : dist center y = r := (Finset.mem_filter.mp hyC).2
    refine Finset.mem_erase.mpr ⟨?_, hyA⟩
    intro hycenter
    subst y
    rw [dist_self] at hyr
    linarith
  · rw [hBcard]
  · intro y hy
    exact (Finset.mem_filter.mp (hBC hy)).2

/-- Global `K4` supplies an exact q-allowed four-point star class at any
q-deleted center. -/
theorem U5QAllowedK4Class.exists_card_four_of_mem_skeleton
    {D : CounterexampleData} {q center : ℝ²}
    (hcenter : center ∈ D.skeleton q) :
    ∃ B : Finset ℝ², Nonempty (U5QAllowedK4Class D center B) ∧
      B.card = 4 := by
  have hcenterA : center ∈ D.A := by
    have hcenter_erase : center ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hcenter
    exact (Finset.mem_erase.mp hcenter_erase).2
  exact U5QAllowedK4Class.exists_card_four_of_globalK4 hcenterA

/-- A q-critical exact triple at `center`: after deleting `q`, exactly three
surviving points remain on the circle through `q`.

Together with the deleted point `q`, this is the 4A q-critical alternative
produced by `U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4`.
It is separate from `U5QDeletedK4Class`, whose witnesses are q-free
four-point classes in the deleted skeleton. -/
structure U5QCriticalTripleClass (D : CounterexampleData) (q center : ℝ²)
    (B : Finset ℝ²) : Type where
  subset : B ⊆ (D.skeleton q).erase center
  card_three : B.card = 3
  q_radius_pos : 0 < dist center q
  same_q_radius : ∀ y ∈ B, dist center y = dist center q

/-- A q-deleted `HasNEquidistantPointsAt 4` witness can be trimmed to an
exact four-point `U5QDeletedK4Class`.

This is pure packaging: it turns the upstream radius-filter definition into
the class record consumed by the U5 finite audit.  It does not produce the
missing U5 support-confinement payload; callers still have to prove the
q-deleted K4 fact at the relevant center and any bounded-support containment. -/
theorem U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
    {D : CounterexampleData} {q center : ℝ²}
    (h : HasNEquidistantPointsAt 4 (D.skeleton q) center) :
    ∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4 := by
  rcases h with ⟨r, hr_pos, hcard⟩
  let C : Finset ℝ² := (D.skeleton q).filter fun y => dist center y = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with ⟨B, hBC, hBcard⟩
  refine ⟨B, ⟨?_, hBcard⟩⟩
  refine ⟨
    { subset := ?_
      card_four := ?_
      q_not_mem := ?_
      radius := r
      radius_pos := hr_pos
      same_radius := ?_ }⟩
  · intro y hy
    have hyC : y ∈ C := hBC hy
    have hy_skeleton : y ∈ D.skeleton q := (Finset.mem_filter.mp hyC).1
    have hyr : dist center y = r := (Finset.mem_filter.mp hyC).2
    refine Finset.mem_erase.mpr ⟨?_, hy_skeleton⟩
    intro hcenter
    subst y
    rw [dist_self] at hyr
    linarith
  · rw [hBcard]
  · intro hqB
    have hqC : q ∈ C := hBC hqB
    have hq_skeleton : q ∈ D.skeleton q := (Finset.mem_filter.mp hqC).1
    have hq_erase : q ∈ D.A.erase q := by
      change q ∈ D.A.erase q at hq_skeleton
      exact hq_skeleton
    exact (Finset.mem_erase.mp hq_erase).1 rfl
  · intro y hy
    exact (Finset.mem_filter.mp (hBC hy)).2

/-- An already center-erased q-deleted `HasNEquidistantPointsAt 4` witness can
be trimmed to an exact four-point `U5QDeletedK4Class`.

This is the direct extraction shape needed by audited support constructors:
the input set has already removed the selected center, so the resulting class
is immediately a valid q-deleted class at that center. -/
theorem U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_erase_center
    {D : CounterexampleData} {q center : ℝ²}
    (h : HasNEquidistantPointsAt 4 ((D.skeleton q).erase center) center) :
    ∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4 := by
  rcases h with ⟨r, hr_pos, hcard⟩
  let C : Finset ℝ² :=
    ((D.skeleton q).erase center).filter fun y => dist center y = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with ⟨B, hBC, hBcard⟩
  refine ⟨B, ⟨?_, hBcard⟩⟩
  refine ⟨
    { subset := ?_
      card_four := ?_
      q_not_mem := ?_
      radius := r
      radius_pos := hr_pos
      same_radius := ?_ }⟩
  · intro y hy
    exact (Finset.mem_filter.mp (hBC hy)).1
  · rw [hBcard]
  · intro hqB
    have hqC : q ∈ C := hBC hqB
    have hq_center_erase : q ∈ (D.skeleton q).erase center :=
      (Finset.mem_filter.mp hqC).1
    have hq_skeleton : q ∈ D.skeleton q :=
      (Finset.mem_erase.mp hq_center_erase).2
    have hq_erase : q ∈ D.A.erase q := by
      change q ∈ D.A.erase q at hq_skeleton
      exact hq_skeleton
    exact (Finset.mem_erase.mp hq_erase).1 rfl
  · intro y hy
    exact (Finset.mem_filter.mp (hBC hy)).2

/-- Global `K4` at a q-deleted center either already gives an exact q-free
four-point class, or the center is in the q-critical 4A triple-circle case.

This is the first producer-side reduction for audited support payloads: after
the row proves that the q-critical alternative is forbidden for a selected
center, this theorem supplies the exact q-deleted class needed by
`U5BoundedAuditSupport.selected_classes`. -/
theorem U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
    {D : CounterexampleData} {q center : ℝ²}
    (hq : q ∈ D.A) (hcenter : center ∈ D.skeleton q) :
    (∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) ∧
      B.card = 4) ∨
      ∃ r : ℝ, 0 < r ∧ dist center q = r ∧
        ((((D.skeleton q).erase center).filter
          fun y => dist center y = r).card = 3) := by
  have hcenterA : center ∈ D.A := by
    have hcenter_skel : center ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hcenter
    exact (Finset.mem_erase.mp hcenter_skel).2
  have hcenter_ne_q : center ≠ q := by
    have hcenter_skel : center ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hcenter
    exact (Finset.mem_erase.mp hcenter_skel).1
  have hK4 : HasNEquidistantPointsAt 4 D.A center := D.K4 center hcenterA
  rcases u5_4A_trichotomy_erase D q center hq hcenterA hcenter_ne_q hK4 with
    hsurvive | hcritical
  · exact Or.inl
      (U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_erase_center
        hsurvive)
  · exact Or.inr hcritical

/-- Non-exact-cardinality version of
`U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_erase_center`. -/
theorem U5QDeletedK4Class.exists_of_hasNEquidistantPointsAt_erase_center
    {D : CounterexampleData} {q center : ℝ²}
    (h : HasNEquidistantPointsAt 4 ((D.skeleton q).erase center) center) :
    ∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) := by
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_erase_center
      h with
    ⟨B, hB, _⟩
  exact ⟨B, hB⟩

/-- Non-exact-cardinality version of
`U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`. -/
theorem U5QDeletedK4Class.exists_of_hasNEquidistantPointsAt_skeleton
    {D : CounterexampleData} {q center : ℝ²}
    (h : HasNEquidistantPointsAt 4 (D.skeleton q) center) :
    ∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) := by
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      h with
    ⟨B, hB, _⟩
  exact ⟨B, hB⟩

/-- If deleting `q` is already known to preserve the global `K4` property, then
every q-deleted center has a q-free four-point class in the skeleton.

This is mainly an interface sanity check: the U5 incompatibility lives in the
opposite, non-removable branch, so this theorem is not itself a U5 closure
argument. -/
theorem U5QDeletedK4Class.exists_card_four_of_removable
    {D : CounterexampleData} {q center : ℝ²}
    (hrem : IsRemovableVertex D.A q) (hcenter : center ∈ D.skeleton q) :
    ∃ B : Finset ℝ², Nonempty (U5QDeletedK4Class D q center B) ∧
      B.card = 4 := by
  have hprop : HasNEquidistantProperty 4 (D.skeleton q) := by
    simpa [CounterexampleData.skeleton] using hrem.2
  exact U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
    (hprop center hcenter)

/-- The eight-point support used by the bounded q-deleted audit:
`{p,q,u,a0,a1} ∪ T`. -/
noncomputable def U5BoundedSupport (_D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u a0 a1 : ℝ²) : Finset ℝ² :=
  insert p (insert q (insert u (insert a0 (insert a1 T))))

/-- Support-confinement data needed before the bounded fixed-pattern audit can
be used as a theorem source.  It asserts that two auxiliary vertices `a0,a1`
are enough to hold q-free selected `K4` classes at every q-deleted center
`T ∪ {u,a0,a1}`. -/
structure U5BoundedEightPointSupport (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type where
  a0 : ℝ²
  a1 : ℝ²
  a0_mem : a0 ∈ (D.skeleton q).erase p
  a1_mem : a1 ∈ (D.skeleton q).erase p
  a0_notin_base : a0 ∉ insert u T
  a1_notin_base : a1 ∉ insert u (insert a0 T)
  selected_classes :
    ∀ x ∈ insert u (insert a0 (insert a1 T)),
      Σ B : Finset ℝ²,
        Subtype fun _K : U5QDeletedK4Class D q x B =>
          B ⊆ U5BoundedSupport D q p T u a0 a1

/-- The q-allowed support used by the row-specialized c5d3b producer
interface: the bounded support with `q` reinserted. -/
noncomputable def U5QAllowedBoundedSupport (_D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u a0 a1 : ℝ²) : Finset ℝ² :=
  insert q (U5BoundedSupport _D q p T u a0 a1)

/-- Support-confinement data for the q-allowed c5d3b producer interface.

This is the row-specific analogue of `U5ConfinedK4AuditPayload`: the selected
class may contain `q`, so the target support is `insert q` of the usual
bounded support. -/
structure U5QAllowedConfinedK4AuditPayload (D : CounterexampleData)
    (q p : ℝ²) (T : Finset ℝ²) (u : ℝ²) : Type where
  a0 : ℝ²
  a1 : ℝ²
  a0_mem : a0 ∈ (D.skeleton q).erase p
  a1_mem : a1 ∈ (D.skeleton q).erase p
  a0_notin_base : a0 ∉ insert u T
  a1_notin_base : a1 ∉ insert u (insert a0 T)
  a0_off_circle : dist p a0 ≠ dist p q
  a1_off_circle : dist p a1 ≠ dist p q
  confined_class_exists :
    ∀ x ∈ insert u (insert a0 (insert a1 T)),
      ∃ B : Finset ℝ²,
        Nonempty (U5QAllowedK4Class D x B) ∧
          B.card = 4 ∧ B ⊆ U5QAllowedBoundedSupport D q p T u a0 a1

/-- The q-deleted centers used by the bounded audit:
`T ∪ {u,a0,a1}`. -/
noncomputable def U5BoundedAuditCenters (_D : CounterexampleData) (_q _p : ℝ²)
    (T : Finset ℝ²) (u a0 a1 : ℝ²) : Finset ℝ² :=
  insert u (insert a0 (insert a1 T))

/-- Audited support-confinement data matching the finite fixed-pattern sweep.

This strengthens `U5BoundedEightPointSupport` with the exact fields that the
finite audit actually uses: `a0,a1` are also off the dangerous `p`-circle, each
selected q-deleted class is represented by an exact four-point class, and
distinct selected centers satisfy the pairwise two-circle overlap proxy. -/
structure U5BoundedAuditSupport (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type
    extends U5BoundedEightPointSupport D q p T u where
  a0_off_circle : dist p a0 ≠ dist p q
  a1_off_circle : dist p a1 ≠ dist p q
  selected_card_four :
    ∀ x hx, ((selected_classes x hx).1).card = 4
  two_circle_overlap :
    ∀ x hx y hy, x ≠ y →
      (((selected_classes x hx).1) ∩ ((selected_classes y hy).1)).card ≤ 2

/-- q-allowed eight-point support for the c5d3b row-specific sweep.

This is the q-allowed analogue of `U5BoundedEightPointSupport`: the selected
classes may contain `q`, but they are still confined to the q-allowed bounded
support around the chosen row packet. -/
structure U5QAllowedBoundedEightPointSupport (D : CounterexampleData)
    (q p : ℝ²) (T : Finset ℝ²) (u : ℝ²) : Type where
  a0 : ℝ²
  a1 : ℝ²
  a0_mem : a0 ∈ (D.skeleton q).erase p
  a1_mem : a1 ∈ (D.skeleton q).erase p
  a0_notin_base : a0 ∉ insert u T
  a1_notin_base : a1 ∉ insert u (insert a0 T)
  selected_classes :
    ∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
      Σ B : Finset ℝ²,
        Subtype fun _K : U5QAllowedK4Class D x B =>
          B ⊆ U5QAllowedBoundedSupport D q p T u a0 a1

/-- q-allowed audited support data for the row-specialized c5d3b sweep.

This is the row-specific analogue of `U5BoundedAuditSupport`, with the q-free
restriction removed from the selected classes.  The off-circle and pairwise
overlap fields are the same geometric bookkeeping as the q-free branch. -/
structure U5QAllowedAuditSupport (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type
    extends U5QAllowedBoundedEightPointSupport D q p T u where
  a0_off_circle : dist p a0 ≠ dist p q
  a1_off_circle : dist p a1 ≠ dist p q
  selected_card_four :
    ∀ x hx, ((selected_classes x hx).1).card = 4
  two_circle_overlap :
    ∀ x hx y hy, x ≠ y →
      (((selected_classes x hx).1) ∩ ((selected_classes y hy).1)).card ≤ 2

/-- A theorem-facing descriptor for the row or packet that selects the candidate
`u_F`.

The descriptor now carries the exact producer payload needed by the U5 incompatibility:
for every selected candidate, the concrete row/global constructor must either
export same-circle directly or provide the audited bounded support payload
consumed by the finite audit.  Thus the global producer theorem is a projection
from explicit row evidence, not a new axiom or a vacuous proposition. -/
structure U5CandidateDescriptor (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) where
  Selects : ℝ² → Prop
  selected_skeleton :
    ∀ {u : ℝ²}, Selects u → U5SelectedCandidateSkeleton D q p T u
  producer_payload :
    ∀ {u : ℝ²}, D.IsM44 → U2Statement D → U5ModeA D →
      U5DangerousTriple D q p T → Selects u →
      U5SameCircleExport D q p T u ∨
        Nonempty (U5BoundedAuditSupport D q p T u)

/-- Endpoint-literal descriptor constructor from an already proved same-circle
export. -/
def u5EndpointLiteralDescriptor_of_sameCircleExport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsame : U5SameCircleExport D q p T u) :
    U5CandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inl hsame

/-- Endpoint-literal descriptor constructor from an already supplied audited
support payload. -/
def u5EndpointLiteralDescriptor_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : Nonempty (U5BoundedAuditSupport D q p T u)) :
    U5CandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inr hsupport

/-- Endpoint-literal descriptor constructor from a completed squared-radius
row proof.

Concrete U5d-d2c rows can use this after their square-completion algebra
produces `dist p u ^ 2 = dist p t ^ 2` for a named dangerous triple point
`t ∈ T`. -/
def u5EndpointLiteralDescriptor_of_dist_sq_eq
    {D : CounterexampleData} {q p t u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht : t ∈ T)
    (hsq : dist p u ^ 2 = dist p t ^ 2) :
    U5CandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inl
      (u5SameCircleExport_of_dist_sq_eq hsel
        (htriple.T_same_radius t ht) hsq)

/-- Endpoint-literal descriptor constructor from the affine same-circle row
equation.

Concrete U5d-d2c rows can use this at the `U5d-d2c1c1` output boundary, before
manually rewriting the row source into squared-distance form. -/
def u5EndpointLiteralDescriptor_of_affine_circle_eq
    {D : CounterexampleData} {q p t u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht : t ∈ T)
    (haff :
      (2 : ℝ) * inner ℝ p (u - t) = ‖u‖ ^ 2 - ‖t‖ ^ 2) :
    U5CandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inl
      (u5SameCircleExport_of_affine_circle_eq hsel
        (htriple.T_same_radius t ht) haff)

/-- The q-allowed analogue of `U5CandidateDescriptor`.

This is the row-specific descriptor shape needed by the c5d3b payload gate:
the producer may return either same-circle directly or the q-allowed audited
support package used by the row-specific finite audit. -/
structure U5QAllowedCandidateDescriptor (D : CounterexampleData)
    (q p : ℝ²) (T : Finset ℝ²) where
  Selects : ℝ² → Prop
  selected_skeleton :
    ∀ {u : ℝ²}, Selects u → U5SelectedCandidateSkeleton D q p T u
  producer_payload :
    ∀ {u : ℝ²}, D.IsM44 → U2Statement D → U5ModeA D →
      U5DangerousTriple D q p T → Selects u →
      U5SameCircleExport D q p T u ∨
        Nonempty (U5QAllowedAuditSupport D q p T u)

/-- Endpoint-literal q-allowed descriptor constructor from an already proved
same-circle export. -/
def u5QAllowedEndpointLiteralDescriptor_of_sameCircleExport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsame : U5SameCircleExport D q p T u) :
    U5QAllowedCandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inl hsame

/-- Endpoint-literal q-allowed descriptor constructor from an already
supplied q-allowed audited-support payload. -/
def u5QAllowedEndpointLiteralDescriptor_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : Nonempty (U5QAllowedAuditSupport D q p T u)) :
    U5QAllowedCandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inr hsupport

/-- The row-selected candidate predicate from the U5 closure plan. -/
structure U5SelectedCandidate (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (F : U5CandidateDescriptor D q p T) (u : ℝ²) where
  selected : F.Selects u

/-- Extract the q-deleted skeleton facts from the selected-candidate packet. -/
def U5SelectedCandidate.toSkeleton {D : CounterexampleData} {q p u : ℝ²}
    {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (hsel : U5SelectedCandidate D q p T F u) :
    U5SelectedCandidateSkeleton D q p T u :=
  F.selected_skeleton hsel.selected

/-- The row-specific q-allowed selected-candidate predicate. -/
structure U5QAllowedSelectedCandidate (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (F : U5QAllowedCandidateDescriptor D q p T) (u : ℝ²) where
  selected : F.Selects u

/-- Extract the q-deleted skeleton facts from the q-allowed selected-candidate
packet. -/
def U5QAllowedSelectedCandidate.toSkeleton {D : CounterexampleData} {q p u : ℝ²}
    {T : Finset ℝ²} {F : U5QAllowedCandidateDescriptor D q p T}
    (hsel : U5QAllowedSelectedCandidate D q p T F u) :
    U5SelectedCandidateSkeleton D q p T u :=
  F.selected_skeleton hsel.selected

/-- The q-allowed producer interface: same-circle or q-allowed audited
support. -/
def U5QAllowedAuditedSupportOrSameCircle (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T (F : U5QAllowedCandidateDescriptor D q p T) u,
      U5DangerousTriple D q p T →
      U5QAllowedSelectedCandidate D q p T F u →
      U5SameCircleExport D q p T u ∨
        Nonempty (U5QAllowedAuditSupport D q p T u)

/-- The payload-bearing q-allowed row descriptor supplies the row-specific
producer theorem directly. -/
theorem u5QAllowedAuditedSupportOrSameCircle (D : CounterexampleData) :
    U5QAllowedAuditedSupportOrSameCircle D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel
  exact F.producer_payload hM44 hU2 hModeA htriple hsel.selected

/-- The bounded bad pattern excluded by the fixed-pattern audit.  It packages
exactly the data present after the row/global producers have supplied bounded
q-deleted support, together with the negated same-radius conclusion for the
selected candidate. -/
structure U5BoundedBadPattern (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type where
  dangerous : U5DangerousTriple D q p T
  selected : U5SelectedCandidateSkeleton D q p T u
  bounded_support : U5BoundedEightPointSupport D q p T u
  not_same_radius : dist p u ≠ dist p q

/-- The exact audited bounded bad pattern.  This is the Lean-side target
corresponding to `scripts/u5_global_pattern_sweep.py --geometric-prefilter`. -/
structure U5AuditedBoundedBadPattern (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type where
  dangerous : U5DangerousTriple D q p T
  selected : U5SelectedCandidateSkeleton D q p T u
  audited_support : U5BoundedAuditSupport D q p T u
  not_same_radius : dist p u ≠ dist p q

/-- No bounded q-deleted eight-point bad pattern exists under the global U5
hypotheses.  This is the theorem-facing form of the finite audit target; the
audit can only close the U5 incompatibility after this proposition is proved or replaced
by a kernel-checked certificate theorem. -/
def U5NoBoundedBadPattern (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T u, IsEmpty (U5BoundedBadPattern D q p T u)

/-- No exact audited bounded bad pattern exists under the global U5 hypotheses.
This is the sharper target that matches the finite fixed-pattern sweep. -/
def U5NoAuditedBoundedBadPattern (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T u, IsEmpty (U5AuditedBoundedBadPattern D q p T u)

/-- The approved global repeated-circle target, stated only as the same-circle
production theorem needed by the local U5d-d2c packet route. -/
def U5ForcedRepeatedCircle (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T (F : U5CandidateDescriptor D q p T) u,
      U5DangerousTriple D q p T →
      U5SelectedCandidate D q p T F u →
      U5SameCircleExport D q p T u

/-- The bounded-audit reduction target.  The finite fixed-pattern sweep can
only feed the U5 incompatibility theorem after the row/global producers supply
`U5BoundedEightPointSupport`; this Prop records that missing support-confinement
step without treating the audit itself as a proof. -/
def U5BoundedEightPointSupportReduction (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T (F : U5CandidateDescriptor D q p T) u,
      U5DangerousTriple D q p T →
      U5SelectedCandidate D q p T F u →
      U5BoundedEightPointSupport D q p T u →
      U5SameCircleExport D q p T u

/-- Bounded-audit reduction with the exact audited support payload.  This is the
statement directly fed by `U5NoAuditedBoundedBadPattern`. -/
def U5AuditedBoundedSupportReduction (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T (F : U5CandidateDescriptor D q p T) u,
      U5DangerousTriple D q p T →
      U5SelectedCandidate D q p T F u →
      U5BoundedAuditSupport D q p T u →
      U5SameCircleExport D q p T u

/-- The remaining row/global producer target after the finite audited
incompatibility is closed: the actual U5 data must either give the same-circle
export directly, or provide the exact audited support payload consumed by the
finite audit. -/
def U5AuditedSupportOrSameCircle (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q p T (F : U5CandidateDescriptor D q p T) u,
      U5DangerousTriple D q p T →
      U5SelectedCandidate D q p T F u →
      U5SameCircleExport D q p T u ∨
        Nonempty (U5BoundedAuditSupport D q p T u)

/-- The payload-bearing row descriptor supplies the remaining row/global
producer theorem directly.  Future concrete row constructors must still build
`U5CandidateDescriptor.producer_payload`; this theorem only consumes that
explicit evidence. -/
theorem u5AuditedSupportOrSameCircle (D : CounterexampleData) :
    U5AuditedSupportOrSameCircle D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel
  exact F.producer_payload hM44 hU2 hModeA htriple hsel.selected

/-- A proved global same-circle theorem immediately satisfies the producer
interface through the direct same-circle branch. -/
theorem u5AuditedSupportOrSameCircle_of_forcedRepeatedCircle
    {D : CounterexampleData}
    (hglobal : U5ForcedRepeatedCircle D) :
    U5AuditedSupportOrSameCircle D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel
  exact Or.inl (hglobal hM44 hU2 hModeA q p T F u htriple hsel)

/-- Extract the bounded bad-pattern contradiction.  A theorem excluding
`U5BoundedBadPattern` under the global hypotheses immediately gives the
same-circle export required by the row incompatibility theorem. -/
theorem u5BoundedEightPointSupportReduction_of_noBadPattern
    {D : CounterexampleData}
    (hno : U5NoBoundedBadPattern D) :
    U5BoundedEightPointSupportReduction D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel hsupport
  refine ⟨hsel.toSkeleton.candidate_mem, ?_⟩
  by_contra hnot
  exact (hno hM44 hU2 hModeA q p T u).false
    { dangerous := htriple
      selected := hsel.toSkeleton
      bounded_support := hsupport
      not_same_radius := hnot }

/-- Extract the exact audited bounded bad-pattern contradiction. -/
theorem u5AuditedBoundedSupportReduction_of_noBadPattern
    {D : CounterexampleData}
    (hno : U5NoAuditedBoundedBadPattern D) :
    U5AuditedBoundedSupportReduction D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel hsupport
  refine ⟨hsel.toSkeleton.candidate_mem, ?_⟩
  by_contra hnot
  exact (hno hM44 hU2 hModeA q p T u).false
    { dangerous := htriple
      selected := hsel.toSkeleton
      audited_support := hsupport
      not_same_radius := hnot }

/-- A q-free same-circle witness promotes to the surviving `K4` class at `p`
inside the q-deleted skeleton.  This is the B6 adapter from the U5 closure plan. -/
theorem u5QFreeWitness_hasNEquidistantPointsAt
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hw : U5QFreeWitness D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p := by
  refine ⟨dist p q, htriple.q_radius_pos, ?_⟩
  let C : Finset ℝ² :=
    ((D.skeleton q).erase p).filter fun y => dist p y = dist p q
  have hT_subset_C : T ⊆ C := by
    intro t ht
    exact Finset.mem_filter.mpr
      ⟨htriple.T_subset ht, htriple.T_same_radius t ht⟩
  have hu_mem_C : u ∈ C := by
    exact Finset.mem_filter.mpr hw.same_circle
  have hinsert_subset : insert u T ⊆ C := by
    intro x hx
    rw [Finset.mem_insert] at hx
    rcases hx with rfl | hxT
    · exact hu_mem_C
    · exact hT_subset_C hxT
  have hcard_insert : (insert u T).card = 4 := by
    rw [Finset.card_insert_of_notMem hw.selected.candidate_notin_T,
      htriple.T_card]
  have hcard_le : (insert u T).card ≤ C.card :=
    Finset.card_le_card hinsert_subset
  change 4 ≤ C.card
  omega

/-- If the approved global repeated-circle theorem is available, every selected
candidate skeleton promotes to a surviving `K4` witness.  This is a pure
adapter theorem; all geometric content is isolated in `U5ForcedRepeatedCircle`. -/
theorem u5ForcedRepeatedCircle_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hglobal : U5ForcedRepeatedCircle D)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5QFreeWitness_hasNEquidistantPointsAt htriple
    { selected := hsel.toSkeleton
      same_circle := hglobal hM44 hU2 hModeA q p T F u htriple hsel }

/-- Conditional adapter for the bounded eight-point reduction target.  The
geometric content is isolated in `U5BoundedEightPointSupportReduction`; once it
produces the same-circle export, the existing q-free witness adapter supplies
the surviving `K4` class. -/
theorem u5BoundedEightPointSupportReduction_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hbounded : U5BoundedEightPointSupportReduction D)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u)
    (hsupport : U5BoundedEightPointSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5QFreeWitness_hasNEquidistantPointsAt htriple
    { selected := hsel.toSkeleton
      same_circle := hbounded hM44 hU2 hModeA q p T F u htriple hsel hsupport }

/-- Conditional adapter for the exact audited bounded support reduction. -/
theorem u5AuditedBoundedSupportReduction_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hbounded : U5AuditedBoundedSupportReduction D)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5QFreeWitness_hasNEquidistantPointsAt htriple
    { selected := hsel.toSkeleton
      same_circle := hbounded hM44 hU2 hModeA q p T F u htriple hsel hsupport }

/-- Direct adapter from a no-bounded-bad-pattern theorem to the surviving
q-deleted `K4` witness. -/
theorem u5NoBoundedBadPattern_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hno : U5NoBoundedBadPattern D)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u)
    (hsupport : U5BoundedEightPointSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5BoundedEightPointSupportReduction_hasNEquidistantPointsAt
    (u5BoundedEightPointSupportReduction_of_noBadPattern hno)
    hM44 hU2 hModeA htriple hsel hsupport

/-- Direct adapter from the exact audited no-bad-pattern theorem to the
surviving q-deleted `K4` witness. -/
theorem u5NoAuditedBoundedBadPattern_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hno : U5NoAuditedBoundedBadPattern D)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5AuditedBoundedSupportReduction_hasNEquidistantPointsAt
    (u5AuditedBoundedSupportReduction_of_noBadPattern hno)
    hM44 hU2 hModeA htriple hsel hsupport

end Problem97
