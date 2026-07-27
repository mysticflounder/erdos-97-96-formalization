import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailLargeOppositeCapsBiApexSurface
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Scratch check: one third source in the retained first-apex slice, with the
same actual blocker as the collision pair, is enough to violate the low-hit
bound. -/
theorem check_false_of_collision_third_source_in_first_slice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (P : RetainedInteriorBlockerCollision R)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2)
    {w : ℝ²} (hwA : w ∈ D.A)
    (hwne₁ : w ≠ P.source₁) (hwne₂ : w ≠ P.source₂)
    (hwBlocker :
      H.centerAt w hwA =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hwRadius : w ∈ SelectedClass D.A S.oppApex1 radius)
    (hwInterior : w ∈ S.capInteriorByIndex S.oppIndex1) :
    False := by
  have hwShell :
      w ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    have hsupports :
        (H.selectedAt w hwA).toCriticalFourShell.support =
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support := by
      calc
        (H.selectedAt w hwA).toCriticalFourShell.support =
            uniqueFourClass D.A (H.centerAt w hwA) :=
          (hcriticalShellUniqueFourCover w hwA).2.2.symm
        _ = uniqueFourClass D.A
              (H.centerAt P.source₁ P.source₁_mem_A) := by
          rw [hwBlocker]
        _ = (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support :=
          (hcriticalShellUniqueFourCover
            P.source₁ P.source₁_mem_A).2.2
    rw [← hsupports]
    exact
      (H.selectedAt w hwA).toCriticalFourShell.q_mem_support
  let I :=
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support ∩
      (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.capInteriorByIndex S.oppIndex1)
  have htripleSub : ({P.source₁, P.source₂, w} : Finset ℝ²) ⊆ I := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.q_mem_support,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₁_mem_radius,
              P.source₁_mem_capInterior⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_source₁_shell,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₂_mem_radius,
              P.source₂_mem_capInterior⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨hwShell,
          Finset.mem_inter.mpr
            ⟨by simpa using hwRadius, hwInterior⟩⟩
  have htripleCard : ({P.source₁, P.source₂, w} : Finset ℝ²).card = 3 := by
    have h₁w : P.source₁ ≠ w := hwne₁.symm
    have h₂w : P.source₂ ≠ w := hwne₂.symm
    simp [P.sources_ne, h₁w, h₂w]
  have hthree : 3 ≤ I.card := by
    rw [← htripleCard]
    exact Finset.card_le_card htripleSub
  have hrich :
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex S.oppIndex1) := by
    simpa using T.oppApex1_rich
  have htwo := hlow S.oppIndex1 P.source₁
    P.source₁_mem_A radius hrich
  exact by
    change I.card ≤ 2 at htwo
    omega

end ATailFrontierLiveClosure
end Problem97
