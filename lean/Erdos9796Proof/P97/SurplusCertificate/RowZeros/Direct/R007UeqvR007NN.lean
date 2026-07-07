/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1040
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R007UeqvR007NN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G00
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G01
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G02
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G03
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G04
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G05
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G06
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G07
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G08
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G09
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G10
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G11
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G12
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G13
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G14
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G15
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G16
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G17
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G18
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G19
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G20
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G21
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G22
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G23
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G24
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G25
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G26
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G27
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G28
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G29
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R007UeqvR007NN.G30

/-!
# Direct row zeros for relaxed split surplus certificate R007:u=v:R007NN

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NN.json`.
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

/-- Paired generated row/certificate metadata for `R007:u=v:R007NN`. -/
private def rs_R007_ueqv_R007NN_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk 37 (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem rs_R007_ueqv_R007NN_rowCert_exactPids :
    rs_R007_ueqv_R007NN_rowCert.1.exactPids = ["s1_040"] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R007_ueqv_R007NN_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : rs_R007_ueqv_R007NN_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = "s1_040" := by
  have hlist : [exactRow.pid] = ["s1_040"] := by
    rw [← hpid, rs_R007_ueqv_R007NN_rowCert_exactPids]
  simpa using hlist

/-- The direct payload for `R007:u=v:R007NN` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R007_ueqv_R007NN_evaluationZeros_of_metricShadow
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
    (hpid : rs_R007_ueqv_R007NN_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R007_ueqv_R007NN) (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R007_ueqv_R007NN_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R007_ueqv_R007NN_generators, evalPoly (endpointPairAssignment pointOf .u .v) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
  · simpa using rs_R007_ueqv_R007NN_generator_00_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_01_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_02_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_03_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_04_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_05_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_06_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_07_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_08_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_09_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_10_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_11_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_12_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_13_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_14_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_15_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_16_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_17_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_18_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_19_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_20_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_21_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_22_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_23_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_24_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_25_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_26_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_27_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_28_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_29_zero hmetric hrow hmasks hpidEq
  · simpa using rs_R007_ueqv_R007NN_generator_30_zero hmetric hrow hmasks hpidEq

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
