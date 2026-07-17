/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexCriticalFiber
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Scratch: minimal deletion at a common critical fiber

This file applies global cardinal minimality to the two distinct sources in a
`FrontierCommonDeletionCriticalFiber`.  The result retains the full parent
residual and both prescribed deletion-critical facts.

The main audit result is negative.  The common blocker is already outside the
two sources.  Deleting either singleton source blocks K4 there, and restoring
it gives the ambient K4 witness.  Thus both the raw cardinal-minimal-deletion
packet and the stronger collision-or-minimal-core packet have a literal
singleton stutter which merely returns an existing critical shell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberMinimalDeletionScratch

open ATAILStageOneMinimalDeletionCore
open ATailFirstApexCriticalFiber
open ATailGlobalMinimalDeletion
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The exact output of global minimal deletion, indexed by the full parent
residual and its source-faithful common critical fiber. -/
structure CriticalFiberMinimalDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R)
    (deletionSet : Finset ℝ²) : Type where
  center : ℝ²
  center_mem_complement : center ∈ D.A \ deletionSet
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_deletionSet : deleted ⊆ deletionSet
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restoring_one_survives :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4
        (D.A \ (deleted.erase source)) center

/-- The stronger global-deletion output, retaining the collision/core split. -/
structure CriticalFiberDeletionCorePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R)
    (deletionSet : Finset ℝ²) : Type where
  center : ℝ²
  center_mem_complement : center ∈ D.A \ deletionSet
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_deletionSet : deleted ⊆ deletionSet
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  collision_or_core :
    (∃ first ∈ deleted, ∃ second ∈ deleted,
      first ≠ second ∧ dist center first = dist center second) ∨
    Nonempty (MinimalDeletionCore D.A deleted center)

private theorem commonBlocker_ne_source₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : FrontierCommonDeletionCriticalFiber R) :
    H.centerAt G.source₁.1 G.source₁.2 ≠ G.source₁.1 := by
  exact
    (Finset.mem_erase.mp
      (H.selectedAt G.source₁.1 G.source₁.2).toCriticalFourShell.center_mem).1

private theorem commonBlocker_ne_source₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : FrontierCommonDeletionCriticalFiber R) :
    H.centerAt G.source₁.1 G.source₁.2 ≠ G.source₂.1 := by
  intro hcenter
  apply
    (H.selectedAt G.source₁.1 G.source₁.2).toCriticalFourShell.center_not_mem_support
  simpa only [hcenter] using G.source₂_mem_commonSupport

private theorem commonBlocker_mem_pairComplement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : FrontierCommonDeletionCriticalFiber R) :
    H.centerAt G.source₁.1 G.source₁.2 ∈
      D.A \ ({G.source₁.1, G.source₂.1} : Finset ℝ²) := by
  refine Finset.mem_sdiff.mpr ⟨G.commonBlocker_mem_A, ?_⟩
  simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
  exact ⟨commonBlocker_ne_source₁ G, commonBlocker_ne_source₂ G⟩

private theorem source₁_singleton_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (MinimalDeletionCore D.A {G.source₁.1}
      (H.centerAt G.source₁.1 G.source₁.2)) := by
  apply exists_minimalDeletionCore
  · intro x hx
    simp only [Finset.mem_singleton] at hx
    simpa only [hx] using G.source₁.2
  · exact G.commonBlocker_mem_A
  · intro first hfirst second hsecond hne
    simp only [Finset.mem_singleton] at hfirst hsecond
    exact (hne (hfirst.trans hsecond.symm)).elim
  · simpa only [Finset.sdiff_singleton_eq_erase] using
      G.source₁_deletion_critical
  · intro source hsource
    simp only [Finset.mem_singleton] at hsource
    subst source
    simpa using D.K4
      (H.centerAt G.source₁.1 G.source₁.2)
      G.commonBlocker_mem_A

private theorem source₂_singleton_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (MinimalDeletionCore D.A {G.source₂.1}
      (H.centerAt G.source₁.1 G.source₁.2)) := by
  apply exists_minimalDeletionCore
  · intro x hx
    simp only [Finset.mem_singleton] at hx
    simpa only [hx] using G.source₂.2
  · exact G.commonBlocker_mem_A
  · intro first hfirst second hsecond hne
    simp only [Finset.mem_singleton] at hfirst hsecond
    exact (hne (hfirst.trans hsecond.symm)).elim
  · simpa only [Finset.sdiff_singleton_eq_erase] using
      G.source₂_deletion_critical
  · intro source hsource
    simp only [Finset.mem_singleton] at hsource
    subst source
    simpa using D.K4
      (H.centerAt G.source₁.1 G.source₁.2)
      G.commonBlocker_mem_A

