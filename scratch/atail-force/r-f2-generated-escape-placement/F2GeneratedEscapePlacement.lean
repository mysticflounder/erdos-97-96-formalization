/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2SupportHeavyK4Split
import F2ThreeRowBankDeficitAdapters
import NonEquilateralParentProducer

/-!
# Scratch: generated-row escape placement in the F2 support-heavy branch

The global-K4 split at the two strict support-heavy centers produces either
an exact q-deleted four-row or an exact q-critical three-row.  The existing
bank bound gives two support points outside the deleted-source dangerous
triple in either case, but does not say where those points lie.

This file retains the actual F2 row cells and proves the strongest uniform
placement facts currently forced by the source:

* an off-triple generated point that remains in the retained middle row is a
  retained live-row point;
* the dangerous triple has at most one point outside `oppCap2`;
* every q-deleted generated row therefore has a genuine point outside both
  the dangerous triple and `oppCap2`; and
* a q-critical generated row either has the same genuine escape or uses the
  unique possible off-`oppCap2` dangerous-triple point.

The q-deleted/q-critical four-way is also normalized to the existing
`TwoContinuationRows` interface without changing any selected support.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedEscapePlacementScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailJointTransitionCoreScratch
open ATailNonEquilateralParentProducerScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowBankDeficitsScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- Either exact output of global K4 at one named support-heavy center. -/
inductive ExactGeneratedAt
    (D : CounterexampleData) (deleted center : ℝ²) : Type
  | qDeleted : ExactQDeletedAt D deleted center → ExactGeneratedAt D deleted center
  | qCritical : ExactQCriticalAt D deleted center → ExactGeneratedAt D deleted center

namespace ExactGeneratedAt

def support
    {D : CounterexampleData} {deleted center : ℝ²}
    (G : ExactGeneratedAt D deleted center) : Finset ℝ² :=
  match G with
  | .qDeleted K => K.support
  | .qCritical K => K.support

theorem support_not_mem_deleted
    {D : CounterexampleData} {deleted center : ℝ²}
    (G : ExactGeneratedAt D deleted center) :
    deleted ∉ G.support := by
  cases G with
  | qDeleted K =>
      exact K.row.q_not_mem
  | qCritical K =>
      intro hdeleted
      have hsubset := K.row.subset hdeleted
      have hskeleton : deleted ∈ D.skeleton deleted :=
        (Finset.mem_erase.mp hsubset).2
      change deleted ∈ D.A.erase deleted at hskeleton
      exact (Finset.mem_erase.mp hskeleton).1 rfl

/-- The q-deleted generated row as an ambient selected four-class, retaining
its exact support. -/
def qDeletedSelectedFourClass
    {D : CounterexampleData} {deleted center : ℝ²}
    (K : ExactQDeletedAt D deleted center) :
    SelectedFourClass D.A center where
  support := K.support
  support_subset_A := by
    intro y hy
    have hsubset := K.row.subset hy
    exact
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsubset).2).2
  support_card := K.support_card
  radius := K.row.radius
  radius_pos := K.row.radius_pos
  support_eq_radius := K.row.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.row.subset hcenter)).1 rfl

/-- A q-critical generated triple together with the deleted point is an
ambient selected four-class on exactly `insert deleted support`. -/
noncomputable def qCriticalSelectedFourClass
    {D : CounterexampleData} {deleted center : ℝ²}
    (K : ExactQCriticalAt D deleted center)
    (hdeletedA : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted) :
    SelectedFourClass D.A center where
  support := insert deleted K.support
  support_subset_A := by
    intro y hy
    rcases Finset.mem_insert.mp hy with rfl | hyK
    · exact hdeletedA
    · have hsubset := K.row.subset hyK
      exact
        (Finset.mem_erase.mp
          (Finset.mem_erase.mp hsubset).2).2
  support_card := by
    rw [Finset.card_insert_of_notMem]
    · simp [K.support_card]
    · exact support_not_mem_deleted (.qCritical K)
  radius := dist center deleted
  radius_pos := K.row.q_radius_pos
  support_eq_radius := by
    intro y hy
    rcases Finset.mem_insert.mp hy with rfl | hyK
    · rfl
    · exact K.row.same_q_radius y hyK
  center_not_mem := by
    intro hcenter
    rcases Finset.mem_insert.mp hcenter with h | h
    · exact hcenter_ne_deleted h
    · exact (Finset.mem_erase.mp (K.row.subset h)).1 rfl

