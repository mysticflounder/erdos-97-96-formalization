/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredProvenanceF2Lift

/-!
# Scratch: anchored F2 live-heavy and mixed handler boundary

This file keeps the anchored coherent-source provenance while reducing the
two unresolved F2 callbacks.  It does not infer any metric equality from a
selected-support omission.

The live-heavy callback yields an exact original-`q` q-deleted middle row:
two named dangerous-triple points and two named points outside the live row.
The retained coherent source is the third dangerous-triple point and is
omitted by the middle row.

The mixed callback yields the exact source-faithful dichotomy:

* the second live-only point is `q`, so erasing `q` from the middle row is an
  original-`q` q-critical triple; or
* the second live-only point is another dangerous-triple point, so the middle
  row is an original-`q` q-deleted four-class.

No anonymous support is introduced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2LiveMixedHandlerScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
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

/-- The live source is not one of the three dangerous labels.  This follows
from the exact four-point live row, without importing slot identities. -/
theorem liveSource_not_mem_dangerousTriple
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3) :
    q ∉ ({t1, t2, t3} : Finset ℝ²) := by
  intro hq
  have hbaseCard :
      ({q, t1, t2, t3} : Finset ℝ²).card = 4 := by
    rw [← W.liveRow_support]
    exact W.liveRow.toCriticalFourShell.support_card
  have hbaseEq :
      ({q, t1, t2, t3} : Finset ℝ²) =
        ({t1, t2, t3} : Finset ℝ²) :=
    Finset.insert_eq_of_mem hq
  rw [hbaseEq] at hbaseCard
  have hle := triple_card_le_three t1 t2 t3
  omega

