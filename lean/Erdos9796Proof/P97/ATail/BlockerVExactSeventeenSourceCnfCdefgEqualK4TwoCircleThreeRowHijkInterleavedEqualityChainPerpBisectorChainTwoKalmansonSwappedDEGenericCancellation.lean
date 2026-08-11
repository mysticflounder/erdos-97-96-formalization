/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Generic two-Kalmanson cancellation clause for exact seventeen

This module banks the cardinality-generic two-Kalmanson cancellation exposed
by the terminal SAT model of the swapped-`D/E` root.  The clause family is
generated from the two named source orders and both reflected placements.  Its
soundness bridge handles both possible orientations of a geometric source
realization by replaying independently checked forward and reversed closure
certificates.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Canonical source label occupying boundary position `index` when the
geometric boundary has the indicated orientation. -/
def orientedLabelAtPosition (order : NamedOrder) (orientation : Orientation)
    (index : Label) : Label :=
  match orientation with
  | .forward => labelAtPosition order index
  | .reverse => labelAtPosition order (Fin.rev index)

/-- Exact permutation from canonical source labels to geometric boundary
indices. -/
def sourceIndexEquiv (order : NamedOrder) (orientation : Orientation) :
    Label ≃ Label where
  toFun := expectedLabelIndex orientation order
  invFun := orientedLabelAtPosition order orientation
  left_inv := by
    intro point
    cases orientation <;>
      simp [expectedLabelIndex, orientedLabelAtPosition]
  right_inv := by
    intro index
    cases orientation <;>
      simp [expectedLabelIndex, orientedLabelAtPosition]

@[simp] theorem sourceIndexEquiv_apply (order : NamedOrder)
    (orientation : Orientation) (point : Label) :
    sourceIndexEquiv order orientation point =
      expectedLabelIndex orientation order point := rfl

@[simp] theorem sourceIndexEquiv_symm_apply (order : NamedOrder)
    (orientation : Orientation) (index : Label) :
    (sourceIndexEquiv order orientation).symm index =
      orientedLabelAtPosition order orientation index := rfl

/-- The six positive rows used by the cancellation certificate in increasing
boundary coordinates. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 10} },
    { center := 10, support := {1, 13} },
    { center := 11, support := {0, 2} },
    { center := 13, support := {10, 15} },
    { center := 15, support := {2, 13} },
    { center := 16, support := {1, 15} }]

/-- Reflection of the six positive rows. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 15} },
    { center := 1, support := {3, 14} },
    { center := 3, support := {1, 6} },
    { center := 5, support := {14, 16} },
    { center := 6, support := {3, 15} },
    { center := 15, support := {6, 16} }]

/-- The twelve positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(1, 0), (1, 10), (10, 1), (10, 13),
    (11, 0), (11, 2), (13, 10), (13, 15),
    (15, 2), (15, 13), (16, 1), (16, 15)]

/-- Transport the canonical positional motif into one named source order and
one reflected placement. -/
def genericCancellationHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

/-- Checked forward cancellation certificate emitted by the exact-rational
producer bank. -/
def forwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 15, 16⟩
  firstForm := .adjacentSides
  secondQuad := ⟨0, 2, 11, 15⟩
  secondForm := .innerOuter
  permutation := ⟨3, 1, 2, 0⟩
  path0 := ⟨(0, 1),
    [.flip 0 1, .row 1 0 10, .flip 1 10,
      .row 10 1 13, .flip 10 13, .row 13 10 15,
      .flip 13 15, .row 15 13 2, .flip 15 2],
    (2, 15)⟩
  path1 := ⟨(15, 16),
    [.flip 15 16, .row 16 15 1, .flip 16 1],
    (1, 16)⟩
  path2 := ⟨(2, 11),
    [.flip 2 11, .row 11 2 0, .flip 11 0],
    (0, 11)⟩
  path3 := ⟨(0, 15), [], (0, 15)⟩ }