/-- The selected four-class underlying either exact generated output. -/
noncomputable def fullSelectedFourClass
    {D : CounterexampleData} {deleted center : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeletedA : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted) :
    SelectedFourClass D.A center :=
  match G with
  | .qDeleted K => qDeletedSelectedFourClass K
  | .qCritical K =>
      qCriticalSelectedFourClass K hdeletedA hcenter_ne_deleted

theorem support_subset_fullSelectedFourClass
    {D : CounterexampleData} {deleted center : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeletedA : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted) :
    G.support ⊆ (G.fullSelectedFourClass hdeletedA hcenter_ne_deleted).support := by
  cases G with
  | qDeleted K =>
      exact fun _ h ↦ h
  | qCritical K =>
      intro y hy
      exact Finset.mem_insert_of_mem hy

theorem two_le_support_sdiff_dangerous
    {D : CounterexampleData} {deleted blocker center : ℝ²}
    {T : Finset ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (htriple : U5DangerousTriple D deleted blocker T)
    (hcenterT : center ∈ T) :
    2 ≤ (G.support \ T).card := by
  cases G with
  | qDeleted K =>
      exact qDeleted_two_le_support_sdiff_dangerous_card
        htriple hcenterT K.row K.support_card
  | qCritical K =>
      exact qCritical_two_le_support_sdiff_dangerous_card
        htriple hcenterT K.row

end ExactGeneratedAt

/-- The two exact generated outputs, with their source-faithful centers. -/
structure ExactGeneratedPair
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) where
  at_s : ExactGeneratedAt D deleted N.s
  at_t : ExactGeneratedAt D deleted N.t

/-- Forget only the four-way constructor while preserving the exact selected
supports and the q-deleted/q-critical kind at both named centers. -/
def F2SupportHeavyK4FourWay.toExactGeneratedPair
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (R : F2SupportHeavyK4FourWay N) :
    ExactGeneratedPair N :=
  match R with
  | .qDeleted_qDeleted K =>
      { at_s := .qDeleted K.at_s
        at_t := .qDeleted K.at_t }
  | .qDeleted_qCritical K =>
      { at_s := .qDeleted K.at_s
        at_t := .qCritical K.at_t }
  | .qCritical_qDeleted K =>
      { at_s := .qCritical K.at_s
        at_t := .qDeleted K.at_t }
  | .qCritical_qCritical K =>
      { at_s := .qCritical K.at_s
        at_t := .qCritical K.at_t }

/-- Any generated support point outside the actual dangerous triple that
still lies in the retained middle row must be a retained live-row point. -/
theorem generated_offDangerous_middle_mem_live
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (G : ExactGeneratedAt D deleted center)
    {y : ℝ²}
    (hyG : y ∈ G.support)
    (hyOff :
      y ∉ (deletedCriticalSupport C).erase deleted)
    (hyMiddle : y ∈ C.B₂) :
    y ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
  rcases Finset.mem_union.mp
      (F2.failure.row_subset_live_union_support hyMiddle) with
    hyLive | hySupport
  · exact hyLive
  · exfalso
    exact hyOff <| Finset.mem_erase.mpr
      ⟨by
        intro hydeleted
        subst y
        exact G.support_not_mem_deleted hyG,
       hySupport⟩

