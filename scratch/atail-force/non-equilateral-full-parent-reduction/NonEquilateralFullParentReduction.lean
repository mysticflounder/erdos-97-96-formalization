/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionCriticalExpansion
import LateCriticalSystemSurface

/-!
# Scratch: full-parent reduction of the non-equilateral continuation

`NonEquilateralOutput` already contains a common-deletion two-center packet,
but its two exact erased rows are selected existentially and need not be the
two native continuation supports to which `nonEquilateralSupportDichotomy`
applies.  This file closes that interface gap.

The native rows themselves are exact rows after deleting the second apex, so
they define a canonical `CommonDeletionTwoCenterPacket`.  This makes the
surplus-heavy/exclusive-witness dichotomy available on the same supports as
the existing common-deletion critical-expansion consumer.  The native overlap
bound is one rather than the generic bound two; consequently at least four,
not merely three, native-row sources lie outside every late-chosen critical
shell at the common deletion.

No arm is claimed contradictory.  The output is the strongest exact
row/support/deletion packet currently forced by the checked parent surface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailNonEquilateralFullParentReductionScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailCriticalPairFrontier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailLateCriticalSystemSurfaceScratch
open ATailNonEquilateralContinuationScratch
open ATailNonEquilateralParentProducerScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Each native continuation row has one of the only two possible profiles
with respect to `oppCap2`: two outside and two inside, or three outside and
one inside.  The other continuation center supplies an inside hit, and the
upper bound is the MEC ordered-cap row bound at the strict-`oppCap2` center. -/
def NativeOppCap2Profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  (((P.row₁.support \ S.oppCap2).card = 2 ∧
      (P.row₁.support ∩ S.oppCap2).card = 2) ∨
    ((P.row₁.support \ S.oppCap2).card = 3 ∧
      (P.row₁.support ∩ S.oppCap2).card = 1)) ∧
  (((P.row₂.support \ S.oppCap2).card = 2 ∧
      (P.row₂.support ∩ S.oppCap2).card = 2) ∨
    ((P.row₂.support \ S.oppCap2).card = 3 ∧
      (P.row₂.support ∩ S.oppCap2).card = 1))

private theorem nativeRow_oppCap2_profile_of_center
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²}
    (R : SelectedFourClass D.A center)
    (hcenter : center ∈ S.oppCap2)
    {inside : ℝ²}
    (hinsideR : inside ∈ R.support)
    (hinsideCap : inside ∈ S.oppCap2) :
    ((R.support \ S.oppCap2).card = 2 ∧
      (R.support ∩ S.oppCap2).card = 2) ∨
    ((R.support \ S.oppCap2).card = 3 ∧
      (R.support ∩ S.oppCap2).card = 1) := by
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hinter : (R.support ∩ S.oppCap2).card ≤ 2 := by
    rw [← hcapEq]
    apply CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 R
    simpa [hcapEq] using hcenter
  have hsplit := Finset.card_sdiff_add_card_inter R.support S.oppCap2
  have hcard : R.support.card = 4 := R.support_card
  have hinside : 1 ≤ (R.support ∩ S.oppCap2).card := by
    rw [Finset.one_le_card]
    exact ⟨inside, Finset.mem_inter.mpr ⟨hinsideR, hinsideCap⟩⟩
  rw [hcard] at hsplit
  omega

theorem nativeOppCap2Profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    NativeOppCap2Profile P := by
  rcases N.residual with
    ⟨_hd, hz₂row₁, hz₁row₂, _hr₁, _hr₂, _ha₁, _ha₂⟩
  rcases nativeRow_oppCap2_profile_of_center P.row₁
      P.z₁_mem_oppCap2 hz₂row₁ P.z₂_mem_oppCap2 with h₁
  rcases nativeRow_oppCap2_profile_of_center P.row₂
      P.z₂_mem_oppCap2 hz₁row₂ P.z₁_mem_oppCap2 with h₂
  exact ⟨h₁, h₂⟩

