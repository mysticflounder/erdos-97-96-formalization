/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Two same-side centers cannot both bisect one chord

The four-point bisector-parity kill of the exact-seven role-coverage gate
(REPORT Finding 5 in `scratch/atail-force/exact7-role-coverage-gate`):
two boundary points each equidistant from the two endpoints of a chord
lie on that chord's perpendicular bisector, so they cannot BOTH sit on
one arc side of the chord of a strictly convex CCW enumeration.  The two
linear arrangements a fixed enumeration cut can present are covered:

- `..._after`: chord endpoints first, both centers after
  (`p₁ < p₂ < c₁ < c₂` — the census core shape `kal|O,s0,b0,s1`);
- `..._enclosed`: both centers strictly between the chord endpoints
  (`p₁ < c₂ < c₁ < p₂` — the census core shape `kal|O,s1,b1,s2`).

Each is one strict Kalmanson kernel plus the two radius equalities; the
substitution cancels the inequality to strict irreflexivity.  These are
the Lean terminals for the L0 landing law "the second apex is never an
outside point of both the collision row and a blocker row": the case
hypotheses supply the equalities, the Round-188 aligned order supplies
the index arrangement.
-/

open scoped EuclideanGeometry

namespace Problem97

open CapCrossingKalmansonBridge

/-- Chord endpoints `p₁ = phi i1, p₂ = phi i2`, centers `phi j1, phi j2`
after both endpoints in the CCW enumeration: the two equidistance
hypotheses are contradictory. -/
theorem false_of_two_centers_equidistant_pair_after
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i1 i2 j1 j2 : Fin A.card}
    (h12 : i1 < i2) (h2j : i2 < j1) (hjj : j1 < j2)
    (hc1 : dist (phi j1) (phi i1) = dist (phi j1) (phi i2))
    (hc2 : dist (phi j2) (phi i1) = dist (phi j2) (phi i2)) : False := by
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h2j hjj
  rw [dist_comm (phi i2) (phi j1), dist_comm (phi i1) (phi j2),
    dist_comm (phi i1) (phi j1), dist_comm (phi i2) (phi j2)] at hkal
  rw [hc1, hc2] at hkal
  exact lt_irrefl _ hkal

/-- Chord endpoints `p₁ = phi i1, p₂ = phi i2`, both centers strictly
between them in the CCW enumeration: contradictory via the complementary
kernel. -/
theorem false_of_two_centers_equidistant_pair_enclosed
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i1 k2 k1 i2 : Fin A.card}
    (h1k : i1 < k2) (hkk : k2 < k1) (hk2 : k1 < i2)
    (hc1 : dist (phi k1) (phi i1) = dist (phi k1) (phi i2))
    (hc2 : dist (phi k2) (phi i1) = dist (phi k2) (phi i2)) : False := by
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h1k hkk hk2
  rw [dist_comm (phi i1) (phi k2), dist_comm (phi i1) (phi k1)] at hkal
  rw [hc1, hc2] at hkal
  linarith

end Problem97
