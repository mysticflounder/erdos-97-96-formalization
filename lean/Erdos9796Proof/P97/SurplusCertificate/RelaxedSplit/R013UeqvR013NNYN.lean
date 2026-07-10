/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYNTermShards.R013UeqvR013NNYNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYNTermShards.R013UeqvR013NNYNBlockShard001

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNYN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_productBlocks :
    List (ComputedProductBlock rs_R013_ueqv_R013NNYN_generators) :=
[
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_02_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_03_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_03_0100_0100,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_04_0000_0060,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_05_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_05_0100_0152,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_06_0000_0000,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_07_0000_0003,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_08_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_09_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_10_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_10_0100_0130,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_12_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_12_0100_0130,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_13_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_13_0100_0130,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_15_0000_0060,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_16_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_16_0100_0199,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_16_0200_0299,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_16_0300_0399,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_16_0400_0496,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_17_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_17_0100_0128,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_18_0000_0098,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_19_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_19_0100_0199,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_19_0200_0284,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_21_0000_0040,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_22_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_26_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_27_0000_0015,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_28_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_28_0100_0130,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_29_0000_0099,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_29_0100_0155,
  R013UeqvR013NNYNTermShards.rs_R013_ueqv_R013NNYN_block_30_0000_0036
]

/-- Product polynomials for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_blocks : List Poly :=
  computedProductPolys rs_R013_ueqv_R013NNYN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
theorem rs_R013_ueqv_R013NNYN_valid : checkProductSum rs_R013_ueqv_R013NNYN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
theorem rs_R013_ueqv_R013NNYN_sum_valid : checkProductSum rs_R013_ueqv_R013NNYN_blocks = true :=
  rs_R013_ueqv_R013NNYN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
