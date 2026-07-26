/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexTripleEquidistance
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover

/-!
# Rich class structure at a Moser apex, and the second cap rotation

`firstApex_largeClass_or_secondRadius` reports the first-apex dichotomy relative
to the frontier radius.  Downstream consumers want it without that radius, so
this file packages it as `ApexRichClassStructure`: the centre carries a class of
at least six points, or two distinct radii each carrying at least four.

It also supplies the rotation that puts the *surplus* apex into the first
opposite role.  `redesignateFirstOppCapAsSurplusAtAllLarge` (in
`FrontierLiveClosure`) rotates one step and lands the surplus apex in the second
opposite role; rotating the other way lands it in the first, which is the role
the dichotomy above is stated for.  Together the two rotations reach all three
Moser apices.

Both rotations keep the MEC triangle and the cap partition fixed and change only
`surplusIdx`, so every packet-generic consumer applies unchanged.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailApexRichClassStructure

open ATailApexTripleEquidistance
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- **Rich class structure at a centre.**  Either some positive radius carries at
least six carrier points, or two distinct positive radii each carry at least
four.  This is the radius-free form of the first-apex dichotomy.

It is strictly stronger than failing to be an `IsUniqueFourCenter`, which only
gives a five-point class in the first branch. -/
def ApexRichClassStructure (A : Finset ℝ²) (p : ℝ²) : Prop :=
  (∃ r : ℝ, 0 < r ∧ 6 ≤ (SelectedClass A p r).card) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass A p r₁).card ∧ 4 ≤ (SelectedClass A p r₂).card)

/-- The frontier radius is positive: the marginal point `q` sits on it and is
distinct from the first opposite apex, which lies in the surplus cap while `q`
does not.  Re-proved locally because every consumer of this fact keeps it
private to its own file. -/
private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v1_mem_C3
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

/-- A common-deletion parent residual gives rich class structure at the first
opposite apex of its own packet.  The second branch pairs the retained frontier
radius, which already carries four points, with the distinct radius the
double-deletion witness supplies. -/
theorem apexRichClassStructure_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    ApexRichClassStructure D.A S.oppApex1 := by
  have hpos : 0 < radius := frontierRadius_pos F
  rcases firstApex_largeClass_or_secondRadius R with hsix | ⟨ρ, hρpos, hne, hfour⟩
  · exact Or.inl ⟨radius, hpos, hsix⟩
  · exact Or.inr ⟨radius, ρ, hpos, hρpos, fun h => hne h.symm,
      R.frontierRadius_class_card_ge_four, hfour⟩

/-- **Rich class structure implies deletion robustness.**  In the first branch
the six-point class is a K4 radius carrying more than four points; in the second
there are two K4 radii.  Either way the centre is not a unique-four centre, and
by `isUniqueFourCenter_of_not_fullyDeletionRobust` that is exactly robustness.

So `ApexRichClassStructure` is strictly stronger than `FullyDeletionRobustAt`,
and a residual carrying the former need not also carry the latter. -/
theorem fullyDeletionRobustAt_of_apexRichClassStructure
    {D : CounterexampleData} {p : ℝ²}
    (hrich : ApexRichClassStructure D.A p) :
    FullyDeletionRobustAt D p := by
  rcases hrich with ⟨r, hr, hsix⟩ | ⟨r₁, r₂, hr₁, hr₂, hne, hc₁, hc₂⟩
  · exact fullyDeletionRobustAt_of_large_class hr (by omega)
  · exact fullyDeletionRobustAt_of_two_K4_radii hr₁ hr₂ hne hc₁ hc₂

/-- Keep the MEC triangle and cap partition fixed, but designate the old
*second* opposite cap as the new surplus cap.  Stated against a bare cardinality
hypothesis so that it is available from any residual that bounds `oppCap2`. -/
noncomputable def redesignateSecondOppCapAsSurplusOf
    {A : Finset ℝ²} (S : SurplusCapPacket A) (h : 4 < S.oppCap2.card) :
    SurplusCapPacket A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex2
  surplus := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex2, SurplusCapPacket.oppCap2, hi] using h

/-- The other rotation lands the original surplus apex in the **first** opposite
role, which is the role `apexRichClassStructure_oppApex1` reports on. -/
@[simp] theorem redesignateSecondOppCapAsSurplusOf_oppApex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) (h : 4 < S.oppCap2.card) :
    (redesignateSecondOppCapAsSurplusOf S h).oppApex1 = S.surplusApex := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateSecondOppCapAsSurplusOf, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]

/-- Its second opposite role carries the original first opposite apex. -/
@[simp] theorem redesignateSecondOppCapAsSurplusOf_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) (h : 4 < S.oppCap2.card) :
    (redesignateSecondOppCapAsSurplusOf S h).oppApex2 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateSecondOppCapAsSurplusOf, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppApex2, SurplusCapPacket.oppApex1, hi]

/- ### The unique-four cover at a tri-apex robust configuration -/

/-- No centre carries all three Moser apices on a single radius class.  This is
the class-level form of the apex-triple exclusion: a centre equidistant from the
three apices is their circumcentre, which lies inside the non-obtuse triangle
and so cannot itself be a carrier point. -/
theorem no_center_class_contains_all_apices
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p : ℝ²} (hp : p ∈ D.A) {r : ℝ} (hr : 0 < r)
    (h1 : S.triangle.v1 ∈ SelectedClass D.A p r)
    (h2 : S.triangle.v2 ∈ SelectedClass D.A p r)
    (h3 : S.triangle.v3 ∈ SelectedClass D.A p r) :
    False :=
  not_equidistant_from_three_apices S D.convex hp hr
    (mem_selectedClass.mp h1).2 (mem_selectedClass.mp h2).2
    (mem_selectedClass.mp h3).2

/-- **The unique-four cover at a tri-apex robust configuration.**

Minimality forces the carrier to be covered by four-point classes of centres
carrying a single K4 radius, and those centres are exactly the points where
deletion robustness fails, so the cover reads `|A| ≤ 4 * |non-robust points|`.
Deletion robustness removes each of the three Moser apices from that centre set,
and the apex-triple exclusion stops any one centre from covering more than two
apices at once, so at least two distinct covering centres are spent on the
apices alone.

Everything here is general in `n`; no cap cardinality, frontier or shell datum
is consumed. -/
theorem uniqueFourCover_of_triApexRobust
    {D : CounterexampleData} (hmin : D.Minimal) (S : SurplusCapPacket D.A)
    {c₁ c₂ c₃ : ℝ²}
    (hrob₁ : FullyDeletionRobustAt D c₁)
    (hrob₂ : FullyDeletionRobustAt D c₂)
    (hrob₃ : FullyDeletionRobustAt D c₃) :
    D.A.card ≤ 4 * (notRobustCenters D).card ∧
      (¬ IsUniqueFourCenter D.A c₁ ∧ ¬ IsUniqueFourCenter D.A c₂ ∧
        ¬ IsUniqueFourCenter D.A c₃) ∧
      (∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
        ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
          S.triangle.v2 ∈ SelectedClass D.A p r ∧
          S.triangle.v3 ∈ SelectedClass D.A p r)) :=
  ⟨card_le_four_mul_notRobustCenters hmin,
    ⟨not_isUniqueFourCenter_of_fullyDeletionRobust hrob₁,
      not_isUniqueFourCenter_of_fullyDeletionRobust hrob₂,
      not_isUniqueFourCenter_of_fullyDeletionRobust hrob₃⟩,
    fun _ hp _ hr h => no_center_class_contains_all_apices S hp hr h.1 h.2.1 h.2.2⟩

end ATailApexRichClassStructure
end Problem97
