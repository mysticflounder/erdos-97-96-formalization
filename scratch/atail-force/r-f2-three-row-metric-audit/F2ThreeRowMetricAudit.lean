/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2ThreeRowChain
import Erdos9796Proof.P97.U5GlobalIncidenceBasic

/-!
# Scratch: metric consequences of the source-faithful F2 three-row chain

This file derives only consequences forced by the exact live-heavy F2 packet.
The outer rows are the exact live critical shell at `p` and the exact deleted
critical shell at the actual blocker.  The middle row is the selected
q-deleted row at `oppApex2`.

Two common points determine the radical axis of each outer/middle circle
pair.  Convex independence therefore rules out any third ambient point lying
on both circles.  In particular, the deleted source is provably *off* the
middle-row radius.  Conversely, a producer forcing that one named scalar
equality closes the packet immediately.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2ThreeRowMetricAuditScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2ThreeRowChainScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

private theorem signedArea2_ne_zero_of_three_distinct_mem
    {D : CounterexampleData} {u v w : ℝ²}
    (hu : u ∈ D.A) (hv : v ∈ D.A) (hw : w ∈ D.A)
    (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) :
    signedArea2 u v w ≠ 0 := by
  intro hzero
  exact D.convex.not_three_collinear hu hv hw huv huw hvw
    (collinear_of_signedArea2_eq_zero _ _ _ hzero)

private theorem named_x_mem_middle
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.x ∈ C.B₂ :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.x_mem_liveStrict).1).1).1

private theorem named_y_mem_middle
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.y ∈ C.B₂ :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.y_mem_liveStrict).1).1).1

private theorem named_x_mem_live
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.x_mem_liveStrict).1).1).2

private theorem named_y_mem_live
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.y ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.y_mem_liveStrict).1).1).2

private theorem named_s_mem_middle
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.s ∈ C.B₂ :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp N.s_mem_supportOnly).1).1

private theorem named_t_mem_middle
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.t ∈ C.B₂ :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp N.t_mem_supportOnly).1).1

private theorem named_s_mem_deletedSupport
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.s ∈ deletedCriticalSupport C :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp N.s_mem_supportOnly).1).2

private theorem named_t_mem_deletedSupport
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    N.t ∈ deletedCriticalSupport C :=
  (Finset.mem_inter.mp
    (Finset.mem_sdiff.mp N.t_mem_supportOnly).1).2

/-- Two distinct common points of the middle row and the deleted source's
exact critical shell force the deleted source itself off the middle radius.

This statement is independent of the live/support strict-cell split. -/
theorem deleted_off_middle_radius_of_two_deletedSupport_hits
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (htwo :
      2 ≤ (C.B₂ ∩ deletedCriticalSupport C).card) :
    dist center₂ deleted ≠ C.row₂.radius := by
  intro hdeletedMiddle
  have hone : 1 < (C.B₂ ∩ deletedCriticalSupport C).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hs, t, ht, hst⟩
  have hsB : s ∈ C.B₂ := (Finset.mem_inter.mp hs).1
  have htB : t ∈ C.B₂ := (Finset.mem_inter.mp ht).1
  have hsSupport : s ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp hs).2
  have htSupport : t ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp ht).2
  let K := (H.selectedAt deleted C.q_mem_A).toCriticalFourShell
  have hsK : s ∈ K.support := by
    simpa [K, deletedCriticalSupport] using hsSupport
  have htK : t ∈ K.support := by
    simpa [K, deletedCriticalSupport] using htSupport
  have hsA : s ∈ D.A := K.support_subset_A hsK
  have htA : t ∈ D.A := K.support_subset_A htK
  have hdeletedA : deleted ∈ D.A := K.q_mem_A
  have hs_ne_deleted : s ≠ deleted := by
    intro h
    have hdeletedB : deleted ∈ C.B₂ := by
      simpa only [h] using hsB
    exact C.row₂.q_not_mem hdeletedB
  have ht_ne_deleted : t ≠ deleted := by
    intro h
    have hdeletedB : deleted ∈ C.B₂ := by
      simpa only [h] using htB
    exact C.row₂.q_not_mem hdeletedB
  have harea : signedArea2 s t deleted ≠ 0 :=
    signedArea2_ne_zero_of_three_distinct_mem
      hsA htA hdeletedA hst hs_ne_deleted ht_ne_deleted
  have hc_st :
      dist (H.centerAt deleted C.q_mem_A) s =
        dist (H.centerAt deleted C.q_mem_A) t :=
    (K.support_eq_radius s hsK).trans
      (K.support_eq_radius t htK).symm
  have hc_sdeleted :
      dist (H.centerAt deleted C.q_mem_A) s =
        dist (H.centerAt deleted C.q_mem_A) deleted :=
    (K.support_eq_radius s hsK).trans
      (K.support_eq_radius deleted K.q_mem_support).symm
  have ha_st : dist center₂ s = dist center₂ t :=
    (C.row₂.same_radius s hsB).trans
      (C.row₂.same_radius t htB).symm
  have ha_sdeleted : dist center₂ s = dist center₂ deleted :=
    (C.row₂.same_radius s hsB).trans hdeletedMiddle.symm
  exact C.actual_blocker_ne_center₂
    (eq_of_equidistant_three_noncollinear
      harea hc_st hc_sdeleted ha_st ha_sdeleted)

