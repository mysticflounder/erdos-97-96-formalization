/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NormalizedV14Ingress

/-!
# Semantic coordinates for exact-twelve normalized-v14 jobs

This module turns the two existential branch predicates produced by the
normalized-v14 source ingress into the exact finite coordinates used by the
648-cell schedule: one of six named-deletion arms and one of nine admissible
distinguished labels.  Together with the twelve normalized placement
representatives, these coordinates form a finite type of cardinality 648.

This is a source-to-schedule interface.  It does not compile a CNF, prove that
the canonical source valuation satisfies a compiled job, establish terminal
coverage, or close a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The six source/deletion choices used by the normalized-v14 schedule. -/
inductive FrozenNamedDeletionArm where
  | uQ
  | uW
  | xvQ
  | xvW
  | xuQ
  | xuW
  deriving DecidableEq, Fintype

namespace FrozenNamedDeletionArm

/-- Index of the physical-cycle source whose blocker row is inspected. -/
def blockerSourceIndex : FrozenNamedDeletionArm → Fin 5
  | uQ | uW => 0
  | xvQ | xvW => 4
  | xuQ | xuW => 1

/-- The named interior-deletion label omitted by the selected blocker row. -/
def deletionLabel : FrozenNamedDeletionArm → Label
  | uQ | xvQ | xuQ => 10
  | uW | xvW | xuW => 11

/-- Semantic condition represented by one fixed named-deletion arm. -/
def Holds (arm : FrozenNamedDeletionArm) (row : RowPattern Label)
    (blocker : Fin 5 → Label) : Prop :=
  blocker arm.blockerSourceIndex ≠ 2 ∧
    arm.deletionLabel ∉ row (blocker arm.blockerSourceIndex)

end FrozenNamedDeletionArm

/-- The source-produced six-way disjunction is exactly selection of one
schedule arm. -/
theorem frozenNamedDeletionSixArm_iff_exists_arm
    {row : RowPattern Label} {blocker : Fin 5 → Label} :
    FrozenNamedDeletionSixArm row blocker ↔
      ∃ arm : FrozenNamedDeletionArm, arm.Holds row blocker := by
  constructor
  · intro h
    rcases h with h | h | h | h | h | h
    · exact ⟨.uQ, h⟩
    · exact ⟨.uW, h⟩
    · exact ⟨.xvQ, h⟩
    · exact ⟨.xvW, h⟩
    · exact ⟨.xuQ, h⟩
    · exact ⟨.xuW, h⟩
  · rintro ⟨arm, harm⟩
    cases arm <;>
      simp_all [FrozenNamedDeletionSixArm, FrozenNamedDeletionArm.Holds,
        FrozenNamedDeletionArm.blockerSourceIndex,
        FrozenNamedDeletionArm.deletionLabel]

/-- The fixed-`d` semantic packet represented by one schedule coordinate. -/
def FrozenDistinguishedDAt (row : RowPattern Label)
    (blocker : Fin 5 → Label) (d : Label) : Prop :=
  d ≠ 1 ∧ d ≠ 7 ∧ d ≠ 8 ∧
    7 ∈ row d ∧ 9 ∉ row d ∧ blocker 1 ≠ d ∧
    ¬ (d ∈ row 1 ∧
      1 ∈ row d ∧ 6 ∈ row d ∧ 1 ∈ row 7 ∧ d ∈ row 7)

/-- The nine distinguished labels admitted by the Python schedule. -/
def frozenDistinguishedDCenters : Finset Label :=
  {0, 2, 3, 4, 5, 6, 9, 10, 11}

theorem mem_frozenDistinguishedDCenters_iff (d : Label) :
    d ∈ frozenDistinguishedDCenters ↔ d ≠ 1 ∧ d ≠ 7 ∧ d ≠ 8 := by
  fin_cases d <;> decide

/-- The strengthened source predicate is exactly a choice of one of the nine
scheduled distinguished labels together with its fixed-`d` semantics. -/
theorem frozenDistinguishedDCommonMissingAwayFromEight_iff_exists_scheduled
    {row : RowPattern Label} {blocker : Fin 5 → Label} :
    FrozenDistinguishedDCommonMissingAwayFromEight row blocker ↔
      ∃ d ∈ frozenDistinguishedDCenters,
        FrozenDistinguishedDAt row blocker d := by
  constructor
  · rintro ⟨d, hd1, hd7, hd8, h7row, h9row, hblocker, hmissing⟩
    refine ⟨d, (mem_frozenDistinguishedDCenters_iff d).2 ⟨hd1, hd7, hd8⟩, ?_⟩
    exact ⟨hd1, hd7, hd8, h7row, h9row, hblocker, hmissing⟩
  · rintro ⟨d, _hdSchedule, hd1, hd7, hd8, h7row, h9row, hblocker,
      hmissing⟩
    exact ⟨d, hd1, hd7, hd8, h7row, h9row, hblocker, hmissing⟩