/-- Exact anchored live-heavy reduction. -/
structure AnchoredF2LiveHeavyReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)) where
  named : NamedF2TwoTwoWitnesses chain
  middle_row_eq :
    (alignedSharedRowPacket X hcenter).B₂ =
      {named.x, named.y, named.s, named.t}
  coherent_source_ne_x : R.sourcePair.x ≠ named.x
  coherent_source_ne_y : R.sourcePair.x ≠ named.y
  dangerous_triple_eq :
    ({t1, t2, t3} : Finset ℝ²) =
      {named.x, named.y, R.sourcePair.x}
  q_not_mem_middle :
    q ∉ (alignedSharedRowPacket X hcenter).B₂
  original_q_middle_row :
    U5QDeletedK4Class D q S.oppApex2
      (alignedSharedRowPacket X hcenter).B₂
  one_live_center_off_fixedMarginal :
    named.x ∉
        (SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∨
      named.y ∉
        (SelectedClass D.A S.oppApex1 radius \ S.surplusCap)

/-- Extract the exact anchored live-heavy reduction. -/
theorem nonempty_anchoredF2LiveHeavyReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)) :
    Nonempty
      (AnchoredF2LiveHeavyReduction W R A X hcenter P chain) := by
  let C := alignedSharedRowPacket X hcenter
  rcases chain.nonempty_namedWitnesses with ⟨N⟩
  have hxB : N.x ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.x_mem_liveStrict).1).1).1
  have hyB : N.y ∈ C.B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp N.y_mem_liveStrict).1).1).1
  have hsB : N.s ∈ C.B₂ :=
    (Finset.mem_inter.mp (Finset.mem_sdiff.mp N.s_mem_supportOnly).1).1
  have htB : N.t ∈ C.B₂ :=
    (Finset.mem_inter.mp (Finset.mem_sdiff.mp N.t_mem_supportOnly).1).1
  have hfour : ({N.x, N.y, N.s, N.t} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨N.x, N.y, N.s, N.t, N.x_ne_y, N.x_ne_s, N.x_ne_t,
      N.y_ne_s, N.y_ne_t, N.s_ne_t, rfl⟩
  have hsubset :
      ({N.x, N.y, N.s, N.t} : Finset ℝ²) ⊆ C.B₂ := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact hxB
    · exact hyB
    · exact hsB
    · exact htB
  have hmiddle :
      C.B₂ = ({N.x, N.y, N.s, N.t} : Finset ℝ²) := by
    exact (Finset.eq_of_subset_of_card_le hsubset (by
      rw [C.B₂_card, hfour])).symm
  have hrx : R.sourcePair.x ≠ N.x := by
    intro h
    exact P.named_not_mem_middle.2.2 (h ▸ hxB)
  have hry : R.sourcePair.x ≠ N.y := by
    intro h
    exact P.named_not_mem_middle.2.2 (h ▸ hyB)
  have htripleSubset :
      ({N.x, N.y, R.sourcePair.x} : Finset ℝ²) ⊆
        ({t1, t2, t3} : Finset ℝ²) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact N.x_mem_dangerousTriple
    · exact N.y_mem_dangerousTriple
    · exact P.coherent_source_mem_dangerousTriple
  have htripleNamed :
      ({N.x, N.y, R.sourcePair.x} : Finset ℝ²).card = 3 := by
    rw [Finset.card_eq_three]
    exact ⟨N.x, N.y, R.sourcePair.x, N.x_ne_y, hrx.symm, hry.symm, rfl⟩
  have htripleEq :
      ({t1, t2, t3} : Finset ℝ²) =
        ({N.x, N.y, R.sourcePair.x} : Finset ℝ²) := by
    exact (Finset.eq_of_subset_of_card_le htripleSubset (by
      rw [htripleNamed]
      exact triple_card_le_three t1 t2 t3)).symm
  have hqNotTriple := liveSource_not_mem_dangerousTriple W
  have hqNeX : q ≠ N.x := by
    intro h
    exact hqNotTriple (h ▸ N.x_mem_dangerousTriple)
  have hqNeY : q ≠ N.y := by
    intro h
    exact hqNotTriple (h ▸ N.y_mem_dangerousTriple)
  have hqNeS : q ≠ N.s := by
    intro h
    have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
    exact (Finset.mem_sdiff.mp N.s_mem_supportOnly).2 (h ▸ hqLive)
  have hqNeT : q ≠ N.t := by
    intro h
    have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
    exact (Finset.mem_sdiff.mp N.t_mem_supportOnly).2 (h ▸ hqLive)
  have hqNotMiddle : q ∉ C.B₂ := by
    rw [hmiddle]
    simp [hqNeX, hqNeY, hqNeS, hqNeT]
  let K : U5QDeletedK4Class D q S.oppApex2 C.B₂ :=
    C.row₂.toQAllowedK4Class.toQDeletedK4Class_of_not_mem_q
      hqNotMiddle
  have hoff :
      N.x ∉ (SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∨
        N.y ∉ (SelectedClass D.A S.oppApex1 radius \ S.surplusCap) := by
    by_cases hx :
        N.x ∈ (SelectedClass D.A S.oppApex1 radius \ S.surplusCap)
    · right
      intro hy
      have hpairSub :
          ({N.x, N.y} : Finset ℝ²) ⊆
            (SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∩ C.B₂ := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hx, hxB⟩
        · exact Finset.mem_inter.mpr ⟨hy, hyB⟩
      have hpairCard : ({N.x, N.y} : Finset ℝ²).card = 2 := by
        rw [Finset.card_eq_two]
        exact ⟨N.x, N.y, N.x_ne_y, rfl⟩
      have hle := Finset.card_le_card hpairSub
      rw [hpairCard] at hle
      have hbound :
          ((SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∩
            C.B₂).card ≤ 1 := by
        simpa [C] using P.fixedMarginal_secondRow_card_le_one
      omega
    · exact Or.inl hx
  exact ⟨{
    named := N
    middle_row_eq := hmiddle
    coherent_source_ne_x := hrx
    coherent_source_ne_y := hry
    dangerous_triple_eq := htripleEq
    q_not_mem_middle := hqNotMiddle
    original_q_middle_row := K
    one_live_center_off_fixedMarginal := hoff
  }⟩

/-- Four named points on the mixed boundary: one strict and one non-strict
point in each exact F2 cell. -/
structure NamedF2MixedWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (boundary : F2MixedOneLiveOneSupportBoundary S W C) where
  x : ℝ²
  y : ℝ²
  s : ℝ²
  t : ℝ²
  x_mem_liveStrict :
    x ∈ liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  y_mem_liveOnly :
    y ∈ liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  y_not_mem_strictSecondCap : y ∉ strictSecondCap S
  s_mem_supportStrict :
    s ∈ supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  t_mem_supportOnly :
    t ∈ supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  t_not_mem_strictSecondCap : t ∉ strictSecondCap S
  x_ne_y : x ≠ y
  s_ne_t : s ≠ t
  x_ne_s : x ≠ s
  x_ne_t : x ≠ t
  y_ne_s : y ≠ s
  y_ne_t : y ≠ t
  x_mem_dangerousTriple : x ∈ ({t1, t2, t3} : Finset ℝ²)
  y_eq_q_or_mem_dangerousTriple :
    y = q ∨ y ∈ ({t1, t2, t3} : Finset ℝ²)
  middle_row_eq : C.B₂ = {x, y, s, t}

/-- Name the exact four mixed-boundary points. -/
theorem nonempty_namedF2MixedWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (hqSurplus : q ∈ S.surplusCap)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (boundary : F2MixedOneLiveOneSupportBoundary S W C) :
    Nonempty (NamedF2MixedWitnesses F2 boundary) := by
  let L :=
    liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  let K :=
    supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)
  have hLcard : L.card = 2 := by
    simpa [L] using F2.failure.liveOnly_card
  have hKcard : K.card = 2 := by
    simpa [K] using F2.failure.supportOnly_card
  have hLStrictNonempty : (L ∩ strictSecondCap S).Nonempty :=
    Finset.card_pos.mp (by rw [show (L ∩ strictSecondCap S).card = 1 by
      simpa [L] using boundary.liveStrict_card]; omega)
  have hKStrictNonempty : (K ∩ strictSecondCap S).Nonempty :=
    Finset.card_pos.mp (by rw [show (K ∩ strictSecondCap S).card = 1 by
      simpa [K] using boundary.supportStrict_card]; omega)
  rcases hLStrictNonempty with ⟨x, hx⟩
  rcases hKStrictNonempty with ⟨s, hs⟩
  have hxL : x ∈ L := (Finset.mem_inter.mp hx).1
  have hsK : s ∈ K := (Finset.mem_inter.mp hs).1
  have hLeraseCard : (L.erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxL, hLcard]
  have hKeraseCard : (K.erase s).card = 1 := by
    rw [Finset.card_erase_of_mem hsK, hKcard]
  have hLeraseNonempty : (L.erase x).Nonempty :=
    Finset.card_pos.mp (by rw [hLeraseCard]; omega)
  have hKeraseNonempty : (K.erase s).Nonempty :=
    Finset.card_pos.mp (by rw [hKeraseCard]; omega)
  rcases hLeraseNonempty with ⟨y, hyErase⟩
  rcases hKeraseNonempty with ⟨t, htErase⟩
  have hyL : y ∈ L := Finset.mem_of_mem_erase hyErase
  have htK : t ∈ K := Finset.mem_of_mem_erase htErase
  have hxy : x ≠ y := by
    exact fun h => (Finset.mem_erase.mp hyErase).1 h.symm
  have hst : s ≠ t := by
    exact fun h => (Finset.mem_erase.mp htErase).1 h.symm
  have hyNotStrict : y ∉ strictSecondCap S := by
    intro hyStrict
    have hpairSub :
        ({x, y} : Finset ℝ²) ⊆ L ∩ strictSecondCap S := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hx
      · exact Finset.mem_inter.mpr ⟨hyL, hyStrict⟩
    have hpairCard : ({x, y} : Finset ℝ²).card = 2 := by
      rw [Finset.card_eq_two]
      exact ⟨x, y, hxy, rfl⟩
    have hle := Finset.card_le_card hpairSub
    rw [hpairCard] at hle
    have hstrictCard :
        (L ∩ strictSecondCap S).card = 1 := by
      simpa [L] using boundary.liveStrict_card
    omega
  have htNotStrict : t ∉ strictSecondCap S := by
    intro htStrict
    have hpairSub :
        ({s, t} : Finset ℝ²) ⊆ K ∩ strictSecondCap S := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hs
      · exact Finset.mem_inter.mpr ⟨htK, htStrict⟩
    have hpairCard : ({s, t} : Finset ℝ²).card = 2 := by
      rw [Finset.card_eq_two]
      exact ⟨s, t, hst, rfl⟩
    have hle := Finset.card_le_card hpairSub
    rw [hpairCard] at hle
    have hstrictCard :
        (K ∩ strictSecondCap S).card = 1 := by
      simpa [K] using boundary.supportStrict_card
    omega
  have hxLive : x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp (Finset.mem_sdiff.mp hxL).1).2
  have hyLive : y ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp (Finset.mem_sdiff.mp hyL).1).2
  have hsNotLive : s ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp hsK).2
  have htNotLive : t ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp htK).2
  have hxNeQ : x ≠ q := by
    intro h
    subst x
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hx).2).2
      (Finset.mem_union.mpr (Or.inl hqSurplus))
  have hxTriple : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
    rcases Finset.mem_insert.mp hxLive with h | h
    · exact False.elim (hxNeQ h)
    · exact h
  have hySplit : y = q ∨ y ∈ ({t1, t2, t3} : Finset ℝ²) :=
    Finset.mem_insert.mp hyLive
  have hxB : x ∈ C.B₂ := (Finset.mem_inter.mp (Finset.mem_sdiff.mp hxL).1).1
  have hyB : y ∈ C.B₂ := (Finset.mem_inter.mp (Finset.mem_sdiff.mp hyL).1).1
  have hsB : s ∈ C.B₂ := (Finset.mem_inter.mp (Finset.mem_sdiff.mp hsK).1).1
  have htB : t ∈ C.B₂ := (Finset.mem_inter.mp (Finset.mem_sdiff.mp htK).1).1
  have hxs : x ≠ s := fun h => hsNotLive (h ▸ hxLive)
  have hxt : x ≠ t := fun h => htNotLive (h ▸ hxLive)
  have hys : y ≠ s := fun h => hsNotLive (h ▸ hyLive)
  have hyt : y ≠ t := fun h => htNotLive (h ▸ hyLive)
  have hfour : ({x, y, s, t} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨x, y, s, t, hxy, hxs, hxt, hys, hyt, hst, rfl⟩
  have hsubset : ({x, y, s, t} : Finset ℝ²) ⊆ C.B₂ := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact hxB
    · exact hyB
    · exact hsB
    · exact htB
  have hmiddle : C.B₂ = ({x, y, s, t} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hsubset (by
      rw [C.B₂_card, hfour])).symm
  exact ⟨{
    x := x
    y := y
    s := s
    t := t
    x_mem_liveStrict := by simpa [L] using hx
    y_mem_liveOnly := by simpa [L] using hyL
    y_not_mem_strictSecondCap := hyNotStrict
    s_mem_supportStrict := by simpa [K] using hs
    t_mem_supportOnly := by simpa [K] using htK
    t_not_mem_strictSecondCap := htNotStrict
    x_ne_y := hxy
    s_ne_t := hst
    x_ne_s := hxs
    x_ne_t := hxt
    y_ne_s := hys
    y_ne_t := hyt
    x_mem_dangerousTriple := hxTriple
    y_eq_q_or_mem_dangerousTriple := hySplit
    middle_row_eq := hmiddle
  }⟩

/-- Exact mixed original-`q` middle-row status. -/
inductive AnchoredF2MixedOriginalQBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary) : Type
  | qCritical
      (y_eq_q : N.y = q)
      (row : U5QCriticalTripleClass D q S.oppApex2 (C.B₂.erase q))
      (support_eq : C.B₂.erase q = {N.x, N.s, N.t}) :
      AnchoredF2MixedOriginalQBranch N
  | qDeleted
      (y_mem_dangerousTriple :
        N.y ∈ ({t1, t2, t3} : Finset ℝ²))
      (q_not_mem_middle : q ∉ C.B₂)
      (row : U5QDeletedK4Class D q S.oppApex2 C.B₂) :
      AnchoredF2MixedOriginalQBranch N

