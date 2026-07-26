import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailMinimalUniqueFourCover

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support) :
    ¬ (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card ∧
        H.centerAt x hx ∉ S.capInteriorByIndex i) := by
  rintro ⟨i, x, hx, r, hrich, htwo, hcenterOutside⟩
  exact hcenterOutside
    (criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hx hrich (hcriticalShellUniqueFourCover x hx).2.1 htwo)

end Problem97.ATailFrontierLiveClosure
