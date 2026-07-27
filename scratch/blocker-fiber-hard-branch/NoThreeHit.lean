import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Blocker-fiber hard-branch audit

The live theorem's first conclusion arm is incompatible with the imported
rich-apex two-circle bound.  Thus that theorem can close only by proving one
of its four collision-row cross-hits.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailMinimalUniqueFourCover

/-- The target's canonical unique-four cover hypothesis is already supplied
pointwise by every critical-shell system. -/
theorem criticalShell_uniqueFourCover_is_automatic
    {D : CounterexampleData} (H : CriticalShellSystem D.A) :
    ∀ x : ℝ², ∀ hx : x ∈ D.A,
      H.centerAt x hx ≠ x ∧
        IsUniqueFourCenter D.A (H.centerAt x hx) ∧
        uniqueFourClass D.A (H.centerAt x hx) =
          (H.selectedAt x hx).toCriticalFourShell.support := by
  intro x hx
  exact ⟨centerAt_ne_source H x hx,
    isUniqueFourCenter_centerAt H x hx,
    uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩

/-- A rich opposite apex rules out the three-hit arm appearing in the live
closure target. -/
theorem not_exists_rich_three_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} :
    ¬ (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) := by
  rintro ⟨i, x, hx, r, hrich, hthree⟩
  have htwo :=
    criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  omega

/-- Adjoining an arbitrary cross-hit proposition to the impossible three-hit
arm changes nothing. -/
theorem rich_three_hit_or_iff {C : Prop}
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} :
    ((∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) ∨ C) ↔ C := by
  constructor
  · rintro (hthree | hC)
    · exact False.elim (not_exists_rich_three_hit hthree)
    · exact hC
  · exact Or.inr

end ATailFrontierLiveClosure
end Problem97