/-- Contrapositive form used by the two-off-live successor consumer. -/
theorem generated_offDangerous_offLive_not_mem_middle
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (G : ExactGeneratedAt D deleted center)
    {y : ℝ²}
    (hyG : y ∈ G.support)
    (hyOff :
      y ∉ (deletedCriticalSupport C).erase deleted)
    (hyLive :
      y ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    y ∉ C.B₂ := by
  intro hyMiddle
  exact hyLive (generated_offDangerous_middle_mem_live F2 G hyG hyOff hyMiddle)

/-- The actual deleted-source dangerous triple has at most one point outside
`oppCap2`: the two named support-heavy centers already occupy two of its three
positions inside that cap. -/
theorem dangerousTriple_sdiff_oppCap2_card_le_one
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) :
    (((deletedCriticalSupport C).erase deleted) \ S.oppCap2).card ≤ 1 := by
  let T := (deletedCriticalSupport C).erase deleted
  have hsT : N.s ∈ T := by
    simpa [T] using N.s_mem_dangerousTriple
  have htT : N.t ∈ T := by
    simpa [T] using N.t_mem_dangerousTriple
  have hsCap : N.s ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp N.s_mem_supportStrict).2).1
  have htCap : N.t ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp N.t_mem_supportStrict).2).1
  have htwo : 2 ≤ (T ∩ S.oppCap2).card := by
    have hone : 1 < (T ∩ S.oppCap2).card :=
      Finset.one_lt_card.mpr
        ⟨N.s, Finset.mem_inter.mpr ⟨hsT, hsCap⟩,
          N.t, Finset.mem_inter.mpr ⟨htT, htCap⟩, N.s_ne_t⟩
    omega
  have hsplit := Finset.card_sdiff_add_card_inter T S.oppCap2
  have hTcard : T.card = 3 := by
    simpa [T] using (dangerousTriple_at_commonDeletion C).T_card
  rw [hTcard] at hsplit
  have hle : (T \ S.oppCap2).card ≤ 1 := by omega
  simpa [T] using hle

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Every selected four-row centered at a named support-heavy point has at
least two support points outside `oppCap2`. -/
theorem generated_fullRow_two_le_sdiff_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : ExactGeneratedAt D deleted center)
    (hcenterStrict : center ∈ strictSecondCap S)
    (hcenter_ne_deleted : center ≠ deleted) :
    2 ≤ ((G.fullSelectedFourClass C.q_mem_A
      hcenter_ne_deleted).support \ S.oppCap2).card := by
  let K := G.fullSelectedFourClass C.q_mem_A hcenter_ne_deleted
  have hcenterCap : center ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hcenterStrict).1
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hinter : (K.support ∩ S.oppCap2).card ≤ 2 := by
    rw [← hcapEq]
    apply CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 K
    simpa [hcapEq] using hcenterCap
  have hsplit := Finset.card_sdiff_add_card_inter K.support S.oppCap2
  have hcard : K.support.card = 4 := K.support_card
  have htwo : 2 ≤ (K.support \ S.oppCap2).card := by omega
  simpa [K] using htwo

/-- A generated q-deleted row has a genuine cap escape outside both the
actual dangerous triple and `oppCap2`.  Two row points lie outside the cap,
while at most one dangerous-triple point does. -/
theorem qDeleted_exists_offDangerous_offOppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQDeletedAt D deleted center) :
    ∃ y : ℝ²,
      y ∈ K.support ∧
      y ∉ (deletedCriticalSupport C).erase deleted ∧
      y ∉ S.oppCap2 ∧
      (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S) := by
  let T := (deletedCriticalSupport C).erase deleted
  let outside := K.support \ S.oppCap2
  have hcenter_ne_deleted : center ≠ deleted :=
    (Finset.mem_erase.mp hcenterT).1
  have htwo : 2 ≤ outside.card := by
    simpa [outside, ExactGeneratedAt.fullSelectedFourClass,
      ExactGeneratedAt.qDeletedSelectedFourClass] using
      generated_fullRow_two_le_sdiff_oppCap2
        (C := C) (.qDeleted K) hcenterStrict hcenter_ne_deleted
  have hTle : (T \ S.oppCap2).card ≤ 1 := by
    simpa [T] using dangerousTriple_sdiff_oppCap2_card_le_one N
  have hnot : ¬ outside ⊆ T \ S.oppCap2 := by
    intro hsub
    have hcard := Finset.card_le_card hsub
    omega
  rcases Finset.not_subset.mp hnot with ⟨y, hyOutside, hyNotTOutside⟩
  have hyK : y ∈ K.support :=
    (Finset.mem_sdiff.mp hyOutside).1
  have hyNotCap : y ∉ S.oppCap2 :=
    (Finset.mem_sdiff.mp hyOutside).2
  have hyNotT : y ∉ T := by
    intro hyT
    exact hyNotTOutside (Finset.mem_sdiff.mpr ⟨hyT, hyNotCap⟩)
  have hyA : y ∈ D.A := by
    have hsubset := K.row.subset hyK
    exact
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsubset).2).2
  exact ⟨y, hyK, by simpa [T] using hyNotT, hyNotCap,
    mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
      S hyA hyNotCap⟩

