/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
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

/-- Local adapter from the banked ordered-cap uniqueness theorem to an
indexed cap of a surplus packet. -/
private theorem sameCap_outsidePair_unique_bisectorCenter
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {c z w : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w) :
    ∀ a : ℝ², a ∈ S.capByIndex k →
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
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

/-- Erasing one point from an exact five-point radius class leaves a
four-point witness at the same center. -/
private theorem single_erase_survives_of_class_card_five
    {A : Finset ℝ²} {center z : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (_hzClass : z ∈ SelectedClass A center radius)
    (hcard : (SelectedClass A center radius).card = 5) :
    HasNEquidistantPointsAt 4 (A.erase z) center := by
  refine ⟨radius, hradius, ?_⟩
  simpa [SelectedClass] using
    selectedClass_erase_card_ge_of_succ_le
      (A := A) (x := z) (s := center) (d := radius) (n := 4) (by omega)

/-- Three distinct carrier centers cannot all bisect the same carrier pair.

The first center is the first opposite apex.  Deletion survival separates it
from both source blockers, while mutual critical-row incidence places both
blockers on the same perpendicular bisector. -/
private theorem false_of_mutualCriticalIncidence_of_distinct_blockers
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {apex z w : ℝ²}
    (hapexA : apex ∈ D.A) (hzA : z ∈ D.A) (hwA : w ∈ D.A)
    (hzw : z ≠ w)
    (hapexEq : dist apex z = dist apex w)
    (hzSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z) apex)
    (hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w) apex)
    (hcenters : H.centerAt z hzA ≠ H.centerAt w hwA)
    (hwInZRow :
      w ∈ (H.selectedAt z hzA).toCriticalFourShell.support)
    (hzInWRow :
      z ∈ (H.selectedAt w hwA).toCriticalFourShell.support) :
    False := by
  classical
  let cz := H.centerAt z hzA
  let cw := H.centerAt w hwA
  have hczA : cz ∈ D.A := by
    simpa [cz] using
      (Finset.mem_erase.mp
        (H.selectedAt z hzA).toCriticalFourShell.center_mem).2
  have hcwA : cw ∈ D.A := by
    simpa [cw] using
      (Finset.mem_erase.mp
        (H.selectedAt w hwA).toCriticalFourShell.center_mem).2
  have hcz_ne_apex : cz ≠ apex := by
    simpa [cz] using
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H hzA hzSurvives
  have hcw_ne_apex : cw ≠ apex := by
    simpa [cw] using
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H hwA hwSurvives
  have hczEq : dist cz z = dist cz w := by
    simpa [cz] using
      (H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z
          (H.selectedAt z hzA).toCriticalFourShell.q_mem_support
        |>.trans
          ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius w
            hwInZRow).symm
  have hcwEq : dist cw z = dist cw w := by
    simpa [cw] using
      (H.selectedAt w hwA).toCriticalFourShell.support_eq_radius z hzInWRow
        |>.trans
          ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius w
            (H.selectedAt w hwA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hzA hwA hzw
  have hapexFilter :
      apex ∈ D.A.filter (fun c => dist c z = dist c w) :=
    Finset.mem_filter.mpr ⟨hapexA, hapexEq⟩
  have hczFilter :
      cz ∈ D.A.filter (fun c => dist c z = dist c w) :=
    Finset.mem_filter.mpr ⟨hczA, hczEq⟩
  have hcwFilter :
      cw ∈ D.A.filter (fun c => dist c z = dist c w) :=
    Finset.mem_filter.mpr ⟨hcwA, hcwEq⟩
  have hthree :
      2 < (D.A.filter (fun c => dist c z = dist c w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨apex, hapexFilter, cz, hczFilter, cw, hcwFilter,
      hcz_ne_apex.symm, hcw_ne_apex.symm, by simpa [cz, cw] using hcenters⟩
  omega

/-- One cross-incidence already contradicts ordered-cap uniqueness when its
blocker center lies in the surplus cap. -/
theorem false_of_cardFive_capLocal_crossIncidence
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {radius : ℝ} {z w : ℝ²}
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
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H hzA hzSurvives
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
  z : ℝ²
  w : ℝ²
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
    exact false_of_mutualCriticalIncidence_of_distinct_blockers H
      (oppApex1_mem_A S) F.z_mem_A F.w_mem_A F.ne
      ((mem_selectedClass.mp F.z_mem_class).2.trans
        (mem_selectedClass.mp F.w_mem_class).2.symm)
      hzSurvives hwSurvives F.centers_ne hmutual.1 hmutual.2

#print axioms false_of_mutualCriticalIncidence_of_distinct_blockers
#print axioms false_of_cardFive_capLocal_crossIncidence
#print axioms false_of_cardFive_exists_capLocal_or_mutualIncidence

end ATAILCardFiveCapOrMutualScratch
end Problem97
