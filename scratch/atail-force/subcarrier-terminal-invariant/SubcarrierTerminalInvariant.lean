/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DoubleSurvivorConsumer
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Subcarrier terminal history invariant

The first-apex descent in `DoubleSurvivorConsumer` terminates on a smaller
carrier, but its public terminal theorem forgets which robust pairs were
erased.  This scratch module retains exactly that history.

Every erased point is paired with another point which was erased in the same
robust step.  The pair is co-radial at the first opposite apex, lies outside
the surplus cap, and its simultaneous deletion preserves K4 at both opposite
apices on the ambient carrier.  Consequently an ambient K4 radius hidden by
the terminal subcarrier contains an ambient robust pair, with at least one
endpoint in the strict first opposite cap.

No production module imports this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSubcarrierTerminalInvariantScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDoubleSurvivorConsumerScratch

attribute [local instance] Classical.propDecidable

/-- The terminal conclusion of the first-apex robust descent, factored out so
the erased-pair history can be carried beside it. -/
def FirstApexTerminalOn
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (C : Finset ℝ²) : Prop :=
  ∃ r : ℝ, ∃ q w : ℝ²,
    0 < r ∧
    q ∈ (C.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
    w ∈ (C.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
    q ≠ w ∧
    ((SelectedClass C S.oppApex1 r).card = 4 ∨
      (SelectedClass C S.oppApex1 r).card = 5) ∧
    (∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass C S.oppApex1 rho).card → rho = r) ∧
    HasNEquidistantPointsAt 4
      ((C.erase q).erase w) S.oppApex2

/-- Every erased point has a mate from one actual robust descent step.

The double-survival fields are stated on `D.A`, not on the carrier at the
moment of deletion.  They therefore survive re-adding every earlier erased
point and are directly consumable by ambient geometry. -/
def RobustPairedErasureHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B C : Finset ℝ²) : Prop :=
  ∀ x : ℝ², x ∈ B \ C →
    ∃ r : ℝ, ∃ y : ℝ²,
      0 < r ∧
      x ∈ (D.A.filter fun z => dist z S.oppApex1 = r) \
        S.surplusCap ∧
      y ∈ (D.A.filter fun z => dist z S.oppApex1 = r) \
        S.surplusCap ∧
      y ∈ B \ C ∧
      x ≠ y ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex2

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hsub : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzA, hzdist⟩

private theorem marginal_mono
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {B : Finset ℝ²} (hBsub : B ⊆ D.A) {r : ℝ} {x : ℝ²}
    (hx : x ∈ (B.filter fun z => dist z S.oppApex1 = r) \
      S.surplusCap) :
    x ∈ (D.A.filter fun z => dist z S.oppApex1 = r) \
      S.surplusCap := by
  rcases Finset.mem_sdiff.mp hx with ⟨hxFilter, hxOff⟩
  rcases Finset.mem_filter.mp hxFilter with ⟨hxB, hxr⟩
  exact Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr ⟨hBsub hxB, hxr⟩, hxOff⟩

private theorem double_erased_subset_ambient
    {D : CounterexampleData} {B : Finset ℝ²}
    (hBsub : B ⊆ D.A) {q w : ℝ²} :
    (B.erase q).erase w ⊆ (D.A.erase q).erase w := by
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzw, hzq⟩
  rcases Finset.mem_erase.mp hzq with ⟨hzq, hzB⟩
  exact Finset.mem_erase.mpr
    ⟨hzw, Finset.mem_erase.mpr ⟨hzq, hBsub hzB⟩⟩

