/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# ATAIL second-apex double-survivor extraction

This scratch module strengthens the current prescribed-apex extraction.  From
three off-surplus points on one first-apex circle, choose two whose simultaneous
deletion preserves a K4 witness at the second apex.

The reason is purely finite.  The existing two-apex escape theorem makes the
second-apex distance injective on the off-surplus first-apex marginal.  Hence a
fixed K4 radius class at the second apex contains at most one marginal point;
two of any three marginal points avoid that class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSecondApexDoubleSurvivorScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A fixed second-apex selected class contains at most one point of an
off-surplus first-apex marginal. -/
theorem firstApex_marginal_inter_secondClass_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (r rho : ℝ) :
    ((((D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap).filter
      fun x => x ∈ SelectedClass D.A S.oppApex2 rho).card ≤ 1) := by
  classical
  rw [Finset.card_le_one]
  intro q hq w hw
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqSecondClass⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwSecondClass⟩
  rcases Finset.mem_sdiff.mp hqT with ⟨hqFilter, hqOff⟩
  rcases Finset.mem_sdiff.mp hwT with ⟨hwFilter, hwOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqFirst⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwFirst⟩
  by_contra hqw
  have hqSecond : dist q S.oppApex2 = rho := by
    simpa only [dist_comm] using (mem_selectedClass.mp hqSecondClass).2
  have hwSecond : dist w S.oppApex2 = rho := by
    simpa only [dist_comm] using (mem_selectedClass.mp hwSecondClass).2
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S hqA hwA hqOff hwOff hqw hqFirst hwFirst
      hqSecond hwSecond

private theorem exists_pair_in_marginal_subset_double_deletion_survives_secondApex
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (U : Finset ℝ²)
    (hUT : U ⊆
      (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)
    (hthree : 3 ≤ U.card) :
    ∃ q w : ℝ², q ∈ U ∧ w ∈ U ∧ q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase q).erase w) S.oppApex2 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S)) with
    ⟨rho, hrho, hfour⟩
  let hit : ℝ² → Prop := fun x => x ∈ SelectedClass D.A S.oppApex2 rho
  have hhitT : (T.filter hit).card ≤ 1 := by
    simpa [T, hit] using
      firstApex_marginal_inter_secondClass_card_le_one D S r rho
  have hhitU : (U.filter hit).card ≤ 1 := by
    apply le_trans (Finset.card_le_card ?_) hhitT
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxU, hxHit⟩
    exact Finset.mem_filter.mpr ⟨by simpa [T] using hUT hxU, hxHit⟩
  have hsplit := Finset.card_filter_add_card_filter_not (s := U) hit
  have htwo : 2 ≤ (U.filter fun x => ¬ hit x).card := by omega
  have hone : 1 < (U.filter fun x => ¬ hit x).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqU, hqNot⟩
  rcases Finset.mem_filter.mp hw with ⟨hwU, hwNot⟩
  have hqNotClass : q ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hqNot
  have hwNotClass : w ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hwNot
  have hqCard :
      (SelectedClass (D.A.erase q) S.oppApex2 rho).card =
        (SelectedClass D.A S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hqNotClass
  have hwNotErase :
      w ∉ SelectedClass (D.A.erase q) S.oppApex2 rho := by
    intro hwErase
    exact hwNotClass (mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (mem_selectedClass.mp hwErase).1).2,
        (mem_selectedClass.mp hwErase).2⟩)
  have hwCard :
      (SelectedClass ((D.A.erase q).erase w) S.oppApex2 rho).card =
        (SelectedClass (D.A.erase q) S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hwNotErase
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase q).erase w)
        S.oppApex2 rho).card := by
    rw [hwCard, hqCard]
    exact hfour
  refine ⟨q, w, hqU, hwU, hqw, rho, hrho, ?_⟩
  simpa [SelectedClass] using hfourDouble

/-- Three off-surplus points on one first-apex circle contain two whose
simultaneous deletion preserves K4 at the second apex. -/
theorem exists_pair_double_deletion_survives_secondApex
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    ∃ q w : ℝ²,
      q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase q).erase w) S.oppApex2 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  have hthreeT : 3 ≤ T.card := by simpa [T] using hthree
  rcases exists_pair_in_marginal_subset_double_deletion_survives_secondApex
      D S r T (by intro x hx; simpa [T] using hx) hthreeT with
    ⟨q, w, hqT, hwT, hqw, hdouble⟩
  exact ⟨q, w, by simpa [T] using hqT, by simpa [T] using hwT,
    hqw, hdouble⟩

