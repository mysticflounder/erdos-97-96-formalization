/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.SurplusCOMPGBankSep
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Finite three-fan order and metric terminals

This module isolates the source-neutral D–R layer for the three shared-pair
separation pattern.  The requested two-orbit order classifier is not included:
with the current linear `btw` relation, `x=1, b=3, c=2, y=4, d=5, z=6`
satisfies the three separation facts but has order `A<X<C<B<Y<D<Z`, outside
those two orbits.  The metric terminal below is independent of that API and
consumes two strict Kalmanson inequalities.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ColoredPaleyThreeFan

/-- Crossed-orbit metric terminal for the order `A<X<B<C<Z<D<Y`.

The first Kalmanson inequality is applied to `A<B<Z<Y` and the second to
`X<B<C<Z`.  The supplied distance equalities reduce them to opposite strict
inequalities between `d(A,Z)` and `d(B,Z)`. -/
theorem false_of_crossed_threeFan_metric
    {A : Finset ℝ²} {n : ℕ} {phi : Fin n → ℝ²}
    (hA : ConvexIndep A)
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a x b c z d y : Fin n}
    (hax : a < x) (hxb : x < b) (hbc : b < c)
    (hcz : c < z) (hzd : z < d) (hdy : d < y)
    (hEqualities :
      dist (phi x) (phi a) = dist (phi x) (phi b) ∧
      dist (phi x) (phi b) = dist (phi x) (phi c) ∧
      dist (phi y) (phi a) = dist (phi y) (phi b) ∧
      dist (phi y) (phi b) = dist (phi y) (phi d) ∧
      dist (phi z) (phi a) = dist (phi z) (phi c) ∧
      dist (phi z) (phi c) = dist (phi z) (phi d)) : False := by
  rcases hEqualities with ⟨_, hxc, hya, _, hza, _⟩
  have hK₁ :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hA hphi_inj hphi_image hccw (ia := a) (ib := b) (ic := z) (id := y)
      (hax.trans hxb) (hbc.trans hcz) (hzd.trans hdy)
  have hK₂ :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      hA hphi_inj hphi_image hccw (ia := x) (ib := b) (ic := c) (id := z)
      hxb hbc hcz
  have hya' : dist (phi a) (phi y) = dist (phi b) (phi y) := by
    simpa only [dist_comm] using hya
  have hza' : dist (phi a) (phi z) = dist (phi c) (phi z) := by
    simpa only [dist_comm] using hza
  have hK₁' : dist (phi b) (phi z) < dist (phi a) (phi z) := by
    linarith
  have hxc' : dist (phi x) (phi b) = dist (phi x) (phi c) := hxc
  have hza'' : dist (phi c) (phi z) = dist (phi a) (phi z) := hza'.symm
  have hK₂' : dist (phi a) (phi z) < dist (phi b) (phi z) := by
    linarith
  exact (not_lt_of_ge (le_of_lt hK₂')) hK₁'

end ColoredPaleyThreeFan
end Problem97
