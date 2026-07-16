/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2LiveHeavyPlacementAudit

/-!
# Scratch: source-faithful F2 three-row chain

This file packages the exact object that remains after the F2 live-heavy
placement and direct U5-bank audits.

The three rows are:

* the retained live row, centered at `p`;
* the common-deletion second row, centered at `oppApex2`; and
* the deleted source's selected critical support, centered at its actual
  blocker.

The middle row meets each outer row in exactly two points, while the outer
rows meet in at most one point.  The two middle/live points lie in strict
`oppCap2`.  No anonymous finite shadow or replacement critical system is
introduced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2ThreeRowChainScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- The exact source-faithful three-row `2-2` chain on the F2 live-heavy arm.

The fields deliberately retain the original common-deletion packet and its
critical system.  In particular, `deletedCriticalSupport C` is the selected
critical shell at the actual deleted source, not an independently chosen
four-set. -/
structure SourceFaithfulF2ThreeRowChain
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2) :
    Prop where
  first_row_eq_live :
    C.B₁ = ({q, t1, t2, t3} : Finset ℝ²)
  live_source_mem_surplus :
    q ∈ S.surplusCap
  middle_inter_live_card :
    (C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)).card = 2
  middle_inter_deletedSupport_card :
    (C.B₂ ∩ deletedCriticalSupport C).card = 2
  middle_triple_inter_card :
    ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
      deletedCriticalSupport C).card = 0
  outer_inter_card_le_one :
    (({q, t1, t2, t3} : Finset ℝ²) ∩
      deletedCriticalSupport C).card ≤ 1
  liveOnly_card :
    (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)).card = 2
  supportOnly_card :
    (supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)).card = 2
  middle_row_eq_cells :
    C.B₂ =
      liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∪
        supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C)
  liveStrict_card :
    (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S).card = 2
  live_center_mem_strictSecondCap :
    p ∈ strictSecondCap S
  global_K4_on_middle_strict :
    ∀ z ∈ C.B₂ ∩ strictSecondCap S,
      Nonempty (SelectedFourClass D.A z)
  deleted_mem_deletedSupport :
    deleted ∈ deletedCriticalSupport C
  deleted_not_mem_live :
    deleted ∉ ({q, t1, t2, t3} : Finset ℝ²)
  deleted_not_mem_middle :
    deleted ∉ C.B₂
  centers_pairwise :
    p ≠ S.oppApex2 ∧
      W.H.centerAt deleted C.q_mem_A ≠ p ∧
      W.H.centerAt deleted C.q_mem_A ≠ S.oppApex2

/-- Extract the exact three-row chain from the current F2 live-heavy packet. -/
theorem sourceFaithfulF2ThreeRowChain
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (hqSurplus : q ∈ S.surplusCap)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    SourceFaithfulF2ThreeRowChain S W C := by
  let liveStrict :=
    liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  have hliveStrict_le :
      liveStrict.card ≤
        (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C)).card :=
    Finset.card_le_card Finset.inter_subset_left
  have htwoLiveStrict : 2 ≤ liveStrict.card := by
    simpa [liveStrict] using htwo
  have hliveStrict_card : liveStrict.card = 2 := by
    have hliveOnly := F2.failure.liveOnly_card
    omega
  refine {
    first_row_eq_live := commonDeletion_firstRow_eq_liveBase C
    live_source_mem_surplus := hqSurplus
    middle_inter_live_card := F2.failure.inter_live_card
    middle_inter_deletedSupport_card := F2.failure.inter_support_card
    middle_triple_inter_card := ?_
    outer_inter_card_le_one := ?_
    liveOnly_card := F2.failure.liveOnly_card
    supportOnly_card := F2.failure.supportOnly_card
    middle_row_eq_cells :=
      TwoLiveExactCoverFailureProfile.row_eq_liveOnly_union_supportOnly
        F2.failure
    liveStrict_card := by simpa [liveStrict] using hliveStrict_card
    live_center_mem_strictSecondCap :=
      twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
        S W C F2 htwo
    global_K4_on_middle_strict := F2.global_K4_on_strict
    deleted_mem_deletedSupport := deleted_mem_deletedCriticalSupport C
    deleted_not_mem_live := commonDeletion_deleted_not_mem_liveBase C
    deleted_not_mem_middle := deleted_not_mem_secondRow C
    centers_pairwise :=
      ⟨C.centers_ne, C.actual_blocker_ne_center₁,
        C.actual_blocker_ne_center₂⟩ }
  · simpa [bothCell] using F2.failure.both_card
  · simpa [Finset.inter_comm] using
      F2.deletedSupport_inter_live_card_le_one

/-- Four named middle-row witnesses, split according to the two exact cells.