private theorem nonempty_subset_pair_eq_singleton_or_pair
    {first second : ℝ²} {deleted : Finset ℝ²}
    (hne : first ≠ second)
    (hdeletedNe : deleted.Nonempty)
    (hdeletedSub : deleted ⊆ ({first, second} : Finset ℝ²)) :
    deleted = {first} ∨ deleted = {second} ∨
      deleted = {first, second} := by
  by_cases hfirst : first ∈ deleted
  · by_cases hsecond : second ∈ deleted
    · right
      right
      apply Finset.Subset.antisymm hdeletedSub
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact hfirst
      · exact hsecond
    · left
      apply Finset.Subset.antisymm
      · intro x hx
        have hpair := hdeletedSub hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hpair ⊢
        rcases hpair with hxf | hxs
        · exact hxf
        · subst x
          exact (hsecond hx).elim
      · intro x hx
        simp only [Finset.mem_singleton] at hx
        subst x
        exact hfirst
  · by_cases hsecond : second ∈ deleted
    · right
      left
      apply Finset.Subset.antisymm
      · intro x hx
        have hpair := hdeletedSub hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hpair ⊢
        rcases hpair with hxf | hxs
        · subst x
          exact (hfirst hx).elim
        · exact hxs
      · intro x hx
        simp only [Finset.mem_singleton] at hx
        subst x
        exact hsecond
    · rcases hdeletedNe with ⟨x, hx⟩
      have hpair := hdeletedSub hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hpair
      rcases hpair with rfl | rfl
      · exact (hfirst hx).elim
      · exact (hsecond hx).elim

/-- Applying global minimality to the two collision sources gives the exact
cardinality-minimal-deletion packet. -/
theorem exists_pairMinimalDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (CriticalFiberMinimalDeletionPacket R G
      ({G.source₁.1, G.source₂.1} : Finset ℝ²)) := by
  let U : Finset ℝ² := {G.source₁.1, G.source₂.1}
  have hUsub : U ⊆ D.A := by
    intro x hx
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact G.source₁.2
    · exact G.source₂.2
  have hUne : U.Nonempty := ⟨G.source₁.1, by simp [U]⟩
  have hremaining : (D.A \ U).Nonempty := by
    exact ⟨H.centerAt G.source₁.1 G.source₁.2, by
      simpa only [U] using commonBlocker_mem_pairComplement G⟩
  rcases exists_global_cardMinimal_blocking_subdeletion
      R.minimal hUsub hUne hremaining with
    ⟨center, hcenter, deleted, hdeletedNe, hdeletedSub,
      hblocked, hminimal⟩
  exact ⟨{
    center := center
    center_mem_complement := by simpa only [U] using hcenter
    deleted := deleted
    deleted_nonempty := hdeletedNe
    deleted_subset_deletionSet := by simpa only [U] using hdeletedSub
    blocked_after_deleted := hblocked
    restoring_one_survives := hminimal }⟩

/-- If a pair-deletion packet chooses the old common blocker, its deleted set
must be one of the two singleton sources.  The two-source deletion cannot be
minimal because restoring either member still leaves the other prescribed
critical deletion. -/
theorem pairMinimalDeletion_at_commonBlocker_stutters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {G : FrontierCommonDeletionCriticalFiber R}
    (P : CriticalFiberMinimalDeletionPacket R G
      ({G.source₁.1, G.source₂.1} : Finset ℝ²))
    (hcenter :
      P.center = H.centerAt G.source₁.1 G.source₁.2) :
    P.deleted = {G.source₁.1} ∨ P.deleted = {G.source₂.1} := by
  rcases nonempty_subset_pair_eq_singleton_or_pair
      G.source_points_ne P.deleted_nonempty
      P.deleted_subset_deletionSet with
    hfirst | hsecond | hpair
  · exact Or.inl hfirst
  · exact Or.inr hsecond
  · have hfirstMem : G.source₁.1 ∈ P.deleted := by
      rw [hpair]
      simp
    have hrestore :=
      P.restoring_one_survives G.source₁.1 hfirstMem
    have hsecondSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase G.source₂.1)
          (H.centerAt G.source₁.1 G.source₁.2) := by
      rw [hcenter] at hrestore
      simpa [hpair, G.source_points_ne,
        Finset.sdiff_singleton_eq_erase] using hrestore
    exact (G.source₂_deletion_critical hsecondSurvives).elim

/-- Exact bounded reduction supplied by pair deletion.  The output either
chooses one of the two old singleton critical deletions at the common blocker,
or it chooses a genuinely different center.  Minimality alone does not select
the second arm. -/
theorem exists_pairMinimalDeletion_stutter_or_distinctCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    ∃ P : CriticalFiberMinimalDeletionPacket R G
        ({G.source₁.1, G.source₂.1} : Finset ℝ²),
      (P.center = H.centerAt G.source₁.1 G.source₁.2 ∧
          (P.deleted = {G.source₁.1} ∨
            P.deleted = {G.source₂.1})) ∨
        P.center ≠ H.centerAt G.source₁.1 G.source₁.2 := by
  rcases exists_pairMinimalDeletionPacket R G with ⟨P⟩
  by_cases hcenter :
      P.center = H.centerAt G.source₁.1 G.source₁.2
  · exact ⟨P, Or.inl
      ⟨hcenter, pairMinimalDeletion_at_commonBlocker_stutters P hcenter⟩⟩
  · exact ⟨P, Or.inr hcenter⟩

