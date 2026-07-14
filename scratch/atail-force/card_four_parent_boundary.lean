/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Card-four parent common-system boundary

This scratch module records the exact field packet which would close the
card-four arm of the ATAIL same-radius classifier at the parent boundary where
the original `CriticalShellSystem` is still available.

The content-bearing producer is not asserted here.  The checked theorem proves
that one non-apex blocker in the surplus cap whose exact shell contains the
chosen off-surplus pair immediately contradicts ordered-cap outside-pair
uniqueness.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILCardFourParentBoundary

attribute [local instance] Classical.propDecidable

/-- Exact common-system fields missing in the card-four arm. -/
def SurplusBlockerPairFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (apex q w : ℝ²) : Prop :=
  ∃ source : ℝ², ∃ hsource : source ∈ D.A,
    H.centerAt source hsource ∈ S.surplusCap ∧
    H.centerAt source hsource ≠ apex ∧
    q ∈ (H.selectedAt source hsource).toCriticalFourShell.support ∧
    w ∈ (H.selectedAt source hsource).toCriticalFourShell.support

/-- Choice-invariant form of the same producer.  It asserts existence of any
certified deletion blocker and exact shell with the required placement and
pair incidence; it does not refer to an arbitrary preselected system. -/
def ExistsSurplusPairCriticalBlocker
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (apex q w : ℝ²) : Prop :=
  ∃ source : ℝ², ∃ _hsource : source ∈ D.A, ∃ center : ℝ²,
    center ∈ S.surplusCap ∧ center ≠ apex ∧
    ∃ C : CriticalSelectedFourClass D.A source center,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center ∧
      q ∈ C.toCriticalFourShell.support ∧
      w ∈ C.toCriticalFourShell.support

/-- Whenever one certified blocker is available, pointwise override defeats
any claim that every admissible selector must avoid that blocker center.  All
ambient geometric hypotheses are irrelevant to this choice operation. -/
theorem not_forall_centerAt_ne_of_certified_blocker
    {A : Finset ℝ²} (H0 : CriticalShellSystem A)
    {source center : ℝ²} (hsource : source ∈ A)
    (C : CriticalSelectedFourClass A source center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    ¬ (∀ H : CriticalShellSystem A, H.centerAt source hsource ≠ center) := by
  intro hall
  exact hall (H0.overrideAt C hblocked)
    (H0.overrideAt_centerAt C hblocked hsource)

/-- Any selector-dependent witness has a choice-invariant reading.  The
converse for an arbitrary supplied selector is deliberately not asserted. -/
theorem existsSurplusPairCriticalBlocker_of_systemFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (apex q w : ℝ²)
    (F : SurplusBlockerPairFields S H apex q w) :
    ExistsSurplusPairCriticalBlocker S apex q w := by
  rcases F with ⟨source, hsource, hcenterCap, hcenterNe, hqRow, hwRow⟩
  exact ⟨source, hsource, H.centerAt source hsource,
    hcenterCap, hcenterNe, H.selectedAt source hsource,
    H.no_qfree_at source hsource, hqRow, hwRow⟩

/-- The first opposite apex is an endpoint of the closed surplus cap. -/
theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  set CP := S.partition
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v2_mem_C1
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v3_mem_C2
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v1_mem_C3

/-- A surplus-cap blocker containing the card-four pair is already terminal.

`hapexCap` is structural for `apex = S.oppApex1`; it is kept explicit so the
interface is also usable for either endpoint without duplicating the routine
three-index cap unfolding. -/
theorem false_of_surplusBlockerPairFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {apex q w : ℝ²}
    (hapexCap : apex ∈ S.surplusCap)
    (hqA : q ∈ D.A) (hwA : w ∈ D.A)
    (hqw : q ≠ w)
    (hqOff : q ∉ S.surplusCap) (hwOff : w ∉ S.surplusCap)
    (hapexDist : dist apex q = dist apex w)
    (F : SurplusBlockerPairFields S H apex q w) : False := by
  classical
  rcases F with ⟨source, hsource, hzCap, hza, hqRow, hwRow⟩
  let z := H.centerAt source hsource
  have hzDist : dist z q = dist z w :=
    ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      q hqRow).trans
      ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        w hwRow).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;> simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi]
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hapexCap
  have hzImage : z ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hzCap
  rcases Finset.mem_image.mp hapexImage with ⟨r, _hr, hrapex⟩
  rcases Finset.mem_image.mp hzImage with ⟨s, _hs, hsz⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hza
    calc
      z = L.points s := hsz.symm
      _ = L.points r := by simp [hrs]
      _ = apex := hrapex
  have hqOutside : q ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hqOff
  have hwOutside : w ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hwOff
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs' hqA hwA hqOutside hwOutside hqw
        (by simpa [hrapex] using hapexDist)
        (by simpa [hsz] using hzDist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr' hqA hwA hqOutside hwOutside hqw
        (by simpa [hsz] using hzDist)
        (by simpa [hrapex] using hapexDist)

/-- The exact first-apex specialization consumed by the card-four branch. -/
theorem false_of_oppApex1_surplusBlockerPairFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {q w : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A)
    (hqw : q ≠ w)
    (hqOff : q ∉ S.surplusCap) (hwOff : w ∉ S.surplusCap)
    (hapexDist : dist S.oppApex1 q = dist S.oppApex1 w)
    (F : SurplusBlockerPairFields S H S.oppApex1 q w) : False :=
  false_of_surplusBlockerPairFields S H
    (oppApex1_mem_surplusCap S) hqA hwA hqw hqOff hwOff hapexDist F

/-- Choice-invariant first-apex consumer.  A favorable selector is constructed
only after the geometric blocker witness has been produced. -/
theorem false_of_existsSurplusPairCriticalBlocker
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {q w : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A)
    (hqw : q ≠ w)
    (hqOff : q ∉ S.surplusCap) (hwOff : w ∉ S.surplusCap)
    (hapexDist : dist S.oppApex1 q = dist S.oppApex1 w)
    (F : ExistsSurplusPairCriticalBlocker S S.oppApex1 q w) : False := by
  classical
  rcases F with ⟨source, hsource, center, hcenterCap, hcenterNe,
    C, _hblocked, hqC, hwC⟩
  have hcenterDist : dist center q = dist center w :=
    (C.toCriticalFourShell.support_eq_radius q hqC).trans
      (C.toCriticalFourShell.support_eq_radius w hwC).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;> simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi]
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hcenterCap
  rcases Finset.mem_image.mp hapexImage with ⟨r, _hr, hrapex⟩
  rcases Finset.mem_image.mp hcenterImage with ⟨s, _hs, hscenter⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcenterNe
    calc
      center = L.points s := hscenter.symm
      _ = L.points r := by simp [hrs]
      _ = S.oppApex1 := hrapex
  have hqOutside : q ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hqOff
  have hwOutside : w ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hwOff
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs' hqA hwA hqOutside hwOutside hqw
        (by simpa [hrapex] using hapexDist)
        (by simpa [hscenter] using hcenterDist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr' hqA hwA hqOutside hwOutside hqw
        (by simpa [hscenter] using hcenterDist)
        (by simpa [hrapex] using hapexDist)

#print axioms false_of_surplusBlockerPairFields
#print axioms false_of_oppApex1_surplusBlockerPairFields
#print axioms not_forall_centerAt_ne_of_certified_blocker
#print axioms existsSurplusPairCriticalBlocker_of_systemFields
#print axioms false_of_existsSurplusPairCriticalBlocker

end ATAILCardFourParentBoundary
end Problem97