The cross-cell inequalities are recorded explicitly so later bank matching
cannot silently identify a live-only point with a support-only point. -/
structure NamedF2TwoTwoWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (P : SourceFaithfulF2ThreeRowChain S W C) where
  x : ℝ²
  y : ℝ²
  s : ℝ²
  t : ℝ²
  x_mem_liveStrict :
    x ∈ liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  y_mem_liveStrict :
    y ∈ liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  s_mem_supportOnly :
    s ∈ supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  t_mem_supportOnly :
    t ∈ supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  x_mem_dangerousTriple :
    x ∈ ({t1, t2, t3} : Finset ℝ²)
  y_mem_dangerousTriple :
    y ∈ ({t1, t2, t3} : Finset ℝ²)
  x_ne_y : x ≠ y
  s_ne_t : s ≠ t
  x_ne_s : x ≠ s
  x_ne_t : x ≠ t
  y_ne_s : y ≠ s
  y_ne_t : y ≠ t

/-- Name the two live-only strict points and the two support-only points. -/
theorem SourceFaithfulF2ThreeRowChain.nonempty_namedWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (P : SourceFaithfulF2ThreeRowChain S W C) :
    Nonempty (NamedF2TwoTwoWitnesses P) := by
  let liveStrict :=
    liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  let supportOnly :=
    supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  have hlive : 1 < liveStrict.card := by
    have hcard : liveStrict.card = 2 := by
      simpa [liveStrict] using P.liveStrict_card
    omega
  have hsupport : 1 < supportOnly.card := by
    have hcard : supportOnly.card = 2 := by
      simpa [supportOnly] using P.supportOnly_card
    omega
  rcases Finset.one_lt_card.mp hlive with ⟨x, hx, y, hy, hxy⟩
  rcases Finset.one_lt_card.mp hsupport with ⟨s, hs, t, ht, hst⟩
  have hxLive :
      x ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    exact (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hx).1).1).2
  have hyLive :
      y ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    exact (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hy).1).1).2
  have hsNotLive :
      s ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp hs).2
  have htNotLive :
      t ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp ht).2
  have hx_ne_q : x ≠ q := by
    intro hxq
    subst x
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hx).2).2
      (Finset.mem_union.mpr (Or.inl P.live_source_mem_surplus))
  have hy_ne_q : y ≠ q := by
    intro hyq
    subst y
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hy).2).2
      (Finset.mem_union.mpr (Or.inl P.live_source_mem_surplus))
  have hxTriple : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
    rcases Finset.mem_insert.mp hxLive with hxq | hxTriple
    · exact False.elim (hx_ne_q hxq)
    · exact hxTriple
  have hyTriple : y ∈ ({t1, t2, t3} : Finset ℝ²) := by
    rcases Finset.mem_insert.mp hyLive with hyq | hyTriple
    · exact False.elim (hy_ne_q hyq)
    · exact hyTriple
  exact ⟨{
    x := x
    y := y
    s := s
    t := t
    x_mem_liveStrict := by simpa [liveStrict] using hx
    y_mem_liveStrict := by simpa [liveStrict] using hy
    s_mem_supportOnly := by simpa [supportOnly] using hs
    t_mem_supportOnly := by simpa [supportOnly] using ht
    x_mem_dangerousTriple := hxTriple
    y_mem_dangerousTriple := hyTriple
    x_ne_y := hxy
    s_ne_t := hst
    x_ne_s := fun h => hsNotLive (h ▸ hxLive)
    x_ne_t := fun h => htNotLive (h ▸ hxLive)
    y_ne_s := fun h => hsNotLive (h ▸ hyLive)
    y_ne_t := fun h => htNotLive (h ▸ hyLive)
  }⟩

/-- Every strict middle-row point has the exact global-K4 deletion split at
the original common deleted source.

This is the next producer-facing interface.  It does not choose incidences
inside either generated row and therefore does not claim a bank match. -/
theorem SourceFaithfulF2ThreeRowChain.strictPoint_qDeleted_or_qCritical
    {D : CounterexampleData} {p q t1 t2 t3 deleted z : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (P : SourceFaithfulF2ThreeRowChain S W C)
    (hz : z ∈ C.B₂ ∩ strictSecondCap S) :
    (∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D deleted z B) ∧ B.card = 4) ∨
      ∃ B : Finset ℝ²,
        Nonempty (U5QCriticalTripleClass D deleted z B) ∧ B.card = 3 := by
  have hzB : z ∈ C.B₂ := (Finset.mem_inter.mp hz).1
  have hzA : z ∈ D.A := by
    have hzErase := C.row₂.subset hzB
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzErase).2).2
  have hz_ne_deleted : z ≠ deleted := by
    intro h
    subst z
    exact P.deleted_not_mem_middle hzB
  have hzSkeleton : z ∈ D.skeleton deleted := by
    change z ∈ D.A.erase deleted
    exact Finset.mem_erase.mpr ⟨hz_ne_deleted, hzA⟩
  rcases
      U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
        C.q_mem_A hzSkeleton with hdeleted | hcritical
  · exact Or.inl hdeleted
  · exact Or.inr
      (U5QCriticalTripleClass.exists_card_three_of_qCritical hcritical)

#print axioms sourceFaithfulF2ThreeRowChain
#print axioms SourceFaithfulF2ThreeRowChain.nonempty_namedWitnesses
#print axioms
  SourceFaithfulF2ThreeRowChain.strictPoint_qDeleted_or_qCritical

end ATailRF2ThreeRowChainScratch
end Problem97
