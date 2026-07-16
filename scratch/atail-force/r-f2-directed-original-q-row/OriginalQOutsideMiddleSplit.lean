/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOffLiveDeficit
import FailureProfilesParentLift
import LiveCommonDeletionExpansion
import PrescribedDeletionEdge

/-!
# Scratch: original-q outside-middle successor split

An exact original-`q` row at a named F2 center has at least two support
points outside the retained live row.  This file consumes that fact without
assigning an unsupported cap role to either point.

If one such point is outside the retained middle row, deleting it preserves
both the live row at `p` and the retained middle row at `S.oppApex2`; this is
a genuine `CommonDeletionTwoCenterPacket`.  Otherwise the exact F2 middle
row forces both named support-only points into the generated support.

The successor retains its original source, generated center and generated
support membership.  It is not asserted to be terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQOutsideMiddleSplitScratch

open ATailContinuationBankMatchScratch
open ATailPrescribedDeletionEdge
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- A generated support point outside both the retained live row and middle
row, together with the resulting common-deletion packet. -/
structure OriginalQOutsideMiddleSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center) : Type where
  source : ℝ²
  source_mem_generated : source ∈ G.generated.support
  source_not_mem_live :
    source ∉ ({q, t1, t2, t3} : Finset ℝ²)
  source_not_mem_middle : source ∉ C.B₂
  successor :
    CommonDeletionTwoCenterPacket D W.H source p S.oppApex2

/-- A generated support point outside the live and middle rows produces a
source-faithful common-deletion successor. -/
theorem nonempty_outsideMiddleSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center source : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (hsourceGenerated : source ∈ G.generated.support)
    (hsourceLive :
      source ∉ ({q, t1, t2, t3} : Finset ℝ²))
    (hsourceMiddle : source ∉ C.B₂) :
    Nonempty (OriginalQOutsideMiddleSuccessor C G) := by
  have hsourceFull :
      source ∈
        (G.generated.fullSelectedFourClass
          G.source_profile.source.q_mem_A
          G.source_profile.center_ne_source).support :=
    G.generated.support_subset_fullSelectedFourClass
      G.source_profile.source.q_mem_A
      G.source_profile.center_ne_source hsourceGenerated
  have hsourceA : source ∈ D.A :=
    (G.generated.fullSelectedFourClass
      G.source_profile.source.q_mem_A
      G.source_profile.center_ne_source).support_subset_A hsourceFull
  have hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) p :=
    ATailRLiveCommonDeletionExpansionScratch.deletion_survives_liveFirstCenter_of_not_mem_liveBase
      W hsourceLive
  have hsecond :
      HasNEquidistantPointsAt 4
        (D.A.erase source) S.oppApex2 :=
    deletion_survives_of_not_mem_selected_support
      (ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
        C) hsourceMiddle
  rcases nonempty_commonDeletionTwoCenterPacket
      W.H hsourceA C.center₁_mem_A C.center₂_mem_A C.centers_ne
      hfirst hsecond with
    ⟨successor⟩
  exact ⟨{
    source := source
    source_mem_generated := hsourceGenerated
    source_not_mem_live := hsourceLive
    source_not_mem_middle := hsourceMiddle
    successor := successor
  }⟩

/-- Exact finite alternative for any named two-live/two-support F2 row.

