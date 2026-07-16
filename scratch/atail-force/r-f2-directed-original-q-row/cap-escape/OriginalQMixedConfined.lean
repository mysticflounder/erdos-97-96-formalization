/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOutsideMiddleSplit

/-!
# Scratch: exact mixed-boundary confined-support classifier

On the mixed F2 boundary, the outside-middle split either produces a genuine
common-deletion successor or forces both support-only middle-row points `s,t`
into an exact original-`q` generated row centered at the strict live point
`x`.

This file classifies the confined branch by the exact constructor of the
physical middle row and the exact constructor of the generated row.  It
closes every source-forced three-common-point case and records the remaining
two-common-point configurations without adding a named incidence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQMixedConfinedScratch

open ATailContinuationBankMatchScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- Three distinct points common to a completed generated row and the exact
physical middle row contradict the two-circle intersection bound. -/
private theorem false_of_three_common_generated_physical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center a b c : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (source : OriginalQGeneratedCenterProfile (S := S) W center)
    (G : ExactGeneratedAt D q center)
    (hcenterMiddle : center ∈ C.B₂)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (haGenerated :
      a ∈
        (G.fullSelectedFourClass source.source.q_mem_A
          source.center_ne_source).support)
    (hbGenerated :
      b ∈
        (G.fullSelectedFourClass source.source.q_mem_A
          source.center_ne_source).support)
    (hcGenerated :
      c ∈
        (G.fullSelectedFourClass source.source.q_mem_A
          source.center_ne_source).support)
    (haMiddle : a ∈ C.B₂)
    (hbMiddle : b ∈ C.B₂)
    (hcMiddle : c ∈ C.B₂) :
    False := by
  let Kgenerated :=
    G.fullSelectedFourClass source.source.q_mem_A source.center_ne_source
  let Kphysical :=
    ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
      C
  have hcenters : center ≠ S.oppApex2 := by
    intro h
    apply Kphysical.center_not_mem
    change S.oppApex2 ∈ C.B₂
    simpa [← h] using hcenterMiddle
  have hthree : ({a, b, c} : Finset ℝ²).card = 3 := by
    rw [Finset.card_eq_three]
    exact ⟨a, b, c, hab, hac, hbc, rfl⟩
  have hsub :
      ({a, b, c} : Finset ℝ²) ⊆
        Kgenerated.support ∩ Kphysical.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨by simpa [Kgenerated] using haGenerated,
          by simpa [Kphysical] using haMiddle⟩
    · exact Finset.mem_inter.mpr
        ⟨by simpa [Kgenerated] using hbGenerated,
          by simpa [Kphysical] using hbMiddle⟩
    · exact Finset.mem_inter.mpr
        ⟨by simpa [Kgenerated] using hcGenerated,
          by simpa [Kphysical] using hcMiddle⟩
  have hinter :
      (Kgenerated.support ∩ Kphysical.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Kgenerated Kphysical hcenters
  have hle := Finset.card_le_card hsub
  rw [hthree] at hle
  omega

/-- Exact unresolved mixed-boundary constructor combinations after both
support-only hits have been consumed.

The physical constructor is named first and the generated constructor
second. In the two physical-q-deleted residuals, the third physical live
point `y` is recorded as absent from the generated support; its presence
would already give three common points and `False`. -/
inductive MixedConfinedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary) : Type
  | physicalQCritical_generatedQDeleted
      (y_eq_q : N.y = q)
      (physical :
        U5QCriticalTripleClass D q S.oppApex2 (C.B₂.erase q))
      (physical_support_eq : C.B₂.erase q = {N.x, N.s, N.t})
      (generated : ExactQDeletedAt D q N.x)
      (s_mem_generated : N.s ∈ generated.support)
      (t_mem_generated : N.t ∈ generated.support) :
      MixedConfinedResidual N
  | physicalQDeleted_generatedQDeleted
      (y_mem_dangerousTriple :
        N.y ∈ ({t1, t2, t3} : Finset ℝ²))
      (q_not_mem_middle : q ∉ C.B₂)
      (physical : U5QDeletedK4Class D q S.oppApex2 C.B₂)
      (generated : ExactQDeletedAt D q N.x)
      (s_mem_generated : N.s ∈ generated.support)
      (t_mem_generated : N.t ∈ generated.support)
      (y_not_mem_generated : N.y ∉ generated.support) :
      MixedConfinedResidual N
  | physicalQDeleted_generatedQCritical
      (y_mem_dangerousTriple :
        N.y ∈ ({t1, t2, t3} : Finset ℝ²))
      (q_not_mem_middle : q ∉ C.B₂)
      (physical : U5QDeletedK4Class D q S.oppApex2 C.B₂)
      (generated : ExactQCriticalAt D q N.x)
      (s_mem_generated : N.s ∈ generated.support)
      (t_mem_generated : N.t ∈ generated.support)
      (y_not_mem_generated : N.y ∉ generated.support) :
      MixedConfinedResidual N

