/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.FullRadiusSemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Compose
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Exact-eleven G3 compact-replay semantic boundary

The generated replay proves that its exact parsed checkpoint-0 formula is
unsatisfiable.  This module exposes the one remaining certificate-generic
consumer: any signed-DIMACS valuation satisfying every parsed start clause
produces a contradiction.

The geometric clause-family proof and the authenticated retained-core ledger
belong downstream.  In particular, this theorem does not silently identify an
external CNF with the parsed compact payload.
-/

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

/-- Any source valuation satisfying every signed clause of the exact parsed G3
checkpoint-0 formula contradicts the Lean-checked native-decision replay
(trusting `Lean.ofReduceBool` and `Lean.trustCompiler`). -/
theorem false_of_g3Checkpoint0_signedClauses_sat (v : Nat → Prop)
    (h : ∀ clause ∈ signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text),
      clauseSat v clause) : False := by
  apply ExactFiveCommonShellV7G3Replay.startUnsatisfiable (checkerAssignment v)
  exact entails_formula_of_signedClauses_sat v _ h

/-- Boolean DIMACS satisfaction of every parsed G3 checkpoint-0 clause is
already enough to invoke the Lean-checked native-decision compact replay
(trusting `Lean.ofReduceBool` and `Lean.trustCompiler`).  Downstream family
soundness therefore targets `evalClauseD` directly. -/
theorem false_of_g3Checkpoint0_evalClauseD_sat (σ : Nat → Bool)
    (h : ∀ clause ∈
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text).toList,
      Census554.CoverCnf.evalClauseD σ
        (signedClauseOfDefault clause) = true) : False := by
  apply ExactFiveCommonShellV7G3Replay.startUnsatisfiable
    (checkerAssignment (fun v => σ v = true))
  exact entails_formula_of_evalClauseD_sat σ _ h

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.false_of_g3Checkpoint0_signedClauses_sat
#print axioms Problem97.ExactFiveCommonShellV7.false_of_g3Checkpoint0_evalClauseD_sat
