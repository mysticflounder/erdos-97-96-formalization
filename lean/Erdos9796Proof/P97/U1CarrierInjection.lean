/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.TwoCircleCrossing

/-!
# U1 carrier injection support

This file records the carrier-side part of the faithful n = 10 injection used by
the depth-5 computational lane: the global `K4` hypothesis lets us select, at
each center, a concrete four-point same-radius class.  It deliberately does not
encode the solver certificate, exactness of the whole radius class, convexity,
or any packet-specific `U1EndpointEquality` data.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Translate a center to the origin and scale all vectors by `r⁻¹`.

This is the scale-normalization half of the carrier gauge: for `0 < r`, it
preserves distance equalities and turns radius `r` around `p` into unit radius.
It does not choose the final rotation that sends a chosen unit vector to
`(1,0)`. -/
noncomputable def normalScale (p : ℝ²) (r : ℝ) (x : ℝ²) : ℝ² :=
  r⁻¹ • (x - p)

theorem normalScale_self (p : ℝ²) (r : ℝ) :
    normalScale p r p = 0 := by
  simp [normalScale]

theorem normalScale_sub {p : ℝ²} {r : ℝ} (a b : ℝ²) :
    normalScale p r a - normalScale p r b = r⁻¹ • (a - b) := by
  simp [normalScale, sub_eq_add_neg]
  abel

/-- Positive scale-normalization rescales every distance by `r⁻¹`. -/
theorem normalScale_dist_image {p : ℝ²} {r : ℝ}
    (hr : 0 < r) (a b : ℝ²) :
    dist (normalScale p r a) (normalScale p r b) = r⁻¹ * dist a b := by
  rw [dist_eq_norm, dist_eq_norm]
  rw [normalScale_sub]
  rw [norm_smul]
  have habs : ‖r⁻¹‖ = r⁻¹ := by
    exact Real.norm_of_nonneg (inv_nonneg.mpr hr.le)
  rw [habs]

/-- Positive scale-normalization preserves distance equalities. -/
theorem normalScale_dist_eq_iff {p : ℝ²} {r : ℝ}
    (hr : 0 < r) (a b c d : ℝ²) :
    dist a b = dist c d ↔
      dist (normalScale p r a) (normalScale p r b) =
        dist (normalScale p r c) (normalScale p r d) := by
  rw [normalScale_dist_image hr, normalScale_dist_image hr]
  constructor
  · intro h
    rw [h]
  · intro h
    exact mul_left_cancel₀ (inv_ne_zero (ne_of_gt hr)) h

/-- A point at radius `r` from the center lands on the unit circle after
positive scale-normalization. -/
theorem normalScale_gauge_witness_unit {p q : ℝ²} {r : ℝ}
    (hr : 0 < r) (hq : dist p q = r) :
    dist (normalScale p r p) (normalScale p r q) = 1 := by
  rw [normalScale_dist_image hr, hq]
  exact inv_mul_cancel₀ (ne_of_gt hr)

private theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- Squared coordinate distance in the normalized plane. -/
def coordSqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

/-- Coordinate squared distance is Euclidean distance squared. -/
theorem coordSqDist_eq_dist_sq (x y : ℝ²) :
    coordSqDist x y = dist x y ^ 2 :=
  (dist_sq_coord x y).symm

/-- Rotate the plane by the unit vector `u`'s orthonormal coordinate frame:
the first coordinate is projection onto `u`, and the second coordinate is
projection onto the perpendicular vector. -/
noncomputable def axisRotatePerp (u x : ℝ²) : ℝ² :=
  !₂[inner ℝ u x, inner ℝ (!₂[-u 1, u 0] : ℝ²) x]

theorem axisRotatePerp_zero (u : ℝ²) : axisRotatePerp u 0 = 0 := by
  ext i
  fin_cases i <;> simp [axisRotatePerp]

theorem coord_norm_sq_of_norm_eq_one {u : ℝ²} (hunit : ‖u‖ = 1) :
    (u 0) ^ 2 + (u 1) ^ 2 = 1 := by
  have hnorm : ‖u‖ ^ 2 = (1 : ℝ) := by
    rw [hunit]
    norm_num
  rw [EuclideanSpace.norm_sq_eq] at hnorm
  simpa [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs] using hnorm

/-- A unit vector is sent to the positive x-axis by its coordinate rotation. -/
theorem axisRotatePerp_self {u : ℝ²} (hunit : ‖u‖ = 1) :
    axisRotatePerp u u = !₂[(1 : ℝ), 0] := by
  ext i
  fin_cases i
  · have hsq := coord_norm_sq_of_norm_eq_one hunit
    simp [axisRotatePerp, inner, Fin.sum_univ_two, hsq]
  · simp [axisRotatePerp, inner, Fin.sum_univ_two]
    ring