/-- Exact cap boundary for a generated q-critical row.

Either the generated three-point support has a genuine off-dangerous,
off-`oppCap2` escape, or it contains the unique possible dangerous-triple
point outside `oppCap2`. -/
theorem qCritical_offDangerous_escape_or_uniqueBoundaryHit
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D deleted center) :
    (∃ y : ℝ²,
        y ∈ K.support ∧
        y ∉ (deletedCriticalSupport C).erase deleted ∧
        y ∉ S.oppCap2 ∧
        (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)) ∨
      ((K.support ∩
          (((deletedCriticalSupport C).erase deleted) \ S.oppCap2)).Nonempty ∧
        (((deletedCriticalSupport C).erase deleted) \ S.oppCap2).card = 1) := by
  let T := (deletedCriticalSupport C).erase deleted
  have hcenter_ne_deleted : center ≠ deleted :=
    (Finset.mem_erase.mp hcenterT).1
  let R := ExactGeneratedAt.fullSelectedFourClass
    (.qCritical K) C.q_mem_A hcenter_ne_deleted
  have htwoFull : 2 ≤ (R.support \ S.oppCap2).card := by
    simpa [R] using
      generated_fullRow_two_le_sdiff_oppCap2
        (C := C) (.qCritical K) hcenterStrict hcenter_ne_deleted
  have hone : 1 ≤ (K.support \ S.oppCap2).card := by
    by_contra hnone
    have hzero : (K.support \ S.oppCap2).card = 0 := by omega
    have hsub : R.support \ S.oppCap2 ⊆ ({deleted} : Finset ℝ²) := by
      intro y hy
      have hyR := (Finset.mem_sdiff.mp hy).1
      have hyNotCap := (Finset.mem_sdiff.mp hy).2
      have hyInsert : y ∈ insert deleted K.support := by
        simpa [R, ExactGeneratedAt.fullSelectedFourClass,
          ExactGeneratedAt.qCriticalSelectedFourClass] using hyR
      rcases Finset.mem_insert.mp hyInsert with hydeleted | hyK
      · exact Finset.mem_singleton.mpr hydeleted
      · have hyOutside : y ∈ K.support \ S.oppCap2 :=
          Finset.mem_sdiff.mpr ⟨hyK, hyNotCap⟩
        have hempty : K.support \ S.oppCap2 = ∅ :=
          Finset.card_eq_zero.mp hzero
        rw [hempty] at hyOutside
        simp at hyOutside
    have hcard := Finset.card_le_card hsub
    simp only [Finset.card_singleton] at hcard
    omega
  rcases Finset.card_pos.mp (by omega : 0 < (K.support \ S.oppCap2).card) with
    ⟨y, hyOutside⟩
  have hyK : y ∈ K.support :=
    (Finset.mem_sdiff.mp hyOutside).1
  have hyNotCap : y ∉ S.oppCap2 :=
    (Finset.mem_sdiff.mp hyOutside).2
  have hyA : y ∈ D.A := by
    have hsubset := K.row.subset hyK
    exact
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsubset).2).2
  by_cases hyT : y ∈ T
  · right
    have hyBoundary : y ∈ T \ S.oppCap2 :=
      Finset.mem_sdiff.mpr ⟨hyT, hyNotCap⟩
    have hnonempty :
        (K.support ∩ (T \ S.oppCap2)).Nonempty :=
      ⟨y, Finset.mem_inter.mpr ⟨hyK, hyBoundary⟩⟩
    have hle : (T \ S.oppCap2).card ≤ 1 := by
      simpa [T] using dangerousTriple_sdiff_oppCap2_card_le_one N
    have hpos : 1 ≤ (T \ S.oppCap2).card :=
      Finset.one_le_card.mpr ⟨y, hyBoundary⟩
    exact ⟨by simpa [T] using hnonempty, by
      have : (T \ S.oppCap2).card = 1 := by omega
      simpa [T] using this⟩
  · left
    exact ⟨y, hyK, by simpa [T] using hyT, hyNotCap,
      mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
        S hyA hyNotCap⟩

