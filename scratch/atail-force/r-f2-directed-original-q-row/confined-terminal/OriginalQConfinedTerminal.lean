/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOutsideMiddleSplit
import OriginalQCapEscape

/-!
# Scratch: live-heavy original-q confined terminal

For an exact original-`q` generated row at either named live-heavy center,
the outside-middle split is terminal.  If no generated support point lies
outside both retained rows, the split forces both support-only points into
the generated support.  Exact constructor cardinality then supplies either
the other live-heavy center, giving three common points with the physical
middle row, or the coherent source, giving the checked ordered-cap terminal
with the retained live row.

The conclusion is therefore a genuine source-faithful outside-middle
successor.  No support omission is interpreted as deletion survival.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQConfinedTerminalScratch

open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem triple_card_le_three (a b c : ℝ²) :
    ({a, b, c} : Finset ℝ²).card ≤ 3 := by
  calc
    ({a, b, c} : Finset ℝ²).card ≤ ({b, c} : Finset ℝ²).card + 1 :=
      Finset.card_insert_le a {b, c}
    _ ≤ (({c} : Finset ℝ²).card + 1) + 1 :=
      Nat.add_le_add_right (Finset.card_insert_le b {c}) 1
    _ = 3 := by simp

/-- Three distinct common points contradict the two-circle intersection
bound for selected rows at distinct centers. -/
private theorem false_of_three_common_generated_middle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center a b c : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (G : ExactGeneratedAt D q center)
    (hcenterMiddle : center ∈ C.B₂)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (haGenerated : a ∈ G.support)
    (hbGenerated : b ∈ G.support)
    (hcGenerated : c ∈ G.support)
    (haMiddle : a ∈ C.B₂)
    (hbMiddle : b ∈ C.B₂)
    (hcMiddle : c ∈ C.B₂) :
    False := by
  let Kgenerated :=
    G.fullSelectedFourClass source.source.q_mem_A source.center_ne_source
  let Kmiddle :=
    ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
      C
  have hcenters : center ≠ S.oppApex2 := by
    intro h
    apply Kmiddle.center_not_mem
    change S.oppApex2 ∈ C.B₂
    simpa [← h] using hcenterMiddle
  have hthree : ({a, b, c} : Finset ℝ²).card = 3 := by
    rw [Finset.card_eq_three]
    exact ⟨a, b, c, hab, hac, hbc, rfl⟩
  have hsub :
      ({a, b, c} : Finset ℝ²) ⊆
        Kgenerated.support ∩ Kmiddle.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨G.support_subset_fullSelectedFourClass
            source.source.q_mem_A source.center_ne_source haGenerated,
          by simpa [Kmiddle] using haMiddle⟩
    · exact Finset.mem_inter.mpr
        ⟨G.support_subset_fullSelectedFourClass
            source.source.q_mem_A source.center_ne_source hbGenerated,
          by simpa [Kmiddle] using hbMiddle⟩
    · exact Finset.mem_inter.mpr
        ⟨G.support_subset_fullSelectedFourClass
            source.source.q_mem_A source.center_ne_source hcGenerated,
          by simpa [Kmiddle] using hcMiddle⟩
  have hinter :
      (Kgenerated.support ∩ Kmiddle.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Kgenerated Kmiddle hcenters
  have hle := Finset.card_le_card hsub
  rw [hthree] at hle
  omega

/-- Generic live-heavy confined terminal, parameterized by the selected
named center and the other named live-heavy point. -/
private theorem nonempty_confinedTerminal
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
    {center other : ℝ²}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (hlive :
      ({q, t1, t2, t3} : Finset ℝ²) =
        {q, center, other, R.sourcePair.x})
    (hmiddle :
      (alignedSharedRowPacket X hcenter).B₂ =
        {center, other, K.named.s, K.named.t})
    (hcenterStrict : center ∈ strictSecondCap S)
    (hcenter_ne_other : center ≠ other)
    (hcenter_ne_s : center ≠ K.named.s)
    (hcenter_ne_t : center ≠ K.named.t)
    (hother_ne_s : other ≠ K.named.s)
    (hother_ne_t : other ≠ K.named.t) :
    Nonempty
      (OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) := by
  let C := alignedSharedRowPacket X hcenter
  by_cases houtside :
      ∃ source : ℝ²,
        source ∈ G.generated.support ∧
          source ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          source ∉ C.B₂
  · rcases houtside with ⟨source, hsourceGenerated, hsourceLive, hsourceMiddle⟩
    exact nonempty_outsideMiddleSuccessor C G hsourceGenerated
      hsourceLive hsourceMiddle
  · have hboth :
        K.named.s ∈ G.generated.support ∧
          K.named.t ∈ G.generated.support := by
      rcases
          ATailRF2OriginalQOutsideMiddleSplitScratch.AnchoredF2LiveHeavyReduction.outsideMiddleSuccessor_or_bothSupportOnlyHits
            K G with
        hsuccessor | hboth
      · rcases hsuccessor with ⟨successor⟩
        exact False.elim <| houtside
          ⟨successor.source, successor.source_mem_generated,
            successor.source_not_mem_live,
            successor.source_not_mem_middle⟩
      · exact hboth
    have hcenterNot : center ∉ G.generated.support := by
      intro hcenterSupport
      apply
        (G.generated.fullSelectedFourClass
          G.source_profile.source.q_mem_A
          G.source_profile.center_ne_source).center_not_mem
      exact G.generated.support_subset_fullSelectedFourClass
        G.source_profile.source.q_mem_A
        G.source_profile.center_ne_source hcenterSupport
    have hmiddleC :
        C.B₂ = {center, other, K.named.s, K.named.t} := by
      simpa only [C] using hmiddle
    have hsupportSub :
        G.generated.support ⊆
          ({other, R.sourcePair.x, K.named.s, K.named.t} : Finset ℝ²) := by
      intro z hz
      by_cases hzLive : z ∈ ({q, t1, t2, t3} : Finset ℝ²)
      · have hzRoles :
            z = q ∨ z = center ∨ z = other ∨ z = R.sourcePair.x := by
          simpa [hlive] using hzLive
        rcases hzRoles with rfl | rfl | rfl | rfl
        · exact False.elim (G.generated.support_not_mem_deleted hz)
        · exact False.elim (hcenterNot hz)
        · simp
        · simp
      · have hzMiddle : z ∈ C.B₂ := by
          by_contra hzNotMiddle
          exact houtside ⟨z, hz, hzLive, hzNotMiddle⟩
        have hzRoles :
            z = center ∨ z = other ∨
              z = K.named.s ∨ z = K.named.t := by
          rw [hmiddleC] at hzMiddle
          simpa using hzMiddle
        rcases hzRoles with rfl | rfl | rfl | rfl
        · exact False.elim (hcenterNot hz)
        · simp
        · simp
        · simp
    have hcenterMiddle : center ∈ C.B₂ := by
      rw [hmiddleC]
      simp
    have hotherMiddle : other ∈ C.B₂ := by
      rw [hmiddleC]
      simp
    have hsMiddle : K.named.s ∈ C.B₂ := by
      rw [hmiddleC]
      simp
    have htMiddle : K.named.t ∈ C.B₂ := by
      rw [hmiddleC]
      simp
    cases hG : G.generated with
    | qDeleted Q =>
        have hcard : G.generated.support.card = 4 := by
          simpa [hG, ExactGeneratedAt.support] using Q.support_card
        have hother : other ∈ G.generated.support := by
          by_contra hotherNot
          have hsubThree :
              G.generated.support ⊆
                ({R.sourcePair.x, K.named.s, K.named.t} : Finset ℝ²) := by
            intro z hz
            have hzRoles :
                z = other ∨ z = R.sourcePair.x ∨
                  z = K.named.s ∨ z = K.named.t := by
              simpa using hsupportSub hz
            rcases hzRoles with rfl | rfl | rfl | rfl
            · exact False.elim (hotherNot hz)
            · simp
            · simp
            · simp
          have hle := Finset.card_le_card hsubThree
          have hthree :=
            triple_card_le_three R.sourcePair.x K.named.s K.named.t
          rw [hcard] at hle
          omega
        exact False.elim <| false_of_three_common_generated_middle
          C G.source_profile G.generated hcenterMiddle
          hother_ne_s hother_ne_t K.named.s_ne_t
          hother hboth.1 hboth.2 hotherMiddle hsMiddle htMiddle
    | qCritical Q =>
        have hcard : G.generated.support.card = 3 := by
          simpa [hG, ExactGeneratedAt.support] using Q.support_card
        have hotherOrSource :
            other ∈ G.generated.support ∨
              R.sourcePair.x ∈ G.generated.support := by
          by_contra hneither
          push_neg at hneither
          have hsubPair :
              G.generated.support ⊆
                ({K.named.s, K.named.t} : Finset ℝ²) := by
            intro z hz
            have hzRoles :
                z = other ∨ z = R.sourcePair.x ∨
                  z = K.named.s ∨ z = K.named.t := by
              simpa using hsupportSub hz
            rcases hzRoles with rfl | rfl | rfl | rfl
            · exact False.elim (hneither.1 hz)
            · exact False.elim (hneither.2 hz)
            · simp
            · simp
          have hle := Finset.card_le_card hsubPair
          rw [hcard, Finset.card_pair K.named.s_ne_t] at hle
          omega
        rcases hotherOrSource with hother | hsource
        · exact False.elim <| false_of_three_common_generated_middle
            C G.source_profile G.generated hcenterMiddle
            hother_ne_s hother_ne_t K.named.s_ne_t
            hother hboth.1 hboth.2 hotherMiddle hsMiddle htMiddle
        · let Kfull : SelectedFourClass D.A center :=
            G.generated.fullSelectedFourClass
              G.source_profile.source.q_mem_A
              G.source_profile.center_ne_source
          let Klive : SelectedFourClass D.A p :=
            W.liveRow.toSelectedFourClass
          have hqFull : q ∈ Kfull.support := by
            simp [Kfull, hG, ExactGeneratedAt.fullSelectedFourClass,
              ExactGeneratedAt.qCriticalSelectedFourClass]
          have hsourceFull : R.sourcePair.x ∈ Kfull.support :=
            G.generated.support_subset_fullSelectedFourClass
              G.source_profile.source.q_mem_A
              G.source_profile.center_ne_source hsource
          have hqLive : q ∈ Klive.support := by
            change q ∈ W.liveRow.toCriticalFourShell.support
            rw [W.liveRow_support]
            simp
          have hsourceLive : R.sourcePair.x ∈ Klive.support := by
            change R.sourcePair.x ∈ W.liveRow.toCriticalFourShell.support
            rw [W.liveRow_support]
            exact Finset.mem_insert_of_mem
              P.coherent_source_mem_dangerousTriple
          have hpNeCenter : p ≠ center := by
            intro h
            apply G.source_profile.source_row_center_ne_generated_center
            rw [G.source_profile.source.source_row_center_eq_p]
            exact h
          have hcap :=
            ATailRF2OriginalQCapEscapeScratch.AnchoredF2LiveHeavyReduction.liveCapFacts
              K
          exact False.elim <|
            false_of_two_strictOppCap2_rows_common_outside_pair
              (rebasePacket D S)
              Kfull Klive
              (by simpa [rebasePacket, strictSecondCap] using hcenterStrict)
              (by simpa [rebasePacket, strictSecondCap] using hcap.1)
              hpNeCenter.symm
              hqFull hsourceFull hqLive hsourceLive
              (by simpa [rebasePacket] using hcap.2.1)
              (by simpa [rebasePacket] using hcap.2.2)
              P.coherent_source_ne_q.symm

/-- The corrected live-heavy confinement argument at `K.named.x` yields a
genuine outside-middle successor. -/
theorem AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atX
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
    (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.x) :
    Nonempty
      (OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) := by
  have hlive :
      ({q, t1, t2, t3} : Finset ℝ²) =
        {q, K.named.x, K.named.y, R.sourcePair.x} := by
    rw [K.dangerous_triple_eq]
  exact nonempty_confinedTerminal K G hlive K.middle_row_eq
    (Finset.mem_inter.mp K.named.x_mem_liveStrict).2
    K.named.x_ne_y K.named.x_ne_s K.named.x_ne_t
    K.named.y_ne_s K.named.y_ne_t

/-- Symmetric corrected live-heavy confinement argument at `K.named.y`. -/
theorem AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atY
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
    (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.y) :
    Nonempty
      (OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) := by
  have hlive :
      ({q, t1, t2, t3} : Finset ℝ²) =
        {q, K.named.y, K.named.x, R.sourcePair.x} := by
    rw [K.dangerous_triple_eq]
    ext z
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hmiddle :
      (alignedSharedRowPacket X hcenter).B₂ =
        {K.named.y, K.named.x, K.named.s, K.named.t} := by
    rw [K.middle_row_eq]
    ext z
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  exact nonempty_confinedTerminal K G hlive hmiddle
    (Finset.mem_inter.mp K.named.y_mem_liveStrict).2
    K.named.x_ne_y.symm K.named.y_ne_s K.named.y_ne_t
    K.named.x_ne_s K.named.x_ne_t

#print axioms AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atX
#print axioms AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atY

end ATailRF2OriginalQConfinedTerminalScratch
end Problem97
