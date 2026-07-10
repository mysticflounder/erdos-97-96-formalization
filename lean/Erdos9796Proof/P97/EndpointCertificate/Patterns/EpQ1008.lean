/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard004
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard005
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard006
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard007
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard008
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard009
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard010
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard011
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard012
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard013
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard014
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard015
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard016
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard017
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard018
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008TermShards.EpQ1008BlockShard019

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_008

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q1_008`.

Source certificate: `certificates/endpoint/ep_Q1_008.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_productBlocks :
    List (ComputedProductBlock EpQ1008Generators.ep_Q1_008_generators) :=
[
  EpQ1008TermShards.ep_Q1_008_block_00_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_00_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_00_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_00_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_00_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_00_0500_0515,
  EpQ1008TermShards.ep_Q1_008_block_01_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_01_0100_0156,
  EpQ1008TermShards.ep_Q1_008_block_02_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_02_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_02_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_02_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_02_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_02_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_02_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_02_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_02_0800_0899,
  EpQ1008TermShards.ep_Q1_008_block_02_0900_0914,
  EpQ1008TermShards.ep_Q1_008_block_03_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_03_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_03_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_03_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_03_0400_0402,
  EpQ1008TermShards.ep_Q1_008_block_04_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_04_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_04_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_04_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_04_0400_0496,
  EpQ1008TermShards.ep_Q1_008_block_05_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_05_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_05_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_05_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_05_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_05_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_05_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_05_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_05_0800_0871,
  EpQ1008TermShards.ep_Q1_008_block_06_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_06_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_06_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_06_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_06_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_06_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_06_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_06_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_06_0800_0899,
  EpQ1008TermShards.ep_Q1_008_block_06_0900_0999,
  EpQ1008TermShards.ep_Q1_008_block_06_1000_1004,
  EpQ1008TermShards.ep_Q1_008_block_08_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_08_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_08_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_08_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_08_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_08_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_08_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_08_0700_0703,
  EpQ1008TermShards.ep_Q1_008_block_09_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_09_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_09_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_09_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_09_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_09_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_09_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_09_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_09_0800_0899,
  EpQ1008TermShards.ep_Q1_008_block_09_0900_0999,
  EpQ1008TermShards.ep_Q1_008_block_09_1000_1099,
  EpQ1008TermShards.ep_Q1_008_block_09_1100_1199,
  EpQ1008TermShards.ep_Q1_008_block_09_1200_1299,
  EpQ1008TermShards.ep_Q1_008_block_09_1300_1399,
  EpQ1008TermShards.ep_Q1_008_block_09_1400_1499,
  EpQ1008TermShards.ep_Q1_008_block_09_1500_1599,
  EpQ1008TermShards.ep_Q1_008_block_09_1600_1699,
  EpQ1008TermShards.ep_Q1_008_block_09_1700_1799,
  EpQ1008TermShards.ep_Q1_008_block_09_1800_1899,
  EpQ1008TermShards.ep_Q1_008_block_09_1900_1999,
  EpQ1008TermShards.ep_Q1_008_block_09_2000_2099,
  EpQ1008TermShards.ep_Q1_008_block_09_2100_2199,
  EpQ1008TermShards.ep_Q1_008_block_09_2200_2299,
  EpQ1008TermShards.ep_Q1_008_block_09_2300_2399,
  EpQ1008TermShards.ep_Q1_008_block_09_2400_2499,
  EpQ1008TermShards.ep_Q1_008_block_09_2500_2599,
  EpQ1008TermShards.ep_Q1_008_block_09_2600_2699,
  EpQ1008TermShards.ep_Q1_008_block_09_2700_2799,
  EpQ1008TermShards.ep_Q1_008_block_09_2800_2899,
  EpQ1008TermShards.ep_Q1_008_block_09_2900_2999,
  EpQ1008TermShards.ep_Q1_008_block_09_3000_3099,
  EpQ1008TermShards.ep_Q1_008_block_09_3100_3199,
  EpQ1008TermShards.ep_Q1_008_block_09_3200_3299,
  EpQ1008TermShards.ep_Q1_008_block_09_3300_3399,
  EpQ1008TermShards.ep_Q1_008_block_09_3400_3420,
  EpQ1008TermShards.ep_Q1_008_block_10_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_10_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_10_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_10_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_10_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_10_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_10_0600_0610,
  EpQ1008TermShards.ep_Q1_008_block_11_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_11_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_11_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_11_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_11_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_11_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_11_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_11_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_11_0800_0899,
  EpQ1008TermShards.ep_Q1_008_block_11_0900_0958,
  EpQ1008TermShards.ep_Q1_008_block_12_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_12_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_12_0200_0206,
  EpQ1008TermShards.ep_Q1_008_block_13_0000_0082,
  EpQ1008TermShards.ep_Q1_008_block_14_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_14_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_14_0200_0244,
  EpQ1008TermShards.ep_Q1_008_block_15_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_15_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_15_0200_0201,
  EpQ1008TermShards.ep_Q1_008_block_16_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_16_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_16_0200_0272,
  EpQ1008TermShards.ep_Q1_008_block_17_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_17_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_17_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_17_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_17_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_17_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_17_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_17_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_17_0800_0822,
  EpQ1008TermShards.ep_Q1_008_block_18_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_18_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_18_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_18_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_18_0400_0492,
  EpQ1008TermShards.ep_Q1_008_block_19_0000_0098,
  EpQ1008TermShards.ep_Q1_008_block_20_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_20_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_20_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_20_0300_0311,
  EpQ1008TermShards.ep_Q1_008_block_22_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_22_0100_0129,
  EpQ1008TermShards.ep_Q1_008_block_23_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_23_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_23_0200_0289,
  EpQ1008TermShards.ep_Q1_008_block_24_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_24_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_24_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_24_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_24_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_24_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_24_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_24_0700_0799,
  EpQ1008TermShards.ep_Q1_008_block_24_0800_0899,
  EpQ1008TermShards.ep_Q1_008_block_24_0900_0997,
  EpQ1008TermShards.ep_Q1_008_block_25_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_25_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_25_0200_0256,
  EpQ1008TermShards.ep_Q1_008_block_26_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_26_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_26_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_26_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_26_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_26_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_26_0600_0697,
  EpQ1008TermShards.ep_Q1_008_block_28_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_28_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_28_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_28_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_28_0400_0499,
  EpQ1008TermShards.ep_Q1_008_block_28_0500_0599,
  EpQ1008TermShards.ep_Q1_008_block_28_0600_0699,
  EpQ1008TermShards.ep_Q1_008_block_28_0700_0794,
  EpQ1008TermShards.ep_Q1_008_block_29_0000_0099,
  EpQ1008TermShards.ep_Q1_008_block_29_0100_0199,
  EpQ1008TermShards.ep_Q1_008_block_29_0200_0299,
  EpQ1008TermShards.ep_Q1_008_block_29_0300_0399,
  EpQ1008TermShards.ep_Q1_008_block_29_0400_0474,
  EpQ1008TermShards.ep_Q1_008_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_blocks : List Poly :=
  computedProductPolys ep_Q1_008_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q1_008`. -/
theorem ep_Q1_008_valid : checkProductSum ep_Q1_008_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q1_008`. -/
theorem ep_Q1_008_sum_valid : checkProductSum ep_Q1_008_blocks = true :=
  ep_Q1_008_valid

end Patterns

end EndpointCertificate

end Problem97