theorem axisRotatePerp_dist_sq {u : ℝ²} (hunit : ‖u‖ = 1)
    (a b : ℝ²) :
    dist (axisRotatePerp u a) (axisRotatePerp u b) ^ 2 = dist a b ^ 2 := by
  rw [dist_sq_coord, dist_sq_coord]
  have hsq := coord_norm_sq_of_norm_eq_one hunit
  simp [axisRotatePerp, inner, Fin.sum_univ_two]
  linear_combination ((a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2) * hsq

/-- The coordinate rotation determined by a unit vector is distance-preserving. -/
theorem axisRotatePerp_dist_image {u : ℝ²} (hunit : ‖u‖ = 1)
    (a b : ℝ²) :
    dist (axisRotatePerp u a) (axisRotatePerp u b) = dist a b := by
  have hsq := axisRotatePerp_dist_sq hunit a b
  have hnonneg1 : 0 ≤ dist (axisRotatePerp u a) (axisRotatePerp u b) := dist_nonneg
  have hnonneg2 : 0 ≤ dist a b := dist_nonneg
  nlinarith

/-- The coordinate rotation determined by a unit vector preserves distance
equalities. -/
theorem axisRotatePerp_dist_eq_iff {u : ℝ²} (hunit : ‖u‖ = 1)
    (a b c d : ℝ²) :
    dist a b = dist c d ↔
      dist (axisRotatePerp u a) (axisRotatePerp u b) =
        dist (axisRotatePerp u c) (axisRotatePerp u d) := by
  rw [axisRotatePerp_dist_image hunit, axisRotatePerp_dist_image hunit]

/-- Full two-point gauge: translate `p` to the origin, scale by `dist p q`,
then rotate the scaled `q` direction to the positive x-axis. -/
noncomputable def normalAxis (p q x : ℝ²) : ℝ² :=
  axisRotatePerp (normalScale p (dist p q) q) (normalScale p (dist p q) x)

theorem normalScale_witness_norm {p q : ℝ²} (hpq : p ≠ q) :
    ‖normalScale p (dist p q) q‖ = 1 := by
  have hpos : 0 < dist p q := dist_pos.mpr hpq
  have hdist : dist (normalScale p (dist p q) p)
      (normalScale p (dist p q) q) = 1 :=
    normalScale_gauge_witness_unit hpos rfl
  rw [normalScale_self] at hdist
  simpa [dist_eq_norm] using hdist

theorem normalAxis_self {p q : ℝ²} :
    normalAxis p q p = 0 := by
  simp [normalAxis, normalScale_self, axisRotatePerp_zero]

theorem normalAxis_witness {p q : ℝ²} (hpq : p ≠ q) :
    normalAxis p q q = !₂[(1 : ℝ), 0] := by
  exact axisRotatePerp_self (normalScale_witness_norm hpq)

/-- The full two-point gauge rescales distances by `(dist p q)⁻¹`. -/
theorem normalAxis_dist_image {p q : ℝ²} (hpq : p ≠ q) (a b : ℝ²) :
    dist (normalAxis p q a) (normalAxis p q b) =
      (dist p q)⁻¹ * dist a b := by
  unfold normalAxis
  rw [axisRotatePerp_dist_image (normalScale_witness_norm hpq)]
  exact normalScale_dist_image (dist_pos.mpr hpq) a b

/-- The full two-point gauge preserves distance equalities. -/
theorem normalAxis_dist_eq_iff {p q : ℝ²} (hpq : p ≠ q)
    (a b c d : ℝ²) :
    dist a b = dist c d ↔
      dist (normalAxis p q a) (normalAxis p q b) =
        dist (normalAxis p q c) (normalAxis p q d) := by
  rw [normalAxis_dist_image hpq, normalAxis_dist_image hpq]
  constructor
  · intro h
    rw [h]
  · intro h
    exact mul_left_cancel₀ (inv_ne_zero (dist_ne_zero.mpr hpq)) h

/-- Distance squared between two normal-axis images in coordinates.

Generated U1 source-fact proofs use this to translate normalized geometric
distance facts into the polynomial coordinate equations recorded by the
`SparsePoly` payloads. -/
theorem normalAxis_sqdist_coord (p q a b : ℝ²) :
    let A := normalAxis p q a
    let B := normalAxis p q b
    dist A B ^ 2 = (A 0 - B 0) ^ 2 + (A 1 - B 1) ^ 2 := by
  exact dist_sq_coord (normalAxis p q a) (normalAxis p q b)

/-- Coordinate squared distance between two normal-axis images. -/
theorem normalAxis_coord_sqdist_eq (p q a b : ℝ²) :
    coordSqDist (normalAxis p q a) (normalAxis p q b) =
      dist (normalAxis p q a) (normalAxis p q b) ^ 2 :=
  coordSqDist_eq_dist_sq _ _

/-- Coordinate squared norm of a normal-axis image, expressed as distance from
the normalized gauge center. -/
theorem normalAxis_sqnorm_coord (p q a : ℝ²) :
    (normalAxis p q a 0) ^ 2 + (normalAxis p q a 1) ^ 2 =
      dist (normalAxis p q p) (normalAxis p q a) ^ 2 := by
  rw [normalAxis_self]
  have h := coordSqDist_eq_dist_sq (0 : ℝ²) (normalAxis p q a)
  dsimp [coordSqDist] at h
  simpa using h

/-- Coordinate squared distance from `(1, 0)` to a normal-axis image,
expressed as distance from the normalized gauge witness. -/
theorem normalAxis_unitX_sqdist_coord {p q : ℝ²} (hpq : p ≠ q) (a : ℝ²) :
    (normalAxis p q a 0 - 1) ^ 2 + (normalAxis p q a 1) ^ 2 =
      dist (normalAxis p q q) (normalAxis p q a) ^ 2 := by
  rw [normalAxis_witness hpq]
  have h := coordSqDist_eq_dist_sq (!₂[(1 : ℝ), 0] : ℝ²) (normalAxis p q a)
  dsimp [coordSqDist] at h
  rw [← h]
  ring

/-- Normal-axis coordinate squared distance between distinct original points is
nonzero. -/
theorem normalAxis_coord_sqdist_ne_zero
    {p q a b : ℝ²} (hpq : p ≠ q) (hab : a ≠ b) :
    (normalAxis p q a 0 - normalAxis p q b 0) ^ 2 +
        (normalAxis p q a 1 - normalAxis p q b 1) ^ 2 ≠ 0 := by
  have hdist : dist (normalAxis p q a) (normalAxis p q b) ≠ 0 := by
    rw [normalAxis_dist_image hpq]
    exact mul_ne_zero (inv_ne_zero (dist_ne_zero.mpr hpq))
      (dist_ne_zero.mpr hab)
  have hcoord : coordSqDist (normalAxis p q a) (normalAxis p q b) ≠ 0 := by
    rw [coordSqDist_eq_dist_sq]
    exact pow_ne_zero 2 hdist
  simpa [coordSqDist] using hcoord

/-- Normal-axis squared norm of a point distinct from the gauge center is
nonzero. -/
theorem normalAxis_sqnorm_ne_zero
    {p q a : ℝ²} (hpq : p ≠ q) (hpa : p ≠ a) :
    (normalAxis p q a 0) ^ 2 + (normalAxis p q a 1) ^ 2 ≠ 0 := by
  have h := normalAxis_coord_sqdist_ne_zero hpq hpa
  simpa [normalAxis_self] using h

/-- Normal-axis coordinate squared distance from `(1, 0)` to a point distinct
from the gauge witness is nonzero. -/
theorem normalAxis_unitX_sqdist_ne_zero
    {p q a : ℝ²} (hpq : p ≠ q) (hqa : q ≠ a) :
    (normalAxis p q a 0 - 1) ^ 2 + (normalAxis p q a 1) ^ 2 ≠ 0 := by
  have h := normalAxis_coord_sqdist_ne_zero hpq hqa
  rw [normalAxis_witness hpq] at h
  simp only [Fin.isValue, Matrix.cons_val_zero, Matrix.cons_val_one, ne_eq] at h
  have hsame : (1 - normalAxis p q a 0) ^ 2 +
      (0 - normalAxis p q a 1) ^ 2 =
      (normalAxis p q a 0 - 1) ^ 2 + (normalAxis p q a 1) ^ 2 := by
    ring
  rwa [hsame] at h

/-- A geometric equal-distance fact becomes equality of normalized coordinate
squared distances. -/
theorem normalAxis_coord_sqdist_eq_of_dist_eq
    {gaugeP gaugeQ center member witness : ℝ²}
    (hpq : gaugeP ≠ gaugeQ)
    (h : dist center member = dist center witness) :
    coordSqDist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ member) =
      coordSqDist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ witness) := by
  rw [coordSqDist_eq_dist_sq, coordSqDist_eq_dist_sq]
  have hdist :=
    (normalAxis_dist_eq_iff hpq center member center witness).mp h
  rw [hdist]

