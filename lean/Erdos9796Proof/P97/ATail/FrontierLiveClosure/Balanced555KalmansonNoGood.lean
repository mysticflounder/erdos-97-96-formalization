/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteConfiguration
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Kalmanson no-goods for the balanced `(5, 5, 5)` finite configuration

Each retained occurrence consists of three positive selected-row pairs and two
strict Kalmanson inequalities.  A checked equality-closure certificate records
how the six row incidences cancel the strict inequalities.  Consequently the
six incidences cannot all hold, which is precisely the corresponding all-negative
SAT clause.

The occurrence validity field uses the cardinality-generic checker.  Thus a
generated occurrence is admitted here only after its concrete cancellation
paths, order data, and four-slot permutation have passed that checker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.EqualityCore
open GenericRowNogoodCertificate

/-- One of the three positive selected-row pairs used by a balanced Kalmanson
occurrence. -/
structure Balanced555RequiredRowPair where
  center : Fin 12
  first : Fin 12
  second : Fin 12
deriving DecidableEq, Repr

namespace Balanced555RequiredRowPair

/-- Interpret a required pair as one row choice for the generic checker. -/
def rowChoice (pair : Balanced555RequiredRowPair) : RowChoice (Fin 12) :=
  { center := pair.center
    support := {pair.first, pair.second} }

end Balanced555RequiredRowPair

/-- The two strict Kalmanson inequalities used by the finite generator.
`k1` is the adjacent-sides inequality and `k2` is the inner-outer inequality. -/
inductive Balanced555KalmansonKind where
  | k1
  | k2
deriving DecidableEq, Repr

namespace Balanced555KalmansonKind

/-- Translate the generator's inequality tag to the generic geometric form. -/
def form : Balanced555KalmansonKind → KalmansonForm
  | .k1 => .adjacentSides
  | .k2 => .innerOuter

end Balanced555KalmansonKind

/-- Proof-free data for one balanced Kalmanson occurrence.  The first six fields
are the source-level generator metadata; the remaining fields are its compact
equality-cancellation witness. -/
structure Balanced555KalmansonOccurrenceData where
  row0 : Balanced555RequiredRowPair
  row1 : Balanced555RequiredRowPair
  row2 : Balanced555RequiredRowPair
  firstQuad : OrderedQuadData (Fin 12)
  firstKind : Balanced555KalmansonKind
  secondQuad : OrderedQuadData (Fin 12)
  secondKind : Balanced555KalmansonKind
  permutation : Permutation4Data
  path0 : ClosurePathData (Fin 12)
  path1 : ClosurePathData (Fin 12)
  path2 : ClosurePathData (Fin 12)
  path3 : ClosurePathData (Fin 12)
deriving DecidableEq, Repr

namespace Balanced555KalmansonOccurrenceData

/-- The three pair rows consumed by the generic cancellation checker. -/
def rowChoices (data : Balanced555KalmansonOccurrenceData) :
    List (RowChoice (Fin 12)) :=
  [data.row0.rowChoice, data.row1.rowChoice, data.row2.rowChoice]

/-- The generic two-Kalmanson cancellation certificate represented by an
occurrence. -/
def cancellationData (data : Balanced555KalmansonOccurrenceData) :
    TwoKalmansonCancellationData (Fin 12) :=
  { firstQuad := data.firstQuad
    firstForm := data.firstKind.form
    secondQuad := data.secondQuad
    secondForm := data.secondKind.form
    permutation := data.permutation
    path0 := data.path0
    path1 := data.path1
    path2 := data.path2
    path3 := data.path3 }

/-- The six source incidences, in the same row-major order as the DIMACS
generator. -/
def positiveAtoms (data : Balanced555KalmansonOccurrenceData) :
    List (Fin 12 × Fin 12) :=
  [(data.row0.center, data.row0.first),
    (data.row0.center, data.row0.second),
    (data.row1.center, data.row1.first),
    (data.row1.center, data.row1.second),
    (data.row2.center, data.row2.first),
    (data.row2.center, data.row2.second)]

/-- The six-negative SAT clause excluding simultaneous realization of all three
required row pairs. -/
def noGoodClause (data : Balanced555KalmansonOccurrenceData) :
    Std.Sat.CNF.Clause (Fin 12 × Fin 12) :=
  data.positiveAtoms.map fun atom ↦ (atom, false)

@[simp] theorem positiveAtoms_length (data : Balanced555KalmansonOccurrenceData) :
    data.positiveAtoms.length = 6 := by
  rfl

@[simp] theorem noGoodClause_length (data : Balanced555KalmansonOccurrenceData) :
    data.noGoodClause.length = 6 := by
  simp [noGoodClause]

