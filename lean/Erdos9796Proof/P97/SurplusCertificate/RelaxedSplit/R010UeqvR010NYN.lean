/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.R010UeqvR010NYNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.R010UeqvR010NYNBlockShard001
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.R010UeqvR010NYNBlockShard002

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NYN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_productBlocks :
    List (ComputedProductBlock rs_R010_ueqv_R010NYN_generators) :=
[
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_01_0000_0059,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_02_0000_0026,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_03_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_03_0100_0162,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_04_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_04_0100_0199,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_04_0200_0299,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_04_0300_0399,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_04_0400_0414,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_05_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_05_0100_0199,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_05_0200_0299,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_05_0300_0399,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_05_0400_0401,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_06_0000_0000,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_07_0000_0061,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_08_0000_0014,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_09_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_09_0100_0132,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_10_0000_0086,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_12_0000_0072,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_13_0000_0017,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_15_0000_0017,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_16_0000_0032,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_17_0000_0017,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_18_0000_0029,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_19_0000_0014,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_20_0000_0023,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_21_0000_0062,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_22_0000_0009,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_24_0000_0039,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0100_0199,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0200_0299,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0300_0399,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0400_0499,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0500_0599,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0600_0699,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0700_0799,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_25_0800_0848,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_26_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_26_0100_0147,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_27_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_27_0100_0199,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_27_0200_0299,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_27_0300_0399,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_27_0400_0403,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_28_0000_0061,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_29_0000_0066,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_30_0000_0099,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_30_0100_0199,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_30_0200_0299,
  R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_30_0300_0373
]

/-- Product polynomials for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_blocks : List Poly :=
  computedProductPolys rs_R010_ueqv_R010NYN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
theorem rs_R010_ueqv_R010NYN_valid : checkProductSum rs_R010_ueqv_R010NYN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
theorem rs_R010_ueqv_R010NYN_sum_valid : checkProductSum rs_R010_ueqv_R010NYN_blocks = true :=
  rs_R010_ueqv_R010NYN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