/-- One monotone two-apex reduction step on an arbitrary subcarrier.  Global
K4 on the subcarrier is not required: local K4 at the two fixed opposite
apices suffices.  The chosen pair simultaneously preserves the second-apex
witness; at the first apex it either also preserves K4 on the same twice-
erased carrier or exposes a unique selected class of cardinality four/five. -/
theorem exists_biApex_monotone_step
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBA : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    ∃ r : ℝ, ∃ q w : ℝ²,
      0 < r ∧
      q ∈ SelectedClass B S.oppApex1 r ∧
      w ∈ SelectedClass B S.oppApex1 r ∧
      q ∉ S.surplusCap ∧ w ∉ S.surplusCap ∧ q ≠ w ∧
      HasNEquidistantPointsAt 4 ((B.erase q).erase w) S.oppApex2 ∧
      (HasNEquidistantPointsAt 4 ((B.erase q).erase w) S.oppApex1 ∨
        (((SelectedClass B S.oppApex1 r).card = 4 ∨
            (SelectedClass B S.oppApex1 r).card = 5) ∧
          ∀ rho : ℝ, 0 < rho →
            4 ≤ (SelectedClass B S.oppApex1 rho).card → rho = r)) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hfirst with
    ⟨r, hr, hfour⟩
  let F := B.filter fun x => dist x S.oppApex1 = r
  let T := F \ S.surplusCap
  have hFfour : 4 ≤ F.card := by
    simpa [F, SelectedClass, dist_comm] using hfour
  have hFsub : F ⊆ D.A.filter (fun x => dist x S.oppApex1 = r) := by
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxB, hxr⟩
    exact Finset.mem_filter.mpr ⟨hBA hxB, hxr⟩
  have hsurpSub : F ∩ S.surplusCap ⊆
      (D.A.filter (fun x => dist x S.oppApex1 = r)) ∩
        S.surplusCap := by
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨hFsub (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hsurp : (F ∩ S.surplusCap).card ≤ 1 := by
    exact le_trans (Finset.card_le_card hsurpSub)
      (by simpa [DS] using
        U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r)
  have hsplitF := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hTthree : 3 ≤ T.card := by
    change 3 ≤ (F \ S.surplusCap).card
    omega
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsecond with
    ⟨rho, hrho, hfourSecond⟩
  let hit : ℝ² → Prop := fun x => x ∈ SelectedClass B S.oppApex2 rho
  have hhit : (T.filter hit).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro q hq w hw
    rcases Finset.mem_filter.mp hq with ⟨hqT, hqSecond⟩
    rcases Finset.mem_filter.mp hw with ⟨hwT, hwSecond⟩
    rcases Finset.mem_sdiff.mp hqT with ⟨hqF, hqOff⟩
    rcases Finset.mem_sdiff.mp hwT with ⟨hwF, hwOff⟩
    rcases Finset.mem_filter.mp hqF with ⟨hqB, hqFirst⟩
    rcases Finset.mem_filter.mp hwF with ⟨hwB, hwFirst⟩
    by_contra hqw
    exact U2NonSurplusSqueeze.oppCap2_escape_gen
      D S (hBA hqB) (hBA hwB) hqOff hwOff hqw hqFirst hwFirst
        (by simpa only [dist_comm] using (mem_selectedClass.mp hqSecond).2)
        (by simpa only [dist_comm] using (mem_selectedClass.mp hwSecond).2)
  have hsplitT := Finset.card_filter_add_card_filter_not (s := T) hit
  have htwo : 2 ≤ (T.filter fun x => ¬ hit x).card := by omega
  have hone : 1 < (T.filter fun x => ¬ hit x).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqNot⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwNot⟩
  rcases Finset.mem_sdiff.mp hqT with ⟨hqF, hqOff⟩
  rcases Finset.mem_sdiff.mp hwT with ⟨hwF, hwOff⟩
  rcases Finset.mem_filter.mp hqF with ⟨hqB, hqFirst⟩
  rcases Finset.mem_filter.mp hwF with ⟨hwB, hwFirst⟩
  have hqFirstClass : q ∈ SelectedClass B S.oppApex1 r :=
    mem_selectedClass.mpr ⟨hqB, by simpa only [dist_comm] using hqFirst⟩
  have hwFirstClass : w ∈ SelectedClass B S.oppApex1 r :=
    mem_selectedClass.mpr ⟨hwB, by simpa only [dist_comm] using hwFirst⟩
  have hqNotSecond : q ∉ SelectedClass B S.oppApex2 rho := by
    simpa [hit] using hqNot
  have hwNotSecond : w ∉ SelectedClass B S.oppApex2 rho := by
    simpa [hit] using hwNot
  have hqCard :
      (SelectedClass (B.erase q) S.oppApex2 rho).card =
        (SelectedClass B S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hqNotSecond
  have hwNotErase : w ∉ SelectedClass (B.erase q) S.oppApex2 rho := by
    intro hwErase
    exact hwNotSecond (mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (mem_selectedClass.mp hwErase).1).2,
        (mem_selectedClass.mp hwErase).2⟩)
  have hwCard :
      (SelectedClass ((B.erase q).erase w) S.oppApex2 rho).card =
        (SelectedClass (B.erase q) S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hwNotErase
  have hsecondDouble :
      HasNEquidistantPointsAt 4 ((B.erase q).erase w) S.oppApex2 := by
    refine ⟨rho, hrho, by simpa [SelectedClass] using (show
      4 ≤ (SelectedClass ((B.erase q).erase w) S.oppApex2 rho).card by
        rw [hwCard, hqCard]
        exact hfourSecond)⟩
  have hfirstSplit :=
    ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      hfirst hqFirstClass hwFirstClass hqw
  exact ⟨r, q, w, hr, hqFirstClass, hwFirstClass, hqOff, hwOff,
    hqw, hsecondDouble, hfirstSplit⟩

/-- Terminal packet reached by monotone two-apex deletion.  The carrier may
be a proper subset of the original configuration; it retains local K4 at both
opposite apices and exposes a unique four/five-point first-apex class whose
chosen source pair can still be deleted simultaneously at the second apex. -/
structure BiApexTerminalPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) where
  carrier : Finset ℝ²
  carrier_subset : carrier ⊆ D.A
  first_k4 : HasNEquidistantPointsAt 4 carrier S.oppApex1
  second_k4 : HasNEquidistantPointsAt 4 carrier S.oppApex2
  radius : ℝ
  radius_pos : 0 < radius
  q : ℝ²
  w : ℝ²
  q_mem_class : q ∈ SelectedClass carrier S.oppApex1 radius
  w_mem_class : w ∈ SelectedClass carrier S.oppApex1 radius
  q_off_surplus : q ∉ S.surplusCap
  w_off_surplus : w ∉ S.surplusCap
  q_ne_w : q ≠ w
  second_double_survives :
    HasNEquidistantPointsAt 4
      ((carrier.erase q).erase w) S.oppApex2
  first_unique_four_or_five :
    ((SelectedClass carrier S.oppApex1 radius).card = 4 ∨
        (SelectedClass carrier S.oppApex1 radius).card = 5) ∧
      ∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass carrier S.oppApex1 rho).card → rho = radius

