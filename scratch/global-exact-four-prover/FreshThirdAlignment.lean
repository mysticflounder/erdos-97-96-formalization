/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry

/-!
# Exact alignment content of a fresh third blocker fiber

A genuinely new blocker fiber supplies two distinct sources in one canonical
critical shell.  Since every canonical critical shell has exactly four points,
the complement of those sources inside the shell has exactly two points.

Even if the two sources are additionally placed in one radius class at a rich
apex, that radius class meets the shell in exactly those two sources.  Thus this
packet alone cannot manufacture the three-hit rich-slice terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GlobalExactFourProverScratch

open ATailApexRichClassStructure
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

noncomputable section

private theorem freshThird_sourceValues_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    Q.source₁.1 ≠ Q.source₂.1 := by
  intro h
  exact Q.sources_ne (Subtype.ext h)

/-- The two selected rows of a fresh third blocker fiber have the same
canonical critical shell. -/
theorem freshThird_selectedSupports_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support =
      (H.selectedAt Q.source₂.1
        Q.source₂.2).toCriticalFourShell.support := by
  exact selectedSupports_eq_of_actualBlockers_eq H
    Q.source₁.2 Q.source₂.2 (congrArg Subtype.val Q.blockers_eq)

/-- Both fresh sources lie in their common canonical critical shell. -/
theorem freshThird_pair_subset_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    {Q.source₁.1, Q.source₂.1} ⊆
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support := by
  intro x hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl
  · exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.q_mem_support
  · exact Q.source₂_mem_source₁_shell

/-- Exact unconditional residual of the fresh-fiber branch: after removing its
two named sources, precisely two points remain in the common four-shell. -/
theorem freshThird_firstShell_sdiff_pair_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support \
        {Q.source₁.1, Q.source₂.1}).card = 2 := by
  have hpair :
      {Q.source₁.1, Q.source₂.1} ⊆
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support :=
    freshThird_pair_subset_firstShell P Pρ Q
  have hinter :
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
          {Q.source₁.1, Q.source₂.1} =
        {Q.source₁.1, Q.source₂.1} :=
    Finset.inter_eq_right.mpr hpair
  have hsplit :=
    Finset.card_sdiff_add_card_inter
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
      {Q.source₁.1, Q.source₂.1}
  rw [hinter,
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.support_card] at hsplit
  simpa [freshThird_sourceValues_ne P Pρ Q] using hsplit

/-- If the fresh pair is aligned in one radius class at a rich apex, then its
common shell meets that class in exactly the fresh pair, never in a third
point. -/
theorem freshThird_pair_eq_shell_inter_selectedClass_of_apexRich
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    {p : ℝ²} (hrich : ApexRichClassStructure D.A p) (r : ℝ)
    (hsource₁Class : Q.source₁.1 ∈ SelectedClass D.A p r)
    (hsource₂Class : Q.source₂.1 ∈ SelectedClass D.A p r) :
    {Q.source₁.1, Q.source₂.1} =
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
        SelectedClass D.A p r := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support,
          hsource₁Class⟩
    · exact Finset.mem_inter.mpr
        ⟨Q.source₂_mem_source₁_shell, hsource₂Class⟩
  · have hle :=
      criticalShell_inter_selectedClass_card_le_two_of_apexRich
        H Q.source₁.1 Q.source₁.2 hrich r
    simpa [freshThird_sourceValues_ne P Pρ Q] using hle

/-- Strict-cap form of the exact alignment theorem.  If the fresh pair is
aligned in one rich opposite-apex slice, it exhausts the intersection of that
slice with its common critical shell. -/
theorem freshThird_pair_eq_shell_inter_richCapSlice
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (i : Fin 3)
    (hrich :
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (r : ℝ)
    (hsource₁Slice :
      Q.source₁.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)
    (hsource₂Slice :
      Q.source₂.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i) :
    {Q.source₁.1, Q.source₂.1} =
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i) := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support,
          hsource₁Slice⟩
    · exact Finset.mem_inter.mpr
        ⟨Q.source₂_mem_source₁_shell, hsource₂Slice⟩
  · have hle :=
      criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
        S i H Q.source₁.1 Q.source₁.2 hrich r
    simpa [freshThird_sourceValues_ne P Pρ Q] using hle

end

end GlobalExactFourProverScratch
end Problem97