/-- If the genuine q-critical cap escape is absent, every off-dangerous
generated point lies in `oppCap2`. -/
theorem qCritical_offDangerous_subset_oppCap2_of_no_escape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (K : ExactQCriticalAt D deleted center)
    (hno :
      ¬ ∃ y : ℝ²,
          y ∈ K.support ∧
          y ∉ (deletedCriticalSupport C).erase deleted ∧
          y ∉ S.oppCap2 ∧
          (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)) :
    K.support \ (deletedCriticalSupport C).erase deleted ⊆ S.oppCap2 := by
  intro y hy
  have hyK : y ∈ K.support := (Finset.mem_sdiff.mp hy).1
  have hyOff :
      y ∉ (deletedCriticalSupport C).erase deleted :=
    (Finset.mem_sdiff.mp hy).2
  by_contra hyCap
  have hyA : y ∈ D.A := by
    have hsubset := K.row.subset hyK
    exact
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsubset).2).2
  exact hno ⟨y, hyK, hyOff, hyCap,
    mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
      S hyA hyCap⟩

/-- Exact cap split in the no-escape q-critical residual.

The generated triple then has exactly one point outside `oppCap2`—the unique
possible dangerous-triple boundary point—and at least two off-dangerous
points inside `oppCap2`. -/
theorem qCritical_noEscape_exact_cap_split
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (K : ExactQCriticalAt D deleted center)
    (hno :
      ¬ ∃ y : ℝ²,
          y ∈ K.support ∧
          y ∉ (deletedCriticalSupport C).erase deleted ∧
          y ∉ S.oppCap2 ∧
          (y ∈ S.surplusCap ∨ y ∈ strictOppCap1Region S)) :
    (K.support \ S.oppCap2).card = 1 ∧
      2 ≤ ((K.support \
        (deletedCriticalSupport C).erase deleted) ∩ S.oppCap2).card := by
  let T := (deletedCriticalSupport C).erase deleted
  have hboundary :=
    (qCritical_offDangerous_escape_or_uniqueBoundaryHit
      N hcenterT hcenterStrict K).resolve_left hno
  have houtsideSubset :
      K.support \ S.oppCap2 ⊆ T \ S.oppCap2 := by
    intro y hy
    have hyK : y ∈ K.support := (Finset.mem_sdiff.mp hy).1
    have hyNotCap : y ∉ S.oppCap2 := (Finset.mem_sdiff.mp hy).2
    have hyT : y ∈ T := by
      by_contra hyNotT
      have hyA : y ∈ D.A := by
        have hsubset := K.row.subset hyK
        exact
          (Finset.mem_erase.mp
            (Finset.mem_erase.mp hsubset).2).2
      exact hno ⟨y, hyK, by simpa [T] using hyNotT, hyNotCap,
        mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2
          S hyA hyNotCap⟩
    exact Finset.mem_sdiff.mpr ⟨hyT, hyNotCap⟩
  have houtsideLe :
      (K.support \ S.oppCap2).card ≤ 1 := by
    have hcard := Finset.card_le_card houtsideSubset
    simpa [T, hboundary.2] using hcard
  have houtsidePos : 1 ≤ (K.support \ S.oppCap2).card := by
    rcases hboundary.1 with ⟨y, hyInter⟩
    have hyK : y ∈ K.support := (Finset.mem_inter.mp hyInter).1
    have hyBoundary : y ∈
        (deletedCriticalSupport C).erase deleted \ S.oppCap2 :=
      (Finset.mem_inter.mp hyInter).2
    exact Finset.one_le_card.mpr
      ⟨y, Finset.mem_sdiff.mpr
        ⟨hyK, (Finset.mem_sdiff.mp hyBoundary).2⟩⟩
  have houtsideEq : (K.support \ S.oppCap2).card = 1 := by
    omega
  have htwoOff : 2 ≤ (K.support \ T).card := by
    simpa [T] using qCritical_two_le_support_sdiff_dangerous_card
      (dangerousTriple_at_commonDeletion C) hcenterT K.row
  have hoffCap :
      K.support \ T ⊆ (K.support \ T) ∩ S.oppCap2 := by
    intro y hy
    exact Finset.mem_inter.mpr
      ⟨hy,
       qCritical_offDangerous_subset_oppCap2_of_no_escape K hno
         (by simpa [T] using hy)⟩
  have htwoInside :
      2 ≤ ((K.support \ T) ∩ S.oppCap2).card :=
    htwoOff.trans (Finset.card_le_card hoffCap)
  exact ⟨houtsideEq, by simpa [T] using htwoInside⟩

