/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.R003UeqvR003NYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.R003UeqvR003NYBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.R003UeqvR003NYBlockShard002

/-!
# Relaxed split surplus certificate R003:u=v:R003NY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_productBlocks :
    List (ComputedProductBlock rs_R003_ueqv_R003NY_generators) :=
[
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0200_0275,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0200_0266,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_02_0000_0075,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0200_0270,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_04_0000_0051,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0200_0299,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0300_0345,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_06_0000_0000,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_07_0000_0016,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_09_0000_0025,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0200_0278,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0200_0241,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0200_0299,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0300_0343,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0200_0245,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_14_0000_0003,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_15_0000_0069,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_16_0000_0005,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_17_0000_0007,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_19_0000_0034,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_20_0000_0007,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_21_0000_0041,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0200_0280,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_23_0000_0087,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_24_0000_0058,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_26_0000_0005,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_27_0000_0009,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0000_0099,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0100_0199,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0200_0299,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0300_0343,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_29_0000_0040,
  R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_30_0000_0027
]

/-- Product polynomials for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_blocks : List Poly :=
  computedProductPolys rs_R003_ueqv_R003NY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R003:u=v:R003NY`. -/
theorem rs_R003_ueqv_R003NY_valid : checkProductSum rs_R003_ueqv_R003NY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R003:u=v:R003NY`. -/
theorem rs_R003_ueqv_R003NY_sum_valid : checkProductSum rs_R003_ueqv_R003NY_blocks = true :=
  rs_R003_ueqv_R003NY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
