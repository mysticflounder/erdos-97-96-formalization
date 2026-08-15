/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteCnfIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteSourceTheory

/-!
# Three-phase form of FreshThird cap contiguity

This module gives the source theorem for a compact finite encoding of cap
contiguity.  Along the strict carrier order, phase zero precedes phase one and
phase two follows it.  An orientation bit chooses whether phase one or its
complement is inside the cap.

The forward theorem needs only the guarded phase monotonicity recorded by the
witness.  The converse uses the existing relational source theory: if cap
membership is not order-convex, absence of four-point alternation forces its
complement to be order-convex.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal
namespace FreshThirdQFiberThreeCarrierFiniteAssignment

/-- Membership selected by an orientation bit and the middle of three phases.

This is Boolean exclusive-or: false orientation selects phase one, while true
orientation selects the two phases different from one. -/
def ThreePhaseCapMembership (orientation : Bool) (phase : Fin 3) : Prop :=
  (orientation = false ∧ phase = 1) ∨
    (orientation = true ∧ phase ≠ 1)

/-- A three-phase representation of the three cap-membership predicates. -/
structure ThreePhaseCapRepresentation
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment) where
  orientation : Fin 3 → Bool
  phase : Fin 3 → PointRole → Fin 3
  phase_eq_of_same : ∀ cap {left right}, A.Same left right →
    phase cap left = phase cap right
  phase_mono_of_before : ∀ cap {left right}, A.Before left right →
    phase cap left ≤ phase cap right
  inCap_iff_threePhaseCapMembership : ∀ cap point,
    A.InCap point cap ↔
      ThreePhaseCapMembership (orientation cap) (phase cap point)

/-- A three-phase cap representation excludes both parities of four-role
alternation along `Before`. -/
theorem noAlternatingCap_of_threePhaseCapRepresentation
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (W : A.ThreePhaseCapRepresentation) :
    A.NoAlternatingCap := by
  intro cap a b c d hab hbc hcd hAlt
  have hphaseAB := W.phase_mono_of_before cap hab
  have hphaseBC := W.phase_mono_of_before cap hbc
  have hphaseCD := W.phase_mono_of_before cap hcd
  rcases hAlt with hAlt | hAlt
  · rcases hAlt with ⟨ha, hb, hc, hd⟩
    rw [W.inCap_iff_threePhaseCapMembership] at ha hb hc hd
    cases hOrientation : W.orientation cap <;>
      simp [ThreePhaseCapMembership, hOrientation] at ha hb hc hd <;>
      omega
  · rcases hAlt with ⟨ha, hb, hc, hd⟩
    rw [W.inCap_iff_threePhaseCapMembership] at ha hb hc hd
    cases hOrientation : W.orientation cap <;>
      simp [ThreePhaseCapMembership, hOrientation] at ha hb hc hd <;>
      omega

private def BeforeConvex
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (property : PointRole → Prop) : Prop :=
  ∀ ⦃a b c : PointRole⦄,
    A.Before a b → A.Before b c →
      property a → property c → property b

private theorem capMembership_beforeConvex_or_complement
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (hNoAlternation : A.NoAlternatingCap) (cap : Fin 3) :
    BeforeConvex A (fun point ↦ A.InCap point cap) ∨
      BeforeConvex A (fun point ↦ ¬ A.InCap point cap) := by
  by_cases hConvex : BeforeConvex A (fun point ↦ A.InCap point cap)
  · exact Or.inl hConvex
  · right
    simp only [BeforeConvex] at hConvex ⊢
    push_neg at hConvex
    rcases hConvex with ⟨a, b, c, hab, hbc, ha, hc, hb⟩
    intro x y z hxy hyz hx hz
    by_contra hy
    rcases hRelational.before_or_same_or_after b y with hby | hsame | hyb
    · exact hNoAlternation cap a b y z hab hby hyz
        (Or.inl ⟨ha, hb, hy, hz⟩)
    · exact hb ((hRelational.inCap_congr hsame).mpr hy)
    · exact hNoAlternation cap x y b c hxy hyb hbc
        (Or.inr ⟨hx, hy, hb, hc⟩)

private noncomputable def capPhaseOrientation
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment) (cap : Fin 3) : Bool := by
  classical
  exact if BeforeConvex A (fun point ↦ A.InCap point cap) then false else true

private noncomputable def capPhaseMiddle
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (cap : Fin 3) (point : PointRole) : Prop := by
  classical
  exact if BeforeConvex A (fun role ↦ A.InCap role cap) then
    A.InCap point cap
  else
    ¬ A.InCap point cap

private noncomputable def capPhase
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (cap : Fin 3) (point : PointRole) : Fin 3 := by
  classical
  exact if capPhaseMiddle A cap point then
    1
  else if ∃ later, A.Before point later ∧ capPhaseMiddle A cap later then
    0
  else
    2

private theorem capPhase_eq_one_iff
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (cap : Fin 3) (point : PointRole) :
    capPhase A cap point = 1 ↔ capPhaseMiddle A cap point := by
  classical
  constructor
  · intro heq
    by_contra hm
    simp only [capPhase, if_neg hm] at heq
    split at heq <;> omega
  · intro hm
    simp [capPhase, hm]

private theorem capPhaseMiddle_congr
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (cap : Fin 3) {left right : PointRole} (hSame : A.Same left right) :
    capPhaseMiddle A cap left ↔ capPhaseMiddle A cap right := by
  classical
  by_cases hConvex : BeforeConvex A (fun point ↦ A.InCap point cap)
  · simpa [capPhaseMiddle, hConvex] using hRelational.inCap_congr hSame
  · simpa [capPhaseMiddle, hConvex] using not_congr (hRelational.inCap_congr hSame)

