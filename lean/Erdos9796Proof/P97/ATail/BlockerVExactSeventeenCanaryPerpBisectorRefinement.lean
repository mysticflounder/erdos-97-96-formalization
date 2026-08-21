/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Unguarded perpendicular-bisector refinement for the canary root

The eight positive incidences with foci `5, 6` and witnesses `2, 8, 14`
produce three equality paths on one perpendicular bisector.  This is an
order-invariant source clause and therefore appends directly to the
7,409,295-clause model-refinement root.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

def canaryPerpBisectorHits : List Hit :=
  [(5, 2), (5, 14), (6, 2), (6, 14),
    (8, 5), (8, 6), (14, 5), (14, 6)]

def canaryPerpBisectorChoices : List (RowChoice Label) :=
  [{ center := 5, support := {2, 14} },
    { center := 6, support := {2, 14} },
    { center := 8, support := {5, 6} },
    { center := 14, support := {5, 6} }]

def canaryPerpBisectorData : PerpBisectorData Label := {
  a := 5
  b := 6
  p := 2
  q := 8
  r := 14
  pa_pb := ⟨(2, 5), [.flip 2 5, .row 5 2 14, .flip 5 14,
    .row 14 5 6, .flip 14 6, .row 6 14 2, .flip 6 2], (2, 6)⟩
  qa_qb := ⟨(8, 5), [.row 8 5 6], (8, 6)⟩
  ra_rb := ⟨(14, 5), [.row 14 5 6], (14, 6)⟩ }

theorem canaryPerpBisectorData_check :
    canaryPerpBisectorData.check canaryPerpBisectorChoices = true := by
  decide

def canaryPerpBisectorClause : Std.Sat.CNF.Clause Atom :=
  canaryPerpBisectorHits.map fun hit => neg (.hit hit.1 hit.2)

/-- Exact DIMACS payload of the source-valid perpendicular-bisector cut. -/
theorem canaryPerpBisectorClause_dimacs :
    canaryPerpBisectorClause.map litToDimacs =
      [-88, -100, -105, -117, -142, -143, -244, -245] := by
  decide

private theorem false_of_canaryPerpBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A)
    (hhits : ∀ hit ∈ canaryPerpBisectorHits,
      hit.2 ∈ source.model.selected hit.1) : False := by
  have h52 := hhits (5, 2) (by simp [canaryPerpBisectorHits])
  have h514 := hhits (5, 14) (by simp [canaryPerpBisectorHits])
  have h62 := hhits (6, 2) (by simp [canaryPerpBisectorHits])
  have h614 := hhits (6, 14) (by simp [canaryPerpBisectorHits])
  have h85 := hhits (8, 5) (by simp [canaryPerpBisectorHits])
  have h86 := hhits (8, 6) (by simp [canaryPerpBisectorHits])
  have h145 := hhits (14, 5) (by simp [canaryPerpBisectorHits])
  have h146 := hhits (14, 6) (by simp [canaryPerpBisectorHits])
  have hrows : PositiveRowsMatch source.model.selected canaryPerpBisectorChoices := by
    intro choice hchoice point hpoint
    simp only [canaryPerpBisectorChoices, List.mem_cons, List.not_mem_nil,
      or_false] at hchoice
    rcases hchoice with rfl | rfl | rfl | rfl
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h52
      · exact h514
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h62
      · exact h614
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h85
      · exact h86
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h145
      · exact h146
  rcases nonempty_perpBisectorCore_of_positiveCheck hrows
      canaryPerpBisectorData canaryPerpBisectorData_check with ⟨core⟩
  let P : RowPattern Label := source.model.selected
  have hreal : Realizes P (fun label => source.boundary (source.labelIndex label)) := by
    refine ⟨?_, source.boundary_injective.comp
      (labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding)⟩
    intro center first hfirst second hsecond
    exact
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hfirst)).trans
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hsecond)).symm
  exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore hreal
    source.carrier_convexIndep
    (fun label => boundaryLabel_mem source.boundary source.boundary_image
      source.labelIndex label) core

theorem sourceAssign_canaryPerpBisectorClause
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      canaryPerpBisectorClause = true := by
  have hnotall : ¬ ∀ hit ∈ canaryPerpBisectorHits,
      hit.2 ∈ source.model.selected hit.1 := by
    intro hhits
    exact false_of_canaryPerpBisectorHits source hhits
  push_neg at hnotall
  obtain ⟨hit, hhits, hnotmem⟩ := hnotall
  apply (clause_eval_iff source.model _).2
  refine ⟨.hit hit.1 hit.2, false, ?_, ?_⟩
  · simp [canaryPerpBisectorClause, neg, hhits]
  · simp [sourceAssign, hnotmem]

def canaryPerpBisectorRefinementCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements.extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf ++
    [canaryPerpBisectorClause]

theorem canaryPerpBisectorRefinementCnf_length :
    canaryPerpBisectorRefinementCnf.length = 7409296 := by
  rw [canaryPerpBisectorRefinementCnf, List.length_append,
    ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements.extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf_length]
  rfl

theorem sourceAssign_canaryPerpBisectorRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorRefinementCnf = true := by
  rw [canaryPerpBisectorRefinementCnf, Std.Sat.CNF.eval_append]
  rw [
    ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements.sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf
      source horder]
  simp [sourceAssign_canaryPerpBisectorClause source]

#print axioms canaryPerpBisectorData_check
#print axioms canaryPerpBisectorClause_dimacs
#print axioms sourceAssign_canaryPerpBisectorClause
#print axioms sourceAssign_canaryPerpBisectorRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement
end Problem97
