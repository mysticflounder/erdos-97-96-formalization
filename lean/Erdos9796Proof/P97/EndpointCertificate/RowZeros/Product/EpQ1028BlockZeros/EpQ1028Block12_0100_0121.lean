/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028TermShards.EpQ1028Block12_0100_0121

/-!
# Endpoint product-row block zero ep_Q1_028, block 12:100-121

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

/-- Checked block `12:100-121` in product-sum row `ep_Q1_028`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q1_028_block_12_0100_0121_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ1.get (Fin.mk 28 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_block_12_0100_0121 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ1028TermShards.ep_Q1_028_generator_12_0100_0121 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s2x.index EndpointVar.s2y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
              (center := .s1) (a := .s2)
              (cx := EndpointVar.s1x) (cy := EndpointVar.s1y)
              (ax := EndpointVar.s2x) (ay := EndpointVar.s2y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ1028TermShards.ep_Q1_028_block_12_0100_0121_valid ?_
  intro p hp
  simp only [Patterns.EpQ1028TermShards.ep_Q1_028_partials_12_0100_0121,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0109_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0110_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0111_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0112_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0113_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0114_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0115_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0116_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0117_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0118_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0119_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0120_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ1028TermShards.ep_Q1_028_partial_12_0121_valid
      hgenerator

end EpQ1028BlockZeros

end Variables

end EndpointCertificate

end Problem97
