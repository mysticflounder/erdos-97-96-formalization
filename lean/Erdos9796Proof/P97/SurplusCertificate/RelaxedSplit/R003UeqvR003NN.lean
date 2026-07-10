/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.R003UeqvR003NNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.R003UeqvR003NNBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.R003UeqvR003NNBlockShard002

/-!
# Relaxed split surplus certificate R003:u=v:R003NN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_productBlocks :
    List (ComputedProductBlock rs_R003_ueqv_R003NN_generators) :=
[
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_00_0000_0047,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_01_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_01_0100_0112,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_02_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_02_0100_0114,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_03_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_03_0100_0111,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0100_0199,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0200_0299,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0300_0382,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0100_0199,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0200_0299,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0300_0386,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_06_0000_0000,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_07_0000_0007,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_08_0000_0064,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_09_0000_0031,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_10_0000_0039,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_11_0000_0003,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_12_0000_0039,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_13_0000_0041,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_14_0000_0018,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_15_0000_0031,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_16_0000_0050,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_17_0000_0046,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_18_0000_0036,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_19_0000_0013,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_20_0000_0006,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_21_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_21_0100_0112,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_22_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_22_0100_0112,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_23_0000_0005,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_24_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_24_0100_0112,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_25_0000_0049,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_26_0000_0083,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0100_0199,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0200_0299,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0300_0384,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0100_0199,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0200_0299,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0300_0399,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0400_0499,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0500_0599,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0600_0699,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0700_0708,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_29_0000_0094,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0000_0099,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0100_0199,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0200_0299,
  R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0300_0384
]

/-- Product polynomials for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_blocks : List Poly :=
  computedProductPolys rs_R003_ueqv_R003NN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R003:u=v:R003NN`. -/
theorem rs_R003_ueqv_R003NN_valid : checkProductSum rs_R003_ueqv_R003NN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R003:u=v:R003NN`. -/
theorem rs_R003_ueqv_R003NN_sum_valid : checkProductSum rs_R003_ueqv_R003NN_blocks = true :=
  rs_R003_ueqv_R003NN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