private theorem extend_history_by_robust_pair
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B C : Finset ℝ²) (hBsub : B ⊆ D.A)
    {r : ℝ} {q w : ℝ²}
    (hr : 0 < r)
    (hq : q ∈ (B.filter fun z => dist z S.oppApex1 = r) \
      S.surplusCap)
    (hw : w ∈ (B.filter fun z => dist z S.oppApex1 = r) \
      S.surplusCap)
    (hqw : q ≠ w)
    (hfirst : HasNEquidistantPointsAt 4
      ((B.erase q).erase w) S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4
      ((B.erase q).erase w) S.oppApex2)
    (hCsub : C ⊆ (B.erase q).erase w)
    (H : RobustPairedErasureHistory D S ((B.erase q).erase w) C) :
    RobustPairedErasureHistory D S B C := by
  intro x hxErased
  have hxB : x ∈ B := (Finset.mem_sdiff.mp hxErased).1
  have hxNotC : x ∉ C := (Finset.mem_sdiff.mp hxErased).2
  by_cases hxq : x = q
  · subst x
    have hwB : w ∈ B :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).1
    have hwNotC : w ∉ C := by
      intro hwC
      have hwErase := hCsub hwC
      exact (Finset.mem_erase.mp hwErase).1 rfl
    refine ⟨r, w, hr, marginal_mono hBsub hq,
      marginal_mono hBsub hw, Finset.mem_sdiff.mpr ⟨hwB, hwNotC⟩,
      hqw, ?_, ?_⟩
    · exact equidistant_mono
        (double_erased_subset_ambient hBsub) hfirst
    · exact equidistant_mono
        (double_erased_subset_ambient hBsub) hsecond
  · by_cases hxw : x = w
    · subst x
      have hqB : q ∈ B :=
        (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
      have hqNotC : q ∉ C := by
        intro hqC
        have hqErase := hCsub hqC
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hqErase).2).1 rfl
      refine ⟨r, q, hr, marginal_mono hBsub hw,
        marginal_mono hBsub hq, Finset.mem_sdiff.mpr ⟨hqB, hqNotC⟩,
        hqw.symm, ?_, ?_⟩
      · simpa [Finset.erase_right_comm] using
          (equidistant_mono
            (double_erased_subset_ambient hBsub) hfirst)
      · simpa [Finset.erase_right_comm] using
          (equidistant_mono
            (double_erased_subset_ambient hBsub) hsecond)
    · have hxSmall : x ∈ (B.erase q).erase w :=
        Finset.mem_erase.mpr
          ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxB⟩⟩
      rcases H x (Finset.mem_sdiff.mpr ⟨hxSmall, hxNotC⟩) with
        ⟨rho, y, hrho, hxMarginal, hyMarginal, hySmall, hxy,
          hfirstAmbient, hsecondAmbient⟩
      have hyB : y ∈ B := by
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp (Finset.mem_sdiff.mp hySmall).1).2).2
      exact ⟨rho, y, hrho, hxMarginal, hyMarginal,
        Finset.mem_sdiff.mpr
          ⟨hyB, (Finset.mem_sdiff.mp hySmall).2⟩,
        hxy, hfirstAmbient, hsecondAmbient⟩

/-- The descent can be run without discarding its robust erased-pair history.
This is the constructive history theorem missing from the older
`PairedErasureHistory` audit. -/
theorem exists_firstApex_terminal_subcarrier_with_robust_history
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    ∃ C : Finset ℝ², C ⊆ B ∧
      RobustPairedErasureHistory D S B C ∧
      FirstApexTerminalOn D S C := by
  classical
  rcases biApex_double_survival_step_or_firstApex_terminal
      D S B hBsub hfirst hsecond with hrobust | hterminal
  · rcases hrobust with
      ⟨r, q, w, hr, hq, hw, hqw, hfirstDouble, hsecondDouble,
        hcardDrop⟩
    let B' := (B.erase q).erase w
    have hB'subB : B' ⊆ B := by
      intro x hx
      exact (Finset.mem_erase.mp
        (Finset.mem_erase.mp hx).2).2
    have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
    rcases exists_firstApex_terminal_subcarrier_with_robust_history
        D S B' hB'subA hfirstDouble hsecondDouble with
      ⟨C, hCB', H, hterminalC⟩
    exact ⟨C, hCB'.trans hB'subB,
      extend_history_by_robust_pair D S B C hBsub hr hq hw hqw
        hfirstDouble hsecondDouble hCB' H,
      hterminalC⟩
  · rcases hterminal with
      ⟨r, q, w, hr, hq, hw, hqw, hcard, hunique, hsecondDouble⟩
    refine ⟨B, by intro x hx; exact hx, ?_, ?_⟩
    · intro x hx
      exact False.elim ((Finset.mem_sdiff.mp hx).2
        (Finset.mem_sdiff.mp hx).1)
    · exact ⟨r, q, w, hr, hq, hw, hqw, hcard, hunique,
        hsecondDouble⟩
