/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionCriticalExpansion

/-!
# Scratch: exact failure profiles for two off-live sources

For a common-deletion packet whose first row is the retained live dangerous
row, the second row has four points and meets each of the live row and the
deleted source's critical support in at most two points.

If fewer than two second-row points lie outside both four-sets, elementary
finite-set counting leaves exactly three profiles:

* one live-row point, two deleted-support points, and one point outside both;
* two live-row points and two deleted-support points, with no point outside;
* two live-row points and one point outside both, with the remaining
  live/support overlap split into one of two exact subprofiles.

This is a classification theorem, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTwoOffLiveFailureScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch

attribute [local instance] Classical.propDecidable

section FiniteCells

variable {α : Type*} [DecidableEq α]

/-- Points of `B` lying in both comparison sets. -/
def bothCell (B A S : Finset α) : Finset α :=
  (B ∩ A) ∩ S

/-- Points of `B` lying in `A` but not in `S`. -/
def liveOnlyCell (B A S : Finset α) : Finset α :=
  (B ∩ A) \ S

/-- Points of `B` lying in `S` but not in `A`. -/
def supportOnlyCell (B A S : Finset α) : Finset α :=
  (B ∩ S) \ A

/-- Points of `B` outside both comparison sets. -/
def outsideBothCell (B A S : Finset α) : Finset α :=
  B \ (A ∪ S)

theorem bothCell_card_add_liveOnlyCell_card
    (B A S : Finset α) :
    (bothCell B A S).card + (liveOnlyCell B A S).card =
      (B ∩ A).card := by
  have hsplit := Finset.card_sdiff_add_card_inter (B ∩ A) S
  have hcomm :
      ((B ∩ A) ∩ S).card + ((B ∩ A) \ S).card =
        ((B ∩ A) \ S).card + ((B ∩ A) ∩ S).card := by
    omega
  simpa [bothCell, liveOnlyCell] using hcomm.trans hsplit

theorem bothCell_card_add_supportOnlyCell_card
    (B A S : Finset α) :
    (bothCell B A S).card + (supportOnlyCell B A S).card =
      (B ∩ S).card := by
  have hsplit := Finset.card_sdiff_add_card_inter (B ∩ S) A
  have hinter :
      ((B ∩ S) ∩ A).card = ((B ∩ A) ∩ S).card := by
    congr 1
    ext x
    simp only [Finset.mem_inter]
    aesop
  rw [hinter] at hsplit
  have hcomm :
      ((B ∩ A) ∩ S).card + ((B ∩ S) \ A).card =
        ((B ∩ S) \ A).card + ((B ∩ A) ∩ S).card := by
    omega
  simpa [bothCell, supportOnlyCell] using hcomm.trans hsplit

theorem fourCell_card_sum
    (B A S : Finset α) :
    (bothCell B A S).card +
        (liveOnlyCell B A S).card +
        (supportOnlyCell B A S).card +
        (outsideBothCell B A S).card =
      B.card := by
  have hA := Finset.card_sdiff_add_card_inter B A
  have hS := Finset.card_sdiff_add_card_inter (B \ A) S
  have hsupport :
      ((B \ A) ∩ S).card = (supportOnlyCell B A S).card := by
    congr 1
    ext x
    simp only [Finset.mem_inter, Finset.mem_sdiff, supportOnlyCell]
    aesop
  have houtside :
      ((B \ A) \ S).card = (outsideBothCell B A S).card := by
    congr 1
    ext x
    simp only [Finset.mem_sdiff, Finset.mem_union, outsideBothCell]
    aesop
  rw [hsupport, houtside] at hS
  have hcells := bothCell_card_add_liveOnlyCell_card B A S
  omega

theorem outsideBothCell_eq_iterated_sdiff
    (B A S : Finset α) :
    outsideBothCell B A S = (B \ S) \ A := by
  ext x
  simp only [outsideBothCell, Finset.mem_sdiff, Finset.mem_union]
  aesop

end FiniteCells

section Profiles

/-- The one-live-overlap failure profile:
`1 live-only + 2 support-only + 1 outside`. -/
structure OneLiveOverlapFailureProfile
    (deleted : ℝ²) (B live support : Finset ℝ²) : Prop where
  inter_live_card :
    (B ∩ live).card = 1
  inter_support_card :
    (B ∩ support).card = 2
  both_card :
    (bothCell B live support).card = 0
  liveOnly_card :
    (liveOnlyCell B live support).card = 1
  supportOnly_card :
    (supportOnlyCell B live support).card = 2
  outsideBoth_card :
    (outsideBothCell B live support).card = 1
  support_sdiff_row_card :
    (support \ B).card = 2
  deleted_mem_support_sdiff_row :
    deleted ∈ support \ B

