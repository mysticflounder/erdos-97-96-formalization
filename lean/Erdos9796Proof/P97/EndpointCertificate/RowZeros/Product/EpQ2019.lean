/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block00_0000_0003
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block01_0000_0070
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block02_0000_0092
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block03_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block03_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block03_0400_0414
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block04_0400_0425
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block05_0200_0280
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block06_0100_0141
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block07_0000_0092
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block08_0100_0198
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block09_0100_0165
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block10_0100_0153
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block11_0000_0055
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block12_0100_0153
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block13_0000_0022
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block14_0000_0065
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block15_0000_0042
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block16_0000_0033
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block17_0000_0052
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block18_0000_0050
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block19_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block19_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block19_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block20_0000_0040
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block21_0700_0703
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block22_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block22_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block22_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block22_0400_0413
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block23_0200_0210
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block24_0000_0053
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block25_0000_0045
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block26_0000_0074
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block27_0000_0093
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block28_0000_0040
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block29_0100_0109
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2019BlockZeros.EpQ2019Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q2_019

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_019` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_019.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_019` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_019_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 19 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_019_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2019TermShards.ep_Q2_019_block_00_0000_0003,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_01_0000_0070,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_02_0000_0092,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_03_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_03_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_03_0200_0299,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_03_0300_0399,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_03_0400_0414,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_04_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_04_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_04_0200_0299,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_04_0300_0399,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_04_0400_0425,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_05_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_05_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_05_0200_0280,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_06_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_06_0100_0141,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_07_0000_0092,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_08_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_08_0100_0198,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_09_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_09_0100_0165,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_10_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_10_0100_0153,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_11_0000_0055,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_12_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_12_0100_0153,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_13_0000_0022,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_14_0000_0065,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_15_0000_0042,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_16_0000_0033,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_17_0000_0052,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_18_0000_0050,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_19_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_19_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_19_0200_0299,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_19_0300_0399,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_20_0000_0040,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0200_0299,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0300_0399,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0400_0499,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0500_0599,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0600_0699,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_21_0700_0703,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_22_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_22_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_22_0200_0299,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_22_0300_0399,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_22_0400_0413,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_23_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_23_0100_0199,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_23_0200_0210,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_24_0000_0053,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_25_0000_0045,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_26_0000_0074,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_27_0000_0093,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_28_0000_0040,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_29_0000_0099,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_29_0100_0109,
      Patterns.EpQ2019TermShards.ep_Q2_019_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_00_0000_0003_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_01_0000_0070_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_02_0000_0092_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_03_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_03_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_03_0400_0414_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_04_0400_0425_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_05_0200_0280_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_06_0100_0141_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_07_0000_0092_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_08_0100_0198_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_09_0100_0165_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_10_0100_0153_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_11_0000_0055_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_12_0100_0153_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_13_0000_0022_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_14_0000_0065_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_15_0000_0042_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_16_0000_0033_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_17_0000_0052_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_18_0000_0050_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_19_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_19_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_19_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_20_0000_0040_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_21_0700_0703_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_22_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_22_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_22_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_22_0400_0413_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_23_0200_0210_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_24_0000_0053_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_25_0000_0045_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_26_0000_0074_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_27_0000_0093_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_28_0000_0040_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_29_0100_0109_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2019BlockZeros.ep_Q2_019_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
