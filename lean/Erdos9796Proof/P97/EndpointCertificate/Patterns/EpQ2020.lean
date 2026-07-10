/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020TermShards.EpQ2020BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020TermShards.EpQ2020BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2020TermShards.EpQ2020BlockShard002

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_020`.

Source certificate: `certificates/endpoint/ep_Q2_020.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_productBlocks :
    List (ComputedProductBlock EpQ2020Generators.ep_Q2_020_generators) :=
[
  EpQ2020TermShards.ep_Q2_020_block_00_0000_0037,
  EpQ2020TermShards.ep_Q2_020_block_01_0000_0062,
  EpQ2020TermShards.ep_Q2_020_block_02_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_02_0100_0136,
  EpQ2020TermShards.ep_Q2_020_block_03_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_03_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_03_0200_0299,
  EpQ2020TermShards.ep_Q2_020_block_03_0300_0376,
  EpQ2020TermShards.ep_Q2_020_block_04_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_04_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_04_0200_0299,
  EpQ2020TermShards.ep_Q2_020_block_04_0300_0399,
  EpQ2020TermShards.ep_Q2_020_block_04_0400_0401,
  EpQ2020TermShards.ep_Q2_020_block_05_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_05_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_05_0200_0209,
  EpQ2020TermShards.ep_Q2_020_block_06_0000_0034,
  EpQ2020TermShards.ep_Q2_020_block_07_0000_0046,
  EpQ2020TermShards.ep_Q2_020_block_08_0000_0077,
  EpQ2020TermShards.ep_Q2_020_block_09_0000_0053,
  EpQ2020TermShards.ep_Q2_020_block_10_0000_0051,
  EpQ2020TermShards.ep_Q2_020_block_11_0000_0025,
  EpQ2020TermShards.ep_Q2_020_block_12_0000_0034,
  EpQ2020TermShards.ep_Q2_020_block_13_0000_0030,
  EpQ2020TermShards.ep_Q2_020_block_14_0000_0027,
  EpQ2020TermShards.ep_Q2_020_block_15_0000_0041,
  EpQ2020TermShards.ep_Q2_020_block_16_0000_0000,
  EpQ2020TermShards.ep_Q2_020_block_17_0000_0051,
  EpQ2020TermShards.ep_Q2_020_block_18_0000_0064,
  EpQ2020TermShards.ep_Q2_020_block_19_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_19_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_19_0200_0299,
  EpQ2020TermShards.ep_Q2_020_block_19_0300_0350,
  EpQ2020TermShards.ep_Q2_020_block_20_0000_0029,
  EpQ2020TermShards.ep_Q2_020_block_21_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_21_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_21_0200_0299,
  EpQ2020TermShards.ep_Q2_020_block_21_0300_0399,
  EpQ2020TermShards.ep_Q2_020_block_21_0400_0499,
  EpQ2020TermShards.ep_Q2_020_block_21_0500_0599,
  EpQ2020TermShards.ep_Q2_020_block_21_0600_0693,
  EpQ2020TermShards.ep_Q2_020_block_22_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_22_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_22_0200_0299,
  EpQ2020TermShards.ep_Q2_020_block_22_0300_0376,
  EpQ2020TermShards.ep_Q2_020_block_23_0000_0099,
  EpQ2020TermShards.ep_Q2_020_block_23_0100_0199,
  EpQ2020TermShards.ep_Q2_020_block_23_0200_0204,
  EpQ2020TermShards.ep_Q2_020_block_24_0000_0013,
  EpQ2020TermShards.ep_Q2_020_block_25_0000_0029,
  EpQ2020TermShards.ep_Q2_020_block_26_0000_0038,
  EpQ2020TermShards.ep_Q2_020_block_27_0000_0039,
  EpQ2020TermShards.ep_Q2_020_block_28_0000_0055,
  EpQ2020TermShards.ep_Q2_020_block_29_0000_0052,
  EpQ2020TermShards.ep_Q2_020_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_blocks : List Poly :=
  computedProductPolys ep_Q2_020_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_020`. -/
theorem ep_Q2_020_valid : checkProductSum ep_Q2_020_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_020`. -/
theorem ep_Q2_020_sum_valid : checkProductSum ep_Q2_020_blocks = true :=
  ep_Q2_020_valid

end Patterns

end EndpointCertificate

end Problem97
