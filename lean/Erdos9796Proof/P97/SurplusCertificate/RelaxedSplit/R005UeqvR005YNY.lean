/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.R005UeqvR005YNYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.R005UeqvR005YNYBlockShard001

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_productBlocks :
    List (ComputedProductBlock rs_R005_ueqv_R005YNY_generators) :=
[
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_00_0000_0032,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_01_0000_0029,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_02_0000_0041,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_03_0000_0056,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_04_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_04_0100_0126,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_05_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_05_0100_0138,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_06_0000_0000,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_08_0000_0059,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_09_0000_0059,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_10_0000_0034,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_11_0000_0034,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_12_0000_0009,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_13_0000_0034,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_14_0000_0036,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_15_0000_0002,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_16_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_16_0100_0159,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_17_0000_0034,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_18_0000_0028,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_19_0000_0033,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_20_0000_0001,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_21_0000_0033,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_22_0000_0001,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_23_0000_0015,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_24_0000_0059,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_25_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_25_0100_0130,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_26_0000_0053,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_27_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_27_0100_0137,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_28_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_28_0100_0199,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_28_0200_0298,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_29_0000_0024,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_30_0000_0099,
  R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_30_0100_0137
]

/-- Product polynomials for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_blocks : List Poly :=
  computedProductPolys rs_R005_ueqv_R005YNY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
theorem rs_R005_ueqv_R005YNY_valid : checkProductSum rs_R005_ueqv_R005YNY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
theorem rs_R005_ueqv_R005YNY_sum_valid : checkProductSum rs_R005_ueqv_R005YNY_blocks = true :=
  rs_R005_ueqv_R005YNY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
