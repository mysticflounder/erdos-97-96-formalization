/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOffLiveDeficit
import F2LiveHeavyPlacementAudit

/-!
# Scratch: cap escape for live-heavy original-q generated rows

At either named strict second-cap center in the live-heavy branch, global K4
for deletion of the original live source `q` gives a q-deleted four-row or a
q-critical triple.

The q-deleted row always has a support point outside both the retained live
row and `oppCap2`.  The q-critical row has the same escape unless its only
off-cap support point is the retained coherent source.  In that residual, the
completed generated row and the retained live row share the two outside-cap
points `q` and the coherent source, so the existing ordered-cap terminal
gives `False`.

No support omission is interpreted as deletion survival, and no named support
hit is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCapEscapeScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Any completed exact generated row centered in strict `oppCap2` has at
least two support points outside `oppCap2`. -/
theorem ExactGeneratedAt.two_le_fullSupport_sdiff_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {deleted center : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeletedA : deleted ∈ D.A)
    (hcenterStrict : center ∈ strictSecondCap S)
    (hcenter_ne_deleted : center ≠ deleted) :
    2 ≤
      ((G.fullSelectedFourClass hdeletedA hcenter_ne_deleted).support \
        S.oppCap2).card := by
  let K := G.fullSelectedFourClass hdeletedA hcenter_ne_deleted
  have hcenterCap : center ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hcenterStrict).1
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hinter : (K.support ∩ S.oppCap2).card ≤ 2 := by
    rw [← hcapEq]
    apply CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 K
    simpa only [hcapEq] using hcenterCap
  have hsplit := Finset.card_sdiff_add_card_inter K.support S.oppCap2
  have hcard : K.support.card = 4 := K.support_card
  have htwo : 2 ≤ (K.support \ S.oppCap2).card := by omega
  simpa [K] using htwo

/-- The two named live-heavy points witness the two-live-strict hypothesis
used by the checked cap-placement theorem. -/
theorem AnchoredF2LiveHeavyReduction.two_le_liveStrictCell
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    2 ≤
      (liveOnlyCell (alignedSharedRowPacket X hcenter).B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport (alignedSharedRowPacket X hcenter)) ∩
          strictSecondCap S).card := by
  have hone :
      1 <
        (liveOnlyCell (alignedSharedRowPacket X hcenter).B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport (alignedSharedRowPacket X hcenter)) ∩
            strictSecondCap S).card :=
    Finset.one_lt_card.mpr
      ⟨K.named.x, K.named.x_mem_liveStrict,
        K.named.y, K.named.y_mem_liveStrict, K.named.x_ne_y⟩
  omega

