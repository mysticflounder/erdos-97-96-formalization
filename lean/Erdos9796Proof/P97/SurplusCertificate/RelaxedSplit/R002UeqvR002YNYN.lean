/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.R002UeqvR002YNYNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.R002UeqvR002YNYNBlockShard001

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNYN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_productBlocks :
    List (ComputedProductBlock rs_R002_ueqv_R002YNYN_generators) :=
[
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_01_0000_0062,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_02_0000_0060,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_03_0000_0090,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_04_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_04_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_04_0200_0208,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_05_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_05_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_05_0200_0237,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_06_0000_0000,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_07_0000_0026,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_08_0000_0050,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_09_0000_0075,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_10_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_10_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_10_0200_0205,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_11_0000_0022,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_12_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_12_0100_0136,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_13_0000_0043,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_16_0000_0015,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_17_0000_0017,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_18_0000_0012,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_19_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_19_0100_0136,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_20_0000_0016,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_21_0000_0013,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_22_0000_0015,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_25_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_25_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_25_0200_0217,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_26_0000_0037,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_27_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_27_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_27_0200_0226,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_28_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_28_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_28_0200_0299,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_28_0300_0376,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_29_0000_0041,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_30_0000_0099,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_30_0100_0199,
  R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_30_0200_0226
]

/-- Product polynomials for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_blocks : List Poly :=
  computedProductPolys rs_R002_ueqv_R002YNYN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
theorem rs_R002_ueqv_R002YNYN_valid : checkProductSum rs_R002_ueqv_R002YNYN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
theorem rs_R002_ueqv_R002YNYN_sum_valid : checkProductSum rs_R002_ueqv_R002YNYN_blocks = true :=
  rs_R002_ueqv_R002YNYN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
