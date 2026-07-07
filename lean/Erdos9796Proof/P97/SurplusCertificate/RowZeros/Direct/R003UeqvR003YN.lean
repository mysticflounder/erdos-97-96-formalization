/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1025
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R003UeqvR003YN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003YN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R003UeqvR003YN.G30

/-!
# Direct row zeros for relaxed split surplus certificate R003:u=v:R003YN

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YN.json`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Direct

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- Paired generated row/certificate metadata for `R003:u=v:R003YN`. -/
private def rs_R003_ueqv_R003YN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 16 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R003_ueqv_R003YN_rowCert_exactPids :
    rs_R003_ueqv_R003YN_rowCert.1.exactPids = ["s1_025"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R003_ueqv_R003YN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R003_ueqv_R003YN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_025" := by
  have hlist : [exactRow.pid] = ["s1_025"] := by
    rw [← hpid, rs_R003_ueqv_R003YN_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R003:u=v:R003YN` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R003_ueqv_R003YN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R003_ueqv_R003YN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R003_ueqv_R003YN) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R003_ueqv_R003YN_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R003_ueqv_R003YN_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R003_ueqv_R003YN_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R003_ueqv_R003YN_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
