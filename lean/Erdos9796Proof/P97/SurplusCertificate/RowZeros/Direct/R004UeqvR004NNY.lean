/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1033
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R004UeqvR004NNY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R004UeqvR004NNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R004UeqvR004NNY.G30

/-!
# Direct row zeros for relaxed split surplus certificate R004:u=v:R004NNY

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNY.json`.
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

/-- Paired generated row/certificate metadata for `R004:u=v:R004NNY`. -/
private def rs_R004_ueqv_R004NNY_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 19 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R004_ueqv_R004NNY_rowCert_exactPids :
    rs_R004_ueqv_R004NNY_rowCert.1.exactPids = ["s1_033"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R004_ueqv_R004NNY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R004_ueqv_R004NNY_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_033" := by
  have hlist : [exactRow.pid] = ["s1_033"] := by
    rw [← hpid, rs_R004_ueqv_R004NNY_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R004:u=v:R004NNY` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R004_ueqv_R004NNY_evaluationZeros_of_metricShadow
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
    (hpid : rs_R004_ueqv_R004NNY_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R004_ueqv_R004NNY) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R004_ueqv_R004NNY_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R004_ueqv_R004NNY_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R004_ueqv_R004NNY_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R004_ueqv_R004NNY_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
