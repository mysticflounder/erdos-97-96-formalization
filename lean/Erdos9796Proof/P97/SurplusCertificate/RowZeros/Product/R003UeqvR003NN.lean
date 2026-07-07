/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock00_0000_0047
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock01_0100_0112
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock02_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock02_0100_0114
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock03_0100_0111
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock04_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock04_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock04_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock04_0300_0382
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock05_0300_0386
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock06_0000_0000
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock07_0000_0007
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock08_0000_0064
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock09_0000_0031
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock10_0000_0039
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock11_0000_0003
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock12_0000_0039
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock13_0000_0041
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock14_0000_0018
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock15_0000_0031
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock16_0000_0050
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock17_0000_0046
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock18_0000_0036
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock19_0000_0013
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock20_0000_0006
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock21_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock21_0100_0112
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock22_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock22_0100_0112
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock23_0000_0005
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock24_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock24_0100_0112
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock25_0000_0049
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock26_0000_0083
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock27_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock27_0300_0384
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock28_0700_0708
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock29_0000_0094
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock30_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NNBlockZeros.R003UeqvR003NNBlock30_0300_0384

/-!
# Product-sum row zeros for relaxed split surplus certificate R003:u=v:R003NN

This generated module proves that every checked block in product-sum relaxed
split surplus row `R003:u=v:R003NN` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NN.json`.
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

/-- Paired generated row/certificate metadata for `R003:u=v:R003NN`. -/
private def rs_R003_ueqv_R003NN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 14 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R003_ueqv_R003NN_rowCert_exactPids :
    rs_R003_ueqv_R003NN_rowCert.1.exactPids = ["s1_027"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R003_ueqv_R003NN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R003_ueqv_R003NN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_027" := by
  have hlist : [exactRow.pid] = ["s1_027"] := by
    rw [← hpid, rs_R003_ueqv_R003NN_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R003:u=v:R003NN` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003NN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R003_ueqv_R003NN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R003_ueqv_R003NN_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R003_ueqv_R003NN_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_00_0000_0047,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_01_0100_0112,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_02_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_02_0100_0114,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_03_0100_0111,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_04_0300_0382,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_05_0300_0386,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_06_0000_0000,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_07_0000_0007,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_08_0000_0064,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_09_0000_0031,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_10_0000_0039,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_11_0000_0003,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_12_0000_0039,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_13_0000_0041,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_14_0000_0018,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_15_0000_0031,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_16_0000_0050,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_17_0000_0046,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_18_0000_0036,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_19_0000_0013,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_20_0000_0006,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_21_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_21_0100_0112,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_22_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_22_0100_0112,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_23_0000_0005,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_24_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_24_0100_0112,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_25_0000_0049,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_26_0000_0083,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_27_0300_0384,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_28_0700_0708,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_29_0000_0094,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_30_0300_0384
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_00_0000_0047_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_01_0100_0112_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_02_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_02_0100_0114_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_03_0100_0111_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_04_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_04_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_04_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_04_0300_0382_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_05_0300_0386_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_06_0000_0000_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_07_0000_0007_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_08_0000_0064_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_09_0000_0031_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_10_0000_0039_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_11_0000_0003_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_12_0000_0039_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_13_0000_0041_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_14_0000_0018_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_15_0000_0031_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_16_0000_0050_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_17_0000_0046_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_18_0000_0036_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_19_0000_0013_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_20_0000_0006_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_21_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_21_0100_0112_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_22_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_22_0100_0112_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_23_0000_0005_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_24_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_24_0100_0112_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_25_0000_0049_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_26_0000_0083_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_27_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_27_0300_0384_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_28_0700_0708_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_29_0000_0094_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_30_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R003_ueqv_R003NN_block_30_0300_0384_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
