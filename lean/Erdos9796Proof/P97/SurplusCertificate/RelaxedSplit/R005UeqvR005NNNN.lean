/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005NNNNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005NNNNTermShards.R005UeqvR005NNNNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005NNNNTermShards.R005UeqvR005NNNNBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005NNNNTermShards.R005UeqvR005NNNNBlockShard002

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NNNN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_productBlocks :
    List (ComputedProductBlock rs_R005_ueqv_R005NNNN_generators) :=
[
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_01_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_01_0100_0124,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_02_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_02_0100_0124,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_03_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_03_0100_0122,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_05_0000_0090,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_06_0000_0000,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_07_0000_0003,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_08_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_08_0100_0125,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_10_0000_0050,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_11_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_11_0100_0111,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_12_0000_0091,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_13_0000_0021,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_14_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_14_0100_0125,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_15_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_15_0100_0114,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_16_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_16_0100_0199,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_16_0200_0299,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_16_0300_0311,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_17_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_17_0100_0127,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_18_0000_0064,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_19_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_19_0100_0121,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_20_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_20_0100_0110,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_21_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_21_0100_0110,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_22_0000_0006,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_23_0000_0010,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_24_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_24_0100_0125,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0100_0199,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0200_0299,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0300_0399,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0400_0499,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_25_0500_0545,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_26_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_26_0100_0111,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_27_0000_0068,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_28_0000_0015,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_29_0000_0099,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_29_0100_0114,
  R005UeqvR005NNNNTermShards.rs_R005_ueqv_R005NNNN_block_30_0000_0090
]

/-- Product polynomials for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_blocks : List Poly :=
  computedProductPolys rs_R005_ueqv_R005NNNN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
theorem rs_R005_ueqv_R005NNNN_valid : checkProductSum rs_R005_ueqv_R005NNNN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
theorem rs_R005_ueqv_R005NNNN_sum_valid : checkProductSum rs_R005_ueqv_R005NNNN_blocks = true :=
  rs_R005_ueqv_R005NNNN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
