/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054TermShards.EpQ2054Block07_0200_0236

/-!
# Endpoint product-row block zero ep_Q2_054, block 7:200-236

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum endpoint certificate row `ep_Q2_054`.

Source certificate: `certificates/endpoint/ep_Q2_054.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

namespace EpQ2054BlockZeros

/-- Checked block `7:200-236` in product-sum row `ep_Q2_054`
evaluates to zero under a metric interpretation of the row shadow. -/
theorem ep_Q2_054_block_07_0200_0236_eval_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 54 (by decide))).toShadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_block_07_0200_0236 = 0 := by
  have hgenerator :
      evalPoly (endpointS1S3Assignment pointOf)
        Patterns.EpQ2054TermShards.ep_Q2_054_generator_07_0200_0236 = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
          (endpointS1S3Assignment pointOf) (q := sqDistToUnitXDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index)
          (by native_decide)
          (by
            exact evalPoly_endpoint_sqDistToUnitXDiffPoly_eq_zero_of_metricShadow
              (a := .u) (b := .Q1)
              (ax := EndpointVar.ux) (ay := EndpointVar.uy)
              (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
              hmetric
              (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval]) (by simp [endpointS1S3Assignment, EndpointVar.eval])
              (by decide) (by decide))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointS1S3Assignment pointOf)
    Patterns.EpQ2054TermShards.ep_Q2_054_block_07_0200_0236_valid ?_
  intro p hp
  simp only [Patterns.EpQ2054TermShards.ep_Q2_054_partials_07_0200_0236,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0226_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0227_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0228_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0229_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0230_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0231_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0232_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0233_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0234_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0235_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointS1S3Assignment pointOf)
      Patterns.EpQ2054TermShards.ep_Q2_054_partial_07_0236_valid
      hgenerator

end EpQ2054BlockZeros

end Variables

end EndpointCertificate

end Problem97