Either an off-live generated point lies outside the middle row and yields a
new common-deletion successor, or both named support-only points belong to
the generated support. -/
theorem outsideMiddleSuccessor_or_bothSupportOnlyHits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center x y s t : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (hxLive : x ∈ ({q, t1, t2, t3} : Finset ℝ²))
    (hyLive : y ∈ ({q, t1, t2, t3} : Finset ℝ²))
    (hst : s ≠ t)
    (hmiddle : C.B₂ = ({x, y, s, t} : Finset ℝ²)) :
    Nonempty (OriginalQOutsideMiddleSuccessor C G) ∨
      (s ∈ G.generated.support ∧ t ∈ G.generated.support) := by
  by_cases houtside :
      ∃ source : ℝ²,
        source ∈ G.generated.support ∧
          source ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          source ∉ C.B₂
  · rcases houtside with ⟨source, hsourceGenerated, hsourceLive, hsourceMiddle⟩
    exact Or.inl
      (nonempty_outsideMiddleSuccessor C G hsourceGenerated
        hsourceLive hsourceMiddle)
  · right
    let live := ({q, t1, t2, t3} : Finset ℝ²)
    let outside := G.generated.support \ live
    have houtsideMiddle : outside ⊆ C.B₂ := by
      intro z hz
      have hzGenerated : z ∈ G.generated.support :=
        (Finset.mem_sdiff.mp hz).1
      have hzLive : z ∉ live := (Finset.mem_sdiff.mp hz).2
      by_contra hzMiddle
      exact houtside
        ⟨z, hzGenerated, by simpa [live] using hzLive, hzMiddle⟩
    have houtsidePair : outside ⊆ ({s, t} : Finset ℝ²) := by
      intro z hz
      have hzMiddle : z ∈ C.B₂ := houtsideMiddle hz
      have hzRoles :
          z = x ∨ z = y ∨ z = s ∨ z = t := by
        simpa [hmiddle] using hzMiddle
      have hzLive : z ∉ live := (Finset.mem_sdiff.mp hz).2
      rcases hzRoles with rfl | rfl | rfl | rfl
      · exact False.elim (hzLive (by simpa [live] using hxLive))
      · exact False.elim (hzLive (by simpa [live] using hyLive))
      · simp
      · simp
    have hpairCard : ({s, t} : Finset ℝ²).card = 2 := by
      simp [hst]
    have hpairLe : ({s, t} : Finset ℝ²).card ≤ outside.card := by
      rw [hpairCard]
      simpa [outside, live] using G.two_off_live
    have houtsideEq : outside = ({s, t} : Finset ℝ²) :=
      Finset.eq_of_subset_of_card_le houtsidePair hpairLe
    have hsOutside : s ∈ outside := by
      rw [houtsideEq]
      simp
    have htOutside : t ∈ outside := by
      rw [houtsideEq]
      simp
    exact ⟨(Finset.mem_sdiff.mp hsOutside).1,
      (Finset.mem_sdiff.mp htOutside).1⟩

/-- Live-heavy specialization of the exact successor/both-hit split. -/
theorem AnchoredF2LiveHeavyReduction.outsideMiddleSuccessor_or_bothSupportOnlyHits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    {center : ℝ²}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center) :
    Nonempty
        (OriginalQOutsideMiddleSuccessor
          (alignedSharedRowPacket X hcenter) G) ∨
      (K.named.s ∈ G.generated.support ∧
        K.named.t ∈ G.generated.support) := by
  have hxLive :
      K.named.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hyLive :
      K.named.y ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  exact
    ATailRF2OriginalQOutsideMiddleSplitScratch.outsideMiddleSuccessor_or_bothSupportOnlyHits
    (alignedSharedRowPacket X hcenter) G hxLive hyLive
    K.named.s_ne_t K.middle_row_eq

/-- Mixed-boundary specialization of the exact successor/both-hit split. -/
theorem NamedF2MixedWitnesses.outsideMiddleSuccessor_or_bothSupportOnlyHits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    {center : ℝ²}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center) :
    Nonempty (OriginalQOutsideMiddleSuccessor C G) ∨
      (N.s ∈ G.generated.support ∧
        N.t ∈ G.generated.support) := by
  have hxLive :
      N.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert_of_mem N.x_mem_dangerousTriple
  have hyLive :
      N.y ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp N.y_mem_liveOnly).1).2
  exact
    ATailRF2OriginalQOutsideMiddleSplitScratch.outsideMiddleSuccessor_or_bothSupportOnlyHits
    C G hxLive hyLive N.s_ne_t N.middle_row_eq

#print axioms nonempty_outsideMiddleSuccessor
#print axioms outsideMiddleSuccessor_or_bothSupportOnlyHits
#print axioms
  AnchoredF2LiveHeavyReduction.outsideMiddleSuccessor_or_bothSupportOnlyHits
#print axioms
  NamedF2MixedWitnesses.outsideMiddleSuccessor_or_bothSupportOnlyHits

end ATailRF2OriginalQOutsideMiddleSplitScratch
end Problem97
