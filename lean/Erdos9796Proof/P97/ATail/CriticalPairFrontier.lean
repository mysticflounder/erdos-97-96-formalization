/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# ATAIL critical-pair frontier

This module packages the prescribed-apex deletion reductions into one
dependent frontier.  It imports only predecessors of the U1 large-cap tail,
so the public extraction theorem can be consumed there without an import
cycle.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace ATAILSameRadiusDoubleErase

attribute [local instance] Classical.propDecidable

/-- Failure after deleting two members of one selected radius class forces
that class to be the unique K4 class and to have cardinality four or five. -/
theorem sameRadius_double_erase_survives_or_unique_class_card_four_or_five
    {A : Finset ℝ²} {center q w : ℝ²} {radius : ℝ}
    (hK4 : HasNEquidistantPointsAt 4 A center)
    (hq : q ∈ SelectedClass A center radius)
    (hw : w ∈ SelectedClass A center radius)
    (hqw : q ≠ w) :
    HasNEquidistantPointsAt 4 ((A.erase q).erase w) center ∨
      (((SelectedClass A center radius).card = 4 ∨
          (SelectedClass A center radius).card = 5) ∧
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass A center rho).card → rho = radius) := by
  by_cases hdouble :
      HasNEquidistantPointsAt 4 ((A.erase q).erase w) center
  · exact Or.inl hdouble
  · right
    have hunique :
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass A center rho).card → rho = radius := by
      intro rho hrho hfour
      by_contra hradius
      have hqNot : q ∉ SelectedClass A center rho := by
        intro hqRho
        apply hradius
        exact ((mem_selectedClass.mp hqRho).2.symm.trans
          (mem_selectedClass.mp hq).2)
      have hwNot : w ∉ SelectedClass A center rho := by
        intro hwRho
        apply hradius
        exact ((mem_selectedClass.mp hwRho).2.symm.trans
          (mem_selectedClass.mp hw).2)
      apply hdouble
      refine ⟨rho, hrho, ?_⟩
      have hqCard :
          (SelectedClass (A.erase q) center rho).card =
            (SelectedClass A center rho).card :=
        selectedClass_erase_card_eq_of_not_mem hqNot
      have hwNotErase : w ∉ SelectedClass (A.erase q) center rho := by
        rw [selectedClass_erase_eq]
        exact fun hwErase => hwNot (Finset.mem_of_mem_erase hwErase)
      have hwCard :
          (SelectedClass ((A.erase q).erase w) center rho).card =
            (SelectedClass (A.erase q) center rho).card :=
        selectedClass_erase_card_eq_of_not_mem hwNotErase
      change 4 ≤
        (SelectedClass ((A.erase q).erase w) center rho).card
      rw [hwCard, hqCard]
      exact hfour
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hK4 with
      ⟨rho, hrho, hfourRho⟩
    have hradius : rho = radius := hunique rho hrho hfourRho
    have hfour : 4 ≤ (SelectedClass A center radius).card := by
      simpa [hradius] using hfourRho
    have hnotSix : ¬ 6 ≤ (SelectedClass A center radius).card := by
      intro hsix
      apply hdouble
      refine ⟨radius, ?_, ?_⟩
      · exact lt_of_lt_of_eq hrho hradius
      · have hfive :
            5 ≤ (SelectedClass (A.erase q) center radius).card :=
          selectedClass_erase_card_ge_of_succ_le hsix
        have hwErase :
            w ∈ SelectedClass (A.erase q) center radius := by
          rw [selectedClass_erase_eq]
          exact Finset.mem_erase.mpr ⟨hqw.symm, hw⟩
        have hfourDouble :
            4 ≤ (SelectedClass ((A.erase q).erase w) center radius).card :=
          by
            rw [selectedClass_erase_eq,
              Finset.card_erase_of_mem hwErase]
            omega
        simpa [SelectedClass] using hfourDouble
    exact ⟨by omega, hunique⟩

end ATAILSameRadiusDoubleErase

namespace ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- If deleting `q` blocks K4 at a prescribed carrier center, global K4
turns the full radius class there into an exact critical four-shell. -/
theorem criticalSelectedFourClass_at_of_no_qfree
    {A : Finset ℝ²} {q center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hcenter : center ∈ A)
    (hcenter_ne_q : center ≠ q)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center) :
    Nonempty (CriticalSelectedFourClass A q center) := by
  have hcenterErase : center ∈ A.erase q :=
    Finset.mem_erase.mpr ⟨hcenter_ne_q, hcenter⟩
  rcases selectedClass_erase_witness_or_exact_erased_pin hK4 hcenterErase with
    ⟨radius, hradius, hsurvives⟩ |
      ⟨radius, hradius, hcard, hqClass⟩
  · exact False.elim (hblocked ⟨radius, hradius, by
      simpa [SelectedClass] using hsurvives⟩)
  · exact CriticalSelectedFourClass.exists_of_exactSelectedClass
      hcenter hradius hcard hqClass

