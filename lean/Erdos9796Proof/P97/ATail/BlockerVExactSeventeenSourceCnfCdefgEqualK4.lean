/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefg
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Checked equal-K4 clauses for the exact-seventeen source CNF

This module extends the checked C--G root by every source-row incidence pattern
which realizes the general equal-K4 metric obstruction.  The family is
order-invariant and is generated in Lean from the same proof-facing atoms as
the source CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open Census554.EqualityCore

/-- Four roles for an equal-K4 obstruction.  The general metric theorem only
requires the distinguished edge `(d,a)` to be nondegenerate. -/
structure EqualK4Choice where
  a : Label
  b : Label
  c : Label
  d : Label
  hda : d ≠ a

/-- All role assignments for which the distinguished edge is nondegenerate. -/
def equalK4Choices : List EqualK4Choice :=
  labels.flatMap fun a =>
    labels.flatMap fun b =>
      labels.flatMap fun c =>
        labels.filterMap fun d =>
          if hda : d ≠ a then some ⟨a, b, c, d, hda⟩ else none

/-- Positive row incidences which make all six distances on `a,b,c,d` equal. -/
def equalK4Hits (choice : EqualK4Choice) : List Hit :=
  [(choice.b, choice.a), (choice.b, choice.d),
    (choice.c, choice.a), (choice.c, choice.b), (choice.c, choice.d),
    (choice.d, choice.a), (choice.d, choice.b), (choice.d, choice.c)]

/-- Unguarded negative-hit clause for an order-invariant forbidden motif. -/
def equalK4Clause (choice : EqualK4Choice) : Std.Sat.CNF.Clause Atom :=
  (equalK4Hits choice).map fun hit => neg (.hit hit.1 hit.2)

/-- The eight positive source incidences yield the already-banked equal-K4
metric core, hence cannot occur in a geometric source realization. -/
theorem false_of_equalK4Hits {A : Finset ℝ²} (r : SourceRealization A)
    (choice : EqualK4Choice)
    (hhits : ∀ hit ∈ equalK4Hits choice,
      hit.2 ∈ r.model.selected hit.1) :
    False := by
  have hba : choice.a ∈ r.model.selected choice.b :=
    hhits (choice.b, choice.a) (by simp [equalK4Hits])
  have hbd : choice.d ∈ r.model.selected choice.b :=
    hhits (choice.b, choice.d) (by simp [equalK4Hits])
  have hca : choice.a ∈ r.model.selected choice.c :=
    hhits (choice.c, choice.a) (by simp [equalK4Hits])
  have hcb : choice.b ∈ r.model.selected choice.c :=
    hhits (choice.c, choice.b) (by simp [equalK4Hits])
  have hcd : choice.d ∈ r.model.selected choice.c :=
    hhits (choice.c, choice.d) (by simp [equalK4Hits])
  have hda : choice.a ∈ r.model.selected choice.d :=
    hhits (choice.d, choice.a) (by simp [equalK4Hits])
  have hdb : choice.b ∈ r.model.selected choice.d :=
    hhits (choice.d, choice.b) (by simp [equalK4Hits])
  have hdc : choice.c ∈ r.model.selected choice.d :=
    hhits (choice.d, choice.c) (by simp [equalK4Hits])
  let P : RowPattern Label := r.model.selected
  have hreal : Realizes P (fun label => r.boundary (r.labelIndex label)) := by
    refine ⟨?_, r.boundary_injective.comp
      (labelIndex_injective_of_positionEmbedding r.orientation r.model.order
        r.labelIndex r.position_embedding)⟩
    intro center x hx y hy
    exact
      ((r.selectedRow center).support_eq_radius _
        (r.mem_selectedRow_of_mem_model hx)).trans
      ((r.selectedRow center).support_eq_radius _
        (r.mem_selectedRow_of_mem_model hy)).symm
  let core : EqualK4Core P := {
    p := choice.d
    t₁ := choice.a
    t₂ := choice.b
    t₃ := choice.c
    hpt₁ := choice.hda
    hp₁p₂ := .row choice.d choice.a choice.b hda hdb
    hp₁p₃ := .row choice.d choice.a choice.c hda hdc
    hp₁₁₂ :=
      .trans (.row choice.d choice.a choice.b hda hdb)
        (.trans (.flip choice.d choice.b)
          (.trans (.row choice.b choice.d choice.a hbd hba)
            (.flip choice.b choice.a)))
    hp₁₁₃ :=
      .trans (.row choice.d choice.a choice.c hda hdc)
        (.trans (.flip choice.d choice.c)
          (.trans (.row choice.c choice.d choice.a hcd hca)
            (.flip choice.c choice.a)))
    hp₁₂₃ :=
      .trans (.row choice.d choice.a choice.c hda hdc)
        (.trans (.flip choice.d choice.c)
          (.trans (.row choice.c choice.d choice.b hcd hcb)
            (.flip choice.c choice.b))) }
  exact not_realizes_of_equalK4Core core ⟨_, hreal⟩

/-- Every geometric source assignment satisfies an equal-K4 nogood clause. -/
theorem sourceAssign_equalK4Clause {A : Finset ℝ²}
    (r : SourceRealization A) (choice : EqualK4Choice) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model) (equalK4Clause choice) = true := by
  have hnotall : ¬ ∀ hit ∈ equalK4Hits choice,
      hit.2 ∈ r.model.selected hit.1 := by
    intro hhits
    exact false_of_equalK4Hits r choice hhits
  push_neg at hnotall
  obtain ⟨hit, hhits, hnotmem⟩ := hnotall
  apply (clause_eval_iff r.model _).2
  refine ⟨.hit hit.1 hit.2, false, ?_, ?_⟩
  · simp [equalK4Clause, neg, hhits]
  · simp [sourceAssign, hnotmem]

/-- Complete checked equal-K4 clause family. -/
def equalK4Clauses : Std.Sat.CNF Atom :=
  equalK4Choices.map equalK4Clause

/-- Every geometric source realization satisfies every equal-K4 clause. -/
theorem sourceAssign_equalK4Clauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ equalK4Clauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [equalK4Clauses, List.mem_map] at hclause
  obtain ⟨choice, _hchoice, rfl⟩ := hclause
  exact sourceAssign_equalK4Clause r choice

/-- Lean-authoritative child root after adding the equal-K4 theorem bank. -/
def extendedEqualK4Cnf : Std.Sat.CNF Atom :=
  extendedCnf ++ equalK4Clauses

/-- Exact size of the equal-K4 clause family. -/
theorem equalK4Clauses_length : equalK4Clauses.length = 78608 := by
  native_decide

/-- Exact clause count of the Lean-authoritative equal-K4 child root. -/
theorem extendedEqualK4Cnf_clause_count :
    extendedEqualK4Cnf.length = 2268460 := by
  simp [extendedEqualK4Cnf, extendedCnf_clause_count, equalK4Clauses_length]

/-- Gate B for the equal-K4 child root. -/
theorem sourceAssign_extendedEqualK4Cnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedEqualK4Cnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedEqualK4Cnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_equalK4Clauses r clause hnew

/-- Certificate-to-source landing contract for the equal-K4 child root. -/
theorem false_of_sourceRealization_of_extendedEqualK4Cnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedEqualK4Cnf = true) :
    False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedEqualK4Cnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4
end Problem97