/-- The exact-cover failure profile:
`2 live-only + 2 support-only`, with no point outside either four-set. -/
structure TwoLiveExactCoverFailureProfile
    (deleted : ℝ²) (B live support : Finset ℝ²) : Prop where
  inter_live_card :
    (B ∩ live).card = 2
  inter_support_card :
    (B ∩ support).card = 2
  both_card :
    (bothCell B live support).card = 0
  liveOnly_card :
    (liveOnlyCell B live support).card = 2
  supportOnly_card :
    (supportOnlyCell B live support).card = 2
  outsideBoth_card :
    (outsideBothCell B live support).card = 0
  row_subset_live_union_support :
    B ⊆ live ∪ support
  support_sdiff_row_card :
    (support \ B).card = 2
  deleted_mem_support_sdiff_row :
    deleted ∈ support \ B

/-- The two-live, one-off failure profile.  Its final support incidence has
exactly two possibilities:

* `2 live-only + 1 support-only + 1 outside`; or
* `1 both + 1 live-only + 1 support-only + 1 outside`.
-/
structure TwoLiveOneOffFailureProfile
    (deleted : ℝ²) (B live support : Finset ℝ²) : Prop where
  inter_live_card :
    (B ∩ live).card = 2
  outsideBoth_card :
    (outsideBothCell B live support).card = 1
  support_split :
    ((B ∩ support).card = 1 ∧
        (bothCell B live support).card = 0 ∧
        (liveOnlyCell B live support).card = 2 ∧
        (supportOnlyCell B live support).card = 1 ∧
        (support \ B).card = 3) ∨
      ((B ∩ support).card = 2 ∧
        (bothCell B live support).card = 1 ∧
        (liveOnlyCell B live support).card = 1 ∧
        (supportOnlyCell B live support).card = 1 ∧
        (support \ B).card = 2)
  deleted_mem_support_sdiff_row :
    deleted ∈ support \ B

/-- The deleted source's selected critical support has exactly four points. -/
theorem deletedCriticalSupport_card_eq_four
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    (deletedCriticalSupport C).card = 4 := by
  simpa [deletedCriticalSupport] using
    (H.selectedAt deleted C.q_mem_A).toCriticalFourShell.support_card

/-- The deleted source belongs to its own selected critical support. -/
theorem deleted_mem_deletedCriticalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    deleted ∈ deletedCriticalSupport C := by
  simpa [deletedCriticalSupport] using
    (H.selectedAt deleted C.q_mem_A).toCriticalFourShell.q_mem_support

/-- The second q-deleted row omits the deleted source. -/
theorem deleted_not_mem_secondRow
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    deleted ∉ C.B₂ :=
  C.row₂.q_not_mem

/-- The second row meets the deleted source's selected critical support in at
most two points.  This is the distinct-center dangerous-circle bound already
used by the generic common-deletion expansion. -/
theorem secondRow_inter_deletedCriticalSupport_card_le_two
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    (C.B₂ ∩ deletedCriticalSupport C).card ≤ 2 := by
  have htwo :
      2 ≤ (C.B₂ \ deletedCriticalSupport C).card := by
    simpa using two_le_row_sdiff_deletedCriticalSupport C (1 : Fin 2)
  have hsplit := Finset.card_sdiff_add_card_inter
    C.B₂ (deletedCriticalSupport C)
  rw [C.B₂_card] at hsplit
  omega

