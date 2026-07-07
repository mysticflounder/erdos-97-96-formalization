/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041Block11_0600_0660

/-!
# Endpoint product-row block zero ep_Q2_041, block 11:600-660

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q2_041`.

Source certificate: `certificates/endpoint/ep_Q2_041.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ2041BlockZeros

/-- Checked block `11:600-660` in product-sum row `ep_Q2_041`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_041_block_11_0600_0660_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 41 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0600_0660 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2041TermShards.ep_Q2_041_generator_11_0600_0660 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqDistToCenterDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
              (center := .s1) (a := .u)
              (b := .s3)
              (cx := EndpointVar.s1x) (cy := EndpointVar.s1y)
              (ax := EndpointVar.ux) (ay := EndpointVar.uy)
              (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0600_0660_valid ?_
  intro p hp
  simp only [Patterns.EpQ2041TermShards.ep_Q2_041_partials_11_0600_0660,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0600_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0601_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0602_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0603_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0604_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0605_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0606_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0607_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0608_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0609_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0610_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0611_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0612_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0613_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0614_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0615_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0616_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0617_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0618_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0619_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0620_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0621_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0622_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0623_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0624_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0625_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0626_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0627_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0628_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0629_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0630_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0631_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0632_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0633_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0634_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0635_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0636_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0637_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0638_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0639_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0640_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0641_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0642_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0643_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0644_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0645_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0646_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0647_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0648_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0649_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0650_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0651_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0652_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0653_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0654_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0655_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0656_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0657_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0658_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0659_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2041TermShards.ep_Q2_041_partial_11_0660_valid
      hgenerator

end EpQ2041BlockZeros

end Variables

end EndpointCertificate

end Problem97
