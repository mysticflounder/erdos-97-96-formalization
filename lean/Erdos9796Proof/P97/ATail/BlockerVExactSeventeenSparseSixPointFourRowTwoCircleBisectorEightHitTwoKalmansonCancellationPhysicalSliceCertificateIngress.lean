/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationPhysicalSliceCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress

/-!
# Certificate ingress for exact-17 eight-hit two-Kalmanson physical-slice cells

The terminal LRAT checker uses zero-based natural-number variables. This module fixes
the representation boundary for all 76 source-covered physical slices before any
solver result is promoted.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationPhysicalSliceCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationPhysicalSliceCoverage

/-- Zero-based variable index consumed by Lean's reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- One exact physical-slice cell in the representation checked by LRAT. -/
def certificateCnf (center : Label) (category : PhysicalSliceCategory) : CNF Nat :=
  CNF.relabel certificateVar
    (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf
      center category)

/-- The fixed DIMACS numbering remains collision-free after zero-basing. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  exact
    ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress.certificateVar_injective

/-- Checked unsatisfiability of a relabelled cell implies typed-cell unsatisfiability. -/
theorem sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
    {center : Label} {category : PhysicalSliceCategory}
    (hcertificate : (certificateCnf center category).Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment
        (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf
          center category) = true := by
  have htyped :
      (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf
        center category).Unsat :=
    (CNF.unsat_relabel_iff
      (f := sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf
        center category)
      (r := certificateVar)
      (fun _ _ heq => certificateVar_injective heq)).mp hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

/-- Checked LRAT theorems for all 76 cells feed the source coverage consumer. -/
theorem false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCertificateCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        (certificateCnf center category).Unsat)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  apply false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCells
    (hsource := hsource)
  intro center hcenter category hcategory
  exact
    sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
      (hcell center hcenter category hcategory)

#print axioms certificateVar_injective
#print axioms
  sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
#print axioms
  false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonPhysicalSliceCertificateCells

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationPhysicalSliceCertificateIngress
end Problem97
