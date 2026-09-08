import Definitions.Def_Erdos9796Mission
import Theorems.Thm_Erdos9796Mission_counterexample_card_ge_nine
import Theorems.Thm_Erdos9796Mission_finite_nine_exclusion
import Theorems.Thm_Erdos9796Mission_minimal_counterexample_removable

open Erdos9796Mission
open Finset

namespace Erdos9796MissionProblem97Reduction

/-- Convex independence in the mission vocabulary is inherited by a subset obtained by
erasing one point. -/
lemma convexIndep_erase {A : Finset Plane} (hconv : ConvexIndep (A : Set Plane))
    (x : Plane) : ConvexIndep (A.erase x : Set Plane) := by
  intro a ha hm
  exact hconv a (erase_subset x A ha)
    (convexHull_mono (Set.sdiff_subset_sdiff_left (coe_subset.mpr (erase_subset x A))) hm)

end Erdos9796MissionProblem97Reduction

/-- The three published milestones close Problem 97 by strong induction on the size of a
putative counterexample. The counting obstruction leaves the base case `|A| = 9` and the
strictly larger case. The finite theorem rules out the base case. In the larger case,
minimality says that every smaller counterexample is impossible, while the removable-point
theorem produces exactly such a smaller counterexample. -/
theorem solution : Erdos9796Mission.Problem97 := by
  classical
  suffices h : ∀ n : ℕ, ∀ A : Finset Plane,
      A.card = n → A.Nonempty → ConvexIndep (A : Set Plane) →
        HasNEquidistantProperty 4 A → False by
    intro A hne hconv hbad
    exact h A.card A rfl hne hconv hbad
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro A hcard hne hconv hbad
    have hge : 9 ≤ A.card :=
      counterexample_card_ge_nine A hne hconv hbad
    rcases hge.lt_or_eq with hgt | heq
    · have hminimal : ∀ B : Finset Plane, B.card < A.card → B.Nonempty →
          ConvexIndep (B : Set Plane) → HasNEquidistantProperty 4 B → False := by
        intro B hBlt hBne hBconv hBbad
        have hBn : B.card < n := hcard ▸ hBlt
        exact ih B.card hBn B rfl hBne hBconv hBbad
      obtain ⟨x, hx, herase⟩ :=
        minimal_counterexample_removable A hne hconv hbad hgt hminimal
      have hcardErase : (A.erase x).card < A.card :=
        card_lt_card (erase_ssubset hx)
      have hneErase : (A.erase x).Nonempty := by
        rw [Finset.nonempty_iff_ne_empty]
        intro hempty
        have hzero : (A.erase x).card = 0 := by simp [hempty]
        rw [card_erase_of_mem hx] at hzero
        omega
      exact hminimal (A.erase x) hcardErase hneErase
        (Erdos9796MissionProblem97Reduction.convexIndep_erase hconv x) herase
    · exact finite_nine_exclusion A heq.symm hconv hbad
