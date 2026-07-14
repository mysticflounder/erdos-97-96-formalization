/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import same_radius_double_erase_classifier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Card-five cap-local or mutual-incidence consumer

This scratch module records the weakest currently identified consumer for the
card-five first-apex branch.  The producer may choose its pair existentially
from the exact five-point class.  It closes if either one chosen critical row
contains the other endpoint and its blocker lies in the surplus cap, or the
two chosen rows contain the endpoints reciprocally.

The cap-local arms use ordered-cap uniqueness.  The reciprocal arm uses the
checked three-bisector/Dumitrescu consumer.  No producer for the disjunction
is asserted here.

The banked
`U5QAllowedAuditSupport.selected_exists_mem_anchorSupport` does not produce
these fields.  Its selected class is centered at a bounded audit center and
its forced hit lies in the fixed set `{p,u,a0,a1}`.  The present source row is
centered at `CriticalShellSystem.centerAt z`, while its required hit is a
second member of the five-point first-apex class.  The live hypotheses provide
neither inclusion of every blocker center in the bounded audit-center set nor
inclusion of an audit anchor in the five-point class.  Even granting both,
pigeonholing five sources into four anchors repeats an anchor but does not put
one source in another source's row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILCardFiveCapOrMutualScratch

open ATAILSameRadiusDoubleErase
open U1Depth5

/-- Local adapter from the banked ordered-cap uniqueness theorem to an
indexed cap of a surplus packet. -/
private theorem sameCap_outsidePair_unique_bisectorCenter
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {c z w : Plane}
    (hcCap : c ∈ S.capByIndex k)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w) :
    ∀ a : Plane, a ∈ S.capByIndex k →
      (dist a z = dist a w ↔ a = c) := by
  classical
  intro a haCap
  rcases S.capByIndex_cgn4g_capData hconv k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have haImage : a ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact haCap
  rcases Finset.mem_image.mp hcImage with ⟨r, _hr, hrc⟩
  rcases Finset.mem_image.mp haImage with ⟨s, _hs, hsa⟩
  constructor
  · intro hadist
    by_contra hac
    have hrs : r ≠ s := by
      intro hrs
      apply hac
      calc
        a = L.points s := hsa.symm
        _ = L.points r := by simp [hrs]
        _ = c := hrc
    have hzOutside : z ∉ Finset.univ.image L.points := by
      simpa [hcap] using hzOff
    have hwOutside : w ∉ Finset.univ.image L.points := by
      simpa [hcap] using hwOff
    rcases lt_or_gt_of_ne hrs with hrs' | hsr'
    · exact CapSelectedRowCounting.outsidePair_unique_capCenter
        hconv Hord Packet.mem_A hrs' hzA hwA hzOutside hwOutside hzw
          (by simpa [hrc] using hcdist) (by simpa [hsa] using hadist)
    · exact CapSelectedRowCounting.outsidePair_unique_capCenter
        hconv Hord Packet.mem_A hsr' hzA hwA hzOutside hwOutside hzw
          (by simpa [hsa] using hadist) (by simpa [hrc] using hcdist)
  · intro hac
    simpa [hac] using hcdist

private theorem capByIndex_surplusIdx_eq
    {A : Finset Plane} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_A
    {A : Finset Plane} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_mem_surplusCap
    {A : Finset Plane} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

