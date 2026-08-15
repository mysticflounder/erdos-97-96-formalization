/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# Multi-point minimal blocking sets have robust centers

This scratch module isolates the cardinality-independent normalization needed by
the FreshThird FirstNonHit global-minimality route.  It concerns simultaneous
deletion of a finite set, not separate one-point blocker incidences.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FreshThirdFirstNonHitSyncV2

open ATailGlobalMinimalDeletion
open ATailDeletionRobustness
open ATAILStageOneMinimalDeletionCore

attribute [local instance] Classical.propDecidable

/-- If deleting a finite set blocks K4 at `center`, restoring any one member restores
K4, and the set has at least two members, then `center` is fully deletion robust.

If two deleted members are co-radial, restoration forces a five-point ambient class.
Otherwise the minimal-core theorem gives two support-disjoint exact four-classes.
Either configuration survives every single-point deletion.  The exact nonrobust-row
deletion law gives the equivalent uniqueness explanation. -/
theorem fullyDeletionRobustAt_of_cardMinimalBlockingSubdeletion_two_le
    {D : CounterexampleData} {center : ℝ²} {V : Finset ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNotV : center ∉ V)
    (hVsub : V ⊆ D.A)
    (hcard : 2 ≤ V.card)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center) :
    FullyDeletionRobustAt D center := by
  classical
  by_cases hcollision :
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t
  · rcases hcollision with ⟨s, hsV, t, htV, hst, hsame⟩
    apply fullyDeletionRobustAt_of_five_le_selectedClass
    · apply (dist_pos : 0 < dist center s ↔ center ≠ s).2
      intro hcenterS
      subst s
      exact hcenterNotV hsV
    · exact five_le_selectedClass_of_restoration_and_sharedRadius
        hVsub hsV htV hst (hminimal s hsV) hblocked hsame
  · have hdistinct :
        ∀ {s}, s ∈ V → ∀ {t}, t ∈ V → s ≠ t →
          dist center s ≠ dist center t := by
      intro s hsV t htV hst hsame
      exact hcollision ⟨s, hsV, t, htV, hst, hsame⟩
    rcases exists_minimalDeletionCore hVsub hcenterA hdistinct hblocked hminimal with ⟨K⟩
    have hone : 1 < V.card := by omega
    rcases Finset.one_lt_card.mp hone with ⟨s, hsV, t, htV, hst⟩
    let sV : {x : ℝ² // x ∈ V} := ⟨s, hsV⟩
    let tV : {x : ℝ² // x ∈ V} := ⟨t, htV⟩
    apply fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
      (K.shellAt sV).toCriticalFourShell.toSelectedFourClass
      (K.shellAt tV).toCriticalFourShell.toSelectedFourClass
    exact K.supports_pairwise_disjoint sV tV (fun h ↦ hst (congrArg Subtype.val h))

/-- A nonempty deletion-minimal blocking set is a singleton unless its center is
fully deletion robust.  This is the exhaustive source-clean normalization of the
global-minimality packet; the robust arm does not itself identify an actual blocker
row. -/
theorem card_eq_one_or_fullyDeletionRobustAt_of_cardMinimalBlockingSubdeletion
    {D : CounterexampleData} {center : ℝ²} {V : Finset ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNotV : center ∉ V)
    (hVsub : V ⊆ D.A)
    (hVne : V.Nonempty)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center) :
    V.card = 1 ∨ FullyDeletionRobustAt D center := by
  by_cases hone : V.card = 1
  · exact Or.inl hone
  · right
    apply fullyDeletionRobustAt_of_cardMinimalBlockingSubdeletion_two_le
      hcenterA hcenterNotV hVsub
      (by have := Finset.card_pos.mpr hVne; omega) hblocked hminimal

end FreshThirdFirstNonHitSyncV2
end Problem97
