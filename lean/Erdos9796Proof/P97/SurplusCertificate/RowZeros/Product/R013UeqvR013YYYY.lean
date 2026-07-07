/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock00_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock00_0100_0198
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock01_0100_0182
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock02_0000_0059
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock03_0100_0172
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock04_0700_0716
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock05_0700_0702
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock06_0000_0000
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock07_0000_0035
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock08_0000_0057
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock09_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock09_0100_0101
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock10_0000_0069
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock11_0000_0058
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock12_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock12_0100_0124
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock13_0000_0077
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock14_0000_0024
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock15_0000_0078
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock16_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock16_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock16_0200_0290
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock17_0000_0027
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock18_0000_0025
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock20_0000_0038
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock22_0000_0090
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock23_0000_0049
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock24_0000_0075
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock25_0700_0720
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock26_0000_0046
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock27_0700_0720
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock28_0700_0722
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock29_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock29_0100_0123
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYYBlockZeros.R013UeqvR013YYYYBlock30_0700_0720

/-!
# Product-sum row zeros for relaxed split surplus certificate R013:u=v:R013YYYY

This generated module proves that every checked block in product-sum relaxed
split surplus row `R013:u=v:R013YYYY` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYYY.json`.
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

/-- Paired generated row/certificate metadata for `R013:u=v:R013YYYY`. -/
private def rs_R013_ueqv_R013YYYY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 129 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R013_ueqv_R013YYYY_rowCert_exactPids :
    rs_R013_ueqv_R013YYYY_rowCert.1.exactPids = ["s3_004"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R013_ueqv_R013YYYY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R013_ueqv_R013YYYY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s3_004" := by
  have hlist : [exactRow.pid] = ["s3_004"] := by
    rw [← hpid, rs_R013_ueqv_R013YYYY_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R013:u=v:R013YYYY` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YYYY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R013_ueqv_R013YYYY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R013_ueqv_R013YYYY_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R013_ueqv_R013YYYY_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_00_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_00_0100_0198,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_01_0100_0182,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_02_0000_0059,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_03_0100_0172,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_04_0700_0716,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_05_0700_0702,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_06_0000_0000,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_07_0000_0035,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_08_0000_0057,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_09_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_09_0100_0101,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_10_0000_0069,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_11_0000_0058,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_12_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_12_0100_0124,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_13_0000_0077,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_14_0000_0024,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_15_0000_0078,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_16_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_16_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_16_0200_0290,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_17_0000_0027,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_18_0000_0025,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_20_0000_0038,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_22_0000_0090,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_23_0000_0049,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_24_0000_0075,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_25_0700_0720,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_26_0000_0046,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0700_0720,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_28_0700_0722,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_29_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_29_0100_0123,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_30_0700_0720
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_00_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_00_0100_0198_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_01_0100_0182_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_02_0000_0059_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_03_0100_0172_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_04_0700_0716_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_05_0700_0702_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_06_0000_0000_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_07_0000_0035_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_08_0000_0057_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_09_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_09_0100_0101_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_10_0000_0069_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_11_0000_0058_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_12_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_12_0100_0124_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_13_0000_0077_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_14_0000_0024_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_15_0000_0078_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_16_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_16_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_16_0200_0290_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_17_0000_0027_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_18_0000_0025_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_20_0000_0038_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_22_0000_0090_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_23_0000_0049_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_24_0000_0075_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_25_0700_0720_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_26_0000_0046_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_27_0700_0720_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_28_0700_0722_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_29_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_29_0100_0123_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R013_ueqv_R013YYYY_block_30_0700_0720_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