/-- If the packet's first row is identified with a retained live row, the
second row meets that live row in at most two points. -/
theorem secondRow_inter_firstRow_card_le_two
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²} {live : Finset ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (hrow : C.B₁ = live) :
    (C.B₂ ∩ live).card ≤ 2 := by
  have hoverlap := C.overlap_le_two
  rw [hrow] at hoverlap
  simpa [Finset.inter_comm] using hoverlap

/-- Exact finite classification of failure of the two-off-live antecedent.

The antecedent is stated in the same union form consumed by
`successor_or_secondCenterAlignment_of_two_off_live_sources`.  Since the first
row is exactly the live row, its failure is equivalent to saying that at most
one second-row point lies outside both the live row and the deleted critical
support. -/
theorem twoOffLive_failure_trichotomy
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²} {live : Finset ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (hrow : C.B₁ = live)
    (hfail :
      ¬ 2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        live)).card) :
    OneLiveOverlapFailureProfile deleted C.B₂ live
        (deletedCriticalSupport C) ∨
      TwoLiveExactCoverFailureProfile deleted C.B₂ live
        (deletedCriticalSupport C) ∨
      TwoLiveOneOffFailureProfile deleted C.B₂ live
        (deletedCriticalSupport C) := by
  let support : Finset ℝ² := deletedCriticalSupport C
  let B : Finset ℝ² := C.B₂
  have hfail' :
      ¬ 2 ≤ (outsideBothCell B live support).card := by
    intro htwo
    apply hfail
    have heq :
        (((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
            live) =
          outsideBothCell B live support := by
      ext x
      simp only [Finset.mem_sdiff, Finset.mem_union, outsideBothCell,
        hrow, B, support]
      aesop
    simpa [heq] using htwo
  have hBcard : B.card = 4 := by
    simpa [B] using C.B₂_card
  have hlive_le :
      (B ∩ live).card ≤ 2 := by
    simpa [B] using secondRow_inter_firstRow_card_le_two C hrow
  have hsupport_le :
      (B ∩ support).card ≤ 2 := by
    simpa [B, support] using
      secondRow_inter_deletedCriticalSupport_card_le_two C
  have hsupportCard : support.card = 4 := by
    simpa [support] using deletedCriticalSupport_card_eq_four C
  have hdeletedSupport : deleted ∈ support := by
    simpa [support] using deleted_mem_deletedCriticalSupport C
  have hdeletedNotB : deleted ∉ B := by
    simpa [B] using deleted_not_mem_secondRow C
  have hdeletedDiff : deleted ∈ support \ B :=
    Finset.mem_sdiff.mpr ⟨hdeletedSupport, hdeletedNotB⟩
  have hcellSum := fourCell_card_sum B live support
  have hliveSum := bothCell_card_add_liveOnlyCell_card B live support
  have hsupportSum :=
    bothCell_card_add_supportOnlyCell_card B live support
  have hsupportDiff := Finset.card_sdiff_add_card_inter support B
  have hsupportInter :
      (support ∩ B).card = (B ∩ support).card := by
    congr 1
    exact Finset.inter_comm support B
  rw [hsupportInter, hsupportCard] at hsupportDiff
  have hliveCases :
      (B ∩ live).card = 0 ∨
        (B ∩ live).card = 1 ∨
        (B ∩ live).card = 2 := by
    omega
  rcases hliveCases with hliveZero | hliveOne | hliveTwo
  · exfalso
    omega
  · left
    change OneLiveOverlapFailureProfile deleted B live support
    exact {
      inter_live_card := hliveOne
      inter_support_card := by omega
      both_card := by omega
      liveOnly_card := by omega
      supportOnly_card := by omega
      outsideBoth_card := by omega
      support_sdiff_row_card := by omega
      deleted_mem_support_sdiff_row := hdeletedDiff }
  · have houtsideCases :
        (outsideBothCell B live support).card = 0 ∨
          (outsideBothCell B live support).card = 1 := by
      omega
    rcases houtsideCases with houtsideZero | houtsideOne
    · right
      left
      change TwoLiveExactCoverFailureProfile deleted B live support
      have hsubset : B ⊆ live ∪ support := by
        intro x hxB
        by_contra hxoutside
        have hxOutside : x ∈ outsideBothCell B live support := by
          exact Finset.mem_sdiff.mpr ⟨hxB, hxoutside⟩
        have hnonempty :
            (outsideBothCell B live support).Nonempty :=
          ⟨x, hxOutside⟩
        have hpos : 0 < (outsideBothCell B live support).card :=
          Finset.card_pos.mpr hnonempty
        omega
      exact {
        inter_live_card := hliveTwo
        inter_support_card := by omega
        both_card := by omega
        liveOnly_card := by omega
        supportOnly_card := by omega
        outsideBoth_card := houtsideZero
        row_subset_live_union_support := hsubset
        support_sdiff_row_card := by omega
        deleted_mem_support_sdiff_row := hdeletedDiff }
    · right
      right
      change TwoLiveOneOffFailureProfile deleted B live support
      have hsupportCases :
          (B ∩ support).card = 0 ∨
            (B ∩ support).card = 1 ∨
            (B ∩ support).card = 2 := by
        omega
      rcases hsupportCases with hsupportZero | hsupportOne | hsupportTwo
      · exfalso
        omega
      · exact {
          inter_live_card := hliveTwo
          outsideBoth_card := houtsideOne
          support_split := Or.inl ⟨hsupportOne, by omega, by omega,
            by omega, by omega⟩
          deleted_mem_support_sdiff_row := hdeletedDiff }
      · exact {
          inter_live_card := hliveTwo
          outsideBoth_card := houtsideOne
          support_split := Or.inr ⟨hsupportTwo, by omega, by omega,
            by omega, by omega⟩
          deleted_mem_support_sdiff_row := hdeletedDiff }

#print axioms deletedCriticalSupport_card_eq_four
#print axioms deleted_mem_deletedCriticalSupport
#print axioms deleted_not_mem_secondRow
#print axioms secondRow_inter_deletedCriticalSupport_card_le_two
#print axioms secondRow_inter_firstRow_card_le_two
#print axioms twoOffLive_failure_trichotomy

end Profiles

end ATailRTwoOffLiveFailureScratch
end Problem97
