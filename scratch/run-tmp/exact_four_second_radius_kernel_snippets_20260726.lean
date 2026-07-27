import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
Kernel-checkable scratch consequences of the exact-four, exact-two
second-radius collision residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSecondRadiusScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_carrier
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

theorem collisionShell_inter_secondRadius_strictCap_eq_empty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1) = ∅ := by
  ext z
  constructor
  · intro hz
    have hzParts := Finset.mem_inter.mp hz
    have hzInner := Finset.mem_inter.mp hzParts.2
    have hzShellCap :
        z ∈
          (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr
        ⟨hzParts.1,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzInner.2⟩
    rw [P.shell_inter_cap_eq_sources] at hzShellCap
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzShellCap
    have hzρ : dist S.oppApex1 z = ρ :=
      (mem_selectedClass.mp hzInner.1).2
    rcases hzShellCap with rfl | rfl
    · exact (hρne
        (hzρ.symm.trans
          (mem_selectedClass.mp P.source₁_mem_radius).2)).elim
    · exact (hρne
        (hzρ.symm.trans
          (mem_selectedClass.mp P.source₂_mem_radius).2)).elim
  · intro hz
    simp at hz

theorem collisionBlocker_ne_secondRadius_strictCap_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    H.centerAt P.source₁ P.source₁_mem_A ≠ H.centerAt z hzA := by
  have hzOutside :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzEmpty : z ∈ (∅ : Finset ℝ²) := by
      rw [← collisionShell_inter_secondRadius_strictCap_eq_empty P hρne]
      exact Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    simp at hzEmpty
  intro hblockers
  apply hzOutside
  have hsupportEq :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt z hzA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H z hzA,
      hblockers]
  rw [hsupportEq]
  exact (H.selectedAt z hzA).toCriticalFourShell.q_mem_support

theorem exists_secondRadius_localizedCollisionCommonDeletion_cycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    (z : ℝ²)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    ∃ L : LocalizedCollisionCommonDeletion P,
      L.fresh = z ∧
        Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hzρInterior).1).1
  have hzOutside :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzEmpty : z ∈ (∅ : Finset ℝ²) := by
      rw [← collisionShell_inter_secondRadius_strictCap_eq_empty P hρne]
      exact Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    simp at hzEmpty
  have hzNeSource₁ : z ≠ P.source₁ := by
    intro hz
    apply hzOutside
    rw [hz]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hzNeSource₂ : z ≠ P.source₂ := by
    intro hz
    apply hzOutside
    rw [hz]
    exact P.source₂_mem_source₁_shell
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hzOutside
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives z hzA
  have hblockerA :
      H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases nonempty_commonDeletionTwoCenterPacket H
      hzA (oppApex1_mem_carrier S) hblockerA
      (R.actualBlocker_ne_firstApex
        P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  let L : LocalizedCollisionCommonDeletion P := {
    fresh := z
    fresh_mem_capInterior := (Finset.mem_inter.mp hzρInterior).2
    fresh_ne_source₁ := hzNeSource₁
    fresh_ne_source₂ := hzNeSource₂
    fresh_not_mem_shell := hzOutside
    packet := packet }
  refine ⟨L, rfl, ?_⟩
  exact nonempty_localizedCollisionMutualOmissionCycle P L

end ATailSecondRadiusScratch
end Problem97
