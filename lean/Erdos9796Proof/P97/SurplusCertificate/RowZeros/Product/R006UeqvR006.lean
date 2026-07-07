/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R006UeqvR006
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block01_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block01_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block01_0200_0228
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block02_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block02_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block02_0200_0298
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block03_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block03_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block03_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block03_0400_0414
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block04_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block04_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block04_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block04_0300_0366
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block05_0300_0366
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block06_0000_0024
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block07_0000_0005
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block08_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block08_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block08_0200_0240
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block09_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block09_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block09_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block09_0300_0357
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block10_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block10_0100_0167
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block12_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block12_0100_0157
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block13_0000_0027
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block14_0000_0001
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block15_0000_0028
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0700_0799
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0800_0899
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_0900_0999
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_1000_1099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block16_1100_1152
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block17_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block17_0100_0169
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block18_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block18_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block18_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block18_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block18_0400_0414
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block19_0000_0000
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block20_0000_0076
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block21_0000_0064
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0700_0799
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0800_0899
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_0900_0999
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1000_1099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1100_1199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1200_1299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1300_1399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1400_1499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1500_1599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1600_1699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1700_1799
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1800_1899
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block22_1900_1981
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block23_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block23_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block23_0200_0228
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block24_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block24_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block24_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block24_0300_0361
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block26_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block26_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block26_0200_0277
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block27_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block27_0300_0322
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block28_0100_0158
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block29_0000_0029
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block30_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006BlockZeros.R006UeqvR006Block30_0300_0324

/-!
# Product-sum row zeros for relaxed split surplus certificate R006:u=v:R006

This generated module proves that every checked block in product-sum relaxed
split surplus row `R006:u=v:R006` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R006_ueqv_R006.json`.
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

/-- Paired generated row/certificate metadata for `R006:u=v:R006`. -/
private def rs_R006_ueqv_R006_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 36 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R006_ueqv_R006_rowCert_exactPids :
    rs_R006_ueqv_R006_rowCert.1.exactPids = ["s1_028"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R006_ueqv_R006_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R006_ueqv_R006_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_028" := by
  have hlist : [exactRow.pid] = ["s1_028"] := by
    rw [← hpid, rs_R006_ueqv_R006_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R006:u=v:R006` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R006_ueqv_R006_evaluationZeros_of_metricShadow
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
    (hpid : rs_R006_ueqv_R006_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R006_ueqv_R006_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R006_ueqv_R006_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_01_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_01_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_01_0200_0228,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_02_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_02_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_02_0200_0298,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_03_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_03_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_03_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_03_0400_0414,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_04_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_04_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_04_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_04_0300_0366,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_05_0300_0366,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_06_0000_0024,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_07_0000_0005,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_08_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_08_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_08_0200_0240,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_09_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_09_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_09_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_09_0300_0357,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_10_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_10_0100_0167,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_12_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_12_0100_0157,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_13_0000_0027,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_14_0000_0001,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_15_0000_0028,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0700_0799,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0800_0899,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_0900_0999,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_1000_1099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_1100_1152,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_17_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_17_0100_0169,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_18_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_18_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_18_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_18_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_18_0400_0414,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_19_0000_0000,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_20_0000_0076,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_21_0000_0064,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0700_0799,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0800_0899,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_0900_0999,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1000_1099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1100_1199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1200_1299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1300_1399,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1400_1499,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1500_1599,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1600_1699,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1700_1799,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1800_1899,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_22_1900_1981,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_23_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_23_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_23_0200_0228,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_24_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_24_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_24_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_24_0300_0361,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_26_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_26_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_26_0200_0277,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_27_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_27_0300_0322,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_28_0100_0158,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_29_0000_0029,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_30_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_30_0300_0324
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_01_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_01_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_01_0200_0228_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_02_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_02_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_02_0200_0298_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_03_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_03_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_03_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_03_0400_0414_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_04_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_04_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_04_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_04_0300_0366_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_05_0300_0366_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_06_0000_0024_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_07_0000_0005_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_08_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_08_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_08_0200_0240_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_09_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_09_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_09_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_09_0300_0357_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_10_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_10_0100_0167_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_12_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_12_0100_0157_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_13_0000_0027_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_14_0000_0001_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_15_0000_0028_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0700_0799_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0800_0899_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_0900_0999_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_1000_1099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_16_1100_1152_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_17_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_17_0100_0169_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_18_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_18_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_18_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_18_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_18_0400_0414_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_19_0000_0000_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_20_0000_0076_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_21_0000_0064_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0700_0799_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0800_0899_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_0900_0999_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1000_1099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1100_1199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1200_1299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1300_1399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1400_1499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1500_1599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1600_1699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1700_1799_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1800_1899_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_22_1900_1981_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_23_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_23_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_23_0200_0228_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_24_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_24_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_24_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_24_0300_0361_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_26_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_26_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_26_0200_0277_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_27_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_27_0300_0322_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_28_0100_0158_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_29_0000_0029_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_30_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R006_ueqv_R006_block_30_0300_0324_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
