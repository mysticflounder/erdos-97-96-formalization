/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DangerousRowCoupling
import CommonDeletionSuccessorCycle

/-!
# Scratch: common-deletion expansion under the retained live dangerous row

The generic `CommonDeletionTwoCenterPacket` expansion ends in either a recursive
successor or an aligned prescribed critical pair.  When its first center is the
live center `p`, the rebuilt `LiveDangerousRetainingSystem` makes the
first-center aligned pair automatic:

* every first deleted row is the retained dangerous row
  `{q, t1, t2, t3}`;
* two points of that row lie outside the deleted source's selected critical
  shell; and
* the rebuilt system already makes both points deletion-critical at `p`, with
  selected support equal to the same dangerous row.

Thus the `CommonDeletionSuccessorCycle` alternative, whose definition assumes
that no aligned pair exists at any surviving source, is unavailable.  This is
not a contradiction: the forced aligned pair repeats data already installed in
the retained system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRLiveCommonDeletionExpansionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailCommonDeletionSuccessorCycleScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRParentDangerousRowCouplingScratch.LiveDangerousRetainingSystem.AnchoredCoupling
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Any common-deletion packet whose first center is `p` has the retained live
dangerous row as its first exact deleted row. -/
theorem commonDeletion_firstRow_eq_liveBase
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) :
    C.B₁ = ({q, t1, t2, t3} : Finset ℝ²) := by
  let P : PrescribedCriticalAt D q p :=
    { shell := W.liveRow
      blocks := W.liveRow_blocks }
  have hrow :=
    prescribedCritical_support_eq_qDeletedRow P C.row₁ C.B₁_card
  calc
    C.B₁ = P.shell.toCriticalFourShell.support := hrow.symm
    _ = ({q, t1, t2, t3} : Finset ℝ²) := by
      simpa [P] using W.liveRow_support

/-- A source whose deletion survives at the live first center is outside the
dangerous row. -/
theorem commonDeletion_deleted_not_mem_liveBase
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) :
    deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  intro hdeleted
  exact C.actual_blocker_ne_center₁
    ((W.centerAt_eq_p_iff deleted C.q_mem_A).2 hdeleted)

/-- The retained critical system already supplies a prescribed critical shell
at `p` for every source in the live dangerous row. -/
def livePrescribedCriticalAt
    {D : CounterexampleData} {p q t1 t2 t3 source : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (hsourceA : source ∈ D.A)
    (hsource : source ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    PrescribedCriticalAt D source p := by
  have hcenter : W.H.centerAt source hsourceA = p :=
    (W.centerAt_eq_p_iff source hsourceA).2 hsource
  have K : CriticalSelectedFourClass D.A source p := by
    simpa only [hcenter] using W.H.selectedAt source hsourceA
  have hblocks :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) p := by
    simpa only [hcenter] using W.H.no_qfree_at source hsourceA
  exact { shell := K, blocks := hblocks }

/-- The automatic first-center alignment, together with the proof that both
sources and both already-chosen rows lie in the retained live dangerous
fiber. -/
structure LiveFirstCenterAlignment
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) : Type where
  pair : AlignedPrescribedCriticalPair C (0 : Fin 2)
  first_mem_liveBase :
    pair.first.point ∈ ({q, t1, t2, t3} : Finset ℝ²)
  second_mem_liveBase :
    pair.second.point ∈ ({q, t1, t2, t3} : Finset ℝ²)
  first_centerAt :
    W.H.centerAt pair.first.point pair.first.mem_A = p
  second_centerAt :
    W.H.centerAt pair.second.point pair.second.mem_A = p
  first_selectedAt_support :
    (W.H.selectedAt pair.first.point pair.first.mem_A
      ).toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²)
  second_selectedAt_support :
    (W.H.selectedAt pair.second.point pair.second.mem_A
      ).toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²)

