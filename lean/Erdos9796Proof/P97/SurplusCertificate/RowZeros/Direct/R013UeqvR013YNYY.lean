/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3001
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R013UeqvR013YNYY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R013UeqvR013YNYY.G30

/-!
# Direct row zeros for relaxed split surplus certificate R013:u=v:R013YNYY

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNYY.json`.
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

/-- Paired generated row/certificate metadata for `R013:u=v:R013YNYY`. -/
private def rs_R013_ueqv_R013YNYY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 124 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R013_ueqv_R013YNYY_rowCert_exactPids :
    rs_R013_ueqv_R013YNYY_rowCert.1.exactPids = ["s3_001"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R013_ueqv_R013YNYY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R013_ueqv_R013YNYY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s3_001" := by
  have hlist : [exactRow.pid] = ["s3_001"] := by
    rw [← hpid, rs_R013_ueqv_R013YNYY_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R013:u=v:R013YNYY` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R013_ueqv_R013YNYY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R013_ueqv_R013YNYY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R013_ueqv_R013YNYY) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R013_ueqv_R013YNYY_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R013_ueqv_R013YNYY_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R013_ueqv_R013YNYY_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R013_ueqv_R013YNYY_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
