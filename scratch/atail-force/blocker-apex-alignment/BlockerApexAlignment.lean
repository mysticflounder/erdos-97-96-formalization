/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Adaptive blocker--Moser-apex alignment

This scratch module isolates what the actual K-A surface can force after the
critical-shell selector is allowed to adapt to the geometric source.

Global K4 at one Moser apex supplies a radius class with two points in the
strict interior of its opposite cap.  If deleting both points preserves K4 at
a second Moser apex, they land in the existing prescribed-apex survivor arm.
Otherwise the failed deletion supplies an exact critical shell pinned through
one point, and `CriticalShellSystem.overrideAt` produces a genuine common
critical system whose blocker at that source is exactly the second apex.

This does not align the arbitrary system already quantified in K-A.  The
distinction is load-bearing: `hNoM44` constrains geometry, not which legal
critical shell an existential selector chooses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace BlockerApexAlignmentScratch

/-- Cycle-free local replay of the cap-interior multiplicity lemma currently
stored downstream in `PinnedSurplusGeneralM`.  Its proof needs only the
upstream cap cover and adjacent one-hit bounds. -/
private theorem selectedClass_capInterior_card_ge_two_cycleFree
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    2 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.capInteriorByIndex i).card := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside : (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  change 2 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

/-- Definitional alignment of the indexed surplus cap with `surplusCap`. -/
private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

/-- If deletion really blocks K4 at a prescribed carrier center, an arbitrary
critical system can be adapted at that source so its actual chosen blocker is
the prescribed center. -/
private theorem exists_adapted_blocker_at_of_not_survives
    {D : CounterexampleData} (H0 : CriticalShellSystem D.A)
    {source center : ℝ²}
    (hsourceA : source ∈ D.A) (hcenterA : center ∈ D.A)
    (hsource_ne_center : source ≠ center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    ∃ H : CriticalShellSystem D.A,
      H.centerAt source hsourceA = center := by
  have hcenterErase : center ∈ D.A.erase source :=
    Finset.mem_erase.mpr ⟨hsource_ne_center.symm, hcenterA⟩
  rcases selectedClass_erase_witness_or_exact_erased_pin D.K4 hcenterErase with
    ⟨radius, hradius, hsurvives⟩ |
      ⟨radius, hradius, hcard, hsourceClass⟩
  · exfalso
    apply hblocked
    exact ⟨radius, hradius, by
      simpa [SelectedClass] using hsurvives⟩
  · rcases CriticalSelectedFourClass.exists_of_exactSelectedClass
      hcenterA hradius hcard hsourceClass with ⟨C⟩
    let H := H0.overrideAt C hblocked
    refine ⟨H, ?_⟩
    simpa [H] using H0.overrideAt_centerAt C hblocked hsourceA

/-- Two off-surplus sources on one Moser-apex radius, classified at a second
Moser apex.  The right two arms contain an actual adapted
`CriticalShellSystem`, not merely a possible Euclidean circle. -/
structure InteriorPairApexOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (firstIndex secondIndex : Fin 3) where
  radius : ℝ
  radius_pos : 0 < radius
  x : ℝ²
  y : ℝ²
  x_mem_A : x ∈ D.A
  y_mem_A : y ∈ D.A
  x_ne_y : x ≠ y
  x_mem_firstClass :
    x ∈ SelectedClass D.A (S.oppositeVertexByIndex firstIndex) radius
  y_mem_firstClass :
    y ∈ SelectedClass D.A (S.oppositeVertexByIndex firstIndex) radius
  x_mem_firstInterior : x ∈ S.capInteriorByIndex firstIndex
  y_mem_firstInterior : y ∈ S.capInteriorByIndex firstIndex
  x_not_mem_surplusCap : x ∉ S.surplusCap
  y_not_mem_surplusCap : y ∉ S.surplusCap
  outcome :
    (HasNEquidistantPointsAt 4 (D.A.erase x)
        (S.oppositeVertexByIndex secondIndex) ∧
      HasNEquidistantPointsAt 4 (D.A.erase y)
        (S.oppositeVertexByIndex secondIndex)) ∨
    (∃ H : CriticalShellSystem D.A,
      H.centerAt x x_mem_A = S.oppositeVertexByIndex secondIndex) ∨
    (∃ H : CriticalShellSystem D.A,
      H.centerAt y y_mem_A = S.oppositeVertexByIndex secondIndex)

/-- Adaptive alignment classification at any non-surplus indexed cap.

The first arm is precisely the two-source deletion-survival packet used by the
prescribed-apex continuation.  If either deletion is blocked, one of the other
arms constructs a legal critical system aligned with the prescribed second
Moser apex. -/
theorem exists_interiorPairApexOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (firstIndex secondIndex : Fin 3)
    (hfirst_not_surplus : firstIndex ≠ S.surplusIdx)
    (hcritical : Nonempty (CriticalShellSystem D.A)) :
    Nonempty (InteriorPairApexOutcome D S firstIndex secondIndex) := by
  classical
  rcases hcritical with ⟨H0⟩
  have hfirstCenterA : S.oppositeVertexByIndex firstIndex ∈ D.A :=
    S.oppositeVertexByIndex_mem firstIndex
  have hsecondCenterA : S.oppositeVertexByIndex secondIndex ∈ D.A :=
    S.oppositeVertexByIndex_mem secondIndex
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
      D.K4 hfirstCenterA with ⟨radius, hradius, hclassCard⟩
  let I :=
    SelectedClass D.A (S.oppositeVertexByIndex firstIndex) radius ∩
      S.capInteriorByIndex firstIndex
  have hIcard : 2 ≤ I.card := by
    simpa [I] using selectedClass_capInterior_card_ge_two_cycleFree
      S D.convex firstIndex hradius hclassCard
  have hIone : 1 < I.card := by omega
  rcases Finset.one_lt_card.mp hIone with ⟨x, hxI, y, hyI, hxy⟩
  have hxClass :
      x ∈ SelectedClass D.A
        (S.oppositeVertexByIndex firstIndex) radius :=
    (Finset.mem_inter.mp hxI).1
  have hyClass :
      y ∈ SelectedClass D.A
        (S.oppositeVertexByIndex firstIndex) radius :=
    (Finset.mem_inter.mp hyI).1
  have hxInterior : x ∈ S.capInteriorByIndex firstIndex :=
    (Finset.mem_inter.mp hxI).2
  have hyInterior : y ∈ S.capInteriorByIndex firstIndex :=
    (Finset.mem_inter.mp hyI).2
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxClass).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hyClass).1
  have hxNotSurplus : x ∉ S.surplusCap := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hxInterior hfirst_not_surplus
  have hyNotSurplus : y ∉ S.surplusCap := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hyInterior hfirst_not_surplus
  have hx_ne_second : x ≠ S.oppositeVertexByIndex secondIndex :=
    S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem hxInterior
  have hy_ne_second : y ≠ S.oppositeVertexByIndex secondIndex :=
    S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem hyInterior
  let survivesX : Prop :=
    HasNEquidistantPointsAt 4 (D.A.erase x)
      (S.oppositeVertexByIndex secondIndex)
  let survivesY : Prop :=
    HasNEquidistantPointsAt 4 (D.A.erase y)
      (S.oppositeVertexByIndex secondIndex)
  by_cases hxSurvives : survivesX
  · by_cases hySurvives : survivesY
    · exact ⟨{
        radius := radius
        radius_pos := hradius
        x := x
        y := y
        x_mem_A := hxA
        y_mem_A := hyA
        x_ne_y := hxy
        x_mem_firstClass := hxClass
        y_mem_firstClass := hyClass
        x_mem_firstInterior := hxInterior
        y_mem_firstInterior := hyInterior
        x_not_mem_surplusCap := hxNotSurplus
        y_not_mem_surplusCap := hyNotSurplus
        outcome := Or.inl ⟨hxSurvives, hySurvives⟩ }⟩
    · rcases exists_adapted_blocker_at_of_not_survives H0 hyA
        hsecondCenterA hy_ne_second hySurvives with ⟨H, hH⟩
      exact ⟨{
        radius := radius
        radius_pos := hradius
        x := x
        y := y
        x_mem_A := hxA
        y_mem_A := hyA
        x_ne_y := hxy
        x_mem_firstClass := hxClass
        y_mem_firstClass := hyClass
        x_mem_firstInterior := hxInterior
        y_mem_firstInterior := hyInterior
        x_not_mem_surplusCap := hxNotSurplus
        y_not_mem_surplusCap := hyNotSurplus
        outcome := Or.inr (Or.inr ⟨H, hH⟩) }⟩
  · rcases exists_adapted_blocker_at_of_not_survives H0 hxA
      hsecondCenterA hx_ne_second hxSurvives with ⟨H, hH⟩
    exact ⟨{
      radius := radius
      radius_pos := hradius
      x := x
      y := y
      x_mem_A := hxA
      y_mem_A := hyA
      x_ne_y := hxy
      x_mem_firstClass := hxClass
      y_mem_firstClass := hyClass
      x_mem_firstInterior := hxInterior
      y_mem_firstInterior := hyInterior
      x_not_mem_surplusCap := hxNotSurplus
      y_not_mem_surplusCap := hyNotSurplus
      outcome := Or.inr (Or.inl ⟨H, hH⟩) }⟩

/-- Live first-to-second opposite-apex specialization. -/
theorem exists_oppIndex1Pair_oppIndex2Outcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcritical : Nonempty (CriticalShellSystem D.A)) :
    Nonempty
      (InteriorPairApexOutcome D S S.oppIndex1 S.oppIndex2) := by
  exact exists_interiorPairApexOutcome D S S.oppIndex1 S.oppIndex2
    S.surplusIdx_ne_oppIndex1.symm hcritical

/-- Symmetric second-to-first opposite-apex specialization. -/
theorem exists_oppIndex2Pair_oppIndex1Outcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcritical : Nonempty (CriticalShellSystem D.A)) :
    Nonempty
      (InteriorPairApexOutcome D S S.oppIndex2 S.oppIndex1) := by
  exact exists_interiorPairApexOutcome D S S.oppIndex2 S.oppIndex1
    S.surplusIdx_ne_oppIndex2.symm hcritical

#print axioms exists_interiorPairApexOutcome
#print axioms exists_oppIndex1Pair_oppIndex2Outcome
#print axioms exists_oppIndex2Pair_oppIndex1Outcome

end BlockerApexAlignmentScratch
end Problem97
