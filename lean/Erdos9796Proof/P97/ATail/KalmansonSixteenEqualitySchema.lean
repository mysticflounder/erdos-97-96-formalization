/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Sixteen-equality Kalmanson contradiction

This module packages a fixed linear consequence of ten strict Kalmanson inequalities as a
reusable general-cardinality theorem.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- The main strict Kalmanson inequality, transported to four vertices presented
in decreasing boundary-index order. -/
private theorem dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ib) (phi ic) + dist (phi ia) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (dist_add_dist_lt_diagonal_sum_of_ccw (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

/-- The complementary strict Kalmanson inequality, transported to four vertices
presented in decreasing boundary-index order. -/
private theorem complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ia) (phi ib) + dist (phi ic) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

/-- Fourteen points in the indicated strictly increasing CCW boundary order cannot satisfy the
sixteen-equality signature
`a1t1=a1p1, a1t1=a1p2, a1t3=a1q2, a1t4=a1s2, a1r1=a1r2, a1r1=a1s4,
a1t4=t4t2, a1t4=t4r1, a1t4=t4s2, t2t3=t2a2, t2t3=t2p1, t4t1=t1s4,
t2t3=t3a2, t4p2=p2q2, a1q2=p2q2, t1s4=r2s4`.

The proof combines the eight main Kalmanson inequalities on quadruples
`(a1,t4,t2,t1)`, `(a1,t4,p2,q2)`, `(a1,t4,q2,r2)`, `(a1,t4,r2,p1)`,
`(a1,t4,p1,q1)`, `(a1,t4,q1,r1)`, `(a1,t4,s4,s2)`, `(a1,t2,t3,p1)` and the
two complementary inequalities on `(a1,t4,r2,s4)` and `(a1,t2,t3,a2)`. -/
theorem false_of_fourteen_ccw_sixteen_shell_equalities_global_core_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a1 t4 t2 t1 t3 a2 p2 q2 r2 p1 q1 r1 s4 s2 : Fin n}
    (ha1t4 : a1 < t4) (ht4t2 : t4 < t2) (ht2t1 : t2 < t1)
    (ht1t3 : t1 < t3) (ht3a2 : t3 < a2) (ha2p2 : a2 < p2)
    (hp2q2 : p2 < q2) (hq2r2 : q2 < r2) (hr2p1 : r2 < p1)
    (hp1q1 : p1 < q1) (hq1r1 : q1 < r1) (hr1s4 : r1 < s4)
    (hs4s2 : s4 < s2)
    (ha1t1_a1p1 : dist (phi a1) (phi t1) = dist (phi a1) (phi p1))
    (ha1t1_a1p2 : dist (phi a1) (phi t1) = dist (phi a1) (phi p2))
    (ha1t3_a1q2 : dist (phi a1) (phi t3) = dist (phi a1) (phi q2))
    (ha1t4_a1s2 : dist (phi a1) (phi t4) = dist (phi a1) (phi s2))
    (ha1r1_a1r2 : dist (phi a1) (phi r1) = dist (phi a1) (phi r2))
    (ha1r1_a1s4 : dist (phi a1) (phi r1) = dist (phi a1) (phi s4))
    (ha1t4_t4t2 : dist (phi a1) (phi t4) = dist (phi t4) (phi t2))
    (ha1t4_t4r1 : dist (phi a1) (phi t4) = dist (phi t4) (phi r1))
    (ha1t4_t4s2 : dist (phi a1) (phi t4) = dist (phi t4) (phi s2))
    (ht2t3_t2a2 : dist (phi t2) (phi t3) = dist (phi t2) (phi a2))
    (ht2t3_t2p1 : dist (phi t2) (phi t3) = dist (phi t2) (phi p1))
    (ht4t1_t1s4 : dist (phi t4) (phi t1) = dist (phi t1) (phi s4))
    (ht2t3_t3a2 : dist (phi t2) (phi t3) = dist (phi t3) (phi a2))
    (ht4p2_p2q2 : dist (phi t4) (phi p2) = dist (phi p2) (phi q2))
    (ha1q2_p2q2 : dist (phi a1) (phi q2) = dist (phi p2) (phi q2))
    (ht1s4_r2s4 : dist (phi t1) (phi s4) = dist (phi r2) (phi s4)) :
    False := by
  have hmain_t2_t1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := t2) (id := t1)
      hA hphi_inj hphi_image hccw
      ha1t4 ht4t2 ht2t1
  have hmain_p2_q2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := p2) (id := q2)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hp2q2
  have hmain_q2_r2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := q2) (id := r2)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hq2r2
  have hmain_r2_p1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := r2) (id := p1)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hr2p1
  have hcomp_r2_s4 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := a1) (ib := t4) (ic := r2) (id := s4) hA hphi_inj hphi_image hccw
      ha1t4 (by omega) (by omega)
  have hmain_p1_q1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := p1) (id := q1)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hp1q1
  have hmain_q1_r1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := q1) (id := r1)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hq1r1
  have hmain_s4_s2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t4) (ic := s4) (id := s2)
      hA hphi_inj hphi_image hccw
      ha1t4 (by omega) hs4s2
  have hcomp_t3_a2 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := a1) (ib := t2) (ic := t3) (id := a2) hA hphi_inj hphi_image hccw
      (by omega) (by omega) ht3a2
  have hmain_t3_p1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (ia := a1) (ib := t2) (ic := t3) (id := p1)
      hA hphi_inj hphi_image hccw
      (by omega) (by omega) (by omega)
  linarith

