/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block00_0000_0085
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block01_0000_0022
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block02_0100_0132
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block04_0400_0488
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block05_0700_0795
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block06_0700_0787
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block07_0800_0825
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block08_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block08_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block08_0400_0462
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1300_1399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1400_1499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1500_1599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1600_1699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1700_1799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1800_1899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_1900_1999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_2000_2099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_2100_2199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block09_2200_2239
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block10_0100_0129
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block11_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block11_0300_0384
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block13_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block13_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block13_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block13_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block13_0400_0427
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block14_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block14_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block14_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block14_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block14_0400_0426
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block15_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block15_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block15_0400_0437
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block16_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block16_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block16_0300_0341
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block17_0200_0224
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block18_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block18_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block18_0400_0426
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block19_0000_0042
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block20_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block20_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block20_0400_0454
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block21_1300_1318
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block22_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block22_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block22_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block22_0400_0453
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block23_0500_0509
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block24_0100_0123
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block25_0100_0188
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block26_0200_0210
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block27_0600_0624
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block28_0500_0585
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block29_0200_0235
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1009BlockZeros.EpQ1009Block30_0000_0011

/-!
# Endpoint product row-zero certificate ep_Q1_009

This generated module proves that every checked block in product-sum endpoint
row `ep_Q1_009` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q1_009.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q1_009` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q1_009_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ1.get (Fin.mk 9 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q1_009_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ1009TermShards.ep_Q1_009_block_00_0000_0085,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_01_0000_0022,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_02_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_02_0100_0132,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_04_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_04_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_04_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_04_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_04_0400_0488,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0600_0699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_05_0700_0795,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0600_0699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_06_0700_0787,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0600_0699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0700_0799,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_07_0800_0825,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_08_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_08_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_08_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_08_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_08_0400_0462,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0600_0699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0700_0799,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0800_0899,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_0900_0999,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1000_1099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1100_1199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1200_1299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1300_1399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1400_1499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1500_1599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1600_1699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1700_1799,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1800_1899,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_1900_1999,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_2000_2099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_2100_2199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_09_2200_2239,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_10_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_10_0100_0129,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_11_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_11_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_11_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_11_0300_0384,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_13_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_13_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_13_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_13_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_13_0400_0427,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_14_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_14_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_14_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_14_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_14_0400_0426,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_15_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_15_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_15_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_15_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_15_0400_0437,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_16_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_16_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_16_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_16_0300_0341,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_17_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_17_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_17_0200_0224,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_18_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_18_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_18_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_18_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_18_0400_0426,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_19_0000_0042,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_20_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_20_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_20_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_20_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_20_0400_0454,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0600_0699,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0700_0799,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0800_0899,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_0900_0999,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_1000_1099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_1100_1199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_1200_1299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_21_1300_1318,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_22_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_22_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_22_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_22_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_22_0400_0453,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_23_0500_0509,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_24_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_24_0100_0123,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_25_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_25_0100_0188,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_26_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_26_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_26_0200_0210,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0500_0599,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_27_0600_0624,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0200_0299,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0300_0399,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0400_0499,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_28_0500_0585,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_29_0000_0099,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_29_0100_0199,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_29_0200_0235,
      Patterns.EpQ1009TermShards.ep_Q1_009_block_30_0000_0011
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_00_0000_0085_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_01_0000_0022_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_02_0100_0132_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_04_0400_0488_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_05_0700_0795_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_06_0700_0787_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_07_0800_0825_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_08_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_08_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_08_0400_0462_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1300_1399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1400_1499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1500_1599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1600_1699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1700_1799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1800_1899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_1900_1999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_2000_2099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_2100_2199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_09_2200_2239_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_10_0100_0129_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_11_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_11_0300_0384_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_13_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_13_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_13_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_13_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_13_0400_0427_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_14_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_14_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_14_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_14_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_14_0400_0426_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_15_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_15_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_15_0400_0437_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_16_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_16_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_16_0300_0341_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_17_0200_0224_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_18_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_18_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_18_0400_0426_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_19_0000_0042_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_20_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_20_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_20_0400_0454_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_21_1300_1318_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_22_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_22_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_22_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_22_0400_0453_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_23_0500_0509_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_24_0100_0123_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_25_0100_0188_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_26_0200_0210_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_27_0600_0624_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_28_0500_0585_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_29_0200_0235_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1009BlockZeros.ep_Q1_009_block_30_0000_0011_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
