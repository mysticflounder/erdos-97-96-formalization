/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Source semantics for exact-twelve positive-membership CNF variables

The Python compiler may introduce a fresh variable for a partial row
requirement.  A selected exact row implies that variable whenever it contains
the requirement, and one all-negative clause blocks a complete collection of
requirements.  This file supplies the source-facing Boolean valuation and the
two semantic facts needed to replay those clauses.

This is only the generic pattern-variable bridge.  It does not authenticate a
generated bank, value the static equality variables, or prove terminal UNSAT.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace PositiveMembershipCnfBridge

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer

/-- A fresh CNF variable and the partial source row that it denotes. -/
structure PositiveMembershipDefinition where
  varIndex : Nat
  requirement : RowChoice Label
deriving DecidableEq

/-- Extend an arbitrary parent valuation above `cutoff` by interpreting every
fresh variable as the positive row requirement assigned to it. -/
def positiveMembershipAssign (base : Nat → Bool) (cutoff : Nat)
    (row : RowPattern Label) (requirementAt : Nat → RowChoice Label) :
    Nat → Bool :=
  fun v =>
    if v ≤ cutoff then base v
    else decide ((requirementAt v).support ⊆
      row (requirementAt v).center)

@[simp] theorem positiveMembershipAssign_of_le
    (base : Nat → Bool) (cutoff : Nat) (row : RowPattern Label)
    (requirementAt : Nat → RowChoice Label) {v : Nat}
    (hv : v ≤ cutoff) :
    positiveMembershipAssign base cutoff row requirementAt v =
      base v := by
  simp [positiveMembershipAssign, hv]

@[simp] theorem positiveMembershipAssign_of_lt
    (base : Nat → Bool) (cutoff : Nat) (row : RowPattern Label)
    (requirementAt : Nat → RowChoice Label) {v : Nat}
    (hv : cutoff < v) :
    positiveMembershipAssign base cutoff row requirementAt v =
      decide ((requirementAt v).support ⊆
        row (requirementAt v).center) := by
  simp [positiveMembershipAssign, Nat.not_le.mpr hv]

/-- A selected exact candidate row forces one fresh positive-membership
variable. -/
def positiveMembershipImplicationClause (candidate : RowChoice Label)
    (definition : PositiveMembershipDefinition) : List Int :=
  [learnedLiteral candidate, Int.ofNat definition.varIndex]

/-- The compiler-facing form of the same implication, indexed directly into
the canonical candidate table. -/
def positiveMembershipIndexImplicationClause (center : Label)
    (candidateIndex : Nat) (definition : PositiveMembershipDefinition) :
    List Int :=
  [-Int.ofNat (SafeCoverCnf.xVar center.val candidateIndex),
    Int.ofNat definition.varIndex]

/-- All candidate-index implications attached to one requirement. -/
def positiveMembershipIndexImplicationClauses (center : Label)
    (candidateIndices : List Nat)
    (definition : PositiveMembershipDefinition) : List (List Int) :=
  candidateIndices.map fun candidateIndex =>
    positiveMembershipIndexImplicationClause center candidateIndex definition

/-- One clause blocks simultaneous realization of all listed requirements. -/
def positiveMembershipBlockingClause
    (definitions : List PositiveMembershipDefinition) : List Int :=
  definitions.map fun definition => -(Int.ofNat definition.varIndex)