/-- Every exact F2 profile, before the strict-cell trichotomy is split, has
the two deleted-support hits needed by
`deleted_off_middle_radius_of_two_deletedSupport_hits`. -/
theorem twoLiveExactCover_deleted_off_middle_radius
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C) :
    dist S.oppApex2 deleted ≠ C.row₂.radius := by
  apply deleted_off_middle_radius_of_two_deletedSupport_hits C
  rw [F2.failure.inter_support_card]

/-- Branch-uniform one-scalar producer boundary for F2. -/
theorem false_of_twoLiveExactCover_deleted_middle_radius_hit
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (hdeleted :
      dist S.oppApex2 deleted = C.row₂.radius) :
    False :=
  twoLiveExactCover_deleted_off_middle_radius S W C F2 hdeleted

/-- The exact equal-radius equations supplied by the three named rows. -/
theorem named_metric_equalities
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    dist p N.x = dist p N.y ∧
      dist S.oppApex2 N.x = dist S.oppApex2 N.y ∧
      dist S.oppApex2 N.x = dist S.oppApex2 N.s ∧
      dist S.oppApex2 N.x = dist S.oppApex2 N.t ∧
      dist (W.H.centerAt deleted C.q_mem_A) N.s =
        dist (W.H.centerAt deleted C.q_mem_A) N.t := by
  let L := W.liveRow.toCriticalFourShell
  let K := (W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell
  have hxL : N.x ∈ L.support := by
    simpa [L, W.liveRow_support] using named_x_mem_live N
  have hyL : N.y ∈ L.support := by
    simpa [L, W.liveRow_support] using named_y_mem_live N
  have hsK : N.s ∈ K.support := by
    simpa [K, deletedCriticalSupport] using named_s_mem_deletedSupport N
  have htK : N.t ∈ K.support := by
    simpa [K, deletedCriticalSupport] using named_t_mem_deletedSupport N
  exact ⟨
    (L.support_eq_radius N.x hxL).trans
      (L.support_eq_radius N.y hyL).symm,
    (C.row₂.same_radius N.x (named_x_mem_middle N)).trans
      (C.row₂.same_radius N.y (named_y_mem_middle N)).symm,
    (C.row₂.same_radius N.x (named_x_mem_middle N)).trans
      (C.row₂.same_radius N.s (named_s_mem_middle N)).symm,
    (C.row₂.same_radius N.x (named_x_mem_middle N)).trans
      (C.row₂.same_radius N.t (named_t_mem_middle N)).symm,
    (K.support_eq_radius N.s hsK).trans
      (K.support_eq_radius N.t htK).symm⟩

/-- Any third point of the exact live shell cannot also lie on the middle
row's radius circle. -/
theorem liveShell_third_point_off_middle_radius
    {D : CounterexampleData} {p q t1 t2 t3 deleted z : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P)
    (hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²))
    (hxz : N.x ≠ z) (hyz : N.y ≠ z) :
    dist S.oppApex2 z ≠ C.row₂.radius := by
  intro hzMiddle
  let L := W.liveRow.toCriticalFourShell
  have hxL : N.x ∈ L.support := by
    simpa [L, W.liveRow_support] using named_x_mem_live N
  have hyL : N.y ∈ L.support := by
    simpa [L, W.liveRow_support] using named_y_mem_live N
  have hzL : z ∈ L.support := by
    simpa [L, W.liveRow_support] using hzLive
  have hxA : N.x ∈ D.A :=
    L.support_subset_A hxL
  have hyA : N.y ∈ D.A :=
    L.support_subset_A hyL
  have hzA : z ∈ D.A :=
    L.support_subset_A hzL
  have harea : signedArea2 N.x N.y z ≠ 0 :=
    signedArea2_ne_zero_of_three_distinct_mem
      hxA hyA hzA N.x_ne_y hxz hyz
  have hp_xy : dist p N.x = dist p N.y :=
    (L.support_eq_radius N.x hxL).trans
      (L.support_eq_radius N.y hyL).symm
  have hp_xz : dist p N.x = dist p z :=
    (L.support_eq_radius N.x hxL).trans
      (L.support_eq_radius z hzL).symm
  have ha_xy : dist S.oppApex2 N.x = dist S.oppApex2 N.y :=
    (C.row₂.same_radius N.x (named_x_mem_middle N)).trans
      (C.row₂.same_radius N.y (named_y_mem_middle N)).symm
  have ha_xz : dist S.oppApex2 N.x = dist S.oppApex2 z :=
    (C.row₂.same_radius N.x (named_x_mem_middle N)).trans hzMiddle.symm
  exact P.centers_pairwise.1
    (eq_of_equidistant_three_noncollinear
      harea hp_xy hp_xz ha_xy ha_xz)

