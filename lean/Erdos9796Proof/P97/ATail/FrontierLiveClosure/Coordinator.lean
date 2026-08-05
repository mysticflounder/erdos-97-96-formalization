/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceAlignedLowHits

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Exact-four, two-radius collision branch of the low-hit tri-apex
contradiction.

The equal-blocker strict-interior pair has already produced a fresh point in
the same cap, a common deletion at the first apex and collision blocker, and a
chosen collision source whose deletion also survives at the first apex and
fresh point's blocker.  The two source shells omit one another and their actual
blockers are distinct.  Moreover the collision shell's retained first-apex
strict-cap slice is exactly the two collision sources, so this branch saturates
rather than contradicts the live low-hit bound.

The retained frontier class is now exactly a K4, and its strict first-cap part
has cardinality exactly two, hence consists of the two collision sources.  The
first physical apex also has a distinct positive radius carrying at least four
points.  The checked proof prefix below selects two distinct strict-cap points
on that radius.  Each point is outside the collision shell, has blocker
different from the collision blocker, and seeds its own localized
mutual-omission cycle.  It then records the exhaustive residual incidence
split: one directed cross omission, the reverse directed cross omission, or
equal blockers for the two second-radius points.  The remaining work is to
close those incidence alternatives using the other apex data or a compatible
classification theorem.

