/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3018
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R014UeqvR014NY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014NY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R014UeqvR014NY.G30

/-!
# Direct row zeros for relaxed split surplus certificate R014:u=v:R014NY

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014NY.json`.
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

/-- Paired generated row/certificate metadata for `R014:u=v:R014NY`. -/
private def rs_R014_ueqv_R014NY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 132 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R014_ueqv_R014NY_rowCert_exactPids :
    rs_R014_ueqv_R014NY_rowCert.1.exactPids = ["s3_018"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R014_ueqv_R014NY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R014_ueqv_R014NY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s3_018" := by
  have hlist : [exactRow.pid] = ["s3_018"] := by
    rw [← hpid, rs_R014_ueqv_R014NY_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R014:u=v:R014NY` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R014_ueqv_R014NY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R014_ueqv_R014NY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R014_ueqv_R014NY) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R014_ueqv_R014NY_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R014_ueqv_R014NY_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R014_ueqv_R014NY_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R014_ueqv_R014NY_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
