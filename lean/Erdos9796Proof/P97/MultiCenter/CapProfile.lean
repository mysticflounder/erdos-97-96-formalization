/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.MultiCenter.Realization
import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Multi-center census: cap-profile handoff

This module connects the existing U1 cap-profile facts to the finite
`JointProfile` vocabulary used by the multi-center census.  It does not assert
that every locally admissible joint class is globally realized; that completion
input remains separate in `Realization`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace MultiCenter

/-- A choice of coordinates for the census cap names `(S,O1,O2)` relative to
two distinct large caps in a concrete `CapTriple`.

`S` is the surplus cap, `O1` is the second large cap, and `O2` is the remaining
cap. -/
structure JointCapIndexFrame (surplus second : Fin 3) where
  rest : Fin 3
  rest_ne_surplus : rest ≠ surplus
  rest_ne_second : rest ≠ second

namespace JointCapIndexFrame

/-- Interpret a census cap name as the corresponding concrete cap index. -/
def toIndex {surplus second : Fin 3}
    (frame : JointCapIndexFrame surplus second) : JointCap -> Fin 3
  | .S => surplus
  | .O1 => second
  | .O2 => frame.rest

/-- For any two distinct cap indices, there is a remaining third index. -/
theorem nonempty_of_ne {surplus second : Fin 3} (hsecond : second ≠ surplus) :
    Nonempty (JointCapIndexFrame surplus second) := by
  fin_cases surplus <;> fin_cases second
  · exact False.elim (hsecond rfl)
  · exact ⟨⟨2, by decide⟩, by decide, by decide⟩
  · exact ⟨⟨1, by decide⟩, by decide, by decide⟩
  · exact ⟨⟨2, by decide⟩, by decide, by decide⟩
  · exact False.elim (hsecond rfl)
  · exact ⟨⟨0, by decide⟩, by decide, by decide⟩
  · exact ⟨⟨1, by decide⟩, by decide, by decide⟩
  · exact ⟨⟨0, by decide⟩, by decide, by decide⟩
  · exact False.elim (hsecond rfl)

end JointCapIndexFrame

private theorem jointProfile_eq {P Q : JointProfile}
    (h : ∀ cap, P.capSize cap = Q.capSize cap) : P = Q := by
  cases P with
  | mk capSizeP =>
    cases Q with
    | mk capSizeQ =>
      congr
      funext cap
      exact h cap

/-- The closed-cap `JointProfile` induced by a concrete cap triple and a census
cap frame.  The sizes include the two Moser endpoints of each cap, matching
`JointProfile.capSize`. -/
noncomputable def closedCapProfileOfFrame
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {surplus second : Fin 3}
    (frame : JointCapIndexFrame surplus second) : JointProfile where
  capSize := fun cap => (CP.capAt (frame.toIndex cap)).card

/-- The `(5,5,4)` closed-cap profile used by the card-11 two-large-cap branch. -/
def profile554 : JointProfile where
  capSize
    | .S => 5
    | .O1 => 5
    | .O2 => 4

/-- The `profile554` interior capacities are `(3,3,2)`. -/
theorem profile554_interiorCapacity_332 :
    profile554.interiorCapacity .S = 3 ∧
      profile554.interiorCapacity .O1 = 3 ∧
        profile554.interiorCapacity .O2 = 2 := by
  norm_num [profile554, JointProfile.interiorCapacity]

/-- The existing U1 card-11 cap theorem, translated to the multi-center
`JointProfile` cap names. -/
theorem closedCapProfileOfFrame_capSize_554_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : JointCapIndexFrame surplus second)
    (hsurplus : 4 < (CP.capAt surplus).card)
    (hsecond5 : 5 ≤ (CP.capAt second).card)
    (hcard11 : D.A.card = 11) :
    (closedCapProfileOfFrame CP frame).capSize .S = 5 ∧
      (closedCapProfileOfFrame CP frame).capSize .O1 = 5 ∧
        (closedCapProfileOfFrame CP frame).capSize .O2 = 4 := by
  have hprofile :=
    Problem97.U1LargeCapRouteBTailMetricResidualTarget.capProfile_eq_554_of_card_eq_eleven
      MT hCirc CP hM hsecond hsurplus hsecond5 hcard11
  rcases hprofile with ⟨hS, hO1, hO2⟩
  refine ⟨?_, ?_, ?_⟩
  · simpa [closedCapProfileOfFrame, JointCapIndexFrame.toIndex] using hS
  · simpa [closedCapProfileOfFrame, JointCapIndexFrame.toIndex] using hO1
  · simpa [closedCapProfileOfFrame, JointCapIndexFrame.toIndex] using
      hO2 frame.rest frame.rest_ne_surplus frame.rest_ne_second

/-- The existing U1 card-11 cap theorem yields exactly `profile554` in the
multi-center profile vocabulary. -/
theorem closedCapProfileOfFrame_eq_profile554_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : JointCapIndexFrame surplus second)
    (hsurplus : 4 < (CP.capAt surplus).card)
    (hsecond5 : 5 ≤ (CP.capAt second).card)
    (hcard11 : D.A.card = 11) :
    closedCapProfileOfFrame CP frame = profile554 := by
  rcases closedCapProfileOfFrame_capSize_554_of_card_eq_eleven
      MT hCirc CP hM hsecond frame hsurplus hsecond5 hcard11 with
    ⟨hS, hO1, hO2⟩
  apply jointProfile_eq
  intro cap
  cases cap <;> simp [profile554, hS, hO1, hO2]

/-- The card-11 two-large-cap handoff supplies the census interior capacities
`(3,3,2)`. -/
theorem closedCapProfileOfFrame_interiorCapacity_332_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : JointCapIndexFrame surplus second)
    (hsurplus : 4 < (CP.capAt surplus).card)
    (hsecond5 : 5 ≤ (CP.capAt second).card)
    (hcard11 : D.A.card = 11) :
    (closedCapProfileOfFrame CP frame).interiorCapacity .S = 3 ∧
      (closedCapProfileOfFrame CP frame).interiorCapacity .O1 = 3 ∧
        (closedCapProfileOfFrame CP frame).interiorCapacity .O2 = 2 := by
  rw [closedCapProfileOfFrame_eq_profile554_of_card_eq_eleven
    MT hCirc CP hM hsecond frame hsurplus hsecond5 hcard11]
  exact profile554_interiorCapacity_332

end MultiCenter
end Problem97
