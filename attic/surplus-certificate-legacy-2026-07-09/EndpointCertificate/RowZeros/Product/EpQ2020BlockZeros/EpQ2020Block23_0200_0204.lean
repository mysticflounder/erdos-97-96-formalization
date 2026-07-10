/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020TermShards.EpQ2020Block23_0200_0204

/-!
# Endpoint product-row block zero ep_Q2_020, block 23:200-204

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q2_020`.

Source certificate: `certificates/endpoint/ep_Q2_020.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ2020BlockZeros

/-- Checked block `23:200-204` in product-sum row `ep_Q2_020`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_020_block_23_0200_0204_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 20 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_block_23_0200_0204 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2020TermShards.ep_Q2_020_generator_23_0200_0204 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqNormFirstMinusSqDistPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.q2x.index EndpointVar.q2y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
              (a := .Pu) (b := .Q2)
              (ax := EndpointVar.pux) (ay := EndpointVar.puy)
              (bx := EndpointVar.q2x) (b_y := EndpointVar.q2y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2020TermShards.ep_Q2_020_block_23_0200_0204_valid ?_
  intro p hp
  simp only [Patterns.EpQ2020TermShards.ep_Q2_020_partials_23_0200_0204,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_partial_23_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_partial_23_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_partial_23_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_partial_23_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2020TermShards.ep_Q2_020_partial_23_0204_valid
      hgenerator

end EpQ2020BlockZeros

end Variables

end EndpointCertificate

end Problem97