/-- Canonical common-deletion packet whose exact erased rows are literally
the native non-equilateral continuation supports. -/
noncomputable def nativeCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    CommonDeletionTwoCenterPacket
      (rebasePacket D S) H S.oppApex2 P.z₁ P.z₂ := by
  let C := N.commonDeletion.some
  exact
    { q_mem_A := C.q_mem_A
      center₁_mem_A := C.center₁_mem_A
      center₂_mem_A := C.center₂_mem_A
      centers_ne := C.centers_ne
      survives₁ := C.survives₁
      survives₂ := C.survives₂
      actual_blocker_ne_center₁ := C.actual_blocker_ne_center₁
      actual_blocker_ne_center₂ := C.actual_blocker_ne_center₂
      B₁ := P.row₁.support
      B₂ := P.row₂.support
      row₁ := nativeQDeletedRow₁ N
      row₂ := nativeQDeletedRow₂ N
      B₁_card := P.row₁.support_card
      B₂_card := P.row₂.support_card
      overlap_le_two := (nativeRow_inter_card_le_one N).trans (by omega) }

@[simp] theorem nativeCommonDeletionPacket_B₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    (nativeCommonDeletionPacket N).B₁ = P.row₁.support := rfl

@[simp] theorem nativeCommonDeletionPacket_B₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    (nativeCommonDeletionPacket N).B₂ = P.row₂.support := rfl

/-- Rebase the canonical native packet after the continuation geometry is
known and a late critical system has been selected. -/
noncomputable def nativeCommonDeletionPacketAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    CommonDeletionTwoCenterPacket
      (rebasePacket D S) Hfav S.oppApex2 P.z₁ P.z₂ :=
  rebaseCommonDeletionSystem (nativeCommonDeletionPacket N) Hfav

@[simp] theorem nativeCommonDeletionPacketAt_B₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    (nativeCommonDeletionPacketAt N Hfav).B₁ = P.row₁.support := rfl

@[simp] theorem nativeCommonDeletionPacketAt_B₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    (nativeCommonDeletionPacketAt N Hfav).B₂ = P.row₂.support := rfl

/-- The support dichotomy rewritten directly onto the canonical
common-deletion packet.  This prevents the native incidences from being lost
when the generic two-center consumer is invoked. -/
def NativeCommonDeletionSupportDichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      (rebasePacket D S) H q center₁ center₂) : Prop :=
  2 ≤ (C.B₁ ∩ S.surplusCap).card ∨
    2 ≤ (C.B₂ ∩ S.surplusCap).card ∨
    ∃ x y : ℝ²,
      x ∈ C.B₁ ∧ x ∉ C.B₂ ∧ x ∈ strictOppCap1Region S ∧
      y ∈ C.B₂ ∧ y ∉ C.B₁ ∧ y ∈ strictOppCap1Region S ∧
      x ≠ y

theorem nativeCommonDeletionSupportDichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    NativeCommonDeletionSupportDichotomy
      (nativeCommonDeletionPacketAt N Hfav) := by
  simpa [NativeCommonDeletionSupportDichotomy,
    NonEquilateralSupportDichotomy] using
      nonEquilateralSupportDichotomy N

/-- The deleted source lies in its own four-point critical shell but in
neither erased row, so at most the other three shell points meet the row
union. -/
theorem rows_union_inter_deletedCriticalSupport_card_le_three
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    ((C.B₁ ∪ C.B₂) ∩ deletedCriticalSupport C).card ≤ 3 := by
  have hqNotRows : q ∉ C.B₁ ∪ C.B₂ := by
    simpa using ⟨C.row₁.q_not_mem, C.row₂.q_not_mem⟩
  have hqShell : q ∈ deletedCriticalSupport C := by
    simpa [deletedCriticalSupport] using
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.q_mem_support
  have hshellCard : (deletedCriticalSupport C).card = 4 := by
    simpa [deletedCriticalSupport] using
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.support_card
  have hinterSubset :
      (C.B₁ ∪ C.B₂) ∩ deletedCriticalSupport C ⊆
        (deletedCriticalSupport C).erase q := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxRows, hxShell⟩
    exact Finset.mem_erase.mpr
      ⟨fun hxq => hqNotRows (hxq ▸ hxRows), hxShell⟩
  have heraseCard : ((deletedCriticalSupport C).erase q).card = 3 := by
    rw [Finset.card_erase_of_mem hqShell, hshellCard]
  exact (Finset.card_le_card hinterSubset).trans_eq heraseCard

