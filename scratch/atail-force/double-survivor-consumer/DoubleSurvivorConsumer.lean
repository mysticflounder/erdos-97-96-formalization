/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# ATAIL second-apex double-survivor consumer

This scratch module plugs the stronger second-apex pair selection into the
production critical-pair frontier.  The selected pair always preserves K4
after both deletions at the second opposite apex, so the production
second-apex exact-eight-shell arm disappears.  The only remaining top-level
split is at the first apex: robust double survival, a unique card-four row,
or a unique card-five row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailDoubleSurvivorConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

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

/-- The off-surplus joint fiber bound persists on every subcarrier of the
ambient counterexample carrier. -/
theorem firstMarginal_inter_secondClass_card_le_one_on_subset
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A) (r rho : ℝ) :
    ((((B.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap).filter
      fun x => x ∈ SelectedClass B S.oppApex2 rho).card ≤ 1) := by
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

/-- Subcarrier form of the stronger pair selection.  Three off-surplus
points on one first-apex circle contain two whose simultaneous deletion
preserves any supplied K4 witness at the second apex. -/
theorem exists_pair_double_deletion_survives_secondApex_on_subset
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A) (r : ℝ)
    (hK4 : HasNEquidistantPointsAt 4 B S.oppApex2)
    (hthree :
      3 ≤ ((B.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    ∃ q w : ℝ²,
      q ∈ (B.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      w ∈ (B.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4 ((B.erase q).erase w) S.oppApex2 := by
  classical
  let T := (B.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hK4 with
    ⟨rho, hrho, hfour⟩
  let hit : ℝ² → Prop := fun x => x ∈ SelectedClass B S.oppApex2 rho
  have hhit : (T.filter hit).card ≤ 1 := by
    simpa [T, hit] using
      firstMarginal_inter_secondClass_card_le_one_on_subset
        D S B hBsub r rho
  have hsplit := Finset.card_filter_add_card_filter_not (s := T) hit
  have hthreeT : 3 ≤ T.card := by simpa [T] using hthree
  have htwo : 2 ≤ (T.filter fun x => ¬ hit x).card := by omega
  have hone : 1 < (T.filter fun x => ¬ hit x).card := by omega
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
    hqw, rho, hrho, by simpa [SelectedClass] using hfourDouble⟩

/-- A production survivor packet whose second-apex split is fixed to the
double-survival arm. -/
structure DoubleSecondApexFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A) where
  pair : SurvivorPairRelocationPacket D S r H
  firstApexSplit : FirstApexSplit pair
  secondApexDouble :
    HasNEquidistantPointsAt 4
      ((D.A.erase pair.q).erase pair.w) S.oppApex2

/-- Forgetting that the second split was chosen constructively gives the
production critical-pair frontier. -/
def DoubleSecondApexFrontier.toCriticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : DoubleSecondApexFrontier D S r H) :
    CriticalPairFrontier D S r H :=
  { pair := F.pair
    firstApexSplit := F.firstApexSplit
    secondApexDouble := F.secondApexDouble
    secondApexSplit := Or.inl F.secondApexDouble }

/-- Three off-surplus first-apex points produce a critical-pair frontier
with the second-apex exact-eight alternative removed. -/
theorem exists_doubleSecondApexFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    Nonempty (DoubleSecondApexFrontier D S r H) := by
  rcases exists_pair_double_deletion_survives_secondApex_on_subset
      D S D.A (by intro x hx; exact hx) r
      (D.K4 S.oppApex2 (oppApex2_mem_A S)) hthree with
    ⟨q, w, hqT, hwT, hqw, hdouble⟩
  have hqA : q ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).1
  have hwA : w ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).1
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase q) _ hdouble
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase w).erase q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using hdouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase w) _ hdoubleSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  let P : SurvivorPairRelocationPacket D S r H :=
    { q := q
      w := w
      q_mem_A := hqA
      w_mem_A := hwA
      q_mem_marginal := hqT
      w_mem_marginal := hwT
      q_ne_w := hqw
      q_survives := hqSurvives
      w_survives := hwSurvives
      q_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hqA hqSurvives
      w_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hwA hwSurvives }
  have hqSelected : q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp hqT with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨_, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩
  have hwSelected : w ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp hwT with ⟨hwFilter, _⟩
    rcases Finset.mem_filter.mp hwFilter with ⟨_, hwRadius⟩
    exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwRadius⟩
  have hfirst : FirstApexSplit P :=
    ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      (D.K4 S.oppApex1 (oppApex1_mem_A S)) hqSelected hwSelected hqw
  exact ⟨⟨P, hfirst, hdouble⟩⟩

