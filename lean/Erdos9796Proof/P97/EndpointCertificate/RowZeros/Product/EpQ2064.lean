/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block00_0000_0001
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block01_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block01_0200_0258
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block02_0200_0257
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block03_0200_0270
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block05_0300_0355
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block06_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block06_0200_0221
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block07_0000_0041
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block08_0200_0203
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block09_0200_0248
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block10_0000_0059
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block11_0000_0047
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block12_0000_0053
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block13_0000_0057
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block14_0000_0047
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block15_0000_0039
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block16_0000_0041
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block18_0200_0250
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block19_0000_0033
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block20_0200_0258
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block22_0000_0040
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block23_0200_0273
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block24_0000_0048
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block25_0000_0047
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block26_0000_0055
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block27_0200_0272
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block28_0000_0050
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block29_0000_0053
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2064BlockZeros.EpQ2064Block30_0000_0005

/-!
# Endpoint product row-zero certificate ep_Q2_064

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_064` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_064.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_064` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_064_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 64 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_064_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2064TermShards.ep_Q2_064_block_00_0000_0001,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_01_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_01_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_01_0200_0258,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_02_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_02_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_02_0200_0257,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_03_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_03_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_03_0200_0270,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_05_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_05_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_05_0200_0299,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_05_0300_0355,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_06_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_06_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_06_0200_0221,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_07_0000_0041,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_08_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_08_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_08_0200_0203,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_09_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_09_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_09_0200_0248,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_10_0000_0059,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_11_0000_0047,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_12_0000_0053,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_13_0000_0057,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_14_0000_0047,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_15_0000_0039,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_16_0000_0041,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_18_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_18_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_18_0200_0250,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_19_0000_0033,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_20_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_20_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_20_0200_0258,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_22_0000_0040,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_23_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_23_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_23_0200_0273,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_24_0000_0048,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_25_0000_0047,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_26_0000_0055,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_27_0000_0099,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_27_0100_0199,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_27_0200_0272,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_28_0000_0050,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_29_0000_0053,
      Patterns.EpQ2064TermShards.ep_Q2_064_block_30_0000_0005
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_00_0000_0001_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_01_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_01_0200_0258_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_02_0200_0257_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_03_0200_0270_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_05_0300_0355_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_06_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_06_0200_0221_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_07_0000_0041_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_08_0200_0203_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_09_0200_0248_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_10_0000_0059_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_11_0000_0047_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_12_0000_0053_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_13_0000_0057_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_14_0000_0047_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_15_0000_0039_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_16_0000_0041_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_18_0200_0250_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_19_0000_0033_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_20_0200_0258_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_22_0000_0040_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_23_0200_0273_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_24_0000_0048_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_25_0000_0047_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_26_0000_0055_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_27_0200_0272_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_28_0000_0050_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_29_0000_0053_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2064BlockZeros.ep_Q2_064_block_30_0000_0005_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
