/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress

/-! Certificate ingress for all 76 canary two-Kalmanson physical cells. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage

/-- Zero-based variable index consumed by Lean's reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- One exact physical-slice cell in the representation checked by LRAT. -/
def certificateCnf (center : Label) (category : PhysicalSliceCategory) : CNF Nat :=
  CNF.relabel certificateVar
    (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
      center category)

/-- The fixed DIMACS numbering remains collision-free after zero-basing. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  exact
    ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress.certificateVar_injective

/-- Checked unsatisfiability of a relabelled cell implies typed-cell UNSAT. -/
theorem sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
    {center : Label} {category : PhysicalSliceCategory}
    (hcertificate : (certificateCnf center category).Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment
        (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
          center category) = true := by
  have htyped :
      (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
        center category).Unsat :=
    (CNF.unsat_relabel_iff
      (f :=
        sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
          center category)
      (r := certificateVar)
      (fun _ _ heq => certificateVar_injective heq)).mp hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

/-- Checked certificates for all 76 cells feed the source coverage consumer. -/
theorem false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCertificateCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        (certificateCnf center category).Unsat)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  apply
    false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCells
      (hsource := hsource)
  intro center hcenter category hcategory
  exact
    sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
      (hcell center hcenter category hcategory)

#print axioms certificateVar_injective
#print axioms
  sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
#print axioms
  false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCertificateCells

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCertificateIngress
end Problem97
