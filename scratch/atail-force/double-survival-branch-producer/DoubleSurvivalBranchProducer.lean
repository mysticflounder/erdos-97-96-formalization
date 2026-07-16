/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import RobustLiveBankAdapter

/-!
# Double-survival branch producer normal form

This scratch module isolates the right arm of
`CriticalPairFrontier.firstApexSplit`: deleting the same two off-surplus
sources preserves a four-point class at both opposite apices.

The local bi-apex descent already terminates at a carrier with a unique
card-four or card-five first-apex radius.  Here the descent is strengthened
to retain both its erased-pair history and one fixed second-apex radius row
through every deletion.  Every erased point has a distinct erased mate at
the same first-apex radius.

The final theorem exposes the remaining geometric producer exactly.  It is
enough to produce one selected row centered in the strict surplus interior
which contains both members of one retained erased pair.  The existing live
bank adapter then gives the contradiction.

No production declaration imports this scratch file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace DoubleSurvivalBranchProducer

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open RobustLiveBankAdapter

attribute [local instance] Classical.propDecidable

/-- The off-surplus joint fiber bound persists on every subcarrier of the
ambient counterexample carrier. -/
private theorem firstMarginal_inter_secondClass_card_le_one_on_subset
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A) (r rho : ℝ) :
    ((((B.filter fun x ↦ dist x S.oppApex1 = r) \ S.surplusCap).filter
      fun x ↦ x ∈ SelectedClass B S.oppApex2 rho).card ≤ 1) := by
  classical
  rw [Finset.card_le_one]
  intro q hq w hw
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqSecondClass⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwSecondClass⟩
  rcases Finset.mem_sdiff.mp hqT with ⟨hqFilter, hqOff⟩
  rcases Finset.mem_sdiff.mp hwT with ⟨hwFilter, hwOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqB, hqFirst⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwB, hwFirst⟩
  by_contra hqw
  have hqSecond : dist q S.oppApex2 = rho := by
    simpa only [dist_comm] using (mem_selectedClass.mp hqSecondClass).2
  have hwSecond : dist w S.oppApex2 = rho := by
    simpa only [dist_comm] using (mem_selectedClass.mp hwSecondClass).2
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S (hBsub hqB) (hBsub hwB) hqOff hwOff hqw
      hqFirst hwFirst hqSecond hwSecond