/-- Iterating `exists_biApex_monotone_step` must terminate because every
robust step erases two distinct carrier points.  Thus local K4 at the two
opposite apices always admits a terminal unique four/five-point first-apex
packet on one cumulatively erased subcarrier. -/
theorem exists_biApexTerminalPacket_of_localK4
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (B : Finset ℝ²) (hBA : B ⊆ D.A)
    (hfirst : HasNEquidistantPointsAt 4 B S.oppApex1)
    (hsecond : HasNEquidistantPointsAt 4 B S.oppApex2) :
    Nonempty (BiApexTerminalPacket D S) := by
  classical
  suffices h : ∀ n : ℕ, ∀ B : Finset ℝ², B.card = n → B ⊆ D.A →
      HasNEquidistantPointsAt 4 B S.oppApex1 →
      HasNEquidistantPointsAt 4 B S.oppApex2 →
      Nonempty (BiApexTerminalPacket D S) by
    exact h B.card B rfl hBA hfirst hsecond
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro B hcard hBA hfirst hsecond
    rcases exists_biApex_monotone_step D S B hBA hfirst hsecond with
      ⟨r, q, w, hr, hqClass, hwClass, hqOff, hwOff, hqw,
        hsecondDouble, hfirstDouble | hsmall⟩
    · let B' := (B.erase q).erase w
      have hqB : q ∈ B := (mem_selectedClass.mp hqClass).1
      have hwB : w ∈ B := (mem_selectedClass.mp hwClass).1
      have hwErase : w ∈ B.erase q :=
        Finset.mem_erase.mpr ⟨hqw.symm, hwB⟩
      have htwo : 2 ≤ B.card :=
        Finset.one_lt_card.mpr ⟨q, hqB, w, hwB, hqw⟩
      have hcardB' : B'.card + 2 = B.card := by
        simp [B', Finset.card_erase_of_mem hwErase,
          Finset.card_erase_of_mem hqB]
        omega
      have hlt : B'.card < n := by omega
      have hB'A : B' ⊆ D.A := by
        exact fun x hx => hBA
          ((Finset.erase_subset w (B.erase q)) hx |>
            (Finset.erase_subset q B))
      exact ih B'.card hlt B' rfl hB'A hfirstDouble hsecondDouble
    · exact ⟨{
        carrier := B
        carrier_subset := hBA
        first_k4 := hfirst
        second_k4 := hsecond
        radius := r
        radius_pos := hr
        q := q
        w := w
        q_mem_class := hqClass
        w_mem_class := hwClass
        q_off_surplus := hqOff
        w_off_surplus := hwOff
        q_ne_w := hqw
        second_double_survives := hsecondDouble
        first_unique_four_or_five := hsmall }⟩