/-- Live-heavy cap saturation places the live blocker in strict `oppCap2`
and forces both the original source and coherent source outside `oppCap2`. -/
theorem AnchoredF2LiveHeavyReduction.liveCapFacts
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    p ∈ strictSecondCap S ∧
      q ∉ S.oppCap2 ∧
      R.sourcePair.x ∉ S.oppCap2 := by
  let C := alignedSharedRowPacket X hcenter
  have htwo :=
    ATailRF2OriginalQCapEscapeScratch.AnchoredF2LiveHeavyReduction.two_le_liveStrictCell
      K
  have hpStrict :
      p ∈ strictSecondCap S :=
    twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap
      S W C P.profile htwo
  have hsat :
      (W.liveRow.toCriticalFourShell.support ∩ S.oppCap2).card = 2 :=
    twoLiveExactCover_two_liveStrict_saturates_oppCap2
      S W C P.profile htwo
  have hxLive :
      K.named.x ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hyLive :
      K.named.y ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  have hqLive :
      q ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    simp
  have hrLive :
      R.sourcePair.x ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem P.coherent_source_mem_dangerousTriple
  have hxCap : K.named.x ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1
  have hyCap : K.named.y ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1
  have hqNeX : q ≠ K.named.x := by
    intro h
    exact liveSource_not_mem_dangerousTriple W
      (h ▸ K.named.x_mem_dangerousTriple)
  have hqNeY : q ≠ K.named.y := by
    intro h
    exact liveSource_not_mem_dangerousTriple W
      (h ▸ K.named.y_mem_dangerousTriple)
  have hqOff : q ∉ S.oppCap2 := by
    intro hqCap
    have hsub :
        ({K.named.x, K.named.y, q} : Finset ℝ²) ⊆
          W.liveRow.toCriticalFourShell.support ∩ S.oppCap2 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hxLive, hxCap⟩
      · exact Finset.mem_inter.mpr ⟨hyLive, hyCap⟩
      · exact Finset.mem_inter.mpr ⟨hqLive, hqCap⟩
    have hthree :
        ({K.named.x, K.named.y, q} : Finset ℝ²).card = 3 := by
      rw [Finset.card_eq_three]
      exact ⟨K.named.x, K.named.y, q, K.named.x_ne_y,
        hqNeX.symm, hqNeY.symm, rfl⟩
    have hle := Finset.card_le_card hsub
    rw [hthree, hsat] at hle
    omega
  have hrOff : R.sourcePair.x ∉ S.oppCap2 := by
    intro hrCap
    have hsub :
        ({K.named.x, K.named.y, R.sourcePair.x} : Finset ℝ²) ⊆
          W.liveRow.toCriticalFourShell.support ∩ S.oppCap2 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hxLive, hxCap⟩
      · exact Finset.mem_inter.mpr ⟨hyLive, hyCap⟩
      · exact Finset.mem_inter.mpr ⟨hrLive, hrCap⟩
    have hthree :
        ({K.named.x, K.named.y, R.sourcePair.x} : Finset ℝ²).card = 3 := by
      rw [Finset.card_eq_three]
      exact ⟨K.named.x, K.named.y, R.sourcePair.x, K.named.x_ne_y,
        K.coherent_source_ne_x.symm, K.coherent_source_ne_y.symm, rfl⟩
    have hle := Finset.card_le_card hsub
    rw [hthree, hsat] at hle
    omega
  exact ⟨hpStrict, hqOff, hrOff⟩

/-- If a generated original-`q` support has no point simultaneously outside
the live row and `oppCap2`, every off-cap support point is the coherent
source. -/
theorem ExactGeneratedAt.support_sdiff_oppCap2_subset_coherentSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (G : ExactGeneratedAt D q center)
    (hno :
      ¬ ∃ z : ℝ²,
          z ∈ G.support ∧
          z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          z ∉ S.oppCap2) :
    G.support \ S.oppCap2 ⊆ ({R.sourcePair.x} : Finset ℝ²) := by
  intro z hz
  have hzSupport : z ∈ G.support := (Finset.mem_sdiff.mp hz).1
  have hzOffCap : z ∉ S.oppCap2 := (Finset.mem_sdiff.mp hz).2
  have hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    by_contra hzOffLive
    exact hno ⟨z, hzSupport, hzOffLive, hzOffCap⟩
  have hzRoles :
      z = q ∨ z = K.named.x ∨ z = K.named.y ∨ z = R.sourcePair.x := by
    simpa [K.dangerous_triple_eq] using hzLive
  rcases hzRoles with rfl | rfl | rfl | hr
  · exact False.elim (G.support_not_mem_deleted hzSupport)
  · exact False.elim <| hzOffCap <|
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1
  · exact False.elim <| hzOffCap <|
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1
  · exact Finset.mem_singleton.mpr hr

