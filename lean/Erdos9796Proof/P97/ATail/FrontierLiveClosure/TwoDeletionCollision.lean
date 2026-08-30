/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SharedFrontierHelpers

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

/-/ A strict second-cap source with the retained deletion-survival witness
    supplies the complete ingress record needed by the rigid `2+2+1`
    consumer.  This is deliberately a producer theorem: it packages the
    source-clean five-point and omitted-peer arguments, but it does not claim
    the downstream coordinator is sorry-free. -/
theorem exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (source : CarrierVertex D.A)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    ∃ other u v : CarrierVertex D.A,
      ∃ jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v,
        u ≠ v ∧
        u.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        v.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∧
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∧
        ExactFourMutualOmissionSourceContext R rho source other u v := by
  classical
  have hlateCross :=
    actualLateRow_secondClassInterior_card_le_two
      R surface source hsourceClass hsourceInterior
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior, hotherOmitted,
      hblockersNe⟩
  rcases
      exists_mutuallyOmittedSecondClassPair
        R surface source hfive hsourceClass with
    ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted,
      hsourceMemURow, hvOmittedSourceRow, huEqSourceOrOmitted⟩
  have hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  obtain ⟨jointDeletion⟩ :=
    nonempty_exactFourMutualOmissionJointDeletion
      R surface rho hfive u v hblockersUVNe
  let context : ExactFourMutualOmissionSourceContext R rho source other u v := {
    source_mem_class := hsourceClass
    source_mem_interior := hsourceInterior
    source_mem_outside := hsourceOutside
    source_cross_card_le_two := hlateCross
    other_ne_source := hotherNe
    other_mem_class := hotherClass
    other_mem_interior := hotherInterior
    other_not_mem_source_row := hotherOmitted
    source_other_blockers_ne := hblockersNe
    source_survives_q_or_w := hsurvives
    source_mem_u_row := hsourceMemURow
    v_not_mem_source_row := hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := huEqSourceOrOmitted
  }
  exact
    ⟨other, u, v, jointDeletion, huNeV, huClass, hvClass,
      hvOmitted, huOmitted, context⟩

/-- **Load-bearing B1 producer.**  The local blocker-collision normal form is
already source-clean.  `b1ContinuationCase_of_counterexample` now also
produces the strict-cap escape, an omitted original deletion, its source-exact
common-deletion packet, and the exhaustive nine-way continuation.

The remaining global step must consume those continuation cases.  Until that
consumer is proved, this positive terminal remains the single live B1 leaf
used immediately below. -/
theorem b1_globalGapOrClosedTerminal_of_counterexample
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1GlobalGapOrClosedTerminal C := by
  sorry

/-- Two distinct deleted sources cannot lie in one another's actual rows when
their actual blockers are distinct from each other and from the physical apex. -/
theorem false_of_exactFour_twoDeletion_blockerTwoCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let q := first.deleted.1
  let r := second.deleted.1
  let bq := Hlate.centerAt first.deleted.1 first.deleted.2
  let br := Hlate.centerAt second.deleted.1 second.deleted.2
  let a := S.oppApex2
  have hqNeR : q ≠ r := by
    intro hqr
    exact hdeletedNe (Subtype.ext hqr)
  have haA : a ∈ D.A := by
    simpa [a] using first.uPacket.center₂_mem_A
  have hbqA : bq ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  have hbrA : br ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.center_mem).2
  have haEq : dist a q = dist a r := by
    exact (mem_selectedClass.mp first.deleted_mem_class).2.trans
      ((mem_selectedClass.mp second.deleted_mem_class).2).symm
  have hqOwn :
      q ∈ (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
  have hrOwn :
      r ∈ (Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.q_mem_support
  have hbqEq : dist bq q = dist bq r := by
    exact
      ((Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
          q hqOwn).trans
      (((Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
          r hsecondMemFirstRow).symm)
  have hbrEq : dist br q = dist br r := by
    exact
      ((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          q hfirstMemSecondRow).trans
      (((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          r hrOwn).symm)
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    first.deleted.2 second.deleted.2 hqNeR
  have haFilter :
      a ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hbqFilter :
      bq ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨hbqA, hbqEq⟩
  have hbrFilter :
      br ∈ D.A.filter (fun z => dist z q = dist z r) :=
    Finset.mem_filter.mpr ⟨hbrA, hbrEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z q = dist z r)).card := by
    rw [Finset.two_lt_card]
    exact ⟨a, haFilter, bq, hbqFilter, br, hbrFilter,
      (by simpa [a, bq] using hfirstBlockerNeApex.symm),
      (by simpa [a, br] using hsecondBlockerNeApex.symm),
      (by simpa [bq, br, Hlate] using hdeletedBlockersNe)⟩
  have hthree' :
      2 < (D.A.filter (fun z =>
        dist z first.deleted.1 = dist z second.deleted.1)).card := by
    simpa [q, r] using hthree
  exact (not_lt_of_ge hbound) hthree'

/-- Exhaustive residual after removing the impossible blocker two-cycle. -/
theorem exactFour_twoDeletion_crossOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2) :
    first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∨
      second.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
  classical
  by_cases hfirstMem :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support
  · right
    intro hsecondMem
    exact false_of_exactFour_twoDeletion_blockerTwoCycle
      first second hdeletedNe hdeletedBlockersNe
      hfirstBlockerNeApex hsecondBlockerNeApex hfirstMem hsecondMem
  · exact Or.inl hfirstMem

/-- Five pairwise distinct members cannot lie in a four-point support.  This
is the finite cardinality engine used to expose the honest residual of the
four-center common-deletion packet. -/
private theorem four_mem_card_four_split
    {α : Type*} [DecidableEq α]
    {K : Finset α} {q a b c d : α}
    (hKcard : K.card = 4)
    (hq : q ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    q = a ∨ q = b ∨ q = c ∨ q = d ∨
      a ∉ K ∨ b ∉ K ∨ c ∉ K ∨ d ∉ K := by
  by_cases hqa : q = a
  · exact Or.inl hqa
  by_cases hqb : q = b
  · exact Or.inr (Or.inl hqb)
  by_cases hqc : q = c
  · exact Or.inr (Or.inr (Or.inl hqc))
  by_cases hqd : q = d
  · exact Or.inr (Or.inr (Or.inr (Or.inl hqd)))
  by_cases ha : a ∈ K
  · by_cases hb : b ∈ K
    · by_cases hc : c ∈ K
      · by_cases hd : d ∈ K
        · exfalso
          have hsub : ({q, a, b, c, d} : Finset α) ⊆ K := by
            simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
              using And.intro hq
                (And.intro ha (And.intro hb (And.intro hc hd)))
          have hcardFive : ({q, a, b, c, d} : Finset α).card = 5 := by
            simp [hqa, hqb, hqc, hqd, hab, hac, had, hbc, hbd, hcd]
          have hle := Finset.card_le_card hsub
          omega
        · exact Or.inr (Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inr (Or.inr hd))))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr
          (Or.inr (Or.inr (Or.inl hc))))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (Or.inr (Or.inl hb)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ha))))

