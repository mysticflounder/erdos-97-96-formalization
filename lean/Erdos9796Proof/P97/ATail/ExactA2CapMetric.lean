/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CocircularPentagonOrder
import Erdos9796Proof.P97.ATail.CocircularPerpendicularBisector
import Erdos9796Proof.P97.ATail.ConvexCocircularHalfPlane

/-!
# Exact-A2 cap metric terminal

This module isolates the Euclidean contradiction used by the exact-seventeen,
second-cap-nine exact-cover branch of the Rigid221 source-heavy frontier.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ExactA2CapMetric

/-- Cyclic invariance of the oriented doubled area. -/
theorem signedArea2_cyclic (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  unfold signedArea2
  ring

/-- Swapping the last two arguments reverses oriented doubled area. -/
theorem signedArea2_swap (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  unfold signedArea2
  ring

private theorem norm_sq_coord_sub (x y : ℝ²) :
    ‖x - y‖ ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

private theorem sum_ne_zero_of_strict_halfplane
    {P p q w : ℝ²}
    (hp : 0 < ⟪w, p - P⟫_ℝ) (hq : 0 < ⟪w, q - P⟫_ℝ) :
    (p - P) + (q - P) ≠ 0 := by
  intro hzero
  have hinner := congrArg (fun z : ℝ² => ⟪w, z⟫_ℝ) hzero
  change ⟪w, (p - P) + (q - P)⟫_ℝ = ⟪w, 0⟫_ℝ at hinner
  rw [inner_add_right, inner_zero_right] at hinner
  linarith

/-- Construct the four positive perpendicular-bisector fan parameters used by A2. -/
theorem exists_exactA2_fan_parameters
    {A : Finset ℝ²} {P u y x v d c : ℝ²} {radius : ℝ}
    (hA : ConvexIndep A)
    (hP_mem : P ∈ A) (hu_mem : u ∈ A) (hy_mem : y ∈ A)
    (hx_mem : x ∈ A) (hv_mem : v ∈ A) (hd_mem : d ∈ A)
    (hu_ne_P : u ≠ P) (hy_ne_P : y ≠ P) (hx_ne_P : x ≠ P)
    (hv_ne_P : v ≠ P) (hd_ne_P : d ≠ P)
    (hu_ne_y : u ≠ y) (hu_ne_x : u ≠ x)
    (hv_ne_x : v ≠ x) (hv_ne_d : v ≠ d)
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius)
    (hx_eq : dist x u = dist x y)
    (hv_eq : dist v u = dist v x)
    (hd_eq : dist d v = dist d x)
    (hc_eq : dist c v = dist c d)
    (hc_sides :
      (0 < signedArea2 v d c ∧ signedArea2 v d P < 0) ∨
      (0 < signedArea2 d v c ∧ signedArea2 d v P < 0)) :
    ∃ tx tv td tc : ℝ,
      0 < tx ∧ 0 < tv ∧ 0 < td ∧ (1 / 2 : ℝ) < tc ∧
      x - P = tx • ((u - P) + (y - P)) ∧
      v - P = tv • ((u - P) + (x - P)) ∧
      d - P = td • ((v - P) + (x - P)) ∧
      c - P = tc • ((v - P) + (d - P)) := by
  let physical : Finset ℝ² := {u, y, x, v, d}
  have hphysical : physical ⊆ A.erase P := by
    intro q hq
    simp only [physical, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl | rfl
    · exact Finset.mem_erase.mpr ⟨hu_ne_P, hu_mem⟩
    · exact Finset.mem_erase.mpr ⟨hy_ne_P, hy_mem⟩
    · exact Finset.mem_erase.mpr ⟨hx_ne_P, hx_mem⟩
    · exact Finset.mem_erase.mpr ⟨hv_ne_P, hv_mem⟩
    · exact Finset.mem_erase.mpr ⟨hd_ne_P, hd_mem⟩
  have hcommon : ∀ q ∈ physical, dist q P = radius := by
    intro q hq
    simp only [physical, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl | rfl
    · simpa only [dist_comm] using hP_u
    · simpa only [dist_comm] using hP_y
    · simpa only [dist_comm] using hP_x
    · simpa only [dist_comm] using hP_v
    · simpa only [dist_comm] using hP_d
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hA hP_mem hphysical hradius hcommon
  have hwu : 0 < ⟪w, u - P⟫_ℝ := hw u (by simp [physical])
  have hwy : 0 < ⟪w, y - P⟫_ℝ := hw y (by simp [physical])
  have hwx : 0 < ⟪w, x - P⟫_ℝ := hw x (by simp [physical])
  have hwv : 0 < ⟪w, v - P⟫_ℝ := hw v (by simp [physical])
  have hwd : 0 < ⟪w, d - P⟫_ℝ := hw d (by simp [physical])
  have hsumUY := sum_ne_zero_of_strict_halfplane hwu hwy
  have hsumUX := sum_ne_zero_of_strict_halfplane hwu hwx
  have hsumVX := sum_ne_zero_of_strict_halfplane hwv hwx
  have hsumVD := sum_ne_zero_of_strict_halfplane hwv hwd
  obtain ⟨tx, hxrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_y
      (hP_u.trans hP_y.symm) hx_eq hsumUY hx_ne_P
  obtain ⟨tv, hvrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_x
      (hP_u.trans hP_x.symm) hv_eq hsumUX hv_ne_P
  obtain ⟨td, hdrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hv_ne_x
      (hP_v.trans hP_x.symm) hd_eq hsumVX hd_ne_P
  obtain ⟨tc, hcrep⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction hv_ne_d
      (hP_v.trans hP_d.symm) hc_eq hsumVD
  have htx : 0 < tx :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane hwu hwy hwx hxrep
  have htv : 0 < tv :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane hwu hwx hwv hvrep
  have htd : 0 < td :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane hwv hwx hwd hdrep
  have htc : (1 / 2 : ℝ) < tc := by
    rcases hc_sides with hforward | hreverse
    · exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        hcrep hforward.1 hforward.2
    · have hcrep' : c - P = tc • ((d - P) + (v - P)) := by
        simpa only [add_comm] using hcrep
      exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        hcrep' hreverse.1 hreverse.2
  exact ⟨tx, tv, td, tc, htx, htv, htd, htc, hxrep, hvrep, hdrep, hcrep⟩

/-- Positive equal-norm sum direction gives a positive endpoint inner product.
This is the public form of algebra currently private in the pentagon-order
module. -/
theorem inner_pos_of_positive_equal_norm_sum_direction
    {a b x : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (ha : ‖a‖ = radius) (hb : ‖b‖ = radius) (hxnorm : ‖x‖ = radius)
    (ht : 0 < t) (hx : x = t • (a + b)) :
    0 < ⟪a, x⟫_ℝ := by
  have hxne : x ≠ 0 := by
    intro hzero
    rw [hzero, norm_zero] at hxnorm
    linarith
  have habne : a + b ≠ 0 := by
    intro hzero
    rw [hzero, smul_zero] at hx
    exact hxne hx
  have habnorm : 0 < ‖a + b‖ := norm_pos_iff.mpr habne
  have habinner : 0 < ⟪a + b, a + b⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq]
    exact sq_pos_of_pos habnorm
  have haa : ⟪a, a⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, ha]
  have hbb : ⟪b, b⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hb]
  have hidentity :
      2 * ⟪a, x⟫_ℝ = t * ⟪a + b, a + b⟫_ℝ := by
    simp only [hx, real_inner_smul_right, inner_add_right, inner_add_left]
    rw [real_inner_comm b a, haa, hbb]
    ring
  nlinarith [mul_pos ht habinner]

/-- Nested positive sum direction preserves positivity against the second
endpoint. -/
theorem inner_pos_of_nested_positive_sum_direction
    {a b x : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (hb : ‖b‖ = radius)
    (hab : 0 < ⟪a, b⟫_ℝ)
    (ht : 0 < t) (hx : x = t • (a + b)) :
    0 < ⟪x, b⟫_ℝ := by
  have hbb : 0 < ⟪b, b⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq, hb]
    exact sq_pos_of_pos hradius
  rw [hx, real_inner_smul_left, inner_add_left]
  exact mul_pos ht (add_pos hab hbb)

/-- Equidistance from a basepoint and a common-radius point gives the familiar
half-inner-product identity. -/
theorem inner_eq_half_radius_sq_of_equidistant
    {P a z : ℝ²} {radius : ℝ}
    (ha : ‖a - P‖ = radius)
    (hz : ‖z - P‖ = ‖z - a‖) :
    ⟪z - P, a - P⟫_ℝ = radius ^ 2 / 2 := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hza : (z - P) - (a - P) = z - a := by abel
  rw [hza, hz, ha]
  ring
/-- A common-radius point on a positive sum ray is rigidified if the basepoint
lies on its equal-distance row.

The explicit intermediate identity `‖z‖² = 2 t <z,a>` avoids asking
`nlinarith` to multiply one input equality by `t`. -/
theorem rigid_sum_direction_of_origin_on_row
    {a b z : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (ha : ‖a‖ = radius) (hb : ‖b‖ = radius) (hz : ‖z‖ = radius)
    (ht : 0 < t) (hrep : z = t • (a + b))
    (hrow : ‖z - a‖ = radius) :
    t = 1 ∧ ⟪a, b⟫_ℝ = -(radius ^ 2) / 2 := by
  have hrr : 0 < radius ^ 2 := sq_pos_of_pos hradius
  have haa : ⟪a, a⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, ha]
  have hbb : ⟪b, b⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hb]
  have hzz : ⟪z, z⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hz]
  have hza : ⟪z, a⟫_ℝ = radius ^ 2 / 2 := by
    have hsub : ‖z - a‖ ^ 2 = radius ^ 2 := by rw [hrow]
    rw [norm_sub_sq_real, hz, ha] at hsub
    nlinarith [hsub]
  have hzaRep :
      ⟪z, a⟫_ℝ = t * (radius ^ 2 + ⟪a, b⟫_ℝ) := by
    rw [hrep, real_inner_smul_left, inner_add_left, haa,
      real_inner_comm b a]
  have hzzRep :
      ⟪z, z⟫_ℝ = t ^ 2 * (2 * radius ^ 2 + 2 * ⟪a, b⟫_ℝ) := by
    calc
      ⟪z, z⟫_ℝ = ⟪t • (a + b), t • (a + b)⟫_ℝ := by rw [hrep]
      _ = t ^ 2 * ⟪a + b, a + b⟫_ℝ := by
        rw [real_inner_smul_left, real_inner_smul_right]
        ring
      _ = t ^ 2 * (2 * radius ^ 2 + 2 * ⟪a, b⟫_ℝ) := by
        rw [inner_add_left, inner_add_right, inner_add_right,
          real_inner_comm b a, haa, hbb]
        ring
  have hnormViaRow : ⟪z, z⟫_ℝ = 2 * t * ⟪z, a⟫_ℝ := by
    rw [hzzRep, hzaRep]
    ring
  have htFactor : radius ^ 2 * (1 - t) = 0 := by
    nlinarith [hzz, hza, hnormViaRow]
  have htOne : t = 1 := by
    rcases mul_eq_zero.mp htFactor with hzero | hfactor
    · exact (ne_of_gt hrr hzero).elim
    · linarith
  refine ⟨htOne, ?_⟩
  rw [htOne] at hzaRep
  nlinarith

