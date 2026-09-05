import Erdos9796Proof.P97.CGN.CGN6

/-! Diagnostic inner-product transport prototype for the exact-five source bridge. -/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97.CGN

/-- Diagnostic bridge: global distance scaling transports inner products. -/
theorem SimilarityTransportData.inner_eq_scale_sq
    {T : ℝ² → ℝ²} (tau : SimilarityTransportData T)
    (c q w : ℝ²) :
    inner ℝ (T q - T c) (T w - T c)
      = tau.scale ^ 2 * inner ℝ (q - c) (w - c) := by
  have hqc : ‖T q - T c‖ = tau.scale * ‖q - c‖ := by
    simpa [dist_eq_norm] using tau.dist_image q c
  have hwc : ‖T w - T c‖ = tau.scale * ‖w - c‖ := by
    simpa [dist_eq_norm] using tau.dist_image w c
  have hqw : ‖T q - T w‖ = tau.scale * ‖q - w‖ := by
    simpa [dist_eq_norm] using tau.dist_image q w
  have hqc_sq := congrArg (fun z : ℝ => z ^ 2) hqc
  have hwc_sq := congrArg (fun z : ℝ => z ^ 2) hwc
  have hqw_sq := congrArg (fun z : ℝ => z ^ 2) hqw
  ring_nf at hqc_sq hwc_sq hqw_sq
  have hleft := norm_sub_sq_real (T q - T c) (T w - T c)
  have hright := norm_sub_sq_real (q - c) (w - c)
  have hsubL : (T q - T c) - (T w - T c) = T q - T w := by abel
  have hsubR : (q - c) - (w - c) = q - w := by abel
  rw [hsubL] at hleft
  rw [hsubR] at hright
  nlinarith [hleft, hright]

/-- Positive similarity scale preserves strict positivity at the chosen apex. -/
theorem SimilarityTransportData.inner_pos_image
    {T : ℝ² → ℝ²} (tau : SimilarityTransportData T)
    (c q w : ℝ²) :
    0 < inner ℝ (T q - T c) (T w - T c) ↔
      0 < inner ℝ (q - c) (w - c) := by
  rw [tau.inner_eq_scale_sq]
  exact mul_pos_iff_of_pos_left (sq_pos_of_pos tau.scale_pos)

end Problem97.CGN

#print axioms Problem97.CGN.SimilarityTransportData.inner_eq_scale_sq
#print axioms Problem97.CGN.SimilarityTransportData.inner_pos_image