/-- The exact q-critical two-live-hit residual.

If both guaranteed off-dangerous support points remain in the retained middle
row, then they are live-row points.  At a generated center distinct from the
live center, the two-circle bound makes the live intersection exactly two.
This is a sharp saturation, not a contradiction. -/
theorem qCritical_exact_two_live_hits_of_offDangerous_middle_confined
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenter_ne_p : center ≠ p)
    (K : ExactQCriticalAt D deleted center)
    (hconfined :
      K.support \ (deletedCriticalSupport C).erase deleted ⊆ C.B₂) :
    (K.support ∩ ({q, t1, t2, t3} : Finset ℝ²)).card = 2 := by
  let T := (deletedCriticalSupport C).erase deleted
  let live := ({q, t1, t2, t3} : Finset ℝ²)
  have htwoOff : 2 ≤ (K.support \ T).card := by
    simpa [T] using qCritical_two_le_support_sdiff_dangerous_card
      (dangerousTriple_at_commonDeletion C) hcenterT K.row
  have hoffLive :
      K.support \ T ⊆ K.support ∩ live := by
    intro y hy
    have hyK : y ∈ K.support := (Finset.mem_sdiff.mp hy).1
    have hyOff : y ∉ T := (Finset.mem_sdiff.mp hy).2
    have hyMiddle : y ∈ C.B₂ := hconfined (by simpa [T] using hy)
    have hyLive :=
      generated_offDangerous_middle_mem_live F2 (.qCritical K)
        hyK (by simpa [T] using hyOff) hyMiddle
    exact Finset.mem_inter.mpr ⟨hyK, by simpa [live] using hyLive⟩
  have hlower : 2 ≤ (K.support ∩ live).card :=
    htwoOff.trans (Finset.card_le_card hoffLive)
  let Kfull := ExactGeneratedAt.qCriticalSelectedFourClass K C.q_mem_A
    (Finset.mem_erase.mp hcenterT).1
  let Klive : SelectedFourClass D.A p := W.liveRow.toSelectedFourClass
  have hfull : (Kfull.support ∩ Klive.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Kfull Klive hcenter_ne_p
  have hsub :
      K.support ∩ live ⊆ Kfull.support ∩ Klive.support := by
    intro y hy
    have hyK : y ∈ K.support := (Finset.mem_inter.mp hy).1
    have hyLive : y ∈ live := (Finset.mem_inter.mp hy).2
    exact Finset.mem_inter.mpr
      ⟨by
        exact Finset.mem_insert_of_mem hyK,
       by
        change y ∈ W.liveRow.toCriticalFourShell.support
        rw [W.liveRow_support]
        simpa [live] using hyLive⟩
  have hupper : (K.support ∩ live).card ≤ 2 :=
    (Finset.card_le_card hsub).trans hfull
  have : (K.support ∩ live).card = 2 := by omega
  simpa [live] using this

namespace ExactGeneratedPair

/-- The exact four-way generated rows are already an instance of the existing
two-continuation-row interface.  A q-critical output is completed by adjoining
the actual deleted source; a q-deleted output is unchanged. -/
noncomputable def toTwoContinuationRows
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    TwoContinuationRows (rebasePacket D S)
      (@Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
        D W.H deleted p S.oppApex2 C) where
  z₁ := N.s
  z₂ := N.t
  z₁_mem := Finset.mem_inter.mpr
    ⟨N.s_mem_middleRow, (Finset.mem_inter.mp N.s_mem_supportStrict).2⟩
  z₂_mem := Finset.mem_inter.mpr
    ⟨N.t_mem_middleRow, (Finset.mem_inter.mp N.t_mem_supportStrict).2⟩
  z₁_ne_z₂ := N.s_ne_t
  row₁ := G.at_s.fullSelectedFourClass C.q_mem_A
    (Finset.mem_erase.mp N.s_mem_dangerousTriple).1
  row₂ := G.at_t.fullSelectedFourClass C.q_mem_A
    (Finset.mem_erase.mp N.t_mem_dangerousTriple).1

theorem two_le_generatedSupports_sdiff_dangerous
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    2 ≤ (G.at_s.support \
        (deletedCriticalSupport C).erase deleted).card ∧
      2 ≤ (G.at_t.support \
        (deletedCriticalSupport C).erase deleted).card := by
  exact ⟨
    G.at_s.two_le_support_sdiff_dangerous
      (dangerousTriple_at_commonDeletion C) N.s_mem_dangerousTriple,
    G.at_t.two_le_support_sdiff_dangerous
      (dangerousTriple_at_commonDeletion C) N.t_mem_dangerousTriple⟩

theorem two_le_fullRows_sdiff_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    2 ≤ ((G.toTwoContinuationRows).row₁.support \ S.oppCap2).card ∧
      2 ≤ ((G.toTwoContinuationRows).row₂.support \ S.oppCap2).card := by
  exact ⟨
    (G.toTwoContinuationRows).two_le_row₁_support_outside_oppCap2,
    (G.toTwoContinuationRows).two_le_row₂_support_outside_oppCap2⟩

theorem common_fullSupport_outside_oppCap2_card_le_one
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    ((((G.toTwoContinuationRows).row₁.support ∩
        (G.toTwoContinuationRows).row₂.support) \ S.oppCap2).card ≤ 1) := by
  exact (G.toTwoContinuationRows).common_support_outside_oppCap2_card_le_one

theorem exists_divergent_fullSupport_outside_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    ∃ a b : ℝ²,
      a ∈ (G.toTwoContinuationRows).row₁.support \ S.oppCap2 ∧
      a ∉ (G.toTwoContinuationRows).row₂.support ∧
      b ∈ (G.toTwoContinuationRows).row₂.support \ S.oppCap2 ∧
      b ∉ (G.toTwoContinuationRows).row₁.support := by
  exact (G.toTwoContinuationRows).exists_divergent_outside_witnesses

theorem cross_survival_or_metricResidual
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N) :
    HasNEquidistantPointsAt 4
        (D.A.erase N.t) N.s ∨
      HasNEquidistantPointsAt 4
        (D.A.erase N.s) N.t ∨
      (G.toTwoContinuationRows).MetricResidual := by
  simpa [rebasePacket] using
    (G.toTwoContinuationRows).cross_survival_or_metricResidual

end ExactGeneratedPair

#print axioms generated_offDangerous_middle_mem_live
#print axioms generated_offDangerous_offLive_not_mem_middle
#print axioms dangerousTriple_sdiff_oppCap2_card_le_one
#print axioms qDeleted_exists_offDangerous_offOppCap2
#print axioms qCritical_offDangerous_escape_or_uniqueBoundaryHit
#print axioms qCritical_offDangerous_subset_oppCap2_of_no_escape
#print axioms qCritical_noEscape_exact_cap_split
#print axioms qCritical_exact_two_live_hits_of_offDangerous_middle_confined
#print axioms ExactGeneratedPair.two_le_generatedSupports_sdiff_dangerous
#print axioms ExactGeneratedPair.two_le_fullRows_sdiff_oppCap2
#print axioms ExactGeneratedPair.common_fullSupport_outside_oppCap2_card_le_one
#print axioms ExactGeneratedPair.exists_divergent_fullSupport_outside_oppCap2
#print axioms ExactGeneratedPair.cross_survival_or_metricResidual

end ATailRF2GeneratedEscapePlacementScratch
end Problem97
