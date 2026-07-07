/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block00_0000_0037
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block01_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block01_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block01_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block01_0400_0496
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block02_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block02_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block02_0400_0496
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block03_0100_0150
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block04_0400_0457
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block05_0400_0478
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block07_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block07_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block07_0200_0236
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block08_0200_0233
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block10_0000_0051
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block11_0000_0050
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block13_0000_0029
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block14_0000_0019
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block15_0000_0085
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block16_0000_0038
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block17_0100_0189
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block19_0100_0187
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block20_0100_0187
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block21_0400_0468
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block22_0000_0032
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block23_0200_0229
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block24_0000_0086
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block25_0100_0100
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block26_0500_0506
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block27_0900_0952
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block28_0200_0284
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block29_0500_0528
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2054BlockZeros.EpQ2054Block30_0000_0050

/-!
# Endpoint product row-zero certificate ep_Q2_054

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_054` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_054.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_054` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_054_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 54 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_054_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2054TermShards.ep_Q2_054_block_00_0000_0037,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_01_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_01_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_01_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_01_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_01_0400_0496,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_02_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_02_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_02_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_02_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_02_0400_0496,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_03_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_03_0100_0150,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_04_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_04_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_04_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_04_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_04_0400_0457,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_05_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_05_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_05_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_05_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_05_0400_0478,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_07_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_07_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_07_0200_0236,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_08_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_08_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_08_0200_0233,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_10_0000_0051,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_11_0000_0050,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_13_0000_0029,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_14_0000_0019,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_15_0000_0085,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_16_0000_0038,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_17_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_17_0100_0189,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_19_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_19_0100_0187,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_20_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_20_0100_0187,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_21_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_21_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_21_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_21_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_21_0400_0468,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_22_0000_0032,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_23_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_23_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_23_0200_0229,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_24_0000_0086,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_25_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_25_0100_0100,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0400_0499,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_26_0500_0506,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0400_0499,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0500_0599,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0600_0699,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0700_0799,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0800_0899,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_27_0900_0952,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_28_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_28_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_28_0200_0284,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0000_0099,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0100_0199,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0200_0299,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0300_0399,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0400_0499,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_29_0500_0528,
      Patterns.EpQ2054TermShards.ep_Q2_054_block_30_0000_0050
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_00_0000_0037_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_01_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_01_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_01_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_01_0400_0496_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_02_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_02_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_02_0400_0496_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_03_0100_0150_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_04_0400_0457_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_05_0400_0478_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_07_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_07_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_07_0200_0236_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_08_0200_0233_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_10_0000_0051_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_11_0000_0050_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_13_0000_0029_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_14_0000_0019_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_15_0000_0085_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_16_0000_0038_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_17_0100_0189_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_19_0100_0187_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_20_0100_0187_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_21_0400_0468_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_22_0000_0032_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_23_0200_0229_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_24_0000_0086_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_25_0100_0100_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_26_0500_0506_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_27_0900_0952_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_28_0200_0284_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_29_0500_0528_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2054BlockZeros.ep_Q2_054_block_30_0000_0050_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
