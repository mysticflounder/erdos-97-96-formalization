/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041Generators
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard000
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard001
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard002
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard003
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard004
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard005
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard006
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard007
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard008
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard009
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard010
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard011
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard012
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041TermShards.EpQ2041BlockShard013

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041

This generated coordinator computes products from bounded coefficient blocks
and checks one final product-sum identity for endpoint certificate row `ep_Q2_041`.

Source certificate: `certificates/endpoint/ep_Q2_041.json`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Computed coefficient-generator blocks for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_productBlocks :
    List (ComputedProductBlock EpQ2041Generators.ep_Q2_041_generators) :=
[
  EpQ2041TermShards.ep_Q2_041_block_00_0000_0026,
  EpQ2041TermShards.ep_Q2_041_block_01_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_01_0100_0113,
  EpQ2041TermShards.ep_Q2_041_block_02_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_02_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_02_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_02_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_02_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_02_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_02_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_02_0700_0788,
  EpQ2041TermShards.ep_Q2_041_block_04_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_04_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_04_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_04_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_04_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_04_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_04_0600_0698,
  EpQ2041TermShards.ep_Q2_041_block_05_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_05_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_05_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_05_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_05_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_05_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_05_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_05_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_05_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_05_0900_0999,
  EpQ2041TermShards.ep_Q2_041_block_05_1000_1001,
  EpQ2041TermShards.ep_Q2_041_block_08_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_08_0100_0169,
  EpQ2041TermShards.ep_Q2_041_block_09_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_09_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_09_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_09_0300_0319,
  EpQ2041TermShards.ep_Q2_041_block_11_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_11_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_11_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_11_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_11_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_11_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_11_0600_0660,
  EpQ2041TermShards.ep_Q2_041_block_12_0000_0040,
  EpQ2041TermShards.ep_Q2_041_block_13_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_13_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_13_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_13_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_13_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_13_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_13_0600_0628,
  EpQ2041TermShards.ep_Q2_041_block_14_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_14_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_14_0200_0277,
  EpQ2041TermShards.ep_Q2_041_block_15_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_15_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_15_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_15_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_15_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_15_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_15_0600_0690,
  EpQ2041TermShards.ep_Q2_041_block_16_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_16_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_16_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_16_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_16_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_16_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_16_0600_0627,
  EpQ2041TermShards.ep_Q2_041_block_17_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_17_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_17_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_17_0300_0383,
  EpQ2041TermShards.ep_Q2_041_block_18_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_18_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_18_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_18_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_18_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_18_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_18_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_18_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_18_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_18_0900_0999,
  EpQ2041TermShards.ep_Q2_041_block_18_1000_1099,
  EpQ2041TermShards.ep_Q2_041_block_18_1100_1199,
  EpQ2041TermShards.ep_Q2_041_block_18_1200_1299,
  EpQ2041TermShards.ep_Q2_041_block_18_1300_1399,
  EpQ2041TermShards.ep_Q2_041_block_18_1400_1499,
  EpQ2041TermShards.ep_Q2_041_block_18_1500_1599,
  EpQ2041TermShards.ep_Q2_041_block_18_1600_1699,
  EpQ2041TermShards.ep_Q2_041_block_18_1700_1799,
  EpQ2041TermShards.ep_Q2_041_block_18_1800_1899,
  EpQ2041TermShards.ep_Q2_041_block_18_1900_1999,
  EpQ2041TermShards.ep_Q2_041_block_18_2000_2099,
  EpQ2041TermShards.ep_Q2_041_block_18_2100_2199,
  EpQ2041TermShards.ep_Q2_041_block_18_2200_2299,
  EpQ2041TermShards.ep_Q2_041_block_18_2300_2399,
  EpQ2041TermShards.ep_Q2_041_block_18_2400_2499,
  EpQ2041TermShards.ep_Q2_041_block_18_2500_2594,
  EpQ2041TermShards.ep_Q2_041_block_19_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_19_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_19_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_19_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_19_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_19_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_19_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_19_0700_0780,
  EpQ2041TermShards.ep_Q2_041_block_20_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_20_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_20_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_20_0300_0395,
  EpQ2041TermShards.ep_Q2_041_block_21_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_21_0100_0131,
  EpQ2041TermShards.ep_Q2_041_block_22_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_22_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_22_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_22_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_22_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_22_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_22_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_22_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_22_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_22_0900_0963,
  EpQ2041TermShards.ep_Q2_041_block_23_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_23_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_23_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_23_0300_0375,
  EpQ2041TermShards.ep_Q2_041_block_24_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_24_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_24_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_24_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_24_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_24_0500_0507,
  EpQ2041TermShards.ep_Q2_041_block_25_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_25_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_25_0200_0219,
  EpQ2041TermShards.ep_Q2_041_block_26_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_26_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_26_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_26_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_26_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_26_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_26_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_26_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_26_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_26_0900_0999,
  EpQ2041TermShards.ep_Q2_041_block_26_1000_1030,
  EpQ2041TermShards.ep_Q2_041_block_27_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_27_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_27_0200_0249,
  EpQ2041TermShards.ep_Q2_041_block_28_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_28_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_28_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_28_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_28_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_28_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_28_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_28_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_28_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_28_0900_0982,
  EpQ2041TermShards.ep_Q2_041_block_29_0000_0099,
  EpQ2041TermShards.ep_Q2_041_block_29_0100_0199,
  EpQ2041TermShards.ep_Q2_041_block_29_0200_0299,
  EpQ2041TermShards.ep_Q2_041_block_29_0300_0399,
  EpQ2041TermShards.ep_Q2_041_block_29_0400_0499,
  EpQ2041TermShards.ep_Q2_041_block_29_0500_0599,
  EpQ2041TermShards.ep_Q2_041_block_29_0600_0699,
  EpQ2041TermShards.ep_Q2_041_block_29_0700_0799,
  EpQ2041TermShards.ep_Q2_041_block_29_0800_0899,
  EpQ2041TermShards.ep_Q2_041_block_29_0900_0999,
  EpQ2041TermShards.ep_Q2_041_block_29_1000_1003,
  EpQ2041TermShards.ep_Q2_041_block_30_0000_0011
]

/-- Product polynomials for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_blocks : List Poly :=
  computedProductPolys ep_Q2_041_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked product-sum identity for endpoint certificate `ep_Q2_041`. -/
theorem ep_Q2_041_valid : checkProductSum ep_Q2_041_blocks = true := by
  native_decide

/-- Alias for the checked product-sum identity for endpoint certificate `ep_Q2_041`. -/
theorem ep_Q2_041_sum_valid : checkProductSum ep_Q2_041_blocks = true :=
  ep_Q2_041_valid

end Patterns

end EndpointCertificate

end Problem97