/-- At any prescribed carrier center, deleting `q` either preserves a K4
witness or produces a named exact critical shell through `q`. -/
theorem erase_survives_or_criticalSelectedFourClass_at
    {A : Finset ℝ²} {q center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hcenter : center ∈ A) :
    HasNEquidistantPointsAt 4 (A.erase q) center ∨
      ∃ _C : CriticalSelectedFourClass A q center,
        ¬ HasNEquidistantPointsAt 4 (A.erase q) center := by
  by_cases hcenterq : center = q
  · subst q
    rcases hK4 center hcenter with ⟨radius, hradius, hcard⟩
    refine Or.inl ⟨radius, hradius, ?_⟩
    have hcenterNot : ¬ dist center center = radius := by
      intro hzero
      rw [dist_self] at hzero
      exact (ne_of_lt hradius) hzero
    have hcenterNotMem :
        center ∉ A.filter fun z => dist center z = radius := by
      intro hmem
      exact hcenterNot (Finset.mem_filter.mp hmem).2
    simpa [Finset.filter_erase, hcenterNotMem] using hcard
  · by_cases hsurvives : HasNEquidistantPointsAt 4 (A.erase q) center
    · exact Or.inl hsurvives
    · exact Or.inr
        ⟨Classical.choice
            (criticalSelectedFourClass_at_of_no_qfree
              hK4 hcenter hcenterq hsurvives),
          hsurvives⟩

/-- If deleting `w` blocks K4 at `center`, every selected four-class there
contains `w`. -/
theorem source_mem_critical_support_of_no_qfree
    {A : Finset ℝ²} {q w center : ℝ²}
    (C : CriticalSelectedFourClass A q center)
    (hwblocked : ¬ HasNEquidistantPointsAt 4 (A.erase w) center) :
    w ∈ C.toCriticalFourShell.support := by
  by_contra hw
  apply hwblocked
  refine ⟨C.toCriticalFourShell.radius,
    C.toCriticalFourShell.radius_pos, ?_⟩
  calc
    4 = C.toCriticalFourShell.support.card :=
      C.toCriticalFourShell.support_card.symm
    _ ≤ (SelectedClass (A.erase w) center
          C.toCriticalFourShell.radius).card :=
      Finset.card_le_card (by
        intro z hz
        have hzA : z ∈ A :=
          C.toCriticalFourShell.support_subset_A hz
        have hzdist : dist center z = C.toCriticalFourShell.radius :=
          C.toCriticalFourShell.support_eq_radius z hz
        refine mem_selectedClass.mpr ⟨?_, hzdist⟩
        refine Finset.mem_erase.mpr ⟨?_, hzA⟩
        intro hzw
        subst z
        exact hw hz)

/-- Among off-surplus points at one fixed first-apex radius, at most one
source deletion can block K4 at the second opposite apex. -/
theorem blocked_sources_in_firstApex_marginal_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ) :
    ((((D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap).filter
      fun q =>
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2).card ≤ 1) := by
  classical
  have happ2 : S.oppApex2 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
  rw [Finset.card_le_one]
  intro q hq w hw
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqblocked⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwblocked⟩
  rcases Finset.mem_sdiff.mp hqT with ⟨hqFilter, hqOff⟩
  rcases Finset.mem_sdiff.mp hwT with ⟨hwFilter, hwOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqFirst⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwFirst⟩
  by_contra hqw
  rcases erase_survives_or_criticalSelectedFourClass_at (q := q) D.K4 happ2 with
    hqSurvives | ⟨Cq, _hqblocked'⟩
  · exact hqblocked hqSurvives
  · have hwCq : w ∈ Cq.toCriticalFourShell.support :=
      source_mem_critical_support_of_no_qfree Cq hwblocked
    have hqSecond :
        dist q S.oppApex2 = Cq.toCriticalFourShell.radius := by
      simpa only [dist_comm] using
        Cq.toCriticalFourShell.support_eq_radius q
          Cq.toCriticalFourShell.q_mem_support
    have hwSecond :
        dist w S.oppApex2 = Cq.toCriticalFourShell.radius := by
      simpa only [dist_comm] using
        Cq.toCriticalFourShell.support_eq_radius w hwCq
    exact U2NonSurplusSqueeze.oppCap2_escape_gen
      D S hqA hwA hqOff hwOff hqw hqFirst hwFirst hqSecond hwSecond

/-- A three-point off-surplus first-apex marginal contains at least two
sources whose deletion still leaves K4 at the second apex. -/
theorem two_le_surviving_sources_in_firstApex_marginal
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    2 ≤ ((((D.A.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap).filter fun q =>
        HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2).card) := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  let survives : ℝ² → Prop := fun q =>
    HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  have hblocked : (T.filter fun q => ¬ survives q).card ≤ 1 := by
    simpa [T, survives] using
      blocked_sources_in_firstApex_marginal_card_le_one D S r
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := T) survives
  have hthreeT : 3 ≤ T.card := by simpa [T] using hthree
  have htwo : 2 ≤ (T.filter survives).card := by omega
  simpa [T, survives] using htwo

/-- Witness-extraction form of
`two_le_surviving_sources_in_firstApex_marginal`. -/
theorem exists_two_surviving_sources_in_firstApex_marginal
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    ∃ q w : ℝ²,
      q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  let survives : ℝ² → Prop := fun q =>
    HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  have htwo : 2 ≤ (T.filter survives).card := by
    simpa [T, survives] using
      two_le_surviving_sources_in_firstApex_marginal D S r hthree
  have hone : 1 < (T.filter survives).card := by omega
  rcases (Finset.one_lt_card.mp hone) with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqT, hqSurvives⟩
  rcases Finset.mem_filter.mp hw with ⟨hwT, hwSurvives⟩
  exact ⟨q, w, by simpa [T] using hqT, by simpa [T] using hwT,
    hqw, hqSurvives, hwSurvives⟩

/-- A source whose deletion preserves K4 at `center` cannot have `center` as
its chosen blocker in a `CriticalShellSystem`. -/
theorem actual_blocker_ne_of_deletion_survives
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center : ℝ²} (hq : q ∈ A)
    (hsurvives : HasNEquidistantPointsAt 4 (A.erase q) center) :
    H.centerAt q hq ≠ center := by
  intro hcenter
  have hblocked := H.no_qfree_at q hq
  rw [hcenter] at hblocked
  exact hblocked hsurvives

