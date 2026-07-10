/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074TermShards.EpQ2074BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074TermShards.EpQ2074BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074TermShards.EpQ2074BlockShard002

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_074`.

Source certificate: `certificates/endpoint/ep_Q2_074.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_productBlocks :
    List (ComputedProductBlock EpQ2074Generators.ep_Q2_074_generators) :=
[
  EpQ2074TermShards.ep_Q2_074_block_00_0000_0034,
  EpQ2074TermShards.ep_Q2_074_block_01_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_01_0100_0150,
  EpQ2074TermShards.ep_Q2_074_block_02_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_02_0100_0185,
  EpQ2074TermShards.ep_Q2_074_block_03_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_03_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_03_0200_0225,
  EpQ2074TermShards.ep_Q2_074_block_04_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_04_0100_0150,
  EpQ2074TermShards.ep_Q2_074_block_05_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_05_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_05_0200_0299,
  EpQ2074TermShards.ep_Q2_074_block_05_0300_0338,
  EpQ2074TermShards.ep_Q2_074_block_07_0000_0085,
  EpQ2074TermShards.ep_Q2_074_block_08_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_08_0100_0115,
  EpQ2074TermShards.ep_Q2_074_block_09_0000_0071,
  EpQ2074TermShards.ep_Q2_074_block_11_0000_0040,
  EpQ2074TermShards.ep_Q2_074_block_12_0000_0039,
  EpQ2074TermShards.ep_Q2_074_block_13_0000_0022,
  EpQ2074TermShards.ep_Q2_074_block_15_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_15_0100_0185,
  EpQ2074TermShards.ep_Q2_074_block_16_0000_0010,
  EpQ2074TermShards.ep_Q2_074_block_17_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_17_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_17_0200_0299,
  EpQ2074TermShards.ep_Q2_074_block_17_0300_0337,
  EpQ2074TermShards.ep_Q2_074_block_18_0000_0017,
  EpQ2074TermShards.ep_Q2_074_block_19_0000_0005,
  EpQ2074TermShards.ep_Q2_074_block_20_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_20_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_20_0200_0225,
  EpQ2074TermShards.ep_Q2_074_block_21_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_21_0100_0142,
  EpQ2074TermShards.ep_Q2_074_block_22_0000_0025,
  EpQ2074TermShards.ep_Q2_074_block_24_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_24_0100_0121,
  EpQ2074TermShards.ep_Q2_074_block_25_0000_0016,
  EpQ2074TermShards.ep_Q2_074_block_26_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_26_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_26_0200_0225,
  EpQ2074TermShards.ep_Q2_074_block_27_0000_0055,
  EpQ2074TermShards.ep_Q2_074_block_28_0000_0099,
  EpQ2074TermShards.ep_Q2_074_block_28_0100_0199,
  EpQ2074TermShards.ep_Q2_074_block_28_0200_0299,
  EpQ2074TermShards.ep_Q2_074_block_28_0300_0345,
  EpQ2074TermShards.ep_Q2_074_block_29_0000_0090,
  EpQ2074TermShards.ep_Q2_074_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_blocks : List Poly :=
  computedProductPolys ep_Q2_074_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_074`. -/
theorem ep_Q2_074_valid : checkProductSum ep_Q2_074_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_074`. -/
theorem ep_Q2_074_sum_valid : checkProductSum ep_Q2_074_blocks = true :=
  ep_Q2_074_valid

end Patterns

end EndpointCertificate

end Problem97