/-- The reflected-order companion to
`false_of_fourteen_ccw_sixteen_shell_equalities_global_core_of_increasing`.
It uses the same sixteen metric equalities, with the fourteen roles strictly
decreasing in the direct schema order. -/
theorem false_of_fourteen_ccw_sixteen_shell_equalities_global_core_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a1 t4 t2 t1 t3 a2 p2 q2 r2 p1 q1 r1 s4 s2 : Fin n}
    (hs2s4 : s2 < s4) (hs4r1 : s4 < r1) (hr1q1 : r1 < q1)
    (hq1p1 : q1 < p1) (hp1r2 : p1 < r2) (hr2q2 : r2 < q2)
    (hq2p2 : q2 < p2) (hp2a2 : p2 < a2) (ha2t3 : a2 < t3)
    (ht3t1 : t3 < t1) (ht1t2 : t1 < t2) (ht2t4 : t2 < t4)
    (ht4a1 : t4 < a1)
    (ha1t1_a1p1 : dist (phi a1) (phi t1) = dist (phi a1) (phi p1))
    (ha1t1_a1p2 : dist (phi a1) (phi t1) = dist (phi a1) (phi p2))
    (ha1t3_a1q2 : dist (phi a1) (phi t3) = dist (phi a1) (phi q2))
    (ha1t4_a1s2 : dist (phi a1) (phi t4) = dist (phi a1) (phi s2))
    (ha1r1_a1r2 : dist (phi a1) (phi r1) = dist (phi a1) (phi r2))
    (ha1r1_a1s4 : dist (phi a1) (phi r1) = dist (phi a1) (phi s4))
    (ha1t4_t4t2 : dist (phi a1) (phi t4) = dist (phi t4) (phi t2))
    (ha1t4_t4r1 : dist (phi a1) (phi t4) = dist (phi t4) (phi r1))
    (ha1t4_t4s2 : dist (phi a1) (phi t4) = dist (phi t4) (phi s2))
    (ht2t3_t2a2 : dist (phi t2) (phi t3) = dist (phi t2) (phi a2))
    (ht2t3_t2p1 : dist (phi t2) (phi t3) = dist (phi t2) (phi p1))
    (ht4t1_t1s4 : dist (phi t4) (phi t1) = dist (phi t1) (phi s4))
    (ht2t3_t3a2 : dist (phi t2) (phi t3) = dist (phi t3) (phi a2))
    (ht4p2_p2q2 : dist (phi t4) (phi p2) = dist (phi p2) (phi q2))
    (ha1q2_p2q2 : dist (phi a1) (phi q2) = dist (phi p2) (phi q2))
    (ht1s4_r2s4 : dist (phi t1) (phi s4) = dist (phi r2) (phi s4)) :
    False := by
  have hmain_t2_t1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := t2) (id := t1)
      hA hphi_inj hphi_image hccw ht4a1 ht2t4 ht1t2
  have hmain_p2_q2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := p2) (id := q2)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hq2p2
  have hmain_q2_r2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := q2) (id := r2)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hr2q2
  have hmain_r2_p1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := r2) (id := p1)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hp1r2
  have hcomp_r2_s4 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := r2) (id := s4)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) (by omega)
  have hmain_p1_q1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := p1) (id := q1)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hq1p1
  have hmain_q1_r1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := q1) (id := r1)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hr1q1
  have hmain_s4_s2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t4) (ic := s4) (id := s2)
      hA hphi_inj hphi_image hccw ht4a1 (by omega) hs2s4
  have hcomp_t3_a2 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t2) (ic := t3) (id := a2)
      hA hphi_inj hphi_image hccw (by omega) (by omega) ha2t3
  have hmain_t3_p1 :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      (ia := a1) (ib := t2) (ic := t3) (id := p1)
      hA hphi_inj hphi_image hccw (by omega) (by omega) (by omega)
  linarith