/-- The exact relocation packet left by the prescribed-apex split. -/
structure SurvivorPairRelocationPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A) where
  q : ℝ²
  w : ℝ²
  q_mem_A : q ∈ D.A
  w_mem_A : w ∈ D.A
  q_mem_marginal :
    q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  w_mem_marginal :
    w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  q_ne_w : q ≠ w
  q_survives : HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  w_survives : HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2
  q_blocker_ne_oppApex2 : H.centerAt q q_mem_A ≠ S.oppApex2
  w_blocker_ne_oppApex2 : H.centerAt w w_mem_A ≠ S.oppApex2

/-- Every three-point first-apex marginal and critical-shell system produce a
survivor relocation packet. -/
theorem exists_survivorPairRelocationPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    Nonempty (SurvivorPairRelocationPacket D S r H) := by
  rcases exists_two_surviving_sources_in_firstApex_marginal
      D S r hthree with
    ⟨q, w, hqT, hwT, hqw, hqSurvives, hwSurvives⟩
  have hqA : q ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).1
  have hwA : w ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).1
  exact ⟨
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
        actual_blocker_ne_of_deletion_survives H hwA hwSurvives }⟩

/-- If a K4 witness after deleting `deleted` is destroyed by additionally
deleting `pivot`, and the radii differ, the pivot class is an exact shell. -/
theorem criticalSelectedFourClass_of_single_survives_double_blocked
    {A : Finset ℝ²} {deleted pivot center : ℝ²}
    (hcenter : center ∈ A)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A.erase deleted) center)
    (hdoubleBlocked :
      ¬ HasNEquidistantPointsAt 4
        ((A.erase deleted).erase pivot) center)
    (hdist : dist center deleted ≠ dist center pivot) :
    Nonempty (CriticalSelectedFourClass A pivot center) := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hcard⟩
  have hpivotClass :
      pivot ∈ SelectedClass (A.erase deleted) center radius := by
    by_contra hpivotNot
    apply hdoubleBlocked
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A.erase deleted) (x := pivot) (s := center) (d := radius)
      hpivotNot
    refine ⟨radius, hradius, ?_⟩
    have hcardDouble :
        4 ≤ (SelectedClass ((A.erase deleted).erase pivot)
          center radius).card := by
      rw [hsameCard]
      exact hcard
    simpa [SelectedClass] using hcardDouble
  have hnotFive :
      ¬ 5 ≤ (SelectedClass (A.erase deleted) center radius).card := by
    intro hfive
    apply hdoubleBlocked
    have hfourDouble := selectedClass_erase_card_ge_of_succ_le
      (A := A.erase deleted) (x := pivot) (s := center) (d := radius)
      (n := 4) (by simpa using hfive)
    exact ⟨radius, hradius, by
      simpa [SelectedClass] using hfourDouble⟩
  have hcardExactDeleted :
      (SelectedClass (A.erase deleted) center radius).card = 4 := by
    omega
  have hpivotDist : dist center pivot = radius :=
    (mem_selectedClass.mp hpivotClass).2
  have hdeletedNot : deleted ∉ SelectedClass A center radius := by
    intro hdeletedClass
    apply hdist
    exact (mem_selectedClass.mp hdeletedClass).2.trans hpivotDist.symm
  have hcardExact : (SelectedClass A center radius).card = 4 := by
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A) (x := deleted) (s := center) (d := radius) hdeletedNot
    rw [hsameCard] at hcardExactDeleted
    exact hcardExactDeleted
  have hpivotA : pivot ∈ A :=
    (Finset.mem_erase.mp (mem_selectedClass.mp hpivotClass).1).2
  have hpivotFull : pivot ∈ SelectedClass A center radius :=
    mem_selectedClass.mpr ⟨hpivotA, hpivotDist⟩
  exact CriticalSelectedFourClass.exists_of_exactSelectedClass
    hcenter hradius hcardExact hpivotFull

