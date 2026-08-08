/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverIndexBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Semantic reflection for exact-twelve learned selected-row clauses

This file supplies the source-facing half of learned-clause reflection.  If
every row choice named by a duplicate-center record is the candidate selected
by the canonical source index, then all of the record's positive incidences
hold in the source row pattern.  Together with the record's closed Boolean
checker, the existing duplicate-center consumer then rules out a realization.

This theorem does not establish that a learned SAT clause is falsified, that a
journal is terminal, or that a family of journals covers the normalized-v14
schedule.  Those remain finite-certificate obligations.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SafeCoverIndexBridge

open ExactTwelveCarrierIngress
open SafeCoverCnf
open Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- A recorded source row is the candidate selected by the canonical cover
index.  This is the semantic content of all literals in that record's learned
selected-row clause being true under the source assignment. -/
def RowChoiceSelectedByCoverIndex (row : RowPattern Label)
    (choice : RowChoice Label) : Prop :=
  (candMasks choice.center.val).getD
      (coverIndex row choice.center.val) 0 =
    classMask choice.support

/-- Total candidate index encoded by a recorded row choice.  Journal records
are required separately to prove that this index is in the candidate table. -/
def encodedChoiceIndex (choice : RowChoice Label) : Nat :=
  coverIndexAt choice.center choice.support

/-- The negative selected-row literal emitted for one recorded row choice. -/
def learnedLiteral (choice : RowChoice Label) : Int :=
  -(Int.ofNat (xVar choice.center.val (encodedChoiceIndex choice)))

/-- The selected-row blocking clause associated to a list of recorded rows. -/
def learnedClause (choices : List (RowChoice Label)) : List Int :=
  choices.map learnedLiteral

/-- Selected candidate rows supply every positive incidence recorded by the
learned duplicate-center certificate. -/
theorem positiveRowsMatch_of_selectedByCoverIndex
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    {choices : List (RowChoice Label)}
    (hselected : ∀ choice ∈ choices,
      RowChoiceSelectedByCoverIndex row choice) :
    PositiveRowsMatch row choices := by
  intro choice hchoice a ha
  have hbits := congrArg (fun mask : Nat => mask.testBit a.val)
    (hselected choice hchoice)
  change
    ((candMasks choice.center.val).getD
        (coverIndex row choice.center.val) 0).testBit a.val =
      (classMask choice.support).testBit a.val at hbits
  rw [coverIndex_testBit_of_safeCubeOK hrow choice.center a,
    classMask_testBit] at hbits
  have hmem : decide (a ∈ row choice.center) = true := by
    simpa [ha] using hbits
  exact of_decide_eq_true hmem

/-- Arbitrary checked duplicate-center bank entries reflect from selected
candidate masks to their positive source-row semantics. -/
theorem DuplicateCenterNogood.positivelyMatches_of_selectedByCoverIndex
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (nogood : DuplicateCenterNogood Label)
    (hselected : ∀ choice ∈ nogood.choices,
      RowChoiceSelectedByCoverIndex row choice) :
    nogood.PositivelyMatches row :=
  positiveRowsMatch_of_selectedByCoverIndex hrow hselected

/-- If the canonical full base assignment selects the encoded variable of a
recorded candidate row, then that row is selected by the source cover index. -/
theorem rowChoiceSelectedByCoverIndex_of_finalAssign_true
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (choice : RowChoice Label)
    (hencodable : FrozenSafeCandidateAt choice.center choice.support)
    (htrue : finalAssign (coverIndex row)
      (xVar choice.center.val (encodedChoiceIndex choice)) = true) :
    RowChoiceSelectedByCoverIndex row choice := by
  have hchoiceIndex : encodedChoiceIndex choice < candCount choice.center.val :=
    coverIndexAt_lt choice.center choice.support hencodable
  have hsourceIndex : ∀ p, p < 12 → coverIndex row p < candCount p := by
    intro p hp
    exact coverIndex_lt_of_safeCubeOK hrow hp
  have hbase : baseAssign (coverIndex row)
      (xVar choice.center.val (encodedChoiceIndex choice)) = true := by
    rw [← finalAssign_x (coverIndex row) choice.center.isLt hchoiceIndex]
    exact htrue
  have hindexEq : encodedChoiceIndex choice =
      coverIndex row choice.center.val :=
    (baseAssign_iff (coverIndex row) hsourceIndex choice.center.isLt
      hchoiceIndex).mp hbase
  unfold RowChoiceSelectedByCoverIndex
  rw [← getD_coverIndexAt choice.center choice.support hencodable]
  simpa [encodedChoiceIndex] using congrArg
    (fun i => (candMasks choice.center.val).getD i 0) hindexEq.symm

/-- Falsifying the learned negative clause means that every recorded candidate
variable is selected by the canonical full base assignment. -/
theorem selectedByCoverIndex_of_learnedClause_false
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    {choices : List (RowChoice Label)}
    (hencodable : ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hfalse : Census554.CoverCnf.evalClauseD
      (finalAssign (coverIndex row))
      (learnedClause choices) = false) :
    ∀ choice ∈ choices, RowChoiceSelectedByCoverIndex row choice := by
  have hall : ∀ literal ∈ learnedClause choices,
      Census554.CoverCnf.evalLitD
        (finalAssign (coverIndex row)) literal = false := by
    rw [Census554.CoverCnf.evalClauseD, List.any_eq_false] at hfalse
    intro literal hliteral
    exact Bool.eq_false_of_not_eq_true (hfalse literal hliteral)
  intro choice hchoice
  have hliteral : learnedLiteral choice ∈ learnedClause choices := by
    exact List.mem_map_of_mem (f := learnedLiteral) hchoice
  have heval := hall (learnedLiteral choice) hliteral
  rw [learnedLiteral, Census554.CoverCnf.evalLitD_negNat] at heval
  have htrue : finalAssign (coverIndex row)
      (xVar choice.center.val (encodedChoiceIndex choice)) = true := by
    simpa using heval
  exact rowChoiceSelectedByCoverIndex_of_finalAssign_true hrow choice
    (hencodable choice hchoice) htrue

/-- End-to-end semantic reflection for one learned duplicate-center clause:
if the source-safe canonical assignment falsifies its blocking clause, then the
record positively matches the source rows. -/
theorem DuplicateCenterNogood.positivelyMatches_of_learnedClause_false
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (nogood : DuplicateCenterNogood Label)
    (hencodable : ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hfalse : Census554.CoverCnf.evalClauseD
      (finalAssign (coverIndex row))
      (learnedClause nogood.choices) = false) :
    nogood.PositivelyMatches row :=
  positiveRowsMatch_of_selectedByCoverIndex hrow
    (selectedByCoverIndex_of_learnedClause_false hrow hencodable hfalse)

end SafeCoverIndexBridge
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
