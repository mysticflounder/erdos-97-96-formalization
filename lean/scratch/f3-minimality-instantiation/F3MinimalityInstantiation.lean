import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# F3 two-point global-minimality specialization

This scratch module records the exact checked output of specializing global
minimal deletion to the two off-cap points in a first-blocker fiber.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace F3MinimalityInstantiation

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletion
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATAILStageOneMinimalDeletionCore

/-- The exact specialization of global minimal deletion to the two off-cap
points in a first-blocker fiber.  In the shared-radius arm, the minimal
blocking subset must be the whole two-point set.  In the core arm, it is
either singleton or the whole two-point set. -/
theorem exists_outsidePair_sharedRadius_or_minimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    ∃ center ∈ D.A \ {Q.source.1, Q.otherOutsidePoint},
      ((¬ HasNEquidistantPointsAt 4
            (D.A \ {Q.source.1, Q.otherOutsidePoint}) center ∧
          dist center Q.source.1 = dist center Q.otherOutsidePoint) ∨
        ∃ V : Finset ℝ²,
          V.Nonempty ∧
          V ⊆ {Q.source.1, Q.otherOutsidePoint} ∧
          ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
          (V = {Q.source.1} ∨
            V = {Q.otherOutsidePoint} ∨
            V = {Q.source.1, Q.otherOutsidePoint}) ∧
          Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  let U : Finset ℝ² := {Q.source.1, Q.otherOutsidePoint}
  have hUsub : U ⊆ D.A := by
    intro x hx
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Q.source.2
    · exact Q.otherOutsidePoint_mem_A
  have hUne : U.Nonempty := by
    simp [U]
  have hremaining : (D.A \ U).Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hempty
    have hAsubU : D.A ⊆ U := by
      intro x hxA
      by_contra hxU
      have hxRemaining : x ∈ D.A \ U :=
        Finset.mem_sdiff.mpr ⟨hxA, hxU⟩
      rw [hempty] at hxRemaining
      simp at hxRemaining
    have hAU : D.A = U := Finset.Subset.antisymm hAsubU hUsub
    have hUcard : U.card = 2 := by
      have hsourceNe :
          Q.source.1 ≠ Q.otherOutsidePoint :=
        Q.otherOutsidePoint_ne_source.symm
      simp [U, hsourceNe]
    have hAcard : D.A.card = 2 := by
      rw [hAU, hUcard]
    have hlarge := R.carrier_card_gt_nine
    rw [hAcard] at hlarge
    omega
  rcases
      exists_fresh_sharedRadiusPair_or_minimalDeletionCore
        R.minimal hUsub hUne hremaining with
    ⟨center, hcenter, V, hVne, hVsub, hblocked, hbranch⟩
  refine ⟨center, by simpa [U] using hcenter, ?_⟩
  rcases hbranch with hpair | hcore
  · left
    rcases hpair with ⟨s, hsV, t, htV, hst, hdist⟩
    have hsU := hVsub hsV
    have htU := hVsub htV
    have hboth :
        Q.source.1 ∈ V ∧ Q.otherOutsidePoint ∈ V := by
      simp only [U, Finset.mem_insert, Finset.mem_singleton] at hsU htU
      rcases hsU with rfl | rfl <;> rcases htU with rfl | rfl
      · exact (hst rfl).elim
      · exact ⟨hsV, htV⟩
      · exact ⟨htV, hsV⟩
      · exact (hst rfl).elim
    have hVU : V = U := by
      apply Finset.Subset.antisymm hVsub
      intro x hx
      simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact hboth.1
      · exact hboth.2
    have hpairDist :
        dist center Q.source.1 =
          dist center Q.otherOutsidePoint := by
      simp only [U, Finset.mem_insert, Finset.mem_singleton] at hsU htU
      rcases hsU with rfl | rfl <;> rcases htU with rfl | rfl
      · exact (hst rfl).elim
      · exact hdist
      · exact hdist.symm
      · exact (hst rfl).elim
    constructor
    · simpa [U, hVU] using hblocked
    · exact hpairDist
  · right
    have hshape :
        V = {Q.source.1} ∨
          V = {Q.otherOutsidePoint} ∨
          V = {Q.source.1, Q.otherOutsidePoint} := by
      rcases hVne with ⟨x, hxV⟩
      have hxU := hVsub hxV
      simp only [U, Finset.mem_insert, Finset.mem_singleton] at hxU
      rcases hxU with rfl | rfl
      · by_cases hother : Q.otherOutsidePoint ∈ V
        · right
          right
          ext z
          simp only [Finset.mem_insert, Finset.mem_singleton]
          constructor
          · intro hzV
            have hzU := hVsub hzV
            simpa [U] using hzU
          · intro hz
            rcases hz with rfl | rfl
            · exact hxV
            · exact hother
        · left
          ext z
          simp only [Finset.mem_singleton]
          constructor
          · intro hzV
            have hzU := hVsub hzV
            simp only [U, Finset.mem_insert, Finset.mem_singleton] at hzU
            rcases hzU with hz | hz
            · exact hz
            · exact (hother (hz ▸ hzV)).elim
          · intro hz
            exact hz ▸ hxV
      · by_cases hsource : Q.source.1 ∈ V
        · right
          right
          ext z
          simp only [Finset.mem_insert, Finset.mem_singleton]
          constructor
          · intro hzV
            have hzU := hVsub hzV
            simpa [U] using hzU
          · intro hz
            rcases hz with rfl | rfl
            · exact hsource
            · exact hxV
        · right
          left
          ext z
          simp only [Finset.mem_singleton]
          constructor
          · intro hzV
            have hzU := hVsub hzV
            simp only [U, Finset.mem_insert, Finset.mem_singleton] at hzU
            rcases hzU with hz | hz
            · exact (hsource (hz ▸ hzV)).elim
            · exact hz
          · intro hz
            exact hz ▸ hxV
    exact
      ⟨V, hVne, by simpa [U] using hVsub, hblocked, hshape, hcore⟩

end F3MinimalityInstantiation
end Problem97