/-- Improving the generic overlap bound from two to one improves the fresh
source count outside the deleted source's critical shell from three to four. -/
theorem four_le_rows_union_sdiff_deletedCriticalSupport_of_overlap_le_one
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (hoverlap : (C.B₁ ∩ C.B₂).card ≤ 1) :
    4 ≤ ((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C).card := by
  have hrowsSplit := Finset.card_union_add_card_inter C.B₁ C.B₂
  have hrowsSeven : 7 ≤ (C.B₁ ∪ C.B₂).card := by
    rw [C.B₁_card, C.B₂_card] at hrowsSplit
    omega
  have hinterThree :=
    rows_union_inter_deletedCriticalSupport_card_le_three C
  have hsplit := Finset.card_sdiff_add_card_inter
    (C.B₁ ∪ C.B₂) (deletedCriticalSupport C)
  omega

/-- Four distinct native-row sources outside the late-chosen critical shell
at the common deletion. -/
structure FourFreshCriticalSources
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) where
  first : FreshCriticalSource C
  second : FreshCriticalSource C
  third : FreshCriticalSource C
  fourth : FreshCriticalSource C
  first_ne_second : first.point ≠ second.point
  first_ne_third : first.point ≠ third.point
  first_ne_fourth : first.point ≠ fourth.point
  second_ne_third : second.point ≠ third.point
  second_ne_fourth : second.point ≠ fourth.point
  third_ne_fourth : third.point ≠ fourth.point

theorem nonempty_fourFreshCriticalSources_of_overlap_le_one
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (hoverlap : (C.B₁ ∩ C.B₂).card ≤ 1) :
    Nonempty (FourFreshCriticalSources C) := by
  have hfour :=
    four_le_rows_union_sdiff_deletedCriticalSupport_of_overlap_le_one
      C hoverlap
  have hlt : 3 < ((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C).card := by
    omega
  rcases Finset.three_lt_card.mp hlt with
    ⟨a, ha, b, hb, c, hc, d, hd, hab, hac, had, hbc, hbd, hcd⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haRows, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbRows, hbOutside⟩
  rcases Finset.mem_sdiff.mp hc with ⟨hcRows, hcOutside⟩
  rcases Finset.mem_sdiff.mp hd with ⟨hdRows, hdOutside⟩
  exact ⟨{
    first := freshCriticalSource_of_mem C haRows haOutside
    second := freshCriticalSource_of_mem C hbRows hbOutside
    third := freshCriticalSource_of_mem C hcRows hcOutside
    fourth := freshCriticalSource_of_mem C hdRows hdOutside
    first_ne_second := hab
    first_ne_third := hac
    first_ne_fourth := had
    second_ne_third := hbc
    second_ne_fourth := hbd
    third_ne_fourth := hcd }⟩

/-- The smallest remaining native cap profile: both continuation rows use
exactly two support points inside and two outside `oppCap2`. -/
def NativeTwoByTwoOppCap2Profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  (P.row₁.support \ S.oppCap2).card = 2 ∧
    (P.row₁.support ∩ S.oppCap2).card = 2 ∧
    (P.row₂.support \ S.oppCap2).card = 2 ∧
    (P.row₂.support ∩ S.oppCap2).card = 2

/-- If the native cap profile is not two-by-two, one can choose a source in
the native row union that is simultaneously outside `oppCap2` and outside
the late critical shell.  It is therefore cap-localized and already carries
the common-deletion consumer's prescribed transition. -/
structure OutsideOppCap2FreshTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) where
  source : FreshCriticalSource (nativeCommonDeletionPacketAt N Hfav)
  outside_oppCap2 : source.point ∉ S.oppCap2
  capLocation : source.point ∈ S.surplusCap ∨
    source.point ∈ strictOppCap1Region S
  transition : FreshSourcePrescribedTransition
    (nativeCommonDeletionPacketAt N Hfav) source

