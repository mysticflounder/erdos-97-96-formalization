/-
  Scratch consumer for the minimized FreshThird four-row metric motif.

  The ten indices are ordered as
    x < qOutside < freshCenter < pinnedCenter < w3 < b2 < w2 < b1 < b3 < w1.
  This file intentionally does not add a production declaration.
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# FreshThird four-row metric consumer

The theorem below is a scratch, cardinality-generic contradiction consumer for
the ten-role minimized motif.  It is intentionally kept outside the
production theorem banks while the producer and universal lift are audited.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/- The eight strict inequalities are the two `adjacentSides` forms followed
   by the six `innerOuter` forms in the replay certificate. -/
theorem false_of_freshThird_four_row_metric_motif
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {x qOutside freshCenter pinnedCenter w3 b2 w2 b1 b3 w1 : Fin n}
    (hxq : x < qOutside)
    (hqf : qOutside < freshCenter)
    (hfp : freshCenter < pinnedCenter)
    (hpw3 : pinnedCenter < w3)
    (hw3b2 : w3 < b2)
    (hb2w2 : b2 < w2)
    (hw2b1 : w2 < b1)
    (hb1b3 : b1 < b3)
    (hb3w1 : b3 < w1)
    (hb1_x_w1 : dist (phi b1) (phi x) = dist (phi b1) (phi w1))
    (hb3_pinned_w1 :
      dist (phi b3) (phi pinnedCenter) = dist (phi b3) (phi w1))
    (hb3_pinned_w3 :
      dist (phi b3) (phi pinnedCenter) = dist (phi b3) (phi w3))
    (hpinned_w3_w2 :
      dist (phi pinnedCenter) (phi w3) = dist (phi pinnedCenter) (phi w2))
    (hb2_x_w2 : dist (phi b2) (phi x) = dist (phi b2) (phi w2)) : False := by
  have hxw3 : x < w3 := by omega
  have hw3w2 : w3 < w2 := hw3b2.trans hb2w2
  have hw2w1 : w2 < w1 := hw2b1.trans (hb1b3.trans hb3w1)
  have hq_b1 : qOutside < b1 := by omega
  have hq_b3 : qOutside < b3 := by omega
  have hq_w1 : qOutside < w1 := by omega
  have hf_b1 : freshCenter < b1 := by omega
  have hf_b3 : freshCenter < b3 := by omega
  have hf_w1 : freshCenter < w1 := by omega
  have hp_b1 : pinnedCenter < b1 := by omega
  have hp_b3 : pinnedCenter < b3 := by omega
  have hp_w1 : pinnedCenter < w1 := by omega
  have hw3_b1 : w3 < b1 := by omega
  have hw3_b3 : w3 < b3 := by omega
  have hw3_w1 : w3 < w1 := by omega
  have hb2_b1 : b2 < b1 := by omega
  have hb2_b3 : b2 < b3 := by omega
  have hb2_w1 : b2 < w1 := by omega
  have hq_b2 : qOutside < b2 := by omega
  have hK₁ := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := x) (ib := w3) (ic := b2) (id := w1)
    hA hphi_inj hphi_image hccw hxw3 hw3b2 hb2_w1
  have hK₂ := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := qOutside) (ib := b1) (ic := b3) (id := w1)
    hA hphi_inj hphi_image hccw hq_b1 hb1b3 hb3w1
  have hK₃ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := x) (ib := qOutside) (ic := w3) (id := b1)
    hA hphi_inj hphi_image hccw hxq (hqf.trans (hfp.trans hpw3)) hw3_b1
  have hK₄ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := qOutside) (ib := freshCenter) (ic := b1) (id := b3)
    hA hphi_inj hphi_image hccw hqf hf_b1
      hb1b3
  have hK₅ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := qOutside) (ib := pinnedCenter) (ic := w3) (id := w2)
    hA hphi_inj hphi_image hccw (hqf.trans hfp) hpw3 hw3w2
  have hK₆ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := qOutside) (ib := b2) (ic := w2) (id := b1)
    hA hphi_inj hphi_image hccw
      hq_b2
      hb2w2 hw2b1
  have hK₇ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := freshCenter) (ib := w3) (ic := b1) (id := b3)
    hA hphi_inj hphi_image hccw
      (hfp.trans hpw3) hw3_b1 hb1b3
  have hK₈ := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := w3) (ib := b2) (ic := b1) (id := w1)
    hA hphi_inj hphi_image hccw hw3b2 hb2_b1 (hb1b3.trans hb3w1)
  have hb1' : dist (phi x) (phi b1) = dist (phi b1) (phi w1) := by
    calc
      dist (phi x) (phi b1) = dist (phi b1) (phi x) := dist_comm _ _
      _ = dist (phi b1) (phi w1) := hb1_x_w1
  have hb3_w1' : dist (phi pinnedCenter) (phi b3) = dist (phi b3) (phi w1) := by
    calc
      dist (phi pinnedCenter) (phi b3) = dist (phi b3) (phi pinnedCenter) := dist_comm _ _
      _ = dist (phi b3) (phi w1) := hb3_pinned_w1
  have hb3_w3' : dist (phi pinnedCenter) (phi b3) = dist (phi w3) (phi b3) := by
    calc
      dist (phi pinnedCenter) (phi b3) = dist (phi b3) (phi pinnedCenter) := dist_comm _ _
      _ = dist (phi b3) (phi w3) := hb3_pinned_w3
      _ = dist (phi w3) (phi b3) := dist_comm _ _
  have hpinned' : dist (phi w3) (phi pinnedCenter) = dist (phi pinnedCenter) (phi w2) := by
    calc
      dist (phi w3) (phi pinnedCenter) = dist (phi pinnedCenter) (phi w3) := dist_comm _ _
      _ = dist (phi pinnedCenter) (phi w2) := hpinned_w3_w2
  have hb2' : dist (phi x) (phi b2) = dist (phi b2) (phi w2) := by
    calc
      dist (phi x) (phi b2) = dist (phi b2) (phi x) := dist_comm _ _
      _ = dist (phi b2) (phi w2) := hb2_x_w2
  linarith

end CapCrossingKalmansonBridge
end Problem97