/-- Two distinct-radius single-deletion survivors either survive together or
yield two disjoint exact four-point ambient shells. -/
theorem double_erase_survives_or_two_disjoint_exact_shells
    {A : Finset ℝ²} {q w center : ℝ²}
    (hcenter : center ∈ A)
    (hqSurvives : HasNEquidistantPointsAt 4 (A.erase q) center)
    (hwSurvives : HasNEquidistantPointsAt 4 (A.erase w) center)
    (hdist : dist center q ≠ dist center w) :
    HasNEquidistantPointsAt 4 ((A.erase q).erase w) center ∨
      ∃ Cq : CriticalSelectedFourClass A q center,
        ∃ Cw : CriticalSelectedFourClass A w center,
          Cq.toCriticalFourShell.radius = dist center q ∧
          Cw.toCriticalFourShell.radius = dist center w ∧
          Disjoint Cq.toCriticalFourShell.support
            Cw.toCriticalFourShell.support := by
  by_cases hdouble :
      HasNEquidistantPointsAt 4 ((A.erase q).erase w) center
  · exact Or.inl hdouble
  · have hdoubleSym :
        ¬ HasNEquidistantPointsAt 4 ((A.erase w).erase q) center := by
      simpa [Finset.erase_right_comm] using hdouble
    rcases criticalSelectedFourClass_of_single_survives_double_blocked
        hcenter hwSurvives hdoubleSym hdist.symm with ⟨Cq⟩
    rcases criticalSelectedFourClass_of_single_survives_double_blocked
        hcenter hqSurvives hdouble hdist with ⟨Cw⟩
    have hCqRadius :
        Cq.toCriticalFourShell.radius = dist center q :=
      (Cq.toCriticalFourShell.support_eq_radius q
        Cq.toCriticalFourShell.q_mem_support).symm
    have hCwRadius :
        Cw.toCriticalFourShell.radius = dist center w :=
      (Cw.toCriticalFourShell.support_eq_radius w
        Cw.toCriticalFourShell.q_mem_support).symm
    have hdisjoint :
        Disjoint Cq.toCriticalFourShell.support
          Cw.toCriticalFourShell.support := by
      rw [Finset.disjoint_left]
      intro z hzq hzw
      apply hdist
      calc
        dist center q = Cq.toCriticalFourShell.radius := hCqRadius.symm
        _ = dist center z :=
          (Cq.toCriticalFourShell.support_eq_radius z hzq).symm
        _ = Cw.toCriticalFourShell.radius :=
          Cw.toCriticalFourShell.support_eq_radius z hzw
        _ = dist center w := hCwRadius
    exact Or.inr ⟨Cq, Cw, hCqRadius, hCwRadius, hdisjoint⟩

/-- Distinct points of one off-surplus first-apex marginal have different
second-apex radii. -/
theorem SurvivorPairRelocationPacket.oppApex2_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    dist S.oppApex2 P.q ≠ dist S.oppApex2 P.w := by
  intro hdist
  rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, hqOff⟩
  rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, hwOff⟩
  have hqFirst := (Finset.mem_filter.mp hqFilter).2
  have hwFirst := (Finset.mem_filter.mp hwFilter).2
  have hsecond : dist P.q S.oppApex2 = dist P.w S.oppApex2 := by
    simpa only [dist_comm] using hdist
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S P.q_mem_A P.w_mem_A hqOff hwOff P.q_ne_w
      hqFirst hwFirst rfl hsecond.symm

/-- A survivor pair cannot occupy the same strict side of the chord from the
first apex to the actual blocker chosen at `q` when the blocker shell also
contains `w`.

