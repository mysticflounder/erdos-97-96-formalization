/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock01_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock01_0200_0231
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock02_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock02_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock02_0200_0244
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock03_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock03_0200_0238
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock04_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock04_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock04_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock04_0300_0384
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock05_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock05_0400_0449
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock06_0000_0004
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock07_0000_0094
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock08_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock08_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock08_0200_0231
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock09_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock09_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock09_0200_0238
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock10_0000_0002
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock11_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock11_0100_0137
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock12_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock12_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock12_0200_0222
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock14_0000_0019
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock15_0000_0009
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock16_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock16_0100_0171
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock17_0000_0019
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock18_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock18_0100_0143
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock19_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock19_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock19_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock19_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock19_0400_0497
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock20_0000_0096
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock21_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock21_0100_0109
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock22_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock22_0100_0168
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock24_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock24_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock24_0200_0203
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock25_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock25_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock25_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock25_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock25_0400_0402
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock26_0000_0057
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock27_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock27_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock27_0400_0491
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock28_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock28_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock28_0400_0481
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock29_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock29_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock29_0200_0222
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock30_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock30_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNNBlockZeros.R009UeqvR009YNNNNBlock30_0400_0487

/-!
# Product-sum row zeros for relaxed split surplus certificate R009:u=v:R009YNNNN

This generated module proves that every checked block in product-sum relaxed
split surplus row `R009:u=v:R009YNNNN` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNNN.json`.
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

/-- Paired generated row/certificate metadata for `R009:u=v:R009YNNNN`. -/
private def rs_R009_ueqv_R009YNNNN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 77 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R009_ueqv_R009YNNNN_rowCert_exactPids :
    rs_R009_ueqv_R009YNNNN_rowCert.1.exactPids = ["s2_046"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R009_ueqv_R009YNNNN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R009_ueqv_R009YNNNN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s2_046" := by
  have hlist : [exactRow.pid] = ["s2_046"] := by
    rw [← hpid, rs_R009_ueqv_R009YNNNN_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R009:u=v:R009YNNNN` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009YNNNN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R009_ueqv_R009YNNNN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqv_R009YNNNN_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R009_ueqv_R009YNNNN_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_01_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_01_0200_0231,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_02_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_02_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_02_0200_0244,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_03_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_03_0200_0238,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_04_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_04_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_04_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_04_0300_0384,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_05_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_05_0400_0449,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_06_0000_0004,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_07_0000_0094,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_08_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_08_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_08_0200_0231,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_09_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_09_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_09_0200_0238,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_10_0000_0002,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_11_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_11_0100_0137,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_12_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_12_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_12_0200_0222,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_14_0000_0019,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_15_0000_0009,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_16_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_16_0100_0171,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_17_0000_0019,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_18_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_18_0100_0143,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_19_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_19_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_19_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_19_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_19_0400_0497,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_20_0000_0096,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_21_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_21_0100_0109,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_22_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_22_0100_0168,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_24_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_24_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_24_0200_0203,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0400_0402,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_26_0000_0057,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_27_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_27_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_27_0400_0491,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_28_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_28_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_28_0400_0481,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_29_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_29_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_29_0200_0222,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_30_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_30_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_30_0400_0487
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_01_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_01_0200_0231_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_02_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_02_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_02_0200_0244_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_03_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_03_0200_0238_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_04_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_04_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_04_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_04_0300_0384_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_05_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_05_0400_0449_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_06_0000_0004_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_07_0000_0094_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_08_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_08_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_08_0200_0231_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_09_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_09_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_09_0200_0238_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_10_0000_0002_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_11_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_11_0100_0137_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_12_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_12_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_12_0200_0222_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_14_0000_0019_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_15_0000_0009_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_16_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_16_0100_0171_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_17_0000_0019_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_18_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_18_0100_0143_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_19_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_19_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_19_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_19_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_19_0400_0497_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_20_0000_0096_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_21_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_21_0100_0109_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_22_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_22_0100_0168_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_24_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_24_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_24_0200_0203_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_25_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_25_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_25_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_25_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_25_0400_0402_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_26_0000_0057_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_27_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_27_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_27_0400_0491_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_28_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_28_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_28_0400_0481_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_29_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_29_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_29_0200_0222_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_30_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_30_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009YNNNN_block_30_0400_0487_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
