/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress
import Std.Sat.CNF.Relabel
import Std.Tactic.BVDecide

/-!
# Certificate ingress for the V8 physical-slice cells

The terminal LRAT checker uses zero-based natural-number variables.  This
module transports each checked V8 cell back to the typed source cell and then
feeds the 76-cell source-coverage consumer.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCoverage

/-- Zero-based variable index consumed by the reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- One relabelled V8 physical-slice cell. -/
def certificateCnf (center : Label) (category : PhysicalSliceCategory) : CNF Nat :=
  CNF.relabel certificateVar
    (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
      center category)

/-- The fixed DIMACS numbering remains collision-free after zero-basing. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  exact ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCertificateIngress.certificateVar_injective

/-- Relabelled-cell UNSAT implies typed-cell UNSAT. -/
theorem canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
    {center : Label} {category : PhysicalSliceCategory}
    (hcertificate : (certificateCnf center category).Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment
        (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
          center category) = true := by
  have htyped :
      (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
        center category).Unsat :=
    (CNF.unsat_relabel_iff
      (f := canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
        center category)
      (r := certificateVar)
      (fun _ _ heq => certificateVar_injective heq)).mp hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

/-- Checked LRAT theorems for all 76 cells feed the V8 coordinator. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCertificateCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        (certificateCnf center category).Unsat)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  apply
    false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCells
      (hsource := hsource)
  intro center hcenter category hcategory
  exact
    canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
      (hcell center hcenter category hcategory)

#print axioms certificateVar_injective
#print axioms
  canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf_unsat_of_certificateCnf_unsat
#print axioms
  false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCertificateCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCertificateIngress
end Problem97