/-- The collision/core version of the same pair-deletion application. -/
theorem exists_pairDeletionCorePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (CriticalFiberDeletionCorePacket R G
      ({G.source₁.1, G.source₂.1} : Finset ℝ²)) := by
  let U : Finset ℝ² := {G.source₁.1, G.source₂.1}
  have hUsub : U ⊆ D.A := by
    intro x hx
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact G.source₁.2
    · exact G.source₂.2
  have hUne : U.Nonempty := ⟨G.source₁.1, by simp [U]⟩
  have hremaining : (D.A \ U).Nonempty := by
    exact ⟨H.centerAt G.source₁.1 G.source₁.2, by
      simpa only [U] using commonBlocker_mem_pairComplement G⟩
  rcases exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      R.minimal hUsub hUne hremaining with
    ⟨center, hcenter, deleted, hdeletedNe, hdeletedSub,
      hblocked, houtcome⟩
  exact ⟨{
    center := center
    center_mem_complement := by simpa only [U] using hcenter
    deleted := deleted
    deleted_nonempty := hdeletedNe
    deleted_subset_deletionSet := by simpa only [U] using hdeletedSub
    blocked_after_deleted := hblocked
    collision_or_core := houtcome }⟩

/-- Literal first-source stutter for the stronger pair-deletion packet.  It
reuses the common blocker and returns the already-present first critical
shell as a singleton minimal-deletion core. -/
def source₁PairDeletionStutter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    CriticalFiberDeletionCorePacket R G
      ({G.source₁.1, G.source₂.1} : Finset ℝ²) where
  center := H.centerAt G.source₁.1 G.source₁.2
  center_mem_complement := commonBlocker_mem_pairComplement G
  deleted := {G.source₁.1}
  deleted_nonempty := by simp
  deleted_subset_deletionSet := by intro x hx; simp_all
  blocked_after_deleted := by
    simpa only [Finset.sdiff_singleton_eq_erase] using
      G.source₁_deletion_critical
  collision_or_core := Or.inr (source₁_singleton_core G)

/-- Symmetric second-source stutter. -/
def source₂PairDeletionStutter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    CriticalFiberDeletionCorePacket R G
      ({G.source₁.1, G.source₂.1} : Finset ℝ²) where
  center := H.centerAt G.source₁.1 G.source₁.2
  center_mem_complement := commonBlocker_mem_pairComplement G
  deleted := {G.source₂.1}
  deleted_nonempty := by simp
  deleted_subset_deletionSet := by intro x hx; simp_all
  blocked_after_deleted := by
    simpa only [Finset.sdiff_singleton_eq_erase] using
      G.source₂_deletion_critical
  collision_or_core := Or.inr (source₂_singleton_core G)

/-- The same stutter persists when the deletion universe is enlarged to the
entire common exact support. -/
def source₁CommonSupportDeletionStutter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (G : FrontierCommonDeletionCriticalFiber R) :
    CriticalFiberDeletionCorePacket R G
      (H.selectedAt G.source₁.1 G.source₁.2).toCriticalFourShell.support where
  center := H.centerAt G.source₁.1 G.source₁.2
  center_mem_complement := Finset.mem_sdiff.mpr
    ⟨G.commonBlocker_mem_A,
      (H.selectedAt G.source₁.1 G.source₁.2).toCriticalFourShell.center_not_mem_support⟩
  deleted := {G.source₁.1}
  deleted_nonempty := by simp
  deleted_subset_deletionSet := by
    intro x hx
    simp only [Finset.mem_singleton] at hx
    simpa only [hx] using
      (H.selectedAt G.source₁.1 G.source₁.2).toCriticalFourShell.q_mem_support
  blocked_after_deleted := by
    simpa only [Finset.sdiff_singleton_eq_erase] using
      G.source₁_deletion_critical
  collision_or_core := Or.inr (source₁_singleton_core G)

#print axioms exists_pairMinimalDeletionPacket
#print axioms pairMinimalDeletion_at_commonBlocker_stutters
#print axioms exists_pairMinimalDeletion_stutter_or_distinctCenter
#print axioms exists_pairDeletionCorePacket
#print axioms source₁PairDeletionStutter
#print axioms source₂PairDeletionStutter
#print axioms source₁CommonSupportDeletionStutter

end

end ATailCriticalFiberMinimalDeletionScratch
end Problem97