/-- Parent-facing extraction: global K4 supplies the first-apex radius and
the surplus-cap one-hit bound supplies its three-point off-surplus marginal. -/
theorem exists_doubleSecondApexFrontier_of_K4
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) :
    ∃ r : ℝ, 0 < r ∧
      Nonempty (DoubleSecondApexFrontier D S r H) := by
  classical
  rcases D.K4 S.oppApex1 (oppApex1_mem_A S) with ⟨r, hr, hfour⟩
  let F := D.A.filter fun x => dist x S.oppApex1 = r
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFfour : 4 ≤ F.card := by
    simpa [F, dist_comm] using hfour
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, F] using U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hthree : 3 ≤ (F \ S.surplusCap).card := by omega
  exact ⟨r, hr,
    exists_doubleSecondApexFrontier D S r H (by simpa [F] using hthree)⟩

private theorem pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.q ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa [dist_comm] using hqRadius⟩

private theorem pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.w ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa [dist_comm] using hwRadius⟩

private theorem firstApex_single_blocked_of_unique_card_four_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  rintro ⟨rho, hrho, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 rho).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    rw [selectedClass_erase_eq] at hfourErase
    exact le_trans hfourErase
      (Finset.card_le_card (Finset.erase_subset _ _))
  have hrhoEq : rho = r := hunique rho hrho hfourAmbient
  subst rho
  rw [selectedClass_erase_eq,
    Finset.card_erase_of_mem (pair_q_mem_firstClass P), hcard] at hfourErase
  omega

private theorem firstApex_single_blocked_of_unique_card_four_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1 := by
  rintro ⟨rho, hrho, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.w) S.oppApex1 rho).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    rw [selectedClass_erase_eq] at hfourErase
    exact le_trans hfourErase
      (Finset.card_le_card (Finset.erase_subset _ _))
  have hrhoEq : rho = r := hunique rho hrho hfourAmbient
  subst rho
  rw [selectedClass_erase_eq,
    Finset.card_erase_of_mem (pair_w_mem_firstClass P), hcard] at hfourErase
  omega

private theorem firstApex_single_survives_of_card_five_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  refine ⟨r, hr, ?_⟩
  have hfour :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card := by
    rw [selectedClass_erase_eq,
      Finset.card_erase_of_mem (pair_q_mem_firstClass P), hcard]
  simpa [SelectedClass] using hfour

private theorem firstApex_single_survives_of_card_five_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1 := by
  refine ⟨r, hr, ?_⟩
  have hfour :
      4 ≤ (SelectedClass (D.A.erase P.w) S.oppApex1 r).card := by
    rw [selectedClass_erase_eq,
      Finset.card_erase_of_mem (pair_w_mem_firstClass P), hcard]
  simpa [SelectedClass] using hfour

private theorem firstApex_double_blocked_of_unique_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex1 := by
  rintro ⟨rho, hrho, hfour⟩
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase P.q).erase P.w)
        S.oppApex1 rho).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq] at hfourDouble
    exact le_trans hfourDouble
      (Finset.card_le_card (Finset.erase_subset _ _ |>.trans
        (Finset.erase_subset _ _)))
  have hrhoEq : rho = r := hunique rho hrho hfourAmbient
  subst rho
  have hwAfterQ :
      P.w ∈ (SelectedClass D.A S.oppApex1 r).erase P.q :=
    Finset.mem_erase.mpr
      ⟨P.q_ne_w.symm, pair_w_mem_firstClass P⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem (pair_q_mem_firstClass P), hcard] at hfourDouble
  omega

/-- Exact first-apex normal form after forcing the second-apex split to
double survival.

* robust: both twice-erased apex K4 witnesses survive;
* card four: deleting either source already blocks the first apex;
* card five: either single deletion preserves the first apex, but deleting
  both blocks it.
-/
theorem firstApex_trichotomy_with_secondApex_double_survival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : DoubleSecondApexFrontier D S r H) (hr : 0 < r) :
    (HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex2) ∨
    ((SelectedClass D.A S.oppApex1 r).card = 4 ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex2) ∨
    ((SelectedClass D.A S.oppApex1 r).card = 5 ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) ∧
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex1 ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex2) := by
  rcases F.firstApexSplit with hrobust | ⟨hcard, hunique⟩
  · exact Or.inl ⟨hrobust, F.secondApexDouble⟩
  · rcases hcard with hfour | hfive
    · exact Or.inr (Or.inl ⟨hfour, hunique,
        firstApex_single_blocked_of_unique_card_four_q
          F.pair hfour hunique,
        firstApex_single_blocked_of_unique_card_four_w
          F.pair hfour hunique,
        F.secondApexDouble⟩)
    · exact Or.inr (Or.inr ⟨hfive, hunique,
        firstApex_single_survives_of_card_five_q F.pair hr hfive,
        firstApex_single_survives_of_card_five_w F.pair hr hfive,
        firstApex_double_blocked_of_unique_card_five
          F.pair hfive hunique,
        F.secondApexDouble⟩)

/- ## Local bi-apex descent

