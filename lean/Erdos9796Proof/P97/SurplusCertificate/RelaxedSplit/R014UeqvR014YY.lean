/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlockShard002

/-!
# Relaxed split surplus certificate R014:u=v:R014YY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_productBlocks :
    List (ComputedProductBlock rs_R014_ueqv_R014YY_generators) :=
[
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_01_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_01_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_01_0200_0288,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_02_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_02_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_02_0200_0288,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_03_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_03_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_03_0200_0287,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_04_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_04_0100_0194,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_05_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_05_0100_0170,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_06_0000_0003,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_08_0000_0049,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_09_0000_0047,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_10_0000_0038,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_11_0000_0011,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_12_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_12_0100_0115,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_13_0000_0039,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_14_0000_0049,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_15_0000_0020,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0200_0299,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0300_0311,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_17_0000_0047,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_18_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_18_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_18_0200_0288,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_19_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_19_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_19_0200_0289,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_20_0000_0006,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_21_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_21_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_21_0200_0288,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_22_0000_0014,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_23_0000_0016,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_24_0000_0054,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0100_0199,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0200_0299,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0300_0399,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0400_0499,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0500_0599,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0600_0699,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_25_0700_0746,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_26_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_26_0100_0175,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_27_0000_0099,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_27_0100_0182,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_29_0000_0035,
  R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_30_0000_0034
]

/-- Product polynomials for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_blocks : List Poly :=
  computedProductPolys rs_R014_ueqv_R014YY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R014:u=v:R014YY`. -/
theorem rs_R014_ueqv_R014YY_valid : checkProductSum rs_R014_ueqv_R014YY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R014:u=v:R014YY`. -/
theorem rs_R014_ueqv_R014YY_sum_valid : checkProductSum rs_R014_ueqv_R014YY_blocks = true :=
  rs_R014_ueqv_R014YY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
