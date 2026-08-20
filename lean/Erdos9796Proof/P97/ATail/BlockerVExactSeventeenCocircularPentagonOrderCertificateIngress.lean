/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderPromotion
import Std.Sat.CNF.Relabel
import Std.Tactic.BVDecide

/-!
# Certificate ingress for the exact-seventeen cocircular-pentagon order child

The terminal LRAT checker consumes zero-based natural-number variables.  This
module fixes that representation boundary before any solver result is known:
the checked formula is exactly the Lean-owned typed child relabelled by the
same numbering used by the DIMACS exporter.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderCertificateIngress

open Std.Sat
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCocircularPentagonOrderPromotion

/-- Zero-based variable index consumed by Lean's reflective LRAT checker. -/
def certificateVar (atom : Atom) : Nat := atomVar atom - 1

/-- The exact checked child in the representation consumed by
`Reflect.verifyCert_correct`. -/
def certificateCnf : CNF Nat :=
  CNF.relabel certificateVar extendedCocircularPentagonOrderCnf

/-- The fixed DIMACS numbering is collision-free. -/
theorem certificateVar_injective : Function.Injective certificateVar := by
  native_decide

/-- A replayed certificate for the relabelled child establishes the typed
unsatisfiability required by the source-facing landing contract. -/
theorem extendedCocircularPentagonOrderCnf_unsat_of_certificateCnf_unsat
    (hcertificate : certificateCnf.Unsat) :
    ¬ ∃ assignment,
      CNF.eval assignment extendedCocircularPentagonOrderCnf = true := by
  have htyped : extendedCocircularPentagonOrderCnf.Unsat :=
    (CNF.unsat_relabel_iff (f := extendedCocircularPentagonOrderCnf)
      (r := certificateVar) (fun _ _ heq => certificateVar_injective heq)).mp
      hcertificate
  rintro ⟨assignment, hassignment⟩
  have hfalse := htyped assignment
  simp [hassignment] at hfalse

#print axioms certificateVar_injective
#print axioms extendedCocircularPentagonOrderCnf_unsat_of_certificateCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderCertificateIngress
end Problem97
