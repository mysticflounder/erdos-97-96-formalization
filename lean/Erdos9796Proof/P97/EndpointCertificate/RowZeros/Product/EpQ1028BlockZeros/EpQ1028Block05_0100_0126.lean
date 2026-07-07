/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028TermShards.EpQ1028Block05_0100_0126

/-!
# Endpoint product-row block zero ep_Q1_028, block 5:100-126

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q1_028`.

Source certificate: `certificates/endpoint/ep_Q1_028.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ1028BlockZeros

/-- Checked block `5:100-126` in product-sum row `ep_Q1_028`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q1_028_block_05_0100_0126_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ1.get (Fin.mk 28 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_block_05_0100_0126 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ1028TermShards.ep_Q1_028_generator_05_0100_0126 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqNormDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q1x.index EndpointVar.q1y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqNormDiffPoly_eq_zero_of_metricShadow
              (a := .s3) (b := .Q1)
              (ax := EndpointVar.s3x) (ay := EndpointVar.s3y)
              (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ1028TermShards.ep_Q1_028_block_05_0100_0126_valid ?_
  intro p hp
  simp only [Patterns.EpQ1028TermShards.ep_Q1_028_partials_05_0100_0126,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0109_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0110_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0111_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0112_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0113_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0114_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0115_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0116_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0117_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0118_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0119_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0120_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0121_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0122_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0123_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0124_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0125_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_05_0126_valid
      hgenerator

end EpQ1028BlockZeros

end Variables

end EndpointCertificate

end Problem97