/-- Basepoint wrapper for `rigid_sum_direction_of_origin_on_row`. -/
theorem rigid_sum_direction_of_basepoint_on_row
    {P a b z : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (ha : dist P a = radius) (hb : dist P b = radius)
    (hz : dist P z = radius)
    (ht : 0 < t)
    (hrep : z - P = t • ((a - P) + (b - P)))
    (hrow : dist z P = dist z a) :
    t = 1 ∧ ⟪a - P, b - P⟫_ℝ = -(radius ^ 2) / 2 := by
  apply rigid_sum_direction_of_origin_on_row (a := a - P) (b := b - P) (z := z - P) hradius
  · simpa only [dist_eq_norm, norm_sub_rev] using ha
  · simpa only [dist_eq_norm, norm_sub_rev] using hb
  · simpa only [dist_eq_norm, norm_sub_rev] using hz
  · exact ht
  · exact hrep
  · have hrowNorm : ‖(z - P) - (a - P)‖ = radius := by
      have hza : (z - P) - (a - P) = z - a := by abel
      rw [hza]
      calc
        ‖z - a‖ = dist z a := by rw [dist_eq_norm]
        _ = dist z P := hrow.symm
        _ = dist P z := dist_comm _ _
        _ = radius := hz
    exact hrowNorm

/-- Two-dimensional Lagrange identity in the exact form used by the CAP
terminal. -/
theorem signedArea2_sq_add_inner_sq
    (P u y : ℝ²) :
    signedArea2 P u y ^ 2 + ⟪u - P, y - P⟫_ℝ ^ 2 =
      ‖u - P‖ ^ 2 * ‖y - P‖ ^ 2 := by
  rw [norm_sq_coord_sub, norm_sq_coord_sub, PiLp.inner_apply,
    Fin.sum_univ_two]
  simp [signedArea2, PiLp.sub_apply, mul_comm]
  ring

/-- Equal radius and a 120-degree inner product give the exact area square
needed after row-1 apex membership. -/
theorem signedArea2_sq_eq_three_quarters
    {P u y : ℝ²} {radius : ℝ}
    (hu : dist P u = radius) (hy : dist P y = radius)
    (hinner : ⟪u - P, y - P⟫_ℝ = -(radius ^ 2) / 2) :
    signedArea2 P u y ^ 2 = 3 * radius ^ 4 / 4 := by
  have huNorm : ‖u - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hu
  have hyNorm : ‖y - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hy
  have hlagrange := signedArea2_sq_add_inner_sq P u y
  rw [huNorm, hyNorm, hinner] at hlagrange
  nlinarith [sq_nonneg (radius ^ 2)]

/-- If `d-P = a(u-P)+b(y-P)`, then the signed area against chord `uy`
depends only on the coefficient sum `a+b`. -/
theorem signedArea2_affine_sum
    {P u y d : ℝ²} {a b : ℝ}
    (hd : d - P = a • (u - P) + b • (y - P)) :
    signedArea2 u y d = (1 - a - b) * signedArea2 P u y := by
  have hd0 := congrArg (fun z : ℝ² => z 0) hd
  have hd1 := congrArg (fun z : ℝ² => z 1) hd
  simp only [PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply, smul_eq_mul] at hd0 hd1
  have hd0' : d 0 = P 0 + a * (u 0 - P 0) + b * (y 0 - P 0) := by
    linarith
  have hd1' : d 1 = P 1 + a * (u 1 - P 1) + b * (y 1 - P 1) := by
    linarith
  unfold signedArea2
  rw [hd0', hd1']
  ring

/-- Opposite strict sides of chord `uy` force the segment `dq` to be longer
than the perpendicular chord clearance of `d`.

The proof is the strict sign identity followed by an explicit two-coordinate
Lagrange identity. -/
theorem signedArea2_sq_lt_dist_sq_mul_dist_sq_of_opposite_sides
    {u y d q : ℝ²}
    (hside : signedArea2 u y d * signedArea2 u y q < 0) :
    signedArea2 u y d ^ 2 < dist u y ^ 2 * dist d q ^ 2 := by
  have hstrict :
      signedArea2 u y d ^ 2 <
        (signedArea2 u y d - signedArea2 u y q) ^ 2 := by
    nlinarith [sq_nonneg (signedArea2 u y q)]
  have hdiff :
      signedArea2 u y d - signedArea2 u y q =
        (y 0 - u 0) * (d 1 - q 1) -
          (d 0 - q 0) * (y 1 - u 1) := by
    unfold signedArea2
    ring
  have hlagrange :
      ((y 0 - u 0) * (d 1 - q 1) -
          (d 0 - q 0) * (y 1 - u 1)) ^ 2 +
        ((y 0 - u 0) * (d 0 - q 0) +
          (y 1 - u 1) * (d 1 - q 1)) ^ 2 =
      ((y 0 - u 0) ^ 2 + (y 1 - u 1) ^ 2) *
        ((d 0 - q 0) ^ 2 + (d 1 - q 1) ^ 2) := by
    ring
  rw [dist_sq_coord, dist_sq_coord]
  rw [hdiff] at hstrict
  nlinarith [hlagrange,
    sq_nonneg ((y 0 - u 0) * (d 0 - q 0) +
      (y 1 - u 1) * (d 1 - q 1))]

/-- Scalar closing lemma: once the fan calculation has produced these four
identities, row 2's selected circle is strictly short of chord `uy`. -/
theorem clearance_of_scalar_identities
    {u y d v : ℝ²} {radius m delta : ℝ}
    (hradius : 0 < radius)
    (hchord : dist u y ^ 2 = 3 * radius ^ 2)
    (hareaBase : delta ^ 2 = 3 * radius ^ 4 / 4)
    (harea : signedArea2 u y d = (1 - m) * delta)
    (hrowRadius : dist d v ^ 2 = radius ^ 2 * (2 - m))
    (hm : 4 * (2 - m) < (m - 1) ^ 2) :
    dist u y ^ 2 * dist d v ^ 2 < signedArea2 u y d ^ 2 := by
  have hlhs :
      dist u y ^ 2 * dist d v ^ 2 =
        3 * radius ^ 4 * (2 - m) := by
    rw [hchord, hrowRadius]
    ring
  have hrhs :
      signedArea2 u y d ^ 2 =
        (3 * radius ^ 4 / 4) * (m - 1) ^ 2 := by
    rw [harea]
    calc
      ((1 - m) * delta) ^ 2 = delta ^ 2 * (m - 1) ^ 2 := by ring
      _ = (3 * radius ^ 4 / 4) * (m - 1) ^ 2 := by rw [hareaBase]
  have hscale : 0 < 3 * radius ^ 4 / 4 := by positivity
  have hscaled :
      (3 * radius ^ 4 / 4) * (4 * (2 - m)) <
        (3 * radius ^ 4 / 4) * (m - 1) ^ 2 :=
    mul_lt_mul_of_pos_left hm hscale
  rw [hlhs, hrhs]
  nlinarith



/-- Squared distance between two points on the same circle, expressed through
the translated inner product. -/
theorem dist_sq_eq_two_radius_sq_sub_two_inner
    {P a b : ℝ²} {radius : ℝ}
    (ha : dist P a = radius) (hb : dist P b = radius) :
    dist a b ^ 2 =
      2 * radius ^ 2 - 2 * ⟪a - P, b - P⟫_ℝ := by
  have hna : ‖a - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using ha
  have hnb : ‖b - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hb
  have hab : a - b = (a - P) - (b - P) := by abel
  calc
    dist a b ^ 2 = ‖a - b‖ ^ 2 := by rw [dist_eq_norm]
    _ = ‖(a - P) - (b - P)‖ ^ 2 := by rw [hab]
    _ = ‖a - P‖ ^ 2 - 2 * ⟪a - P, b - P⟫_ℝ + ‖b - P‖ ^ 2 := by
      rw [norm_sub_sq_real]
    _ = 2 * radius ^ 2 - 2 * ⟪a - P, b - P⟫_ℝ := by rw [hna, hnb]; ring
set_option maxHeartbeats 800000 in
-- The nested scalar normalization uses several coordinated algebraic steps.
/-- The exact nested-fan calculation after exact-cover routing has forced the
physical apex into row 1.

Inputs `hxrep`, `hvrep`, `hdrep` are precisely the three positive bisector
representations produced by `fan_parameters`; `hUY` is the rigidity output
from apex membership in row 1. -/
theorem row2_chord_clearance_after_row1
    {P u y x v d : ℝ²} {radius tv td : ℝ}
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius)
    (htv : 0 < tv) (htd : 0 < td)
    (hxrep : x - P = (u - P) + (y - P))
    (hvrep : v - P = tv • ((u - P) + (x - P)))
    (hdrep : d - P = td • ((v - P) + (x - P)))
    (hUY : ⟪u - P, y - P⟫_ℝ = -(radius ^ 2) / 2) :
    dist u y ^ 2 * dist d v ^ 2 < signedArea2 u y d ^ 2 := by
  let U : ℝ² := u - P
  let Y : ℝ² := y - P
  let X : ℝ² := x - P
  let V : ℝ² := v - P
  let D : ℝ² := d - P
  have hUU : ⟪U, U⟫_ℝ = radius ^ 2 := by
    dsimp only [U]
    rw [real_inner_self_eq_norm_sq]
    have hnorm : ‖u - P‖ = radius := by
      simpa only [dist_eq_norm, norm_sub_rev] using hP_u
    rw [hnorm]
  have hYY : ⟪Y, Y⟫_ℝ = radius ^ 2 := by
    dsimp only [Y]
    rw [real_inner_self_eq_norm_sq]
    have hnorm : ‖y - P‖ = radius := by
      simpa only [dist_eq_norm, norm_sub_rev] using hP_y
    rw [hnorm]
  have hXX : ⟪X, X⟫_ℝ = radius ^ 2 := by
    dsimp only [X]
    rw [real_inner_self_eq_norm_sq]
    have hnorm : ‖x - P‖ = radius := by
      simpa only [dist_eq_norm, norm_sub_rev] using hP_x
    rw [hnorm]
  have hVV : ⟪V, V⟫_ℝ = radius ^ 2 := by
    dsimp only [V]
    rw [real_inner_self_eq_norm_sq]
    have hnorm : ‖v - P‖ = radius := by
      simpa only [dist_eq_norm, norm_sub_rev] using hP_v
    rw [hnorm]
  have hDD : ⟪D, D⟫_ℝ = radius ^ 2 := by
    dsimp only [D]
    rw [real_inner_self_eq_norm_sq]
    have hnorm : ‖d - P‖ = radius := by
      simpa only [dist_eq_norm, norm_sub_rev] using hP_d
    rw [hnorm]
  have hrr : 0 < radius ^ 2 := sq_pos_of_pos hradius
  have hXYrep : X = U + Y := by
    simpa only [X, U, Y] using hxrep
  have hVrep : V = tv • (U + X) := by
    simpa only [V, U, X] using hvrep
  have hDrep : D = td • (V + X) := by
    simpa only [D, V, X] using hdrep
  have hUY' : ⟪U, Y⟫_ℝ = -(radius ^ 2) / 2 := by
    simpa only [U, Y] using hUY
  have hUX : ⟪U, X⟫_ℝ = radius ^ 2 / 2 := by
    rw [hXYrep, inner_add_right, hUU, hUY']
    ring
  have hsumUX : ⟪U + X, U + X⟫_ℝ = 3 * radius ^ 2 := by
    rw [inner_add_left, inner_add_right, inner_add_right,
      real_inner_comm U X, hUU, hXX, hUX]
    ring
  have hVnormRep :
      ⟪V, V⟫_ℝ = tv ^ 2 * ⟪U + X, U + X⟫_ℝ := by
    calc
      ⟪V, V⟫_ℝ = ⟪tv • (U + X), tv • (U + X)⟫_ℝ := by rw [hVrep]
      _ = tv ^ 2 * ⟪U + X, U + X⟫_ℝ := by
        rw [real_inner_smul_left, real_inner_smul_right]
        ring
  have htvEq : radius ^ 2 = tv ^ 2 * (3 * radius ^ 2) := by
    calc
      radius ^ 2 = ⟪V, V⟫_ℝ := hVV.symm
      _ = tv ^ 2 * ⟪U + X, U + X⟫_ℝ := hVnormRep
      _ = tv ^ 2 * (3 * radius ^ 2) := by rw [hsumUX]
  have htvFactor : radius ^ 2 * (1 - 3 * tv ^ 2) = 0 := by
    nlinarith [htvEq]
  have htvSq : 3 * tv ^ 2 = 1 := by
    rcases mul_eq_zero.mp htvFactor with hzero | hfactor
    · exact (ne_of_gt hrr hzero).elim
    · linarith
  have htvHalf : (1 / 2 : ℝ) < tv := by
    by_contra hnot
    have hle : tv ≤ 1 / 2 := le_of_not_gt hnot
    have hprod : 0 ≤ tv * (1 / 2 - tv) :=
      mul_nonneg (le_of_lt htv) (sub_nonneg.mpr hle)
    nlinarith
  have hVX : ⟪V, X⟫_ℝ = (3 * tv / 2) * radius ^ 2 := by
    rw [hVrep, real_inner_smul_left, inner_add_left, hUX, hXX]
    ring
  let s : ℝ := 2 + 3 * tv
  have hsPos : 0 < s := by
    dsimp only [s]
    linarith
  have hsumVX : ⟪V + X, V + X⟫_ℝ = radius ^ 2 * s := by
    rw [inner_add_left, inner_add_right, inner_add_right,
      real_inner_comm V X, hVV, hXX, hVX]
    dsimp only [s]
    ring
  have hDnormRep :
      ⟪D, D⟫_ℝ = td ^ 2 * ⟪V + X, V + X⟫_ℝ := by
    calc
      ⟪D, D⟫_ℝ = ⟪td • (V + X), td • (V + X)⟫_ℝ := by rw [hDrep]
      _ = td ^ 2 * ⟪V + X, V + X⟫_ℝ := by
        rw [real_inner_smul_left, real_inner_smul_right]
        ring
  have htdEq : radius ^ 2 = td ^ 2 * (radius ^ 2 * s) := by
    calc
      radius ^ 2 = ⟪D, D⟫_ℝ := hDD.symm
      _ = td ^ 2 * ⟪V + X, V + X⟫_ℝ := hDnormRep
      _ = td ^ 2 * (radius ^ 2 * s) := by rw [hsumVX]
  have htdFactor : radius ^ 2 * (1 - td ^ 2 * s) = 0 := by
    nlinarith [htdEq]
  have htdSq : td ^ 2 * s = 1 := by
    rcases mul_eq_zero.mp htdFactor with hzero | hfactor
    · exact (ne_of_gt hrr hzero).elim
    · linarith
  let m : ℝ := td * s
  have hmPos : 0 < m := mul_pos htd hsPos
  have hmSq : m ^ 2 = s := by
    calc
      m ^ 2 = td ^ 2 * s ^ 2 := by dsimp only [m]; ring
      _ = s * (td ^ 2 * s) := by ring
      _ = s := by rw [htdSq]; ring
  have hsBig : (7 / 2 : ℝ) < s := by
    dsimp only [s]
    linarith
  have hmSqBig : (7 / 2 : ℝ) < m ^ 2 := by
    rw [hmSq]
    exact hsBig
  have hmLower : (11 / 6 : ℝ) < m := by
    by_contra hnot
    have hle : m ≤ 11 / 6 := le_of_not_gt hnot
    have hprod : 0 ≤ m * (11 / 6 - m) :=
      mul_nonneg (le_of_lt hmPos) (sub_nonneg.mpr hle)
    nlinarith
  have hmClear : 4 * (2 - m) < (m - 1) ^ 2 := by
    nlinarith
  have hchordRaw :=
    dist_sq_eq_two_radius_sq_sub_two_inner hP_u hP_y
  have hchord : dist u y ^ 2 = 3 * radius ^ 2 := by
    rw [hUY] at hchordRaw
    calc
      dist u y ^ 2 = 2 * radius ^ 2 - 2 * (-(radius ^ 2) / 2) := hchordRaw
      _ = 3 * radius ^ 2 := by ring
  let delta : ℝ := signedArea2 P u y
  have hdelta : delta ^ 2 = 3 * radius ^ 4 / 4 := by
    dsimp only [delta]
    exact signedArea2_sq_eq_three_quarters hP_u hP_y hUY
  let a : ℝ := td * (1 + 2 * tv)
  let b : ℝ := td * (1 + tv)
  have hDaffine : D = a • U + b • Y := by
    rw [hDrep, hVrep, hXYrep]
    ext i
    simp only [PiLp.add_apply, PiLp.smul_apply, smul_eq_mul]
    dsimp only [a, b]
    ring
  have habSum : a + b = m := by
    dsimp only [a, b, m, s]
    ring
  have hareaRaw := signedArea2_affine_sum (P := P) (u := u) (y := y)
    (d := d) (a := a) (b := b) (by simpa only [D, U, Y] using hDaffine)
  have harea : signedArea2 u y d = (1 - m) * delta := by
    rw [hareaRaw]
    calc
      (1 - a - b) * signedArea2 P u y = (1 - (a + b)) * signedArea2 P u y := by ring
      _ = (1 - m) * signedArea2 P u y := by rw [habSum]
      _ = (1 - m) * delta := by rfl
  have hDV : ⟪D, V⟫_ℝ = radius ^ 2 * m / 2 := by
    rw [hDrep, real_inner_smul_left, inner_add_left, hVV,
      real_inner_comm V X, hVX]
    dsimp only [m, s]
    ring
  have hrowRaw :=
    dist_sq_eq_two_radius_sq_sub_two_inner hP_d hP_v
  have hrowRadius : dist d v ^ 2 = radius ^ 2 * (2 - m) := by
    change ⟪d - P, v - P⟫_ℝ = radius ^ 2 * m / 2 at hDV
    rw [hDV] at hrowRaw
    calc
      dist d v ^ 2 = 2 * radius ^ 2 - 2 * (radius ^ 2 * m / 2) := hrowRaw
      _ = radius ^ 2 * (2 - m) := by ring
  exact clearance_of_scalar_identities hradius hchord hdelta harea
    hrowRadius hmClear

/-- Final one-line contradiction once clearance, opposite sides, and row-2
radius equality have been established. -/
theorem false_of_clearance_and_outside_hit
    {u y d v q : ℝ²}
    (hclear :
      dist u y ^ 2 * dist d v ^ 2 < signedArea2 u y d ^ 2)
    (hside : signedArea2 u y d * signedArea2 u y q < 0)
    (hrow : dist d q = dist d v) : False := by
  have hcross :=
    signedArea2_sq_lt_dist_sq_mul_dist_sq_of_opposite_sides hside
  rw [hrow] at hcross
  linarith



set_option maxHeartbeats 800000 in
-- The row alternatives instantiate the metric terminal and need the larger elaboration budget.
/-- Complete source-independent A2 metric terminal after the fan parameters and
the exact-cover row alternatives have been extracted. -/
theorem false_of_exactA2_fan_and_cover
    {P u y x v d c q : ℝ²} {radius tx tv td tc : ℝ}
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius)
    (htx : 0 < tx) (htv : 0 < tv) (htd : 0 < td)
    (htc : (1 / 2 : ℝ) < tc)
    (hxrep : x - P = tx • ((u - P) + (y - P)))
    (hvrep : v - P = tv • ((u - P) + (x - P)))
    (hdrep : d - P = td • ((v - P) + (x - P)))
    (hcrep : c - P = tc • ((v - P) + (d - P)))
    (hProw :
      dist v P = dist v u ∨
      dist x P = dist x u ∨
      dist d P = dist d v ∨
      dist c P = dist c v)
    (hqSide : signedArea2 u y d * signedArea2 u y q < 0)
    (hqRow : dist d q = dist d v) : False := by
  have hUnorm : ‖u - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_u
  have hYnorm : ‖y - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_y
  have hXnorm : ‖x - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_x
  have hVnorm : ‖v - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_v
  have hUXpos : 0 < ⟪u - P, x - P⟫_ℝ :=
    inner_pos_of_positive_equal_norm_sum_direction hradius
      hUnorm hYnorm hXnorm htx hxrep
  have hVXpos : 0 < ⟪v - P, x - P⟫_ℝ :=
    inner_pos_of_nested_positive_sum_direction hradius hXnorm hUXpos htv hvrep
  have hXVpos : 0 < ⟪x - P, v - P⟫_ℝ := by
    rw [real_inner_comm]
    exact hVXpos
  have hDVpos : 0 < ⟪d - P, v - P⟫_ℝ :=
    inner_pos_of_nested_positive_sum_direction hradius hVnorm hXVpos htd
      (by simpa only [add_comm] using hdrep)
  have hrr : 0 < radius ^ 2 := sq_pos_of_pos hradius
  rcases hProw with hrow0 | hrow1 | hrow2 | hrow3
  · have hrigid := rigid_sum_direction_of_basepoint_on_row hradius
      hP_u hP_x hP_v htv hvrep hrow0
    nlinarith [hrr, hUXpos, hrigid.2]
  · have hrigid := rigid_sum_direction_of_basepoint_on_row hradius
      hP_u hP_y hP_x htx hxrep hrow1
    have hxrepOne : x - P = (u - P) + (y - P) := by
      rw [hxrep, hrigid.1, one_smul]
    have hclear := row2_chord_clearance_after_row1 hradius
      hP_u hP_y hP_x hP_v hP_d htv htd hxrepOne hvrep hdrep hrigid.2
    exact false_of_clearance_and_outside_hit hclear hqSide hqRow
  · have hrigid := rigid_sum_direction_of_basepoint_on_row hradius
      hP_v hP_x hP_d htd hdrep hrow2
    nlinarith [hrr, hVXpos, hrigid.2]
  · have hrowNorm : ‖c - P‖ = ‖c - v‖ := by
      simpa only [dist_eq_norm] using hrow3
    have hCVhalf :
        ⟪c - P, v - P⟫_ℝ = radius ^ 2 / 2 :=
      inner_eq_half_radius_sq_of_equidistant hVnorm hrowNorm
    have hVV : ⟪v - P, v - P⟫_ℝ = radius ^ 2 := by
      rw [real_inner_self_eq_norm_sq, hVnorm]
    have hCVrep :
        ⟪c - P, v - P⟫_ℝ =
          tc * (radius ^ 2 + ⟪d - P, v - P⟫_ℝ) := by
      rw [hcrep, real_inner_smul_left, inner_add_left, hVV]
    have hsumPos : 0 < radius ^ 2 + ⟪d - P, v - P⟫_ℝ := by
      have hrr : 0 < radius ^ 2 := sq_pos_of_pos hradius
      linarith
    have hscale :
        (1 / 2 : ℝ) * (radius ^ 2 + ⟪d - P, v - P⟫_ℝ) <
          tc * (radius ^ 2 + ⟪d - P, v - P⟫_ℝ) :=
      mul_lt_mul_of_pos_right htc hsumPos
    nlinarith [hCVhalf, hCVrep, hDVpos, hscale]