/-- The first-center aligned pair is unconditional for every live-row
common-deletion packet. -/
theorem nonempty_liveFirstCenterAlignment
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) :
    Nonempty (LiveFirstCenterAlignment W C) := by
  rcases nonempty_freshCriticalPair C (0 : Fin 2) with ⟨F⟩
  have hrow := commonDeletion_firstRow_eq_liveBase C
  have hfirstB₁ : F.first.point ∈ C.B₁ := by
    simpa using F.first_mem_row
  have hsecondB₁ : F.second.point ∈ C.B₁ := by
    simpa using F.second_mem_row
  have hfirstBase :
      F.first.point ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [hrow] at hfirstB₁
    exact hfirstB₁
  have hsecondBase :
      F.second.point ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [hrow] at hsecondB₁
    exact hsecondB₁
  let Pfirst :=
    livePrescribedCriticalAt W F.first.mem_A hfirstBase
  let Psecond :=
    livePrescribedCriticalAt W F.second.mem_A hsecondBase
  let P : AlignedPrescribedCriticalPair C (0 : Fin 2) :=
    { first := F.first
      second := F.second
      ne := F.ne
      firstCritical := by simpa using Pfirst
      secondCritical := by simpa using Psecond
      supports_eq := by
        simpa using
          prescribedCritical_support_eq_of_common_center Pfirst Psecond
      support_eq_prescribed_row := by
        simpa using
          prescribedCritical_support_eq_qDeletedRow Pfirst C.row₁ C.B₁_card }
  exact ⟨{
    pair := P
    first_mem_liveBase := hfirstBase
    second_mem_liveBase := hsecondBase
    first_centerAt :=
      (W.centerAt_eq_p_iff F.first.point F.first.mem_A).2 hfirstBase
    second_centerAt :=
      (W.centerAt_eq_p_iff F.second.point F.second.mem_A).2 hsecondBase
    first_selectedAt_support :=
      W.selectedAt_support F.first.point F.first.mem_A hfirstBase
    second_selectedAt_support :=
      W.selectedAt_support F.second.point F.second.mem_A hsecondBase }⟩

/-- Deleting a point outside the live dangerous row preserves that four-point
row at the first center `p`. -/
theorem deletion_survives_liveFirstCenter_of_not_mem_liveBase
    {D : CounterexampleData} {p q t1 t2 t3 source : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (hsource : source ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    HasNEquidistantPointsAt 4 (D.A.erase source) p := by
  let K := W.liveRow.toCriticalFourShell
  have hsourceSupport : source ∉ K.support := by
    simpa [K, W.liveRow_support] using hsource
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((D.A.erase source).filter
        fun z ↦ dist p z = K.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzSource ↦ hsourceSupport (hzSource ▸ hz),
                K.support_subset_A hz⟩,
            K.support_eq_radius z hz⟩)

/-- Two fresh sources outside the live dangerous row are exactly the missing
input needed to bypass the automatic first-center alignment.  They force
either a recursive common-deletion successor or an aligned prescribed pair at
the second center. -/
theorem successor_or_secondCenterAlignment_of_two_off_live_sources
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card) :
    (∃ X : FreshCriticalSource C,
      X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D W.H X.point p center₂)) ∨
      Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2)) := by
  have hone :
      1 < ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haFresh, haOffLive⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbFresh, hbOffLive⟩
  rcases Finset.mem_sdiff.mp haFresh with ⟨haRows, haOutside⟩
  rcases Finset.mem_sdiff.mp hbFresh with ⟨hbRows, hbOutside⟩
  let X := freshCriticalSource_of_mem C haRows haOutside
  let Y := freshCriticalSource_of_mem C hbRows hbOutside
  have hXp :
      HasNEquidistantPointsAt 4 (D.A.erase X.point) p :=
    deletion_survives_liveFirstCenter_of_not_mem_liveBase W haOffLive
  have hYp :
      HasNEquidistantPointsAt 4 (D.A.erase Y.point) p :=
    deletion_survives_liveFirstCenter_of_not_mem_liveBase W hbOffLive
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := X.point) D.K4 C.center₂_mem_A with
    hXcenter₂ | ⟨KX, hXblocks⟩
  · exact Or.inl ⟨X, haOffLive,
      nonempty_commonDeletionTwoCenterPacket W.H X.mem_A
        C.center₁_mem_A C.center₂_mem_A C.centers_ne hXp hXcenter₂⟩
  · rcases erase_survives_or_criticalSelectedFourClass_at
        (q := Y.point) D.K4 C.center₂_mem_A with
      hYcenter₂ | ⟨KY, hYblocks⟩
    · exact Or.inl ⟨Y, hbOffLive,
        nonempty_commonDeletionTwoCenterPacket W.H Y.mem_A
          C.center₁_mem_A C.center₂_mem_A C.centers_ne hYp hYcenter₂⟩
    · let PX : PrescribedCriticalAt D X.point center₂ :=
        { shell := KX, blocks := hXblocks }
      let PY : PrescribedCriticalAt D Y.point center₂ :=
        { shell := KY, blocks := hYblocks }
      exact Or.inr ⟨{
        first := X
        second := Y
        ne := hab
        firstCritical := by simpa using PX
        secondCritical := by simpa using PY
        supports_eq := by
          simpa using prescribedCritical_support_eq_of_common_center PX PY
        support_eq_prescribed_row := by
          simpa using
            prescribedCritical_support_eq_qDeletedRow PX C.row₂ C.B₂_card }⟩

