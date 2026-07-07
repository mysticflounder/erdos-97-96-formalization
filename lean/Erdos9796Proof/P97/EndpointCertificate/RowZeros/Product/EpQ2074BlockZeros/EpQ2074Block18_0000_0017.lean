/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074TermShards.EpQ2074Block18_0000_0017

/-!
# Endpoint product-row block zero ep_Q2_074, block 18:0-17

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

/-- Checked block `18:0-17` in product-sum row `ep_Q2_074`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_074_block_18_0000_0017_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 74 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_block_18_0000_0017 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2074TermShards.ep_Q2_074_generator_18_0000_0017 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := twiceVarMinusOnePoly EndpointVar.pwx.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_twiceVarMinusOnePoly_eq_zero_of_metricShadow
              (a := .Pw) (ax := EndpointVar.pwx)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2074TermShards.ep_Q2_074_block_18_0000_0017_valid ?_
  intro p hp
  simp only [Patterns.EpQ2074TermShards.ep_Q2_074_partials_18_0000_0017,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2074TermShards.ep_Q2_074_partial_18_0017_valid
      hgenerator

end EpQ2074BlockZeros

end Variables

end EndpointCertificate

end Problem97
