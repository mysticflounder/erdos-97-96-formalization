/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.SurplusCOMPGBankSep
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Three-fan cyclic order and crossed metric terminal

This module contains the source-neutral finite order layer for the three
shared-pair separations, together with the crossed-orbit metric obstruction.
The finite statements are normalized by cutting at `A = 0` in `Fin 7`; the
six orbit disjuncts retain both order orientations and the natural `S3`
renaming of the three fan points.  The metric statement is independent of
that normalization and consumes the existing strict Kalmanson inequalities.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ColoredPaleyThreeFanOrderMetric

abbrev ThreeFanPos := Fin 7

set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 1000000
attribute [local instance] Fintype.decidableForallFintype
  Fintype.decidableExistsFintype

/-- Separation of the two points in a shared pair at the first center. -/
abbrev threeFanSep (a b x y : ThreeFanPos) : Prop :=
  SurplusCOMPGBank.btw a b x ↔ ¬ SurplusCOMPGBank.btw a b y

instance (a b x y : ThreeFanPos) : Decidable (threeFanSep a b x y) := by
  unfold threeFanSep
  infer_instance

/-- Pairwise distinctness of the displayed named positions. -/
abbrev threeFanAllDistinct (xs : List ThreeFanPos) : Prop :=
  xs.Pairwise (fun x y ↦ x ≠ y)

instance (xs : List ThreeFanPos) : Decidable (threeFanAllDistinct xs) := by
  unfold threeFanAllDistinct
  exact List.instDecidablePairwise xs

/-- One of the two forward normalized orders, with the apex at `0`. -/
abbrev threeFanOrder₁ (x b c y d z : ThreeFanPos) : Prop :=
  0 < x ∧ x < b ∧ b < c ∧ c < y ∧ y < d ∧ d < z

/-- The other forward normalized order, with the apex at `0`. -/
abbrev threeFanOrder₂ (x b c y d z : ThreeFanPos) : Prop :=
  0 < x ∧ x < b ∧ b < c ∧ c < z ∧ z < d ∧ d < y

abbrev threeFanReverseOrder₁ (x b c y d z : ThreeFanPos) : Prop :=
  0 < z ∧ z < d ∧ d < y ∧ y < c ∧ c < b ∧ b < x

abbrev threeFanReverseOrder₂ (x b c y d z : ThreeFanPos) : Prop :=
  0 < y ∧ y < d ∧ d < z ∧ z < c ∧ c < b ∧ b < x

instance (x b c y d z : ThreeFanPos) :
    Decidable (threeFanOrder₁ x b c y d z) := by
  unfold threeFanOrder₁
  infer_instance

instance (x b c y d z : ThreeFanPos) :
    Decidable (threeFanOrder₂ x b c y d z) := by
  unfold threeFanOrder₂
  infer_instance

instance (x b c y d z : ThreeFanPos) :
    Decidable (threeFanReverseOrder₁ x b c y d z) := by
  unfold threeFanReverseOrder₁
  infer_instance

instance (x b c y d z : ThreeFanPos) :
    Decidable (threeFanReverseOrder₂ x b c y d z) := by
  unfold threeFanReverseOrder₂
  infer_instance

/-- The two representatives and their reversals under the `S3` action on
`(X,Y,Z)`, with `(B,C,D) = (XY,XZ,YZ)`. -/
abbrev threeFanOrbit (x b c y d z : ThreeFanPos) : Prop :=
  ((threeFanOrder₁ x b c y d z ∨ threeFanOrder₂ x b c y d z ∨
      threeFanReverseOrder₁ x b c y d z ∨
      threeFanReverseOrder₂ x b c y d z) ∨
    (threeFanOrder₁ x c b z d y ∨ threeFanOrder₂ x c b z d y ∨
      threeFanReverseOrder₁ x c b z d y ∨
      threeFanReverseOrder₂ x c b z d y) ∨
    (threeFanOrder₁ y b d x c z ∨ threeFanOrder₂ y b d x c z ∨
      threeFanReverseOrder₁ y b d x c z ∨
      threeFanReverseOrder₂ y b d x c z) ∨
    (threeFanOrder₁ y d b z c x ∨ threeFanOrder₂ y d b z c x ∨
      threeFanReverseOrder₁ y d b z c x ∨
      threeFanReverseOrder₂ y d b z c x) ∨
    (threeFanOrder₁ z c d x b y ∨ threeFanOrder₂ z c d x b y ∨
      threeFanReverseOrder₁ z c d x b y ∨
      threeFanReverseOrder₂ z c d x b y) ∨
    (threeFanOrder₁ z d c y b x ∨ threeFanOrder₂ z d c y b x ∨
      threeFanReverseOrder₁ z d c y b x ∨
      threeFanReverseOrder₂ z d c y b x))

