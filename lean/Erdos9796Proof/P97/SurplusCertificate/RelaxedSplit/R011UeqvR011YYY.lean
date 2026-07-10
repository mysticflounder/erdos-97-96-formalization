/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.R011UeqvR011YYYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.R011UeqvR011YYYBlockShard001

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YYY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_productBlocks :
    List (ComputedProductBlock rs_R011_ueqv_R011YYY_generators) :=
[
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_01_0000_0028,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_02_0000_0033,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_03_0000_0065,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_04_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_04_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_04_0200_0226,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_05_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_05_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_05_0200_0232,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_06_0000_0000,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_07_0000_0009,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_08_0000_0061,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_09_0000_0068,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0200_0299,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0300_0304,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_11_0000_0028,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_12_0000_0047,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_13_0000_0026,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_15_0000_0018,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_16_0000_0029,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_17_0000_0027,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_18_0000_0027,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_19_0000_0032,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_21_0000_0027,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_22_0000_0055,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_24_0000_0025,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_25_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_25_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_25_0200_0226,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_26_0000_0005,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_27_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_27_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_27_0200_0233,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_28_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_28_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_28_0200_0230,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_29_0000_0063,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_30_0000_0099,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_30_0100_0199,
  R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_30_0200_0235
]

/-- Product polynomials for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_blocks : List Poly :=
  computedProductPolys rs_R011_ueqv_R011YYY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
theorem rs_R011_ueqv_R011YYY_valid : checkProductSum rs_R011_ueqv_R011YYY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
theorem rs_R011_ueqv_R011YYY_sum_valid : checkProductSum rs_R011_ueqv_R011YYY_blocks = true :=
  rs_R011_ueqv_R011YYY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