/-- One of the twelve normalized placement representatives. -/
abbrev FrozenV14Placement :=
  {placement // placement ∈ frozenSeparatedPlacementRepresentatives}

/-- One of the nine admissible distinguished labels. -/
abbrev FrozenV14DistinguishedD :=
  {d // d ∈ frozenDistinguishedDCenters}

/-- Exact semantic coordinate type of the normalized-v14 job schedule. -/
abbrev FrozenV14JobCoordinate :=
  FrozenV14Placement × FrozenNamedDeletionArm × FrozenV14DistinguishedD

/-- The checked semantic coordinate space has the same cardinality as the
Python `12 × 6 × 9` schedule. -/
theorem frozenV14JobCoordinate_card :
    Fintype.card FrozenV14JobCoordinate = 648 := by
  set_option maxRecDepth 100000 in
    decide

/-- Any normalized source-side branch packet selects a concrete job
coordinate whose arm and distinguished-label predicates hold. -/
theorem exists_jobCoordinate_of_normalized_semantics
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    {placement : Label × Label}
    (hplacement : placement ∈ frozenSeparatedPlacementRepresentatives)
    (harm : FrozenNamedDeletionSixArm row blocker)
    (hd : FrozenDistinguishedDCommonMissingAwayFromEight row blocker) :
    ∃ cell : FrozenV14JobCoordinate,
      cell.1.1 = placement ∧
        cell.2.1.Holds row blocker ∧
        FrozenDistinguishedDAt row blocker cell.2.2.1 := by
  obtain ⟨arm, harm⟩ := frozenNamedDeletionSixArm_iff_exists_arm.mp harm
  obtain ⟨d, hdSchedule, hd⟩ :=
    frozenDistinguishedDCommonMissingAwayFromEight_iff_exists_scheduled.mp hd
  exact ⟨(⟨placement, hplacement⟩, arm, ⟨d, hdSchedule⟩), rfl, harm, hd⟩

/-- The five physical source labels in the exact order used by the compiler. -/
def frozenPhysicalSources (jointDeletion v : Label) : Fin 5 → Label := ![
  6, 9, jointDeletion, v, 8]

/-- The five physical-cycle edges in source order. -/
def frozenPhysicalEdges (jointDeletion v : Label) : Fin 5 → Finset Label := ![
  {6, 9}, {9, jointDeletion}, {jointDeletion, v}, {v, 8}, {8, 6}]

/-- The physical five-class used by the normalized-v14 compiler. -/
def frozenPhysicalLabels (jointDeletion v : Label) : Finset Label :=
  {6, 9, jointDeletion, v, 8}

/-- The exact selected row forced at the second-apex label `1`. -/
def frozenRowAtOne (jointDeletion v : Label) : Finset Label :=
  {6, jointDeletion, v, 8}

/-- Semantic replay of all non-base constraints added by one normalized-v14
job.  This predicate intentionally stays above DIMACS variable numbering; the
next compiler-reflection layer proves that it yields a satisfying extension
for the exact emitted clauses. -/
def FrozenV14AddedConstraintsHold (row : RowPattern Label)
    (blocker : Fin 5 → Label) (jointDeletion v : Label)
    (arm : FrozenNamedDeletionArm) (d : Label) : Prop :=
  row 1 = frozenRowAtOne jointDeletion v ∧
    row 7 ∩ frozenPhysicalLabels jointDeletion v = {6, 8} ∧
    Function.Injective blocker ∧
    blocker 0 = 8 ∧ blocker 4 = 7 ∧
    (∀ i, blocker i ≠ frozenPhysicalSources jointDeletion v i) ∧
    (∀ i, blocker i ≠ 1) ∧
    (∀ i, row (blocker i) ∩ frozenPhysicalLabels jointDeletion v =
      frozenPhysicalEdges jointDeletion v i) ∧
    arm.Holds row blocker ∧
    FrozenDistinguishedDAt row blocker d

/-- Assemble the compiler-facing semantic replay from the individual facts
returned by normalized source ingress and fixed-cell witness selection. -/
theorem frozenV14AddedConstraintsHold_of_facts
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    {jointDeletion v : Label} {arm : FrozenNamedDeletionArm} {d : Label}
    (hrowOne : row 1 = frozenRowAtOne jointDeletion v)
    (hrowSeven :
      row 7 ∩ frozenPhysicalLabels jointDeletion v = {6, 8})
    (hblockerInjective : Function.Injective blocker)
    (hblockerU : blocker 0 = 8) (hblockerXv : blocker 4 = 7)
    (hblockerNeSource :
      ∀ i, blocker i ≠ frozenPhysicalSources jointDeletion v i)
    (hblockerNeOne : ∀ i, blocker i ≠ 1)
    (hrowTrace : ∀ i,
      row (blocker i) ∩ frozenPhysicalLabels jointDeletion v =
        frozenPhysicalEdges jointDeletion v i)
    (harm : arm.Holds row blocker)
    (hd : FrozenDistinguishedDAt row blocker d) :
    FrozenV14AddedConstraintsHold row blocker jointDeletion v arm d := by
  exact ⟨hrowOne, hrowSeven, hblockerInjective, hblockerU, hblockerXv,
    hblockerNeSource, hblockerNeOne, hrowTrace, harm, hd⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
