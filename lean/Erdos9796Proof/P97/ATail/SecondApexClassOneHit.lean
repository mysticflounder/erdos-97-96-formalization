/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# Second-apex radius classes meet adjacent caps at most once

Generic-packet composition of the `U2NonSurplusSqueeze` one-hit bounds at
`oppApex2`: any exact-radius class at the physical second apex meets the
closed surplus cap, and the closed first opposite cap, in at most one
point.  Pair-level corollaries state the form the exact-seven
role-coverage gate consumes: two distinct members of one second-apex
radius class never lie in the same adjacent closed cap.

This is the Lean port of the retro-L0 census law (REPORT Finding 7 in
`scratch/atail-force/exact7-role-coverage-gate`): applied to the
exact-five class it confines the two extras to opposite sides — the four
one-sided extra-landing patterns are impossible.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSecondApexClassOneHit

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Replace only the distinguished surplus packet, keeping the carrier and
all counterexample hypotheses definitionally unchanged. -/
private def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : CounterexampleData :=
  { A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }

/-- An exact-radius class at the second apex meets the closed surplus cap
at most once. -/
theorem selectedClass_oppApex2_inter_surplusCap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (radius : ℝ) :
    (SelectedClass D.A S.oppApex2 radius ∩ S.surplusCap).card ≤ 1 := by
  simpa [withPacket, SelectedClass, dist_comm] using
    U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit (withPacket D S) radius

/-- An exact-radius class at the second apex meets the closed first
opposite cap at most once. -/
theorem selectedClass_oppApex2_inter_oppCap1_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (radius : ℝ) :
    (SelectedClass D.A S.oppApex2 radius ∩ S.oppCap1).card ≤ 1 := by
  simpa [withPacket, SelectedClass, dist_comm] using
    U2NonSurplusSqueeze.oppApex2_otherCap_one_hit (withPacket D S) radius

private theorem false_of_pair_subset_card_le_one
    {T : Finset ℝ²} {x y : ℝ²} (hne : x ≠ y)
    (hx : x ∈ T) (hy : y ∈ T) (hcard : T.card ≤ 1) : False := by
  have hsub : ({x, y} : Finset ℝ²) ⊆ T := by
    intro z hz
    rcases Finset.mem_insert.mp hz with hz | hz
    · exact hz ▸ hx
    · exact (Finset.mem_singleton.mp hz) ▸ hy
  have htwo : (2 : ℕ) ≤ T.card := by
    have hle := Finset.card_le_card hsub
    rwa [Finset.card_pair hne] at hle
  omega

/-- Two distinct members of one second-apex radius class never lie both in
the closed surplus cap. -/
theorem not_coRadial_oppApex2_pair_mem_surplusCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A) {radius : ℝ}
    {x y : ℝ²} (hne : x ≠ y)
    (hx : x ∈ SelectedClass D.A S.oppApex2 radius)
    (hy : y ∈ SelectedClass D.A S.oppApex2 radius)
    (hxCap : x ∈ S.surplusCap) (hyCap : y ∈ S.surplusCap) : False :=
  false_of_pair_subset_card_le_one hne
    (Finset.mem_inter.mpr ⟨hx, hxCap⟩)
    (Finset.mem_inter.mpr ⟨hy, hyCap⟩)
    (selectedClass_oppApex2_inter_surplusCap_card_le_one S radius)

/-- Two distinct members of one second-apex radius class never lie both in
the closed first opposite cap. -/
theorem not_coRadial_oppApex2_pair_mem_oppCap1
    {D : CounterexampleData} (S : SurplusCapPacket D.A) {radius : ℝ}
    {x y : ℝ²} (hne : x ≠ y)
    (hx : x ∈ SelectedClass D.A S.oppApex2 radius)
    (hy : y ∈ SelectedClass D.A S.oppApex2 radius)
    (hxCap : x ∈ S.oppCap1) (hyCap : y ∈ S.oppCap1) : False :=
  false_of_pair_subset_card_le_one hne
    (Finset.mem_inter.mpr ⟨hx, hxCap⟩)
    (Finset.mem_inter.mpr ⟨hy, hyCap⟩)
    (selectedClass_oppApex2_inter_oppCap1_card_le_one S radius)

end

end ATailSecondApexClassOneHit
end Problem97
