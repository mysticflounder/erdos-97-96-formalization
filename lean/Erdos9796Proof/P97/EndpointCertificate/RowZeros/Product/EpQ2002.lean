/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block00_0000_0042
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block01_0100_0110
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block02_0100_0128
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block03_0100_0133
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block04_0300_0344
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block05_0700_0716
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block07_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block07_0100_0148
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block08_0100_0175
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block09_1000_1098
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block10_0100_0164
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block11_0700_0716
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block12_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block12_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block13_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block13_0100_0121
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block14_0000_0073
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block15_0200_0245
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block16_0100_0122
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block17_0200_0214
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block19_0000_0036
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block20_0000_0093
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block21_0600_0691
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block22_0100_0117
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block23_0100_0132
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block24_0100_0116
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block25_0100_0111
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block26_0100_0173
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block27_0600_0686
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block28_0700_0701
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block29_0000_0097
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2002BlockZeros.EpQ2002Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q2_002

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_002` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_002.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_002` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_002_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 2 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_002_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2002TermShards.ep_Q2_002_block_00_0000_0042,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_01_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_01_0100_0110,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_02_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_02_0100_0128,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_03_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_03_0100_0133,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_04_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_04_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_04_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_04_0300_0344,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0600_0699,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_05_0700_0716,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_07_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_07_0100_0148,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_08_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_08_0100_0175,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0600_0699,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0700_0799,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0800_0899,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_0900_0999,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_09_1000_1098,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_10_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_10_0100_0164,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0600_0699,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_11_0700_0716,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_12_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_12_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_12_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_13_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_13_0100_0121,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_14_0000_0073,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_15_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_15_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_15_0200_0245,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_16_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_16_0100_0122,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_17_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_17_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_17_0200_0214,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_19_0000_0036,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_20_0000_0093,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_21_0600_0691,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_22_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_22_0100_0117,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_23_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_23_0100_0132,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_24_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_24_0100_0116,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_25_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_25_0100_0111,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_26_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_26_0100_0173,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_27_0600_0686,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0000_0099,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0100_0199,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0200_0299,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0300_0399,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0400_0499,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0500_0599,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0600_0699,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_28_0700_0701,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_29_0000_0097,
      Patterns.EpQ2002TermShards.ep_Q2_002_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_00_0000_0042_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_01_0100_0110_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_02_0100_0128_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_03_0100_0133_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_04_0300_0344_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_05_0700_0716_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_07_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_07_0100_0148_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_08_0100_0175_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_09_1000_1098_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_10_0100_0164_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_11_0700_0716_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_12_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_12_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_13_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_13_0100_0121_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_14_0000_0073_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_15_0200_0245_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_16_0100_0122_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_17_0200_0214_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_19_0000_0036_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_20_0000_0093_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_21_0600_0691_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_22_0100_0117_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_23_0100_0132_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_24_0100_0116_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_25_0100_0111_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_26_0100_0173_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_27_0600_0686_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_28_0700_0701_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_29_0000_0097_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2002BlockZeros.ep_Q2_002_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
