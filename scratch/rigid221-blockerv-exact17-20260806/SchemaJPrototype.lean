import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

open scoped EuclideanGeometry

namespace Problem97.CapCrossingKalmansonBridge

example
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (heab : dist (phi e) (phi a) = dist (phi e) (phi b))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK1_bcdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd (hde.trans hef)
  simp only [dist_comm] at habd hbac heab hfcd hK2_abde hK1_bcdf
  linarith

example
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (heab : dist (phi e) (phi a) = dist (phi e) (phi b))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := e) (ib := d) (ic := b) (id := a)
    hA hphi_inj hphi_image hccw hed (hdc.trans hcb) hba
  have hK1_bcdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := f) (ib := d) (ic := c) (id := b)
    hA hphi_inj hphi_image hccw (hfe.trans hed) hdc hcb
  simp only [dist_comm] at habd hbac heab hfcd hK2_abde hK1_bcdf
  linarith

end Problem97.CapCrossingKalmansonBridge