/-- The q-deleted constructor always has a genuine off-live, off-`oppCap2`
support point. -/
theorem qDeleted_exists_offLive_offOppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (Q : ExactQDeletedAt D q center) :
    ∃ z : ℝ²,
      z ∈ Q.support ∧
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
      z ∉ S.oppCap2 := by
  by_contra hno
  have hno' :
      ¬ ∃ z : ℝ²,
          z ∈ (ExactGeneratedAt.qDeleted Q).support ∧
          z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          z ∉ S.oppCap2 := by
    simpa [ExactGeneratedAt.support] using hno
  have hsub :
      Q.support \ S.oppCap2 ⊆ ({R.sourcePair.x} : Finset ℝ²) := by
    simpa [ExactGeneratedAt.support] using
      ExactGeneratedAt.support_sdiff_oppCap2_subset_coherentSingleton
        K (.qDeleted Q) hno'
  have htwo : 2 ≤ (Q.support \ S.oppCap2).card := by
    simpa [ExactGeneratedAt.fullSelectedFourClass,
      ExactGeneratedAt.qDeletedSelectedFourClass] using
      ExactGeneratedAt.two_le_fullSupport_sdiff_oppCap2
        (S := S) (.qDeleted Q) source.source.q_mem_A
        source.center_mem_strictSecondCap source.center_ne_source
  have hle := Finset.card_le_card hsub
  simp only [Finset.card_singleton] at hle
  omega

/-- In the q-critical constructor, absence of a genuine cap escape forces
the coherent source into the generated support, and the banked two-row
outside-pair theorem closes the branch. -/
theorem false_or_qCritical_exists_offLive_offOppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (Q : ExactQCriticalAt D q center) :
    False ∨
      ∃ z : ℝ²,
        z ∈ Q.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ∉ S.oppCap2 := by
  by_cases hescape :
      ∃ z : ℝ²,
        z ∈ Q.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ∉ S.oppCap2
  · exact Or.inr hescape
  · left
    let G : ExactGeneratedAt D q center := .qCritical Q
    let Kfull : SelectedFourClass D.A center :=
      G.fullSelectedFourClass source.source.q_mem_A source.center_ne_source
    have htwoFull :
        2 ≤ (Kfull.support \ S.oppCap2).card := by
      simpa [Kfull, G] using
        ATailRF2OriginalQCapEscapeScratch.ExactGeneratedAt.two_le_fullSupport_sdiff_oppCap2
          G
          source.source.q_mem_A source.center_mem_strictSecondCap
          source.center_ne_source
    have hone :
        1 ≤ (Q.support \ S.oppCap2).card := by
      by_contra hnone
      have hzero : (Q.support \ S.oppCap2).card = 0 := by omega
      have hsub :
          Kfull.support \ S.oppCap2 ⊆ ({q} : Finset ℝ²) := by
        intro z hz
        have hzFull : z ∈ Kfull.support := (Finset.mem_sdiff.mp hz).1
        have hzOffCap : z ∉ S.oppCap2 := (Finset.mem_sdiff.mp hz).2
        have hzInsert : z ∈ insert q Q.support := by
          simpa [Kfull, G, ExactGeneratedAt.fullSelectedFourClass,
            ExactGeneratedAt.qCriticalSelectedFourClass] using hzFull
        rcases Finset.mem_insert.mp hzInsert with hzq | hzQ
        · exact Finset.mem_singleton.mpr hzq
        · have hzOutside : z ∈ Q.support \ S.oppCap2 :=
            Finset.mem_sdiff.mpr ⟨hzQ, hzOffCap⟩
          have hempty : Q.support \ S.oppCap2 = ∅ :=
            Finset.card_eq_zero.mp hzero
          rw [hempty] at hzOutside
          simp at hzOutside
      have hle := Finset.card_le_card hsub
      simp only [Finset.card_singleton] at hle
      omega
    have hno' :
        ¬ ∃ z : ℝ²,
            z ∈ G.support ∧
            z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
            z ∉ S.oppCap2 := by
      simpa [G, ExactGeneratedAt.support] using hescape
    have hsub :
        Q.support \ S.oppCap2 ⊆ ({R.sourcePair.x} : Finset ℝ²) := by
      simpa [G, ExactGeneratedAt.support] using
        ATailRF2OriginalQCapEscapeScratch.ExactGeneratedAt.support_sdiff_oppCap2_subset_coherentSingleton
          K G hno'
    rcases Finset.card_pos.mp (by omega : 0 < (Q.support \ S.oppCap2).card) with
      ⟨z, hzOutside⟩
    have hzSingleton := hsub hzOutside
    have hzEq : z = R.sourcePair.x :=
      Finset.mem_singleton.mp hzSingleton
    have hrQ : R.sourcePair.x ∈ Q.support := by
      simpa [hzEq] using (Finset.mem_sdiff.mp hzOutside).1
    let Klive : SelectedFourClass D.A p := W.liveRow.toSelectedFourClass
    have hqFull : q ∈ Kfull.support := by
      simp [Kfull, G, ExactGeneratedAt.fullSelectedFourClass,
        ExactGeneratedAt.qCriticalSelectedFourClass]
    have hrFull : R.sourcePair.x ∈ Kfull.support := by
      exact Finset.mem_insert_of_mem hrQ
    have hqLive : q ∈ Klive.support := by
      change q ∈ W.liveRow.toCriticalFourShell.support
      rw [W.liveRow_support]
      simp
    have hrLive : R.sourcePair.x ∈ Klive.support := by
      change R.sourcePair.x ∈ W.liveRow.toCriticalFourShell.support
      rw [W.liveRow_support]
      exact Finset.mem_insert_of_mem P.coherent_source_mem_dangerousTriple
    have hpNeCenter : p ≠ center := by
      intro h
      apply source.source_row_center_ne_generated_center
      rw [source.source.source_row_center_eq_p]
      exact h
    have hcap :=
      ATailRF2OriginalQCapEscapeScratch.AnchoredF2LiveHeavyReduction.liveCapFacts
        K
    exact false_of_two_strictOppCap2_rows_common_outside_pair
      (rebasePacket D S)
      Kfull Klive
      (by simpa [rebasePacket, strictSecondCap] using
        source.center_mem_strictSecondCap)
      (by simpa [rebasePacket, strictSecondCap] using hcap.1)
      hpNeCenter.symm
      hqFull hrFull hqLive hrLive
      (by simpa [rebasePacket] using hcap.2.1)
      (by simpa [rebasePacket] using hcap.2.2)
      P.coherent_source_ne_q.symm