/-- Exact two-by-two constructor classifier for the confined mixed branch.

The physical-q-critical/generated-q-critical cell closes unconditionally
through the common points `q,s,t`. In either physical-q-deleted cell, a
generated hit at `y` closes through `y,s,t`; otherwise that omission is the
honest residual. -/
theorem false_or_nonempty_mixedConfinedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    (source : OriginalQGeneratedCenterProfile (S := S) W N.x)
    (G : ExactGeneratedAt D q N.x)
    (physical : AnchoredF2MixedOriginalQBranch N)
    (hs : N.s ∈ G.support)
    (ht : N.t ∈ G.support) :
    False ∨ Nonempty (MixedConfinedResidual N) := by
  have hxMiddle : N.x ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.x_mem_liveStrict).1).1).1
  have hyMiddle : N.y ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp N.y_mem_liveOnly).1).1
  have hsMiddle : N.s ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.s_mem_supportStrict).1).1).1
  have htMiddle : N.t ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp N.t_mem_supportOnly).1).1
  cases physical with
  | qCritical y_eq_q physical physical_support_eq =>
      cases G with
      | qDeleted generated =>
          exact Or.inr ⟨.physicalQCritical_generatedQDeleted
            y_eq_q physical physical_support_eq generated
            (by simpa [ExactGeneratedAt.support] using hs)
            (by simpa [ExactGeneratedAt.support] using ht)⟩
      | qCritical generated =>
          left
          let Gcritical : ExactGeneratedAt D q N.x := .qCritical generated
          have hqGenerated :
              q ∈
                (Gcritical.fullSelectedFourClass source.source.q_mem_A
                  source.center_ne_source).support := by
            simp [Gcritical, ExactGeneratedAt.fullSelectedFourClass,
              ExactGeneratedAt.qCriticalSelectedFourClass]
          have hsGenerated :
              N.s ∈
                (Gcritical.fullSelectedFourClass source.source.q_mem_A
                  source.center_ne_source).support :=
            Gcritical.support_subset_fullSelectedFourClass
              source.source.q_mem_A source.center_ne_source
              (by simpa [Gcritical, ExactGeneratedAt.support] using hs)
          have htGenerated :
              N.t ∈
                (Gcritical.fullSelectedFourClass source.source.q_mem_A
                  source.center_ne_source).support :=
            Gcritical.support_subset_fullSelectedFourClass
              source.source.q_mem_A source.center_ne_source
              (by simpa [Gcritical, ExactGeneratedAt.support] using ht)
          have hqMiddle : q ∈ C.B₂ := by
            simpa [← y_eq_q] using hyMiddle
          have hqNeS : q ≠ N.s := by
            simpa [y_eq_q] using N.y_ne_s
          have hqNeT : q ≠ N.t := by
            simpa [y_eq_q] using N.y_ne_t
          exact false_of_three_common_generated_physical
            C source Gcritical hxMiddle
            hqNeS hqNeT N.s_ne_t
            hqGenerated hsGenerated htGenerated
            hqMiddle hsMiddle htMiddle
  | qDeleted y_mem_dangerousTriple q_not_mem_middle physical =>
      cases G with
      | qDeleted generated =>
          by_cases hy : N.y ∈ generated.support
          · left
            let Gdeleted : ExactGeneratedAt D q N.x := .qDeleted generated
            exact false_of_three_common_generated_physical
              C source Gdeleted hxMiddle
              N.y_ne_s N.y_ne_t N.s_ne_t
              (Gdeleted.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gdeleted, ExactGeneratedAt.support] using hy))
              (Gdeleted.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gdeleted, ExactGeneratedAt.support] using hs))
              (Gdeleted.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gdeleted, ExactGeneratedAt.support] using ht))
              hyMiddle hsMiddle htMiddle
          · exact Or.inr ⟨.physicalQDeleted_generatedQDeleted
              y_mem_dangerousTriple q_not_mem_middle physical generated
              (by simpa [ExactGeneratedAt.support] using hs)
              (by simpa [ExactGeneratedAt.support] using ht) hy⟩
      | qCritical generated =>
          by_cases hy : N.y ∈ generated.support
          · left
            let Gcritical : ExactGeneratedAt D q N.x := .qCritical generated
            exact false_of_three_common_generated_physical
              C source Gcritical hxMiddle
              N.y_ne_s N.y_ne_t N.s_ne_t
              (Gcritical.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gcritical, ExactGeneratedAt.support] using hy))
              (Gcritical.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gcritical, ExactGeneratedAt.support] using hs))
              (Gcritical.support_subset_fullSelectedFourClass
                source.source.q_mem_A source.center_ne_source
                (by simpa [Gcritical, ExactGeneratedAt.support] using ht))
              hyMiddle hsMiddle htMiddle
          · exact Or.inr ⟨.physicalQDeleted_generatedQCritical
              y_mem_dangerousTriple q_not_mem_middle physical generated
              (by simpa [ExactGeneratedAt.support] using hs)
              (by simpa [ExactGeneratedAt.support] using ht) hy⟩