private theorem four_le_native_rows_union_sdiff_oppCap2_of_three_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A)
    (hthree :
      (P.row₁.support \ S.oppCap2).card = 3 ∨
        (P.row₂.support \ S.oppCap2).card = 3) :
    4 ≤ ((((nativeCommonDeletionPacketAt N Hfav).B₁ ∪
      (nativeCommonDeletionPacketAt N Hfav).B₂) \ S.oppCap2).card) := by
  let C := nativeCommonDeletionPacketAt N Hfav
  let A₁ := C.B₁ \ S.oppCap2
  let A₂ := C.B₂ \ S.oppCap2
  have hprofile := nativeOppCap2Profile N
  have hA₁two : 2 ≤ A₁.card := by
    rcases hprofile.1 with h22 | h31
    · have hcard : A₁.card = 2 := by simpa [A₁, C] using h22.1
      omega
    · have hcard : A₁.card = 3 := by simpa [A₁, C] using h31.1
      omega
  have hA₂two : 2 ≤ A₂.card := by
    rcases hprofile.2 with h22 | h31
    · have hcard : A₂.card = 2 := by simpa [A₂, C] using h22.1
      omega
    · have hcard : A₂.card = 3 := by simpa [A₂, C] using h31.1
      omega
  have hOneThree : A₁.card = 3 ∨ A₂.card = 3 := by
    simpa [A₁, A₂, C] using hthree
  have hinterSub : A₁ ∩ A₂ ⊆ C.B₁ ∩ C.B₂ := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hx₁, hx₂⟩
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_sdiff.mp hx₁).1, (Finset.mem_sdiff.mp hx₂).1⟩
  have hoverlapNative :
      (P.row₁.support ∩ P.row₂.support).card ≤ 1 :=
    nativeRow_inter_card_le_one N
  have hoverlap : (C.B₁ ∩ C.B₂).card ≤ 1 := by
    simpa [C, nativeCommonDeletionPacketAt,
      nativeCommonDeletionPacket] using hoverlapNative
  have hinter : (A₁ ∩ A₂).card ≤ 1 :=
    (Finset.card_le_card hinterSub).trans hoverlap
  have hunionSplit := Finset.card_union_add_card_inter A₁ A₂
  have hfour : 4 ≤ (A₁ ∪ A₂).card := by omega
  have hsetEq : A₁ ∪ A₂ =
      (C.B₁ ∪ C.B₂) \ S.oppCap2 := by
    ext x
    simp only [A₁, A₂, Finset.mem_union, Finset.mem_sdiff]
    constructor
    · rintro (⟨hx₁, hxout⟩ | ⟨hx₂, hxout⟩)
      · exact ⟨Or.inl hx₁, hxout⟩
      · exact ⟨Or.inr hx₂, hxout⟩
    · rintro ⟨hx₁ | hx₂, hxout⟩
      · exact Or.inl ⟨hx₁, hxout⟩
      · exact Or.inr ⟨hx₂, hxout⟩
  rw [← hsetEq]
  exact hfour

