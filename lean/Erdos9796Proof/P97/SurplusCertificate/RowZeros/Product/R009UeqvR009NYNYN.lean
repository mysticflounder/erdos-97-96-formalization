/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock02_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock02_0100_0126
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock03_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock03_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock03_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock03_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock03_0400_0425
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock05_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock05_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock05_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock05_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock05_0400_0403
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock06_0000_0013
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock07_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock07_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock07_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock07_0300_0319
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock08_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock08_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock08_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock08_0300_0326
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock09_0000_0062
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock10_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock10_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock10_0200_0253
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock11_0000_0018
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock12_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock12_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock12_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock12_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock12_0400_0487
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock13_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock13_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock13_0200_0252
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock14_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock14_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock14_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock14_0300_0311
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock15_0000_0043
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock16_0000_0031
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock18_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock18_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock18_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock18_0300_0310
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock19_0000_0025
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock20_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock20_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock20_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock20_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock20_0400_0441
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock21_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock21_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock21_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock21_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock21_0400_0410
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock22_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock22_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock22_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock22_0300_0325
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock23_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock23_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock23_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock23_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock23_0400_0421
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock24_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock24_0100_0172
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock25_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock25_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock25_0200_0248
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock26_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock26_0100_0182
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock27_0700_0736
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0300_0399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0400_0499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0500_0599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0600_0699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0700_0799
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0800_0899
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_0900_0999
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1000_1099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1100_1199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1200_1299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1300_1399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1400_1499
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1500_1599
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1600_1699
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1700_1799
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1800_1899
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_1900_1999
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_2000_2099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_2100_2199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_2200_2299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_2300_2399
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock28_2400_2423
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock29_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock29_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock29_0200_0299
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock29_0300_0307
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock30_0000_0099
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock30_0100_0199
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYNBlockZeros.R009UeqvR009NYNYNBlock30_0200_0285

/-!
# Product-sum row zeros for relaxed split surplus certificate R009:u=v:R009NYNYN

This generated module proves that every checked block in product-sum relaxed
split surplus row `R009:u=v:R009NYNYN` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNYN.json`.
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

/-- Paired generated row/certificate metadata for `R009:u=v:R009NYNYN`. -/
private def rs_R009_ueqv_R009NYNYN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 70 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R009_ueqv_R009NYNYN_rowCert_exactPids :
    rs_R009_ueqv_R009NYNYN_rowCert.1.exactPids = ["s2_050"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R009_ueqv_R009NYNYN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R009_ueqv_R009NYNYN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s2_050" := by
  have hlist : [exactRow.pid] = ["s2_050"] := by
    rw [← hpid, rs_R009_ueqv_R009NYNYN_rowCert_exactPids]
  simpa using hlist

/-- Every checked block in product-sum relaxed split surplus certificate
`R009:u=v:R009NYNYN` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NYNYN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R009_ueqv_R009NYNYN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqv_R009NYNYN_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R009_ueqv_R009NYNYN_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_02_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_02_0100_0126,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_03_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_03_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_03_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_03_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_03_0400_0425,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_05_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_05_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_05_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_05_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_05_0400_0403,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_06_0000_0013,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_07_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_07_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_07_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_07_0300_0319,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_08_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_08_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_08_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_08_0300_0326,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_09_0000_0062,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_10_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_10_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_10_0200_0253,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_11_0000_0018,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_12_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_12_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_12_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_12_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_12_0400_0487,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_13_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_13_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_13_0200_0252,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_14_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_14_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_14_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_14_0300_0311,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_15_0000_0043,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_16_0000_0031,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_18_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_18_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_18_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_18_0300_0310,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_19_0000_0025,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_20_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_20_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_20_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_20_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_20_0400_0441,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_21_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_21_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_21_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_21_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_21_0400_0410,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_22_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_22_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_22_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_22_0300_0325,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0400_0421,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_24_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_24_0100_0172,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_25_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_25_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_25_0200_0248,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_26_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_26_0100_0182,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_27_0700_0736,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0300_0399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0400_0499,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0500_0599,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0600_0699,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0700_0799,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0800_0899,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_0900_0999,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1000_1099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1100_1199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1200_1299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1300_1399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1400_1499,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1500_1599,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1600_1699,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1700_1799,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1800_1899,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_1900_1999,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_2000_2099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_2100_2199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_2200_2299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_2300_2399,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_28_2400_2423,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_29_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_29_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_29_0200_0299,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_29_0300_0307,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_30_0000_0099,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_30_0100_0199,
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_30_0200_0285
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_02_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_02_0100_0126_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_03_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_03_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_03_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_03_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_03_0400_0425_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_05_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_05_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_05_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_05_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_05_0400_0403_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_06_0000_0013_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_07_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_07_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_07_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_07_0300_0319_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_08_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_08_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_08_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_08_0300_0326_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_09_0000_0062_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_10_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_10_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_10_0200_0253_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_11_0000_0018_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_12_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_12_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_12_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_12_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_12_0400_0487_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_13_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_13_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_13_0200_0252_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_14_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_14_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_14_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_14_0300_0311_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_15_0000_0043_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_16_0000_0031_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_18_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_18_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_18_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_18_0300_0310_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_19_0000_0025_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_20_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_20_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_20_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_20_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_20_0400_0441_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_21_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_21_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_21_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_21_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_21_0400_0410_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_22_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_22_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_22_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_22_0300_0325_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_23_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_23_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_23_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_23_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_23_0400_0421_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_24_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_24_0100_0172_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_25_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_25_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_25_0200_0248_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_26_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_26_0100_0182_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_27_0700_0736_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0300_0399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0400_0499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0500_0599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0600_0699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0700_0799_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0800_0899_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_0900_0999_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1000_1099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1100_1199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1200_1299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1300_1399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1400_1499_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1500_1599_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1600_1699_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1700_1799_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1800_1899_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_1900_1999_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_2000_2099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_2100_2199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_2200_2299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_2300_2399_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_28_2400_2423_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_29_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_29_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_29_0200_0299_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_29_0300_0307_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_30_0000_0099_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_30_0100_0199_eval_zero hmetric hrow hmasks hpidEq
  rcases List.mem_cons.mp hp with rfl | hp
  · exact rs_R009_ueqv_R009NYNYN_block_30_0200_0285_eval_zero hmetric hrow hmasks hpidEq
  cases hp

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