set_option maxHeartbeats 1000000 in
-- The wrapper elaborates the fan construction and metric terminal together.
/-- Source-independent wrapper used by the exact-seventeen normalization.
It constructs the positive fan parameters from convexity/cocircularity and then
applies the metric terminal. -/
theorem false_of_exactA2_boundary_data
    {A : Finset ℝ²} {P u y x v d c q : ℝ²} {radius : ℝ}
    (hA : ConvexIndep A)
    (hP_mem : P ∈ A) (hu_mem : u ∈ A) (hy_mem : y ∈ A)
    (hx_mem : x ∈ A) (hv_mem : v ∈ A) (hd_mem : d ∈ A)
    (hu_ne_P : u ≠ P) (hy_ne_P : y ≠ P) (hx_ne_P : x ≠ P)
    (hv_ne_P : v ≠ P) (hd_ne_P : d ≠ P)
    (hu_ne_y : u ≠ y) (hu_ne_x : u ≠ x)
    (hv_ne_x : v ≠ x) (hv_ne_d : v ≠ d)
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius)
    (hx_eq : dist x u = dist x y)
    (hv_eq : dist v u = dist v x)
    (hd_eq : dist d v = dist d x)
    (hc_eq : dist c v = dist c d)
    (hc_sides :
      (0 < signedArea2 v d c ∧ signedArea2 v d P < 0) ∨
      (0 < signedArea2 d v c ∧ signedArea2 d v P < 0))
    (hProw :
      dist v P = dist v u ∨
      dist x P = dist x u ∨
      dist d P = dist d v ∨
      dist c P = dist c v)
    (hqSide : signedArea2 u y d * signedArea2 u y q < 0)
    (hqRow : dist d q = dist d v) : False := by
  obtain ⟨tx, tv, td, tc, htx, htv, htd, htc,
      hxrep, hvrep, hdrep, hcrep⟩ :=
    exists_exactA2_fan_parameters hA hP_mem hu_mem hy_mem hx_mem hv_mem hd_mem
      hu_ne_P hy_ne_P hx_ne_P hv_ne_P hd_ne_P hu_ne_y hu_ne_x hv_ne_x hv_ne_d
      hradius hP_u hP_y hP_x hP_v hP_d hx_eq hv_eq hd_eq hc_eq hc_sides
  exact false_of_exactA2_fan_and_cover hradius hP_u hP_y hP_x hP_v hP_d
    htx htv htd htc hxrep hvrep hdrep hcrep hProw hqSide hqRow



end ExactA2CapMetric
end Problem97