/-- One cross-incidence already contradicts ordered-cap uniqueness when its
blocker center lies in the surplus cap. -/
theorem false_of_cardFive_capLocal_crossIncidence
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {radius : ℝ} {z w : Plane}
    (hzA : z ∈ D.A) (hwA : w ∈ D.A)
    (hradius : 0 < radius)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hzClass : z ∈ SelectedClass D.A S.oppApex1 radius)
    (hwClass : w ∈ SelectedClass D.A S.oppApex1 radius)
    (hzw : z ≠ w)
    (hzOff : z ∉ S.surplusCap) (hwOff : w ∉ S.surplusCap)
    (hwInZRow :
      w ∈ (H.selectedAt z hzA).toCriticalFourShell.support)
    (hzCenterCap :
      H.centerAt z hzA ∈ S.surplusCap) :
    False := by
  have hzSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    single_erase_survives_of_class_card_five hradius hzClass hcard
  have hzCenterNe : H.centerAt z hzA ≠ S.oppApex1 :=
    blocker_center_ne_of_deletion_survives H hzA hzSurvives
  have hapexDist : dist S.oppApex1 z = dist S.oppApex1 w :=
    (mem_selectedClass.mp hzClass).2.trans
      (mem_selectedClass.mp hwClass).2.symm
  have hcenterDist :
      dist (H.centerAt z hzA) z = dist (H.centerAt z hzA) w :=
    ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z
      (H.selectedAt z hzA).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius w
        hwInZRow).symm
  have hcapEq := capByIndex_surplusIdx_eq S
  have hunique := sameCap_outsidePair_unique_bisectorCenter
    S D.convex S.surplusIdx
    (c := S.oppApex1) (z := z) (w := w)
    (by simpa [hcapEq] using oppApex1_mem_surplusCap S)
    hzA hwA hzw
    (by simpa [hcapEq] using hzOff)
    (by simpa [hcapEq] using hwOff)
    hapexDist
  have hcenterEq : H.centerAt z hzA = S.oppApex1 :=
    (hunique (H.centerAt z hzA)
      (by simpa [hcapEq] using hzCenterCap)).mp hcenterDist
  exact hzCenterNe hcenterEq

/-- Pair-selective output accepted by the card-five consumer. -/
structure CardFiveCapOrMutualFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (radius : ℝ) where
  z : Plane
  w : Plane
  z_mem_A : z ∈ D.A
  w_mem_A : w ∈ D.A
  z_mem_class : z ∈ SelectedClass D.A S.oppApex1 radius
  w_mem_class : w ∈ SelectedClass D.A S.oppApex1 radius
  ne : z ≠ w
  z_off_surplus : z ∉ S.surplusCap
  w_off_surplus : w ∉ S.surplusCap
  centers_ne : H.centerAt z z_mem_A ≠ H.centerAt w w_mem_A
  outcome :
    (w ∈ (H.selectedAt z z_mem_A).toCriticalFourShell.support ∧
      H.centerAt z z_mem_A ∈ S.surplusCap) ∨
    (z ∈ (H.selectedAt w w_mem_A).toCriticalFourShell.support ∧
      H.centerAt w w_mem_A ∈ S.surplusCap) ∨
    (w ∈ (H.selectedAt z z_mem_A).toCriticalFourShell.support ∧
      z ∈ (H.selectedAt w w_mem_A).toCriticalFourShell.support)

/-- Existential pair-selective consumer for the card-five branch.  The first
two outcomes are one-cross cap-local contradictions; the third is the checked
reciprocal-incidence contradiction. -/
theorem false_of_cardFive_exists_capLocal_or_mutualIncidence
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hproduce : Nonempty (CardFiveCapOrMutualFields S H radius)) :
    False := by
  rcases hproduce with ⟨F⟩
  rcases F.outcome with hcapZ | hcapW | hmutual
  · exact false_of_cardFive_capLocal_crossIncidence
      S H F.z_mem_A F.w_mem_A hradius hcard F.z_mem_class F.w_mem_class
      F.ne F.z_off_surplus F.w_off_surplus hcapZ.1 hcapZ.2
  · exact false_of_cardFive_capLocal_crossIncidence
      S H F.w_mem_A F.z_mem_A hradius hcard F.w_mem_class F.z_mem_class
      F.ne.symm F.w_off_surplus F.z_off_surplus hcapW.1 hcapW.2
  ·
    have hzSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase F.z) S.oppApex1 :=
      single_erase_survives_of_class_card_five
        hradius F.z_mem_class hcard
    have hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase F.w) S.oppApex1 :=
      single_erase_survives_of_class_card_five
        hradius F.w_mem_class hcard
    exact false_of_distinctBlockers_mutualCriticalIncidence H
      (oppApex1_mem_A S) F.z_mem_A F.w_mem_A F.ne
      ((mem_selectedClass.mp F.z_mem_class).2.trans
        (mem_selectedClass.mp F.w_mem_class).2.symm)
      hzSurvives hwSurvives F.centers_ne hmutual.1 hmutual.2

#print axioms false_of_cardFive_capLocal_crossIncidence
#print axioms false_of_cardFive_exists_capLocal_or_mutualIncidence

end ATAILCardFiveCapOrMutualScratch
end Problem97
