/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074TermShards.EpQ2074Block20_0200_0225

/-!
# Endpoint product-row block zero ep_Q2_074, block 20:200-225

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q2_074`.

Source certificate: `certificates/endpoint/ep_Q2_074.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ2074BlockZeros

/-- Checked block `20:200-225` in product-sum row `ep_Q2_074`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_074_block_20_0200_0225_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 74 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_block_20_0200_0225 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2074TermShards.ep_Q2_074_generator_20_0200_0225 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqNormFirstMinusSqDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.q1x.index EndpointVar.q1y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
              (a := .Pw) (b := .Q1)
              (ax := EndpointVar.pwx) (ay := EndpointVar.pwy)
              (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2074TermShards.ep_Q2_074_block_20_0200_0225_valid ?_
  intro p hp
  simp only [Patterns.EpQ2074TermShards.ep_Q2_074_partials_20_0200_0225,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_20_0225_valid
      hgenerator

end EpQ2074BlockZeros

end Variables

end EndpointCertificate

end Problem97