termination_by B.card
decreasing_by omega

/-- On the actual robust first-apex branch, the strengthened descent has a
nonempty ambient history: the original frontier pair is retained in it. -/
theorem exists_terminal_with_nonempty_robust_history_of_frontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r : ℝ} (H : CriticalShellSystem D.A)
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex1)
    (hsecondDouble : HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex2) :
    ∃ C : Finset ℝ²,
      C ⊆ (D.A.erase P.q).erase P.w ∧
      P.q ∈ D.A \ C ∧
      RobustPairedErasureHistory D S D.A C ∧
      FirstApexTerminalOn D S C := by
  let B := (D.A.erase P.q).erase P.w
  have hBsub : B ⊆ D.A := by
    intro x hx
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hx).2).2
  rcases exists_firstApex_terminal_subcarrier_with_robust_history
      D S B hBsub hfirstDouble hsecondDouble with
    ⟨C, hCB, Hhist, hterminal⟩
  have hqNotC : P.q ∉ C := by
    intro hqC
    have hqB := hCB hqC
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hqB).2).1 rfl
  have hfullHistory : RobustPairedErasureHistory D S D.A C := by
    apply extend_history_by_robust_pair D S D.A C
      (by intro x hx; exact hx)
      hr
      P.q_mem_marginal P.w_mem_marginal P.q_ne_w
      hfirstDouble hsecondDouble hCB Hhist
  exact ⟨C, hCB, Finset.mem_sdiff.mpr ⟨P.q_mem_A, hqNotC⟩,
    hfullHistory, hterminal⟩

/-- A hidden ambient K4 radius produces an erased robust pair.  The cap cover
and the adjacent one-hit theorem additionally force at least one endpoint of
that pair into the strict first opposite cap. -/
structure AmbientRobustHistoryPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (C : Finset ℝ²) (rho : ℝ) where
  x : ℝ²
  y : ℝ²
  x_mem_erased : x ∈ D.A \ C
  y_mem_erased : y ∈ D.A \ C
  x_mem_class : x ∈ SelectedClass D.A S.oppApex1 rho
  y_mem_class : y ∈ SelectedClass D.A S.oppApex1 rho
  x_ne_y : x ≠ y
  x_off_surplus : x ∉ S.surplusCap
  y_off_surplus : y ∉ S.surplusCap
  first_double : HasNEquidistantPointsAt 4
    ((D.A.erase x).erase y) S.oppApex1
  second_double : HasNEquidistantPointsAt 4
    ((D.A.erase x).erase y) S.oppApex2
  strict_endpoint :
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      y ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

private theorem exists_mem_selectedClass_sdiff_subcarrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {terminalRadius rho : ℝ}
    (_hCsub : C ⊆ D.A)
    (hunique : ∀ d : ℝ, 0 < d →
      4 ≤ (SelectedClass C S.oppApex1 d).card →
      d = terminalRadius)
    (hrho : 0 < rho)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card)
    (hne : rho ≠ terminalRadius) :
    ∃ x, x ∈ SelectedClass D.A S.oppApex1 rho ∧ x ∈ D.A \ C := by
  by_contra hex
  have hsub : SelectedClass D.A S.oppApex1 rho ⊆
      SelectedClass C S.oppApex1 rho := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
    have hxC : x ∈ C := by
      by_contra hxNotC
      exact hex ⟨x, hx, Finset.mem_sdiff.mpr ⟨hxA, hxNotC⟩⟩
    exact mem_selectedClass.mpr ⟨hxC, hxdist⟩
  have hfourC : 4 ≤ (SelectedClass C S.oppApex1 rho).card :=
    le_trans hfour (Finset.card_le_card hsub)
  exact hne (hunique rho hrho hfourC)