/-- Fourteen points in either orientation of the schema's cyclic order cannot
satisfy its sixteen-equality signature. The disjunction is the interface used
after choosing a cyclic cut: the first branch is the direct CCW-index order and
the second is its reflection. -/
theorem false_of_fourteen_ccw_sixteen_shell_equalities_global_core
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a1 t4 t2 t1 t3 a2 p2 q2 r2 p1 q1 r1 s4 s2 : Fin n}
    (horder :
      (a1 < t4 ∧ t4 < t2 ∧ t2 < t1 ∧ t1 < t3 ∧ t3 < a2 ∧ a2 < p2 ∧
        p2 < q2 ∧ q2 < r2 ∧ r2 < p1 ∧ p1 < q1 ∧ q1 < r1 ∧ r1 < s4 ∧ s4 < s2) ∨
      (s2 < s4 ∧ s4 < r1 ∧ r1 < q1 ∧ q1 < p1 ∧ p1 < r2 ∧ r2 < q2 ∧
        q2 < p2 ∧ p2 < a2 ∧ a2 < t3 ∧ t3 < t1 ∧ t1 < t2 ∧ t2 < t4 ∧ t4 < a1))
    (ha1t1_a1p1 : dist (phi a1) (phi t1) = dist (phi a1) (phi p1))
    (ha1t1_a1p2 : dist (phi a1) (phi t1) = dist (phi a1) (phi p2))
    (ha1t3_a1q2 : dist (phi a1) (phi t3) = dist (phi a1) (phi q2))
    (ha1t4_a1s2 : dist (phi a1) (phi t4) = dist (phi a1) (phi s2))
    (ha1r1_a1r2 : dist (phi a1) (phi r1) = dist (phi a1) (phi r2))
    (ha1r1_a1s4 : dist (phi a1) (phi r1) = dist (phi a1) (phi s4))
    (ha1t4_t4t2 : dist (phi a1) (phi t4) = dist (phi t4) (phi t2))
    (ha1t4_t4r1 : dist (phi a1) (phi t4) = dist (phi t4) (phi r1))
    (ha1t4_t4s2 : dist (phi a1) (phi t4) = dist (phi t4) (phi s2))
    (ht2t3_t2a2 : dist (phi t2) (phi t3) = dist (phi t2) (phi a2))
    (ht2t3_t2p1 : dist (phi t2) (phi t3) = dist (phi t2) (phi p1))
    (ht4t1_t1s4 : dist (phi t4) (phi t1) = dist (phi t1) (phi s4))
    (ht2t3_t3a2 : dist (phi t2) (phi t3) = dist (phi t3) (phi a2))
    (ht4p2_p2q2 : dist (phi t4) (phi p2) = dist (phi p2) (phi q2))
    (ha1q2_p2q2 : dist (phi a1) (phi q2) = dist (phi p2) (phi q2))
    (ht1s4_r2s4 : dist (phi t1) (phi s4) = dist (phi r2) (phi s4)) :
    False := by
  rcases horder with horder | horder
  · rcases horder with
      ⟨ha1t4, ht4t2, ht2t1, ht1t3, ht3a2, ha2p2, hp2q2,
        hq2r2, hr2p1, hp1q1, hq1r1, hr1s4, hs4s2⟩
    exact false_of_fourteen_ccw_sixteen_shell_equalities_global_core_of_increasing
      hA hphi_inj hphi_image hccw
      ha1t4 ht4t2 ht2t1 ht1t3 ht3a2 ha2p2 hp2q2 hq2r2 hr2p1 hp1q1 hq1r1 hr1s4 hs4s2
      ha1t1_a1p1 ha1t1_a1p2 ha1t3_a1q2 ha1t4_a1s2 ha1r1_a1r2 ha1r1_a1s4
      ha1t4_t4t2 ha1t4_t4r1 ha1t4_t4s2 ht2t3_t2a2 ht2t3_t2p1 ht4t1_t1s4
      ht2t3_t3a2 ht4p2_p2q2 ha1q2_p2q2 ht1s4_r2s4
  · rcases horder with
      ⟨hs2s4, hs4r1, hr1q1, hq1p1, hp1r2, hr2q2, hq2p2,
        hp2a2, ha2t3, ht3t1, ht1t2, ht2t4, ht4a1⟩
    exact false_of_fourteen_ccw_sixteen_shell_equalities_global_core_of_decreasing
      hA hphi_inj hphi_image hccw
      hs2s4 hs4r1 hr1q1 hq1p1 hp1r2 hr2q2 hq2p2 hp2a2 ha2t3 ht3t1 ht1t2 ht2t4 ht4a1
      ha1t1_a1p1 ha1t1_a1p2 ha1t3_a1q2 ha1t4_a1s2 ha1r1_a1r2 ha1r1_a1s4
      ha1t4_t4t2 ha1t4_t4r1 ha1t4_t4s2 ht2t3_t2a2 ht2t3_t2p1 ht4t1_t1s4
      ht2t3_t3a2 ht4p2_p2q2 ha1q2_p2q2 ht1s4_r2s4

end CapCrossingKalmansonBridge
end Problem97