/-- Full-carrier specialization of the terminal theorem. -/
theorem exists_biApexTerminalPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    Nonempty (BiApexTerminalPacket D S) := by
  exact exists_biApexTerminalPacket_of_localK4 D S D.A
    (fun _ h => h)
    (D.K4 S.oppApex1 (by
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i
      · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
      · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
      · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem))
    (D.K4 S.oppApex2 (oppApex2_mem_A S))

/-- In an exact card-five first-apex class, three class points lie in the
strict interior of `oppCap1`.  Two of those can be chosen so that deleting
both preserves K4 at the second apex. -/
theorem exists_strictOppCap1_pair_double_deletion_survives_secondApex_of_card_five
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    ∃ q w : ℝ²,
      q ∈ SelectedClass D.A S.oppApex1 r ∧
      w ∈ SelectedClass D.A S.oppApex1 r ∧
      q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase q).erase w) S.oppApex2 := by
  classical
  let F := D.A.filter fun x => dist x S.oppApex1 = r
  let I := S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  let U := F ∩ I
  have hFcard : F.card = 5 := by
    simpa [F, SelectedClass, dist_comm] using hcard
  have hsurp : (F ∩ S.surplusCap).card ≤ 1 := by
    let DS : CounterexampleData :=
      { A := D.A
        nonempty := D.nonempty
        convex := D.convex
        K4 := D.K4
        packet := S }
    simpa [DS, F] using U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hopp2 : (F ∩ S.oppCap2).card ≤ 1 := by
    let DS : CounterexampleData :=
      { A := D.A
        nonempty := D.nonempty
        convex := D.convex
        K4 := D.K4
        packet := S }
    simpa [DS, F] using U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS r
  have houtsideSub : F \ I ⊆
      (F ∩ S.surplusCap) ∪ (F ∩ S.oppCap2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxF, hxNotI⟩
    have hxCover := U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover
      ({ A := D.A
         nonempty := D.nonempty
         convex := D.convex
         K4 := D.K4
         packet := S } : CounterexampleData) r hxF
    simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
    rcases hxCover with (hxSurp | hxOpp2) | hxI
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxF, hxSurp⟩))
    · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxF, hxOpp2⟩))
    · exact False.elim (hxNotI (by simpa [I] using hxI))
  have houtside : (F \ I).card ≤ 2 := by
    calc
      (F \ I).card ≤ ((F ∩ S.surplusCap) ∪
          (F ∩ S.oppCap2)).card := Finset.card_le_card houtsideSub
      _ ≤ (F ∩ S.surplusCap).card + (F ∩ S.oppCap2).card :=
        Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter F I
  have hUthree : 3 ≤ U.card := by
    change 3 ≤ (F ∩ I).card
    omega
  have hUT : U ⊆ F \ S.surplusCap := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxF, hxI⟩
    exact Finset.mem_sdiff.mpr
      ⟨hxF, fun hxSurp =>
        (Finset.mem_sdiff.mp hxI).2
          (Finset.mem_union.mpr (Or.inl hxSurp))⟩
  rcases exists_pair_in_marginal_subset_double_deletion_survives_secondApex
      D S r U (by simpa [F] using hUT) hUthree with
    ⟨q, w, hqU, hwU, hqw, hdouble⟩
  rcases Finset.mem_inter.mp hqU with ⟨hqF, hqI⟩
  rcases Finset.mem_inter.mp hwU with ⟨hwF, hwI⟩
  have hqClass : q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_filter.mp hqF with ⟨hqA, hqr⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqr⟩
  have hwClass : w ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_filter.mp hwF with ⟨hwA, hwr⟩
    exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwr⟩
  exact ⟨q, w, hqClass, hwClass, by simpa [I] using hqI,
    by simpa [I] using hwI, hqw, hdouble⟩

#print axioms firstApex_marginal_inter_secondClass_card_le_one
#print axioms exists_pair_double_deletion_survives_secondApex
#print axioms exists_biApex_monotone_step
#print axioms exists_biApexTerminalPacket_of_localK4
#print axioms exists_biApexTerminalPacket
#print axioms exists_strictOppCap1_pair_double_deletion_survives_secondApex_of_card_five

end ATailSecondApexDoubleSurvivorScratch
end Problem97
