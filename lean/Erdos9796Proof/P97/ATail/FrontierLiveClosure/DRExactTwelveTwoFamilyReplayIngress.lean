/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveTwoFamilyUnsat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Compose

/-!
# Two-family CNF unsatisfiability from the generated compact RUP replay

The generated package `Generated/DRExactTwelveTwoFamilyReplay` replays a
pure-RUP LRAT of the two-family CNF (`piqd` job `7b1acbc4…`, profile plain,
`--plain` proof replay, drat-trim `s VERIFIED` with 0 RAT lemmas) in bounded
windows and exposes `startUnsatisfiable` for its checkpoint-0 formula.  This
module identifies that formula's signed clauses with
`DRExactTwelveDimacs.clauses` and discharges `ClausesUnsatisfiable`.

The clause identity is decided by `native_decide` under the repository's
audited generated-certificate policy: both sides are closed computable lists
(254,412 clauses); the kernel route through `dedupClauses` is not used here.
-/

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveTwoFamilyReplayIngress

open DRExactTwelveDimacs
open DRExactTwelveTwoFamilyUnsat
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
-- Generated-certificate policy: the identity compares two closed 254,412-clause
-- lists by `native_decide`; the default heartbeat budget is not meaningful here.
set_option linter.style.nativeDecide false in
/-- The parsed checkpoint-0 formula of the generated replay is, clause for clause,
the two-family CNF. -/
theorem checkpoint0_signedClauses_eq :
    signedClausesOfFormula
      (formulaOfCompact (n := DRExactTwelveTwoFamilyReplay.n)
        DRExactTwelveTwoFamilyReplay.Checkpoint.C0000.text) = clauses := by
  native_decide

/-- Unsatisfiability of the two-family CNF, from the windowed replay (approved
native trust boundary: `Lean.ofReduceBool`, `Lean.trustCompiler`). -/
theorem clausesUnsatisfiable : ClausesUnsatisfiable :=
  clausesUnsatisfiable_of_formula_eq DRExactTwelveTwoFamilyReplay.startUnsatisfiable
    checkpoint0_signedClauses_eq

end DRExactTwelveTwoFamilyReplayIngress
end ATailFrontierLiveClosure
end Problem97
