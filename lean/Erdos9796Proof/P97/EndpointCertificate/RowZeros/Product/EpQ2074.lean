/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block00_0000_0034
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block01_0100_0150
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block02_0100_0185
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block03_0200_0225
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block04_0100_0150
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block05_0300_0338
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block07_0000_0085
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block08_0100_0115
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block09_0000_0071
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block11_0000_0040
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block12_0000_0039
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block13_0000_0022
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block15_0100_0185
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block16_0000_0010
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block17_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block17_0300_0337
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block18_0000_0017
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block19_0000_0005
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block20_0200_0225
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block21_0100_0142
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block22_0000_0025
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block24_0100_0121
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block25_0000_0016
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block26_0200_0225
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block27_0000_0055
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block28_0300_0345
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block29_0000_0090
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2074BlockZeros.EpQ2074Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q2_074

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_074` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_074.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_074` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_074_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 74 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_074_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2074TermShards.ep_Q2_074_block_00_0000_0034,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_01_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_01_0100_0150,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_02_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_02_0100_0185,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_03_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_03_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_03_0200_0225,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_04_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_04_0100_0150,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_05_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_05_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_05_0200_0299,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_05_0300_0338,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_07_0000_0085,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_08_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_08_0100_0115,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_09_0000_0071,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_11_0000_0040,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_12_0000_0039,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_13_0000_0022,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_15_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_15_0100_0185,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_16_0000_0010,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_17_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_17_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_17_0200_0299,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_17_0300_0337,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_18_0000_0017,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_19_0000_0005,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_20_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_20_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_20_0200_0225,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_21_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_21_0100_0142,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_22_0000_0025,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_24_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_24_0100_0121,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_25_0000_0016,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_26_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_26_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_26_0200_0225,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_27_0000_0055,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_28_0000_0099,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_28_0100_0199,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_28_0200_0299,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_28_0300_0345,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_29_0000_0090,
      Patterns.EpQ2074TermShards.ep_Q2_074_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_00_0000_0034_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_01_0100_0150_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_02_0100_0185_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_03_0200_0225_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_04_0100_0150_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_05_0300_0338_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_07_0000_0085_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_08_0100_0115_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_09_0000_0071_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_11_0000_0040_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_12_0000_0039_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_13_0000_0022_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_15_0100_0185_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_16_0000_0010_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_17_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_17_0300_0337_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_18_0000_0017_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_19_0000_0005_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_20_0200_0225_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_21_0100_0142_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_22_0000_0025_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_24_0100_0121_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_25_0000_0016_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_26_0200_0225_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_27_0000_0055_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_28_0300_0345_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_29_0000_0090_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2074BlockZeros.ep_Q2_074_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