private theorem strictOppCap1_of_class_mem_off_surplus_not_oppCap2
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {rho : ℝ} {x : ℝ²}
    (hxClass : x ∈ SelectedClass D.A S.oppApex1 rho)
    (hxOffSurplus : x ∉ S.surplusCap)
    (hxOffOpp2 : x ∉ S.oppCap2) :
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hxFilter :
      x ∈ D.A.filter fun z => dist z S.oppApex1 = rho := by
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxdist⟩
    exact Finset.mem_filter.mpr ⟨hxA, by simpa [dist_comm] using hxdist⟩
  have hxCover :=
    U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover DS rho hxFilter
  simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
  rcases hxCover with (hxSurplus | hxOpp2) | hxStrict
  · exact False.elim (hxOffSurplus hxSurplus)
  · exact False.elim (hxOffOpp2 hxOpp2)
  · simpa [DS] using hxStrict

/-- Any named erased history point produces a direct ambient robust pair.
No comparison with the terminal radius is needed: the history already records
co-radiality and double survival on the full ambient carrier. -/
theorem exists_ambientRobustHistoryPair_of_erased
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {C : Finset ℝ²}
    (Hhist : RobustPairedErasureHistory D S D.A C)
    {x : ℝ²} (hxErased : x ∈ D.A \ C) :
    ∃ rho : ℝ, Nonempty (AmbientRobustHistoryPair D S C rho) := by
  rcases Hhist x hxErased with
    ⟨rho, y, _hrho, hxMarginal, hyMarginal, hyErased, hxy,
      hfirstDouble, hsecondDouble⟩
  have hxClass : x ∈ SelectedClass D.A S.oppApex1 rho := by
    rcases Finset.mem_sdiff.mp hxMarginal with ⟨hxFilter, _⟩
    rcases Finset.mem_filter.mp hxFilter with ⟨hxA, hxr⟩
    exact mem_selectedClass.mpr
      ⟨hxA, by simpa [dist_comm] using hxr⟩
  have hyClass : y ∈ SelectedClass D.A S.oppApex1 rho := by
    rcases Finset.mem_sdiff.mp hyMarginal with ⟨hyFilter, _⟩
    rcases Finset.mem_filter.mp hyFilter with ⟨hyA, hyr⟩
    exact mem_selectedClass.mpr
      ⟨hyA, by simpa [dist_comm] using hyr⟩
  have hxOff : x ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hxMarginal).2
  have hyOff : y ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hyMarginal).2
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS rho
  have hnotBoth : x ∉ S.oppCap2 ∨ y ∉ S.oppCap2 := by
    by_contra hboth
    push_neg at hboth
    rw [Finset.card_le_one] at hone
    have hxeq : x = y := hone x
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr ⟨(mem_selectedClass.mp hxClass).1,
          by simpa [dist_comm] using (mem_selectedClass.mp hxClass).2⟩,
        hboth.1⟩)
      y
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr ⟨(mem_selectedClass.mp hyClass).1,
          by simpa [dist_comm] using (mem_selectedClass.mp hyClass).2⟩,
        hboth.2⟩)
    exact hxy hxeq
  refine ⟨rho, ⟨{
    x := x
    y := y
    x_mem_erased := hxErased
    y_mem_erased := hyErased
    x_mem_class := hxClass
    y_mem_class := hyClass
    x_ne_y := hxy
    x_off_surplus := hxOff
    y_off_surplus := hyOff
    first_double := hfirstDouble
    second_double := hsecondDouble
    strict_endpoint := ?_ }⟩⟩
  rcases hnotBoth with hxNot | hyNot
  · exact Or.inl
      (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
        D S hxClass hxOff hxNot)
  · exact Or.inr
      (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
        D S hyClass hyOff hyNot)