/-- The source valuation satisfies a compiler implication from an exact
candidate row to a contained partial requirement at the same center. -/
theorem positiveMembershipImplicationClause_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool) (cutoff : Nat)
    (requirementAt : Nat → RowChoice Label)
    (candidate : RowChoice Label)
    (definition : PositiveMembershipDefinition)
    (hencodable : FrozenSafeCandidateAt candidate.center candidate.support)
    (hcenter : definition.requirement.center = candidate.center)
    (hsupport : definition.requirement.support ⊆ candidate.support)
    (hselectedLow :
      SafeCoverCnf.xVar candidate.center.val
        (encodedChoiceIndex candidate) ≤ cutoff)
    (hbase : base
      (SafeCoverCnf.xVar candidate.center.val
        (encodedChoiceIndex candidate)) =
        SafeCoverCnf.finalAssign (coverIndex row)
          (SafeCoverCnf.xVar candidate.center.val
            (encodedChoiceIndex candidate)))
    (hfresh : cutoff < definition.varIndex)
    (hbinding : requirementAt definition.varIndex = definition.requirement) :
    evalClauseD
        (positiveMembershipAssign base cutoff row requirementAt)
        (positiveMembershipImplicationClause candidate definition) = true := by
  let selectedVariable :=
    SafeCoverCnf.xVar candidate.center.val (encodedChoiceIndex candidate)
  have hpositiveVariable : 0 < definition.varIndex := by omega
  simp only [positiveMembershipImplicationClause, evalClauseD,
    List.any_cons, List.any_nil, Bool.or_false]
  rw [learnedLiteral, evalLitD_negNat,
    evalLitD_pos _ hpositiveVariable,
    positiveMembershipAssign_of_le _ _ _ _ hselectedLow,
    positiveMembershipAssign_of_lt _ _ _ _ hfresh,
    hbase, hbinding]
  by_cases hselected :
      SafeCoverCnf.finalAssign (coverIndex row) selectedVariable = true
  · have hselectedByCoverIndex :
        RowChoiceSelectedByCoverIndex row candidate :=
      rowChoiceSelectedByCoverIndex_of_finalAssign_true hrow candidate
        hencodable hselected
    have hcandidatePositive : candidate.support ⊆ row candidate.center := by
      have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow
        (choices := [candidate]) (by
          intro choice hchoice
          simp only [List.mem_singleton] at hchoice
          subst choice
          exact hselectedByCoverIndex)
      exact hpositive candidate (by simp)
    have hrequirementPositive :
        definition.requirement.support ⊆
          row definition.requirement.center := by
      rw [hcenter]
      exact hsupport.trans hcandidatePositive
    simp [hrequirementPositive]
  · have hselectedFalse :
        SafeCoverCnf.finalAssign (coverIndex row) selectedVariable = false :=
      Bool.eq_false_of_not_eq_true hselected
    have hselectedFalse' :
        SafeCoverCnf.finalAssign (coverIndex row)
          (SafeCoverCnf.xVar candidate.center.val
            (encodedChoiceIndex candidate)) = false := by
      simpa [selectedVariable] using hselectedFalse
    simp [hselectedFalse']

/-- Indexed compiler implications have the same source semantics without
reconstructing the candidate support as a `Finset`.  The finite adapter only
has to check that every required point occurs in the recorded candidate mask. -/
theorem positiveMembershipIndexImplicationClause_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool) (cutoff : Nat)
    (requirementAt : Nat → RowChoice Label)
    (center : Label) (candidateIndex : Nat)
    (definition : PositiveMembershipDefinition)
    (hindex : candidateIndex < SafeCoverCnf.candCount center.val)
    (hcenter : definition.requirement.center = center)
    (hmask : ∀ a ∈ definition.requirement.support,
      ((SafeCoverCnf.candMasks center.val).getD candidateIndex 0).testBit
        a.val = true)
    (hselectedLow : SafeCoverCnf.xVar center.val candidateIndex ≤ cutoff)
    (hbase : base (SafeCoverCnf.xVar center.val candidateIndex) =
      SafeCoverCnf.finalAssign (coverIndex row)
        (SafeCoverCnf.xVar center.val candidateIndex))
    (hfresh : cutoff < definition.varIndex)
    (hbinding : requirementAt definition.varIndex = definition.requirement) :
    evalClauseD
        (positiveMembershipAssign base cutoff row requirementAt)
        (positiveMembershipIndexImplicationClause center candidateIndex
          definition) = true := by
  have hpositiveVariable : 0 < definition.varIndex := by omega
  simp only [positiveMembershipIndexImplicationClause, evalClauseD,
    List.any_cons, List.any_nil, Bool.or_false]
  rw [evalLitD_negNat, evalLitD_pos _ hpositiveVariable,
    positiveMembershipAssign_of_le _ _ _ _ hselectedLow,
    positiveMembershipAssign_of_lt _ _ _ _ hfresh,
    hbase, hbinding]
  by_cases hselected : SafeCoverCnf.finalAssign (coverIndex row)
      (SafeCoverCnf.xVar center.val candidateIndex) = true
  · have hsourceIndex : ∀ p, p < 12 →
        coverIndex row p < SafeCoverCnf.candCount p := by
      intro p hp
      exact coverIndex_lt_of_safeCubeOK hrow hp
    have hbaseTrue : SafeCoverCnf.baseAssign (coverIndex row)
        (SafeCoverCnf.xVar center.val candidateIndex) = true := by
      rw [← SafeCoverCnf.finalAssign_x (coverIndex row) center.isLt hindex]
      exact hselected
    have hindexEq : candidateIndex = coverIndex row center.val :=
      (SafeCoverCnf.baseAssign_iff (coverIndex row) hsourceIndex center.isLt
        hindex).mp hbaseTrue
    have hrequirementPositive : definition.requirement.support ⊆
        row definition.requirement.center := by
      intro a ha
      have hrowBit := coverIndex_testBit_of_safeCubeOK hrow center a
      rw [← hindexEq] at hrowBit
      have hmember : decide (a ∈ row center) = true := by
        rw [← hrowBit]
        exact hmask a ha
      rw [hcenter]
      exact of_decide_eq_true hmember
    simp [hrequirementPositive]
  · have hselectedFalse : SafeCoverCnf.finalAssign (coverIndex row)
        (SafeCoverCnf.xVar center.val candidateIndex) = false :=
      Bool.eq_false_of_not_eq_true hselected
    simp [hselectedFalse]

