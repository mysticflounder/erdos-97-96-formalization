/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block00_0000_0088
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block01_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block01_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block01_0300_0346
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block02_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block02_0300_0335
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block03_0500_0514
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block04_0600_0609
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block05_0400_0497
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block06_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block06_0200_0200
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block08_0200_0226
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block10_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block10_0200_0236
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block11_0200_0255
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block12_0100_0172
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block13_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block13_0100_0101
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block14_0000_0059
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1300_1399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1400_1499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1500_1599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1600_1699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1700_1799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1800_1899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_1900_1999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_2000_2099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block15_2100_2129
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block16_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block16_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block16_0300_0322
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block17_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block17_0300_0387
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block18_0200_0246
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block19_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block19_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block19_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block19_0400_0489
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block20_0500_0524
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block21_1300_1350
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block22_0500_0560
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block23_0200_0248
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block24_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block24_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block24_0300_0373
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block25_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block25_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block25_0300_0380
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block26_0200_0256
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block27_0000_0077
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block28_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block29_0200_0255
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2024BlockZeros.EpQ2024Block30_0000_0001

/-!
# Endpoint product row-zero certificate ep_Q2_024

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_024` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_024.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_024` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_024_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 24 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_024_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2024TermShards.ep_Q2_024_block_00_0000_0088,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_01_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_01_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_01_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_01_0300_0346,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_02_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_02_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_02_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_02_0300_0335,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_03_0500_0514,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0500_0599,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_04_0600_0609,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_05_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_05_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_05_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_05_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_05_0400_0497,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_06_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_06_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_06_0200_0200,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_08_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_08_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_08_0200_0226,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_10_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_10_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_10_0200_0236,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_11_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_11_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_11_0200_0255,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_12_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_12_0100_0172,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_13_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_13_0100_0101,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_14_0000_0059,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0500_0599,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0600_0699,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0700_0799,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0800_0899,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_0900_0999,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1000_1099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1100_1199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1200_1299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1300_1399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1400_1499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1500_1599,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1600_1699,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1700_1799,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1800_1899,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_1900_1999,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_2000_2099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_15_2100_2129,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_16_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_16_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_16_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_16_0300_0322,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_17_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_17_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_17_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_17_0300_0387,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_18_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_18_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_18_0200_0246,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_19_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_19_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_19_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_19_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_19_0400_0489,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_20_0500_0524,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0500_0599,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0600_0699,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0700_0799,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0800_0899,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_0900_0999,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_1000_1099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_1100_1199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_1200_1299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_21_1300_1350,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0300_0399,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0400_0499,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_22_0500_0560,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_23_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_23_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_23_0200_0248,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_24_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_24_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_24_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_24_0300_0373,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_25_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_25_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_25_0200_0299,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_25_0300_0380,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_26_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_26_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_26_0200_0256,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_27_0000_0077,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_28_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_28_0100_0119,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_29_0000_0099,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_29_0100_0199,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_29_0200_0255,
      Patterns.EpQ2024TermShards.ep_Q2_024_block_30_0000_0001
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_00_0000_0088_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_01_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_01_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_01_0300_0346_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_02_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_02_0300_0335_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_03_0500_0514_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_04_0600_0609_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_05_0400_0497_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_06_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_06_0200_0200_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_08_0200_0226_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_10_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_10_0200_0236_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_11_0200_0255_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_12_0100_0172_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_13_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_13_0100_0101_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_14_0000_0059_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1300_1399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1400_1499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1500_1599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1600_1699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1700_1799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1800_1899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_1900_1999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_2000_2099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_15_2100_2129_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_16_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_16_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_16_0300_0322_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_17_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_17_0300_0387_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_18_0200_0246_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_19_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_19_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_19_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_19_0400_0489_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_20_0500_0524_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_21_1300_1350_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_22_0500_0560_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_23_0200_0248_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_24_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_24_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_24_0300_0373_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_25_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_25_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_25_0300_0380_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_26_0200_0256_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_27_0000_0077_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_28_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_29_0200_0255_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2024BlockZeros.ep_Q2_024_block_30_0000_0001_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