/-- Direct R-branch export: the terminal carrier, its full ambient history,
and an ambient robust pair obtained from the original erased frontier point. -/
theorem exists_terminal_and_ambientRobustHistoryPair_of_frontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r : ℝ} (H : CriticalShellSystem D.A)
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex1)
    (hsecondDouble : HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex2) :
    ∃ C : Finset ℝ²,
      C ⊆ (D.A.erase P.q).erase P.w ∧
      RobustPairedErasureHistory D S D.A C ∧
      FirstApexTerminalOn D S C ∧
      ∃ rho : ℝ, Nonempty (AmbientRobustHistoryPair D S C rho) := by
  rcases exists_terminal_with_nonempty_robust_history_of_frontier
      D S H P hr hfirstDouble hsecondDouble with
    ⟨C, hCsub, hqErased, Hhist, hterminal⟩
  rcases exists_ambientRobustHistoryPair_of_erased D S Hhist hqErased with
    ⟨rho, hpair⟩
  exact ⟨C, hCsub, Hhist, hterminal, rho, hpair⟩

/-- Every alternate ambient K4 radius hidden by the terminal carrier contains
an ambient robust history pair, and the cap geometry places at least one of
its endpoints in strict `oppCap1`. -/
theorem exists_hiddenAmbientRadiusHistoryPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {C : Finset ℝ²} {terminalRadius rho : ℝ}
    (hCsub : C ⊆ D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C)
    (hunique : ∀ d : ℝ, 0 < d →
      4 ≤ (SelectedClass C S.oppApex1 d).card →
      d = terminalRadius)
    (hrho : 0 < rho)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card)
    (hne : rho ≠ terminalRadius) :
    Nonempty (AmbientRobustHistoryPair D S C rho) := by
  rcases exists_mem_selectedClass_sdiff_subcarrier hCsub hunique
      hrho hfour hne with ⟨x, hxClass, hxErased⟩
  rcases Hhist x hxErased with
    ⟨r, y, hr, hxMarginal, hyMarginal, hyErased, hxy,
      hfirstDouble, hsecondDouble⟩
  have hxr : dist S.oppApex1 x = r := by
    have h := (Finset.mem_filter.mp (Finset.mem_sdiff.mp hxMarginal).1).2
    simpa [dist_comm] using h
  have hxrRho : dist S.oppApex1 x = rho :=
    (mem_selectedClass.mp hxClass).2
  have hrEq : r = rho := hxr.symm.trans hxrRho
  have hyClass : y ∈ SelectedClass D.A S.oppApex1 rho := by
    rcases Finset.mem_sdiff.mp hyMarginal with ⟨hyFilter, _⟩
    rcases Finset.mem_filter.mp hyFilter with ⟨hyA, hyr⟩
    exact mem_selectedClass.mpr
      ⟨hyA, by simpa [dist_comm, hrEq] using hyr⟩
  have hxOff : x ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hxMarginal).2
  have hyOff : y ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hyMarginal).2
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS rho
  have hnotBoth : x ∉ S.oppCap2 ∨ y ∉ S.oppCap2 := by
    by_contra hboth
    push_neg at hboth
    rw [Finset.card_le_one] at hone
    have hxeq : x = y := hone x
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr ⟨(mem_selectedClass.mp hxClass).1,
          by simpa [dist_comm] using (mem_selectedClass.mp hxClass).2⟩,
        hboth.1⟩)
      y
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr ⟨(mem_selectedClass.mp hyClass).1,
          by simpa [dist_comm] using (mem_selectedClass.mp hyClass).2⟩,
        hboth.2⟩)
    exact hxy hxeq
  refine ⟨{
    x := x
    y := y
    x_mem_erased := hxErased
    y_mem_erased := hyErased
    x_mem_class := hxClass
    y_mem_class := hyClass
    x_ne_y := hxy
    x_off_surplus := hxOff
    y_off_surplus := hyOff
    first_double := hfirstDouble
    second_double := hsecondDouble
    strict_endpoint := ?_ }⟩
  rcases hnotBoth with hxNot | hyNot
  · exact Or.inl
      (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
        D S hxClass hxOff hxNot)
  · exact Or.inr
      (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
        D S hyClass hyOff hyNot)

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

