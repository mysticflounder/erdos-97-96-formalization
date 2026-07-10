/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.R007UeqvR007NYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.R007UeqvR007NYBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.R007UeqvR007NYBlockShard002

/-!
# Relaxed split surplus certificate R007:u=v:R007NY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_productBlocks :
    List (ComputedProductBlock rs_R007_ueqv_R007NY_generators) :=
[
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_00_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_00_0100_0178,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_01_0000_0078,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_03_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_03_0100_0199,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_03_0200_0271,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_04_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_04_0100_0145,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_05_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_05_0100_0188,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_06_0000_0020,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_07_0000_0066,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_08_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_08_0100_0104,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_09_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_09_0100_0198,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_10_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_10_0100_0111,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_11_0000_0034,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_12_0000_0079,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_13_0000_0082,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_14_0000_0083,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_15_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_15_0100_0102,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0100_0199,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0200_0299,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0300_0399,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0400_0499,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0500_0599,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0600_0699,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0700_0799,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0800_0899,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_0900_0999,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_16_1000_1081,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_17_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_17_0100_0125,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_18_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_18_0100_0199,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_18_0200_0239,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_20_0000_0077,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_21_0000_0063,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_22_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_22_0100_0186,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_23_0000_0046,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_24_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_24_0100_0148,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_26_0000_0089,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_27_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_27_0100_0136,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_28_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_28_0100_0110,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0100_0199,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0200_0299,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0300_0315,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_30_0000_0099,
  R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_30_0100_0155
]

/-- Product polynomials for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_blocks : List Poly :=
  computedProductPolys rs_R007_ueqv_R007NY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R007:u=v:R007NY`. -/
theorem rs_R007_ueqv_R007NY_valid : checkProductSum rs_R007_ueqv_R007NY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R007:u=v:R007NY`. -/
theorem rs_R007_ueqv_R007NY_sum_valid : checkProductSum rs_R007_ueqv_R007NY_blocks = true :=
  rs_R007_ueqv_R007NY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