/-- Independently checked cancellation certificate for the reflected rows. -/
def reverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨1, 5, 14, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 1, 15, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 3, 2, 0⟩
  path0 := ⟨(5, 14), [.row 5 14 16], (5, 16)⟩
  path1 := ⟨(1, 16), [], (1, 16)⟩
  path2 := ⟨(0, 1), [.row 0 1 15], (0, 15)⟩
  path3 := ⟨(15, 16),
    [.row 15 16 6, .flip 15 6, .row 6 15 3,
      .flip 6 3, .row 3 6 1, .flip 3 1, .row 1 3 14],
    (1, 14)⟩ }

theorem forwardData_check : forwardData.check forwardChoices = true := by
  native_decide

theorem reverseData_check : reverseData.check reverseChoices = true := by
  native_decide

private theorem forwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ forwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ forwardHits := by
  native_decide +revert

private theorem reflectedForwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ reverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ forwardHits := by
  native_decide +revert

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

/-- Reindex the selected source rows by their actual geometric boundary
positions. -/
theorem sourceRealizesBoundaryPattern {A : Finset ℝ²}
    (source : SourceRealization A) :
    Realizes
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      source.boundary := by
  let e := sourceIndexEquiv source.model.order source.orientation
  have hlabels : Realizes source.model.selected
      (fun label => source.boundary (source.labelIndex label)) := by
    refine ⟨?_, source.boundary_injective.comp
      (labelIndex_injective_of_positionEmbedding source.orientation
        source.model.order source.labelIndex source.position_embedding)⟩
    intro center first hfirst second hsecond
    exact
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hfirst)).trans
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hsecond)).symm
  have hindex : ∀ label, source.labelIndex label = e label := by
    intro label
    rw [source.labelIndex_eq]
    rfl
  have htransport := realizes_reindexRowPattern e hlabels
  simpa only [hindex, Equiv.apply_symm_apply] using htransport

private theorem positiveRowsMatch_forward {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ genericCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      forwardChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [genericCancellationHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ genericCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      reverseChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [genericCancellationHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem false_of_genericCancellationHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ genericCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal forwardChoices
      (positiveRowsMatch_forward source source.model.order direction rfl hsame hall)
      forwardData forwardData_check
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal reverseChoices
      (positiveRowsMatch_reverse source source.model.order direction rfl hsame hall)
      reverseData reverseData_check

/-- One generic-cancellation clause for a named source order and one reflected
placement. -/
def genericCancellationClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (genericCancellationHits order direction)

/-- Every generated generic-cancellation clause is true under a source
realization. -/
theorem sourceAssign_genericCancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (genericCancellationClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_genericCancellationHits source order direction horder.symm hall

/-- Complete finite orbit: two named source orders and both reflections. -/
def genericCancellationClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => genericCancellationClause order direction

theorem genericCancellationClauses_length :
    genericCancellationClauses.length = 4 := by
  native_decide

/-- Every source realization satisfies the complete generic-cancellation
orbit. -/
theorem sourceAssign_genericCancellationClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ genericCancellationClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [genericCancellationClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_genericCancellationClause source order direction

/-- Lean-authoritative child root after the generic cancellation orbit. -/
def extendedGenericCancellationCnf : Std.Sat.CNF Atom :=
  extendedTwoKalmansonSwappedDECnf ++ genericCancellationClauses

theorem extendedGenericCancellationCnf_clause_count :
    extendedGenericCancellationCnf.length = 5846080 := by
  simp [extendedGenericCancellationCnf,
    extendedTwoKalmansonSwappedDECnf_clause_count,
    genericCancellationClauses_length]

/-- Gate B for the Lean-authoritative generic-cancellation child root. -/
theorem sourceAssign_extendedGenericCancellationCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedGenericCancellationCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedGenericCancellationCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedTwoKalmansonSwappedDECnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_genericCancellationClauses source clause hnew

/-- Certificate-to-source landing contract for the generic-cancellation child
root. -/
theorem false_of_sourceRealization_of_extendedGenericCancellationCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedGenericCancellationCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedGenericCancellationCnf source⟩

#print axioms sourceAssign_genericCancellationClause
#print axioms sourceAssign_extendedGenericCancellationCnf
#print axioms false_of_sourceRealization_of_extendedGenericCancellationCnf_unsat

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
end Problem97