/-- Three off-surplus points on one first-apex circle contain two whose
simultaneous deletion preserves a supplied second-apex K4 witness. -/
private theorem exists_pair_double_deletion_survives_secondApex_on_subset
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A) (r rho : ℝ)
    (hfour : 4 ≤ (SelectedClass B S.oppApex2 rho).card)
    (hthree :
      3 ≤ ((B.filter fun x ↦ dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    ∃ q w : ℝ²,
      q ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \ S.surplusCap ∧
      w ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \ S.surplusCap ∧
      q ≠ w ∧
      q ∉ SelectedClass B S.oppApex2 rho ∧
      w ∉ SelectedClass B S.oppApex2 rho ∧
      4 ≤ (SelectedClass ((B.erase q).erase w)
        S.oppApex2 rho).card := by
  classical
  let T := (B.filter fun x ↦ dist x S.oppApex1 = r) \ S.surplusCap
  let hit : ℝ² → Prop := fun x ↦ x ∈ SelectedClass B S.oppApex2 rho
  have hhit : (T.filter hit).card ≤ 1 := by
    simpa [T, hit] using
      firstMarginal_inter_secondClass_card_le_one_on_subset
        D S B hBsub r rho
  have hsplit := Finset.card_filter_add_card_filter_not (s := T) hit
  have hthreeT : 3 ≤ T.card := by simpa [T] using hthree
  have htwo : 2 ≤ (T.filter fun x ↦ ¬ hit x).card := by omega
  have hone : 1 < (T.filter fun x ↦ ¬ hit x).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqNot⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwNot⟩
  have hqNotClass : q ∉ SelectedClass B S.oppApex2 rho := by
    simpa [hit] using hqNot
  have hwNotClass : w ∉ SelectedClass B S.oppApex2 rho := by
    simpa [hit] using hwNot
  have hqCard :
      (SelectedClass (B.erase q) S.oppApex2 rho).card =
        (SelectedClass B S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hqNotClass
  have hwNotErase :
      w ∉ SelectedClass (B.erase q) S.oppApex2 rho := by
    intro hwErase
    exact hwNotClass (mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (mem_selectedClass.mp hwErase).1).2,
        (mem_selectedClass.mp hwErase).2⟩)
  have hwCard :
      (SelectedClass ((B.erase q).erase w) S.oppApex2 rho).card =
        (SelectedClass (B.erase q) S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hwNotErase
  have hfourDouble :
      4 ≤ (SelectedClass ((B.erase q).erase w)
        S.oppApex2 rho).card := by
    rw [hwCard, hqCard]
    exact hfour
  exact ⟨q, w, by simpa [T] using hqT, by simpa [T] using hwT,
    hqw, hqNotClass, hwNotClass, hfourDouble⟩

/-- One source-current local bi-apex descent step. -/
theorem biApex_fixedSecondRow_step_or_firstApex_terminal
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (rho2 : ℝ)
    (hsecondFour : 4 ≤ (SelectedClass B S.oppApex2 rho2).card) :
    (∃ r : ℝ, ∃ q w : ℝ²,
      0 < r ∧
      q ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \
        S.surplusCap ∧
      w ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \
        S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((B.erase q).erase w) S.oppApex1 ∧
      SelectedClass ((B.erase q).erase w) S.oppApex2 rho2 =
        SelectedClass B S.oppApex2 rho2 ∧
      4 ≤ (SelectedClass ((B.erase q).erase w)
        S.oppApex2 rho2).card ∧
      ((B.erase q).erase w).card + 2 = B.card) ∨
    (∃ r : ℝ, ∃ q w : ℝ²,
      0 < r ∧
      q ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \
        S.surplusCap ∧
      w ∈ (B.filter fun x ↦ dist x S.oppApex1 = r) \
        S.surplusCap ∧
      q ≠ w ∧
      ((SelectedClass B S.oppApex1 r).card = 4 ∨
        (SelectedClass B S.oppApex1 r).card = 5) ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass B S.oppApex1 rho).card → rho = r) ∧
      SelectedClass ((B.erase q).erase w) S.oppApex2 rho2 =
        SelectedClass B S.oppApex2 rho2 ∧
      4 ≤ (SelectedClass ((B.erase q).erase w)
        S.oppApex2 rho2).card) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hfirst with
    ⟨r, hr, hfour⟩
  let F := B.filter fun x ↦ dist x S.oppApex1 = r
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
          ≤ ((D.A.filter fun x ↦ dist x S.oppApex1 = r) ∩
              S.surplusCap).card :=
        Finset.card_le_card (by
          intro x hx
          rcases Finset.mem_inter.mp hx with ⟨hxF, hxCap⟩
          rcases Finset.mem_filter.mp hxF with ⟨hxB, hxdist⟩
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr ⟨hBsub hxB, hxdist⟩, hxCap⟩)
      _ ≤ 1 := by
        simpa [DS] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hthree : 3 ≤ (F \ S.surplusCap).card := by omega
  rcases exists_pair_double_deletion_survives_secondApex_on_subset
      D S B hBsub r rho2 hsecondFour (by simpa [F] using hthree) with
    ⟨q, w, hqT, hwT, hqw, hqNotSecond, hwNotSecond,
      hsecondDoubleFour⟩
  have hqB : q ∈ B :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).1
  have hwB : w ∈ B :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).1
  have hqSelected : q ∈ SelectedClass B S.oppApex1 r := by
    rcases Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1 with
      ⟨_, hqRadius⟩
    exact mem_selectedClass.mpr
      ⟨hqB, by simpa [dist_comm] using hqRadius⟩
  have hwSelected : w ∈ SelectedClass B S.oppApex1 r := by
    rcases Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1 with
      ⟨_, hwRadius⟩
    exact mem_selectedClass.mpr
      ⟨hwB, by simpa [dist_comm] using hwRadius⟩
  rcases ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      hfirst hqSelected hwSelected hqw with
    hfirstDouble | ⟨hcard, hunique⟩
  all_goals
    have hsecondRowEq :
        SelectedClass ((B.erase q).erase w) S.oppApex2 rho2 =
          SelectedClass B S.oppApex2 rho2 := by
      rw [selectedClass_erase_eq, selectedClass_erase_eq,
        Finset.erase_eq_self.mpr hqNotSecond,
        Finset.erase_eq_self.mpr hwNotSecond]
  · have hwErase : w ∈ B.erase q :=
      Finset.mem_erase.mpr ⟨hqw.symm, hwB⟩
    have hone : 1 < B.card :=
      Finset.one_lt_card.mpr ⟨q, hqB, w, hwB, hqw⟩
    have hcardDrop : ((B.erase q).erase w).card + 2 = B.card := by
      rw [Finset.card_erase_of_mem hwErase,
        Finset.card_erase_of_mem hqB]
      omega
    exact Or.inl ⟨r, q, w, hr, hqT, hwT, hqw,
      hfirstDouble, hsecondRowEq, hsecondDoubleFour, hcardDrop⟩
  · exact Or.inr ⟨r, q, w, hr, hqT, hwT, hqw,
      hcard, hunique, hsecondRowEq, hsecondDoubleFour⟩