/-- The ambient ordered-cap terminal which survives every re-addition.

For a hidden history pair, the first apex and the source's actual blocker
cannot be two distinct centers in the surplus cap if the blocker row contains
the mate.  This isolates the exact two-field producer still missing from the
current total critical-map interface: surplus-cap blocker placement and the
directed cross membership. -/
theorem AmbientRobustHistoryPair.false_of_sourceBlocker_surplus_cross
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hcenterSurplus : H.centerAt P.x
      (mem_selectedClass.mp P.x_mem_class).1 ∈ S.surplusCap)
    (hyCross : P.y ∈
      (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support) :
    False := by
  classical
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  have hyA : P.y ∈ D.A := (mem_selectedClass.mp P.y_mem_class).1
  let c := H.centerAt P.x hxA
  have hcNe : c ≠ S.oppApex1 := by
    apply actual_blocker_ne_of_deletion_survives H hxA
    apply equidistant_mono (B := D.A.erase P.x) _ P.first_double
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hapexEq : dist S.oppApex1 P.x = dist S.oppApex1 P.y :=
    (mem_selectedClass.mp P.x_mem_class).2.trans
      (mem_selectedClass.mp P.y_mem_class).2.symm
  have hcEq : dist c P.x = dist c P.y := by
    exact
      (H.selectedAt P.x hxA).toCriticalFourShell.support_eq_radius
        P.x
        (H.selectedAt P.x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt P.x hxA).toCriticalFourShell.support_eq_radius
          P.y hyCross).symm
  have hcapEq := capByIndex_surplusIdx_eq_surplusCap S
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact hcenterSurplus
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact oppApex1_mem_surplusCap S
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hicNe : ic ≠ ia := by
    intro h
    apply hcNe
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = S.oppApex1 := hia
  have hxOutside : P.x ∉ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact P.x_off_surplus
  have hyOutside : P.y ∉ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact P.y_off_surplus
  rcases lt_or_gt_of_ne hicNe with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt hxA hyA hxOutside hyOutside
      P.x_ne_y (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt hxA hyA hxOutside hyOutside
      P.x_ne_y (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- Exact complement of the stable ordered-cap sink.  For the source `x` of
every hidden history pair, either its chosen blocker is outside the surplus
cap, or its chosen exact shell omits the mate `y`. -/
theorem AmbientRobustHistoryPair.sourceBlocker_outside_surplus_or_cross_omitted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉
        S.surplusCap ∨
      P.y ∉
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support := by
  by_cases hcenter :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
        S.surplusCap
  · right
    intro hyCross
    exact P.false_of_sourceBlocker_surplus_cross H hcenter hyCross
  · exact Or.inl hcenter

/-- Operational form of the complement: cross omission is exactly K4
survival after deleting the mate at the source's chosen blocker. -/
theorem AmbientRobustHistoryPair.sourceBlocker_outside_surplus_or_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉
        S.surplusCap ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.y)
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) := by
  rcases P.sourceBlocker_outside_surplus_or_cross_omitted H with
    houtside | homits
  · exact Or.inl houtside
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support H
        (mem_selectedClass.mp P.x_mem_class).1).mpr homits)

#print axioms exists_firstApex_terminal_subcarrier_with_robust_history
#print axioms exists_terminal_with_nonempty_robust_history_of_frontier
#print axioms exists_ambientRobustHistoryPair_of_erased
#print axioms exists_terminal_and_ambientRobustHistoryPair_of_frontier
#print axioms exists_hiddenAmbientRadiusHistoryPair
#print axioms AmbientRobustHistoryPair.false_of_sourceBlocker_surplus_cross
#print axioms AmbientRobustHistoryPair.sourceBlocker_outside_surplus_or_cross_omitted
#print axioms AmbientRobustHistoryPair.sourceBlocker_outside_surplus_or_cross_deletion_survives

end ATailSubcarrierTerminalInvariantScratch
end Problem97