/-- Unequal original distances remain unequal as normalized coordinate squared
distances in a nondegenerate normal-axis gauge. -/
theorem normalAxis_coordSqDist_ne_of_dist_ne
    {gaugeP gaugeQ center member witness : ℝ²}
    (hpq : gaugeP ≠ gaugeQ)
    (h : dist center member ≠ dist center witness) :
    coordSqDist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ member) ≠
      coordSqDist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ witness) := by
  intro hcoord
  apply h
  have hsq :
      dist (normalAxis gaugeP gaugeQ center)
          (normalAxis gaugeP gaugeQ member) ^ 2 =
        dist (normalAxis gaugeP gaugeQ center)
          (normalAxis gaugeP gaugeQ witness) ^ 2 := by
    simpa [coordSqDist_eq_dist_sq] using hcoord
  have hleft_nonneg :
      0 ≤ dist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ member) := dist_nonneg
  have hright_nonneg :
      0 ≤ dist (normalAxis gaugeP gaugeQ center)
        (normalAxis gaugeP gaugeQ witness) := dist_nonneg
  have hdist :
      dist (normalAxis gaugeP gaugeQ center)
          (normalAxis gaugeP gaugeQ member) =
        dist (normalAxis gaugeP gaugeQ center)
          (normalAxis gaugeP gaugeQ witness) := by
    nlinarith
  exact (normalAxis_dist_eq_iff hpq center member center witness).mpr hdist

/-- If a packet-label row contains the gauge center `p`, then equality of
distances to a witness becomes the squared-norm coordinate equation used by
the generated source facts. -/
theorem normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
    {p q center witness : ℝ²}
    (hpq : p ≠ q)
    (h : dist center p = dist center witness) :
    (normalAxis p q center 0) ^ 2 + (normalAxis p q center 1) ^ 2 =
      coordSqDist (normalAxis p q center) (normalAxis p q witness) := by
  have hcoord := normalAxis_coord_sqdist_eq_of_dist_eq hpq h
  rw [normalAxis_self] at hcoord
  simpa [coordSqDist] using hcoord

/-- If a packet-label row contains the gauge witness `q`, then equality of
distances to a witness becomes the unit-x coordinate equation used by the
generated source facts. -/
theorem normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
    {p q center witness : ℝ²}
    (hpq : p ≠ q)
    (h : dist center q = dist center witness) :
    (normalAxis p q center 0 - 1) ^ 2 + (normalAxis p q center 1) ^ 2 =
      coordSqDist (normalAxis p q center) (normalAxis p q witness) := by
  have hcoord := normalAxis_coord_sqdist_eq_of_dist_eq hpq h
  rw [normalAxis_witness hpq] at hcoord
  dsimp [coordSqDist] at hcoord
  simpa using hcoord

/-- A packet-label row centered at the gauge witness has unit squared
coordinate radius when the gauge center lies on the same row as the chosen
witness. -/
theorem normalAxis_coordSqDist_witness_eq_one_of_dist_eq
    {p q witness : ℝ²}
    (hpq : p ≠ q)
    (h : dist q p = dist q witness) :
    coordSqDist (normalAxis p q q) (normalAxis p q witness) = 1 := by
  have hcoord := normalAxis_coord_sqdist_eq_of_dist_eq hpq h
  rw [normalAxis_witness hpq, normalAxis_self] at hcoord
  rw [normalAxis_witness hpq]
  dsimp [coordSqDist] at hcoord ⊢
  simpa using hcoord.symm

/-- Equal distances from the gauge center become equal normalized squared
coordinate norms. -/
theorem normalAxis_sqnorm_coord_eq_of_dist_eq
    {p q member witness : ℝ²}
    (hpq : p ≠ q)
    (h : dist p member = dist p witness) :
    (normalAxis p q member 0) ^ 2 + (normalAxis p q member 1) ^ 2 =
      (normalAxis p q witness 0) ^ 2 + (normalAxis p q witness 1) ^ 2 := by
  have hcoord := normalAxis_coord_sqdist_eq_of_dist_eq hpq h
  rw [normalAxis_self] at hcoord
  simpa [coordSqDist] using hcoord

/-- Equal distances from the gauge witness become equal normalized squared
coordinate distances from `(1, 0)`. -/
theorem normalAxis_unitX_sqdist_coord_eq_of_dist_eq
    {p q member witness : ℝ²}
    (hpq : p ≠ q)
    (h : dist q member = dist q witness) :
    (normalAxis p q member 0 - 1) ^ 2 + (normalAxis p q member 1) ^ 2 =
      (normalAxis p q witness 0 - 1) ^ 2 + (normalAxis p q witness 1) ^ 2 := by
  have hcoord := normalAxis_coord_sqdist_eq_of_dist_eq hpq h
  rw [normalAxis_witness hpq] at hcoord
  dsimp [coordSqDist] at hcoord
  calc
    (normalAxis p q member 0 - 1) ^ 2 + (normalAxis p q member 1) ^ 2 =
        (1 - normalAxis p q member 0) ^ 2 +
          (0 - normalAxis p q member 1) ^ 2 := by
          ring
    _ = (1 - normalAxis p q witness 0) ^ 2 +
          (0 - normalAxis p q witness 1) ^ 2 :=
        hcoord
    _ = (normalAxis p q witness 0 - 1) ^ 2 +
          (normalAxis p q witness 1) ^ 2 := by
      ring

/-- A point at the original gauge radius has normalized coordinate squared norm
one. -/
theorem normalAxis_sqnorm_coord_eq_one_of_dist_eq
    {p q a : ℝ²} (hpq : p ≠ q) (h : dist p a = dist p q) :
    (normalAxis p q a 0) ^ 2 + (normalAxis p q a 1) ^ 2 = 1 := by
  rw [normalAxis_sqnorm_coord]
  rw [normalAxis_self]
  have hdist := (normalAxis_dist_eq_iff hpq p a p q).mp h
  rw [normalAxis_self, normalAxis_witness hpq] at hdist
  have hunit : dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) = 1 := by
    have hsq : dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) ^ 2 = 1 := by
      rw [dist_sq_coord]
      norm_num
    have hnonneg : 0 ≤ dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) := dist_nonneg
    nlinarith
  rw [hdist, hunit]
  norm_num

/-- A selected four-point same-radius class at a center.  This is the Lean
counterpart of one `{center : [m0,m1,m2,m3]}` row in the faithful encoder's
equality-only pattern language. -/
structure SelectedFourClass (A : Finset ℝ²) (center : ℝ²) where
  /-- The selected four witnesses. -/
  support : Finset ℝ²
  /-- The witnesses are vertices of the ambient carrier. -/
  support_subset_A : support ⊆ A
  /-- Exactly four witnesses are selected. -/
  support_card : support.card = 4
  /-- The selected class radius. -/
  radius : ℝ
  /-- The radius is nonzero. -/
  radius_pos : 0 < radius
  /-- Every selected witness lies on the same circle about the center. -/
  support_eq_radius : ∀ x ∈ support, dist center x = radius
  /-- The center is not one of its selected witnesses. -/
  center_not_mem : center ∉ support

namespace SelectedFourClass

theorem support_nonempty {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) : K.support.Nonempty := by
  rw [← Finset.card_pos]
  rw [K.support_card]
  norm_num

