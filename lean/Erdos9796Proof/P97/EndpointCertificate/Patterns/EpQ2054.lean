/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054TermShards.EpQ2054BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054TermShards.EpQ2054BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054TermShards.EpQ2054BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2054TermShards.EpQ2054BlockShard003

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_054`.

Source certificate: `certificates/endpoint/ep_Q2_054.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_productBlocks :
    List (ComputedProductBlock EpQ2054Generators.ep_Q2_054_generators) :=
[
  EpQ2054TermShards.ep_Q2_054_block_00_0000_0037,
  EpQ2054TermShards.ep_Q2_054_block_01_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_01_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_01_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_01_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_01_0400_0496,
  EpQ2054TermShards.ep_Q2_054_block_02_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_02_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_02_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_02_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_02_0400_0496,
  EpQ2054TermShards.ep_Q2_054_block_03_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_03_0100_0150,
  EpQ2054TermShards.ep_Q2_054_block_04_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_04_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_04_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_04_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_04_0400_0457,
  EpQ2054TermShards.ep_Q2_054_block_05_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_05_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_05_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_05_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_05_0400_0478,
  EpQ2054TermShards.ep_Q2_054_block_07_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_07_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_07_0200_0236,
  EpQ2054TermShards.ep_Q2_054_block_08_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_08_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_08_0200_0233,
  EpQ2054TermShards.ep_Q2_054_block_10_0000_0051,
  EpQ2054TermShards.ep_Q2_054_block_11_0000_0050,
  EpQ2054TermShards.ep_Q2_054_block_13_0000_0029,
  EpQ2054TermShards.ep_Q2_054_block_14_0000_0019,
  EpQ2054TermShards.ep_Q2_054_block_15_0000_0085,
  EpQ2054TermShards.ep_Q2_054_block_16_0000_0038,
  EpQ2054TermShards.ep_Q2_054_block_17_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_17_0100_0189,
  EpQ2054TermShards.ep_Q2_054_block_19_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_19_0100_0187,
  EpQ2054TermShards.ep_Q2_054_block_20_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_20_0100_0187,
  EpQ2054TermShards.ep_Q2_054_block_21_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_21_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_21_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_21_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_21_0400_0468,
  EpQ2054TermShards.ep_Q2_054_block_22_0000_0032,
  EpQ2054TermShards.ep_Q2_054_block_23_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_23_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_23_0200_0229,
  EpQ2054TermShards.ep_Q2_054_block_24_0000_0086,
  EpQ2054TermShards.ep_Q2_054_block_25_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_25_0100_0100,
  EpQ2054TermShards.ep_Q2_054_block_26_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_26_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_26_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_26_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_26_0400_0499,
  EpQ2054TermShards.ep_Q2_054_block_26_0500_0506,
  EpQ2054TermShards.ep_Q2_054_block_27_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_27_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_27_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_27_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_27_0400_0499,
  EpQ2054TermShards.ep_Q2_054_block_27_0500_0599,
  EpQ2054TermShards.ep_Q2_054_block_27_0600_0699,
  EpQ2054TermShards.ep_Q2_054_block_27_0700_0799,
  EpQ2054TermShards.ep_Q2_054_block_27_0800_0899,
  EpQ2054TermShards.ep_Q2_054_block_27_0900_0952,
  EpQ2054TermShards.ep_Q2_054_block_28_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_28_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_28_0200_0284,
  EpQ2054TermShards.ep_Q2_054_block_29_0000_0099,
  EpQ2054TermShards.ep_Q2_054_block_29_0100_0199,
  EpQ2054TermShards.ep_Q2_054_block_29_0200_0299,
  EpQ2054TermShards.ep_Q2_054_block_29_0300_0399,
  EpQ2054TermShards.ep_Q2_054_block_29_0400_0499,
  EpQ2054TermShards.ep_Q2_054_block_29_0500_0528,
  EpQ2054TermShards.ep_Q2_054_block_30_0000_0050
]

/-- Product polynomials for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_blocks : List Poly :=
  computedProductPolys ep_Q2_054_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_054`. -/
theorem ep_Q2_054_valid : checkProductSum ep_Q2_054_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_054`. -/
theorem ep_Q2_054_sum_valid : checkProductSum ep_Q2_054_blocks = true :=
  ep_Q2_054_valid

end Patterns

end EndpointCertificate

end Problem97