/-- Unless the common deleted source is itself one of the three actual
blockers, one of the four surviving centers forms a bidirectional
singleton-deletion survival square with that source's actual blocker. -/
theorem exactFour_fourSurvivingCenters_survivalSquare_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    let q := first.deleted.1
    let a := S.oppApex2
    let bu := (lateFirstApexSystem R).centerAt u.1 u.2
    let bv := (lateFirstApexSystem R).centerAt v.1 v.2
    let br :=
      (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2
    let bq :=
      (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2
    q = bu ∨ q = bv ∨ q = br ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) a ∧
        HasNEquidistantPointsAt 4 (D.A.erase a) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bu ∧
        HasNEquidistantPointsAt 4 (D.A.erase bu) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bv ∧
        HasNEquidistantPointsAt 4 (D.A.erase bv) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) br ∧
        HasNEquidistantPointsAt 4 (D.A.erase br) bq) := by
  dsimp only
  let K :=
    ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell
  have hqNeA : first.deleted.1 ≠ S.oppApex2 := by
    intro hqa
    have hdist :
        dist S.oppApex2 first.deleted.1 = rho :=
      (mem_selectedClass.mp first.deleted_mem_class).2
    rw [hqa, dist_self] at hdist
    linarith
  have hsplit :=
    four_mem_card_four_split
      (K := K.support)
      (q := first.deleted.1)
      (a := S.oppApex2)
      (b := (lateFirstApexSystem R).centerAt u.1 u.2)
      (c := (lateFirstApexSystem R).centerAt v.1 v.2)
      (d := (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2)
      K.support_card
      K.q_mem_support
      first.uPacket.centers_ne.symm
      first.vPacket.centers_ne.symm
      hsecondBlockerNeApex.symm
      first.blockers_ne
      hsecondBlockerNeU.symm
      hsecondBlockerNeV.symm
  rcases hsplit with hqa | hqbu | hqbv | hqbr | ha | hbu | hbv | hbr
  · exact False.elim (hqNeA hqa)
  · exact Or.inl hqbu
  · exact Or.inr (Or.inl hqbv)
  · exact Or.inr (Or.inr (Or.inl hqbr))
  · exact Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₂,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr ha⟩)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbu⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.vPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbv⟩)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
      ⟨crossPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbr⟩)))))

/-- A set of cardinality at most two that already contains two distinct
points cannot contain a third point distinct from both. -/
theorem third_not_mem_of_card_le_two
    {α : Type*} {T : Finset α} {x y z : α}
    (hT : T.card ≤ 2) (hx : x ∈ T) (hy : y ∈ T)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    z ∉ T := by
  classical
  intro hz
  have hcardErase : (T.erase x).card ≤ 1 := by
    rw [Finset.card_erase_of_mem hx]
    omega
  have hyErase : y ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxy, hy⟩
  have hzErase : z ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxz, hz⟩
  exact
    hyz ((Finset.card_le_one.mp hcardErase) y hyErase z hzErase)

