/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.ExactBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.All
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.All

/-!
# Relaxed split pinned-surplus bank row-zero dispatch

This generated module dispatches a matched finite singleton relaxed-split
certificate row to the corresponding generated direct or product-sum row-zero
theorem, then plugs the row-local zero witness into the exact pinned-bank
bridge.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- A certified singleton relaxed-split pinned-surplus row carries a row-local
zero-evaluation assignment for its algebraic certificate payload. -/
theorem exists_payload_zeros_of_certifiedRelaxedSplitRow
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (exactRow : SurplusCOMPGBank.Row)
    (rowCert : Row × Certificate)
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid]) :
    ∃ ν : Nat → ℝ, rowCert.2.payload.evaluationZeros ν := by
  change rowCert ∈
    [
      certifiedRelaxedSplitRows.get (Fin.mk 0 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 1 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 2 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 3 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 4 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 5 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 6 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 7 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 8 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 9 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 10 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 11 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 12 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 13 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 14 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 15 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 16 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 17 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 18 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 19 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 20 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 21 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 22 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 23 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 24 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 25 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 26 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 27 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 28 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 29 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 30 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 31 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 32 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 33 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 34 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 35 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 36 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 37 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 38 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 39 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 40 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 41 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 42 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 43 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 44 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 45 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 46 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 47 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 48 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 49 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 50 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 51 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 52 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 53 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 54 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 55 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 56 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 57 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 58 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 59 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 60 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 61 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 62 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 63 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 64 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 65 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 66 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 67 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 68 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 69 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 70 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 71 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 72 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 73 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 74 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 75 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 76 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 77 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 78 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 79 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 80 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 81 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 82 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 83 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 84 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 85 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 86 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 87 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 88 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 89 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 90 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 91 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 92 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 93 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 94 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 95 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 96 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 97 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 98 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 99 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 100 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 101 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 102 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 103 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 104 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 105 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 106 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 107 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 108 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 109 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 110 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 111 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 112 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 113 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 114 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 115 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 116 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 117 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 118 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 119 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 120 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 121 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 122 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 123 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 124 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 125 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 126 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 127 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 128 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 129 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 130 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 131 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 132 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 133 (by simpa [certifiedRelaxedSplitRows_length])),
      certifiedRelaxedSplitRows.get (Fin.mk 134 (by simpa [certifiedRelaxedSplitRows_length]))
    ] at hrowCert
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R000_ueqv_R000_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointS1S3Assignment pointOf, by
      simpa using Direct.rs_R001_no_separator_R001N_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointS1S3Assignment pointOf, by
      simpa using Direct.rs_R001_no_separator_R001Y_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002NYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002YNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R002_ueqv_R002YNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002YNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002YYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R002_ueqv_R002YYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R003_ueqv_R003NN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R003_ueqv_R003NY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R003_ueqv_R003YN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R003_ueqv_R003YY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004NNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004NNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004NYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004NYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004YNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004YNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004YYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R004_ueqv_R004YYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R005_ueqv_R005NNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005NNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R005_ueqv_R005NNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R005_ueqv_R005NYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005NYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005YNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005YNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R005_ueqv_R005YNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005YYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R005_ueqv_R005YYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R006_ueqv_R006_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R007_ueqv_R007NN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R007_ueqv_R007NY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R007_ueqv_R007YN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R007_ueqv_R007YY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008NYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R008_ueqv_R008YYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R009_ueqs1_R009NN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R009_ueqs1_R009NY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R009_ueqs1_R009Y_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NNNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NNNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NNNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NNNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NNYNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NNYNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NNYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NYNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NYYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYYYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009NYYYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009NYYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009YNNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YNYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYNYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYNYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R009_ueqv_R009YYYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R009_ueqv_R009YYYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R010_ueqv_R010NN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R010_ueqv_R010NYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R010_ueqv_R010NYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R010_ueqv_R010YNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R010_ueqv_R010YNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R010_ueqv_R010YY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R011_ueqs1_R011NN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R011_ueqs1_R011NY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .s1, by
      simpa using Direct.rs_R011_ueqs1_R011Y_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R011_ueqv_R011NNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R011_ueqv_R011NNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011NNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011NYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011NYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011YNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011YNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011YNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R011_ueqv_R011YYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R011_ueqv_R011YYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R012_ueqv_R012_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013NNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013NNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013NNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013NNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013NYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013NYNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013NYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013NYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013YNNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013YNNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013YNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013YNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013YYNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013YYNYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R013_ueqv_R013YYNYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013YYYN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R013_ueqv_R013YYYY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R014_ueqv_R014NNN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R014_ueqv_R014NNY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R014_ueqv_R014NY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Direct.rs_R014_ueqv_R014YN_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ⟨endpointPairAssignment pointOf .u .v, by
      simpa using Product.rs_R014_ueqv_R014YY_evaluationZeros_of_metricShadow
        hmetric hrow hmasks (by simpa using hpid)⟩
  cases hrowCert

/-- Exact pinned-bank membership contradicts a metric interpretation of the
matched shadow. -/
theorem false_of_shadowInBank_of_metricShadow
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    (hin :
      SurplusCOMPGBank.shadowInBank
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) = true)
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)) :
    False := by
  exact
    Problem97.SurplusCertificate.RelaxedSplit.Bank.false_of_shadowInBank_of_exists_payload_zeros hin
      (fun exactRow rowCert hrow hmasks hrowCert hpid =>
        exists_payload_zeros_of_certifiedRelaxedSplitRow hmetric exactRow
          rowCert hrow hmasks hrowCert hpid)

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
