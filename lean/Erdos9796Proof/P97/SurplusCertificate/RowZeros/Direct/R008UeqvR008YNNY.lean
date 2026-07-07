/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2013
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R008UeqvR008YNNY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R008UeqvR008YNNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R008UeqvR008YNNY.G30

/-!
# Direct row zeros for relaxed split surplus certificate R008:u=v:R008YNNY

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNNY.json`.
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

/-- Paired generated row/certificate metadata for `R008:u=v:R008YNNY`. -/
private def rs_R008_ueqv_R008YNNY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 50 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R008_ueqv_R008YNNY_rowCert_exactPids :
    rs_R008_ueqv_R008YNNY_rowCert.1.exactPids = ["s2_013"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R008_ueqv_R008YNNY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R008_ueqv_R008YNNY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s2_013" := by
  have hlist : [exactRow.pid] = ["s2_013"] := by
    rw [← hpid, rs_R008_ueqv_R008YNNY_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R008:u=v:R008YNNY` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R008_ueqv_R008YNNY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R008_ueqv_R008YNNY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R008_ueqv_R008YNNY) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R008_ueqv_R008YNNY_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R008_ueqv_R008YNNY_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R008_ueqv_R008YNNY_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R008_ueqv_R008YNNY_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
