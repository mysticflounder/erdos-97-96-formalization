/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002Block17_0200_0214

/-!
# Endpoint product-row block zero ep_Q2_002, block 17:200-214

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q2_002`.

Source certificate: `certificates/endpoint/ep_Q2_002.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ2002BlockZeros

/-- Checked block `17:200-214` in product-sum row `ep_Q2_002`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_002_block_17_0200_0214_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 2 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_block_17_0200_0214 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2002TermShards.ep_Q2_002_generator_17_0200_0214 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.s3x.index EndpointVar.s3y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
              (center := .Pu) (a := .s3)
              (cx := EndpointVar.pux) (cy := EndpointVar.puy)
              (ax := EndpointVar.s3x) (ay := EndpointVar.s3y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2002TermShards.ep_Q2_002_block_17_0200_0214_valid ?_
  intro p hp
  simp only [Patterns.EpQ2002TermShards.ep_Q2_002_partials_17_0200_0214,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2002TermShards.ep_Q2_002_partial_17_0214_valid
      hgenerator

end EpQ2002BlockZeros

end Variables

end EndpointCertificate

end Problem97