end Balanced555KalmansonOccurrenceData

/-- A retained occurrence is proof-free occurrence data together with acceptance
by the generic cancellation checker. -/
structure Balanced555KalmansonOccurrence where
  data : Balanced555KalmansonOccurrenceData
  valid : data.cancellationData.check data.rowChoices = true

namespace Balanced555KalmansonOccurrence

/-- The truth assignment induced by the selected rows of a finite
configuration. -/
def selectedAssignment (configuration : Balanced555FiniteConfiguration) :
    Fin 12 × Fin 12 → Bool :=
  fun atom ↦ decide (atom.2 ∈ configuration.selectedAt atom.1)

private theorem positiveRowsMatch_of_atoms_true
    (configuration : Balanced555FiniteConfiguration)
    (data : Balanced555KalmansonOccurrenceData)
    (hall : ∀ atom ∈ data.positiveAtoms,
      selectedAssignment configuration atom = true) :
    PositiveRowsMatch configuration.selectedAt data.rowChoices := by
  intro choice hchoice point hpoint
  simp only [Balanced555KalmansonOccurrenceData.rowChoices,
    List.mem_cons, List.not_mem_nil, or_false] at hchoice
  rcases hchoice with hchoice | hchoice | hchoice <;> subst choice
  · simp only [Balanced555RequiredRowPair.rowChoice, Finset.mem_insert,
      Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row0.center, data.row0.first)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row0.center, data.row0.second)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])
  · simp only [Balanced555RequiredRowPair.rowChoice, Finset.mem_insert,
      Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row1.center, data.row1.first)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row1.center, data.row1.second)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])
  · simp only [Balanced555RequiredRowPair.rowChoice, Finset.mem_insert,
      Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row2.center, data.row2.first)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])
    · apply of_decide_eq_true
      simpa [selectedAssignment, Balanced555RequiredRowPair.rowChoice] using
        hall (data.row2.center, data.row2.second)
          (by simp [Balanced555KalmansonOccurrenceData.positiveAtoms])

private theorem atoms_true_of_noGoodClause_false
    (configuration : Balanced555FiniteConfiguration)
    (data : Balanced555KalmansonOccurrenceData)
    (hfalse : Std.Sat.CNF.Clause.eval (selectedAssignment configuration)
      data.noGoodClause = false) :
    ∀ atom ∈ data.positiveAtoms,
      selectedAssignment configuration atom = true := by
  intro atom hatom
  by_contra hnot
  have hatomFalse : selectedAssignment configuration atom = false :=
    Bool.eq_false_of_not_eq_true hnot
  have heval : Std.Sat.CNF.Clause.eval (selectedAssignment configuration)
      data.noGoodClause = true := by
    rw [Std.Sat.CNF.Clause.eval, List.any_eq_true]
    refine ⟨(atom, false), ?_, ?_⟩
    · exact List.mem_map.mpr ⟨atom, hatom, rfl⟩
    · simp [hatomFalse]
  rw [hfalse] at heval
  exact Bool.false_ne_true heval

/-- The three positive row pairs of a retained occurrence cannot all occur in
a balanced finite configuration. -/
theorem false_of_positiveRowsMatch
    (configuration : Balanced555FiniteConfiguration)
    (occurrence : Balanced555KalmansonOccurrence)
    (hpositive : PositiveRowsMatch configuration.selectedAt occurrence.data.rowChoices) :
    False :=
  false_of_twoKalmansonCancellationData_of_check
    configuration.carrier_convex configuration.pointOf_image
    configuration.pointOf_ccw configuration.realizes occurrence.data.rowChoices
    hpositive occurrence.data.cancellationData occurrence.valid

/-- Every retained occurrence yields its six-negative no-good clause under the
selected-row assignment of a balanced finite configuration. -/
theorem noGoodClause_eval
    (configuration : Balanced555FiniteConfiguration)
    (occurrence : Balanced555KalmansonOccurrence) :
    Std.Sat.CNF.Clause.eval (selectedAssignment configuration)
      occurrence.data.noGoodClause = true := by
  by_contra hnot
  have hfalse : Std.Sat.CNF.Clause.eval (selectedAssignment configuration)
      occurrence.data.noGoodClause = false :=
    Bool.eq_false_of_not_eq_true hnot
  exact false_of_positiveRowsMatch configuration occurrence
    (positiveRowsMatch_of_atoms_true configuration occurrence.data
      (atoms_true_of_noGoodClause_false configuration occurrence.data hfalse))

end Balanced555KalmansonOccurrence

end ATailFrontierLiveClosure
end Problem97
