/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.R011UeqvR011NNNYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.R011UeqvR011NNNYBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.R011UeqvR011NNNYBlockShard002

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNNY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_productBlocks :
    List (ComputedProductBlock rs_R011_ueqv_R011NNNY_generators) :=
[
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_01_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_01_0100_0124,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_02_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_02_0100_0124,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_03_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_03_0100_0122,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_05_0000_0090,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_06_0000_0000,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_07_0000_0003,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_08_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_08_0100_0125,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_10_0000_0021,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_11_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_11_0100_0125,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_12_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_12_0100_0114,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_13_0000_0050,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_14_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_14_0100_0111,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_15_0000_0091,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_16_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_16_0100_0199,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_16_0200_0299,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_16_0300_0311,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_17_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_17_0100_0127,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_18_0000_0064,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_19_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_19_0100_0121,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_20_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_20_0100_0110,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_21_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_21_0100_0110,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_22_0000_0006,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_23_0000_0010,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_24_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_24_0100_0125,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0100_0199,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0200_0299,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0300_0399,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0400_0499,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_25_0500_0545,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_26_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_26_0100_0111,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_27_0000_0068,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_28_0000_0099,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_28_0100_0114,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_29_0000_0015,
  R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_30_0000_0090
]

/-- Product polynomials for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_blocks : List Poly :=
  computedProductPolys rs_R011_ueqv_R011NNNY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
theorem rs_R011_ueqv_R011NNNY_valid : checkProductSum rs_R011_ueqv_R011NNNY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
theorem rs_R011_ueqv_R011NNNY_sum_valid : checkProductSum rs_R011_ueqv_R011NNNY_blocks = true :=
  rs_R011_ueqv_R011NNNY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