/-- The weak paired history needed by the live bank sink.  Unlike a chosen
involution, this records only that every erased point has some distinct
co-radial erased mate.  That property is stable under prepending a deleted
pair and is all subsequent consumers need. -/
structure PairErasureHistory
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B C : Finset ℝ²) : Prop where
  terminal_subset : C ⊆ B
  erased_off_surplus :
    ∀ {x : ℝ²}, x ∈ B \ C → x ∉ S.surplusCap
  erased_has_coradial_mate :
    ∀ {x : ℝ²}, x ∈ B \ C →
      ∃ y : ℝ², y ∈ B \ C ∧ y ≠ x ∧
        dist y S.oppApex1 = dist x S.oppApex1

namespace PairErasureHistory

/-- Empty history at the beginning of a descent. -/
theorem refl
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) :
    PairErasureHistory S B B := by
  refine
    { terminal_subset := fun _ hx ↦ hx
      erased_off_surplus := ?_
      erased_has_coradial_mate := ?_ }
  · intro x hx
    exact False.elim ((Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hx).1)
  · intro x hx
    exact False.elim ((Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hx).1)

/-- Prepend one off-surplus co-radial deletion pair to an existing history. -/
theorem prepend_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {B C : Finset ℝ²} {q w : ℝ²}
    (H : PairErasureHistory S ((B.erase q).erase w) C)
    (hqB : q ∈ B) (hwB : w ∈ B)
    (hqOff : q ∉ S.surplusCap) (hwOff : w ∉ S.surplusCap)
    (hqw : q ≠ w)
    (hRadius : dist q S.oppApex1 = dist w S.oppApex1) :
    PairErasureHistory S B C := by
  classical
  refine
    { terminal_subset := ?_
      erased_off_surplus := ?_
      erased_has_coradial_mate := ?_ }
  · intro x hxC
    have hxDouble := H.terminal_subset hxC
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxDouble).2).2
  · intro x hxHistory
    rcases Finset.mem_sdiff.mp hxHistory with ⟨hxB, hxNotC⟩
    by_cases hxq : x = q
    · simpa [hxq] using hqOff
    by_cases hxw : x = w
    · simpa [hxw] using hwOff
    have hxDouble : x ∈ (B.erase q).erase w :=
      Finset.mem_erase.mpr
        ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxB⟩⟩
    exact H.erased_off_surplus
      (Finset.mem_sdiff.mpr ⟨hxDouble, hxNotC⟩)
  · intro x hxHistory
    rcases Finset.mem_sdiff.mp hxHistory with ⟨hxB, hxNotC⟩
    have hqNotC : q ∉ C := by
      intro hqC
      have hqDouble := H.terminal_subset hqC
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqDouble).2).1 rfl
    have hwNotC : w ∉ C := by
      intro hwC
      have hwDouble := H.terminal_subset hwC
      exact (Finset.mem_erase.mp hwDouble).1 rfl
    by_cases hxq : x = q
    · subst x
      exact ⟨w, Finset.mem_sdiff.mpr ⟨hwB, hwNotC⟩,
        hqw.symm, hRadius.symm⟩
    by_cases hxw : x = w
    · subst x
      exact ⟨q, Finset.mem_sdiff.mpr ⟨hqB, hqNotC⟩,
        hqw, hRadius⟩
    have hxDouble : x ∈ (B.erase q).erase w :=
      Finset.mem_erase.mpr
        ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxB⟩⟩
    rcases H.erased_has_coradial_mate
        (Finset.mem_sdiff.mpr ⟨hxDouble, hxNotC⟩) with
      ⟨y, hyHistory, hyNe, hyRadius⟩
    have hyDouble := (Finset.mem_sdiff.mp hyHistory).1
    have hyB : y ∈ B :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hyDouble).2).2
    exact ⟨y, Finset.mem_sdiff.mpr
      ⟨hyB, (Finset.mem_sdiff.mp hyHistory).2⟩, hyNe, hyRadius⟩

