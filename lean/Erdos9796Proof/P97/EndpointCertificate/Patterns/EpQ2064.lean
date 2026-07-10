/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064TermShards.EpQ2064BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064TermShards.EpQ2064BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064TermShards.EpQ2064BlockShard002

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_064`.

Source certificate: `certificates/endpoint/ep_Q2_064.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_productBlocks :
    List (ComputedProductBlock EpQ2064Generators.ep_Q2_064_generators) :=
[
  EpQ2064TermShards.ep_Q2_064_block_00_0000_0001,
  EpQ2064TermShards.ep_Q2_064_block_01_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_01_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_01_0200_0258,
  EpQ2064TermShards.ep_Q2_064_block_02_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_02_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_02_0200_0257,
  EpQ2064TermShards.ep_Q2_064_block_03_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_03_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_03_0200_0270,
  EpQ2064TermShards.ep_Q2_064_block_05_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_05_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_05_0200_0299,
  EpQ2064TermShards.ep_Q2_064_block_05_0300_0355,
  EpQ2064TermShards.ep_Q2_064_block_06_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_06_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_06_0200_0221,
  EpQ2064TermShards.ep_Q2_064_block_07_0000_0041,
  EpQ2064TermShards.ep_Q2_064_block_08_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_08_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_08_0200_0203,
  EpQ2064TermShards.ep_Q2_064_block_09_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_09_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_09_0200_0248,
  EpQ2064TermShards.ep_Q2_064_block_10_0000_0059,
  EpQ2064TermShards.ep_Q2_064_block_11_0000_0047,
  EpQ2064TermShards.ep_Q2_064_block_12_0000_0053,
  EpQ2064TermShards.ep_Q2_064_block_13_0000_0057,
  EpQ2064TermShards.ep_Q2_064_block_14_0000_0047,
  EpQ2064TermShards.ep_Q2_064_block_15_0000_0039,
  EpQ2064TermShards.ep_Q2_064_block_16_0000_0041,
  EpQ2064TermShards.ep_Q2_064_block_18_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_18_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_18_0200_0250,
  EpQ2064TermShards.ep_Q2_064_block_19_0000_0033,
  EpQ2064TermShards.ep_Q2_064_block_20_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_20_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_20_0200_0258,
  EpQ2064TermShards.ep_Q2_064_block_22_0000_0040,
  EpQ2064TermShards.ep_Q2_064_block_23_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_23_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_23_0200_0273,
  EpQ2064TermShards.ep_Q2_064_block_24_0000_0048,
  EpQ2064TermShards.ep_Q2_064_block_25_0000_0047,
  EpQ2064TermShards.ep_Q2_064_block_26_0000_0055,
  EpQ2064TermShards.ep_Q2_064_block_27_0000_0099,
  EpQ2064TermShards.ep_Q2_064_block_27_0100_0199,
  EpQ2064TermShards.ep_Q2_064_block_27_0200_0272,
  EpQ2064TermShards.ep_Q2_064_block_28_0000_0050,
  EpQ2064TermShards.ep_Q2_064_block_29_0000_0053,
  EpQ2064TermShards.ep_Q2_064_block_30_0000_0005
]

/-- Product polynomials for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_blocks : List Poly :=
  computedProductPolys ep_Q2_064_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_064`. -/
theorem ep_Q2_064_valid : checkProductSum ep_Q2_064_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_064`. -/
theorem ep_Q2_064_sum_valid : checkProductSum ep_Q2_064_blocks = true :=
  ep_Q2_064_valid

end Patterns

end EndpointCertificate

end Problem97
