/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.R010UeqvR010YYBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.R010UeqvR010YYBlockShard001

/-!
# Relaxed split surplus certificate R010:u=v:R010YY

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YY.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_productBlocks :
    List (ComputedProductBlock rs_R010_ueqv_R010YY_generators) :=
[
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_00_0000_0026,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_02_0000_0033,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_03_0000_0063,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_04_0000_0099,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_04_0100_0116,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_05_0000_0099,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_05_0100_0119,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_06_0000_0000,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_07_0000_0060,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_08_0000_0007,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_09_0000_0085,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_10_0000_0099,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_10_0100_0199,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_10_0200_0299,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_10_0300_0343,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_11_0000_0066,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_12_0000_0052,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_13_0000_0028,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_14_0000_0003,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_15_0000_0012,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_17_0000_0028,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_18_0000_0044,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_19_0000_0007,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_20_0000_0016,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_21_0000_0043,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_22_0000_0052,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_23_0000_0043,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_24_0000_0044,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_25_0000_0099,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_25_0100_0199,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_25_0200_0299,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_25_0300_0361,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_26_0000_0036,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_27_0000_0099,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_27_0100_0120,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_28_0000_0086,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_29_0000_0039,
  R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_30_0000_0092
]

/-- Product polynomials for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_blocks : List Poly :=
  computedProductPolys rs_R010_ueqv_R010YY_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R010:u=v:R010YY`. -/
theorem rs_R010_ueqv_R010YY_valid : checkProductSum rs_R010_ueqv_R010YY_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R010:u=v:R010YY`. -/
theorem rs_R010_ueqv_R010YY_sum_valid : checkProductSum rs_R010_ueqv_R010YY_blocks = true :=
  rs_R010_ueqv_R010YY_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