The first-apex marginal supplies one common circle through `q,w`; source
membership and the cross hit in `H.selectedAt q` supply the other.  Thus the
two-circle reflection obstruction applies. -/
theorem SurvivorPairRelocationPacket.false_of_w_mem_selectedAt_q_of_sameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hsameSide :
      0 < signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A)) :
    False := by
  have hqFirst : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hwFirst : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  have hqBlocker :
      dist P.q (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
  have hwBlocker :
      dist P.w (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwShell
  rcases (mul_pos_iff.mp hsameSide) with hpositive | hnegative
  · exact Problem97.twoCircle_sameSide_reflection_false
      (q := S.oppApex1) (v2 := H.centerAt P.q P.q_mem_A)
      (apex := P.q) (y := P.q) (u := P.w)
      (rq := r)
      (rv := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius)
      hwFirst hqFirst hwBlocker hqBlocker P.q_ne_w.symm
      hsameSide (mul_pos hpositive.2 hpositive.2)
  · exact Problem97.twoCircle_sameSide_reflection_false
      (q := S.oppApex1) (v2 := H.centerAt P.q P.q_mem_A)
      (apex := P.q) (y := P.q) (u := P.w)
      (rq := r)
      (rv := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius)
      hwFirst hqFirst hwBlocker hqBlocker P.q_ne_w.symm
      hsameSide (mul_pos_of_neg_of_neg hnegative.2 hnegative.2)

/-- Survivor-packet specialization of the double-deletion normal form. -/
theorem SurvivorPairRelocationPacket.double_erase_or_exact_eight_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    HasNEquidistantPointsAt 4
        ((D.A.erase P.q).erase P.w) S.oppApex2 ∨
      ∃ Cq : CriticalSelectedFourClass D.A P.q S.oppApex2,
        ∃ Cw : CriticalSelectedFourClass D.A P.w S.oppApex2,
          Cq.toCriticalFourShell.radius = dist S.oppApex2 P.q ∧
          Cw.toCriticalFourShell.radius = dist S.oppApex2 P.w ∧
          Disjoint Cq.toCriticalFourShell.support
            Cw.toCriticalFourShell.support := by
  have happ2 : S.oppApex2 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
  exact double_erase_survives_or_two_disjoint_exact_shells
    happ2 P.q_survives P.w_survives P.oppApex2_dist_ne

end ATAILStageOnePrescribedApexDichotomy

namespace ATailCriticalPairFrontier

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- The first-apex deletion normal form for a relocated survivor pair. -/
def FirstApexSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop :=
  HasNEquidistantPointsAt 4 ((D.A.erase P.q).erase P.w) S.oppApex1 ∨
    (((SelectedClass D.A S.oppApex1 r).card = 4 ∨
        (SelectedClass D.A S.oppApex1 r).card = 5) ∧
      ∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r)

/-- The independent second-apex deletion normal form for the same pair. -/
def SecondApexSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop :=
  HasNEquidistantPointsAt 4 ((D.A.erase P.q).erase P.w) S.oppApex2 ∨
    ∃ Cq : CriticalSelectedFourClass D.A P.q S.oppApex2,
      ∃ Cw : CriticalSelectedFourClass D.A P.w S.oppApex2,
        Cq.toCriticalFourShell.radius = dist S.oppApex2 P.q ∧
        Cw.toCriticalFourShell.radius = dist S.oppApex2 P.w ∧
        Disjoint Cq.toCriticalFourShell.support
          Cw.toCriticalFourShell.support

/-- The bookkeeping frontier consumed by the open ATAIL coupling theorem. -/
structure CriticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A) where
  pair : SurvivorPairRelocationPacket D S r H
  firstApexSplit : FirstApexSplit pair
  secondApexDouble :
    HasNEquidistantPointsAt 4
      ((D.A.erase pair.q).erase pair.w) S.oppApex2
  secondApexSplit : SecondApexSplit pair

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

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- At the blocker selected for source `q`, deleting `w` either preserves a
four-point class or the chosen critical shell contains `w`. -/
theorem cross_deletion_survives_or_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ∨
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  by_cases hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)
  · exact Or.inl hsurvives
  · exact Or.inr
      (source_mem_critical_support_of_no_qfree
        (H.selectedAt P.q P.q_mem_A) hsurvives)

private theorem equidistant_mono
    {n : ℕ} {S T : Finset ℝ²} {p : ℝ²}
    (hsub : S ⊆ T)
    (h : HasNEquidistantPointsAt n S p) :
    HasNEquidistantPointsAt n T p := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzS, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzS, hzdist⟩

/-- A fixed second-apex selected class contains at most one point of an
off-surplus first-apex marginal. -/
theorem firstApex_marginal_inter_secondClass_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (r rho : ℝ) :
    ((((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).filter
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
    D S hqA hwA hqOff hwOff hqw hqFirst hwFirst hqSecond hwSecond

private theorem exists_pair_in_marginal_subset_double_deletion_survives_secondApex
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (U : Finset ℝ²)
    (hUT : U ⊆
      (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap)
    (hthree : 3 ≤ U.card) :
    ∃ q w : ℝ², q ∈ U ∧ w ∈ U ∧ q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase q).erase w) S.oppApex2 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \
    S.surplusCap
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
      q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap ∧
      q ≠ w ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase q).erase w) S.oppApex2 := by
  classical
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \
    S.surplusCap
  have hthreeT : 3 ≤ T.card := by simpa [T] using hthree
  rcases exists_pair_in_marginal_subset_double_deletion_survives_secondApex
      D S r T (by intro x hx; simpa [T] using hx) hthreeT with
    ⟨q, w, hqT, hwT, hqw, hdouble⟩
  exact ⟨q, w, by simpa [T] using hqT, by simpa [T] using hwT,
    hqw, hdouble⟩

/-- Adding a second deletion cannot restore K4 at the blocker already killed
by deleting its source. -/
theorem cumulative_deletion_blocked_at_source_blocker
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) :
    ¬ HasNEquidistantPointsAt 4 ((A.erase w).erase q)
      (H.centerAt q hq) := by
  intro hdouble
  apply H.no_qfree_at q hq
  apply equidistant_mono
    (T := A.erase q) (p := H.centerAt q hq) _ hdouble
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzq, hzAw⟩
  exact Finset.mem_erase.mpr ⟨hzq, (Finset.mem_erase.mp hzAw).2⟩

