/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelvePiqdSourceDuplicateCenter
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalRupIngress

/-!
# Conditional terminal ingress for one exact-twelve duplicate-center record

This module places the existing kernel-checked source record in a singleton
duplicate-center bank and connects that bank to the checked compact-terminal
consumer.

The endpoint remains conditional on the source cell premises and on exact
identification of a successfully replayed compact certificate with the complete
terminal formula. It does not authenticate external metadata or establish
aggregate coverage, a universal lift, or live-spine closure.
-/

open Std.Sat
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal
open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ExactTwelveSourceDuplicateCenterTerminalIngress

open CheckpointedRup.CompactIngress
open CheckpointedRup.SemanticBoundary
open Census554.EqualityCore
open GenericRowNogoodCertificate

/-- The singleton bank containing the recorded exact-twelve duplicate-center
obstruction. -/
def recordedDuplicateCenterBank : List (DuplicateCenterNogood (Fin 12)) :=
  [ExactTwelveSourceDuplicateCenter0000.sourceNogood]

/-- Every entry in the recorded singleton bank passes the closed validity
checker. -/
theorem recordedDuplicateCenterBank_valid :
    ∀ nogood ∈ recordedDuplicateCenterBank, nogood.check = true := by
  intro nogood hnogood
  simp only [recordedDuplicateCenterBank, List.mem_singleton] at hnogood
  subst nogood
  exact ExactTwelveSourceDuplicateCenter0000.sourceNogood_check

/-- Every row choice in the recorded singleton bank belongs to the frozen safe
candidate table. -/
theorem recordedDuplicateCenterBank_encodable :
    ∀ nogood ∈ recordedDuplicateCenterBank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  intro nogood hnogood choice hchoice
  simp only [recordedDuplicateCenterBank, List.mem_singleton] at hnogood
  subst nogood
  apply ExactTwelveV14DuplicateCenterCanary.record0_encodable choice
  rw [← ExactTwelveSourceDuplicateCenter0000.sourceNogood_eq_existingRecord0]
  exact hchoice

/-- A checked compact terminal certificate for the complete cell-plus-singleton
formula rules out a realizable exact-twelve row satisfying the cell premises.

The certificate texts and exact formula identity remain explicit hypotheses;
this theorem supplies neither terminal UNSAT data nor cell coverage. -/
theorem not_realizes_of_checkedCompactRecordedDuplicateCenterTerminal
    {row : RowPattern (Fin 12)} {blocker : Fin 5 → Fin 12}
    (cell : FrozenV14JobCoordinate)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Fin 12 × Fin 12).1 (cell.1.1 : Fin 12 × Fin 12).2
      cell.2.1 cell.2.2.1)
    {n : Nat} {startText actionText : String}
    {start : Array (Option (DefaultClause n))}
    (hstart : parseFormula (n := n) startText = some start)
    (hcheck : checkTerminalCompact (n := n) startText actionText = true)
    (hclauses : signedClausesOfFormula (DefaultFormula.ofArray start) =
      TerminalBankConsumer.terminalDimacs cell recordedDuplicateCenterBank) :
    ¬ ∃ pointOf : Fin 12 → ℝ², Realizes row pointOf :=
  TerminalRupIngress.not_realizes_of_checkedCompactTerminal cell hrow hadded
    recordedDuplicateCenterBank recordedDuplicateCenterBank_valid
    recordedDuplicateCenterBank_encodable hstart hcheck hclauses

end ExactTwelveSourceDuplicateCenterTerminalIngress
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
