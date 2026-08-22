/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinementsPhysicalSliceCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress
import Std.Sat.CNF.Relabel
import Std.Tactic.BVDecide

/-!
# Certificate ingress for the FourPoint physical-slice cells

The terminal LRAT checker works with zero-based natural-number variables.
This module transports each checked FourPoint cell back to the typed source
cell and then feeds the existing 76-cell coverage consumer.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinementsPhysicalSliceCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinementsPhysicalSliceCoverage

/-- Zero-based variable index consumed by the reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- One relabelled FourPoint physical-slice cell. -/
def certificateCnf (center : Label) (category : PhysicalSliceCategory) : CNF Nat :=
  CNF.relabel certificateVar
    (canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf
      center category)

/-- The fixed DIMACS numbering remains collision-free after zero-basing. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  exact ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress.certificateVar_injective

/-- Relabelled-cell UNSAT implies typed-cell UNSAT. -/
theorem canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
    {center : Label} {category : PhysicalSliceCategory}
    (hcertificate : (certificateCnf center category).Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment
        (canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf
          center category) = true := by
  have htyped :
      (canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf
        center category).Unsat :=
    (CNF.unsat_relabel_iff
      (f := canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf
        center category)
      (r := certificateVar)
      (fun _ _ heq => certificateVar_injective heq)).mp hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

/-- Checked LRAT theorems for all 76 cells feed the FourPoint coordinator. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCertificateCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        (certificateCnf center category).Unsat)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  apply
    false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCells
      (hsource := hsource)
  intro center hcenter category hcategory
  exact
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
      (hcell center hcenter category hcategory)

#print axioms certificateVar_injective
#print axioms
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
#print axioms
  false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCertificateCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinementsPhysicalSliceCertificateIngress
end Problem97