/-- The generic cycle construction's `HasAlignedPrescribedPairAt` predicate
holds at every live-row surviving source, always at the first center. -/
theorem hasAlignedPrescribedPairAt_every_survivor
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C₀ : CommonDeletionTwoCenterPacket D W.H deleted p center₂)
    (s : CommonDeletionSurvivorSource D p center₂) :
    HasAlignedPrescribedPairAt C₀ s := by
  refine ⟨0, ?_⟩
  rcases nonempty_liveFirstCenterAlignment W (canonicalPacketAt C₀ s) with ⟨L⟩
  exact ⟨L.pair⟩

/-- Consequently the particular successor-cycle normal form, which carries a
global absence of aligned pairs as a field, cannot occur under the retained
live dangerous system. -/
theorem not_nonempty_commonDeletionSuccessorCycle
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C₀ : CommonDeletionTwoCenterPacket D W.H deleted p center₂) :
    ¬ Nonempty (CommonDeletionSuccessorCycle C₀) := by
  rintro ⟨O⟩
  exact O.no_aligned O.source
    (hasAlignedPrescribedPairAt_every_survivor W C₀ O.source)

/-- Starting from the anchored live-row connector, the resulting
common-deletion packet immediately carries the automatic first-center
alignment. -/
theorem anchored_commonDeletion_forces_liveFirstCenterAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (A : AnchoredSourceCriticalTransition R)
    (hcenter : R.firstCenter = p) :
    ∃ X : FreshSurvivingMarginalSource A,
      X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        ∃ C : CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2,
          Nonempty (LiveFirstCenterAlignment W C) := by
  rcases
      exists_fresh_commonDeletionSuccessor_with_liveRow
        (W := W) A hcenter with
    ⟨X, hXOutside, _hrow, ⟨C⟩⟩
  exact ⟨X, hXOutside, C, nonempty_liveFirstCenterAlignment W C⟩

#print axioms commonDeletion_firstRow_eq_liveBase
#print axioms commonDeletion_deleted_not_mem_liveBase
#print axioms livePrescribedCriticalAt
#print axioms nonempty_liveFirstCenterAlignment
#print axioms deletion_survives_liveFirstCenter_of_not_mem_liveBase
#print axioms successor_or_secondCenterAlignment_of_two_off_live_sources
#print axioms hasAlignedPrescribedPairAt_every_survivor
#print axioms not_nonempty_commonDeletionSuccessorCycle
#print axioms anchored_commonDeletion_forces_liveFirstCenterAlignment

end ATailRLiveCommonDeletionExpansionScratch
end Problem97
