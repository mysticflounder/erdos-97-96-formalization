/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.R009UeqvR009NNNNYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.R009UeqvR009NNNNYBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.R009UeqvR009NNNNYBlockShard002

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNNY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_productBlocks :
    List (ComputedProductBlock rs_R009_ueqv_R009NNNNY_generators) :=
[
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_00_0000_0056,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_01_0000_0054,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_02_0000_0028,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_03_0000_0050,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_04_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_04_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_04_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_04_0300_0309,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_05_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_05_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_05_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_05_0300_0304,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_06_0000_0000,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_07_0000_0011,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_08_0000_0014,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_09_0000_0023,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_10_0000_0037,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_11_0000_0018,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_12_0000_0024,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_13_0000_0029,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_14_0000_0014,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_15_0000_0042,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_16_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_16_0100_0110,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_17_0000_0025,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_18_0000_0019,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_20_0000_0011,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_21_0000_0010,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_22_0000_0028,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_23_0000_0016,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_24_0000_0029,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_25_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_25_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_25_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_25_0300_0307,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_26_0000_0022,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_27_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_27_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_27_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_27_0300_0310,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_28_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_28_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_28_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_28_0300_0311,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_29_0000_0033,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_30_0000_0099,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_30_0100_0199,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_30_0200_0299,
  R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_30_0300_0310
]

/-- Product polynomials for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_blocks : List Poly :=
  computedProductPolys rs_R009_ueqv_R009NNNNY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
theorem rs_R009_ueqv_R009NNNNY_valid : checkProductSum rs_R009_ueqv_R009NNNNY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
theorem rs_R009_ueqv_R009NNNNY_sum_valid : checkProductSum rs_R009_ueqv_R009NNNNY_blocks = true :=
  rs_R009_ueqv_R009NNNNY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