/-- Any selected four-class supplies a witness suitable for the similarity
gauge: a selected point in the carrier, distinct from the center, at the selected
radius. -/
theorem exists_gauge_witness {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) :
    ∃ q ∈ K.support, q ∈ A ∧ center ≠ q ∧ dist center q = K.radius := by
  rcases K.support_nonempty with ⟨q, hq⟩
  refine ⟨q, hq, K.support_subset_A hq, ?_, K.support_eq_radius q hq⟩
  intro hcenter
  exact K.center_not_mem (by simpa [hcenter] using hq)

/-- After translating the center and scaling by the selected radius, every
selected support point lies on the unit circle. -/
theorem normalScale_support_unit {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) :
    ∀ x ∈ K.support,
      dist (normalScale center K.radius center)
        (normalScale center K.radius x) = 1 := by
  intro x hx
  exact normalScale_gauge_witness_unit K.radius_pos (K.support_eq_radius x hx)

/-- Selected same-radius classes at distinct centers overlap in at most two
points.

This is the carrier-level two-circle bound used by the depth-5 encoder lane:
the proof only uses that each support lies on a Euclidean circle around its
center, and that distinct centers give distinct spheres. -/
theorem inter_card_le_two {A : Finset ℝ²} {x y : ℝ²}
    (Kx : SelectedFourClass A x) (Ky : SelectedFourClass A y)
    (hxy : x ≠ y) :
    (Kx.support ∩ Ky.support).card ≤ 2 := by
  classical
  by_contra hle
  have h3 : 3 ≤ (Kx.support ∩ Ky.support).card := by omega
  rcases Finset.exists_subset_card_eq (s := Kx.support ∩ Ky.support) h3 with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haKx : a ∈ Kx.support := (Finset.mem_inter.mp (hEsubset haE)).1
  have hbKx : b ∈ Kx.support := (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcKx : c ∈ Kx.support := (Finset.mem_inter.mp (hEsubset hcE)).1
  have haKy : a ∈ Ky.support := (Finset.mem_inter.mp (hEsubset haE)).2
  have hbKy : b ∈ Ky.support := (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcKy : c ∈ Ky.support := (Finset.mem_inter.mp (hEsubset hcE)).2
  let sx : Sphere ℝ² := ⟨x, Kx.radius⟩
  let sy : Sphere ℝ² := ⟨y, Ky.radius⟩
  have hsne : sx ≠ sy := by
    intro h
    exact hxy (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hasx : a ∈ sx := by
    rw [mem_sphere]
    calc
      dist a x = dist x a := dist_comm a x
      _ = Kx.radius := Kx.support_eq_radius a haKx
  have hbsx : b ∈ sx := by
    rw [mem_sphere]
    calc
      dist b x = dist x b := dist_comm b x
      _ = Kx.radius := Kx.support_eq_radius b hbKx
  have hcsx : c ∈ sx := by
    rw [mem_sphere]
    calc
      dist c x = dist x c := dist_comm c x
      _ = Kx.radius := Kx.support_eq_radius c hcKx
  have hasy : a ∈ sy := by
    rw [mem_sphere]
    calc
      dist a y = dist y a := dist_comm a y
      _ = Ky.radius := Ky.support_eq_radius a haKy
  have hbsy : b ∈ sy := by
    rw [mem_sphere]
    calc
      dist b y = dist y b := dist_comm b y
      _ = Ky.radius := Ky.support_eq_radius b hbKy
  have hcsy : c ∈ sy := by
    rw [mem_sphere]
    calc
      dist c y = dist y c := dist_comm c y
      _ = Ky.radius := Ky.support_eq_radius c hcKy
  rcases two_circle_common_point_eq_endpoint hsne hab
      hasx hbsx hasy hbsy hcsx hcsy with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

end SelectedFourClass

/-- A critical four-shell at `center`, sourced by deleting `q`.

Unlike `SelectedFourClass`, this records the whole radius class in `A`, not an
arbitrary selected four-subset.  The exactness field is the equality
`support = A.filter ...`; together with `support_card`, this is the Lean
surface needed for exact row membership in the finite bridge. -/
structure CriticalFourShell (A : Finset ℝ²) (q center : ℝ²) where
  /-- The blocker center survives deleting `q`. -/
  center_mem : center ∈ A.erase q
  /-- The critical shell radius. -/
  radius : ℝ
  /-- The critical shell radius is positive. -/
  radius_pos : 0 < radius
  /-- The full radius class in `A`. -/
  support : Finset ℝ²
  /-- The support is the whole radius class, not a selected subset. -/
  support_eq : support = A.filter fun z => dist center z = radius
  /-- The full radius class has exactly four points. -/
  support_card : support.card = 4
  /-- The deleted point lies on the critical shell. -/
  q_mem_support : q ∈ support

namespace CriticalFourShell

/-- The critical shell support lies in the ambient carrier. -/
theorem support_subset_A {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    K.support ⊆ A := by
  intro z hz
  have hzFilter : z ∈ A.filter fun z => dist center z = K.radius := by
    simpa [K.support_eq] using hz
  exact (Finset.mem_filter.mp hzFilter).1

/-- Every point in the exact critical shell lies at the shell radius. -/
theorem support_eq_radius {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    ∀ z ∈ K.support, dist center z = K.radius := by
  intro z hz
  have hzFilter : z ∈ A.filter fun z => dist center z = K.radius := by
    simpa [K.support_eq] using hz
  exact (Finset.mem_filter.mp hzFilter).2

/-- The deleted point is an ambient carrier point. -/
theorem q_mem_A {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    q ∈ A :=
  K.support_subset_A K.q_mem_support

/-- The center is not a point of its positive-radius critical shell. -/
theorem center_not_mem_support {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    center ∉ K.support := by
  intro hcenter
  have hcenterFilter :
      center ∈ A.filter fun z => dist center z = K.radius := by
    simpa [K.support_eq] using hcenter
  have hdist : dist center center = K.radius :=
    (Finset.mem_filter.mp hcenterFilter).2
  rw [dist_self] at hdist
  linarith [K.radius_pos]

/-- Exact row membership for a critical shell: any ambient point on the row
circle is one of the recorded support points. -/
theorem off_row_named_label_forbidden {A : Finset ℝ²} {q center z : ℝ²}
    (K : CriticalFourShell A q center)
    (hzA : z ∈ A) (hzdist : dist center z = K.radius) :
    z ∈ K.support := by
  rw [K.support_eq]
  exact Finset.mem_filter.mpr ⟨hzA, hzdist⟩

/-- A critical full shell can be consumed by the existing selected-row API. -/
def toSelectedFourClass {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    SelectedFourClass A center :=
  { support := K.support
    support_subset_A := K.support_subset_A
    support_card := K.support_card
    radius := K.radius
    radius_pos := K.radius_pos
    support_eq_radius := by
      intro x hx
      have hxFilter :
          x ∈ A.filter fun z => dist center z = K.radius := by
        simpa [K.support_eq] using hx
      exact (Finset.mem_filter.mp hxFilter).2
    center_not_mem := K.center_not_mem_support }

end CriticalFourShell

/-- A critical full shell with explicit names for its four support points.

This is the finite-bridge surface: the shell is still exact via
`toCriticalFourShell.support_eq`, and `support_eq_labels` records the four
labels used by a manifest row. -/
structure CriticalSelectedFourClass (A : Finset ℝ²) (q center : ℝ²) extends
    CriticalFourShell A q center where
  /-- First named support point. -/
  l1 : ℝ²
  /-- Second named support point. -/
  l2 : ℝ²
  /-- Third named support point. -/
  l3 : ℝ²
  /-- Fourth named support point. -/
  l4 : ℝ²
  l1_ne_l2 : l1 ≠ l2
  l1_ne_l3 : l1 ≠ l3
  l1_ne_l4 : l1 ≠ l4
  l2_ne_l3 : l2 ≠ l3
  l2_ne_l4 : l2 ≠ l4
  l3_ne_l4 : l3 ≠ l4
  /-- The exact shell support is precisely the four named labels. -/
  support_eq_labels : toCriticalFourShell.support = ({l1, l2, l3, l4} : Finset ℝ²)

namespace CriticalSelectedFourClass

/-- Every critical full shell admits four explicit support labels. -/
theorem exists_of_shell {A : Finset ℝ²} {q center : ℝ²}
    (K : CriticalFourShell A q center) :
    ∃ S : CriticalSelectedFourClass A q center, S.toCriticalFourShell = K := by
  have hcard : K.support.card = 4 := K.support_card
  rw [Finset.card_eq_four] at hcard
  rcases hcard with
    ⟨l1, l2, l3, l4, h12, h13, h14, h23, h24, h34, hlabels⟩
  exact
    ⟨{ toCriticalFourShell := K,
        l1 := l1,
        l2 := l2,
        l3 := l3,
        l4 := l4,
        l1_ne_l2 := h12,
        l1_ne_l3 := h13,
        l1_ne_l4 := h14,
        l2_ne_l3 := h23,
        l2_ne_l4 := h24,
        l3_ne_l4 := h34,
        support_eq_labels := hlabels },
      rfl⟩

/-- Membership in a selected critical shell is membership in one of its four
named labels. -/
theorem mem_support_iff_named {A : Finset ℝ²} {q center z : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    z ∈ S.toCriticalFourShell.support ↔
      z = S.l1 ∨ z = S.l2 ∨ z = S.l3 ∨ z = S.l4 := by
  rw [S.support_eq_labels]
  simp only [Finset.mem_insert, Finset.mem_singleton]

/-- The first named label lies in the exact critical-shell support. -/
theorem l1_mem_support {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l1 ∈ S.toCriticalFourShell.support := by
  rw [S.support_eq_labels]
  simp

/-- The second named label lies in the exact critical-shell support. -/
theorem l2_mem_support {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l2 ∈ S.toCriticalFourShell.support := by
  rw [S.support_eq_labels]
  simp

/-- The third named label lies in the exact critical-shell support. -/
theorem l3_mem_support {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l3 ∈ S.toCriticalFourShell.support := by
  rw [S.support_eq_labels]
  simp

/-- The fourth named label lies in the exact critical-shell support. -/
theorem l4_mem_support {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l4 ∈ S.toCriticalFourShell.support := by
  rw [S.support_eq_labels]
  simp

/-- The first named critical-shell label is an ambient carrier point. -/
theorem l1_mem_A {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l1 ∈ A :=
  S.toCriticalFourShell.support_subset_A S.l1_mem_support

/-- The second named critical-shell label is an ambient carrier point. -/
theorem l2_mem_A {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l2 ∈ A :=
  S.toCriticalFourShell.support_subset_A S.l2_mem_support

/-- The third named critical-shell label is an ambient carrier point. -/
theorem l3_mem_A {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l3 ∈ A :=
  S.toCriticalFourShell.support_subset_A S.l3_mem_support

/-- The fourth named critical-shell label is an ambient carrier point. -/
theorem l4_mem_A {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    S.l4 ∈ A :=
  S.toCriticalFourShell.support_subset_A S.l4_mem_support

/-- The first named label lies at the critical shell radius. -/
theorem l1_dist {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    dist center S.l1 = S.toCriticalFourShell.radius :=
  S.toCriticalFourShell.support_eq_radius S.l1 S.l1_mem_support

/-- The second named label lies at the critical shell radius. -/
theorem l2_dist {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    dist center S.l2 = S.toCriticalFourShell.radius :=
  S.toCriticalFourShell.support_eq_radius S.l2 S.l2_mem_support

/-- The third named label lies at the critical shell radius. -/
theorem l3_dist {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    dist center S.l3 = S.toCriticalFourShell.radius :=
  S.toCriticalFourShell.support_eq_radius S.l3 S.l3_mem_support

/-- The fourth named label lies at the critical shell radius. -/
theorem l4_dist {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    dist center S.l4 = S.toCriticalFourShell.radius :=
  S.toCriticalFourShell.support_eq_radius S.l4 S.l4_mem_support

/-- Exact row membership for a selected critical shell, in named-label form. -/
theorem off_row_named_label_forbidden {A : Finset ℝ²} {q center z : ℝ²}
    (S : CriticalSelectedFourClass A q center)
    (hzA : z ∈ A)
    (hzdist : dist center z = S.toCriticalFourShell.radius) :
    z = S.l1 ∨ z = S.l2 ∨ z = S.l3 ∨ z = S.l4 := by
  exact (S.mem_support_iff_named).mp
    (S.toCriticalFourShell.off_row_named_label_forbidden hzA hzdist)

/-- The deleted source point is one of the four named critical-shell labels. -/
theorem source_eq_named {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    q = S.l1 ∨ q = S.l2 ∨ q = S.l3 ∨ q = S.l4 :=
  (S.mem_support_iff_named).mp S.toCriticalFourShell.q_mem_support

/-- Relabel a critical selected shell so that a prescribed support point is the
first named label.

This changes only the slot names; the underlying exact critical shell is
preserved. -/
theorem exists_relabel_l1 {A : Finset ℝ²} {q center x : ℝ²}
    (S : CriticalSelectedFourClass A q center)
    (hx : x ∈ S.toCriticalFourShell.support) :
    ∃ S' : CriticalSelectedFourClass A q center,
      S'.toCriticalFourShell = S.toCriticalFourShell ∧ S'.l1 = x := by
  rcases (S.mem_support_iff_named).mp hx with rfl | rfl | rfl | rfl
  · exact ⟨S, rfl, rfl⟩
  · refine
      ⟨{ toCriticalFourShell := S.toCriticalFourShell,
          l1 := S.l2,
          l2 := S.l1,
          l3 := S.l3,
          l4 := S.l4,
          l1_ne_l2 := S.l1_ne_l2.symm,
          l1_ne_l3 := S.l2_ne_l3,
          l1_ne_l4 := S.l2_ne_l4,
          l2_ne_l3 := S.l1_ne_l3,
          l2_ne_l4 := S.l1_ne_l4,
          l3_ne_l4 := S.l3_ne_l4,
          support_eq_labels := ?_ }, rfl, rfl⟩
    ext y
    simp [S.support_eq_labels, or_left_comm]
  · refine
      ⟨{ toCriticalFourShell := S.toCriticalFourShell,
          l1 := S.l3,
          l2 := S.l1,
          l3 := S.l2,
          l4 := S.l4,
          l1_ne_l2 := S.l1_ne_l3.symm,
          l1_ne_l3 := S.l2_ne_l3.symm,
          l1_ne_l4 := S.l3_ne_l4,
          l2_ne_l3 := S.l1_ne_l2,
          l2_ne_l4 := S.l1_ne_l4,
          l3_ne_l4 := S.l2_ne_l4,
          support_eq_labels := ?_ }, rfl, rfl⟩
    ext y
    simp [S.support_eq_labels, or_left_comm]
  · refine
      ⟨{ toCriticalFourShell := S.toCriticalFourShell,
          l1 := S.l4,
          l2 := S.l1,
          l3 := S.l2,
          l4 := S.l3,
          l1_ne_l2 := S.l1_ne_l4.symm,
          l1_ne_l3 := S.l2_ne_l4.symm,
          l1_ne_l4 := S.l3_ne_l4.symm,
          l2_ne_l3 := S.l1_ne_l2,
          l2_ne_l4 := S.l1_ne_l3,
          l3_ne_l4 := S.l2_ne_l3,
          support_eq_labels := ?_ }, rfl, rfl⟩
    ext y
    simp [S.support_eq_labels, or_left_comm, or_comm]

/-- A named critical shell can be consumed by the existing selected-row API. -/
def toSelectedFourClass {A : Finset ℝ²} {q center : ℝ²}
    (S : CriticalSelectedFourClass A q center) :
    SelectedFourClass A center :=
  S.toCriticalFourShell.toSelectedFourClass

end CriticalSelectedFourClass

/-- A non-removable deleted vertex supplies a critical full four-shell.

The blocker center is existential: it is a center where the K4 property fails
after deleting `q`.  Global K4 at that center gives a full radius class in `A`;
failure after deleting `q` forces that class to contain `q`, and to have
cardinality exactly four. -/
theorem exists_criticalFourShell
    {A : Finset ℝ²} {q : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hq : q ∈ A)
    (hnrem : ¬ IsRemovableVertex A q) :
    ∃ center : ℝ², Nonempty (CriticalFourShell A q center) := by
  classical
  have hnotProp : ¬ HasNEquidistantProperty 4 (A.erase q) := by
    intro hprop
    exact hnrem ⟨hq, hprop⟩
  by_contra hnone
  have hprop : HasNEquidistantProperty 4 (A.erase q) := by
    intro center hcenter
    by_cases hdeleted : HasNEquidistantPointsAt 4 (A.erase q) center
    · exact hdeleted
    · have hcenterA : center ∈ A := (Finset.mem_erase.mp hcenter).2
      rcases hK4 center hcenterA with ⟨r, hrpos, hcard⟩
      let C : Finset ℝ² := A.filter fun z => dist center z = r
      have hqC : q ∈ C := by
        by_contra hqCnot
        have hsub :
            C ⊆ (A.erase q).filter fun z => dist center z = r := by
          intro z hz
          have hzA : z ∈ A := (Finset.mem_filter.mp hz).1
          have hzdist : dist center z = r := (Finset.mem_filter.mp hz).2
          refine Finset.mem_filter.mpr ⟨?_, hzdist⟩
          refine Finset.mem_erase.mpr ⟨?_, hzA⟩
          intro hzq
          subst z
          exact hqCnot hz
        have hdeletedCard :
            4 ≤ ((A.erase q).filter fun z => dist center z = r).card :=
          le_trans hcard (Finset.card_le_card hsub)
        exact hdeleted ⟨r, hrpos, hdeletedCard⟩
      have hcard_le : C.card ≤ 4 := by
        by_contra hnotle
        have hge5 : 5 ≤ C.card := by omega
        have hsubErase :
            C.erase q ⊆ (A.erase q).filter fun z => dist center z = r := by
          intro z hz
          have hz_ne_q : z ≠ q := (Finset.mem_erase.mp hz).1
          have hzC : z ∈ C := (Finset.mem_erase.mp hz).2
          have hzA : z ∈ A := (Finset.mem_filter.mp hzC).1
          have hzdist : dist center z = r := (Finset.mem_filter.mp hzC).2
          refine Finset.mem_filter.mpr ⟨?_, hzdist⟩
          exact Finset.mem_erase.mpr ⟨hz_ne_q, hzA⟩
        have hCeraseCard : 4 ≤ (C.erase q).card := by
          rw [Finset.card_erase_of_mem hqC]
          omega
        have hdeletedCard :
            4 ≤ ((A.erase q).filter fun z => dist center z = r).card :=
          le_trans hCeraseCard (Finset.card_le_card hsubErase)
        exact hdeleted ⟨r, hrpos, hdeletedCard⟩
      have hcard_eq : C.card = 4 := le_antisymm hcard_le hcard
      let K : CriticalFourShell A q center :=
        { center_mem := hcenter,
          radius := r,
          radius_pos := hrpos,
          support := C,
          support_eq := rfl,
          support_card := hcard_eq,
          q_mem_support := hqC }
      exact False.elim (hnone ⟨center, ⟨K⟩⟩)
  exact hnotProp hprop

/-- A non-removable deleted vertex supplies a named critical full four-shell. -/
theorem exists_criticalSelectedFourClass
    {A : Finset ℝ²} {q : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hq : q ∈ A)
    (hnrem : ¬ IsRemovableVertex A q) :
    ∃ center : ℝ², Nonempty (CriticalSelectedFourClass A q center) := by
  rcases exists_criticalFourShell hK4 hq hnrem with ⟨center, ⟨K⟩⟩
  rcases CriticalSelectedFourClass.exists_of_shell K with ⟨S, _hS⟩
  exact ⟨center, ⟨S⟩⟩

/-- Counterexample-data form of `exists_criticalFourShell`: if the carrier has
no removable vertices, every deleted carrier point has a critical full shell. -/
theorem CounterexampleData.exists_criticalFourShell_of_no_removable
    {D : CounterexampleData} {q : ℝ²}
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hq : q ∈ D.A) :
    ∃ center : ℝ², Nonempty (CriticalFourShell D.A q center) :=
  exists_criticalFourShell D.K4 hq (hnoRem q)

/-- Minimal counterexample-data form of `exists_criticalFourShell`: every
deleted carrier point has a critical full shell. -/
theorem CounterexampleData.exists_criticalFourShell_of_minimal
    {D : CounterexampleData} {q : ℝ²}
    (hmin : D.Minimal)
    (hq : q ∈ D.A) :
    ∃ center : ℝ², Nonempty (CriticalFourShell D.A q center) :=
  D.exists_criticalFourShell_of_no_removable
    (CounterexampleData.not_isRemovableVertex_of_minimal hmin) hq

/-- Counterexample-data form of `exists_criticalSelectedFourClass`: if the
carrier has no removable vertices, every deleted carrier point has a named
critical full shell. -/
theorem CounterexampleData.exists_criticalSelectedFourClass_of_no_removable
    {D : CounterexampleData} {q : ℝ²}
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hq : q ∈ D.A) :
    ∃ center : ℝ², Nonempty (CriticalSelectedFourClass D.A q center) :=
  exists_criticalSelectedFourClass D.K4 hq (hnoRem q)

/-- Minimal counterexample-data form of `exists_criticalSelectedFourClass`:
every deleted carrier point has a named critical full shell. -/
theorem CounterexampleData.exists_criticalSelectedFourClass_of_minimal
    {D : CounterexampleData} {q : ℝ²}
    (hmin : D.Minimal)
    (hq : q ∈ D.A) :
    ∃ center : ℝ², Nonempty (CriticalSelectedFourClass D.A q center) :=
  D.exists_criticalSelectedFourClass_of_no_removable
    (CounterexampleData.not_isRemovableVertex_of_minimal hmin) hq

/-- A concrete choice of named critical full shell for every source point in
the carrier.

This is the theorem-facing manifest surface for the U1.2 critical-row route:
each row is a `CriticalSelectedFourClass`, so its support is the whole ambient
radius class, not a selected four-subset. -/
structure CriticalShellSystem (A : Finset ℝ²) where
  /-- For each source point `q`, choose a blocker center and its named full
  critical shell through `q`. -/
  shellAt :
    ∀ q : ℝ², q ∈ A → Sigma fun center : ℝ² =>
      CriticalSelectedFourClass A q center

namespace CriticalShellSystem

/-- The chosen blocker center for a source point. -/
def centerAt {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) : ℝ² :=
  (H.shellAt q hq).1

/-- The chosen named full shell for a source point. -/
def selectedAt {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    CriticalSelectedFourClass A q (H.centerAt q hq) :=
  (H.shellAt q hq).2

/-- The source point is one of the four labels in its chosen critical shell. -/
theorem source_eq_named {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    q = (H.selectedAt q hq).l1 ∨
      q = (H.selectedAt q hq).l2 ∨
      q = (H.selectedAt q hq).l3 ∨
      q = (H.selectedAt q hq).l4 :=
  (H.selectedAt q hq).source_eq_named

/-- Exact row membership for the chosen critical shell, in named-label form. -/
theorem off_row_named_label_forbidden {A : Finset ℝ²}
    (H : CriticalShellSystem A) {q z : ℝ²} (hq : q ∈ A)
    (hzA : z ∈ A)
    (hzdist :
      dist (H.centerAt q hq) z =
        (H.selectedAt q hq).toCriticalFourShell.radius) :
    z = (H.selectedAt q hq).l1 ∨
      z = (H.selectedAt q hq).l2 ∨
      z = (H.selectedAt q hq).l3 ∨
      z = (H.selectedAt q hq).l4 :=
  (H.selectedAt q hq).off_row_named_label_forbidden hzA hzdist

end CriticalShellSystem

/-- If the carrier has no removable vertices, choose a named critical full
shell for every source point. -/
theorem exists_criticalShellSystem
    {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hnoRem : ∀ q : ℝ², ¬ IsRemovableVertex A q) :
    Nonempty (CriticalShellSystem A) := by
  classical
  let shellAt :
      ∀ q : ℝ², q ∈ A → Sigma fun center : ℝ² =>
        CriticalSelectedFourClass A q center := by
    intro q hq
    let witness := exists_criticalSelectedFourClass hK4 hq (hnoRem q)
    let center := Classical.choose witness
    let S := Classical.choice (Classical.choose_spec witness)
    exact ⟨center, S⟩
  exact ⟨{ shellAt := shellAt }⟩

/-- Counterexample-data form of `exists_criticalShellSystem`: if the carrier
has no removable vertices, it has a chosen critical full shell system. -/
theorem CounterexampleData.exists_criticalShellSystem_of_no_removable
    {D : CounterexampleData}
    (hnoRem : ∀ q : ℝ², ¬ IsRemovableVertex D.A q) :
    Nonempty (CriticalShellSystem D.A) :=
  exists_criticalShellSystem D.K4 hnoRem

/-- Minimal counterexample-data form of `exists_criticalShellSystem`: a
minimal datum supplies a chosen critical full shell system. -/
theorem CounterexampleData.exists_criticalShellSystem_of_minimal
    {D : CounterexampleData}
    (hmin : D.Minimal) :
    Nonempty (CriticalShellSystem D.A) :=
  D.exists_criticalShellSystem_of_no_removable
    (CounterexampleData.not_isRemovableVertex_of_minimal hmin)

/-- Extract one selected four-point same-radius class from the global
`HasNEquidistantProperty 4` hypothesis at a specified carrier vertex. -/
theorem exists_selectedFourClass_of_globalK4
    {A : Finset ℝ²} {center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hcenter : center ∈ A) :
    Nonempty (SelectedFourClass A center) := by
  unfold HasNEquidistantProperty HasNEquidistantPointsOn at hK4
  unfold HasNEquidistantPointsAt at hK4
  rcases hK4 center hcenter with ⟨r, hrpos, hcard⟩
  set S : Finset ℝ² := A.filter fun x => dist center x = r with hS
  obtain ⟨T, hTsub, hTcard⟩ := Finset.exists_subset_card_eq hcard
  refine ⟨{
    support := T
    support_subset_A := ?_
    support_card := hTcard
    radius := r
    radius_pos := hrpos
    support_eq_radius := ?_
    center_not_mem := ?_ }⟩
  · intro x hx
    have hxS : x ∈ S := hTsub hx
    rw [hS] at hxS
    exact (Finset.mem_filter.mp hxS).1
  · intro x hx
    have hxS : x ∈ S := hTsub hx
    rw [hS] at hxS
    exact (Finset.mem_filter.mp hxS).2
  · intro hmem
    have hdist : dist center center = r := by
      have hxS : center ∈ S := hTsub hmem
      rw [hS] at hxS
      exact (Finset.mem_filter.mp hxS).2
    have hzero : (0 : ℝ) = r := by
      simpa using hdist
    linarith

/-- A specified carrier vertex has a selected four-class together with a
nonzero-distance gauge witness. -/
theorem exists_selectedFourClass_gauge_witness_of_globalK4
    {A : Finset ℝ²} {center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hcenter : center ∈ A) :
    ∃ (K : SelectedFourClass A center) (q : ℝ²),
      q ∈ K.support ∧ q ∈ A ∧ center ≠ q ∧ dist center q = K.radius := by
  rcases exists_selectedFourClass_of_globalK4 hK4 hcenter with ⟨K⟩
  rcases K.exists_gauge_witness with ⟨q, hqK, hqA, hneq, hdist⟩
  exact ⟨K, q, hqK, hqA, hneq, hdist⟩

/-- A faithful carrier pattern selects one four-point same-radius class at each
carrier vertex, together with one selected class used to fix the two-point
similarity gauge.

This is the Lean counterpart of the scratch encoder datum
`{center : [m0, m1, m2, m3]}`: each row is a selected four-class, and the gauge
witness is the row member sent to `(1, 0)`.  It intentionally records only one
selected class per center. -/
structure FaithfulCarrierPattern (A : Finset ℝ²) where
  /-- The carrier vertex translated to the origin. -/
  gaugeCenter : ℝ²
  /-- The gauge center is a carrier vertex. -/
  gaugeCenter_mem : gaugeCenter ∈ A
  /-- One selected four-class at every carrier vertex. -/
  classAt : ∀ center : ℝ², center ∈ A → SelectedFourClass A center
  /-- The selected witness sent to `(1, 0)`. -/
  gaugeWitness : ℝ²
  /-- The gauge witness lies in the selected class at the gauge center. -/
  gaugeWitness_mem :
    gaugeWitness ∈ (classAt gaugeCenter gaugeCenter_mem).support

namespace FaithfulCarrierPattern

theorem gaugeWitness_mem_A {A : Finset ℝ²} (P : FaithfulCarrierPattern A) :
    P.gaugeWitness ∈ A :=
  (P.classAt P.gaugeCenter P.gaugeCenter_mem).support_subset_A P.gaugeWitness_mem

theorem gaugeCenter_ne_witness {A : Finset ℝ²} (P : FaithfulCarrierPattern A) :
    P.gaugeCenter ≠ P.gaugeWitness := by
  intro h
  exact (P.classAt P.gaugeCenter P.gaugeCenter_mem).center_not_mem
    (by simpa [h] using P.gaugeWitness_mem)

theorem gaugeWitness_dist {A : Finset ℝ²} (P : FaithfulCarrierPattern A) :
    dist P.gaugeCenter P.gaugeWitness =
      (P.classAt P.gaugeCenter P.gaugeCenter_mem).radius :=
  (P.classAt P.gaugeCenter P.gaugeCenter_mem).support_eq_radius
    P.gaugeWitness P.gaugeWitness_mem

/-- In the faithful gauge, the chosen center becomes the encoder's fixed point
`p = (0, 0)`. -/
theorem normalAxis_gaugeCenter {A : Finset ℝ²} (P : FaithfulCarrierPattern A) :
    normalAxis P.gaugeCenter P.gaugeWitness P.gaugeCenter = 0 :=
  normalAxis_self

/-- In the faithful gauge, the selected gauge witness becomes the encoder's
fixed point `q = (1, 0)`. -/
theorem normalAxis_gaugeWitness {A : Finset ℝ²} (P : FaithfulCarrierPattern A) :
    normalAxis P.gaugeCenter P.gaugeWitness P.gaugeWitness = !₂[(1 : ℝ), 0] :=
  normalAxis_witness P.gaugeCenter_ne_witness

/-- Transported selected classes satisfy exactly the encoder row equation:
each normalized member has the same distance from the normalized center as the
chosen base member. -/
theorem normalized_class_row_eq {A : Finset ℝ²} (P : FaithfulCarrierPattern A)
    {center : ℝ²} (hcenter : center ∈ A) {base x : ℝ²}
    (hbase : base ∈ (P.classAt center hcenter).support)
    (hx : x ∈ (P.classAt center hcenter).support) :
    dist (normalAxis P.gaugeCenter P.gaugeWitness center)
        (normalAxis P.gaugeCenter P.gaugeWitness x) =
      dist (normalAxis P.gaugeCenter P.gaugeWitness center)
        (normalAxis P.gaugeCenter P.gaugeWitness base) := by
  have hdist :
      dist center x = dist center base := by
    rw [(P.classAt center hcenter).support_eq_radius x hx,
      (P.classAt center hcenter).support_eq_radius base hbase]
  exact (normalAxis_dist_eq_iff P.gaugeCenter_ne_witness center x center base).mp hdist

/-- The selected gauge row maps to the encoder's unit circle around the origin:
every normalized member of that row is at distance `1` from the normalized
gauge center. -/
theorem normalized_gauge_row_unit {A : Finset ℝ²} (P : FaithfulCarrierPattern A)
    {x : ℝ²}
    (hx : x ∈ (P.classAt P.gaugeCenter P.gaugeCenter_mem).support) :
    dist (normalAxis P.gaugeCenter P.gaugeWitness P.gaugeCenter)
        (normalAxis P.gaugeCenter P.gaugeWitness x) = 1 := by
  have hdist :
      dist (normalAxis P.gaugeCenter P.gaugeWitness P.gaugeCenter)
          (normalAxis P.gaugeCenter P.gaugeWitness x) =
        dist (normalAxis P.gaugeCenter P.gaugeWitness P.gaugeCenter)
          (normalAxis P.gaugeCenter P.gaugeWitness P.gaugeWitness) :=
    P.normalized_class_row_eq P.gaugeCenter_mem P.gaugeWitness_mem hx
  rw [P.normalAxis_gaugeCenter, P.normalAxis_gaugeWitness] at hdist
  have hunit : dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) = 1 := by
    have hsq : dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) ^ 2 = 1 := by
      rw [dist_sq_coord]
      norm_num
    have hnonneg : 0 ≤ dist (0 : ℝ²) (!₂[(1 : ℝ), 0] : ℝ²) := dist_nonneg
    nlinarith
  rw [P.normalAxis_gaugeCenter]
  exact hdist.trans hunit

/-- Encoder C1/Claim-A overlap: any selected class at a center distinct from the
gauge center meets the gauge row in at most two points. -/
theorem support_inter_gauge_card_le_two {A : Finset ℝ²}
    (P : FaithfulCarrierPattern A) {center : ℝ²} (hcenter : center ∈ A)
    (hne : center ≠ P.gaugeCenter) :
    ((P.classAt center hcenter).support ∩
      (P.classAt P.gaugeCenter P.gaugeCenter_mem).support).card ≤ 2 :=
  SelectedFourClass.inter_card_le_two
    (P.classAt center hcenter)
    (P.classAt P.gaugeCenter P.gaugeCenter_mem)
    hne

end FaithfulCarrierPattern

/-- Global `K4` supplies a faithful carrier pattern at any specified gauge
center. -/
theorem exists_faithfulCarrierPattern_of_globalK4
    {A : Finset ℝ²} {center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hcenter : center ∈ A) :
    Nonempty (FaithfulCarrierPattern A) := by
  classical
  let classAt : ∀ center : ℝ², center ∈ A → SelectedFourClass A center :=
    fun c hc => Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hc)
  have hnonempty : (classAt center hcenter).support.Nonempty :=
    (classAt center hcenter).support_nonempty
  rcases hnonempty with ⟨q, hq⟩
  exact ⟨{
    gaugeCenter := center
    gaugeCenter_mem := hcenter
    classAt := classAt
    gaugeWitness := q
    gaugeWitness_mem := hq }⟩

end Problem97
