/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard004
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard005
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard006
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard007
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard008
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard009
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard010
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard011
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1009TermShards.EpQ1009BlockShard012

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q1_009`.

Source certificate: `certificates/endpoint/ep_Q1_009.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_productBlocks :
    List (ComputedProductBlock EpQ1009Generators.ep_Q1_009_generators) :=
[
  EpQ1009TermShards.ep_Q1_009_block_00_0000_0085,
  EpQ1009TermShards.ep_Q1_009_block_01_0000_0022,
  EpQ1009TermShards.ep_Q1_009_block_02_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_02_0100_0132,
  EpQ1009TermShards.ep_Q1_009_block_04_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_04_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_04_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_04_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_04_0400_0488,
  EpQ1009TermShards.ep_Q1_009_block_05_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_05_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_05_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_05_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_05_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_05_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_05_0600_0699,
  EpQ1009TermShards.ep_Q1_009_block_05_0700_0795,
  EpQ1009TermShards.ep_Q1_009_block_06_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_06_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_06_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_06_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_06_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_06_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_06_0600_0699,
  EpQ1009TermShards.ep_Q1_009_block_06_0700_0787,
  EpQ1009TermShards.ep_Q1_009_block_07_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_07_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_07_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_07_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_07_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_07_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_07_0600_0699,
  EpQ1009TermShards.ep_Q1_009_block_07_0700_0799,
  EpQ1009TermShards.ep_Q1_009_block_07_0800_0825,
  EpQ1009TermShards.ep_Q1_009_block_08_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_08_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_08_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_08_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_08_0400_0462,
  EpQ1009TermShards.ep_Q1_009_block_09_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_09_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_09_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_09_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_09_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_09_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_09_0600_0699,
  EpQ1009TermShards.ep_Q1_009_block_09_0700_0799,
  EpQ1009TermShards.ep_Q1_009_block_09_0800_0899,
  EpQ1009TermShards.ep_Q1_009_block_09_0900_0999,
  EpQ1009TermShards.ep_Q1_009_block_09_1000_1099,
  EpQ1009TermShards.ep_Q1_009_block_09_1100_1199,
  EpQ1009TermShards.ep_Q1_009_block_09_1200_1299,
  EpQ1009TermShards.ep_Q1_009_block_09_1300_1399,
  EpQ1009TermShards.ep_Q1_009_block_09_1400_1499,
  EpQ1009TermShards.ep_Q1_009_block_09_1500_1599,
  EpQ1009TermShards.ep_Q1_009_block_09_1600_1699,
  EpQ1009TermShards.ep_Q1_009_block_09_1700_1799,
  EpQ1009TermShards.ep_Q1_009_block_09_1800_1899,
  EpQ1009TermShards.ep_Q1_009_block_09_1900_1999,
  EpQ1009TermShards.ep_Q1_009_block_09_2000_2099,
  EpQ1009TermShards.ep_Q1_009_block_09_2100_2199,
  EpQ1009TermShards.ep_Q1_009_block_09_2200_2239,
  EpQ1009TermShards.ep_Q1_009_block_10_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_10_0100_0129,
  EpQ1009TermShards.ep_Q1_009_block_11_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_11_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_11_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_11_0300_0384,
  EpQ1009TermShards.ep_Q1_009_block_13_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_13_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_13_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_13_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_13_0400_0427,
  EpQ1009TermShards.ep_Q1_009_block_14_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_14_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_14_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_14_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_14_0400_0426,
  EpQ1009TermShards.ep_Q1_009_block_15_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_15_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_15_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_15_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_15_0400_0437,
  EpQ1009TermShards.ep_Q1_009_block_16_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_16_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_16_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_16_0300_0341,
  EpQ1009TermShards.ep_Q1_009_block_17_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_17_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_17_0200_0224,
  EpQ1009TermShards.ep_Q1_009_block_18_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_18_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_18_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_18_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_18_0400_0426,
  EpQ1009TermShards.ep_Q1_009_block_19_0000_0042,
  EpQ1009TermShards.ep_Q1_009_block_20_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_20_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_20_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_20_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_20_0400_0454,
  EpQ1009TermShards.ep_Q1_009_block_21_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_21_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_21_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_21_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_21_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_21_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_21_0600_0699,
  EpQ1009TermShards.ep_Q1_009_block_21_0700_0799,
  EpQ1009TermShards.ep_Q1_009_block_21_0800_0899,
  EpQ1009TermShards.ep_Q1_009_block_21_0900_0999,
  EpQ1009TermShards.ep_Q1_009_block_21_1000_1099,
  EpQ1009TermShards.ep_Q1_009_block_21_1100_1199,
  EpQ1009TermShards.ep_Q1_009_block_21_1200_1299,
  EpQ1009TermShards.ep_Q1_009_block_21_1300_1318,
  EpQ1009TermShards.ep_Q1_009_block_22_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_22_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_22_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_22_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_22_0400_0453,
  EpQ1009TermShards.ep_Q1_009_block_23_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_23_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_23_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_23_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_23_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_23_0500_0509,
  EpQ1009TermShards.ep_Q1_009_block_24_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_24_0100_0123,
  EpQ1009TermShards.ep_Q1_009_block_25_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_25_0100_0188,
  EpQ1009TermShards.ep_Q1_009_block_26_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_26_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_26_0200_0210,
  EpQ1009TermShards.ep_Q1_009_block_27_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_27_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_27_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_27_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_27_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_27_0500_0599,
  EpQ1009TermShards.ep_Q1_009_block_27_0600_0624,
  EpQ1009TermShards.ep_Q1_009_block_28_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_28_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_28_0200_0299,
  EpQ1009TermShards.ep_Q1_009_block_28_0300_0399,
  EpQ1009TermShards.ep_Q1_009_block_28_0400_0499,
  EpQ1009TermShards.ep_Q1_009_block_28_0500_0585,
  EpQ1009TermShards.ep_Q1_009_block_29_0000_0099,
  EpQ1009TermShards.ep_Q1_009_block_29_0100_0199,
  EpQ1009TermShards.ep_Q1_009_block_29_0200_0235,
  EpQ1009TermShards.ep_Q1_009_block_30_0000_0011
]

/-- Product polynomials for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_blocks : List Poly :=
  computedProductPolys ep_Q1_009_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q1_009`. -/
theorem ep_Q1_009_valid : checkProductSum ep_Q1_009_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q1_009`. -/
theorem ep_Q1_009_sum_valid : checkProductSum ep_Q1_009_blocks = true :=
  ep_Q1_009_valid

end Patterns

end EndpointCertificate

end Problem97