end PairErasureHistory

/-- Terminal output of the local bi-apex descent, now indexed by the ambient
carrier whose erased history is retained. -/
structure FirstApexTerminalWithHistory
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (secondRadius : ℝ) where
  carrier : Finset ℝ²
  history : PairErasureHistory S B carrier
  first_k4 : HasNEquidistantPointsAt 4 carrier S.oppApex1
  second_radius_pos : 0 < secondRadius
  second_row_four :
    4 ≤ (SelectedClass carrier S.oppApex2 secondRadius).card
  second_row_eq_ambient :
    SelectedClass carrier S.oppApex2 secondRadius =
      SelectedClass B S.oppApex2 secondRadius
  radius : ℝ
  q : ℝ²
  w : ℝ²
  radius_pos : 0 < radius
  q_mem_marginal :
    q ∈ (carrier.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap
  w_mem_marginal :
    w ∈ (carrier.filter fun x ↦ dist x S.oppApex1 = radius) \
      S.surplusCap
  q_ne_w : q ≠ w
  terminal_card :
    (SelectedClass carrier S.oppApex1 radius).card = 4 ∨
      (SelectedClass carrier S.oppApex1 radius).card = 5
  terminal_unique :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass carrier S.oppApex1 rho).card → rho = radius
  second_row_survives_terminal_pair :
    4 ≤ (SelectedClass ((carrier.erase q).erase w)
      S.oppApex2 secondRadius).card