/-- The common deleted source mutually omits at least one member of the
original mutually omitted pair.  Its own actual row already contains the
deleted source, while every actual row meets the physical second-apex class
in at most two points. -/
theorem exactFour_jointDeleted_mutualOmission_with_one_original
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {rho : ℝ} {u v : CarrierVertex D.A}
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (J : ExactFourMutualOmissionJointDeletion R rho u v) :
    (u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.support ∧
        J.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support) ∨
      (v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.support ∧
        J.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let K :=
    ((lateFirstApexSystem R).selectedAt
      J.deleted.1 J.deleted.2).toCriticalFourShell.support
  have hKTwo : (K ∩ C).card ≤ 2 := by
    simpa [K, C] using
      actualLateRow_secondClass_card_le_two R surface J.deleted
  have hqI : J.deleted.1 ∈ K ∩ C := by
    exact Finset.mem_inter.mpr
      ⟨by
        simpa [K] using
          ((lateFirstApexSystem R).selectedAt
            J.deleted.1 J.deleted.2).toCriticalFourShell.q_mem_support,
        by simpa [C] using J.deleted_mem_class⟩
  have hqNeU : J.deleted.1 ≠ u.1 := by
    intro h
    exact J.deleted_ne_u (Subtype.ext h)
  have hqNeV : J.deleted.1 ≠ v.1 := by
    intro h
    exact J.deleted_ne_v (Subtype.ext h)
  have huNeVVal : u.1 ≠ v.1 := by
    intro h
    exact huNeV (Subtype.ext h)
  by_cases huK : u.1 ∈ K
  · have huI : u.1 ∈ K ∩ C :=
      Finset.mem_inter.mpr ⟨huK, by simpa [C] using huClass⟩
    have hvNotI : v.1 ∉ K ∩ C :=
      third_not_mem_of_card_le_two
        hKTwo hqI huI hqNeU hqNeV huNeVVal
    exact Or.inr
      ⟨fun hvK =>
        hvNotI (Finset.mem_inter.mpr
          ⟨hvK, by simpa [C] using hvClass⟩),
        J.deleted_not_mem_vRow⟩
  · exact Or.inl ⟨huK, J.deleted_not_mem_uRow⟩

/-- Any exact row obtained after deleting `q` at the actual blocker of
`source` is the canonical critical support of `source`.  If it omitted the
source, it would instead witness a forbidden source-free K4 at that blocker. -/
theorem qDeletedRow_at_actualBlocker_eq_canonicalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q source : ℝ²} (hsource : source ∈ D.A)
    {B : Finset ℝ²}
    (row : U5QDeletedK4Class D q (H.centerAt source hsource) B)
    (hBcard : B.card = 4) :
    B =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt source hsource).toCriticalFourShell
  have hsourceB : source ∈ B := by
    by_contra hsourceNot
    apply H.no_qfree_at source hsource
    refine ⟨row.radius, row.radius_pos, ?_⟩
    have hsub :
        B ⊆
          (D.A.erase source).filter
            (fun y => dist (H.centerAt source hsource) y = row.radius) := by
      intro y hy
      have hyErased :
          y ∈
            (D.skeleton q).erase (H.centerAt source hsource) :=
        row.subset hy
      have hySkeleton : y ∈ D.skeleton q :=
        (Finset.mem_erase.mp hyErased).2
      have hyA : y ∈ D.A :=
        (Finset.mem_erase.mp hySkeleton).2
      have hyNeSource : y ≠ source := by
        intro hys
        exact hsourceNot (hys ▸ hy)
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr ⟨hyNeSource, hyA⟩,
          row.same_radius y hy⟩
    exact le_trans row.card_four (Finset.card_le_card hsub)
  have hradii : row.radius = K.radius := by
    exact
      (row.same_radius source hsourceB).symm.trans
        (K.support_eq_radius source K.q_mem_support)
  have hsub : B ⊆ K.support := by
    intro y hy
    have hyErased :
        y ∈
          (D.skeleton q).erase (H.centerAt source hsource) :=
      row.subset hy
    have hySkeleton : y ∈ D.skeleton q :=
      (Finset.mem_erase.mp hyErased).2
    have hyA : y ∈ D.A :=
      (Finset.mem_erase.mp hySkeleton).2
    apply K.off_row_named_label_forbidden hyA
    exact (row.same_radius y hy).trans hradii
  refine Finset.eq_of_subset_of_card_le hsub ?_
  rw [K.support_card, hBcard]

/-- First terminal arm of the four-center common-deletion residue: the common
deleted source is itself one of the three nonphysical carrier centers. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    False := by
  sorry

/-- Second terminal arm of the four-center common-deletion residue: one of the
four surviving centers and the common deleted source form a bidirectional
deletion-survival square. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hsquare :
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) S.oppApex2 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase S.oppApex2)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt u.1 u.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt v.1 v.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt
              second.deleted.1 second.deleted.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2))) :
    False := by
  sorry

end ATailFrontierLiveClosure
end Problem97
