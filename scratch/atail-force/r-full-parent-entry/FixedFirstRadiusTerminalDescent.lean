/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SubcarrierTerminalInvariant

/-!
# Fixed-first-radius terminal descent

The existing bi-apex descent preserves some first-apex K4 witness at every
robust step, but it is free to change the witness radius.  This file records a
source-faithful refinement: once a fixed first-apex radius still has four
points on the active carrier, the remaining descent can be chosen so that it
never spends that radius.

If the fixed class has at least six points, erase two of its points and retain
four.  If it has four or five points and another K4 radius exists, erase two
points from the other radius, leaving the fixed class unchanged.  Otherwise
the fixed radius is already the terminal unique card-four/card-five radius.

For a production frontier this applies after the original pair is erased when
its ambient class has cardinality at least six.  In the complementary
card-four/card-five robust branch, the original radius is already spent at
that first transition and an alternate K4 radius is the surviving witness.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDoubleSurvivorConsumerScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The ordinary terminal predicate with its unique first-apex radius fixed
in the type. -/
def FixedFirstRadiusTerminalOn
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (C : Finset ℝ²) (radius : ℝ) : Prop :=
  ∃ q w : ℝ²,
    0 < radius ∧
    q ∈ (C.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap ∧
    w ∈ (C.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap ∧
    q ≠ w ∧
    ((SelectedClass C S.oppApex1 radius).card = 4 ∨
      (SelectedClass C S.oppApex1 radius).card = 5) ∧
    (∀ d : ℝ, 0 < d →
      4 ≤ (SelectedClass C S.oppApex1 d).card → d = radius) ∧
    HasNEquidistantPointsAt 4
      ((C.erase q).erase w) S.oppApex2

/-- Forget that the terminal radius was fixed before the descent. -/
theorem FixedFirstRadiusTerminalOn.toFirstApexTerminalOn
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {radius : ℝ}
    (h : FixedFirstRadiusTerminalOn D S C radius) :
    FirstApexTerminalOn D S C := by
  rcases h with
    ⟨q, w, hradius, hq, hw, hqw, hcard, hunique, hsecond⟩
  exact ⟨radius, q, w, hradius, hq, hw, hqw, hcard, hunique, hsecond⟩

/-- A fixed-radius terminal carrier together with the complete robust erasure
history used to reach it. -/
structure FixedFirstRadiusTerminalHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (radius : ℝ) : Type where
  carrier : Finset ℝ²
  carrier_subset : carrier ⊆ B
  history : RobustPairedErasureHistory D S B carrier
  terminal : FixedFirstRadiusTerminalOn D S carrier radius

private theorem fixedRadius_equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hsub : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzA, hzdist⟩

private theorem fixedRadius_marginal_mono
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

private theorem fixedRadius_double_erased_subset_ambient
    {D : CounterexampleData} {B : Finset ℝ²}
    (hBsub : B ⊆ D.A) {q w : ℝ²} :
    (B.erase q).erase w ⊆ (D.A.erase q).erase w := by
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzw, hzq⟩
  rcases Finset.mem_erase.mp hzq with ⟨hzq, hzB⟩
  exact Finset.mem_erase.mpr
    ⟨hzw, Finset.mem_erase.mpr ⟨hzq, hBsub hzB⟩⟩

/-- Prepend one fixed-radius-strategy erasure to an already retained robust
history. -/
private theorem fixedRadius_extend_history_by_pair
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
      exact (Finset.mem_erase.mp (hCsub hwC)).1 rfl
    refine ⟨r, w, hr, fixedRadius_marginal_mono hBsub hq,
      fixedRadius_marginal_mono hBsub hw,
      Finset.mem_sdiff.mpr ⟨hwB, hwNotC⟩, hqw, ?_, ?_⟩
    · exact fixedRadius_equidistant_mono
        (fixedRadius_double_erased_subset_ambient hBsub) hfirst
    · exact fixedRadius_equidistant_mono
        (fixedRadius_double_erased_subset_ambient hBsub) hsecond
  · by_cases hxw : x = w
    · subst x
      have hqB : q ∈ B :=
        (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
      have hqNotC : q ∉ C := by
        intro hqC
        have hqDouble := hCsub hqC
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hqDouble).2).1 rfl
      refine ⟨r, q, hr, fixedRadius_marginal_mono hBsub hw,
        fixedRadius_marginal_mono hBsub hq,
        Finset.mem_sdiff.mpr ⟨hqB, hqNotC⟩, hqw.symm, ?_, ?_⟩
      · simpa [Finset.erase_right_comm] using
          (fixedRadius_equidistant_mono
            (fixedRadius_double_erased_subset_ambient hBsub) hfirst)
      · simpa [Finset.erase_right_comm] using
          (fixedRadius_equidistant_mono
            (fixedRadius_double_erased_subset_ambient hBsub) hsecond)
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

private theorem three_le_fixedRadius_offSurplus
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A) (radius : ℝ)
    (hfour : 4 ≤ (SelectedClass B S.oppApex1 radius).card) :
    3 ≤ ((B.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap).card := by
  let F := B.filter fun x => dist x S.oppApex1 = radius
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFfour : 4 ≤ F.card := by
    simpa [F, SelectedClass, dist_comm] using hfour
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    calc
      (F ∩ S.surplusCap).card
          ≤ ((D.A.filter fun x => dist x S.oppApex1 = radius) ∩
              S.surplusCap).card :=
        Finset.card_le_card (by
          intro x hx
          rcases Finset.mem_inter.mp hx with ⟨hxF, hxCap⟩
          rcases Finset.mem_filter.mp hxF with ⟨hxB, hxdist⟩
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr ⟨hBsub hxB, hxdist⟩, hxCap⟩)
      _ ≤ 1 := by
        simpa [DS] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS radius
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  simpa [F] using (show 3 ≤ (F \ S.surplusCap).card by omega)

private theorem selected_of_fixedRadius_marginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {B : Finset ℝ²} {radius : ℝ} {x : ℝ²}
    (hx : x ∈ (B.filter fun z => dist z S.oppApex1 = radius) \
      S.surplusCap) :
    x ∈ SelectedClass B S.oppApex1 radius := by
  rcases Finset.mem_filter.mp (Finset.mem_sdiff.mp hx).1 with
    ⟨hxB, hxdist⟩
  exact mem_selectedClass.mpr ⟨hxB, by simpa [dist_comm] using hxdist⟩

/-- A fixed first-apex K4 radius can be preserved through the entire
bi-apex descent, while retaining the complete ambient robust-pair history. -/
theorem exists_fixedFirstRadiusTerminalHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (radius : ℝ) (hradius : 0 < radius)
    (hfixed : 4 ≤ (SelectedClass B S.oppApex1 radius).card)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    Nonempty (FixedFirstRadiusTerminalHistory D S B radius) := by
  classical
  by_cases hsix : 6 ≤ (SelectedClass B S.oppApex1 radius).card
  · have hthree := three_le_fixedRadius_offSurplus
      D S B hBsub radius hfixed
    rcases exists_pair_double_deletion_survives_secondApex_on_subset
        D S B hBsub radius hsecond hthree with
      ⟨q, w, hq, hw, hqw, hsecondDouble⟩
    let B' := (B.erase q).erase w
    have hB'subB : B' ⊆ B := by
      intro z hz
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
    have hfive :
        5 ≤ (SelectedClass (B.erase q) S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hsix
    have hfixed' :
        4 ≤ (SelectedClass B' S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    have hfirstDouble :
        HasNEquidistantPointsAt 4 B' S.oppApex1 :=
      ⟨radius, hradius, by simpa [SelectedClass] using hfixed'⟩
    rcases exists_fixedFirstRadiusTerminalHistory
        D S B' hB'subA radius hradius hfixed' hsecondDouble with ⟨T⟩
    exact ⟨
      { carrier := T.carrier
        carrier_subset := T.carrier_subset.trans hB'subB
        history := fixedRadius_extend_history_by_pair
          D S B T.carrier hBsub hradius hq hw hqw
            hfirstDouble hsecondDouble T.carrier_subset T.history
        terminal := T.terminal }⟩
  · have hcard :
        (SelectedClass B S.oppApex1 radius).card = 4 ∨
          (SelectedClass B S.oppApex1 radius).card = 5 := by
      omega
    by_cases hunique : ∀ d : ℝ, 0 < d →
        4 ≤ (SelectedClass B S.oppApex1 d).card → d = radius
    · have hthree := three_le_fixedRadius_offSurplus
          D S B hBsub radius hfixed
      rcases exists_pair_double_deletion_survives_secondApex_on_subset
          D S B hBsub radius hsecond hthree with
        ⟨q, w, hq, hw, hqw, hsecondDouble⟩
      exact ⟨
        { carrier := B
          carrier_subset := fun _ hz => hz
          history := by
            intro x hx
            exact False.elim
              ((Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hx).1)
          terminal :=
            ⟨q, w, hradius, hq, hw, hqw, hcard, hunique,
              hsecondDouble⟩ }⟩
    · push_neg at hunique
      rcases hunique with ⟨otherRadius, hotherPos, hotherFour, hotherNe⟩
      have hthree := three_le_fixedRadius_offSurplus
        D S B hBsub otherRadius hotherFour
      rcases exists_pair_double_deletion_survives_secondApex_on_subset
          D S B hBsub otherRadius hsecond hthree with
        ⟨q, w, hq, hw, hqw, hsecondDouble⟩
      have hqOther := selected_of_fixedRadius_marginal hq
      have hwOther := selected_of_fixedRadius_marginal hw
      have hqNot : q ∉ SelectedClass B S.oppApex1 radius := by
        intro hqFixed
        exact hotherNe
          ((mem_selectedClass.mp hqOther).2.symm.trans
            (mem_selectedClass.mp hqFixed).2)
      have hwNot : w ∉ SelectedClass B S.oppApex1 radius := by
        intro hwFixed
        exact hotherNe
          ((mem_selectedClass.mp hwOther).2.symm.trans
            (mem_selectedClass.mp hwFixed).2)
      let B' := (B.erase q).erase w
      have hB'subB : B' ⊆ B := by
        intro z hz
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
      have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
      have hqCard :
          (SelectedClass (B.erase q) S.oppApex1 radius).card =
            (SelectedClass B S.oppApex1 radius).card :=
        selectedClass_erase_card_eq_of_not_mem hqNot
      have hwNotErase :
          w ∉ SelectedClass (B.erase q) S.oppApex1 radius := by
        rw [selectedClass_erase_eq]
        exact fun hwErase => hwNot (Finset.mem_of_mem_erase hwErase)
      have hwCard :
          (SelectedClass B' S.oppApex1 radius).card =
            (SelectedClass (B.erase q) S.oppApex1 radius).card :=
        selectedClass_erase_card_eq_of_not_mem hwNotErase
      have hfixed' :
          4 ≤ (SelectedClass B' S.oppApex1 radius).card := by
        rw [hwCard, hqCard]
        exact hfixed
      have hfirstDouble :
          HasNEquidistantPointsAt 4 B' S.oppApex1 :=
        ⟨radius, hradius, by simpa [SelectedClass] using hfixed'⟩
      rcases exists_fixedFirstRadiusTerminalHistory
          D S B' hB'subA radius hradius hfixed' hsecondDouble with ⟨T⟩
      exact ⟨
        { carrier := T.carrier
          carrier_subset := T.carrier_subset.trans hB'subB
          history := fixedRadius_extend_history_by_pair
            D S B T.carrier hBsub hotherPos hq hw hqw
              hfirstDouble hsecondDouble T.carrier_subset T.history
          terminal := T.terminal }⟩
termination_by B.card
decreasing_by
  all_goals
    try dsimp [B']
    have hqB : q ∈ B :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
    have hwB : w ∈ B :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).1
    have hwErase : w ∈ B.erase q :=
      Finset.mem_erase.mpr ⟨hqw.symm, hwB⟩
    have hBnontrivial : 1 < B.card :=
      Finset.one_lt_card.mpr ⟨q, hqB, w, hwB, hqw⟩
    rw [Finset.card_erase_of_mem hwErase,
      Finset.card_erase_of_mem hqB]
    omega

/-- The fixed-radius refinement after the original frontier pair has been
erased, together with the original pair prepended to the ambient history. -/
structure FixedFrontierRadiusTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  terminal : FixedFirstRadiusTerminalHistory D S
    ((D.A.erase F.pair.q).erase F.pair.w) radius
  ambient_history :
    RobustPairedErasureHistory D S D.A terminal.carrier

/-- Exact failure certificate at the first frontier transition: the original
radius had only four or five points, both named points were erased, and a
different radius is the K4 witness which keeps the R branch alive. -/
structure FrontierRadiusSpentAtEntry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  ambient_card :
    (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5
  post_erase_card_le_three :
    (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
      S.oppApex1 radius).card ≤ 3
  alternateRadius : ℝ
  alternateRadius_pos : 0 < alternateRadius
  alternateRadius_four :
    4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
      S.oppApex1 alternateRadius).card
  alternateRadius_ne : alternateRadius ≠ radius

/-- Branch-complete fixed-radius refinement of the robust first-apex frontier.

At ambient cardinality at least six, the original radius survives the
frontier deletion and can be preserved to the terminal carrier.  Otherwise
the R branch itself certifies that this radius was spent at entry and that a
different radius is carrying the surviving K4 witness. -/
theorem CriticalPairFrontier.fixedRadiusTerminal_or_spentAtEntry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1) :
    Nonempty (FixedFrontierRadiusTerminal F) ∨
      Nonempty (FrontierRadiusSpentAtEntry F) := by
  classical
  let B := (D.A.erase F.pair.q).erase F.pair.w
  by_cases hsix : 6 ≤ (SelectedClass D.A S.oppApex1 radius).card
  · have hfive :
        5 ≤ (SelectedClass (D.A.erase F.pair.q)
          S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hsix
    have hfixedB :
        4 ≤ (SelectedClass B S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    have hBsub : B ⊆ D.A := by
      intro z hz
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    rcases exists_fixedFirstRadiusTerminalHistory
        D S B hBsub radius hradius hfixedB F.secondApexDouble with ⟨T⟩
    have hambient :
        RobustPairedErasureHistory D S D.A T.carrier :=
      fixedRadius_extend_history_by_pair
        D S D.A T.carrier (fun _ hz => hz) hradius
          F.pair.q_mem_marginal F.pair.w_mem_marginal F.pair.q_ne_w
          hfirstDouble F.secondApexDouble T.carrier_subset T.history
    exact Or.inl ⟨⟨T, hambient⟩⟩
  · right
    have hcard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
          (SelectedClass D.A S.oppApex1 radius).card = 5 := by
      omega
    have hqClass :
        F.pair.q ∈ SelectedClass D.A S.oppApex1 radius :=
      selected_of_fixedRadius_marginal F.pair.q_mem_marginal
    have hwClass :
        F.pair.w ∈ SelectedClass D.A S.oppApex1 radius :=
      selected_of_fixedRadius_marginal F.pair.w_mem_marginal
    have hwErase :
        F.pair.w ∈ SelectedClass (D.A.erase F.pair.q)
          S.oppApex1 radius := by
      rw [selectedClass_erase_eq]
      exact Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hwClass⟩
    have hpost :
        (SelectedClass B S.oppApex1 radius).card ≤ 3 := by
      dsimp [B]
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hwErase,
        selectedClass_erase_eq,
        Finset.card_erase_of_mem hqClass]
      omega
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        hfirstDouble with ⟨otherRadius, hotherPos, hotherFour⟩
    have hotherNe : otherRadius ≠ radius := by
      intro heq
      subst otherRadius
      have hotherFour' :
          4 ≤ (SelectedClass B S.oppApex1 radius).card := by
        simpa [B] using hotherFour
      omega
    exact ⟨
      { ambient_card := hcard
        post_erase_card_le_three := hpost
        alternateRadius := otherRadius
        alternateRadius_pos := hotherPos
        alternateRadius_four := by simpa [B] using hotherFour
        alternateRadius_ne := hotherNe }⟩

/- ## Single-radius descent without terminal uniqueness

The preceding descent preserves a distinguished radius while it searches for
a *unique-radius* terminal.  Once the distinguished class has cardinality
four or five, that search may erase points from other radii.  This is useful
for the old terminal interface, but it loses the radius coherence needed by
the actual-blocker cycle.

The refinement below stops as soon as the distinguished class has cardinality
four or five.  Every preceding erasure is chosen from that class itself.  The
terminal therefore need not have a unique K4 radius, but every erased source
and every mate reconstructed from the robust history lies on one fixed
ambient circle about `S.oppApex1`.
-/

/-- A fixed-radius terminal that does not demand uniqueness among all K4
radii.  It retains exactly the fields needed to select the final pair and
keep K4 at the second opposite apex. -/
def FixedSingleRadiusTerminalOn
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (C : Finset ℝ²) (radius : ℝ) : Prop :=
  ∃ q w : ℝ²,
    0 < radius ∧
    q ∈ (C.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap ∧
    w ∈ (C.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap ∧
    q ≠ w ∧
    ((SelectedClass C S.oppApex1 radius).card = 4 ∨
      (SelectedClass C S.oppApex1 radius).card = 5) ∧
    HasNEquidistantPointsAt 4
      ((C.erase q).erase w) S.oppApex2

/-- A terminal reached by erasing pairs only from one fixed ambient
first-apex radius class.  The final field is the coherence invariant that is
absent from `RobustPairedErasureHistory` itself. -/
structure FixedSingleRadiusTerminalHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (radius : ℝ) : Type where
  carrier : Finset ℝ²
  carrier_subset : carrier ⊆ B
  history : RobustPairedErasureHistory D S B carrier
  erased_mem_fixedClass :
    ∀ x : ℝ², x ∈ B \ carrier →
      x ∈ SelectedClass D.A S.oppApex1 radius
  terminal : FixedSingleRadiusTerminalOn D S carrier radius

/-- Erase only pairs from one distinguished first-apex radius until that
same radius class has cardinality four or five.

Unlike `exists_fixedFirstRadiusTerminalHistory`, this theorem deliberately
does not continue through an alternate K4 radius.  Consequently every erased
point remains in the distinguished ambient class, which is the invariant
needed to make the actual-blocker cycle radius-coherent. -/
theorem exists_fixedSingleRadiusTerminalHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (radius : ℝ) (hradius : 0 < radius)
    (hfixed : 4 ≤ (SelectedClass B S.oppApex1 radius).card)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    Nonempty (FixedSingleRadiusTerminalHistory D S B radius) := by
  classical
  by_cases hsix : 6 ≤ (SelectedClass B S.oppApex1 radius).card
  · have hthree := three_le_fixedRadius_offSurplus
      D S B hBsub radius hfixed
    rcases exists_pair_double_deletion_survives_secondApex_on_subset
        D S B hBsub radius hsecond hthree with
      ⟨q, w, hq, hw, hqw, hsecondDouble⟩
    let B' := (B.erase q).erase w
    have hB'subB : B' ⊆ B := by
      intro z hz
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
    have hfive :
        5 ≤ (SelectedClass (B.erase q) S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hsix
    have hfixed' :
        4 ≤ (SelectedClass B' S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    have hfirstDouble :
        HasNEquidistantPointsAt 4 B' S.oppApex1 :=
      ⟨radius, hradius, by simpa [SelectedClass] using hfixed'⟩
    rcases exists_fixedSingleRadiusTerminalHistory
        D S B' hB'subA radius hradius hfixed' hsecondDouble with ⟨T⟩
    exact ⟨
      { carrier := T.carrier
        carrier_subset := T.carrier_subset.trans hB'subB
        history := fixedRadius_extend_history_by_pair
          D S B T.carrier hBsub hradius hq hw hqw
            hfirstDouble hsecondDouble T.carrier_subset T.history
        erased_mem_fixedClass := by
          intro x hx
          have hxB : x ∈ B := (Finset.mem_sdiff.mp hx).1
          have hxNotCarrier : x ∉ T.carrier :=
            (Finset.mem_sdiff.mp hx).2
          by_cases hxq : x = q
          · subst x
            exact selected_of_fixedRadius_marginal
              (fixedRadius_marginal_mono hBsub hq)
          · by_cases hxw : x = w
            · subst x
              exact selected_of_fixedRadius_marginal
                (fixedRadius_marginal_mono hBsub hw)
            · have hxB' : x ∈ B' := by
                exact Finset.mem_erase.mpr
                  ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxB⟩⟩
              exact T.erased_mem_fixedClass x
                (Finset.mem_sdiff.mpr ⟨hxB', hxNotCarrier⟩)
        terminal := T.terminal }⟩
  · have hcard :
        (SelectedClass B S.oppApex1 radius).card = 4 ∨
          (SelectedClass B S.oppApex1 radius).card = 5 := by
      omega
    have hthree := three_le_fixedRadius_offSurplus
      D S B hBsub radius hfixed
    rcases exists_pair_double_deletion_survives_secondApex_on_subset
        D S B hBsub radius hsecond hthree with
      ⟨q, w, hq, hw, hqw, hsecondDouble⟩
    exact ⟨
      { carrier := B
        carrier_subset := fun _ hz => hz
        history := by
          intro x hx
          exact False.elim
            ((Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hx).1)
        erased_mem_fixedClass := by
          intro x hx
          exact False.elim
            ((Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hx).1)
        terminal :=
          ⟨q, w, hradius, hq, hw, hqw, hcard, hsecondDouble⟩ }⟩
termination_by B.card
decreasing_by
  try dsimp [B']
  have hqB : q ∈ B :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
  have hwB : w ∈ B :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).1
  have hwErase : w ∈ B.erase q :=
    Finset.mem_erase.mpr ⟨hqw.symm, hwB⟩
  have hBnontrivial : 1 < B.card :=
    Finset.one_lt_card.mpr ⟨q, hqB, w, hwB, hqw⟩
  rw [Finset.card_erase_of_mem hwErase,
    Finset.card_erase_of_mem hqB]
  omega

/-- A coherent full-carrier single-radius history whose terminal carrier is
still visibly contained in the carrier obtained after erasing the original
frontier pair.  The extra subset field preserves the provenance needed to
reconstruct the original source from the ambient history. -/
structure FixedSingleFrontierRadiusTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  terminal : FixedSingleRadiusTerminalHistory D S D.A radius
  carrier_subset_postEntry :
    terminal.carrier ⊆ (D.A.erase F.pair.q).erase F.pair.w

/-- Branch-complete entry audit for the single-radius descent.

If the entry class has at least six points, the frontier pair leaves a K4
class at the same radius.  The single-radius descent can then be run on the
post-entry carrier and the original pair can be prepended, giving a coherent
full-carrier history.

If the entry class has cardinality four or five, the frontier pair spends
that radius immediately.  Any surviving first-apex K4 witness has a different
radius; this is the genuine multi-radius R arm and is deliberately returned
as `FrontierRadiusSpentAtEntry`, rather than being folded into the coherent
orbit. -/
theorem CriticalPairFrontier.fixedSingleRadiusTerminal_or_spentAtEntry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1) :
    Nonempty (FixedSingleFrontierRadiusTerminal F) ∨
      Nonempty (FrontierRadiusSpentAtEntry F) := by
  classical
  let B := (D.A.erase F.pair.q).erase F.pair.w
  by_cases hsix : 6 ≤ (SelectedClass D.A S.oppApex1 radius).card
  · have hfive :
        5 ≤ (SelectedClass (D.A.erase F.pair.q)
          S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hsix
    have hfixedB :
        4 ≤ (SelectedClass B S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    have hBsub : B ⊆ D.A := by
      intro z hz
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    rcases exists_fixedSingleRadiusTerminalHistory
        D S B hBsub radius hradius hfixedB F.secondApexDouble with ⟨T⟩
    left
    exact ⟨
      { terminal :=
          { carrier := T.carrier
            carrier_subset := T.carrier_subset.trans hBsub
            history := fixedRadius_extend_history_by_pair
              D S D.A T.carrier (fun _ hz => hz) hradius
                F.pair.q_mem_marginal F.pair.w_mem_marginal
                F.pair.q_ne_w hfirstDouble F.secondApexDouble
                T.carrier_subset T.history
            erased_mem_fixedClass := by
              intro x hx
              have hxA : x ∈ D.A := (Finset.mem_sdiff.mp hx).1
              have hxNotCarrier : x ∉ T.carrier :=
                (Finset.mem_sdiff.mp hx).2
              by_cases hxq : x = F.pair.q
              · subst x
                exact selected_of_fixedRadius_marginal
                  F.pair.q_mem_marginal
              · by_cases hxw : x = F.pair.w
                · subst x
                  exact selected_of_fixedRadius_marginal
                    F.pair.w_mem_marginal
                · have hxB : x ∈ B := by
                    exact Finset.mem_erase.mpr
                      ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxA⟩⟩
                  exact T.erased_mem_fixedClass x
                    (Finset.mem_sdiff.mpr ⟨hxB, hxNotCarrier⟩)
            terminal := T.terminal }
        carrier_subset_postEntry := by
          intro z hz
          simpa [B] using T.carrier_subset hz }⟩
  · right
    have hcard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
          (SelectedClass D.A S.oppApex1 radius).card = 5 := by
      omega
    have hqClass :
        F.pair.q ∈ SelectedClass D.A S.oppApex1 radius :=
      selected_of_fixedRadius_marginal F.pair.q_mem_marginal
    have hwClass :
        F.pair.w ∈ SelectedClass D.A S.oppApex1 radius :=
      selected_of_fixedRadius_marginal F.pair.w_mem_marginal
    have hwErase :
        F.pair.w ∈ SelectedClass (D.A.erase F.pair.q)
          S.oppApex1 radius := by
      rw [selectedClass_erase_eq]
      exact Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hwClass⟩
    have hpost :
        (SelectedClass B S.oppApex1 radius).card ≤ 3 := by
      dsimp [B]
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hwErase,
        selectedClass_erase_eq,
        Finset.card_erase_of_mem hqClass]
      omega
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        hfirstDouble with ⟨otherRadius, hotherPos, hotherFour⟩
    have hotherNe : otherRadius ≠ radius := by
      intro heq
      subst otherRadius
      have hotherFour' :
          4 ≤ (SelectedClass B S.oppApex1 radius).card := by
        simpa [B] using hotherFour
      omega
    exact ⟨
      { ambient_card := hcard
        post_erase_card_le_three := hpost
        alternateRadius := otherRadius
        alternateRadius_pos := hotherPos
        alternateRadius_four := by simpa [B] using hotherFour
        alternateRadius_ne := hotherNe }⟩

/-- Every ambient robust pair reconstructed from a full-carrier
single-radius history has both endpoints in the distinguished fixed class. -/
theorem FixedSingleRadiusTerminalHistory.pair_endpoints_mem_fixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho) :
    P.x ∈ SelectedClass D.A S.oppApex1 radius ∧
      P.y ∈ SelectedClass D.A S.oppApex1 radius := by
  exact ⟨T.erased_mem_fixedClass P.x P.x_mem_erased,
    T.erased_mem_fixedClass P.y P.y_mem_erased⟩

/-- In particular, the existential radius carried by any reconstructed
ambient robust pair is definitionally forced to be the distinguished descent
radius.  This is the consumer-facing fact that removes independently chosen
radii from a blocker-cycle family. -/
theorem FixedSingleRadiusTerminalHistory.pair_radius_eq_fixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho) :
    rho = radius := by
  have hxFixed := (T.pair_endpoints_mem_fixedClass P).1
  exact (mem_selectedClass.mp P.x_mem_class).2.symm.trans
    (mem_selectedClass.mp hxFixed).2

#print axioms FixedFirstRadiusTerminalOn.toFirstApexTerminalOn
#print axioms exists_fixedFirstRadiusTerminalHistory
#print axioms CriticalPairFrontier.fixedRadiusTerminal_or_spentAtEntry
#print axioms exists_fixedSingleRadiusTerminalHistory
#print axioms CriticalPairFrontier.fixedSingleRadiusTerminal_or_spentAtEntry
#print axioms FixedSingleRadiusTerminalHistory.pair_radius_eq_fixed

end ATailRFullParentEntryScratch
end Problem97
