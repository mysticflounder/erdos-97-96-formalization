/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block01_0100_0111
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block02_0100_0111
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block03_0100_0125
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block04_0100_0114
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block05_0100_0126
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block06_0100_0133
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block07_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block07_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block08_0100_0104
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block09_0300_0378
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block10_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block11_0000_0091
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block12_0100_0121
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block13_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block13_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block14_0000_0004
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block15_0100_0118
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block16_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block17_0000_0005
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block18_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block18_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block18_0400_0428
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block19_0100_0136
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block20_0100_0111
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block21_0100_0114
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block22_0000_0068
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block23_0100_0133
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block24_0000_0001
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block25_0000_0096
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block26_0000_0023
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block27_0100_0109
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block28_0100_0107
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block29_0000_0009
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1028BlockZeros.EpQ1028Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q1_028

This generated module proves that every checked block in product-sum endpoint
row `ep_Q1_028` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q1_028.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q1_028` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q1_028_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ1.get (Fin.mk 28 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q1_028_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ1028TermShards.ep_Q1_028_block_01_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_01_0100_0111,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_02_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_02_0100_0111,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_03_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_03_0100_0125,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_04_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_04_0100_0114,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_05_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_05_0100_0126,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_06_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_06_0100_0133,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_07_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_07_0100_0119,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_08_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_08_0100_0104,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_09_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_09_0100_0199,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_09_0200_0299,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_09_0300_0378,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_10_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_10_0100_0119,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_11_0000_0091,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_12_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_12_0100_0121,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_13_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_13_0100_0119,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_14_0000_0004,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_15_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_15_0100_0118,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_16_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_16_0100_0119,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_17_0000_0005,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_18_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_18_0100_0199,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_18_0200_0299,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_18_0300_0399,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_18_0400_0428,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_19_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_19_0100_0136,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_20_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_20_0100_0111,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_21_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_21_0100_0114,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_22_0000_0068,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_23_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_23_0100_0133,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_24_0000_0001,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_25_0000_0096,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_26_0000_0023,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_27_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_27_0100_0109,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_28_0000_0099,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_28_0100_0107,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_29_0000_0009,
      Patterns.EpQ1028TermShards.ep_Q1_028_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_01_0100_0111_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_02_0100_0111_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_03_0100_0125_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_04_0100_0114_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_05_0100_0126_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_06_0100_0133_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_07_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_07_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_08_0100_0104_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_09_0300_0378_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_10_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_11_0000_0091_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_12_0100_0121_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_13_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_13_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_14_0000_0004_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_15_0100_0118_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_16_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_17_0000_0005_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_18_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_18_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_18_0400_0428_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_19_0100_0136_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_20_0100_0111_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_21_0100_0114_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_22_0000_0068_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_23_0100_0133_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_24_0000_0001_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_25_0000_0096_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_26_0000_0023_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_27_0100_0109_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_28_0100_0107_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_29_0000_0009_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1028BlockZeros.ep_Q1_028_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
