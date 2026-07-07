/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1012
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R002UeqvR002YNN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R002UeqvR002YNN.G30

/-!
# Direct row zeros for relaxed split surplus certificate R002:u=v:R002YNN

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNN.json`.
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

/-- Paired generated row/certificate metadata for `R002:u=v:R002YNN`. -/
private def rs_R002_ueqv_R002YNN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 9 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R002_ueqv_R002YNN_rowCert_exactPids :
    rs_R002_ueqv_R002YNN_rowCert.1.exactPids = ["s1_012"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R002_ueqv_R002YNN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R002_ueqv_R002YNN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_012" := by
  have hlist : [exactRow.pid] = ["s1_012"] := by
    rw [← hpid, rs_R002_ueqv_R002YNN_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R002:u=v:R002YNN` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R002_ueqv_R002YNN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R002_ueqv_R002YNN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R002_ueqv_R002YNN) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R002_ueqv_R002YNN_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R002_ueqv_R002YNN_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R002_ueqv_R002YNN_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R002_ueqv_R002YNN_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