Narrowing measure: compared with the former exact-two collision leaf, this leaf
adds `hfrontierFour`, `hfrontierInteriorTwo`, `hρpos`, `hρne`, and `hρfour`.
The checked coordinators below send every branch with at least three strict
first-cap frontier members to the existing directed-omission leaf.  The
second-radius prefix further replaces the previously unattached K4 witness by
two source-exact omission packets and the three-way cross-incidence
alternative, without adding a new proof obligation.  This checked coordinator
therefore exposes the same two-declaration exact-two collision frontier and
introduces no additional `sorry`. -/
theorem false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support := by
    intro x hx
    exact ⟨centerAt_ne_source H x hx,
      isUniqueFourCenter_centerAt H x hx,
      uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hρtwo :
      2 ≤
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex1 hρpos
          (by simpa only [hcenter] using hρfour)
  have hρone :
      1 <
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    omega
  rcases Finset.one_lt_card.mp hρone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_inter.mp hu with ⟨huρ, huInterior⟩
  rcases Finset.mem_inter.mp hv with ⟨hvρ, hvInterior⟩
  have huA : u ∈ D.A := (mem_selectedClass.mp huρ).1
  have hvA : v ∈ D.A := (mem_selectedClass.mp hvρ).1
  have huNeSource₁ : u ≠ P.source₁ := by
    intro huSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [huSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have huNeSource₂ : u ≠ P.source₂ := by
    intro huSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 u := (mem_selectedClass.mp huρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [huSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hvNeSource₁ : v ≠ P.source₁ := by
    intro hvSource₁
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [hvSource₁]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hvNeSource₂ : v ≠ P.source₂ := by
    intro hvSource₂
    apply hρne
    calc
      ρ = dist S.oppApex1 v := (mem_selectedClass.mp hvρ).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [hvSource₂]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {u, v} := by
    apply Finset.disjoint_left.mpr
    intro z hzCollision hzSecond
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzCollision hzSecond
    rcases hzCollision with rfl | rfl
    · rcases hzSecond with hsource₁u | hsource₁v
      · exact huNeSource₁ hsource₁u.symm
      · exact hvNeSource₁ hsource₁v.symm
    · rcases hzSecond with hsource₂u | hsource₂v
      · exact huNeSource₂ hsource₂u.symm
      · exact hvNeSource₂ hsource₂v.symm
  have huBlockerNe :
      H.centerAt u huA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne huA hu
  have hvBlockerNe :
      H.centerAt v hvA ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne hvA hv
  rcases exists_secondRadiusInterior_localizedCycle P hρne hu with
    ⟨Cu, hCuFresh, ⟨Mu⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle P hρne hv with
    ⟨Cv, hCvFresh, ⟨Mv⟩⟩
  have hsecondRadiusIncidence :
      v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
        u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∨
          H.centerAt u huA = H.centerAt v hvA := by
    by_cases hvu :
        v ∈ (H.selectedAt u huA).toCriticalFourShell.support
    · by_cases huv' :
          u ∈ (H.selectedAt v hvA).toCriticalFourShell.support
      · exact Or.inr <| Or.inr <|
          blocker_centers_eq_of_secondRadius_mutual_cross_membership
            R huA hvA huv huρ hvρ hvu huv'
      · exact Or.inr (Or.inl huv')
    · exact Or.inl hvu
  have hsecondRadiusEqualBlockerGeometry :
      H.centerAt u huA = H.centerAt v hvA →
        H.centerAt u huA ≠
            H.centerAt P.source₁ P.source₁_mem_A ∧
          H.centerAt u huA ∈
              S.capInteriorByIndex S.oppIndex1 ∧
            (H.selectedAt u huA).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex1 =
              {u, v} := by
    intro hblockers
    have huIndexed :
        u ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hu
    have hvIndexed :
        v ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using hv
    have hgeometry :=
      equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
        huA hvA huIndexed hvIndexed huv hblockers
        (by simpa only [← hcenter] using T.oppApex1_rich)
        (hcriticalShellUniqueFourCover u huA).2.1
    exact ⟨huBlockerNe, hgeometry⟩
  have hsecondRadiusEqualBlockerRectangle :
      H.centerAt u huA = H.centerAt v hvA →
        u ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          v ∉
              (H.selectedAt P.source₁
                P.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₁ ∉
                (H.selectedAt u huA).toCriticalFourShell.support ∧
              P.source₂ ∉
                  (H.selectedAt u huA).toCriticalFourShell.support ∧
                ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 ∧
                  ((H.selectedAt u huA).toCriticalFourShell.support \
                    S.capByIndex S.oppIndex1).card = 2 := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, _, hsecondCap⟩
    exact
      exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_card
        (H.selectedAt u huA).toCriticalFourShell.support_card
        P.shell_inter_cap_eq_sources hsecondCap
        P.sources_ne huv hpairsDisjoint
  have hcollisionBlockerNeSource₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hcollisionBlockerNeSource₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hsecondRadiusEqualBlockerLargeCapOrCrossCoincidence :
      H.centerAt u huA = H.centerAt v hvA →
        8 ≤ (S.capByIndex S.oppIndex1).card ∨
          H.centerAt P.source₁ P.source₁_mem_A = u ∨
            H.centerAt P.source₁ P.source₁_mem_A = v ∨
              H.centerAt u huA = P.source₁ ∨
                H.centerAt u huA = P.source₂ := by
    intro hblockers
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨hsecondBlockerNeCollision, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ u v
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt u huA)
          P.sources_ne huv hpairsDisjoint
          hsecondBlockerNeCollision.symm
          hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
          hsecondBlockerNeU hsecondBlockerNeV
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  have hsecondRadiusEqualBlockerCapSixCycle :
      H.centerAt u huA = H.centerAt v hvA →
        (S.capByIndex S.oppIndex1).card = 6 →
          (H.centerAt P.source₁ P.source₁_mem_A = u ∨
              H.centerAt P.source₁ P.source₁_mem_A = v) ∧
            (H.centerAt u huA = P.source₁ ∨
              H.centerAt u huA = P.source₂) := by
    intro hblockers hcapSix
    rcases hsecondRadiusEqualBlockerGeometry hblockers with
      ⟨_, huBlockerInterior, _⟩
    have hsecondBlockerNeU : H.centerAt u huA ≠ u :=
      (hcriticalShellUniqueFourCover u huA).1
    have hsecondBlockerNeV : H.centerAt u huA ≠ v := by
      intro h
      apply (hcriticalShellUniqueFourCover v hvA).1
      exact hblockers.symm.trans h
    have hInteriorCard :
        (S.capInteriorByIndex S.oppIndex1).card = 4 := by
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    exact
      four_interior_forces_both_cross_blocker_coincidences
        (S.capInteriorByIndex S.oppIndex1)
        P.source₁ P.source₂ u v
        (H.centerAt P.source₁ P.source₁_mem_A)
        (H.centerAt u huA)
        P.sources_ne huv hpairsDisjoint
        hcollisionBlockerNeSource₁ hcollisionBlockerNeSource₂
        hsecondBlockerNeU hsecondBlockerNeV
        P.source₁_mem_capInterior P.source₂_mem_capInterior
        huInterior hvInterior P.blocker_mem_capInterior huBlockerInterior
        hInteriorCard
  obtain ⟨Fρ, ⟨Rρ⟩⟩ :=
    exists_distinctRadius_commonDeletionParent
      F R (by omega) hρne hρfour
  let Bρ : FrontierBiApexRobustResidual Rρ :=
    { secondApex_robust := B.secondApex_robust }
  let Lρ : FrontierLargeOppositeCapsBiApexRobustResidual Bρ :=
    { firstOppCap_card_ge_six := L.firstOppCap_card_ge_six
      secondOppCap_card_ge_six := L.secondOppCap_card_ge_six }
  let Nρ : FrontierAllLargeCapsBiApexRobustResidual Lρ :=
    { surplusCap_card_ge_six := N.surplusCap_card_ge_six }
  let Tρ : FrontierAllLargeCapsTriApexRobustResidual Nρ :=
    { oppApex1_rich := T.oppApex1_rich
      oppApex2_rich := T.oppApex2_rich
      surplusApex_rich := T.surplusApex_rich
      notRobustCover_card := T.notRobustCover_card
      no_center_covers_all_apices := T.no_center_covers_all_apices }
  have hfalseOfOmission
      (Qρ : RetainedInteriorDirectedOmission Rρ) :
      False :=
    false_of_retainedInteriorDirectedOmission_and_all_low_hits
      Fρ Rρ Qρ Bρ Lρ Nρ Tρ
  by_cases hblockers :
      H.centerAt u huA = H.centerAt v hvA
  · let Pρ : RetainedInteriorBlockerCollision Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_eq := hblockers }
    by_cases hρfive :
        5 ≤ (SelectedClass D.A S.oppApex1 ρ).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          Rρ Pρ hρfive with
        ⟨Qρ⟩
      exact hfalseOfOmission Qρ
    · have hρexactFour :
          (SelectedClass D.A S.oppApex1 ρ).card = 4 := by
        omega
      by_cases hρthree :
          3 ≤
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card
      · rcases
          nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
            Rρ Pρ hρthree with
          ⟨Qρ⟩
        exact hfalseOfOmission Qρ
      · have hρInteriorTwo :
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1).card = 2 := by
          omega
        exact
          TwoSourceExactCollisionRowsTerminal.false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
            F R P Fρ Rρ Pρ hρne hfrontierFour hρexactFour
              hfrontierInteriorTwo hρInteriorTwo B L N T
  · have homission :
        v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∨
          u ∉ (H.selectedAt v hvA).toCriticalFourShell.support := by
      rcases hsecondRadiusIncidence with hvNot | huNot | heq
      · exact Or.inl hvNot
      · exact Or.inr huNot
      · exact (hblockers heq).elim
    have hdirected :
        (v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase v)
              (H.centerAt u huA)) ∨
          (u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase u)
              (H.centerAt v hvA)) := by
      rcases homission with hvNot | huNot
      · exact Or.inl
          ⟨hvNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H huA).mpr hvNot⟩
      · exact Or.inr
          ⟨huNot,
            (cross_deletion_survives_iff_not_mem_selected_support
              H hvA).mpr huNot⟩
    let Qρ : RetainedInteriorDirectedOmission Rρ :=
      { source₁ := u
        source₂ := v
        source₁_mem_A := huA
        source₂_mem_A := hvA
        sources_ne := huv
        source₁_mem_radius := huρ
        source₂_mem_radius := hvρ
        source₁_mem_capInterior := huInterior
        source₂_mem_capInterior := hvInterior
        blockers_ne := hblockers
        directed_omission := hdirected }
    exact hfalseOfOmission Qρ