/-- The terminating local descent with its cumulative erased-pair history.
This strengthens `exists_firstApex_terminal_subcarrier` without asserting an
invalid ambient uniqueness lift. -/
theorem exists_firstApex_terminal_with_history_and_fixedSecondRow
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (rho2 : ℝ) (hrho2 : 0 < rho2)
    (hsecondFour : 4 ≤ (SelectedClass B S.oppApex2 rho2).card) :
    Nonempty (FirstApexTerminalWithHistory D S B rho2) := by
  classical
  rcases biApex_fixedSecondRow_step_or_firstApex_terminal
      D S B hBsub hfirst rho2 hsecondFour with hrobust | hterminal
  · rcases hrobust with
      ⟨r, q, w, _hr, hqT, hwT, hqw,
        hfirstDouble, hsecondRowEq, hsecondDoubleFour, hcardDrop⟩
    let B' := (B.erase q).erase w
    have hB'subB : B' ⊆ B := by
      intro x hx
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).2
    have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
    rcases exists_firstApex_terminal_with_history_and_fixedSecondRow
        D S B' hB'subA hfirstDouble rho2 hrho2
          hsecondDoubleFour with ⟨T⟩
    have hqB : q ∈ B :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).1
    have hwB : w ∈ B :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).1
    have hqOff : q ∉ S.surplusCap := (Finset.mem_sdiff.mp hqT).2
    have hwOff : w ∉ S.surplusCap := (Finset.mem_sdiff.mp hwT).2
    have hqRadius : dist q S.oppApex1 = r :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).2
    have hwRadius : dist w S.oppApex1 = r :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).2
    exact ⟨
      { carrier := T.carrier
        history := PairErasureHistory.prepend_pair T.history
          hqB hwB hqOff hwOff hqw (hqRadius.trans hwRadius.symm)
        first_k4 := T.first_k4
        second_radius_pos := T.second_radius_pos
        second_row_four := T.second_row_four
        second_row_eq_ambient := T.second_row_eq_ambient.trans hsecondRowEq
        radius := T.radius
        q := T.q
        w := T.w
        radius_pos := T.radius_pos
        q_mem_marginal := T.q_mem_marginal
        w_mem_marginal := T.w_mem_marginal
        q_ne_w := T.q_ne_w
        terminal_card := T.terminal_card
        terminal_unique := T.terminal_unique
        second_row_survives_terminal_pair :=
          T.second_row_survives_terminal_pair }⟩
  · rcases hterminal with
      ⟨r, q, w, hr, hqT, hwT, hqw,
        hcard, hunique, hsecondRowEq, hsecondDoubleFour⟩
    exact ⟨
      { carrier := B
        history := PairErasureHistory.refl S B
        first_k4 := hfirst
        second_radius_pos := hrho2
        second_row_four := hsecondFour
        second_row_eq_ambient := rfl
        radius := r
        q := q
        w := w
        radius_pos := hr
        q_mem_marginal := hqT
        w_mem_marginal := hwT
        q_ne_w := hqw
        terminal_card := hcard
        terminal_unique := hunique
        second_row_survives_terminal_pair := hsecondDoubleFour }⟩
termination_by B.card
decreasing_by omega

/-- One explicit co-radial pair in the erased history. -/
structure CoradialErasedPair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B C : Finset ℝ²) where
  x : ℝ²
  y : ℝ²
  x_mem_erased : x ∈ B \ C
  y_mem_erased : y ∈ B \ C
  x_ne_y : x ≠ y
  same_radius : dist x S.oppApex1 = dist y S.oppApex1

/-- Source-exact normal form of the right arm of `firstApexSplit`.
The original frontier pair witnesses that the ambient erased history is
nonempty; the terminal carrier and all later erased pairs are retained too. -/
structure DoubleSurvivalBranchNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) where
  firstApex_double :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  second_radius : ℝ
  terminal : FirstApexTerminalWithHistory D S
    ((D.A.erase F.pair.q).erase F.pair.w) second_radius
  ambient_history : PairErasureHistory S D.A terminal.carrier
  erased_pair : CoradialErasedPair S D.A terminal.carrier

/-- The right branch produces the full history-bearing terminal normal form. -/
theorem exists_doubleSurvivalBranchNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hfirstDouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1) :
    Nonempty (DoubleSurvivalBranchNormalForm F) := by
  classical
  let B0 := (D.A.erase F.pair.q).erase F.pair.w
  have hB0sub : B0 ⊆ D.A := by
    intro x hx
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).2
  rcases F.secondApexDouble with ⟨rho2, hrho2, hsecondRaw⟩
  have hsecondFour :
      4 ≤ (SelectedClass B0 S.oppApex2 rho2).card := by
    simpa [B0, SelectedClass, dist_comm] using hsecondRaw
  rcases exists_firstApex_terminal_with_history_and_fixedSecondRow
      D S B0 hB0sub
      hfirstDouble rho2 hrho2 hsecondFour with ⟨T⟩
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hwOff : F.pair.w ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  have hqRadius : dist F.pair.q S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  have hwRadius : dist F.pair.w S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  have hqNotCarrier : F.pair.q ∉ T.carrier := by
    intro hqCarrier
    have hqB0 := T.history.terminal_subset hqCarrier
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqB0).2).1 rfl
  have hwNotCarrier : F.pair.w ∉ T.carrier := by
    intro hwCarrier
    have hwB0 := T.history.terminal_subset hwCarrier
    exact (Finset.mem_erase.mp hwB0).1 rfl
  have hAmbientHistory : PairErasureHistory S D.A T.carrier :=
    PairErasureHistory.prepend_pair T.history
      F.pair.q_mem_A F.pair.w_mem_A hqOff hwOff F.pair.q_ne_w
        (hqRadius.trans hwRadius.symm)
  have hqErased : F.pair.q ∈ D.A \ T.carrier :=
    Finset.mem_sdiff.mpr ⟨F.pair.q_mem_A, hqNotCarrier⟩
  have hwErased : F.pair.w ∈ D.A \ T.carrier :=
    Finset.mem_sdiff.mpr ⟨F.pair.w_mem_A, hwNotCarrier⟩
  exact ⟨
    { firstApex_double := hfirstDouble
      second_radius := rho2
      terminal := T
      ambient_history := hAmbientHistory
      erased_pair :=
        { x := F.pair.q
          y := F.pair.w
          x_mem_erased := hqErased
          y_mem_erased := hwErased
          x_ne_y := F.pair.q_ne_w
          same_radius := hqRadius.trans hwRadius.symm } }⟩