/-- At a source blocker, K4 after deleting a point `w` survives exactly when
`w` avoids the chosen exact critical shell. -/
theorem cross_deletion_survives_iff_not_mem_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) :
    HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
      w ∉ (H.selectedAt q hq).toCriticalFourShell.support := by
  let K := (H.selectedAt q hq).toCriticalFourShell
  constructor
  · rintro ⟨rho, hrho, hfour⟩ hwK
    have hqClass : q ∈ SelectedClass (A.erase w) (H.centerAt q hq) rho := by
      by_contra hqNot
      have hdouble :
          HasNEquidistantPointsAt 4 ((A.erase w).erase q)
            (H.centerAt q hq) := by
        refine ⟨rho, hrho, ?_⟩
        have hsame := selectedClass_erase_card_eq_of_not_mem
          (A := A.erase w) (x := q) (s := H.centerAt q hq)
          (d := rho) hqNot
        simpa [SelectedClass] using hfour.trans_eq hsame.symm
      exact cumulative_deletion_blocked_at_source_blocker H hq hdouble
    have hrho : rho = K.radius := by
      calc
        rho = dist (H.centerAt q hq) q :=
          (mem_selectedClass.mp hqClass).2.symm
        _ = K.radius := K.support_eq_radius q K.q_mem_support
    have hfourK :
        4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card := by
      simpa [hrho] using hfour
    have hselectedEq :
        SelectedClass A (H.centerAt q hq) K.radius = K.support := by
      simpa [SelectedClass] using K.support_eq.symm
    rw [selectedClass_erase_eq, hselectedEq,
      Finset.card_erase_of_mem hwK, K.support_card] at hfourK
    omega
  · intro hwK
    refine ⟨K.radius, K.radius_pos, ?_⟩
    have hselectedEq :
        SelectedClass A (H.centerAt q hq) K.radius = K.support := by
      simpa [SelectedClass] using K.support_eq.symm
    have hcard :
        (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card = 4 := by
      rw [selectedClass_erase_eq, hselectedEq,
        Finset.erase_eq_self.mpr hwK, K.support_card]
    have hfour :
        4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card := by
      omega
    simpa [SelectedClass] using hfour

/-- One reverse cross omission forces distinct chosen blocker centers.

Indeed, omitting `q` from the exact shell sourced at `w` is equivalent to K4
surviving deletion of `q` at `w`'s blocker.  If the two blockers coincided,
this would contradict deletion criticality at the blocker sourced by `q`. -/
theorem blocker_centers_ne_of_not_mem_other_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) (hw : w ∈ A)
    (hqOutside :
      q ∉ (H.selectedAt w hw).toCriticalFourShell.support) :
    H.centerAt q hq ≠ H.centerAt w hw := by
  intro hcenters
  have hsurvives :
      HasNEquidistantPointsAt 4 (A.erase q) (H.centerAt w hw) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hw).mpr
      hqOutside
  apply H.no_qfree_at q hq
  simpa only [hcenters] using hsurvives

/-- One cross omission already makes the two exact selected shells circles at
distinct centers, so their support overlap has cardinality at most two.

The reciprocal robust branch supplies this hypothesis in both directions,
but only one direction is needed for the overlap bound. -/
theorem selected_support_inter_card_le_two_of_not_mem_other_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) (hw : w ∈ A)
    (hqOutside :
      q ∉ (H.selectedAt w hw).toCriticalFourShell.support) :
    (((H.selectedAt q hq).toCriticalFourShell.support ∩
      (H.selectedAt w hw).toCriticalFourShell.support).card ≤ 2) := by
  exact SelectedFourClass.inter_card_le_two
    (H.selectedAt q hq).toSelectedFourClass
    (H.selectedAt w hw).toSelectedFourClass
    (blocker_centers_ne_of_not_mem_other_selected_support
      H hq hw hqOutside)

/-- Survival of the cross deletion forces the two source points onto
different radii about `q`'s blocker. -/
theorem SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)) :
    dist (H.centerAt P.q P.q_mem_A) P.w ≠
      dist (H.centerAt P.q P.q_mem_A) P.q := by
  have hwNot :
      P.w ∉ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.q_mem_A).mp hsurvives
  intro hdist
  apply hwNot
  apply (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.off_row_named_label_forbidden
    P.w_mem_A
  exact hdist.trans
    ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
      P.q
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support)

/-- A surviving K4 row at a source blocker is exactly the original chosen
critical shell on the erased carrier, and its radius is the unique positive
radius carrying four points there. -/
theorem cross_survival_unique_radius_and_exact_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq)) :
    SelectedClass (A.erase w) (H.centerAt q hq)
        (H.selectedAt q hq).toCriticalFourShell.radius =
      (H.selectedAt q hq).toCriticalFourShell.support ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) rho).card →
      rho = (H.selectedAt q hq).toCriticalFourShell.radius := by
  let K := (H.selectedAt q hq).toCriticalFourShell
  have hwNot : w ∉ K.support :=
    (cross_deletion_survives_iff_not_mem_selected_support H hq).mp hsurvives
  have hselectedEq :
      SelectedClass A (H.centerAt q hq) K.radius = K.support := by
    simpa [SelectedClass] using K.support_eq.symm
  constructor
  · rw [selectedClass_erase_eq, hselectedEq,
      Finset.erase_eq_self.mpr hwNot]
  · intro rho hrho hfour
    have hqClass : q ∈ SelectedClass (A.erase w) (H.centerAt q hq) rho := by
      by_contra hqNot
      have hdouble :
          HasNEquidistantPointsAt 4 ((A.erase w).erase q)
            (H.centerAt q hq) := by
        refine ⟨rho, hrho, ?_⟩
        have hsame := selectedClass_erase_card_eq_of_not_mem
          (A := A.erase w) (x := q) (s := H.centerAt q hq)
          (d := rho) hqNot
        simpa [SelectedClass] using hfour.trans_eq hsame.symm
      exact cumulative_deletion_blocked_at_source_blocker H hq hdouble
    calc
      rho = dist (H.centerAt q hq) q :=
        (mem_selectedClass.mp hqClass).2.symm
      _ = K.radius := K.support_eq_radius q K.q_mem_support

