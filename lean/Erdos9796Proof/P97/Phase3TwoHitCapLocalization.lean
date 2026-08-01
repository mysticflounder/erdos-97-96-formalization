/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Phase-3 two-hit cap-localization adapter

This file records the exact geometric bridge needed to justify the Phase-3
Boolean clause

`f[a,i] ∧ f[b,i] ∧ s[i,a] ∧ s[i,b] ∧ s[c,a] ∧ s[c,b] → f[c,i]`.

The theorem deliberately assumes both directions of the interpretation of
`f`: antecedent literals must be sound for strict-cap membership, and the
conclusion requires strict-cap membership to be complete for `f`.  Thus this
adapter does not by itself certify that a Python Phase-3 annotation has those
semantics.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Phase3TwoHitCapLocalization

/-- A faithful exact-ten interpretation of the Phase-3 support and cap
relations satisfies the two-hit cap-localization clause.

The side conditions `a ≠ b` and `c ≠ apexLabel i` are the two nondegeneracy
conditions used by the geometric localization theorem.  In the production
Phase-3 enumeration, `a` and `b` range over non-Moser labels, while `c` ranges
over every row center.  If `c` is another Moser label, the conclusion is
definitionally false because Phase 3 allocates no `f` literal there, so the
clause rejects that assignment.  The exact label/cap correspondence and these
side conditions still have to be supplied by the production bridge. -/
theorem clause_of_faithful_exactTen_interpretation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (label : Fin 10 ≃ ↥D.A)
    (rowAt : (p : Fin 10) → SelectedFourClass D.A (label p : ℝ²))
    (apexLabel : Fin 3 → Fin 10)
    (s : Fin 10 → Fin 10 → Prop)
    (f : Fin 10 → Fin 3 → Prop)
    (hapex :
      ∀ i, (label (apexLabel i) : ℝ²) = S.oppositeVertexByIndex i)
    (hsound :
      ∀ {p q}, s p q → (label q : ℝ²) ∈ (rowAt p).support)
    (hfsound :
      ∀ {x i}, f x i → (label x : ℝ²) ∈ S.capInteriorByIndex i)
    (hfcomplete :
      ∀ {x i}, (label x : ℝ²) ∈ S.capInteriorByIndex i → f x i)
    {a b c : Fin 10} {i : Fin 3}
    (hab : a ≠ b)
    (hc : c ≠ apexLabel i)
    (hfa : f a i)
    (hfb : f b i)
    (hia : s (apexLabel i) a)
    (hib : s (apexLabel i) b)
    (hca : s c a)
    (hcb : s c b) :
    f c i := by
  have habPoints : (label a : ℝ²) ≠ (label b : ℝ²) := by
    intro h
    apply hab
    exact label.injective (Subtype.ext h)
  have hcPoint :
      (label c : ℝ²) ≠ S.oppositeVertexByIndex i := by
    intro h
    apply hc
    apply label.injective
    apply Subtype.ext
    exact h.trans (hapex i).symm
  have hcenterEq :
      dist (label c : ℝ²) (label a : ℝ²) =
        dist (label c : ℝ²) (label b : ℝ²) :=
    ((rowAt c).support_eq_radius _ (hsound hca)).trans
      ((rowAt c).support_eq_radius _ (hsound hcb)).symm
  have hapexEq :
      dist (label (apexLabel i) : ℝ²) (label a : ℝ²) =
        dist (label (apexLabel i) : ℝ²) (label b : ℝ²) :=
    ((rowAt (apexLabel i)).support_eq_radius _ (hsound hia)).trans
      ((rowAt (apexLabel i)).support_eq_radius _ (hsound hib)).symm
  have hphysicalEq :
      dist (S.oppositeVertexByIndex i) (label a : ℝ²) =
        dist (S.oppositeVertexByIndex i) (label b : ℝ²) := by
    rw [← hapex i]
    exact hapexEq
  apply hfcomplete
  exact
    ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex
      i (label c).property hcPoint (hfsound hfa) (hfsound hfb) habPoints
      hcenterEq hphysicalEq

end Phase3TwoHitCapLocalization
end Problem97