/-- The mixed boundary is exactly q-critical or q-deleted relative to the
original live source. -/
theorem nonempty_anchoredF2MixedOriginalQBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C}
    {boundary : F2MixedOneLiveOneSupportBoundary S W C}
    (N : NamedF2MixedWitnesses F2 boundary) :
    Nonempty (AnchoredF2MixedOriginalQBranch N) := by
  rcases N.y_eq_q_or_mem_dangerousTriple with hy | hy
  · have hqB : q ∈ C.B₂ := by
      rw [N.middle_row_eq, hy]
      simp
    rcases U5QAllowedK4Class.qCriticalTriple_of_mem_q
        C.row₂.toQAllowedK4Class C.B₂_card hqB with ⟨K⟩
    have hqNeX : q ≠ N.x := by
      intro h
      exact (liveSource_not_mem_dangerousTriple W)
        (h ▸ N.x_mem_dangerousTriple)
    have hqNeS : q ≠ N.s := by
      intro h
      have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
      exact (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.s_mem_supportStrict).1).2 (h ▸ hqLive)
    have hqNeT : q ≠ N.t := by
      intro h
      have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
      exact (Finset.mem_sdiff.mp N.t_mem_supportOnly).2 (h ▸ hqLive)
    have herase : C.B₂.erase q = ({N.x, N.s, N.t} : Finset ℝ²) := by
      rw [N.middle_row_eq, hy]
      ext z
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨hzq, rfl | rfl | rfl | rfl⟩
        · exact Or.inl rfl
        · exact False.elim (hzq rfl)
        · exact Or.inr (Or.inl rfl)
        · exact Or.inr (Or.inr rfl)
      · rintro (rfl | rfl | rfl)
        · exact ⟨Ne.symm hqNeX, Or.inl rfl⟩
        · exact ⟨Ne.symm hqNeS, Or.inr (Or.inr (Or.inl rfl))⟩
        · exact ⟨Ne.symm hqNeT, Or.inr (Or.inr (Or.inr rfl))⟩
    exact ⟨.qCritical hy K herase⟩
  · have hqNotTriple := liveSource_not_mem_dangerousTriple W
    have hqNeX : q ≠ N.x := by
      intro h
      exact hqNotTriple (h ▸ N.x_mem_dangerousTriple)
    have hqNeY : q ≠ N.y := by
      intro h
      exact hqNotTriple (h ▸ hy)
    have hqNeS : q ≠ N.s := by
      intro h
      have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
      exact (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp N.s_mem_supportStrict).1).2 (h ▸ hqLive)
    have hqNeT : q ≠ N.t := by
      intro h
      have hqLive : q ∈ ({q, t1, t2, t3} : Finset ℝ²) := by simp
      exact (Finset.mem_sdiff.mp N.t_mem_supportOnly).2 (h ▸ hqLive)
    have hqNot : q ∉ C.B₂ := by
      rw [N.middle_row_eq]
      simp [hqNeX, hqNeY, hqNeS, hqNeT]
    let K : U5QDeletedK4Class D q S.oppApex2 C.B₂ :=
      C.row₂.toQAllowedK4Class.toQDeletedK4Class_of_not_mem_q
        hqNot
    exact ⟨.qDeleted hy hqNot K⟩

#print axioms liveSource_not_mem_dangerousTriple
#print axioms nonempty_anchoredF2LiveHeavyReduction
#print axioms nonempty_namedF2MixedWitnesses
#print axioms nonempty_anchoredF2MixedOriginalQBranch

end ATailRF2LiveMixedHandlerScratch
end Problem97