/-- Any third point of the exact deleted critical shell cannot also lie on
the middle row's radius circle. -/
theorem deletedSupport_third_point_off_middle_radius
    {D : CounterexampleData} {p q t1 t2 t3 deleted z : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P)
    (hzSupport : z ∈ deletedCriticalSupport C)
    (hsz : N.s ≠ z) (htz : N.t ≠ z) :
    dist S.oppApex2 z ≠ C.row₂.radius := by
  intro hzMiddle
  let K := (W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell
  have hsK : N.s ∈ K.support := by
    simpa [K, deletedCriticalSupport] using named_s_mem_deletedSupport N
  have htK : N.t ∈ K.support := by
    simpa [K, deletedCriticalSupport] using named_t_mem_deletedSupport N
  have hzK : z ∈ K.support := by
    simpa [K, deletedCriticalSupport] using hzSupport
  have hsA : N.s ∈ D.A :=
    K.support_subset_A hsK
  have htA : N.t ∈ D.A :=
    K.support_subset_A htK
  have hzA : z ∈ D.A :=
    K.support_subset_A hzK
  have harea : signedArea2 N.s N.t z ≠ 0 :=
    signedArea2_ne_zero_of_three_distinct_mem
      hsA htA hzA N.s_ne_t hsz htz
  have hc_st :
      dist (W.H.centerAt deleted C.q_mem_A) N.s =
        dist (W.H.centerAt deleted C.q_mem_A) N.t :=
    (K.support_eq_radius N.s hsK).trans
      (K.support_eq_radius N.t htK).symm
  have hc_sz :
      dist (W.H.centerAt deleted C.q_mem_A) N.s =
        dist (W.H.centerAt deleted C.q_mem_A) z :=
    (K.support_eq_radius N.s hsK).trans
      (K.support_eq_radius z hzK).symm
  have ha_st : dist S.oppApex2 N.s = dist S.oppApex2 N.t :=
    (C.row₂.same_radius N.s (named_s_mem_middle N)).trans
      (C.row₂.same_radius N.t (named_t_mem_middle N)).symm
  have ha_sz : dist S.oppApex2 N.s = dist S.oppApex2 z :=
    (C.row₂.same_radius N.s (named_s_mem_middle N)).trans hzMiddle.symm
  exact P.centers_pairwise.2.2
    (eq_of_equidistant_three_noncollinear
      harea hc_st hc_sz ha_st ha_sz)

/-- The source-faithful packet already proves that the deleted source is off
the middle-row circle. -/
theorem deleted_off_middle_radius
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P) :
    dist S.oppApex2 deleted ≠ C.row₂.radius := by
  have hs_ne_deleted : N.s ≠ deleted := by
    intro h
    have hdeletedMiddle : deleted ∈ C.B₂ := by
      simpa only [h] using named_s_mem_middle N
    exact P.deleted_not_mem_middle hdeletedMiddle
  have ht_ne_deleted : N.t ≠ deleted := by
    intro h
    have hdeletedMiddle : deleted ∈ C.B₂ := by
      simpa only [h] using named_t_mem_middle N
    exact P.deleted_not_mem_middle hdeletedMiddle
  exact deletedSupport_third_point_off_middle_radius N
    P.deleted_mem_deletedSupport hs_ne_deleted ht_ne_deleted

/-- Canonical one-scalar producer boundary: forcing the actual deleted source
onto the middle-row radius closes the live-heavy F2 packet immediately. -/
theorem false_of_deleted_middle_radius_hit
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : SourceFaithfulF2ThreeRowChain S W C}
    (N : NamedF2TwoTwoWitnesses P)
    (hdeleted :
      dist S.oppApex2 deleted = C.row₂.radius) :
    False :=
  deleted_off_middle_radius N hdeleted

#print axioms named_metric_equalities
#print axioms deleted_off_middle_radius_of_two_deletedSupport_hits
#print axioms twoLiveExactCover_deleted_off_middle_radius
#print axioms false_of_twoLiveExactCover_deleted_middle_radius_hit
#print axioms liveShell_third_point_off_middle_radius
#print axioms deletedSupport_third_point_off_middle_radius
#print axioms deleted_off_middle_radius
#print axioms false_of_deleted_middle_radius_hit

end ATailRF2ThreeRowMetricAuditScratch
end Problem97