/-- The only geometric field still missing after the right-branch descent:
a strict-surplus selected row captures both members of one erased pair. -/
structure StrictSurplusRowCapturesErasedPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    (N : DoubleSurvivalBranchNormalForm F) where
  pair : CoradialErasedPair S D.A N.terminal.carrier
  z : ℝ²
  z_mem_surplusInterior : z ∈ S.capInteriorByIndex S.surplusIdx
  row : SelectedFourClass D.A z
  x_mem_row : pair.x ∈ row.support
  y_mem_row : pair.y ∈ row.support

/-- A captured history pair contradicts the already-proved uniqueness of a
cap center for an outside pair. -/
theorem false_of_strictSurplusRowCapturesErasedPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    (N : DoubleSurvivalBranchNormalForm F)
    (L : StrictSurplusRowCapturesErasedPair N) : False := by
  let x := L.pair.x
  let y := L.pair.y
  let rho := dist x S.oppApex1
  have hxA : x ∈ D.A :=
    (Finset.mem_sdiff.mp L.pair.x_mem_erased).1
  have hyA : y ∈ D.A :=
    (Finset.mem_sdiff.mp L.pair.y_mem_erased).1
  have hxOff : x ∉ S.surplusCap :=
    N.ambient_history.erased_off_surplus
      L.pair.x_mem_erased
  have hyOff : y ∉ S.surplusCap :=
    N.ambient_history.erased_off_surplus
      L.pair.y_mem_erased
  have hxMarginal :
      x ∈ (D.A.filter fun a ↦ dist a S.oppApex1 = rho) \
        S.surplusCap := by
    exact Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr ⟨hxA, rfl⟩, hxOff⟩
  have hyMarginal :
      y ∈ (D.A.filter fun a ↦ dist a S.oppApex1 = rho) \
        S.surplusCap := by
    exact Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr
        ⟨hyA, L.pair.same_radius.symm⟩, hyOff⟩
  exact false_of_surplusInterior_row_contains_marginalPair S
    L.z_mem_surplusInterior hxMarginal hyMarginal L.pair.x_ne_y
      L.row L.x_mem_row L.y_mem_row

/-- Existential closure-facing form.  The normal form itself is produced by
`exists_doubleSurvivalBranchNormalForm`; only its final `capture` field is not
yet produced. -/
structure DoubleSurvivalBranchClosureProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) where
  normal : DoubleSurvivalBranchNormalForm F
  capture : StrictSurplusRowCapturesErasedPair normal

theorem false_of_doubleSurvivalBranchClosureProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (P : DoubleSurvivalBranchClosureProducer F) : False :=
  false_of_strictSurplusRowCapturesErasedPair P.normal P.capture

#print axioms PairErasureHistory.prepend_pair
#print axioms biApex_fixedSecondRow_step_or_firstApex_terminal
#print axioms exists_firstApex_terminal_with_history_and_fixedSecondRow
#print axioms exists_doubleSurvivalBranchNormalForm
#print axioms false_of_strictSurplusRowCapturesErasedPair
#print axioms false_of_doubleSurvivalBranchClosureProducer

end DoubleSurvivalBranchProducer
end ATailForce
end Problem97