private theorem nonempty_outsideOppCap2FreshTransition_of_three_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A)
    (hthree :
      (P.row₁.support \ S.oppCap2).card = 3 ∨
        (P.row₂.support \ S.oppCap2).card = 3) :
    Nonempty (OutsideOppCap2FreshTransition N Hfav) := by
  let C := nativeCommonDeletionPacketAt N Hfav
  let Uout := (C.B₁ ∪ C.B₂) \ S.oppCap2
  have hUout : 4 ≤ Uout.card := by
    simpa [Uout, C] using
      four_le_native_rows_union_sdiff_oppCap2_of_three_outside
        N Hfav hthree
  have hinterSub : Uout ∩ deletedCriticalSupport C ⊆
      (C.B₁ ∪ C.B₂) ∩ deletedCriticalSupport C := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxUout, hxShell⟩
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_sdiff.mp hxUout).1, hxShell⟩
  have hinter :
      (Uout ∩ deletedCriticalSupport C).card ≤ 3 :=
    (Finset.card_le_card hinterSub).trans
      (rows_union_inter_deletedCriticalSupport_card_le_three C)
  have hsplit := Finset.card_sdiff_add_card_inter
    Uout (deletedCriticalSupport C)
  have hnonempty : (Uout \ deletedCriticalSupport C).Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hempty
    rw [hempty, Finset.card_empty] at hsplit
    omega
  rcases hnonempty with ⟨x, hx⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxUout, hxShell⟩
  rcases Finset.mem_sdiff.mp hxUout with ⟨hxRows, hxOpp2⟩
  let X := freshCriticalSource_of_mem C hxRows hxShell
  have hcap : X.point ∈ S.surplusCap ∨
      X.point ∈ strictOppCap1Region S :=
    mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
      S X.mem_A (by simpa [X] using hxOpp2)
  exact ⟨{
    source := X
    outside_oppCap2 := by simpa [X] using hxOpp2
    capLocation := hcap
    transition := freshSourcePrescribedTransition C X }⟩

/-- Exact final split after combining the native cap profile with the
late-system common-deletion consumer. -/
theorem nativeTwoByTwo_or_outsideOppCap2FreshTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    NativeTwoByTwoOppCap2Profile P ∨
      Nonempty (OutsideOppCap2FreshTransition N Hfav) := by
  rcases nativeOppCap2Profile N with ⟨h₁, h₂⟩
  rcases h₁ with h₁ | h₁
  · rcases h₂ with h₂ | h₂
    · exact Or.inl ⟨h₁.1, h₁.2, h₂.1, h₂.2⟩
    · exact Or.inr
        (nonempty_outsideOppCap2FreshTransition_of_three_outside
          N Hfav (Or.inr h₂.1))
  · exact Or.inr
      (nonempty_outsideOppCap2FreshTransition_of_three_outside
        N Hfav (Or.inl h₁.1))

/-- Consolidated exact non-equilateral packet at an arbitrary late-chosen
critical system.  The support dichotomy and critical expansion now refer to
the same native row supports. -/
structure NonEquilateralNativeCriticalExpansion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) : Type where
  supportDichotomy : NonEquilateralSupportDichotomy P
  packetSupportDichotomy : NativeCommonDeletionSupportDichotomy
    (nativeCommonDeletionPacketAt N Hfav)
  oppCap2Profile : NativeOppCap2Profile P
  nativeOverlapLeOne :
    ((nativeCommonDeletionPacketAt N Hfav).B₁ ∩
      (nativeCommonDeletionPacketAt N Hfav).B₂).card ≤ 1
  fourOutsideDeletedCriticalSupport :
    4 ≤ (((nativeCommonDeletionPacketAt N Hfav).B₁ ∪
      (nativeCommonDeletionPacketAt N Hfav).B₂) \
        deletedCriticalSupport (nativeCommonDeletionPacketAt N Hfav)).card
  criticalExpansion : CommonDeletionCriticalExpansion
    (nativeCommonDeletionPacketAt N Hfav)
  fourFreshSources : FourFreshCriticalSources
    (nativeCommonDeletionPacketAt N Hfav)
  twoByTwoOrOutsideFreshTransition :
    NativeTwoByTwoOppCap2Profile P ∨
      Nonempty (OutsideOppCap2FreshTransition N Hfav)

