/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028TermShards.EpQ1028BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028TermShards.EpQ1028BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028TermShards.EpQ1028BlockShard002

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q1_028`.

Source certificate: `certificates/endpoint/ep_Q1_028.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_productBlocks :
    List (ComputedProductBlock EpQ1028Generators.ep_Q1_028_generators) :=
[
  EpQ1028TermShards.ep_Q1_028_block_01_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_01_0100_0111,
  EpQ1028TermShards.ep_Q1_028_block_02_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_02_0100_0111,
  EpQ1028TermShards.ep_Q1_028_block_03_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_03_0100_0125,
  EpQ1028TermShards.ep_Q1_028_block_04_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_04_0100_0114,
  EpQ1028TermShards.ep_Q1_028_block_05_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_05_0100_0126,
  EpQ1028TermShards.ep_Q1_028_block_06_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_06_0100_0133,
  EpQ1028TermShards.ep_Q1_028_block_07_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_07_0100_0119,
  EpQ1028TermShards.ep_Q1_028_block_08_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_08_0100_0104,
  EpQ1028TermShards.ep_Q1_028_block_09_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_09_0100_0199,
  EpQ1028TermShards.ep_Q1_028_block_09_0200_0299,
  EpQ1028TermShards.ep_Q1_028_block_09_0300_0378,
  EpQ1028TermShards.ep_Q1_028_block_10_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_10_0100_0119,
  EpQ1028TermShards.ep_Q1_028_block_11_0000_0091,
  EpQ1028TermShards.ep_Q1_028_block_12_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_12_0100_0121,
  EpQ1028TermShards.ep_Q1_028_block_13_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_13_0100_0119,
  EpQ1028TermShards.ep_Q1_028_block_14_0000_0004,
  EpQ1028TermShards.ep_Q1_028_block_15_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_15_0100_0118,
  EpQ1028TermShards.ep_Q1_028_block_16_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_16_0100_0119,
  EpQ1028TermShards.ep_Q1_028_block_17_0000_0005,
  EpQ1028TermShards.ep_Q1_028_block_18_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_18_0100_0199,
  EpQ1028TermShards.ep_Q1_028_block_18_0200_0299,
  EpQ1028TermShards.ep_Q1_028_block_18_0300_0399,
  EpQ1028TermShards.ep_Q1_028_block_18_0400_0428,
  EpQ1028TermShards.ep_Q1_028_block_19_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_19_0100_0136,
  EpQ1028TermShards.ep_Q1_028_block_20_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_20_0100_0111,
  EpQ1028TermShards.ep_Q1_028_block_21_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_21_0100_0114,
  EpQ1028TermShards.ep_Q1_028_block_22_0000_0068,
  EpQ1028TermShards.ep_Q1_028_block_23_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_23_0100_0133,
  EpQ1028TermShards.ep_Q1_028_block_24_0000_0001,
  EpQ1028TermShards.ep_Q1_028_block_25_0000_0096,
  EpQ1028TermShards.ep_Q1_028_block_26_0000_0023,
  EpQ1028TermShards.ep_Q1_028_block_27_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_27_0100_0109,
  EpQ1028TermShards.ep_Q1_028_block_28_0000_0099,
  EpQ1028TermShards.ep_Q1_028_block_28_0100_0107,
  EpQ1028TermShards.ep_Q1_028_block_29_0000_0009,
  EpQ1028TermShards.ep_Q1_028_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_blocks : List Poly :=
  computedProductPolys ep_Q1_028_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q1_028`. -/
theorem ep_Q1_028_valid : checkProductSum ep_Q1_028_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q1_028`. -/
theorem ep_Q1_028_sum_valid : checkProductSum ep_Q1_028_blocks = true :=
  ep_Q1_028_valid

end Patterns

end EndpointCertificate

end Problem97