/-- Checked strict-interior cardinality split for the exact-four, two-radius
collision branch.

Before this split, the coordinator-interface frontier was one exact-four,
two-radius collision leaf.  There are now two immediate constructors: at least
three strict first-cap members give a retained directed omission, while the
collision sources give a lower bound of two, so the remaining branch has
strict-cap cardinality exactly two.  The split is exhaustive and acyclic. -/
theorem false_of_exactFourCollision_secondRadius_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  by_cases hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
        R P hthree with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T
  · have hpairSub :
        ({P.source₁, P.source₂} : Finset ℝ²) ⊆
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
      · exact Finset.mem_inter.mpr
          ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
    have htwo :
        2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
      have hcard := Finset.card_le_card hpairSub
      have hpairCard :
          ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
        simp [P.sources_ne]
      omega
    have hfrontierInteriorTwo :
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card = 2 := by
      omega
    exact
      false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits
        F R P hfrontierFour ρ hρpos hρne hρfour
          hfrontierInteriorTwo B L N T

/-- Checked exact-two collision coordinator for the low-hit tri-apex
contradiction.

Before this split, the coordinator-interface frontier was one broad
source-exact collision leaf, with no constructor fan-out.  The checked
first-apex radius dichotomy, together with the retained K4 lower bound, now has
two terminal interfaces: a directed omission whenever the frontier class has
cardinality at least five, and the sole residual collision leaf where that
class has cardinality exactly four and a distinct positive K4 radius is
present.  The common deletion, mutual-omission cycle, and exact retained slice
are reconstructible from `P` and are therefore not forwarded through this
coordinator.  Both children retain the original collision data through `P`,
and the split is exhaustive and acyclic. -/
theorem false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  rcases firstApex_largeClass_or_secondRadius R with
    hsix | ⟨ρ, hρpos, hρne, hρfour⟩
  · rcases
      nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
        R P (by omega) with ⟨Q⟩
    exact
      false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R Q B L N T
  · by_cases hfive :
        5 ≤ (SelectedClass D.A S.oppApex1 radius).card
    · rcases
        nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
          R P hfive with ⟨Q⟩
      exact
        false_of_retainedInteriorDirectedOmission_and_all_low_hits
          F R Q B L N T
    · have hfrontierFour :
          (SelectedClass D.A S.oppApex1 radius).card = 4 := by
        have hge :
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card :=
          R.frontierRadius_class_card_ge_four
        omega
      exact
        false_of_exactFourCollision_secondRadius_and_all_low_hits
          F R P hfrontierFour ρ hρpos hρne hρfour
            B L N T