/-- Apply the exact classifier directly to the checked generated profile. -/
theorem OriginalQOffLiveGeneratedProfile.false_or_nonempty_mixedConfinedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W N.x)
    (physical : AnchoredF2MixedOriginalQBranch N)
    (hs : N.s ∈ G.generated.support)
    (ht : N.t ∈ G.generated.support) :
    False ∨ Nonempty (MixedConfinedResidual N) :=
  ATailRF2OriginalQMixedConfinedScratch.false_or_nonempty_mixedConfinedResidual
    N G.source_profile G.generated physical hs ht

/-- Complete mixed-boundary route surface for one checked generated profile:
an outside-middle common-deletion successor, a closed constructor cell, or
one of the three exact two-common-point residuals. -/
theorem outsideMiddleSuccessor_or_false_or_mixedConfinedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W N.x) :
    Nonempty (OriginalQOutsideMiddleSuccessor C G) ∨
      False ∨
      Nonempty (MixedConfinedResidual N) := by
  rcases
      ATailRF2OriginalQOutsideMiddleSplitScratch.NamedF2MixedWitnesses.outsideMiddleSuccessor_or_bothSupportOnlyHits
        N G with
    hsuccessor | ⟨hs, ht⟩
  · exact Or.inl hsuccessor
  · rcases nonempty_anchoredF2MixedOriginalQBranch N with ⟨physical⟩
    rcases
        ATailRF2OriginalQMixedConfinedScratch.OriginalQOffLiveGeneratedProfile.false_or_nonempty_mixedConfinedResidual
          N G physical hs ht with
      hfalse | hresidual
    · exact Or.inr (Or.inl hfalse)
    · exact Or.inr (Or.inr hresidual)

#print axioms false_or_nonempty_mixedConfinedResidual
#print axioms
  OriginalQOffLiveGeneratedProfile.false_or_nonempty_mixedConfinedResidual
#print axioms outsideMiddleSuccessor_or_false_or_mixedConfinedResidual

end ATailRF2OriginalQMixedConfinedScratch
end Problem97
