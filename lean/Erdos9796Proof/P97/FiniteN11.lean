/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.FiniteN10
import Erdos9796Proof.P97.RemovableVertexAxiom.Continuation

/-!
# Finite n = 11 endpoint

`FiniteN11Closure` is the headline exact-eleven endpoint.  Its only active
mathematical obligation is the fixed-card exact-five common-obstruction-center
leaf in `ATail.FiniteN11Frontier`.

The `IsM44` arm uses the already-closed `(6,4,4)` removable-vertex route and
the exact-ten endpoint.  The no-`IsM44` arm uses the fixed-card A-tail frontier,
whose exact-four and distinct-center exact-five cases are already closed.
-/

open scoped EuclideanGeometry

namespace Problem97

open ATailFiniteN11Frontier

/-- Every strictly smaller convex carrier is already excluded when the
ambient carrier has cardinality eleven. -/
private theorem finiteN11_smaller_carrier_false
    {A : Finset ℝ²} (hcard : A.card = 11) :
    ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B →
      HasNEquidistantProperty 4 B → False := by
  intro B hlt hne hconv hK4
  by_cases hBcard : B.card = 10
  · exact FiniteN10Closure B hBcard hconv hK4
  · exact
      not_hasNEquidistantProperty_four_of_card_le_nine
        hne hconv (by omega) hK4

/-- The `n = 11` endpoint.  The theorem is deliberately wired now so that its
single transitive `sorry` is the card-eleven exact-five common-center leaf,
rather than either general exact-five production obligation. -/
theorem FiniteN11Closure : FiniteN11ClosureStatement := by
  intro A hcard hconv hK4
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  have hgt : 9 < A.card := by omega
  have hMin := finiteN11_smaller_carrier_false hcard
  by_cases hM44 : ∃ S : SurplusCapPacket A, S.IsM44
  · rcases hM44 with ⟨S, hS⟩
    rcases removableVertexOfLarge_of_isM44PinnedSurplus
        pinnedSurplusCOMPGBankBridge
        A hne hconv hK4 hgt hMin S hS with
      ⟨x, hx⟩
    rcases smaller_counterexample_of_removable hconv hx (by omega) with
      ⟨B, hBne, hBcard, hBconv, hBK4⟩
    exact hMin B hBcard hBne hBconv hBK4
  · obtain ⟨S⟩ := MEC.nonempty_surplusCapPacket_of_K4
      hne hconv hK4 hgt
    let D : CounterexampleData :=
      { A := A
        nonempty := hne
        convex := hconv
        K4 := hK4
        packet := S }
    have hDmin : D.Minimal := by
      intro B hBne hBconv hBK4
      by_contra hlt
      exact hMin B (by simpa [D] using not_le.mp hlt) hBne hBconv hBK4
    have hDNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44 := by
      simpa [D] using hM44
    have hDcard : D.A.card = 11 := by
      simpa [D] using hcard
    obtain ⟨H⟩ := D.exists_criticalShellSystem_of_minimal hDmin
    exact false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven
      D.packet hDmin hDNoM44 hDcard H

end Problem97
