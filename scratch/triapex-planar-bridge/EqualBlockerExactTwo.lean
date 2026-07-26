import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
Scratch characterization of the exact-two information carried by the
equal-blocker branch of the live low-hit residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosureScratch

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The equal-blocker packet saturates the live low-hit bound.  The common
unique four-class and both canonical shells coincide; their entire first cap,
and in particular their retained selected-class strict-cap slice, consists
exactly of the two collision sources. -/
theorem retainedCollision_commonUniqueClass_exactTwo
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support) :
    let commonClass :=
      uniqueFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A)
    let retainedSlice :=
      SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.capInteriorByIndex S.oppIndex1
    commonClass =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      commonClass =
        (H.selectedAt P.source₂
          P.source₂_mem_A).toCriticalFourShell.support ∧
      commonClass ∩ S.capByIndex S.oppIndex1 =
        {P.source₁, P.source₂} ∧
      commonClass ∩ retainedSlice = {P.source₁, P.source₂} ∧
      (commonClass ∩ retainedSlice).card = 2 ∧
      P.source₁ ∈
        (H.selectedAt P.source₂
          P.source₂_mem_A).toCriticalFourShell.support ∧
      P.source₂ ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capInteriorByIndex S.oppIndex1 := by
  dsimp only
  have hclass₁ :
      uniqueFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A) =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).2.2
  have hclass₂ :
      uniqueFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A) =
        (H.selectedAt P.source₂
          P.source₂_mem_A).toCriticalFourShell.support :=
    hclass₁.trans P.supports_eq
  have hpairSubset :
      ({P.source₁, P.source₂} : Finset ℝ²) ⊆
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.capInteriorByIndex S.oppIndex1) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hz₁ | hz₂
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.q_mem_support,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₁_mem_radius,
              P.source₁_mem_capInterior⟩⟩
    · subst z
      exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_source₁_shell,
          Finset.mem_inter.mpr
            ⟨by simpa using P.source₂_mem_radius,
              P.source₂_mem_capInterior⟩⟩
  have hsliceSubsetPair :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.capInteriorByIndex S.oppIndex1) ⊆
        {P.source₁, P.source₂} := by
    intro z hz
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hz).1,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp (Finset.mem_inter.mp hz).2).2⟩
  have hslice :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1) =
        {P.source₁, P.source₂} :=
    Finset.Subset.antisymm hsliceSubsetPair hpairSubset
  have hcommonCap :
      uniqueFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A) ∩
          S.capByIndex S.oppIndex1 =
        {P.source₁, P.source₂} := by
    rw [hclass₁]
    exact P.shell_inter_cap_eq_sources
  have hcommonSlice :
      uniqueFourClass D.A (H.centerAt P.source₁ P.source₁_mem_A) ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.capInteriorByIndex S.oppIndex1) =
        {P.source₁, P.source₂} := by
    rw [hclass₁]
    exact hslice
  have hcommonSliceCard :
      (uniqueFourClass D.A
          (H.centerAt P.source₁ P.source₁_mem_A) ∩
        (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1)).card = 2 := by
    rw [hcommonSlice]
    simp [P.sources_ne]
  have hsource₁InSecond :
      P.source₁ ∈
        (H.selectedAt P.source₂
          P.source₂_mem_A).toCriticalFourShell.support := by
    rw [← P.supports_eq]
    exact (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.q_mem_support
  exact ⟨hclass₁, hclass₂, hcommonCap, hcommonSlice, hcommonSliceCard,
    hsource₁InSecond, P.source₂_mem_source₁_shell,
    P.blocker_mem_capInterior⟩

end ATailFrontierLiveClosureScratch
end Problem97