/-- Constructor-uniform live-heavy cap escape: every exact original-`q`
generated row either closes immediately or exposes an off-live,
off-`oppCap2` support point. -/
theorem false_or_exists_offLive_offOppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (G : ExactGeneratedAt D q center) :
    False ∨
      ∃ z : ℝ²,
        z ∈ G.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ∉ S.oppCap2 := by
  cases G with
  | qDeleted Q =>
      exact Or.inr (qDeleted_exists_offLive_offOppCap2 K source Q)
  | qCritical Q =>
      exact false_or_qCritical_exists_offLive_offOppCap2 K source Q

/-- Apply the constructor-uniform cap escape directly to the checked
`OriginalQOffLiveGeneratedProfile`. -/
theorem OriginalQOffLiveGeneratedProfile.false_or_exists_offLive_offOppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²} {radius rho : ℝ}
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
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center) :
    False ∨
      ∃ z : ℝ²,
        z ∈ G.generated.support ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        z ∉ S.oppCap2 :=
  ATailRF2OriginalQCapEscapeScratch.false_or_exists_offLive_offOppCap2
    K G.source_profile G.generated

#print axioms ExactGeneratedAt.two_le_fullSupport_sdiff_oppCap2
#print axioms AnchoredF2LiveHeavyReduction.liveCapFacts
#print axioms qDeleted_exists_offLive_offOppCap2
#print axioms false_or_qCritical_exists_offLive_offOppCap2
#print axioms false_or_exists_offLive_offOppCap2
#print axioms
  OriginalQOffLiveGeneratedProfile.false_or_exists_offLive_offOppCap2

end ATailRF2OriginalQCapEscapeScratch
end Problem97