/-- Checked equal-blocker coordinator for the low-hit tri-apex contradiction.

The checked strict-interior selector supplies two distinct sources on the
retained first-apex radius inside its strict opposite cap.  This branch records
that their actual canonical blockers agree.  The retained collision packet
already determines the fresh common deletion, source-exact mutual-omission
cycle, and exact retained slice if a downstream proof needs them, so the
coordinator passes only that packet to the load-bearing leaf above. -/
theorem false_of_retainedInteriorBlockerCollision_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  exact
    false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits
      F R P B L N T

/-- Exact low-hit contradiction coordinator.

The previous coordinator-interface frontier was one undifferentiated
anti-matching obligation.  The checked strict-interior selector now narrows it
to two immediate constructors: equal canonical blockers and distinct blockers
with a directed omission.  Each child retains all original data and gains the
corresponding concrete pair packet; the split is exhaustive and acyclic. -/
theorem false_of_frontierAllLargeCapsTriApex_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  rcases nonempty_retainedInteriorPairOutcome R with ⟨outcome⟩
  cases outcome with
  | collision data =>
      exact false_of_retainedInteriorBlockerCollision_and_all_low_hits
        F R data B L N T
  | omission data =>
      exact false_of_retainedInteriorDirectedOmission_and_all_low_hits
        F R data B L N T

/-- The planar/MEC concentration leaf at the tri-apex all-large-caps terminal.

It receives the source-faithful exact-four cover carried by `H`; the tri-apex
packet `T` already carries the three apex-rich structures, so separately
derived strict-opposite-cap pattern witnesses are not part of this interface.
Its conclusion is one explicit collision: a named canonical blocker shell
shares at least three points with one rich apex-radius class inside that
apex's strict opposite cap.  The rich structure is returned with the witness
so the checked consumer below does not need to recover which of the three
packet roles the index names.

This is deliberately not a cover-counting obligation.  Cover cardinalities,
pairwise two-circle bounds, and the three rich patterns admit incidence models
with every such intersection of size at most two.  A proof here must therefore
use genuinely planar MEC/cap/frontier geometry to produce the collision.

Frontier accounting: this theorem is now a checked compatibility consumer of
the low-hit contradiction coordinator above.  Its impossible concentration
witness follows by ex falso; the load-bearing frontier is the coordinator's two
source-faithful strict-interior branches. -/
theorem exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
  exact False.elim
    (false_of_frontierAllLargeCapsTriApex_all_low_hits
      F R B L N T)

/-- The uniform tri-apex metric terminal is a checked consumer of the planar
concentration leaf: distinct circles have at most two common points, while the
leaf supplies at least three. -/
theorem false_of_frontierAllLargeCapsTriApexUniformMetricResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex
      F R B L N T
  have htwo :=
    criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  omega

/-- The tri-apex all-large-caps terminal.  The packet's apex-rich fields are
already sufficient for the uniform all-cardinality leaf above; no separate
strict-cap pattern witnesses need to be constructed or forwarded. -/
theorem false_of_frontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  exact false_of_frontierAllLargeCapsTriApexUniformMetricResidual F R B L N T

/-- The all-large-caps terminal reduces to its tri-apex strengthening.

