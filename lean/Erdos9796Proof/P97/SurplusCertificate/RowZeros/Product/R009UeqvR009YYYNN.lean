/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock01_0100_0123
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock02_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock02_0100_0105
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock03_0100_0161
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock04_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock04_0100_0193
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock05_0200_0216
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock06_0000_0015
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock08_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock08_0100_0105
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock09_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock09_0100_0111
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock10_0000_0010
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock11_0000_0070
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock12_0000_0093
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock14_0000_0070
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock15_0000_0053
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock16_0000_0070
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock17_0000_0070
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock19_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock19_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock19_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock19_0300_0362
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock20_0000_0014
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock21_0000_0077
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock22_0000_0088
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock24_0000_0026
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock25_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock25_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock25_0200_0200
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock27_0200_0205
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock28_0200_0216
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock29_0000_0083
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNNBlockZeros.R009UeqvR009YYYNNBlock30_0200_0202

/-!
# Product-sum row zeros for relaxed split surplus certificate R009:u=v:R009YYYNN

This generated module proves that every checked block in product-sum relaxed
split surplus row `R009:u=v:R009YYYNN` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYNN.json`.
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

/-- Paired generated row/certificate metadata for `R009:u=v:R009YYYNN`. -/
private def rs_R009_ueqv_R009YYYNN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 89 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R009_ueqv_R009YYYNN_rowCert_exactPids :
    rs_R009_ueqv_R009YYYNN_rowCert.1.exactPids = ["s2_045"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R009_ueqv_R009YYYNN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R009_ueqv_R009YYYNN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s2_045" := by
  have hlist : [exactRow.pid] = ["s2_045"] := by
    rw [← hpid, rs_R009_ueqv_R009YYYNN_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R009:u=v:R009YYYNN` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009YYYNN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R009_ueqv_R009YYYNN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqv_R009YYYNN_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R009_ueqv_R009YYYNN_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_01_0100_0123,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_02_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_02_0100_0105,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_03_0100_0161,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_04_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_04_0100_0193,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_05_0200_0216,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_06_0000_0015,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_08_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_08_0100_0105,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_09_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_09_0100_0111,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_10_0000_0010,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_11_0000_0070,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_12_0000_0093,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_14_0000_0070,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_15_0000_0053,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_16_0000_0070,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_17_0000_0070,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_19_0300_0362,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_20_0000_0014,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_21_0000_0077,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_22_0000_0088,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_24_0000_0026,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_25_0200_0200,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_27_0200_0205,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_28_0200_0216,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_29_0000_0083,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNNTermShards.rs_R009_ueqv_R009YYYNN_block_30_0200_0202
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_01_0100_0123_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_02_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_02_0100_0105_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_03_0100_0161_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_04_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_04_0100_0193_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_05_0200_0216_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_06_0000_0015_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_08_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_08_0100_0105_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_09_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_09_0100_0111_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_10_0000_0010_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_11_0000_0070_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_12_0000_0093_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_14_0000_0070_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_15_0000_0053_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_16_0000_0070_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_17_0000_0070_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_19_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_19_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_19_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_19_0300_0362_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_20_0000_0014_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_21_0000_0077_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_22_0000_0088_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_24_0000_0026_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_25_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_25_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_25_0200_0200_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_27_0200_0205_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_28_0200_0216_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_29_0000_0083_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YYYNN_block_30_0200_0202_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
