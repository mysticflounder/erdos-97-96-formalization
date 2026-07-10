/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard004
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard005
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard006
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard007
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2008TermShards.EpQ2008BlockShard008

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_008`.

Source certificate: `certificates/endpoint/ep_Q2_008.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_productBlocks :
    List (ComputedProductBlock EpQ2008Generators.ep_Q2_008_generators) :=
[
  EpQ2008TermShards.ep_Q2_008_block_00_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_00_0100_0141,
  EpQ2008TermShards.ep_Q2_008_block_01_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_01_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_01_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_01_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_01_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_01_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_01_0600_0683,
  EpQ2008TermShards.ep_Q2_008_block_02_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_02_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_02_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_02_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_02_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_02_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_02_0600_0664,
  EpQ2008TermShards.ep_Q2_008_block_03_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_03_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_03_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_03_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_03_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_03_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_03_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_03_0700_0703,
  EpQ2008TermShards.ep_Q2_008_block_04_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_04_0100_0155,
  EpQ2008TermShards.ep_Q2_008_block_08_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_08_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_08_0200_0237,
  EpQ2008TermShards.ep_Q2_008_block_09_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_09_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_09_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_09_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_09_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_09_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_09_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_09_0700_0799,
  EpQ2008TermShards.ep_Q2_008_block_09_0800_0899,
  EpQ2008TermShards.ep_Q2_008_block_09_0900_0999,
  EpQ2008TermShards.ep_Q2_008_block_09_1000_1032,
  EpQ2008TermShards.ep_Q2_008_block_10_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_10_0100_0119,
  EpQ2008TermShards.ep_Q2_008_block_11_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_11_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_11_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_11_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_11_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_11_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_11_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_11_0700_0799,
  EpQ2008TermShards.ep_Q2_008_block_11_0800_0849,
  EpQ2008TermShards.ep_Q2_008_block_12_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_12_0100_0183,
  EpQ2008TermShards.ep_Q2_008_block_13_0000_0096,
  EpQ2008TermShards.ep_Q2_008_block_14_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_14_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_14_0200_0248,
  EpQ2008TermShards.ep_Q2_008_block_15_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_15_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_15_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_15_0300_0302,
  EpQ2008TermShards.ep_Q2_008_block_16_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_16_0100_0125,
  EpQ2008TermShards.ep_Q2_008_block_17_0000_0069,
  EpQ2008TermShards.ep_Q2_008_block_18_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_18_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_18_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_18_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_18_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_18_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_18_0600_0605,
  EpQ2008TermShards.ep_Q2_008_block_19_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_19_0100_0107,
  EpQ2008TermShards.ep_Q2_008_block_20_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_20_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_20_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_20_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_20_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_20_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_20_0600_0669,
  EpQ2008TermShards.ep_Q2_008_block_22_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_22_0100_0121,
  EpQ2008TermShards.ep_Q2_008_block_23_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_23_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_23_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_23_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_23_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_23_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_23_0600_0675,
  EpQ2008TermShards.ep_Q2_008_block_24_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_24_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_24_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_24_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_24_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_25_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_25_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_25_0200_0203,
  EpQ2008TermShards.ep_Q2_008_block_26_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_26_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_26_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_26_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_26_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_26_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_26_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_26_0700_0799,
  EpQ2008TermShards.ep_Q2_008_block_26_0800_0889,
  EpQ2008TermShards.ep_Q2_008_block_27_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_27_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_27_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_27_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_27_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_27_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_27_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_27_0700_0799,
  EpQ2008TermShards.ep_Q2_008_block_27_0800_0899,
  EpQ2008TermShards.ep_Q2_008_block_27_0900_0999,
  EpQ2008TermShards.ep_Q2_008_block_27_1000_1099,
  EpQ2008TermShards.ep_Q2_008_block_27_1100_1199,
  EpQ2008TermShards.ep_Q2_008_block_27_1200_1299,
  EpQ2008TermShards.ep_Q2_008_block_27_1300_1399,
  EpQ2008TermShards.ep_Q2_008_block_27_1400_1499,
  EpQ2008TermShards.ep_Q2_008_block_27_1500_1599,
  EpQ2008TermShards.ep_Q2_008_block_27_1600_1699,
  EpQ2008TermShards.ep_Q2_008_block_27_1700_1799,
  EpQ2008TermShards.ep_Q2_008_block_27_1800_1847,
  EpQ2008TermShards.ep_Q2_008_block_28_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_28_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_28_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_28_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_28_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_28_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_28_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_28_0700_0799,
  EpQ2008TermShards.ep_Q2_008_block_28_0800_0818,
  EpQ2008TermShards.ep_Q2_008_block_29_0000_0099,
  EpQ2008TermShards.ep_Q2_008_block_29_0100_0199,
  EpQ2008TermShards.ep_Q2_008_block_29_0200_0299,
  EpQ2008TermShards.ep_Q2_008_block_29_0300_0399,
  EpQ2008TermShards.ep_Q2_008_block_29_0400_0499,
  EpQ2008TermShards.ep_Q2_008_block_29_0500_0599,
  EpQ2008TermShards.ep_Q2_008_block_29_0600_0699,
  EpQ2008TermShards.ep_Q2_008_block_29_0700_0727,
  EpQ2008TermShards.ep_Q2_008_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_blocks : List Poly :=
  computedProductPolys ep_Q2_008_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_008`. -/
theorem ep_Q2_008_valid : checkProductSum ep_Q2_008_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_008`. -/
theorem ep_Q2_008_sum_valid : checkProductSum ep_Q2_008_blocks = true :=
  ep_Q2_008_valid

end Patterns

end EndpointCertificate

end Problem97