/-- List-level source satisfaction for one compiler definition. -/
theorem positiveMembershipIndexImplicationClauses_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool) (cutoff : Nat)
    (requirementAt : Nat → RowChoice Label)
    (center : Label) (candidateIndices : List Nat)
    (definition : PositiveMembershipDefinition)
    (hindex : ∀ candidateIndex ∈ candidateIndices,
      candidateIndex < SafeCoverCnf.candCount center.val)
    (hcenter : definition.requirement.center = center)
    (hmask : ∀ candidateIndex ∈ candidateIndices,
      ∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks center.val).getD candidateIndex 0).testBit
          a.val = true)
    (hselectedLow : ∀ candidateIndex ∈ candidateIndices,
      SafeCoverCnf.xVar center.val candidateIndex ≤ cutoff)
    (hbase : ∀ candidateIndex ∈ candidateIndices,
      base (SafeCoverCnf.xVar center.val candidateIndex) =
        SafeCoverCnf.finalAssign (coverIndex row)
          (SafeCoverCnf.xVar center.val candidateIndex))
    (hfresh : cutoff < definition.varIndex)
    (hbinding : requirementAt definition.varIndex = definition.requirement) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses center
        candidateIndices definition,
      evalClauseD (positiveMembershipAssign base cutoff row requirementAt)
        clause = true := by
  intro clause hclause
  obtain ⟨candidateIndex, hcandidateIndex, rfl⟩ := List.mem_map.mp hclause
  exact positiveMembershipIndexImplicationClause_sat hrow base cutoff
    requirementAt center candidateIndex definition
    (hindex candidateIndex hcandidateIndex) hcenter
    (hmask candidateIndex hcandidateIndex)
    (hselectedLow candidateIndex hcandidateIndex)
    (hbase candidateIndex hcandidateIndex) hfresh hbinding

/-- Falsifying the all-negative pattern clause means that all its partial row
requirements hold in the source pattern. -/
theorem positiveRowsMatch_of_positiveMembershipBlockingClause_false
    (base : Nat → Bool) (cutoff : Nat) (row : RowPattern Label)
    (requirementAt : Nat → RowChoice Label)
    (definitions : List PositiveMembershipDefinition)
    (hfresh : ∀ definition ∈ definitions, cutoff < definition.varIndex)
    (hbinding : ∀ definition ∈ definitions,
      requirementAt definition.varIndex = definition.requirement)
    (hfalse : evalClauseD
      (positiveMembershipAssign base cutoff row requirementAt)
      (positiveMembershipBlockingClause definitions) = false) :
    PositiveRowsMatch row (definitions.map (fun definition =>
      definition.requirement)) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause definitions,
      evalLitD (positiveMembershipAssign base cutoff row requirementAt)
        literal = false := by
    rw [evalClauseD, List.any_eq_false] at hfalse
    intro literal hliteral
    exact Bool.eq_false_of_not_eq_true (hfalse literal hliteral)
  intro requirement hrequirement
  obtain ⟨definition, hdefinition, rfl⟩ := List.mem_map.mp hrequirement
  have hliteral : -(Int.ofNat definition.varIndex) ∈
      positiveMembershipBlockingClause definitions :=
    List.mem_map_of_mem hdefinition
  have heval := hall (-(Int.ofNat definition.varIndex)) hliteral
  rw [evalLitD_negNat,
    positiveMembershipAssign_of_lt _ _ _ _ (hfresh definition hdefinition),
    hbinding definition hdefinition] at heval
  have htrue : decide (definition.requirement.support ⊆
      row definition.requirement.center) = true := by
    cases hvalue : decide (definition.requirement.support ⊆
        row definition.requirement.center) <;> simp [hvalue] at heval ⊢
  exact of_decide_eq_true htrue

end PositiveMembershipCnfBridge
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
