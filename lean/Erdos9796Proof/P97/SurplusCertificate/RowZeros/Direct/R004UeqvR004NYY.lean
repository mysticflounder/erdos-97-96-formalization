/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1029
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R004UeqvR004NYY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R004UeqvR004NYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NYY.G30

/-!
# Direct row zeros for relaxed split surplus certificate R004:u=v:R004NYY

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NYY.json`.
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

/-- Paired generated row/certificate metadata for `R004:u=v:R004NYY`. -/
private def rs_R004_ueqv_R004NYY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 21 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R004_ueqv_R004NYY_rowCert_exactPids :
    rs_R004_ueqv_R004NYY_rowCert.1.exactPids = ["s1_029"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R004_ueqv_R004NYY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R004_ueqv_R004NYY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_029" := by
  have hlist : [exactRow.pid] = ["s1_029"] := by
    rw [← hpid, rs_R004_ueqv_R004NYY_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R004:u=v:R004NYY` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R004_ueqv_R004NYY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R004_ueqv_R004NYY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R004_ueqv_R004NYY) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R004_ueqv_R004NYY_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R004_ueqv_R004NYY_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R004_ueqv_R004NYY_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NYY_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
