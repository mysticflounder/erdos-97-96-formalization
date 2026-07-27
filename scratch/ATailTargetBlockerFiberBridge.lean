import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.SurvivalCover

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTargetBlockerFiberBridge

open ATailApexRichClassStructure
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

/-- The carrier-point image of one actual-blocker fiber. -/
noncomputable def actualBlockerPointFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) : Finset ℝ² :=
  (actualBlockerFiber H anchor).image Subtype.val

/-- A three-source actual-blocker fiber localized to one rich apex radius and
strict cap is exactly the missing producer for the live three-hit conclusion. -/
theorem exists_three_hit_of_localized_actualBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hlocalized :
      ∃ i : Fin 3,
        ∃ anchor : CriticalShellSystem.CarrierVertex D.A,
          ∃ radius : ℝ,
            ApexRichClassStructure D.A
                (S.oppositeVertexByIndex i) ∧
              3 ≤
                (actualBlockerPointFiber H anchor ∩
                  (SelectedClass D.A
                      (S.oppositeVertexByIndex i) radius ∩
                    S.capInteriorByIndex i)).card) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ radius : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) radius ∩
              S.capInteriorByIndex i)).card := by
  classical
  rcases hlocalized with ⟨i, anchor, radius, hrich, hthree⟩
  refine ⟨i, anchor.1, anchor.2, radius, hrich, ?_⟩
  apply le_trans hthree
  apply Finset.card_le_card
  intro z hz
  rcases Finset.mem_inter.mp hz with ⟨hzFiber, hzClass⟩
  rcases Finset.mem_image.mp hzFiber with ⟨source, hsourceFiber, rfl⟩
  have hblockerVertex :
      H.blockerVertex source = H.blockerVertex anchor :=
    (Finset.mem_filter.mp hsourceFiber).2
  have hcenters :
      H.centerAt source.1 source.2 =
        H.centerAt anchor.1 anchor.2 :=
    congrArg Subtype.val hblockerVertex
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq H source.2 anchor.2 hcenters
  exact Finset.mem_inter.mpr
    ⟨by
      rw [← hsupports]
      exact
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support,
      hzClass⟩

end ATailTargetBlockerFiberBridge
end Problem97
