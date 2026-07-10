/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019TermShards.EpQ2019BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019TermShards.EpQ2019BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019TermShards.EpQ2019BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2019TermShards.EpQ2019BlockShard003

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_019`.

Source certificate: `certificates/endpoint/ep_Q2_019.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_productBlocks :
    List (ComputedProductBlock EpQ2019Generators.ep_Q2_019_generators) :=
[
  EpQ2019TermShards.ep_Q2_019_block_00_0000_0003,
  EpQ2019TermShards.ep_Q2_019_block_01_0000_0070,
  EpQ2019TermShards.ep_Q2_019_block_02_0000_0092,
  EpQ2019TermShards.ep_Q2_019_block_03_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_03_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_03_0200_0299,
  EpQ2019TermShards.ep_Q2_019_block_03_0300_0399,
  EpQ2019TermShards.ep_Q2_019_block_03_0400_0414,
  EpQ2019TermShards.ep_Q2_019_block_04_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_04_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_04_0200_0299,
  EpQ2019TermShards.ep_Q2_019_block_04_0300_0399,
  EpQ2019TermShards.ep_Q2_019_block_04_0400_0425,
  EpQ2019TermShards.ep_Q2_019_block_05_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_05_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_05_0200_0280,
  EpQ2019TermShards.ep_Q2_019_block_06_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_06_0100_0141,
  EpQ2019TermShards.ep_Q2_019_block_07_0000_0092,
  EpQ2019TermShards.ep_Q2_019_block_08_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_08_0100_0198,
  EpQ2019TermShards.ep_Q2_019_block_09_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_09_0100_0165,
  EpQ2019TermShards.ep_Q2_019_block_10_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_10_0100_0153,
  EpQ2019TermShards.ep_Q2_019_block_11_0000_0055,
  EpQ2019TermShards.ep_Q2_019_block_12_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_12_0100_0153,
  EpQ2019TermShards.ep_Q2_019_block_13_0000_0022,
  EpQ2019TermShards.ep_Q2_019_block_14_0000_0065,
  EpQ2019TermShards.ep_Q2_019_block_15_0000_0042,
  EpQ2019TermShards.ep_Q2_019_block_16_0000_0033,
  EpQ2019TermShards.ep_Q2_019_block_17_0000_0052,
  EpQ2019TermShards.ep_Q2_019_block_18_0000_0050,
  EpQ2019TermShards.ep_Q2_019_block_19_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_19_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_19_0200_0299,
  EpQ2019TermShards.ep_Q2_019_block_19_0300_0399,
  EpQ2019TermShards.ep_Q2_019_block_20_0000_0040,
  EpQ2019TermShards.ep_Q2_019_block_21_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_21_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_21_0200_0299,
  EpQ2019TermShards.ep_Q2_019_block_21_0300_0399,
  EpQ2019TermShards.ep_Q2_019_block_21_0400_0499,
  EpQ2019TermShards.ep_Q2_019_block_21_0500_0599,
  EpQ2019TermShards.ep_Q2_019_block_21_0600_0699,
  EpQ2019TermShards.ep_Q2_019_block_21_0700_0703,
  EpQ2019TermShards.ep_Q2_019_block_22_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_22_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_22_0200_0299,
  EpQ2019TermShards.ep_Q2_019_block_22_0300_0399,
  EpQ2019TermShards.ep_Q2_019_block_22_0400_0413,
  EpQ2019TermShards.ep_Q2_019_block_23_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_23_0100_0199,
  EpQ2019TermShards.ep_Q2_019_block_23_0200_0210,
  EpQ2019TermShards.ep_Q2_019_block_24_0000_0053,
  EpQ2019TermShards.ep_Q2_019_block_25_0000_0045,
  EpQ2019TermShards.ep_Q2_019_block_26_0000_0074,
  EpQ2019TermShards.ep_Q2_019_block_27_0000_0093,
  EpQ2019TermShards.ep_Q2_019_block_28_0000_0040,
  EpQ2019TermShards.ep_Q2_019_block_29_0000_0099,
  EpQ2019TermShards.ep_Q2_019_block_29_0100_0109,
  EpQ2019TermShards.ep_Q2_019_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_blocks : List Poly :=
  computedProductPolys ep_Q2_019_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_019`. -/
theorem ep_Q2_019_valid : checkProductSum ep_Q2_019_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_019`. -/
theorem ep_Q2_019_sum_valid : checkProductSum ep_Q2_019_blocks = true :=
  ep_Q2_019_valid

end Patterns

end EndpointCertificate

end Problem97
