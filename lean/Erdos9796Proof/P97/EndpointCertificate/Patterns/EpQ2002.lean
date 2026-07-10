/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2002TermShards.EpQ2002BlockShard004

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_002`.

Source certificate: `certificates/endpoint/ep_Q2_002.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_productBlocks :
    List (ComputedProductBlock EpQ2002Generators.ep_Q2_002_generators) :=
[
  EpQ2002TermShards.ep_Q2_002_block_00_0000_0042,
  EpQ2002TermShards.ep_Q2_002_block_01_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_01_0100_0110,
  EpQ2002TermShards.ep_Q2_002_block_02_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_02_0100_0128,
  EpQ2002TermShards.ep_Q2_002_block_03_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_03_0100_0133,
  EpQ2002TermShards.ep_Q2_002_block_04_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_04_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_04_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_04_0300_0344,
  EpQ2002TermShards.ep_Q2_002_block_05_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_05_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_05_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_05_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_05_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_05_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_05_0600_0699,
  EpQ2002TermShards.ep_Q2_002_block_05_0700_0716,
  EpQ2002TermShards.ep_Q2_002_block_07_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_07_0100_0148,
  EpQ2002TermShards.ep_Q2_002_block_08_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_08_0100_0175,
  EpQ2002TermShards.ep_Q2_002_block_09_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_09_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_09_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_09_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_09_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_09_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_09_0600_0699,
  EpQ2002TermShards.ep_Q2_002_block_09_0700_0799,
  EpQ2002TermShards.ep_Q2_002_block_09_0800_0899,
  EpQ2002TermShards.ep_Q2_002_block_09_0900_0999,
  EpQ2002TermShards.ep_Q2_002_block_09_1000_1098,
  EpQ2002TermShards.ep_Q2_002_block_10_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_10_0100_0164,
  EpQ2002TermShards.ep_Q2_002_block_11_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_11_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_11_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_11_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_11_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_11_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_11_0600_0699,
  EpQ2002TermShards.ep_Q2_002_block_11_0700_0716,
  EpQ2002TermShards.ep_Q2_002_block_12_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_12_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_12_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_13_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_13_0100_0121,
  EpQ2002TermShards.ep_Q2_002_block_14_0000_0073,
  EpQ2002TermShards.ep_Q2_002_block_15_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_15_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_15_0200_0245,
  EpQ2002TermShards.ep_Q2_002_block_16_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_16_0100_0122,
  EpQ2002TermShards.ep_Q2_002_block_17_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_17_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_17_0200_0214,
  EpQ2002TermShards.ep_Q2_002_block_19_0000_0036,
  EpQ2002TermShards.ep_Q2_002_block_20_0000_0093,
  EpQ2002TermShards.ep_Q2_002_block_21_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_21_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_21_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_21_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_21_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_21_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_21_0600_0691,
  EpQ2002TermShards.ep_Q2_002_block_22_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_22_0100_0117,
  EpQ2002TermShards.ep_Q2_002_block_23_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_23_0100_0132,
  EpQ2002TermShards.ep_Q2_002_block_24_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_24_0100_0116,
  EpQ2002TermShards.ep_Q2_002_block_25_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_25_0100_0111,
  EpQ2002TermShards.ep_Q2_002_block_26_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_26_0100_0173,
  EpQ2002TermShards.ep_Q2_002_block_27_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_27_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_27_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_27_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_27_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_27_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_27_0600_0686,
  EpQ2002TermShards.ep_Q2_002_block_28_0000_0099,
  EpQ2002TermShards.ep_Q2_002_block_28_0100_0199,
  EpQ2002TermShards.ep_Q2_002_block_28_0200_0299,
  EpQ2002TermShards.ep_Q2_002_block_28_0300_0399,
  EpQ2002TermShards.ep_Q2_002_block_28_0400_0499,
  EpQ2002TermShards.ep_Q2_002_block_28_0500_0599,
  EpQ2002TermShards.ep_Q2_002_block_28_0600_0699,
  EpQ2002TermShards.ep_Q2_002_block_28_0700_0701,
  EpQ2002TermShards.ep_Q2_002_block_29_0000_0097,
  EpQ2002TermShards.ep_Q2_002_block_30_0000_0000
]

/-- Product polynomials for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_blocks : List Poly :=
  computedProductPolys ep_Q2_002_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_002`. -/
theorem ep_Q2_002_valid : checkProductSum ep_Q2_002_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_002`. -/
theorem ep_Q2_002_sum_valid : checkProductSum ep_Q2_002_blocks = true :=
  ep_Q2_002_valid

end Patterns

end EndpointCertificate

end Problem97
