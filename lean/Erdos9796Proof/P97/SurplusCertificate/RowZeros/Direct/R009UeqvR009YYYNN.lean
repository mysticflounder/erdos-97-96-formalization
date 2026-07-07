/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2045
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R009UeqvR009YYYNN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YYYNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R009UeqvR009YYYNN.G30

/-!
# Direct row zeros for relaxed split surplus certificate R009:u=v:R009YYYNN

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

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

namespace Direct

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

/-- The direct payload for `R009:u=v:R009YYYNN` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
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
    CertificatePayload.evaluationZeros (.direct rs_R009_ueqv_R009YYYNN) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R009_ueqv_R009YYYNN_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R009_ueqv_R009YYYNN_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R009_ueqv_R009YYYNN_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R009_ueqv_R009YYYNN_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
