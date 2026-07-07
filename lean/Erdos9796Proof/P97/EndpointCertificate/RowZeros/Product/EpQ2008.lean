/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block00_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block00_0100_0141
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block01_0600_0683
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block02_0600_0664
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block03_0700_0703
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block04_0100_0155
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block08_0200_0237
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block09_1000_1032
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block10_0100_0119
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block11_0800_0849
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block12_0100_0183
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block13_0000_0096
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block14_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block14_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block14_0200_0248
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block15_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block15_0300_0302
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block16_0100_0125
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block17_0000_0069
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block18_0600_0605
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block19_0100_0107
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block20_0600_0669
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block22_0100_0121
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block23_0600_0675
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block24_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block24_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block24_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block24_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block25_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block25_0200_0203
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block26_0800_0889
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1300_1399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1400_1499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1500_1599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1600_1699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1700_1799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block27_1800_1847
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block28_0800_0818
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block29_0700_0727
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2008BlockZeros.EpQ2008Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q2_008

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_008` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_008.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_008` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_008_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 8 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_008_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2008TermShards.ep_Q2_008_block_00_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_00_0100_0141,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_01_0600_0683,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_02_0600_0664,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_03_0700_0703,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_04_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_04_0100_0155,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_08_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_08_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_08_0200_0237,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0700_0799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0800_0899,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_0900_0999,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_09_1000_1032,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_10_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_10_0100_0119,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0700_0799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_11_0800_0849,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_12_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_12_0100_0183,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_13_0000_0096,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_14_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_14_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_14_0200_0248,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_15_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_15_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_15_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_15_0300_0302,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_16_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_16_0100_0125,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_17_0000_0069,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_18_0600_0605,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_19_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_19_0100_0107,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_20_0600_0669,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_22_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_22_0100_0121,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_23_0600_0675,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_24_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_24_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_24_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_24_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_24_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_25_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_25_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_25_0200_0203,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0700_0799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_26_0800_0889,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0700_0799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0800_0899,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_0900_0999,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1000_1099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1100_1199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1200_1299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1300_1399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1400_1499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1500_1599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1600_1699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1700_1799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_27_1800_1847,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0700_0799,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_28_0800_0818,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0000_0099,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0100_0199,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0200_0299,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0300_0399,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0400_0499,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0500_0599,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0600_0699,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_29_0700_0727,
      Patterns.EpQ2008TermShards.ep_Q2_008_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_00_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_00_0100_0141_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_01_0600_0683_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_02_0600_0664_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_03_0700_0703_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_04_0100_0155_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_08_0200_0237_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_09_1000_1032_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_10_0100_0119_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_11_0800_0849_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_12_0100_0183_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_13_0000_0096_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_14_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_14_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_14_0200_0248_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_15_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_15_0300_0302_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_16_0100_0125_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_17_0000_0069_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_18_0600_0605_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_19_0100_0107_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_20_0600_0669_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_22_0100_0121_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_23_0600_0675_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_24_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_24_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_24_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_24_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_25_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_25_0200_0203_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_26_0800_0889_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1300_1399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1400_1499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1500_1599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1600_1699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1700_1799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_27_1800_1847_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_28_0800_0818_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_29_0700_0727_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2008BlockZeros.ep_Q2_008_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