theorem nonempty_nonEquilateralNativeCriticalExpansion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    Nonempty (NonEquilateralNativeCriticalExpansion N Hfav) := by
  let C := nativeCommonDeletionPacketAt N Hfav
  have hoverlap : (C.B₁ ∩ C.B₂).card ≤ 1 := by
    simpa [C, nativeCommonDeletionPacketAt,
      nativeCommonDeletionPacket] using nativeRow_inter_card_le_one N
  rcases nonempty_commonDeletionCriticalExpansion C with ⟨E⟩
  rcases nonempty_fourFreshCriticalSources_of_overlap_le_one C hoverlap with
    ⟨F⟩
  exact ⟨{
    supportDichotomy := nonEquilateralSupportDichotomy N
    packetSupportDichotomy := nativeCommonDeletionSupportDichotomy N Hfav
    oppCap2Profile := nativeOppCap2Profile N
    nativeOverlapLeOne := hoverlap
    fourOutsideDeletedCriticalSupport :=
      four_le_rows_union_sdiff_deletedCriticalSupport_of_overlap_le_one
        C hoverlap
    criticalExpansion := E
    fourFreshSources := F
    twoByTwoOrOutsideFreshTransition :=
      nativeTwoByTwo_or_outsideOppCap2FreshTransition N Hfav }⟩

/-- Routed late-system output with the non-equilateral arm strengthened to
the native critical-expansion packet. -/
def RoutedContinuationWithNativeNonEquilateralExpansion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (G : GeometricFrontierContinuation F)
    (Hfav : CriticalShellSystem D.A) : Prop :=
  CrossSurvivalOutput G.rows ∨
    (∃ N : NonEquilateralOutput Hfav G.rows,
      Nonempty (NonEquilateralNativeCriticalExpansion N Hfav)) ∨
    G.rows.EquilateralResidual

theorem routedContinuationWithNativeNonEquilateralExpansion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (G : GeometricFrontierContinuation F)
    (Hfav : CriticalShellSystem D.A) :
    RoutedContinuationWithNativeNonEquilateralExpansion G Hfav := by
  rcases (G.toDispatch Hfav).branch with hcross | hnon | heq
  · exact Or.inl hcross
  · exact Or.inr (Or.inl
      ⟨hnon, nonempty_nonEquilateralNativeCriticalExpansion hnon Hfav⟩)
  · exact Or.inr (Or.inr heq)

/-- Full parent reduction.  No-`IsM44` contributes the genuine second-large
cap, no-removability supplies a late critical system, and the chosen frontier
supplies H-independent continuation geometry.  If the routed branch is
non-equilateral, its output is the native critical expansion above. -/
theorem fullParent_nativeNonEquilateralRoutedReduction
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    {S : SurplusCapPacket D.A}
    (hS : S = leafSurplusPacket MT hCirc CP i hM hsurplus)
    {r : ℝ} {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) :
    (∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card) ∧
      ∃ G : GeometricFrontierContinuation F,
        ∃ Hfav : CriticalShellSystem D.A,
          RoutedContinuationWithNativeNonEquilateralExpansion G Hfav := by
  subst S
  constructor
  · exact exists_secondLargeCap_of_noM44
      MT hCirc CP hM hsurplus hNoM44
  · rcases nonempty_geometricFrontierContinuation F with ⟨G⟩
    rcases exists_criticalShellSystem D.K4 hnoRem with ⟨Hfav⟩
    exact ⟨G, Hfav,
      routedContinuationWithNativeNonEquilateralExpansion G Hfav⟩

#print axioms nativeOppCap2Profile
#print axioms nativeCommonDeletionPacket
#print axioms four_le_rows_union_sdiff_deletedCriticalSupport_of_overlap_le_one
#print axioms nonempty_fourFreshCriticalSources_of_overlap_le_one
#print axioms nonempty_nonEquilateralNativeCriticalExpansion
#print axioms routedContinuationWithNativeNonEquilateralExpansion
#print axioms fullParent_nativeNonEquilateralRoutedReduction

end ATailNonEquilateralFullParentReductionScratch
end Problem97
