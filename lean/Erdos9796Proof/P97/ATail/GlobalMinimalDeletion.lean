/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MinimalDeletionCore

/-!
# Global minimality to a finite deletion core

This module turns global cardinal minimality into a source-faithful local
alternative. Delete a prescribed finite set `U` from a minimal carrier. A
remaining carrier point must lose K4. At that point, shrink `U` to a
cardinality-minimal set whose deletion still loses K4.

Restoring any member of the minimal set restores K4. Consequently, either two
deleted sources have the same radius about the new center, or
`MinimalDeletionCore` supplies one exact critical shell per deleted source
with pairwise-disjoint supports.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMinimalDeletion

open ATAILStageOneMinimalDeletionCore

/-- A nonempty proper subset of a minimal counterexample carrier cannot
retain the global four-equidistant property. -/
theorem not_hasNEquidistantProperty_of_nonempty_proper_subset
    {D : CounterexampleData} (hmin : D.Minimal)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ D.A)
    (hBproper : B ≠ D.A) :
    ¬ HasNEquidistantProperty 4 B := by
  intro hBK4
  have hBconvex : ConvexIndep B := ConvexIndep.mono hBA D.convex
  have hcard : D.A.card ≤ B.card := hmin B hBne hBconvex hBK4
  exact hBproper (Finset.eq_of_subset_of_card_le hBA hcard)

/-- Failure of the global property on a finite carrier is witnessed at one
of its own centers. -/
theorem exists_local_blocker_of_not_global_K4
    {B : Finset ℝ²}
    (hnot : ¬ HasNEquidistantProperty 4 B) :
    ∃ center ∈ B,
      ¬ HasNEquidistantPointsAt 4 B center := by
  classical
  by_contra hnone
  apply hnot
  intro center hcenter
  by_contra hblocked
  exact hnone ⟨center, hcenter, hblocked⟩

/-- At a fixed center, any finite deletion which destroys K4 contains a
cardinality-minimal blocking subdeletion. Restoring any one of its members
restores K4 at that center. -/
theorem exists_cardMinimal_blocking_subdeletion
    {A U : Finset ℝ²} {center : ℝ²}
    (hfull : HasNEquidistantPointsAt 4 A center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ U) center) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (A \ (V.erase s)) center := by
  classical
  let candidates : Finset (Finset ℝ²) :=
    U.powerset.filter fun V ↦
      ¬ HasNEquidistantPointsAt 4 (A \ V) center
  have hUcand : U ∈ candidates := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_powerset.mpr (fun _ hx ↦ hx), hblocked⟩
  have hcandidates : candidates.Nonempty := ⟨U, hUcand⟩
  rcases Finset.exists_min_image candidates Finset.card hcandidates with
    ⟨V, hVcand, hVmin⟩
  rcases Finset.mem_filter.mp hVcand with ⟨hVpowerset, hVblocked⟩
  have hVsub : V ⊆ U := Finset.mem_powerset.mp hVpowerset
  have hVne : V.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hVempty
    apply hVblocked
    simpa [hVempty] using hfull
  refine ⟨V, hVne, hVsub, hVblocked, ?_⟩
  intro s hsV
  by_contra hrestoreBlocked
  have hEraseCand : V.erase s ∈ candidates := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_powerset.mpr ?_, hrestoreBlocked⟩
    exact (Finset.erase_subset s V).trans hVsub
  have hle : V.card ≤ (V.erase s).card := hVmin (V.erase s) hEraseCand
  exact (not_lt_of_ge hle) (Finset.card_erase_lt_of_mem hsV)

/-- Delete a prescribed nonempty set `U` from a minimal carrier. If at least
one carrier point remains, some remaining center admits a minimal blocking
subdeletion of `U`. -/
theorem exists_global_cardMinimal_blocking_subdeletion
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ (V.erase s)) center := by
  classical
  have hproper : D.A \ U ≠ D.A := by
    rcases hUne with ⟨u, huU⟩
    intro heq
    have huRemaining : u ∈ D.A \ U := by
      rw [heq]
      exact hUsub huU
    exact (Finset.mem_sdiff.mp huRemaining).2 huU
  have hnotGlobal :
      ¬ HasNEquidistantProperty 4 (D.A \ U) :=
    not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hremaining Finset.sdiff_subset hproper
  rcases exists_local_blocker_of_not_global_K4 hnotGlobal with
    ⟨center, hcenterRemaining, hcenterBlocked⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterRemaining).1
  rcases exists_cardMinimal_blocking_subdeletion
      (D.K4 center hcenterA) hcenterBlocked with
    ⟨V, hVne, hVsub, hVblocked, hVminimal⟩
  exact ⟨center, hcenterRemaining, V, hVne, hVsub,
    hVblocked, hVminimal⟩

/-- Global deletion-critical bridge.

For any prescribed proper deletion set `U`, minimality produces a center
outside `U` and a nonempty minimal blocking subset `V ⊆ U`. Either two
members of `V` are co-radial about that fresh center, or every member of `V`
has its own exact critical four-shell there and these shells are pairwise
disjoint. -/
theorem exists_fresh_sharedRadiusPair_or_minimalDeletionCore
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  rcases exists_global_cardMinimal_blocking_subdeletion
      hmin hUsub hUne hremaining with
    ⟨center, hcenterRemaining, V, hVne, hVsub,
      hVblocked, hVminimal⟩
  refine ⟨center, hcenterRemaining, V, hVne, hVsub, hVblocked, ?_⟩
  by_cases hcollision :
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t
  · exact Or.inl hcollision
  · apply Or.inr
    have hcenterA : center ∈ D.A :=
      (Finset.mem_sdiff.mp hcenterRemaining).1
    apply exists_minimalDeletionCore
      (A := D.A) (U := V) (center := center)
      (hVsub.trans hUsub) hcenterA
    · intro s hsV t htV hst hdist
      exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
    · exact hVblocked
    · exact hVminimal

end ATailGlobalMinimalDeletion
end Problem97