instance (x b c y d z : ThreeFanPos) :
    Decidable (threeFanOrbit x b c y d z) := by
  unfold threeFanOrbit
  infer_instance

/-- All-distinct three-fan separations have exactly the two orbit types,
up to reversal and permutation of `(X,Y,Z)`. -/
theorem threeFan_separation_order_classifier :
    ∀ x b c y d z : ThreeFanPos,
      threeFanAllDistinct [0, x, b, c, y, d, z] →
      threeFanSep 0 b x y → threeFanSep 0 c x z →
      threeFanSep 0 d y z →
      threeFanOrbit x b c y d z := by
  decide

abbrev threeFanOneCrossOrder₁ (x b c y z : ThreeFanPos) : Prop :=
  0 < y ∧ y < b ∧ b < x ∧ x < c ∧ c < z

abbrev threeFanOneCrossOrder₂ (x b c y z : ThreeFanPos) : Prop :=
  0 < z ∧ z < c ∧ c < x ∧ x < b ∧ b < y

/-- If the sole alias is `X = D`, the six remaining named positions have the
order `A,Y,B,D,C,Z`, up to reversal. -/
theorem threeFan_one_cross_alias_order_classifier :
    ∀ x b c y z : ThreeFanPos,
      threeFanAllDistinct [0, y, b, x, c, z] →
      threeFanSep 0 b x y → threeFanSep 0 c x z →
      threeFanSep 0 x y z →
  threeFanOneCrossOrder₁ x b c y z ∨
        threeFanOneCrossOrder₂ x b c y z := by
  decide

/-- Any two of `X = D`, `Y = C`, and `Z = B` contradict the three
separation facts, even after retaining distinctness of the other names. -/
theorem threeFan_two_cross_aliases_false :
    ∀ x b c y d z : ThreeFanPos,
      ((x = d ∧ y = c ∧ threeFanAllDistinct [0, x, b, c, z]) ∨
        (x = d ∧ z = b ∧ threeFanAllDistinct [0, x, c, y, b]) ∨
        (y = c ∧ z = b ∧ threeFanAllDistinct [0, x, c, y, d])) →
      threeFanSep 0 b x y → threeFanSep 0 c x z →
      threeFanSep 0 d y z → False := by
  decide

/-- The crossed representative `A<X<B<C<Z<D<Y` is impossible when
`XA=XB=XC`, `YA=YB=YD`, and `ZA=ZC=ZD`. -/
theorem false_of_crossed_threeFan_metric
    {A : Finset ℝ²} {n : ℕ} {phi : Fin n → ℝ²}
    (hA : ConvexIndep A)
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a x b c z d y : Fin n}
    (hax : a < x) (hxb : x < b) (hbc : b < c)
    (hcz : c < z) (hzd : z < d) (hdy : d < y)
    (_hxa : dist (phi x) (phi a) = dist (phi x) (phi b))
    (hxc : dist (phi x) (phi b) = dist (phi x) (phi c))
    (hya : dist (phi y) (phi a) = dist (phi y) (phi b))
    (_hyd : dist (phi y) (phi b) = dist (phi y) (phi d))
    (hza : dist (phi z) (phi a) = dist (phi z) (phi c))
    (_hzd' : dist (phi z) (phi c) = dist (phi z) (phi d)) : False := by
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
  have hza'' : dist (phi c) (phi z) = dist (phi a) (phi z) := hza'.symm
  have hK₂' : dist (phi a) (phi z) < dist (phi b) (phi z) := by
    linarith
  exact (not_lt_of_ge (le_of_lt hK₂')) hK₁'

end ColoredPaleyThreeFanOrderMetric
end Problem97
