/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard004
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard005
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard006
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2024TermShards.EpQ2024BlockShard007

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_024`.

Source certificate: `certificates/endpoint/ep_Q2_024.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_productBlocks :
    List (ComputedProductBlock EpQ2024Generators.ep_Q2_024_generators) :=
[
  EpQ2024TermShards.ep_Q2_024_block_00_0000_0088,
  EpQ2024TermShards.ep_Q2_024_block_01_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_01_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_01_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_01_0300_0346,
  EpQ2024TermShards.ep_Q2_024_block_02_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_02_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_02_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_02_0300_0335,
  EpQ2024TermShards.ep_Q2_024_block_03_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_03_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_03_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_03_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_03_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_03_0500_0514,
  EpQ2024TermShards.ep_Q2_024_block_04_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_04_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_04_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_04_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_04_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_04_0500_0599,
  EpQ2024TermShards.ep_Q2_024_block_04_0600_0609,
  EpQ2024TermShards.ep_Q2_024_block_05_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_05_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_05_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_05_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_05_0400_0497,
  EpQ2024TermShards.ep_Q2_024_block_06_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_06_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_06_0200_0200,
  EpQ2024TermShards.ep_Q2_024_block_08_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_08_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_08_0200_0226,
  EpQ2024TermShards.ep_Q2_024_block_10_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_10_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_10_0200_0236,
  EpQ2024TermShards.ep_Q2_024_block_11_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_11_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_11_0200_0255,
  EpQ2024TermShards.ep_Q2_024_block_12_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_12_0100_0172,
  EpQ2024TermShards.ep_Q2_024_block_13_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_13_0100_0101,
  EpQ2024TermShards.ep_Q2_024_block_14_0000_0059,
  EpQ2024TermShards.ep_Q2_024_block_15_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_15_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_15_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_15_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_15_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_15_0500_0599,
  EpQ2024TermShards.ep_Q2_024_block_15_0600_0699,
  EpQ2024TermShards.ep_Q2_024_block_15_0700_0799,
  EpQ2024TermShards.ep_Q2_024_block_15_0800_0899,
  EpQ2024TermShards.ep_Q2_024_block_15_0900_0999,
  EpQ2024TermShards.ep_Q2_024_block_15_1000_1099,
  EpQ2024TermShards.ep_Q2_024_block_15_1100_1199,
  EpQ2024TermShards.ep_Q2_024_block_15_1200_1299,
  EpQ2024TermShards.ep_Q2_024_block_15_1300_1399,
  EpQ2024TermShards.ep_Q2_024_block_15_1400_1499,
  EpQ2024TermShards.ep_Q2_024_block_15_1500_1599,
  EpQ2024TermShards.ep_Q2_024_block_15_1600_1699,
  EpQ2024TermShards.ep_Q2_024_block_15_1700_1799,
  EpQ2024TermShards.ep_Q2_024_block_15_1800_1899,
  EpQ2024TermShards.ep_Q2_024_block_15_1900_1999,
  EpQ2024TermShards.ep_Q2_024_block_15_2000_2099,
  EpQ2024TermShards.ep_Q2_024_block_15_2100_2129,
  EpQ2024TermShards.ep_Q2_024_block_16_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_16_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_16_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_16_0300_0322,
  EpQ2024TermShards.ep_Q2_024_block_17_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_17_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_17_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_17_0300_0387,
  EpQ2024TermShards.ep_Q2_024_block_18_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_18_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_18_0200_0246,
  EpQ2024TermShards.ep_Q2_024_block_19_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_19_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_19_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_19_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_19_0400_0489,
  EpQ2024TermShards.ep_Q2_024_block_20_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_20_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_20_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_20_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_20_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_20_0500_0524,
  EpQ2024TermShards.ep_Q2_024_block_21_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_21_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_21_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_21_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_21_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_21_0500_0599,
  EpQ2024TermShards.ep_Q2_024_block_21_0600_0699,
  EpQ2024TermShards.ep_Q2_024_block_21_0700_0799,
  EpQ2024TermShards.ep_Q2_024_block_21_0800_0899,
  EpQ2024TermShards.ep_Q2_024_block_21_0900_0999,
  EpQ2024TermShards.ep_Q2_024_block_21_1000_1099,
  EpQ2024TermShards.ep_Q2_024_block_21_1100_1199,
  EpQ2024TermShards.ep_Q2_024_block_21_1200_1299,
  EpQ2024TermShards.ep_Q2_024_block_21_1300_1350,
  EpQ2024TermShards.ep_Q2_024_block_22_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_22_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_22_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_22_0300_0399,
  EpQ2024TermShards.ep_Q2_024_block_22_0400_0499,
  EpQ2024TermShards.ep_Q2_024_block_22_0500_0560,
  EpQ2024TermShards.ep_Q2_024_block_23_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_23_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_23_0200_0248,
  EpQ2024TermShards.ep_Q2_024_block_24_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_24_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_24_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_24_0300_0373,
  EpQ2024TermShards.ep_Q2_024_block_25_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_25_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_25_0200_0299,
  EpQ2024TermShards.ep_Q2_024_block_25_0300_0380,
  EpQ2024TermShards.ep_Q2_024_block_26_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_26_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_26_0200_0256,
  EpQ2024TermShards.ep_Q2_024_block_27_0000_0077,
  EpQ2024TermShards.ep_Q2_024_block_28_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_28_0100_0119,
  EpQ2024TermShards.ep_Q2_024_block_29_0000_0099,
  EpQ2024TermShards.ep_Q2_024_block_29_0100_0199,
  EpQ2024TermShards.ep_Q2_024_block_29_0200_0255,
  EpQ2024TermShards.ep_Q2_024_block_30_0000_0001
]

/-- Product polynomials for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_blocks : List Poly :=
  computedProductPolys ep_Q2_024_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_024`. -/
theorem ep_Q2_024_valid : checkProductSum ep_Q2_024_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_024`. -/
theorem ep_Q2_024_sum_valid : checkProductSum ep_Q2_024_blocks = true :=
  ep_Q2_024_valid

end Patterns

end EndpointCertificate

end Problem97
