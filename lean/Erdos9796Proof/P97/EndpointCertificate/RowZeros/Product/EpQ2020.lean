/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block00_0000_0037
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block01_0000_0062
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block02_0100_0136
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block03_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block03_0300_0376
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block04_0400_0401
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block05_0200_0209
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block06_0000_0034
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block07_0000_0046
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block08_0000_0077
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block09_0000_0053
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block10_0000_0051
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block11_0000_0025
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block12_0000_0034
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block13_0000_0030
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block14_0000_0027
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block15_0000_0041
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block16_0000_0000
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block17_0000_0051
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block18_0000_0064
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block19_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block19_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block19_0300_0350
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block20_0000_0029
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block21_0600_0693
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block22_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block22_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block22_0300_0376
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block23_0200_0204
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block24_0000_0013
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block25_0000_0029
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block26_0000_0038
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block27_0000_0039
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block28_0000_0055
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block29_0000_0052
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2020BlockZeros.EpQ2020Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q2_020

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_020` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_020.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_020` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_020_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 20 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_020_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2020TermShards.ep_Q2_020_block_00_0000_0037,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_01_0000_0062,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_02_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_02_0100_0136,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_03_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_03_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_03_0200_0299,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_03_0300_0376,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_04_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_04_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_04_0200_0299,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_04_0300_0399,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_04_0400_0401,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_05_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_05_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_05_0200_0209,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_06_0000_0034,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_07_0000_0046,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_08_0000_0077,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_09_0000_0053,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_10_0000_0051,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_11_0000_0025,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_12_0000_0034,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_13_0000_0030,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_14_0000_0027,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_15_0000_0041,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_16_0000_0000,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_17_0000_0051,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_18_0000_0064,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_19_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_19_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_19_0200_0299,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_19_0300_0350,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_20_0000_0029,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0200_0299,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0300_0399,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0400_0499,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0500_0599,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_21_0600_0693,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_22_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_22_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_22_0200_0299,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_22_0300_0376,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_23_0000_0099,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_23_0100_0199,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_23_0200_0204,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_24_0000_0013,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_25_0000_0029,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_26_0000_0038,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_27_0000_0039,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_28_0000_0055,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_29_0000_0052,
      Patterns.EpQ2020TermShards.ep_Q2_020_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_00_0000_0037_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_01_0000_0062_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_02_0100_0136_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_03_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_03_0300_0376_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_04_0400_0401_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_05_0200_0209_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_06_0000_0034_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_07_0000_0046_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_08_0000_0077_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_09_0000_0053_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_10_0000_0051_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_11_0000_0025_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_12_0000_0034_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_13_0000_0030_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_14_0000_0027_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_15_0000_0041_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_16_0000_0000_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_17_0000_0051_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_18_0000_0064_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_19_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_19_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_19_0300_0350_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_20_0000_0029_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_21_0600_0693_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_22_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_22_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_22_0300_0376_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_23_0200_0204_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_24_0000_0013_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_25_0000_0029_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_26_0000_0038_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_27_0000_0039_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_28_0000_0055_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_29_0000_0052_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2020BlockZeros.ep_Q2_020_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
