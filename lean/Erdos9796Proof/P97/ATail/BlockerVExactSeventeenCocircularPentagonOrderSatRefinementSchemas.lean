/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-!
# Source-valid refinement mined from the cocircular-order SAT child

The authenticated order-zero child model contains this new minimum-width
two-Kalmanson cancellation support.  The checked forward and reflected data
reuse the cardinality-generic source consumer; this file adds only the concrete
exact-seventeen occurrence and its four guarded named-order/orientation clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def cocircularOrderSatOccurrenceHits : List Hit :=
  [(0, 1), (0, 16), (1, 0), (1, 15),
    (12, 15), (12, 16), (16, 0), (16, 1)]

def cocircularOrderSatOccurrenceForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 16} },
    { center := 1, support := {0, 15} },
    { center := 12, support := {15, 16} },
    { center := 16, support := {0, 1} }]

def cocircularOrderSatOccurrenceReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {15, 16} },
    { center := 4, support := {0, 1} },
    { center := 15, support := {1, 16} },
    { center := 16, support := {0, 15} }]

def cocircularOrderSatOccurrenceForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms :=
      [{ quad := ⟨1, 2, 15, 16⟩, form := .innerOuter, weight := 1 },
        { quad := ⟨2, 12, 15, 16⟩, form := .innerOuter, weight := 1 }]
    pairings :=
      [{ left := (2, 15), right := (2, 15),
         path := ⟨(2, 15), [], (2, 15)⟩ },
       { left := (1, 16), right := (1, 15),
         path := ⟨(1, 16), [.flip 1 16, .row 16 1 0, .flip 16 0,
           .row 0 16 1, .flip 0 1, .row 1 0 15], (1, 15)⟩ },
       { left := (12, 15), right := (12, 16),
         path := ⟨(12, 15), [.row 12 15 16], (12, 16)⟩ },
       { left := (2, 16), right := (2, 16),
         path := ⟨(2, 16), [], (2, 16)⟩ }] }

def cocircularOrderSatOccurrenceReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms :=
      [{ quad := ⟨0, 1, 10, 15⟩, form := .innerOuter, weight := 1 },
        { quad := ⟨0, 1, 4, 10⟩, form := .innerOuter, weight := 1 }]
    pairings :=
      [{ left := (1, 10), right := (1, 10),
         path := ⟨(1, 10), [], (1, 10)⟩ },
       { left := (0, 15), right := (1, 15),
         path := ⟨(0, 15), [.row 0 15 16, .flip 0 16, .row 16 0 15,
           .flip 16 15, .row 15 16 1, .flip 15 1], (1, 15)⟩ },
       { left := (1, 4), right := (0, 4),
         path := ⟨(1, 4), [.flip 1 4, .row 4 1 0, .flip 4 0], (0, 4)⟩ },
       { left := (0, 10), right := (0, 10),
         path := ⟨(0, 10), [], (0, 10)⟩ }] }

def cocircularOrderSatOccurrence : WeightedSourceOccurrence :=
  { hits := cocircularOrderSatOccurrenceHits
    forwardChoices := cocircularOrderSatOccurrenceForwardChoices
    reverseChoices := cocircularOrderSatOccurrenceReverseChoices
    forwardData := cocircularOrderSatOccurrenceForwardData
    reverseData := cocircularOrderSatOccurrenceReverseData }

theorem cocircularOrderSatOccurrence_check :
    cocircularOrderSatOccurrence.check = true := by
  decide

def cocircularOrderSatRefinementClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction =>
      weightedOccurrenceClause order direction cocircularOrderSatOccurrence

theorem cocircularOrderSatRefinementClauses_length :
    cocircularOrderSatRefinementClauses.length = 4 := by
  decide

theorem sourceAssign_cocircularOrderSatRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ cocircularOrderSatRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [cocircularOrderSatRefinementClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨order, _, direction, _, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source cocircularOrderSatOccurrence
    cocircularOrderSatOccurrence_check order direction

#print axioms cocircularOrderSatOccurrence_check
#print axioms sourceAssign_cocircularOrderSatRefinementClauses

end ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementSchemas
end Problem97
