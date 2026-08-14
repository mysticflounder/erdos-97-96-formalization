/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0052.CompactWindowedRupReplay.Compose
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalRupIngress

/-!
Kernel-checked terminal certificate for one finite next-row
named-deletion-arm cell of the 20260811-v2 direct wave: arm cell 52
(placement 8, joint deletion 10, v = 2, arm xu_q).  The
compact windowed pure-RUP replay under `Generated/Cell0052/` proves the
start formula unsatisfiable; this module transports that fact to
`DimacsUnsatisfiable` of the exact serialized clause list.  Certificate
preparation for one finite cell only: no aggregate coverage, universal
lift, terminal bank, or Lean-closure claim.
-/

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace NextRowArmTerminal

open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary
open TerminalBankConsumer

/-- Arm cell 52 terminal DIMACS unsatisfiability, obtained from the
compact windowed pure-RUP replay with no new native steps beyond the
window checks. -/
theorem cell0052_dimacsUnsatisfiable :
    DimacsUnsatisfiable
      (signedClausesOfFormula
        (formulaOfCompact
          (n := ExactTwelveRigid221NextRowArmCell0052Replay.n)
          ExactTwelveRigid221NextRowArmCell0052Replay.Checkpoint.C0000.text)) :=
  TerminalRupIngress.dimacsUnsatisfiable_of_formula rfl
    ExactTwelveRigid221NextRowArmCell0052Replay.startUnsatisfiable

end NextRowArmTerminal
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