/-- Cross-deletion survival at a source's actual blocker already separates
that blocker from the first apex.  No class-cardinality hypothesis is
needed. -/
theorem SurvivorPairRelocationPacket.actual_blocker_ne_oppApex1_of_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcross :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hradiusNe :=
    SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives
      P hcross
  have hq : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hw : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  intro hcenter
  apply hradiusNe
  simpa [hcenter, dist_comm] using hw.trans hq.symm

/-- A cross hit in the selected critical row puts the two common points on
opposite strict sides of the chord joining the first apex to the blocker. -/
theorem signedArea_product_neg_of_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1) :
    signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) < 0 := by
  have hqFirst : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hwFirst : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  have hqBlocker :
      dist P.q (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
  have hwBlocker :
      dist P.w (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwShell
  have hmid :
      signedArea2 (midpoint ℝ P.q P.w) S.oppApex1
        (H.centerAt P.q P.q_mem_A) = 0 :=
    twoCircle_midpoint_collinear hwFirst hqFirst hwBlocker hqBlocker
      P.q_ne_w.symm
  have hflip :
      signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) =
        -signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) :=
    signedArea2_reflection_neg hmid
  have hq_ne_apex : P.q ≠ S.oppApex1 := by
    intro h
    exact (Finset.mem_sdiff.mp P.q_mem_marginal).2
      (by
        rcases hi : S.surplusIdx with ⟨i, hi3⟩
        interval_cases i
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3)
  have hq_ne_blocker : P.q ≠ H.centerAt P.q P.q_mem_A := by
    intro h
    apply H.blockerVertex_ne ⟨P.q, P.q_mem_A⟩
    apply Subtype.ext
    exact h.symm
  have harea_ne :
      signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear
      P.q_mem_A (oppApex1_mem_A S) (blocker_mem_A H P.q_mem_A)
      hq_ne_apex hq_ne_blocker hcenters.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  rw [hflip]
  nlinarith [sq_pos_of_ne_zero harea_ne]

private theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hqSelected : P.q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    omega
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 :=
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩
  exact actual_blocker_ne_of_deletion_survives
    H P.q_mem_A hsurvives

/-- If both source deletions preserve K4 at the first apex, mutual cross
membership forces the two chosen source blockers to coincide.

The survival hypotheses keep both blockers away from the first apex.  If the
blockers were also distinct from one another, the first apex and the two
blockers would be three carrier points on the perpendicular bisector of the
source pair, contradicting the convex perpendicular-bisector bound. -/
theorem blocker_centers_eq_of_first_apex_deletion_survives_of_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1)
    (hwSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1)
    (hwq :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqw :
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A := by
  classical
  let cq := H.centerAt P.q P.q_mem_A
  let cw := H.centerAt P.w P.w_mem_A
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using oppApex1_mem_A S
  have hcqA : cq ∈ D.A := by
    simpa [cq] using blocker_mem_A H P.q_mem_A
  have hcwA : cw ∈ D.A := by
    simpa [cw] using blocker_mem_A H P.w_mem_A
  have hcq_ne_o : cq ≠ o := by
    simpa [cq, o] using
      actual_blocker_ne_of_deletion_survives H P.q_mem_A hqSurvivesO
  have hcw_ne_o : cw ≠ o := by
    simpa [cw, o] using
      actual_blocker_ne_of_deletion_survives H P.w_mem_A hwSurvivesO
  by_contra hcqcw
  have hoEq : dist o P.q = dist o P.w := by
    have hqRadius :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
    have hwRadius :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
    simpa [o, dist_comm] using hqRadius.trans hwRadius.symm
  have hcqEq : dist cq P.q = dist cq P.w := by
    exact
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
          P.w hwq).symm
  have hcwEq : dist cw P.q = dist cw P.w := by
    exact
      (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_eq_radius
        P.q hqw
      |>.trans
        ((H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_eq_radius
          P.w
          (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    P.q_mem_A P.w_mem_A P.q_ne_w
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcqFilter :
      cq ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hcqA, hcqEq⟩
  have hcwFilter :
      cw ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hcwA, hcwEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z P.q = dist z P.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cq, hcqFilter, cw, hcwFilter,
      hcq_ne_o.symm, hcw_ne_o.symm, hcqcw⟩
  omega

/-- Under first-apex deletion survival, the two blockers coincide exactly
when both source points occur in the other source's selected shell. -/
theorem blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1)
    (hwSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1) :
    H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A ↔
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support := by
  constructor
  · intro hcenters
    constructor
    · by_contra hwOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.w_mem_A P.q_mem_A hwOutside) hcenters.symm
    · by_contra hqOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.q_mem_A P.w_mem_A hqOutside) hcenters
  · rintro ⟨hwq, hqw⟩
    exact
      blocker_centers_eq_of_first_apex_deletion_survives_of_mutual_cross_membership
        P hqSurvivesO hwSurvivesO hwq hqw

/-- On the robust first-apex arm itself, coincident blockers are exactly
reciprocal source-row membership.  The twice-erased K4 witness supplies both
single-deletion survivals needed by the preceding theorem. -/
theorem blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.q).erase P.w) S.oppApex1) :
    H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A ↔
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
        P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) := by
  have hqSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
    apply equidistant_mono (T := D.A.erase P.q) _ hdouble
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.w).erase P.q) S.oppApex1 := by
    simpa [Finset.erase_right_comm] using hdouble
  have hwSurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1 := by
    apply equidistant_mono (T := D.A.erase P.w) _ hdoubleSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  exact
    blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_deletion_survives
      P hqSurvivesO hwSurvivesO

