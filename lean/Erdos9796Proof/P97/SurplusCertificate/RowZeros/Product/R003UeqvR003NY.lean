/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock00_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock00_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock00_0200_0275
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock01_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock01_0200_0266
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock02_0000_0075
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock03_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock03_0200_0270
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock04_0000_0051
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock05_0300_0345
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock06_0000_0000
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock07_0000_0016
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock09_0000_0025
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock10_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock10_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock10_0200_0278
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock11_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock11_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock11_0200_0241
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock12_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock12_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock12_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock12_0300_0343
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock13_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock13_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock13_0200_0245
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock14_0000_0003
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock15_0000_0069
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock16_0000_0005
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock17_0000_0007
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock19_0000_0034
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock20_0000_0007
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock21_0000_0041
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock22_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock22_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock22_0200_0280
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock23_0000_0087
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock24_0000_0058
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock26_0000_0005
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock27_0000_0009
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock28_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock28_0300_0343
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock29_0000_0040
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NYBlockZeros.R003UeqvR003NYBlock30_0000_0027

/-!
# Product-sum row zeros for relaxed split surplus certificate R003:u=v:R003NY

This generated module proves that every checked block in product-sum relaxed
split surplus row `R003:u=v:R003NY` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NY.json`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- Paired generated row/certificate metadata for `R003:u=v:R003NY`. -/
private def rs_R003_ueqv_R003NY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 15 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R003_ueqv_R003NY_rowCert_exactPids :
    rs_R003_ueqv_R003NY_rowCert.1.exactPids = ["s1_026"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R003_ueqv_R003NY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R003_ueqv_R003NY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_026" := by
  have hlist : [exactRow.pid] = ["s1_026"] := by
    rw [← hpid, rs_R003_ueqv_R003NY_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R003:u=v:R003NY` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003NY_evaluationZeros_of_metricShadow
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpid : rs_R003_ueqv_R003NY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R003_ueqv_R003NY_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R003_ueqv_R003NY_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_00_0200_0275,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_01_0200_0266,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_02_0000_0075,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_03_0200_0270,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_04_0000_0051,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_05_0300_0345,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_06_0000_0000,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_07_0000_0016,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_09_0000_0025,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_10_0200_0278,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_11_0200_0241,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_12_0300_0343,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0200_0245,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_14_0000_0003,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_15_0000_0069,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_16_0000_0005,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_17_0000_0007,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_19_0000_0034,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_20_0000_0007,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_21_0000_0041,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_22_0200_0280,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_23_0000_0087,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_24_0000_0058,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_26_0000_0005,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_27_0000_0009,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_28_0300_0343,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_29_0000_0040,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_30_0000_0027
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_00_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_00_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_00_0200_0275_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_01_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_01_0200_0266_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_02_0000_0075_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_03_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_03_0200_0270_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_04_0000_0051_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_05_0300_0345_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_06_0000_0000_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_07_0000_0016_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_09_0000_0025_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_10_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_10_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_10_0200_0278_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_11_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_11_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_11_0200_0241_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_12_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_12_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_12_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_12_0300_0343_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_13_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_13_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_13_0200_0245_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_14_0000_0003_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_15_0000_0069_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_16_0000_0005_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_17_0000_0007_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_19_0000_0034_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_20_0000_0007_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_21_0000_0041_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_22_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_22_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_22_0200_0280_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_23_0000_0087_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_24_0000_0058_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_26_0000_0005_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_27_0000_0009_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_28_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_28_0300_0343_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_29_0000_0040_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NY_block_30_0000_0027_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