private theorem capPhase_eq_of_same
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (cap : Fin 3) {left right : PointRole} (hSame : A.Same left right) :
    capPhase A cap left = capPhase A cap right := by
  classical
  have hMiddle := capPhaseMiddle_congr hRelational cap hSame
  have hLater :
      (∃ later, A.Before left later ∧ capPhaseMiddle A cap later) ↔
        ∃ later, A.Before right later ∧ capPhaseMiddle A cap later := by
    constructor
    · rintro ⟨later, hBefore, hLaterMiddle⟩
      exact ⟨later,
        (hRelational.before_congr hSame (hRelational.same_refl later)).mp hBefore,
        hLaterMiddle⟩
    · rintro ⟨later, hBefore, hLaterMiddle⟩
      exact ⟨later,
        (hRelational.before_congr
          (hRelational.same_symm hSame) (hRelational.same_refl later)).mp hBefore,
        hLaterMiddle⟩
  simp only [capPhase]
  rw [if_congr hMiddle rfl rfl, if_congr hLater rfl rfl]

private theorem capPhaseMiddle_beforeConvex
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (hNoAlternation : A.NoAlternatingCap) (cap : Fin 3) :
    BeforeConvex A (capPhaseMiddle A cap) := by
  classical
  by_cases hConvex : BeforeConvex A (fun point ↦ A.InCap point cap)
  · have hMiddle :
        capPhaseMiddle A cap = fun point ↦ A.InCap point cap := by
      funext point
      simp [capPhaseMiddle, hConvex]
    rw [hMiddle]
    exact hConvex
  · have hComplement :=
      (capMembership_beforeConvex_or_complement hRelational hNoAlternation cap).resolve_left
        hConvex
    have hMiddle :
        capPhaseMiddle A cap = fun point ↦ ¬ A.InCap point cap := by
      funext point
      simp [capPhaseMiddle, hConvex]
    rw [hMiddle]
    exact hComplement

private theorem capPhase_mono_of_before
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (hNoAlternation : A.NoAlternatingCap)
    (cap : Fin 3) {left right : PointRole} (hBefore : A.Before left right) :
    capPhase A cap left ≤ capPhase A cap right := by
  classical
  have hConvex := capPhaseMiddle_beforeConvex hRelational hNoAlternation cap
  by_cases hLeft : capPhaseMiddle A cap left
  · by_cases hRight : capPhaseMiddle A cap right
    · simp [capPhase, hLeft, hRight]
    · have hNoLater :
          ¬ ∃ later, A.Before right later ∧ capPhaseMiddle A cap later := by
        rintro ⟨later, hRightLater, hLater⟩
        exact hRight (hConvex hBefore hRightLater hLeft hLater)
      simp [capPhase, hLeft, hRight, hNoLater]
  · by_cases hRight : capPhaseMiddle A cap right
    · have hLater :
          ∃ later, A.Before left later ∧ capPhaseMiddle A cap later :=
        ⟨right, hBefore, hRight⟩
      simp [capPhase, hLeft, hRight, hLater]
    · by_cases hRightLater :
          ∃ later, A.Before right later ∧ capPhaseMiddle A cap later
      · have hLeftLater :
            ∃ later, A.Before left later ∧ capPhaseMiddle A cap later := by
          rcases hRightLater with ⟨later, hBeforeLater, hLater⟩
          exact ⟨later, hRelational.before_trans hBefore hBeforeLater, hLater⟩
        simp [capPhase, hLeft, hRight, hLeftLater, hRightLater]
      · have hRightPhase : capPhase A cap right = 2 := by
          simp only [capPhase, if_neg hRight, if_neg hRightLater]
        rw [hRightPhase]
        exact Fin.le_last _

private theorem inCap_iff_selected_threePhaseCapMembership
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (cap : Fin 3) (point : PointRole) :
    A.InCap point cap ↔
      ThreePhaseCapMembership (capPhaseOrientation A cap) (capPhase A cap point) := by
  classical
  by_cases hConvex : BeforeConvex A (fun role ↦ A.InCap role cap)
  · simp [ThreePhaseCapMembership, capPhaseOrientation, hConvex,
      capPhase_eq_one_iff, capPhaseMiddle]
  · simp [ThreePhaseCapMembership, capPhaseOrientation, hConvex,
      capPhase_eq_one_iff, capPhaseMiddle]

/-- Construct a three-phase cap representation from cap non-alternation and
the strict total order modulo `Same` supplied by the relational source theory. -/
noncomputable def threePhaseCapRepresentation_of_noAlternatingCap
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A)
    (hNoAlternation : A.NoAlternatingCap) :
    A.ThreePhaseCapRepresentation where
  orientation := capPhaseOrientation A
  phase := capPhase A
  phase_eq_of_same := capPhase_eq_of_same hRelational
  phase_mono_of_before := capPhase_mono_of_before hRelational hNoAlternation
  inCap_iff_threePhaseCapMembership :=
    inCap_iff_selected_threePhaseCapMembership A

/-- Under the existing relational source theory, cap non-alternation is
equivalent to the existence of a three-phase cap representation. -/
theorem nonempty_threePhaseCapRepresentation_iff_noAlternatingCap
    {A : FreshThirdQFiberThreeCarrierFiniteAssignment}
    (hRelational : FreshThirdQFiberThreeCarrierFiniteView.RelationalTheory A) :
    Nonempty A.ThreePhaseCapRepresentation ↔ A.NoAlternatingCap := by
  constructor
  · rintro ⟨W⟩
    exact noAlternatingCap_of_threePhaseCapRepresentation W
  · intro hNoAlternation
    exact ⟨threePhaseCapRepresentation_of_noAlternatingCap
      hRelational hNoAlternation⟩

end FreshThirdQFiberThreeCarrierFiniteAssignment
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
