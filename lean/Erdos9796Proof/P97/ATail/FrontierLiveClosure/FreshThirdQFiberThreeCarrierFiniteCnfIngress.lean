/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteQuery

/-!
# Clause ingress for FreshThird carrier cap contiguity

This module states the exact propositional clause supplied by cap contiguity on
four named carrier roles.  It is the source theorem used to replay one learned
cap-alternation clause; it is not a terminal unsatisfiability or closure result.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal
namespace FreshThirdQFiberThreeCarrierFiniteAssignment

/-- The seven-literal clause that excludes one parity of alternating membership
among four roles in increasing boundary order. -/
def CapAlternationClause
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (cap : Fin 3) (a b c d : PointRole) (firstInside : Bool) : Prop :=
  match firstInside with
  | true =>
      ¬ A.Before a b ∨ ¬ A.Before b c ∨ ¬ A.Before c d ∨
      ¬ A.InCap a cap ∨ A.InCap b cap ∨ ¬ A.InCap c cap ∨ A.InCap d cap
  | false =>
      ¬ A.Before a b ∨ ¬ A.Before b c ∨ ¬ A.Before c d ∨
      A.InCap a cap ∨ ¬ A.InCap b cap ∨ A.InCap c cap ∨ ¬ A.InCap d cap

/-- Cap contiguity entails the exact learned clause for either alternating
membership parity. -/
theorem capAlternationClause_of_noAlternatingCap
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hNoAlternation : A.NoAlternatingCap)
    (cap : Fin 3) (a b c d : PointRole) (firstInside : Bool) :
    A.CapAlternationClause cap a b c d firstInside := by
  classical
  cases firstInside with
  | false =>
      simp only [CapAlternationClause]
      by_contra hClause
      push_neg at hClause
      rcases hClause with ⟨hab, hbc, hcd, ha, hb, hc, hd⟩
      exact hNoAlternation cap a b c d hab hbc hcd (Or.inr ⟨ha, hb, hc, hd⟩)
  | true =>
      simp only [CapAlternationClause]
      by_contra hClause
      push_neg at hClause
      rcases hClause with ⟨hab, hbc, hcd, ha, hb, hc, hd⟩
      exact hNoAlternation cap a b c d hab hbc hcd (Or.inl ⟨ha, hb, hc, hd⟩)

end FreshThirdQFiberThreeCarrierFiniteAssignment
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