The preceding construction does not need global K4 on the current carrier.
On any subcarrier of `D.A` carrying local K4 witnesses at both opposite
apices, a first-apex K4 row has at least three off-surplus members.  Selecting
two of them outside one second-apex K4 row either preserves both apex
witnesses on a carrier smaller by exactly two, or makes the current
first-apex row uniquely card four/five.
-/

/-- One local bi-apex step, with every witness retained explicitly. -/
theorem biApex_double_survival_step_or_firstApex_terminal
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    (∃ r : ℝ, ∃ q w : ℝ²,
      0 < r ∧
      q ∈ (B.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      w ∈ (B.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((B.erase q).erase w) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((B.erase q).erase w) S.oppApex2 ∧
      ((B.erase q).erase w).card + 2 = B.card) ∨
    (∃ r : ℝ, ∃ q w : ℝ²,
      0 < r ∧
      q ∈ (B.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      w ∈ (B.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      q ≠ w ∧
      ((SelectedClass B S.oppApex1 r).card = 4 ∨
        (SelectedClass B S.oppApex1 r).card = 5) ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass B S.oppApex1 rho).card → rho = r) ∧
      HasNEquidistantPointsAt 4
        ((B.erase q).erase w) S.oppApex2) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hfirst with
    ⟨r, hr, hfour⟩
  let F := B.filter fun x => dist x S.oppApex1 = r
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
          ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) ∩
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
      D S B hBsub r hsecond (by simpa [F] using hthree) with
    ⟨q, w, hqT, hwT, hqw, hsecondDouble⟩
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
  · have hwErase : w ∈ B.erase q :=
      Finset.mem_erase.mpr ⟨hqw.symm, hwB⟩
    have hone : 1 < B.card :=
      Finset.one_lt_card.mpr ⟨q, hqB, w, hwB, hqw⟩
    have hcardDrop : ((B.erase q).erase w).card + 2 = B.card := by
      rw [Finset.card_erase_of_mem hwErase,
        Finset.card_erase_of_mem hqB]
      omega
    exact Or.inl ⟨r, q, w, hr, hqT, hwT, hqw,
      hfirstDouble, hsecondDouble, hcardDrop⟩
  · exact Or.inr ⟨r, q, w, hr, hqT, hwT, hqw,
      hcard, hunique, hsecondDouble⟩

/-- Iterating the robust arm terminates because each such step removes two
distinct points.  The terminal exact row is relative to the resulting
subcarrier; no ambient lifting is asserted. -/
theorem exists_firstApex_terminal_subcarrier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBsub : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    ∃ C : Finset ℝ², C ⊆ B ∧
      ∃ r : ℝ, ∃ q w : ℝ²,
        0 < r ∧
        q ∈ (C.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap ∧
        w ∈ (C.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap ∧
        q ≠ w ∧
        ((SelectedClass C S.oppApex1 r).card = 4 ∨
          (SelectedClass C S.oppApex1 r).card = 5) ∧
        (∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass C S.oppApex1 rho).card → rho = r) ∧
        HasNEquidistantPointsAt 4
          ((C.erase q).erase w) S.oppApex2 := by
  classical
  rcases biApex_double_survival_step_or_firstApex_terminal
      D S B hBsub hfirst hsecond with hrobust | hterminal
  · rcases hrobust with
      ⟨r, q, w, _hr, hqT, hwT, _hqw,
        hfirstDouble, hsecondDouble, hcardDrop⟩
    let B' := (B.erase q).erase w
    have hB'subB : B' ⊆ B := by
      intro x hx
      exact (Finset.mem_erase.mp
        (Finset.mem_erase.mp hx).2).2
    have hB'subA : B' ⊆ D.A := hB'subB.trans hBsub
    rcases exists_firstApex_terminal_subcarrier
        D S B' hB'subA hfirstDouble hsecondDouble with
      ⟨C, hCB', r', q', w', hr', hqT', hwT', hq'w',
        hcard', hunique', hsecond'⟩
    exact ⟨C, hCB'.trans hB'subB, r', q', w', hr', hqT', hwT',
      hq'w', hcard', hunique', hsecond'⟩
  · rcases hterminal with
      ⟨r, q, w, hr, hqT, hwT, hqw, hcard, hunique, hsecondDouble⟩
    exact ⟨B, by intro x hx; exact hx, r, q, w, hr, hqT, hwT,
      hqw, hcard, hunique, hsecondDouble⟩
termination_by B.card
decreasing_by omega

#print axioms firstMarginal_inter_secondClass_card_le_one_on_subset
#print axioms exists_pair_double_deletion_survives_secondApex_on_subset
#print axioms exists_doubleSecondApexFrontier
#print axioms exists_doubleSecondApexFrontier_of_K4
#print axioms firstApex_trichotomy_with_secondApex_double_survival
#print axioms biApex_double_survival_step_or_firstApex_terminal
#print axioms exists_firstApex_terminal_subcarrier

end ATailDoubleSurvivorConsumerScratch
end Problem97
