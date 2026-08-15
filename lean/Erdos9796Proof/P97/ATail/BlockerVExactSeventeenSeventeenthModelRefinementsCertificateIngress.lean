/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSeventeenthModelRefinements
import Std.Sat.CNF.Relabel
import Std.Tactic.BVDecide

/-!
# Certificate ingress for the eighteenth Lean-owned exact-seventeen child

This module fixes the representation boundary in advance of a terminal solver
result. The PIQD/LRAT formula is exactly the checked child CNF relabelled by the
same zero-based variable numbering used by `Reflect.verifyCert_correct`.
Consequently a replayed LRAT proof of `certificateCnf.Unsat` implies the typed
`Atom`-level unsatisfiability expected by the existing `SourceRealization`
landing contract; no separately re-encoded formula is admitted here.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSeventeenthModelRefinementsCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSeventeenthModelRefinements

/-- Zero-based variable index consumed by Lean's reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- The checked child in the representation consumed by `verifyCert_correct`. -/
def certificateCnf : CNF Nat :=
  CNF.relabel certificateVar extendedSeventeenthModelRefinementsCnf

/-- The fixed DIMACS numbering is collision-free. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  native_decide

/-- A replayed certificate for the relabelled child establishes the exact
typed unsatisfiability required by the source-facing landing contract. -/
theorem extendedSeventeenthModelRefinementsCnf_unsat_of_certificateCnf_unsat
    (hcertificate : certificateCnf.Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment extendedSeventeenthModelRefinementsCnf = true := by
  have htyped : extendedSeventeenthModelRefinementsCnf.Unsat :=
    (CNF.unsat_relabel_iff (f := extendedSeventeenthModelRefinementsCnf)
      (r := certificateVar) (fun _ _ heq => certificateVar_injective heq)).mp
      hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

/-- Direct source-facing landing contract for a replayed certificate of the
exact eighteenth child. -/
theorem false_of_sourceRealization_of_certificateCnf_unsat
    {A}
    (hsource : Nonempty (SourceRealization A))
    (hcertificate : certificateCnf.Unsat) : False :=
  false_of_sourceRealization_of_extendedSeventeenthModelRefinementsCnf_unsat
    hsource
    (extendedSeventeenthModelRefinementsCnf_unsat_of_certificateCnf_unsat hcertificate)

#print axioms certificateVar_injective
#print axioms extendedSeventeenthModelRefinementsCnf_unsat_of_certificateCnf_unsat
#print axioms false_of_sourceRealization_of_certificateCnf_unsat

end ATailBlockerVExactSeventeenSeventeenthModelRefinementsCertificateIngress
end Problem97
