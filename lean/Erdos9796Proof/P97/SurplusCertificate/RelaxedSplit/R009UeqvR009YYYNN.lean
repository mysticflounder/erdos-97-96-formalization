/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNGenerators
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.R009UeqvR009YYYNNBlockShard000
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.R009UeqvR009YYYNNBlockShard001

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN

This generated coordinator checks the final product-sum identity for a
term-sharded relaxed pinned-surplus split certificate. The imported shard
modules store bounded coefficient blocks; the products are computed by
the shared checker.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYNN.json`.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Computed product blocks for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_productBlocks :
    List (ComputedProductBlock rs_R009_ueqv_R009YYYNN_generators) :=
[
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_01_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_01_0100_0123,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_02_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_02_0100_0105,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_03_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_03_0100_0161,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_04_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_04_0100_0193,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0200_0216,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_06_0000_0015,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_08_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_08_0100_0105,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_09_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_09_0100_0111,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_10_0000_0010,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_11_0000_0070,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_12_0000_0093,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_14_0000_0070,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_15_0000_0053,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_16_0000_0070,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_17_0000_0070,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0200_0299,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0300_0362,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_20_0000_0014,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_21_0000_0077,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_22_0000_0088,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_24_0000_0026,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0200_0200,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0200_0205,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0200_0216,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_29_0000_0083,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0000_0099,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0100_0199,
  R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0200_0202
]

/-- Product polynomials for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_blocks : List Poly :=
  computedProductPolys rs_R009_ueqv_R009YYYNN_productBlocks

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
theorem rs_R009_ueqv_R009YYYNN_valid : checkProductSum rs_R009_ueqv_R009YYYNN_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
theorem rs_R009_ueqv_R009YYYNN_sum_valid : checkProductSum rs_R009_ueqv_R009YYYNN_blocks = true :=
  rs_R009_ueqv_R009YYYNN_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