Every cap is large here, so the first opposite cap can take the surplus role.
The rotated packet puts the original surplus apex in the second opposite role,
and the fresh frontier built on it splits into the protected unique-radius arm
and a fresh common-deletion parent.  That parent is either robust at its second
opposite apex — which is the original surplus apex, giving the third robustness
statement — or prescribed-critical there, which the existing consumer refutes. -/
theorem false_of_frontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplusAtAllLarge L
  have hTapex1 : T.oppApex1 = S.oppApex2 := by
    simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    -- The rotation reports the dichotomy at the original second opposite apex.
    have hrich2 : ApexRichClassStructure D.A S.oppApex2 := by
      have h := apexRichClassStructure_oppApex1 freshParent
      rwa [hTapex1] at h
    -- Rotate the other way to put the surplus apex in the *first* opposite
    -- role, the role the dichotomy is stated for.  Rich structure subsumes
    -- robustness, so the robust-or-critical split is no longer needed here.
    have hsecondGtFour : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    let T' : SurplusCapPacket D.A :=
      redesignateSecondOppCapAsSurplusOf S hsecondGtFour
    have hT'apex1 : T'.oppApex1 = S.surplusApex :=
      redesignateSecondOppCapAsSurplusOf_oppApex1 S hsecondGtFour
    obtain ⟨freshRadius', _hfreshRadius', hfreshFour', ⟨freshFrontier'⟩⟩ :=
      exists_criticalPairFrontier_of_K4 D T' H
    apply CriticalPairFrontier.false_of_parentResidualConsumers
      freshFrontier' R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour'
    · exact false_of_originalFrontierUniqueRadiusArm freshFrontier'
        R.minimal R.noM44 R.carrier_card_gt_nine
    · intro freshParent'
      have hrich1 : ApexRichClassStructure D.A S.oppApex1 :=
        apexRichClassStructure_oppApex1 R
      have hrich3 : ApexRichClassStructure D.A S.surplusApex := by
        have h := apexRichClassStructure_oppApex1 freshParent'
        rwa [hT'apex1] at h
      have hcover := uniqueFourCover_of_triApexRobust R.minimal S
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich1)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich2)
        (fullyDeletionRobustAt_of_apexRichClassStructure hrich3)
      exact false_of_frontierAllLargeCapsTriApexRobustResidual F R B L N
        { oppApex1_rich := hrich1
          oppApex2_rich := hrich2
          surplusApex_rich := hrich3
          notRobustCover_card := hcover.1
          no_center_covers_all_apices := hcover.2.2 }

/-- The cap-six continuation of the bi-apex robust parent. Its terminal must
consume the complete large-cap surface, not a locally manufactured witness.
The five-point-cap profiles are discharged by redesignating the second opposite
cap as surplus, leaving the all-large-caps residual. -/
theorem false_of_frontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False :=
  false_of_frontierAllLargeCapsBiApexRobustResidual F R B L
    ⟨surplusCap_card_ge_six_of_largeOppositeCaps L⟩

/-- The source-faithful common-deletion arm after both physical opposite
apices are deletion-robust. It retains the complete parent residual and
dispatches its checked cap-bound split to the two terminal surfaces. -/
theorem false_of_frontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False := by
  rcases biApexRobust_exactFiveSecond_or_largeOppositeCaps B with hfive | hlarge
  · exact false_of_frontierBiApexRobustExactFiveSecondCapResidual F R B hfive.some
  · exact false_of_frontierLargeOppositeCapsBiApexRobustResidual F R B hlarge.some

/-- The exact physical split of a common-deletion parent.  This is strictly
stronger routing than the former coupled strict-interior normal form: it
exposes the robust and prescribed-critical geometric endpoints directly. -/
theorem false_of_frontierCommonDeletionPhysicalSecondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F) :
    False := by
  rcases frontierCommonDeletionParent_biApexRobust_or_critical R with
    hrobust | hcritical
  · exact false_of_frontierBiApexRobustResidual F R hrobust.some
  · exact false_of_physicalSecondApexCriticalResidual F R hcritical.some

/-- Assemble the two genuine frontier arms. -/
theorem false_of_criticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour
  · exact false_of_originalFrontierUniqueRadiusArm F hmin hNoM44 hcard
  · intro R
    exact false_of_frontierCommonDeletionPhysicalSecondApex F R

/-- Parent-facing large-opposite-cap contradiction.  The extraction is
uniform from the live `CriticalShellSystem`; slot-labelled LIVE data is not an
input to this boundary. -/
theorem false_of_twoLargeCaps_commonCriticalMap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (H : CriticalShellSystem D.A) :
    False := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨radius, _hradius, hfour, hfrontier⟩
  exact false_of_criticalPairFrontier hfrontier.some hmin hNoM44 hcard hfour


end ATailFrontierLiveClosure
end Problem97