/-- If the first-apex radius class has at least five points, mutual cross
membership forces the two chosen source blockers to coincide. -/
theorem blocker_centers_eq_of_five_le_of_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
    (hwq :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqw :
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A := by
  apply
    blocker_centers_eq_of_first_apex_deletion_survives_of_mutual_cross_membership
      P
  · refine ⟨r, hr, ?_⟩
    simpa [SelectedClass] using
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := P.q) (s := S.oppApex1) (d := r) (n := 4) hfive
  · refine ⟨r, hr, ?_⟩
    simpa [SelectedClass] using
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := P.w) (s := S.oppApex1) (d := r) (n := 4) hfive
  · exact hwq
  · exact hqw

/-- A first-apex radius class of size at least five makes blocker equality
equivalent to reciprocal membership in the two selected shells. -/
theorem blocker_centers_eq_iff_mutual_cross_membership_of_five_le
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card) :
    H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A ↔
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support := by
  constructor
  · intro hcenters
    constructor
    · by_contra hwOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.w_mem_A P.q_mem_A hwOutside) hcenters.symm
    · by_contra hqOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.q_mem_A P.w_mem_A hqOutside) hcenters
  · rintro ⟨hwq, hqw⟩
    exact blocker_centers_eq_of_five_le_of_mutual_cross_membership
      P hr hfive hwq hqw

/-- In the exact card-five first-apex branch, either cross deletion survives
or the selected shell contains `w` and forces the two sources onto opposite
strict sides.  Center separation is derived from the card-five hypothesis. -/
theorem card_five_cross_deletion_survives_or_cross_oppositeSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ∨
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
        signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
          signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) < 0) := by
  rcases cross_deletion_survives_or_cross_membership P with
    hsurvives | hwShell
  · exact Or.inl hsurvives
  · exact Or.inr ⟨hwShell,
      signedArea_product_neg_of_cross_membership P hwShell
        (blocker_ne_oppApex1_of_card_five P hr hcard)⟩

/-- A three-point off-surplus first-apex marginal yields the complete paired
frontier, with the pair chosen so both deletions preserve K4 at the second
apex. -/
theorem exists_criticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A)
    (hthree :
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card) :
    Nonempty (CriticalPairFrontier D S r H) := by
  rcases exists_pair_double_deletion_survives_secondApex D S r hthree with
    ⟨q, w, hqT, hwT, hqw, hdouble⟩
  have hqA : q ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqT).1).1
  have hwA : w ∈ D.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwT).1).1
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
    apply equidistant_mono (T := D.A.erase q) _ hdouble
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase w).erase q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using hdouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 := by
    apply equidistant_mono (T := D.A.erase w) _ hdoubleSym
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
      (D.K4 S.oppApex1 (oppApex1_mem_A S))
      hqSelected hwSelected hqw
  exact ⟨⟨P, hfirst, hdouble, Or.inl hdouble⟩⟩

/-- Global K4 and the surplus-cap one-hit theorem choose a positive radius,
retain that its full first-apex selected class has cardinality at least four,
and supply the parent-facing critical-pair frontier. -/
theorem exists_criticalPairFrontier_of_K4
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) :
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
      Nonempty (CriticalPairFrontier D S r H) := by
  classical
  have happ1 : S.oppApex1 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  rcases D.K4 S.oppApex1 happ1 with ⟨r, hr, hfour⟩
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
    simpa [DS, F] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hthree : 3 ≤ (F \ S.surplusCap).card := by
    omega
  exact ⟨r, hr, hfour,
    exists_criticalPairFrontier D S r H (by simpa [F] using hthree)⟩

end ATailCriticalPairFrontier
end Problem97
