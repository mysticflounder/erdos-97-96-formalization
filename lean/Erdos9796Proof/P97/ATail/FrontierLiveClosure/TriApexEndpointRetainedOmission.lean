/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy.Rigid221Wrappers
import Erdos9796Proof.P97.ATail.AllLargeCapCanonicalInterfaces
import Erdos9796Proof.P97.ATail.SourceFaithfulSelectedFourFan
import Erdos9796Proof.P97.ATail.SecondRadiusMutualCrossMembership
import Erdos9796Proof.P97.ATail.EndpointFreshTwoShellSeed
import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson
import Erdos9796Proof.P97.ATail.FourVertexLowSpan
import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.TriApexFiveSurviveOneFail
import Erdos9796Proof.P97.ATail.TwoRadiusGridCapBoundarySigns
import Erdos9796Proof.P97.ATail.TwoRadiusGridCoordinateGeometry
import Erdos9796Proof.P97.ATail.TwoRadiusGridConvexNesting
import Erdos9796Proof.P97.ATail.TwoRadiusGridEscapeSynchronization
import Erdos9796Proof.P97.ATail.TwoRadiusGridZeroCutAssembly

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
open ATailPairedCommonDeletionNormalForm
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
open ATailTwoRadiusGridCoordinateGeometry
open ATailTwoRadiusGridEscapeSynchronization
open ATailTwoRadiusGridZeroCutAssembly
open ATailTriApexFiveSurviveOneFail
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge
open ATailFourVertexLowSpan

attribute [local instance] Classical.propDecidable

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap. -/
private noncomputable def redesignateFirstOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) Q.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

@[simp] private theorem redesignateFirstOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    (redesignateFirstOppCapAsSurplus Q).oppCap1 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplus, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi]

/-- The exact-five residual closes after redesignating the first opposite cap
as surplus. A fresh common-deletion parent would force the old exact-five cap
to have at least six points; the other fresh-frontier arm is the protected
unique-radius terminal. -/
theorem false_of_frontierBiApexRobustExactFiveSecondCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    False := by
  let T : SurplusCapPacket D.A := redesignateFirstOppCapAsSurplus Q
  have hTfirst : T.oppCap1.card = 5 := by
    rw [show T.oppCap1 = S.oppCap2 by
      simp [T]]
    exact Q.secondOppCap_card_eq_five
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact Legacy.false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    omega

/-- Keep the MEC triangle and cap partition fixed, but designate the old second
opposite cap as the new surplus cap.  Its cardinality bound comes from the
large-opposite-caps residual, so this redesignation is available exactly on that
branch.  Cap indices rotate, so the old surplus cap becomes the new first
opposite cap — the mirror of `redesignateFirstOppCapAsSurplus`. -/
private noncomputable def redesignateSecondOppCapAsSurplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex2
  surplus := by
    have hgt : 4 < S.oppCap2.card :=
      lt_of_lt_of_le (by omega) L.secondOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex2, SurplusCapPacket.oppCap2, hi]
        using hgt

@[simp] private theorem redesignateSecondOppCapAsSurplus_oppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateSecondOppCapAsSurplus L).oppCap1 = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateSecondOppCapAsSurplus, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap1, SurplusCapPacket.surplusCap, hi]

/-- On the large-opposite-caps branch the surplus cap carries at least six
points as well, so all three caps are large.  Redesignating the second opposite
cap as surplus turns the old surplus cap into the fresh first opposite cap; a
fresh common-deletion parent would then force six points there, and the other
fresh-frontier arm is the protected unique-radius terminal.

Because the cap cardinalities sum to `D.A.card + 3`, this deletes every profile
with a five-point cap from the branch — in particular the whole of cardinality
fourteen, whose only profile is `(5, 6, 6)`.  The least surviving profile is
`(6, 6, 6)` at cardinality fifteen. -/
theorem surplusCap_card_ge_six_of_largeOppositeCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    6 ≤ S.surplusCap.card := by
  by_contra hlt
  push_neg at hlt
  let T : SurplusCapPacket D.A := redesignateSecondOppCapAsSurplus L
  have hTfirst : T.oppCap1 = S.surplusCap := by simp [T]
  obtain ⟨freshRadius, _hfreshRadius, hfreshFour, ⟨freshFrontier⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D T H
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    freshFrontier R.minimal R.noM44 R.carrier_card_gt_nine hfreshFour
  · exact Legacy.false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    rw [hTfirst] at hsix
    omega


/-- The non-robust physical-second-apex outcome.  The residual is kept with
the critical shell: the intended consumer is the packet-generic swapped
first-apex unique-four route, not an anonymous critical-row contradiction. -/
theorem false_of_physicalSecondApexCriticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : PhysicalSecondApexCriticalResidual D S) :
    False := by
  rcases physicalSecondCritical_reorients_to_swappedUniqueFour
      (H := H) P.shell P.deletion_blocked with ⟨U⟩
  apply Legacy.false_of_originalFrontierUniqueRadiusArm (H := H)
    U.frontier R.minimal R.noM44 R.carrier_card_gt_nine
  exact ⟨Or.inl U.firstClass_card_eq_four, U.firstClass_unique_radius⟩

/-- Keep the MEC triangle and cap partition fixed, but designate the old first
opposite cap as the new surplus cap.  Available at the all-large-caps terminal
because every cap there has at least six points.  Unlike
`redesignateFirstOppCapAsSurplus` this variant is driven by the large-cap
residual rather than by the exact-five one. -/
noncomputable def redesignateFirstOppCapAsSurplusAtAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    SurplusCapPacket D.A where
  hA := S.hA
  hncol := S.hncol
  triangleNonObtuse := S.triangleNonObtuse
  hCirc := S.hCirc
  partition := S.partition
  surplusIdx := S.oppIndex1
  surplus := by
    have hgt : 4 < S.oppCap1.card :=
      lt_of_lt_of_le (by omega) L.firstOppCap_card_ge_six
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppCap1, hi]
        using hgt

/-- The rotated packet carries the original surplus apex in its *second*
opposite role.  This is what makes the rotation informative: a fresh
common-deletion parent on the rotated packet reports robustness at the one
Moser apex the bi-apex residual says nothing about. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex2 = S.surplusApex := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusApex, hi]

/-- The same rotation carries the original *second* opposite apex into the
first opposite role, so the fresh parent's first-apex dichotomy reports on
`S.oppApex2`.  The bi-apex surface never supplies that dichotomy there. -/
@[simp] private theorem redesignateFirstOppCapAsSurplusAtAllLarge_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (redesignateFirstOppCapAsSurplusAtAllLarge L).oppApex1 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [redesignateFirstOppCapAsSurplusAtAllLarge,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi]


/-- A canonical critical shell whose blocker is already localized in one
strict cap cannot have two hits in a rich slice of a different strict cap.
The two hits would localize the same blocker in that other cap, contradicting
disjointness of indexed cap interiors. -/
theorem false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i j : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card) :
    False := by
  have hother : H.centerAt x hx ∈ S.capInteriorByIndex j :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hx hrich hunique htwo
  exact (S.capInteriorByIndex_ne_of_mem_of_mem_ne hcenter hother hij) rfl

/-- Once a canonical critical shell's blocker is localized in one strict cap,
that full shell has at most one hit in every radius slice of a distinct rich
cap.  This cardinality form is the direct finite-search rule extracted from
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`. -/
theorem criticalShell_inter_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i j : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (r : ℝ) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card ≤ 1 := by
  by_contra hnot
  have htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card := by
    omega
  exact false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap
    hx hcenter hij hrich (isUniqueFourCenter_centerAt H x hx) htwo

/-- An equal-blocker collision cannot remain isolated when at least three
frontier-radius members lie in the strict first opposite cap.  The collision
shell meets that cap in exactly its two sources, so a third member has a
distinct actual blocker and supplies a directed omission with the first
source. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  have hxExists :
      ∃ x ∈ I, x ∉ ({P.source₁, P.source₂} : Finset ℝ²) := by
    by_contra hno
    push_neg at hno
    have hsub : I ⊆ ({P.source₁, P.source₂} : Finset ℝ²) := by
      intro x hx
      exact hno x hx
    have hcard := Finset.card_le_card hsub
    have hpairCard :
        ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
      simp [P.sources_ne]
    dsimp [I] at hcard
    omega
  rcases hxExists with ⟨x, hxI, hxNotPair⟩
  have hxParts := Finset.mem_inter.mp hxI
  have hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius := hxParts.1
  have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1 := hxParts.2
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hxOutside :
      x ∉ (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
    intro hxShell
    apply hxNotPair
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr
      ⟨hxShell,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hxInterior⟩
  have hsource₁NeX : P.source₁ ≠ x := by
    intro h
    apply hxNotPair
    simp [← h]
  have hblockersNe :
      H.centerAt P.source₁ P.source₁_mem_A ≠ H.centerAt x hxA := by
    intro hblockers
    apply hxOutside
    have hsupportEq :
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support =
          (H.selectedAt x hxA).toCriticalFourShell.support := by
      rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
        ← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
        hblockers]
    rw [hsupportEq]
    exact (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
  exact ⟨{
    source₁ := P.source₁
    source₂ := x
    source₁_mem_A := P.source₁_mem_A
    source₂_mem_A := hxA
    sources_ne := hsource₁NeX
    source₁_mem_radius := P.source₁_mem_radius
    source₂_mem_radius := hxRadius
    source₁_mem_capInterior := P.source₁_mem_capInterior
    source₂_mem_capInterior := hxInterior
    blockers_ne := hblockersNe
    directed_omission := Or.inl ⟨hxOutside,
      (cross_deletion_survives_iff_not_mem_selected_support H
        P.source₁_mem_A).mpr hxOutside⟩ }⟩

/-- A frontier-radius class of cardinality at least five has at least three
strict first-cap members, so the preceding collision reduction applies. -/
theorem nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  have hbound :
      (SelectedClass D.A S.oppApex1 radius).card - 2 ≤
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex1
          (ATailUniqueArmRouteAuditScratch.frontier_radius_pos F)
  apply
    nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
      R P
  omega

/- A checked E-specific normal form for a retained directed omission.  The
orientation and reverse-incidence disjunctions have already been eliminated by
the upstream common-deletion and reverse-coupling producers. -/
inductive RetainedOmissionAllLargeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) : Type
  | pairedCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_omission :
        O.kept ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reversePacket :
        CommonDeletionTwoCenterPacket
          D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))
  | reverseHitFreshCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
      (fresh : ℝ²)
      (fresh_mem_capInterior :
        fresh ∈ S.capInteriorByIndex S.oppIndex1)
      (fresh_ne_kept : fresh ≠ O.kept)
      (fresh_ne_deleted : fresh ≠ O.deleted)
      (fresh_not_mem_reverseShell :
        fresh ∉
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
      (freshPacket :
        CommonDeletionTwoCenterPacket
          D H fresh S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))

/-- In the reverse-hit arm, the reverse blocker strictly separates the two
retained sources in the canonical order of the first cap. -/
theorem exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted}) :
    ∃ (m : ℕ) (L : CGN.OrderedCap m)
      (Packet : CGN.MecCapPacket D.A L)
      (Hside : CGN.MinorCapSideHypotheses Packet)
      (Hord : CGN.StrictCapOrder D.A L)
      (j r s : Fin m),
        Finset.univ.image L.points = S.capByIndex S.oppIndex1 ∧
        L.points r = O.kept ∧
        L.points s = O.deleted ∧
        L.points j = H.centerAt O.deleted O.deleted_mem_A ∧
        ((r < j ∧ j < s) ∨ (s < j ∧ j < r)) := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hkeptImage : O.kept ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 O.kept_mem_capInterior
  have hdeletedImage : O.deleted ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 O.deleted_mem_capInterior
  have hblockerImage :
      H.centerAt O.deleted O.deleted_mem_A ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        reverseBlocker_mem_capInterior
  rcases Finset.mem_image.mp hkeptImage with ⟨r, _hrmem, hr⟩
  rcases Finset.mem_image.mp hdeletedImage with ⟨s, _hsmem, hs⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨j, _hjmem, hj⟩
  have hdeletedShell :
      O.deleted ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    have hmem :
        O.deleted ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 := by
      rw [reverseShell_inter_cap_eq]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have heq :
      dist (H.centerAt O.deleted O.deleted_mem_A) O.kept =
        dist (H.centerAt O.deleted O.deleted_mem_A) O.deleted :=
    ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept reverse_mem).trans
      ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.deleted hdeletedShell).symm
  have hjr : j ≠ r := by
    intro hjr
    apply
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.center_not_mem_support
    have hcenterEq : H.centerAt O.deleted O.deleted_mem_A = O.kept := by
      calc
        H.centerAt O.deleted O.deleted_mem_A = L.points j := hj.symm
        _ = L.points r := by rw [hjr]
        _ = O.kept := hr
    simpa [hcenterEq] using reverse_mem
  have hjs : j ≠ s := by
    intro hjs
    apply
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.center_not_mem_support
    have hcenterEq : H.centerAt O.deleted O.deleted_mem_A = O.deleted := by
      calc
        H.centerAt O.deleted O.deleted_mem_A = L.points j := hj.symm
        _ = L.points s := by rw [hjs]
        _ = O.deleted := hs
    simpa [hcenterEq] using hdeletedShell
  have hrs : r ≠ s := by
    intro hrs
    apply O.sources_ne
    calc
      O.kept = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = O.deleted := hs
  have heqL : dist (L.points j) (L.points r) = dist (L.points j) (L.points s) := by
    simpa only [hj, hr, hs] using heq
  refine ⟨m, L, Packet, Hside, Hord, j, r, s, hcap, hr, hs, hj, ?_⟩
  rcases lt_or_gt_of_ne hrs with hrslt | hslt
  · exact Or.inl
      (CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hrslt hjr hjs heqL)
  · exact Or.inr
      (CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hslt hjs hjr heqL.symm)

/-- The first opposite apex is a carrier point. -/
private theorem oppApex1_mem_A_for_reverseHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The first opposite apex is outside the closed cap indexed by
`oppIndex1`.  The concrete cap/vertex names depend on the surplus index. -/
private theorem oppApex1_not_mem_capByIndex_oppIndex1_for_reverseHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∉ S.capByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v2_notin_C2
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi] using S.partition.v1_notin_C1

/-- In the reverse-hit arm, the first apex and the reverse blocker are on
opposite sides of the retained-source chord.  Their two equal-distance
relations therefore force both associated squared base-angle inequalities. -/
theorem reverseHit_twoCenter_sqdist_acute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted}) :
    dist S.oppApex1 (H.centerAt O.deleted O.deleted_mem_A) ^ 2 +
        dist S.oppApex1 O.kept ^ 2 >
          dist (H.centerAt O.deleted O.deleted_mem_A) O.kept ^ 2 ∧
      dist S.oppApex1 (H.centerAt O.deleted O.deleted_mem_A) ^ 2 +
        dist (H.centerAt O.deleted O.deleted_mem_A) O.kept ^ 2 >
          dist S.oppApex1 O.kept ^ 2 := by
  classical
  rcases exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit O
      reverse_mem reverseBlocker_mem_capInterior reverseShell_inter_cap_eq with
    ⟨m, L, Packet, Hside, Hord, j, r, s, hcap, hr, hs, hj, hbetween⟩
  have hdeletedShell :
      O.deleted ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    have hmem :
        O.deleted ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 := by
      rw [reverseShell_inter_cap_eq]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hp : dist S.oppApex1 O.kept = dist S.oppApex1 O.deleted :=
    (mem_selectedClass.mp O.kept_mem_radius).2.trans
      (mem_selectedClass.mp O.deleted_mem_radius).2.symm
  have hq :
      dist (H.centerAt O.deleted O.deleted_mem_A) O.kept =
        dist (H.centerAt O.deleted O.deleted_mem_A) O.deleted :=
    ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.kept reverse_mem).trans
      ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.deleted hdeletedShell).symm
  have happA : S.oppApex1 ∈ D.A :=
    oppApex1_mem_A_for_reverseHit S
  have happOffCap : S.oppApex1 ∉ S.capByIndex S.oppIndex1 :=
    oppApex1_not_mem_capByIndex_oppIndex1_for_reverseHit S
  have happOff : S.oppApex1 ∉ Finset.univ.image L.points := by
    intro happImage
    apply happOffCap
    rw [← hcap]
    exact happImage
  rcases hbetween with hrjs | hsjr
  · have hprod :
        signedArea2 S.oppApex1 (L.points r) (L.points s) *
            signedArea2 (L.points j) (L.points r) (L.points s) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hrjs.1 hrjs.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points r) (y := L.points s)
      (by simpa only [hr, hs] using hp)
      (by simpa only [hj, hr, hs] using hq)
      (by simpa only [hr, hs] using O.sources_ne)
      hprod
    simpa only [hj, hr] using hacute
  · have hprod :
        signedArea2 S.oppApex1 (L.points s) (L.points r) *
            signedArea2 (L.points j) (L.points s) (L.points r) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hsjr.1 hsjr.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points s) (y := L.points r)
      (by simpa only [hr, hs] using hp.symm)
      (by simpa only [hj, hr, hs] using hq.symm)
      (by simpa only [hr, hs] using O.sources_ne.symm)
      hprod
    simpa only [hj, hr, hs, hp, hq] using hacute

/-- The two-arm E normal form is source-clean: it only composes checked
common-deletion, orientation, reverse-coupling, and fresh-third producers. -/
theorem nonempty_retainedOmissionAllLargeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R)
    (hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card) :
    Nonempty (RetainedOmissionAllLargeNormalForm P) := by
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨C⟩
  rcases nonempty_orientedRetainedCommonDeletion P C with ⟨O⟩
  rcases nonempty_retainedReverseCouplingOutcome O with ⟨Q⟩
  cases Q with
  | pairedCommonDeletion reverse_omission reversePacket =>
      exact ⟨.pairedCommonDeletion O reverse_omission reversePacket⟩
  | reverseHit reverse_mem reverseBlocker_mem_capInterior reverseShell_inter_cap_eq =>
      rcases exists_fresh_firstCap_commonDeletion_of_reverseHit
          O reverseShell_inter_cap_eq hfirstLarge with
        ⟨fresh, fresh_mem_capInterior, fresh_ne_kept, fresh_ne_deleted,
          fresh_not_mem_reverseShell, ⟨freshPacket⟩⟩
      exact ⟨.reverseHitFreshCommonDeletion O reverse_mem
        reverseBlocker_mem_capInterior reverseShell_inter_cap_eq fresh
        fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
        fresh_not_mem_reverseShell freshPacket⟩


/-- Source-faithful global form of the cross-cap one-hit rule.  Every
canonical critical shell has a strict-cap location, and in every other rich
cap it meets each interior radius slice in at most one point. -/
theorem exists_criticalShell_center_with_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3,
      H.centerAt x hx ∈ S.capInteriorByIndex i ∧
      ∀ j : Fin 3, i ≠ j → ∀ r : ℝ,
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1 := by
  rcases
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G hx with
    ⟨i, hcenter⟩
  refine ⟨i, hcenter, ?_⟩
  intro j hij r
  exact criticalShell_inter_otherRichCapSlice_card_le_one
    hx hcenter hij (G.apex_rich j) r












/-- Normalize the endpoint/off-endpoint presentation of an escaping
source-faithful row.  In the off-endpoint arm the caller supplies a row at the
separate center; in the endpoint arm the boundary row transports to that same
center.  This is a pure adapter: it forgets which arm produced the row while
retaining the escaping point and the complete deletion fan. -/
theorem exists_escaping_sourceFaithfulRow_of_endpoint_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {seed : Finset ℝ²} {center boundary : ℝ²}
    (BoundaryRow : SelectedFourClass D.A boundary)
    (hterminal :
      (center ≠ boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          ∃ Row : SelectedFourClass D.A center,
            (∃ z ∈ Row.support, z ∉ seed) ∧
              SourceFaithfulSelectedFourDeletionFan D S H Row) ∨
        center = boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          SourceFaithfulSelectedFourDeletionFan D S H BoundaryRow) :
    ∃ Row : SelectedFourClass D.A center,
      (∃ z ∈ Row.support, z ∉ seed) ∧
        SourceFaithfulSelectedFourDeletionFan D S H Row := by
  rcases hterminal with hoff | hendpoint
  · exact hoff.2.2
  · rcases hendpoint with ⟨hcenter, hescape, hfan⟩
    subst boundary
    exact ⟨BoundaryRow, hescape, hfan⟩

/-! ### Cap placement census for the paired two-radius grid

The grid pins both retained shells onto the two rich first-apex classes.  Every
positive first-apex class of four points already contributes at least two points
to the strict interior of the first cap, while each retained shell contributes
at most two — either because its blocker sits in that same cap, or because it
sits in another strict cap and the cross-cap one-hit rule applies to both
classes.  The two bounds meet, which forces the whole census below. -/

private theorem grid_capInterior_counts
    {Cint Cc Cc' Kfirst Ksecond : Finset ℝ²}
    (hclassDisj : Disjoint Cc Cc')
    (hshellDisj : Disjoint Kfirst Ksecond)
    (hunion : Kfirst ∪ Ksecond = Cc ∪ Cc')
    (h1 : 2 ≤ (Cc ∩ Cint).card) (h2 : 2 ≤ (Cc' ∩ Cint).card)
    (h3 : (Kfirst ∩ Cint).card ≤ 2) (h4 : (Ksecond ∩ Cint).card ≤ 2) :
    (Cc ∩ Cint).card = 2 ∧ (Cc' ∩ Cint).card = 2 ∧
      (Kfirst ∩ Cint).card = 2 ∧ (Ksecond ∩ Cint).card = 2 := by
  classical
  have hdistrib : ∀ X Y Z : Finset ℝ², (X ∪ Y) ∩ Z = (X ∩ Z) ∪ (Y ∩ Z) := by
    intro X Y Z
    ext z
    simp only [Finset.mem_inter, Finset.mem_union]
    tauto
  have hsame :
      (Cc ∩ Cint) ∪ (Cc' ∩ Cint) = (Kfirst ∩ Cint) ∪ (Ksecond ∩ Cint) := by
    rw [← hdistrib Cc Cc' Cint, ← hdistrib Kfirst Ksecond Cint, hunion]
  have hcardSum :
      (Cc ∩ Cint).card + (Cc' ∩ Cint).card
        = (Kfirst ∩ Cint).card + (Ksecond ∩ Cint).card := by
    rw [← Finset.card_union_of_disjoint
        (hclassDisj.mono Finset.inter_subset_left Finset.inter_subset_left),
      ← Finset.card_union_of_disjoint
        (hshellDisj.mono Finset.inter_subset_left Finset.inter_subset_left),
      hsame]
  omega

private theorem grid_retained_slice_eq_pair
    {Cint Cc : Finset ℝ²} {a b : ℝ²}
    (ha : a ∈ Cc) (hb : b ∈ Cc) (haI : a ∈ Cint) (hbI : b ∈ Cint)
    (hab : a ≠ b) (hcard : (Cc ∩ Cint).card = 2) :
    Cc ∩ Cint = {a, b} := by
  classical
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz'
    · exact Finset.mem_inter.mpr ⟨ha, haI⟩
    · rw [Finset.mem_singleton.mp hz']
      exact Finset.mem_inter.mpr ⟨hb, hbI⟩
  · have hpair : ({a, b} : Finset ℝ²).card = 2 := by
      rw [Finset.card_insert_of_notMem (by simpa using hab), Finset.card_singleton]
    omega

private theorem grid_shell_other_slice_card_eq_one
    {Cint Cc Cc' K : Finset ℝ²} {a b : ℝ²}
    (hclassDisj : Disjoint Cc Cc')
    (hsub : K ⊆ Cc ∪ Cc')
    (hKC : K ∩ Cc = {a, b})
    (haInt : a ∈ Cint) (hbOut : b ∉ Cint)
    (hKint : (K ∩ Cint).card = 2) :
    (K ∩ (Cc' ∩ Cint)).card = 1 := by
  classical
  have hKCint : K ∩ (Cc ∩ Cint) = {a} := by
    rw [← Finset.inter_assoc, hKC]
    ext z
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨h | h, hi⟩
      · exact h
      · subst h
        exact absurd hi hbOut
    · rintro rfl
      exact ⟨Or.inl rfl, haInt⟩
  have hsplit : K ∩ Cint = (K ∩ (Cc ∩ Cint)) ∪ (K ∩ (Cc' ∩ Cint)) := by
    ext z
    simp only [Finset.mem_inter, Finset.mem_union]
    constructor
    · rintro ⟨hzK, hzI⟩
      rcases Finset.mem_union.mp (hsub hzK) with h | h
      · exact Or.inl ⟨hzK, h, hzI⟩
      · exact Or.inr ⟨hzK, h, hzI⟩
    · rintro (⟨hzK, _, hzI⟩ | ⟨hzK, _, hzI⟩) <;> exact ⟨hzK, hzI⟩
  have hdisj : Disjoint (K ∩ (Cc ∩ Cint)) (K ∩ (Cc' ∩ Cint)) :=
    hclassDisj.mono
      (Finset.inter_subset_right.trans Finset.inter_subset_left)
      (Finset.inter_subset_right.trans Finset.inter_subset_left)
  have hc := Finset.card_union_of_disjoint hdisj
  rw [← hsplit, hKCint, Finset.card_singleton, hKint] at hc
  omega

/-- A grid shell meets the strict first-cap interior in at most two points.
Either its blocker lies in that same cap, and the same-cap row bound applies, or
it lies in another strict cap, and the cross-cap one-hit rule applies to each of
the two first-apex classes carrying the shell. -/
private theorem grid_shell_inter_capInterior_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) {r₁ r₂ : ℝ}
    (hsub : (H.selectedAt x hx).toCriticalFourShell.support ⊆
      SelectedClass D.A S.oppApex1 r₁ ∪ SelectedClass D.A S.oppApex1 r₂) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      S.capInteriorByIndex S.oppIndex1).card ≤ 2 := by
  classical
  rcases exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
      G hx with ⟨i, hi⟩
  by_cases hii : i = S.oppIndex1
  · subst hii
    have hle :
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card ≤ 2 :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        ((H.selectedAt x hx).toCriticalFourShell.toSelectedFourClass)
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hi)
    refine le_trans (Finset.card_le_card ?_) hle
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hz).1,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp hz).2⟩
  · have hrich :
        ApexRichClassStructure D.A (S.oppositeVertexByIndex S.oppIndex1) :=
      G.apex_rich S.oppIndex1
    have h1 :
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 r₁ ∩
            S.capInteriorByIndex S.oppIndex1)).card ≤ 1 := by
      simpa using
        criticalShell_inter_otherRichCapSlice_card_le_one hx hi hii hrich r₁
    have h2 :
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 r₂ ∩
            S.capInteriorByIndex S.oppIndex1)).card ≤ 1 := by
      simpa using
        criticalShell_inter_otherRichCapSlice_card_le_one hx hi hii hrich r₂
    have hsplit :
        (H.selectedAt x hx).toCriticalFourShell.support ∩
            S.capInteriorByIndex S.oppIndex1 ⊆
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
              (SelectedClass D.A S.oppApex1 r₁ ∩
                S.capInteriorByIndex S.oppIndex1)) ∪
            ((H.selectedAt x hx).toCriticalFourShell.support ∩
              (SelectedClass D.A S.oppApex1 r₂ ∩
                S.capInteriorByIndex S.oppIndex1)) := by
      intro z hz
      rcases Finset.mem_inter.mp hz with ⟨hzK, hzI⟩
      rcases Finset.mem_union.mp (hsub hzK) with h | h
      · exact Finset.mem_union_left _
          (Finset.mem_inter.mpr ⟨hzK, Finset.mem_inter.mpr ⟨h, hzI⟩⟩)
      · exact Finset.mem_union_right _
          (Finset.mem_inter.mpr ⟨hzK, Finset.mem_inter.mpr ⟨h, hzI⟩⟩)
    have hsub' := Finset.card_le_card hsplit
    have hun := Finset.card_union_le
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 r₁ ∩ S.capInteriorByIndex S.oppIndex1))
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 r₂ ∩ S.capInteriorByIndex S.oppIndex1))
    omega

/-- **Cap placement census for the paired two-radius grid.**

The strict interior of the first cap meets the eight grid points in exactly
four: the two retained sources on the retained class, and exactly one hit of
each shell on the second class.  Both retained-class partners are pushed out of
that strict interior, hence into the two adjacent caps. -/
structure PairedGridCapPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) : Prop where
  retained_inter_capInterior_eq :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 = {O.kept, O.deleted}
  other_inter_capInterior_card :
    (SelectedClass D.A S.oppApex1 Gr.otherRadius ∩
      S.capInteriorByIndex S.oppIndex1).card = 2
  keptPartner_not_mem_capInterior :
    Gr.keptPartner ∉ S.capInteriorByIndex S.oppIndex1
  deletedPartner_not_mem_capInterior :
    Gr.deletedPartner ∉ S.capInteriorByIndex S.oppIndex1
  keptShell_inter_other_capInterior_card :
    ((H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∩
      (SelectedClass D.A S.oppApex1 Gr.otherRadius ∩
        S.capInteriorByIndex S.oppIndex1)).card = 1
  deletedShell_inter_other_capInterior_card :
    ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
      (SelectedClass D.A S.oppApex1 Gr.otherRadius ∩
        S.capInteriorByIndex S.oppIndex1)).card = 1

/-- The grid determines its own cap placement. -/
theorem pairedGridCapPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O)
    (G : TriApexAllLargeContext D S) :
    PairedGridCapPlacement Gr := by
  classical
  have hclassDisj :
      Disjoint (SelectedClass D.A S.oppApex1 radius)
        (SelectedClass D.A S.oppApex1 Gr.otherRadius) :=
    selectedClass_disjoint_of_radius_ne
      (fun h => Gr.otherRadius_ne_radius h.symm)
  have hretTwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
        F.radius_pos (by simp [Gr.retainedClass_card_eq_four])
  have hotherTwo :
      2 ≤ (SelectedClass D.A S.oppApex1 Gr.otherRadius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
        Gr.otherRadius_pos (by simp [Gr.otherClass_card_eq_four])
  have hKeptLe :=
    grid_shell_inter_capInterior_card_le_two G O.kept_mem_A
      Gr.keptShell_subset_union
  have hDelLe :=
    grid_shell_inter_capInterior_card_le_two G O.deleted_mem_A
      Gr.deletedShell_subset_union
  obtain ⟨hretEqTwo, hotherEqTwo, hKeptEqTwo, hDelEqTwo⟩ :=
    grid_capInterior_counts hclassDisj Gr.shells_disjoint
      Gr.shells_union_eq_classes_union hretTwo hotherTwo hKeptLe hDelLe
  have hretEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 = {O.kept, O.deleted} :=
    grid_retained_slice_eq_pair O.kept_mem_radius O.deleted_mem_radius
      O.kept_mem_capInterior O.deleted_mem_capInterior O.sources_ne hretEqTwo
  have hkeptPartnerNeDeleted : Gr.keptPartner ≠ O.deleted := by
    intro h
    exact (Finset.disjoint_left.mp Gr.shells_disjoint)
      Gr.keptPartner_mem_keptShell
      (by
        rw [h]
        exact
          (H.selectedAt O.deleted
            O.deleted_mem_A).toCriticalFourShell.q_mem_support)
  have hdeletedPartnerNeKept : Gr.deletedPartner ≠ O.kept := by
    intro h
    exact (Finset.disjoint_left.mp Gr.shells_disjoint)
      (by
        rw [h]
        exact
          (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.q_mem_support)
      Gr.deletedPartner_mem_deletedShell
  have hkeptPartnerOut :
      Gr.keptPartner ∉ S.capInteriorByIndex S.oppIndex1 := by
    intro hin
    have hmem : Gr.keptPartner ∈ ({O.kept, O.deleted} : Finset ℝ²) := by
      rw [← hretEq]
      exact Finset.mem_inter.mpr ⟨Gr.keptPartner_mem_retained, hin⟩
    rcases Finset.mem_insert.mp hmem with h | h
    · exact Gr.keptPartner_ne_kept h
    · exact hkeptPartnerNeDeleted (Finset.mem_singleton.mp h)
  have hdeletedPartnerOut :
      Gr.deletedPartner ∉ S.capInteriorByIndex S.oppIndex1 := by
    intro hin
    have hmem : Gr.deletedPartner ∈ ({O.kept, O.deleted} : Finset ℝ²) := by
      rw [← hretEq]
      exact Finset.mem_inter.mpr ⟨Gr.deletedPartner_mem_retained, hin⟩
    rcases Finset.mem_insert.mp hmem with h | h
    · exact hdeletedPartnerNeKept h
    · exact Gr.deletedPartner_ne_deleted (Finset.mem_singleton.mp h)
  exact {
    retained_inter_capInterior_eq := hretEq
    other_inter_capInterior_card := hotherEqTwo
    keptPartner_not_mem_capInterior := hkeptPartnerOut
    deletedPartner_not_mem_capInterior := hdeletedPartnerOut
    keptShell_inter_other_capInterior_card :=
      grid_shell_other_slice_card_eq_one hclassDisj Gr.keptShell_subset_union
        Gr.keptShell_inter_retained_eq O.kept_mem_capInterior hkeptPartnerOut
        hKeptEqTwo
    deletedShell_inter_other_capInterior_card :=
      grid_shell_other_slice_card_eq_one hclassDisj
        Gr.deletedShell_subset_union Gr.deletedShell_inter_retained_eq
        O.deleted_mem_capInterior hdeletedPartnerOut hDelEqTwo }

/-- The exact first-cap census of a paired grid supplies the existing
two-radius adjacent-cap grid API.  This is the bridge from the D2 normal form
to the cut-independent boundary-order machinery. -/
theorem pairedGrid_exactFourTwoRadiusAdjacentCapGrid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) (place : PairedGridCapPlacement Gr) :
    S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius Gr.otherRadius := by
  have hretainedInterior :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 := by
    simpa [O.sources_ne] using
      congrArg Finset.card place.retained_inter_capInterior_eq
  exact S.exactFourTwoRadiusAdjacentCapGrid D.convex S.oppIndex1
    F.radius_pos Gr.otherRadius_pos Gr.otherRadius_ne_radius.symm
    (by simpa using Gr.retainedClass_card_eq_four)
    (by simpa using Gr.otherClass_card_eq_four)
    hretainedInterior (by simpa using place.other_inter_capInterior_card)

/-- The paired D2 grid therefore inherits the public radial cyclic-order
packet, with all zero-cut and adjacent-cap endpoint cases discharged by the
shared boundary adapter. -/
theorem pairedGrid_exists_fourHits_radialCyclicOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) (place : PairedGridCapPlacement Gr) :
    ∃ (G : S.ExactFourTwoRadiusAdjacentCapGrid
          S.oppIndex1 radius Gr.otherRadius)
      (hits : ExactFourAdjacentGridKalmanson.FourHits G),
      ExactFourAdjacentGridKalmanson.RadialCyclicOrder hits := by
  let G := pairedGrid_exactFourTwoRadiusAdjacentCapGrid Gr place
  rcases
      ExactFourAdjacentGridKalmanson.exists_fourHits_radialCyclicOrder_oppIndex1
        D S G F.radius_pos Gr.otherRadius_pos
          Gr.otherRadius_ne_radius.symm with
    ⟨hits, horder⟩
  exact ⟨G, hits, horder⟩

/-- **Two distinct first-apex class points outside the strict first-cap
interior occupy different adjacent caps.**

Each lands in one of the two closed caps adjacent to the first cap
(`selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`), and a first-apex
class meets each adjacent cap in at most one point
(`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and its right
analogue), so two distinct such points cannot share a cap. -/
private theorem class_outside_pair_distinct_adjacentCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ} (hr : 0 < r)
    {u v : ℝ²}
    (hu : u ∈ SelectedClass D.A S.oppApex1 r)
    (hv : v ∈ SelectedClass D.A S.oppApex1 r)
    (huOut : u ∉ S.capInteriorByIndex S.oppIndex1)
    (hvOut : v ∉ S.capInteriorByIndex S.oppIndex1)
    (huv : u ≠ v) :
    (u ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        v ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
      (u ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        v ∈ S.leftAdjacentCapByIndex S.oppIndex1) := by
  classical
  have hcover : ∀ z : ℝ², z ∈ SelectedClass D.A S.oppApex1 r →
      z ∉ S.capInteriorByIndex S.oppIndex1 →
      z ∈ SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) r ∩
            S.leftAdjacentCapByIndex S.oppIndex1 ∨
        z ∈ SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) r ∩
            S.rightAdjacentCapByIndex S.oppIndex1 := by
    intro z hz hzout
    have hzIdx :
        z ∈ SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) r := by simpa using hz
    exact Finset.mem_union.mp
      (S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps S.oppIndex1
        hr (Finset.mem_sdiff.mpr ⟨hzIdx, hzout⟩))
  have hsame : ∀ T : Finset ℝ², T.card ≤ 1 → u ∈ T → v ∈ T → False := by
    intro T hT h1 h2
    have hlt : 1 < T.card := Finset.one_lt_card.mpr ⟨u, h1, v, h2, huv⟩
    omega
  have hleftLe :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep D.convex
      S.oppIndex1 r
  have hrightLe :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep D.convex
      S.oppIndex1 r
  rcases hcover _ hu huOut with hk | hk <;>
    rcases hcover _ hv hvOut with hd | hd
  · exact (hsame _ hleftLe hk hd).elim
  · exact Or.inl ⟨(Finset.mem_inter.mp hk).2, (Finset.mem_inter.mp hd).2⟩
  · exact Or.inr ⟨(Finset.mem_inter.mp hk).2, (Finset.mem_inter.mp hd).2⟩
  · exact (hsame _ hrightLe hk hd).elim

/-- **The two retained-class partners occupy *different* adjacent caps.**

`PairedGridCapPlacement` pushes both retained-class partners out of the strict
first-cap interior, and they are distinct because the retained shells are
disjoint, so the retained class straddles all three caps around the first apex:
two sources strictly inside the first cap and one partner in each neighbour. -/
theorem grid_retainedPartners_mem_distinct_adjacentCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O}
    (place : PairedGridCapPlacement Gr) :
    (Gr.keptPartner ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        Gr.deletedPartner ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
      (Gr.keptPartner ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        Gr.deletedPartner ∈ S.leftAdjacentCapByIndex S.oppIndex1) :=
  class_outside_pair_distinct_adjacentCaps F.radius_pos
    Gr.keptPartner_mem_retained Gr.deletedPartner_mem_retained
    place.keptPartner_not_mem_capInterior
    place.deletedPartner_not_mem_capInterior Gr.keptPartner_ne_deletedPartner

/-- Exactly one of a named two-point shell slice lies in the strict first-cap
interior, so the slice supplies exactly one escapee. -/
private theorem grid_slice_exists_outside
    {K C : Finset ℝ²} {s t : ℝ²}
    (hne : s ≠ t) (hslice : K ∩ C = {s, t}) {I : Finset ℝ²}
    (hcard : (K ∩ (C ∩ I)).card = 1) :
    ∃ z, z ∈ ({s, t} : Finset ℝ²) ∧ z ∉ I := by
  classical
  by_contra hcon
  push_neg at hcon
  have hs : s ∈ I := hcon s (by simp)
  have ht : t ∈ I := hcon t (by simp)
  have hrw : K ∩ (C ∩ I) = ({s, t} : Finset ℝ²) ∩ I := by
    rw [← Finset.inter_assoc, hslice]
  have hsub : ({s, t} : Finset ℝ²) ⊆ ({s, t} : Finset ℝ²) ∩ I := by
    intro z hz
    refine Finset.mem_inter.mpr ⟨hz, ?_⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    exacts [hs, ht]
  have hlt : 1 < (({s, t} : Finset ℝ²) ∩ I).card :=
    Finset.one_lt_card.mpr ⟨s, hsub (by simp), t, hsub (by simp), hne⟩
  rw [hrw] at hcard
  omega

/-- **The two second-class escapees occupy different adjacent caps.**

Each retained shell meets the second class in a named two-point set and hits the
strict first-cap interior in exactly one of them, so each shell contributes
exactly one second-class point outside that interior.  The two escapees lie in
different shells, hence are distinct, hence occupy different adjacent caps —
the second class straddles all three caps around the first apex exactly as the
retained class does. -/
theorem grid_otherClass_escapees_mem_distinct_adjacentCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O}
    (place : PairedGridCapPlacement Gr) :
    ∃ u v : ℝ²,
      u ∈ ({Gr.keptOtherFirst, Gr.keptOtherSecond} : Finset ℝ²) ∧
        v ∈ ({Gr.deletedOtherFirst, Gr.deletedOtherSecond} : Finset ℝ²) ∧
        u ∉ S.capInteriorByIndex S.oppIndex1 ∧
        v ∉ S.capInteriorByIndex S.oppIndex1 ∧
        ((u ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
            v ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
          (u ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
            v ∈ S.leftAdjacentCapByIndex S.oppIndex1)) := by
  classical
  obtain ⟨u, huMem, huOut⟩ :=
    grid_slice_exists_outside Gr.keptOther_ne
      Gr.keptShell_inter_other_eq place.keptShell_inter_other_capInterior_card
  obtain ⟨v, hvMem, hvOut⟩ :=
    grid_slice_exists_outside Gr.deletedOther_ne
      Gr.deletedShell_inter_other_eq
      place.deletedShell_inter_other_capInterior_card
  have huShell :
      u ∈ (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at huMem
    rcases huMem with rfl | rfl
    exacts [Gr.keptOtherFirst_mem_keptShell, Gr.keptOtherSecond_mem_keptShell]
  have hvShell :
      v ∈
        (H.selectedAt O.deleted
          O.deleted_mem_A).toCriticalFourShell.support := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvMem
    rcases hvMem with rfl | rfl
    exacts [Gr.deletedOtherFirst_mem_deletedShell,
      Gr.deletedOtherSecond_mem_deletedShell]
  have huClass : u ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at huMem
    rcases huMem with rfl | rfl
    exacts [Gr.keptOtherFirst_mem_other, Gr.keptOtherSecond_mem_other]
  have hvClass : v ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvMem
    rcases hvMem with rfl | rfl
    exacts [Gr.deletedOtherFirst_mem_other, Gr.deletedOtherSecond_mem_other]
  exact ⟨u, v, huMem, hvMem, huOut, hvOut,
    class_outside_pair_distinct_adjacentCaps Gr.otherRadius_pos huClass hvClass
      huOut hvOut
      (Gr.ne_of_mem_keptShell_of_mem_deletedShell huShell hvShell)⟩

/-- A two-point slice with its strict-interior point and escapee distinguished.
The disjunction retains which of the source names was chosen, so later metric
adapters can recover the source-proved pair identities without rewriting the
slice as an anonymous set. -/
private structure OrientedTwoPointSlice (s t : ℝ²) (interior : Finset ℝ²) where
  inside : ℝ²
  escape : ℝ²
  source_order :
    (inside = s ∧ escape = t) ∨ (inside = t ∧ escape = s)
  inside_mem : inside ∈ interior
  escape_not_mem : escape ∉ interior

private theorem OrientedTwoPointSlice.inside_ne_escape
    {s t : ℝ²} {interior : Finset ℝ²}
    (Q : OrientedTwoPointSlice s t interior) (hne : s ≠ t) :
    Q.inside ≠ Q.escape := by
  rcases Q.source_order with ⟨hinside, hescape⟩ | ⟨hinside, hescape⟩
  · simpa [hinside, hescape] using hne
  · simpa [hinside, hescape] using hne.symm

/-- A named two-point slice with exactly one strict-interior member has an
oriented inside/escape labeling. -/
private theorem nonempty_orientedTwoPointSlice_of_inter_card_eq_one
    {s t : ℝ²} (hne : s ≠ t) {interior : Finset ℝ²}
    (hcard : (({s, t} : Finset ℝ²) ∩ interior).card = 1) :
    Nonempty (OrientedTwoPointSlice s t interior) := by
  classical
  by_cases hs : s ∈ interior
  · have ht : t ∉ interior := by
      intro ht
      have htwo : (({s, t} : Finset ℝ²) ∩ interior).card = 2 := by
        simp [hs, ht, hne]
      omega
    exact ⟨{
      inside := s
      escape := t
      source_order := Or.inl ⟨rfl, rfl⟩
      inside_mem := hs
      escape_not_mem := ht }⟩
  · have ht : t ∈ interior := by
      by_contra ht
      have hzero : (({s, t} : Finset ℝ²) ∩ interior).card = 0 := by
        simp [hs, ht]
      omega
    exact ⟨{
      inside := t
      escape := s
      source_order := Or.inr ⟨rfl, rfl⟩
      inside_mem := ht
      escape_not_mem := hs }⟩

/-- Typed finite choices for the two other-radius shell slices, together with
the two source-checked adjacent-cap orientations. -/
private structure PairedGridOrientedLabels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) (place : PairedGridCapPlacement Gr) where
  keptOther :
    OrientedTwoPointSlice Gr.keptOtherFirst Gr.keptOtherSecond
      (S.capInteriorByIndex S.oppIndex1)
  deletedOther :
    OrientedTwoPointSlice Gr.deletedOtherFirst Gr.deletedOtherSecond
      (S.capInteriorByIndex S.oppIndex1)
  keptOther_inside_mem_shell :
    keptOther.inside ∈
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support
  keptOther_inside_mem_class :
    keptOther.inside ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius
  keptOther_escape_mem_shell :
    keptOther.escape ∈
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support
  keptOther_escape_mem_class :
    keptOther.escape ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius
  deletedOther_inside_mem_shell :
    deletedOther.inside ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  deletedOther_inside_mem_class :
    deletedOther.inside ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius
  deletedOther_escape_mem_shell :
    deletedOther.escape ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  deletedOther_escape_mem_class :
    deletedOther.escape ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius
  retainedEscape_orientation :
    (Gr.keptPartner ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        Gr.deletedPartner ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
      (Gr.keptPartner ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        Gr.deletedPartner ∈ S.leftAdjacentCapByIndex S.oppIndex1)
  otherEscape_orientation :
    (keptOther.escape ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        deletedOther.escape ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
      (keptOther.escape ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        deletedOther.escape ∈ S.leftAdjacentCapByIndex S.oppIndex1)

/-- The exact-one slice census canonically supplies the finite orientation
packet used by the coordinate adapters. -/
private theorem nonempty_pairedGridOrientedLabels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) (place : PairedGridCapPlacement Gr) :
    Nonempty (PairedGridOrientedLabels Gr place) := by
  classical
  have hkeptCard :
      (({Gr.keptOtherFirst, Gr.keptOtherSecond} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex1).card = 1 := by
    have h := place.keptShell_inter_other_capInterior_card
    rw [← Finset.inter_assoc, Gr.keptShell_inter_other_eq] at h
    exact h
  have hdeletedCard :
      (({Gr.deletedOtherFirst, Gr.deletedOtherSecond} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex1).card = 1 := by
    have h := place.deletedShell_inter_other_capInterior_card
    rw [← Finset.inter_assoc, Gr.deletedShell_inter_other_eq] at h
    exact h
  rcases nonempty_orientedTwoPointSlice_of_inter_card_eq_one
      Gr.keptOther_ne hkeptCard with ⟨keptOther⟩
  rcases nonempty_orientedTwoPointSlice_of_inter_card_eq_one
      Gr.deletedOther_ne hdeletedCard with ⟨deletedOther⟩
  have hkeptInsideShell :
      keptOther.inside ∈
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    rcases keptOther.source_order with ⟨hinside, _⟩ | ⟨hinside, _⟩
    · rw [hinside]
      exact Gr.keptOtherFirst_mem_keptShell
    · rw [hinside]
      exact Gr.keptOtherSecond_mem_keptShell
  have hkeptInsideClass :
      keptOther.inside ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    rcases keptOther.source_order with ⟨hinside, _⟩ | ⟨hinside, _⟩
    · rw [hinside]
      exact Gr.keptOtherFirst_mem_other
    · rw [hinside]
      exact Gr.keptOtherSecond_mem_other
  have hkeptShell :
      keptOther.escape ∈
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    rcases keptOther.source_order with ⟨_, hescape⟩ | ⟨_, hescape⟩
    · rw [hescape]
      exact Gr.keptOtherSecond_mem_keptShell
    · rw [hescape]
      exact Gr.keptOtherFirst_mem_keptShell
  have hkeptClass :
      keptOther.escape ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    rcases keptOther.source_order with ⟨_, hescape⟩ | ⟨_, hescape⟩
    · rw [hescape]
      exact Gr.keptOtherSecond_mem_other
    · rw [hescape]
      exact Gr.keptOtherFirst_mem_other
  have hdeletedInsideShell :
      deletedOther.inside ∈
        (H.selectedAt O.deleted
          O.deleted_mem_A).toCriticalFourShell.support := by
    rcases deletedOther.source_order with ⟨hinside, _⟩ | ⟨hinside, _⟩
    · rw [hinside]
      exact Gr.deletedOtherFirst_mem_deletedShell
    · rw [hinside]
      exact Gr.deletedOtherSecond_mem_deletedShell
  have hdeletedInsideClass :
      deletedOther.inside ∈
        SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    rcases deletedOther.source_order with ⟨hinside, _⟩ | ⟨hinside, _⟩
    · rw [hinside]
      exact Gr.deletedOtherFirst_mem_other
    · rw [hinside]
      exact Gr.deletedOtherSecond_mem_other
  have hdeletedShell :
      deletedOther.escape ∈
        (H.selectedAt O.deleted
          O.deleted_mem_A).toCriticalFourShell.support := by
    rcases deletedOther.source_order with ⟨_, hescape⟩ | ⟨_, hescape⟩
    · rw [hescape]
      exact Gr.deletedOtherSecond_mem_deletedShell
    · rw [hescape]
      exact Gr.deletedOtherFirst_mem_deletedShell
  have hdeletedClass :
      deletedOther.escape ∈
        SelectedClass D.A S.oppApex1 Gr.otherRadius := by
    rcases deletedOther.source_order with ⟨_, hescape⟩ | ⟨_, hescape⟩
    · rw [hescape]
      exact Gr.deletedOtherSecond_mem_other
    · rw [hescape]
      exact Gr.deletedOtherFirst_mem_other
  refine ⟨{
    keptOther := keptOther
    deletedOther := deletedOther
    keptOther_inside_mem_shell := hkeptInsideShell
    keptOther_inside_mem_class := hkeptInsideClass
    keptOther_escape_mem_shell := hkeptShell
    keptOther_escape_mem_class := hkeptClass
    deletedOther_inside_mem_shell := hdeletedInsideShell
    deletedOther_inside_mem_class := hdeletedInsideClass
    deletedOther_escape_mem_shell := hdeletedShell
    deletedOther_escape_mem_class := hdeletedClass
    retainedEscape_orientation :=
      grid_retainedPartners_mem_distinct_adjacentCaps place
    otherEscape_orientation := ?_ }⟩
  exact class_outside_pair_distinct_adjacentCaps Gr.otherRadius_pos
    hkeptClass hdeletedClass keptOther.escape_not_mem
    deletedOther.escape_not_mem
    (Gr.ne_of_mem_keptShell_of_mem_deletedShell hkeptShell hdeletedShell)

/-- Choose the smaller grid radius and then choose as primary the retained
shell whose smaller-radius escape lies in the left adjacent cap.  The packet
keeps both reflected pairs of that shell and the smaller-radius escape of the
other shell.  No cross-radius escape synchronization is assumed here. -/
private structure PairedGridNestedPrimary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O) {place : PairedGridCapPlacement Gr}
    (labels : PairedGridOrientedLabels Gr place) where
  source : ℝ²
  source_mem_A : source ∈ D.A
  otherSource : ℝ²
  otherSource_mem_A : otherSource ∈ D.A
  source_ne_otherSource : source ≠ otherSource
  smallRadius : ℝ
  largeRadius : ℝ
  smallRadius_pos : 0 < smallRadius
  smallRadius_lt_largeRadius : smallRadius < largeRadius
  smallInside : ℝ²
  smallEscape : ℝ²
  largeInside : ℝ²
  largeEscape : ℝ²
  otherSmallEscape : ℝ²
  smallInside_mem_capInterior :
    smallInside ∈ S.capInteriorByIndex S.oppIndex1
  largeInside_mem_capInterior :
    largeInside ∈ S.capInteriorByIndex S.oppIndex1
  largeEscape_not_mem_capInterior :
    largeEscape ∉ S.capInteriorByIndex S.oppIndex1
  smallEscape_not_mem_capInterior :
    smallEscape ∉ S.capInteriorByIndex S.oppIndex1
  smallEscape_mem_left :
    smallEscape ∈ S.leftAdjacentCapByIndex S.oppIndex1
  otherSmallEscape_mem_right :
    otherSmallEscape ∈ S.rightAdjacentCapByIndex S.oppIndex1
  smallInside_mem_smallClass :
    smallInside ∈ SelectedClass D.A S.oppApex1 smallRadius
  smallEscape_mem_smallClass :
    smallEscape ∈ SelectedClass D.A S.oppApex1 smallRadius
  otherSmallEscape_mem_smallClass :
    otherSmallEscape ∈ SelectedClass D.A S.oppApex1 smallRadius
  largeInside_mem_largeClass :
    largeInside ∈ SelectedClass D.A S.oppApex1 largeRadius
  largeEscape_mem_largeClass :
    largeEscape ∈ SelectedClass D.A S.oppApex1 largeRadius
  smallInside_mem_primaryShell :
    smallInside ∈
      (H.selectedAt source source_mem_A).toCriticalFourShell.support
  smallEscape_mem_primaryShell :
    smallEscape ∈
      (H.selectedAt source source_mem_A).toCriticalFourShell.support
  largeInside_mem_primaryShell :
    largeInside ∈
      (H.selectedAt source source_mem_A).toCriticalFourShell.support
  largeEscape_mem_primaryShell :
    largeEscape ∈
      (H.selectedAt source source_mem_A).toCriticalFourShell.support
  otherSmallEscape_mem_otherShell :
    otherSmallEscape ∈
      (H.selectedAt otherSource otherSource_mem_A).toCriticalFourShell.support
  shells_disjoint :
    Disjoint
      (H.selectedAt source source_mem_A).toCriticalFourShell.support
      (H.selectedAt otherSource otherSource_mem_A).toCriticalFourShell.support
  smallPair_ne : smallInside ≠ smallEscape
  largePair_ne : largeInside ≠ largeEscape

/-- The radius comparison and the two already-checked adjacent-cap
orientations construct a primary nested-shell packet in four typed cases. -/
private theorem nonempty_pairedGridNestedPrimary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    (labels : PairedGridOrientedLabels Gr place) :
    Nonempty (PairedGridNestedPrimary Gr labels) := by
  rcases lt_or_gt_of_ne Gr.otherRadius_ne_radius.symm with hrlt | hotherlt
  · rcases labels.retainedEscape_orientation with hcaps | hcaps
    · exact ⟨{
        source := O.kept
        source_mem_A := O.kept_mem_A
        otherSource := O.deleted
        otherSource_mem_A := O.deleted_mem_A
        source_ne_otherSource := O.sources_ne
        smallRadius := radius
        largeRadius := Gr.otherRadius
        smallRadius_pos := F.radius_pos
        smallRadius_lt_largeRadius := hrlt
        smallInside := O.kept
        smallEscape := Gr.keptPartner
        largeInside := labels.keptOther.inside
        largeEscape := labels.keptOther.escape
        otherSmallEscape := Gr.deletedPartner
        smallInside_mem_capInterior := O.kept_mem_capInterior
        largeInside_mem_capInterior := labels.keptOther.inside_mem
        largeEscape_not_mem_capInterior := labels.keptOther.escape_not_mem
        smallEscape_not_mem_capInterior := place.keptPartner_not_mem_capInterior
        smallEscape_mem_left := hcaps.1
        otherSmallEscape_mem_right := hcaps.2
        smallInside_mem_smallClass := O.kept_mem_radius
        smallEscape_mem_smallClass := Gr.keptPartner_mem_retained
        otherSmallEscape_mem_smallClass := Gr.deletedPartner_mem_retained
        largeInside_mem_largeClass := labels.keptOther_inside_mem_class
        largeEscape_mem_largeClass := labels.keptOther_escape_mem_class
        smallInside_mem_primaryShell := Gr.kept_mem_keptShell
        smallEscape_mem_primaryShell := Gr.keptPartner_mem_keptShell
        largeInside_mem_primaryShell := labels.keptOther_inside_mem_shell
        largeEscape_mem_primaryShell := labels.keptOther_escape_mem_shell
        otherSmallEscape_mem_otherShell := Gr.deletedPartner_mem_deletedShell
        shells_disjoint := Gr.shells_disjoint
        smallPair_ne := Gr.keptPartner_ne_kept.symm
        largePair_ne := labels.keptOther.inside_ne_escape Gr.keptOther_ne }⟩
    · exact ⟨{
        source := O.deleted
        source_mem_A := O.deleted_mem_A
        otherSource := O.kept
        otherSource_mem_A := O.kept_mem_A
        source_ne_otherSource := O.sources_ne.symm
        smallRadius := radius
        largeRadius := Gr.otherRadius
        smallRadius_pos := F.radius_pos
        smallRadius_lt_largeRadius := hrlt
        smallInside := O.deleted
        smallEscape := Gr.deletedPartner
        largeInside := labels.deletedOther.inside
        largeEscape := labels.deletedOther.escape
        otherSmallEscape := Gr.keptPartner
        smallInside_mem_capInterior := O.deleted_mem_capInterior
        largeInside_mem_capInterior := labels.deletedOther.inside_mem
        largeEscape_not_mem_capInterior := labels.deletedOther.escape_not_mem
        smallEscape_not_mem_capInterior := place.deletedPartner_not_mem_capInterior
        smallEscape_mem_left := hcaps.2
        otherSmallEscape_mem_right := hcaps.1
        smallInside_mem_smallClass := O.deleted_mem_radius
        smallEscape_mem_smallClass := Gr.deletedPartner_mem_retained
        otherSmallEscape_mem_smallClass := Gr.keptPartner_mem_retained
        largeInside_mem_largeClass := labels.deletedOther_inside_mem_class
        largeEscape_mem_largeClass := labels.deletedOther_escape_mem_class
        smallInside_mem_primaryShell := Gr.deleted_mem_deletedShell
        smallEscape_mem_primaryShell := Gr.deletedPartner_mem_deletedShell
        largeInside_mem_primaryShell := labels.deletedOther_inside_mem_shell
        largeEscape_mem_primaryShell := labels.deletedOther_escape_mem_shell
        otherSmallEscape_mem_otherShell := Gr.keptPartner_mem_keptShell
        shells_disjoint := Gr.shells_disjoint.symm
        smallPair_ne := Gr.deletedPartner_ne_deleted.symm
        largePair_ne := labels.deletedOther.inside_ne_escape Gr.deletedOther_ne }⟩
  · rcases labels.otherEscape_orientation with hcaps | hcaps
    · exact ⟨{
        source := O.kept
        source_mem_A := O.kept_mem_A
        otherSource := O.deleted
        otherSource_mem_A := O.deleted_mem_A
        source_ne_otherSource := O.sources_ne
        smallRadius := Gr.otherRadius
        largeRadius := radius
        smallRadius_pos := Gr.otherRadius_pos
        smallRadius_lt_largeRadius := hotherlt
        smallInside := labels.keptOther.inside
        smallEscape := labels.keptOther.escape
        largeInside := O.kept
        largeEscape := Gr.keptPartner
        otherSmallEscape := labels.deletedOther.escape
        smallInside_mem_capInterior := labels.keptOther.inside_mem
        largeInside_mem_capInterior := O.kept_mem_capInterior
        largeEscape_not_mem_capInterior := place.keptPartner_not_mem_capInterior
        smallEscape_not_mem_capInterior := labels.keptOther.escape_not_mem
        smallEscape_mem_left := hcaps.1
        otherSmallEscape_mem_right := hcaps.2
        smallInside_mem_smallClass := labels.keptOther_inside_mem_class
        smallEscape_mem_smallClass := labels.keptOther_escape_mem_class
        otherSmallEscape_mem_smallClass := labels.deletedOther_escape_mem_class
        largeInside_mem_largeClass := O.kept_mem_radius
        largeEscape_mem_largeClass := Gr.keptPartner_mem_retained
        smallInside_mem_primaryShell := labels.keptOther_inside_mem_shell
        smallEscape_mem_primaryShell := labels.keptOther_escape_mem_shell
        largeInside_mem_primaryShell := Gr.kept_mem_keptShell
        largeEscape_mem_primaryShell := Gr.keptPartner_mem_keptShell
        otherSmallEscape_mem_otherShell := labels.deletedOther_escape_mem_shell
        shells_disjoint := Gr.shells_disjoint
        smallPair_ne := labels.keptOther.inside_ne_escape Gr.keptOther_ne
        largePair_ne := Gr.keptPartner_ne_kept.symm }⟩
    · exact ⟨{
        source := O.deleted
        source_mem_A := O.deleted_mem_A
        otherSource := O.kept
        otherSource_mem_A := O.kept_mem_A
        source_ne_otherSource := O.sources_ne.symm
        smallRadius := Gr.otherRadius
        largeRadius := radius
        smallRadius_pos := Gr.otherRadius_pos
        smallRadius_lt_largeRadius := hotherlt
        smallInside := labels.deletedOther.inside
        smallEscape := labels.deletedOther.escape
        largeInside := O.deleted
        largeEscape := Gr.deletedPartner
        otherSmallEscape := labels.keptOther.escape
        smallInside_mem_capInterior := labels.deletedOther.inside_mem
        largeInside_mem_capInterior := O.deleted_mem_capInterior
        largeEscape_not_mem_capInterior := place.deletedPartner_not_mem_capInterior
        smallEscape_not_mem_capInterior := labels.deletedOther.escape_not_mem
        smallEscape_mem_left := hcaps.2
        otherSmallEscape_mem_right := hcaps.1
        smallInside_mem_smallClass := labels.deletedOther_inside_mem_class
        smallEscape_mem_smallClass := labels.deletedOther_escape_mem_class
        otherSmallEscape_mem_smallClass := labels.keptOther_escape_mem_class
        largeInside_mem_largeClass := O.deleted_mem_radius
        largeEscape_mem_largeClass := Gr.deletedPartner_mem_retained
        smallInside_mem_primaryShell := labels.deletedOther_inside_mem_shell
        smallEscape_mem_primaryShell := labels.deletedOther_escape_mem_shell
        largeInside_mem_primaryShell := Gr.deleted_mem_deletedShell
        largeEscape_mem_primaryShell := Gr.deletedPartner_mem_deletedShell
        otherSmallEscape_mem_otherShell := labels.keptOther_escape_mem_shell
        shells_disjoint := Gr.shells_disjoint.symm
        smallPair_ne := labels.deletedOther.inside_ne_escape Gr.deletedOther_ne
        largePair_ne := Gr.deletedPartner_ne_deleted.symm }⟩

private theorem PairedGridNestedPrimary.apex_ne_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    {labels : PairedGridOrientedLabels Gr place}
    (Q : PairedGridNestedPrimary Gr labels) :
    S.oppApex1 ≠ H.centerAt Q.source Q.source_mem_A := by
  intro hcenter
  have hshellDist :
      dist (H.centerAt Q.source Q.source_mem_A) Q.smallInside =
        dist (H.centerAt Q.source Q.source_mem_A) Q.largeInside := by
    exact
      ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.smallInside Q.smallInside_mem_primaryShell).trans
        ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.largeInside Q.largeInside_mem_primaryShell).symm
  have hradii : Q.smallRadius = Q.largeRadius := by
    calc
      Q.smallRadius = dist S.oppApex1 Q.smallInside :=
        (mem_selectedClass.mp Q.smallInside_mem_smallClass).2.symm
      _ = dist S.oppApex1 Q.largeInside := by simpa [hcenter] using hshellDist
      _ = Q.largeRadius :=
        (mem_selectedClass.mp Q.largeInside_mem_largeClass).2
  exact (ne_of_lt Q.smallRadius_lt_largeRadius) hradii

private theorem PairedGridNestedPrimary.smallPair_scaledCoordinates
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    {labels : PairedGridOrientedLabels Gr place}
    (Q : PairedGridNestedPrimary Gr labels) :
    scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallInside =
        scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallEscape ∧
      scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallInside =
        -scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallEscape := by
  apply scaledCoordinates_reflect_of_equidistant_of_signedArea2_eq_neg
  · simpa only [dist_comm] using
      (mem_selectedClass.mp Q.smallInside_mem_smallClass).2.trans
        (mem_selectedClass.mp Q.smallEscape_mem_smallClass).2.symm
  · simpa only [dist_comm] using
      ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.smallInside Q.smallInside_mem_primaryShell).trans
        ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.smallEscape Q.smallEscape_mem_primaryShell).symm
  · exact shellClassPair_sep Q.source_mem_A
      Q.smallInside_mem_primaryShell Q.smallEscape_mem_primaryShell
      Q.smallInside_mem_smallClass Q.smallEscape_mem_smallClass Q.smallPair_ne

private theorem PairedGridNestedPrimary.largePair_scaledCoordinates
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    {labels : PairedGridOrientedLabels Gr place}
    (Q : PairedGridNestedPrimary Gr labels) :
    scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.largeInside =
        scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.largeEscape ∧
      scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.largeInside =
        -scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.largeEscape := by
  apply scaledCoordinates_reflect_of_equidistant_of_signedArea2_eq_neg
  · simpa only [dist_comm] using
      (mem_selectedClass.mp Q.largeInside_mem_largeClass).2.trans
        (mem_selectedClass.mp Q.largeEscape_mem_largeClass).2.symm
  · simpa only [dist_comm] using
      ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.largeInside Q.largeInside_mem_primaryShell).trans
        ((H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell.support_eq_radius
          Q.largeEscape Q.largeEscape_mem_primaryShell).symm
  · exact shellClassPair_sep Q.source_mem_A
      Q.largeInside_mem_primaryShell Q.largeEscape_mem_primaryShell
      Q.largeInside_mem_largeClass Q.largeEscape_mem_largeClass Q.largePair_ne

private theorem PairedGridNestedPrimary.smallRadius_scaledNorm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    {labels : PairedGridOrientedLabels Gr place}
    (Q : PairedGridNestedPrimary Gr labels) :
    scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.otherSmallEscape ^ 2 +
        scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.otherSmallEscape ^ 2 =
      scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallInside ^ 2 +
        scaledTransverseCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallInside ^ 2 := by
  rw [scaledCoordinate_norm_sq, scaledCoordinate_norm_sq]
  have hdist :
      ‖Q.otherSmallEscape - S.oppApex1‖ =
        ‖Q.smallInside - S.oppApex1‖ := by
    rw [← dist_eq_norm, ← dist_eq_norm, dist_comm Q.otherSmallEscape,
      dist_comm Q.smallInside,
      (mem_selectedClass.mp Q.otherSmallEscape_mem_smallClass).2,
      (mem_selectedClass.mp Q.smallInside_mem_smallClass).2]
  rw [hdist]

private theorem eq_of_mem_of_mem_of_card_eq_one
    {T : Finset ℝ²} (hcard : T.card = 1) {x y : ℝ²}
    (hx : x ∈ T) (hy : y ∈ T) :
    x = y := by
  obtain ⟨z, rfl⟩ := Finset.card_eq_one.mp hcard
  exact (Finset.mem_singleton.mp hx).trans (Finset.mem_singleton.mp hy).symm

/-- Identify the abstract representatives supplied by the public adjacent-grid
API with the D2 grid's typed escape labels.  Singleton-cell uniqueness is what
makes the identification insensitive to the choices used by `FourHits.exists`.
-/
private theorem pairedGrid_fourHits_identification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {Gr : PairedTwoRadiusGrid O} {place : PairedGridCapPlacement Gr}
    (labels : PairedGridOrientedLabels Gr place)
    {grid : S.ExactFourTwoRadiusAdjacentCapGrid
      S.oppIndex1 radius Gr.otherRadius}
    (hits : ExactFourAdjacentGridKalmanson.FourHits grid) :
    ((hits.radiusLeft = Gr.keptPartner ∧
        hits.radiusRight = Gr.deletedPartner) ∨
      (hits.radiusLeft = Gr.deletedPartner ∧
        hits.radiusRight = Gr.keptPartner)) ∧
    ((hits.rhoLeft = labels.keptOther.escape ∧
        hits.rhoRight = labels.deletedOther.escape) ∨
      (hits.rhoLeft = labels.deletedOther.escape ∧
        hits.rhoRight = labels.keptOther.escape)) := by
  constructor
  · rcases labels.retainedEscape_orientation with h | h
    · left
      constructor
      · exact eq_of_mem_of_mem_of_card_eq_one grid.radius_left_card_eq_one
          hits.radiusLeft_mem
          (Finset.mem_inter.mpr ⟨by simpa using Gr.keptPartner_mem_retained, h.1⟩)
      · exact eq_of_mem_of_mem_of_card_eq_one grid.radius_right_card_eq_one
          hits.radiusRight_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using Gr.deletedPartner_mem_retained, h.2⟩)
    · right
      constructor
      · exact eq_of_mem_of_mem_of_card_eq_one grid.radius_left_card_eq_one
          hits.radiusLeft_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using Gr.deletedPartner_mem_retained, h.2⟩)
      · exact eq_of_mem_of_mem_of_card_eq_one grid.radius_right_card_eq_one
          hits.radiusRight_mem
          (Finset.mem_inter.mpr ⟨by simpa using Gr.keptPartner_mem_retained, h.1⟩)
  · rcases labels.otherEscape_orientation with h | h
    · left
      constructor
      · exact eq_of_mem_of_mem_of_card_eq_one grid.rho_left_card_eq_one
          hits.rhoLeft_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using labels.keptOther_escape_mem_class, h.1⟩)
      · exact eq_of_mem_of_mem_of_card_eq_one grid.rho_right_card_eq_one
          hits.rhoRight_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using labels.deletedOther_escape_mem_class, h.2⟩)
    · right
      constructor
      · exact eq_of_mem_of_mem_of_card_eq_one grid.rho_left_card_eq_one
          hits.rhoLeft_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using labels.deletedOther_escape_mem_class, h.2⟩)
      · exact eq_of_mem_of_mem_of_card_eq_one grid.rho_right_card_eq_one
          hits.rhoRight_mem
          (Finset.mem_inter.mpr
            ⟨by simpa using labels.keptOther_escape_mem_class, h.1⟩)

/-- Scaled-coordinate reflection for two hits in one shell and one apex
class. This is the D2 coordinate adapter before any cap or radius ordering is
chosen. -/
private theorem shellPair_scaledCoordinates
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {w : ℝ²} (hw : w ∈ D.A) {p u v : ℝ²} {r : ℝ}
    (hu : u ∈ (H.selectedAt w hw).toCriticalFourShell.support)
    (hv : v ∈ (H.selectedAt w hw).toCriticalFourShell.support)
    (huClass : u ∈ SelectedClass D.A p r)
    (hvClass : v ∈ SelectedClass D.A p r)
    (huv : u ≠ v) :
    scaledLongitudinalCoord p (H.centerAt w hw) u =
        scaledLongitudinalCoord p (H.centerAt w hw) v ∧
      scaledTransverseCoord p (H.centerAt w hw) u =
        -scaledTransverseCoord p (H.centerAt w hw) v := by
  apply scaledCoordinates_reflect_of_equidistant_of_signedArea2_eq_neg
  · simpa only [dist_comm] using
      (mem_selectedClass.mp huClass).2.trans
        (mem_selectedClass.mp hvClass).2.symm
  · simpa only [dist_comm] using
      ((H.selectedAt w hw).toCriticalFourShell.support_eq_radius u hu).trans
        ((H.selectedAt w hw).toCriticalFourShell.support_eq_radius v hv).symm
  · exact shellClassPair_sep hw hu hv huClass hvClass huv

/-- A reverse hit leaves a point of the retained first-apex class outside both
retained critical shells.  Indeed, each shell meets that class in at most two
points, while `O.kept` belongs to both intersections; their union therefore
has cardinality at most three, whereas the frontier class has at least four
points.  Deleting the escaping point preserves K4 at the robust first apex and
at both retained blockers. -/
theorem nonempty_pairedApexClassJointDeletion_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    Nonempty (PairedApexClassJointDeletion O) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  let K :=
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∩ C
  let M :=
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩ C
  have hKcard : K.card ≤ 2 := by
    simpa only [K, C] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        R O.kept O.kept_mem_A
  have hMcard : M.card ≤ 2 := by
    simpa only [M, C] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        R O.deleted O.deleted_mem_A
  have hcommon : O.kept ∈ K ∩ M := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.q_mem_support,
          O.kept_mem_radius⟩
    · exact Finset.mem_inter.mpr ⟨reverse_mem, O.kept_mem_radius⟩
  have hinterPos : 0 < (K ∩ M).card :=
    Finset.card_pos.mpr ⟨O.kept, hcommon⟩
  have hcardIdentity := Finset.card_union_add_card_inter K M
  have hunionCard : (K ∪ M).card ≤ 3 := by
    omega
  have hnotSubset : ¬ C ⊆ K ∪ M := by
    intro hsubset
    have hcardLe := Finset.card_le_card hsubset
    have hCcard : 4 ≤ C.card := by
      simpa only [C] using R.frontierRadius_class_card_ge_four
    omega
  rcases Finset.not_subset.mp hnotSubset with
    ⟨source, hsourceClass, hsourceOutside⟩
  have hsourceNotKept :
      source ∉
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    intro hsource
    apply hsourceOutside
    exact Finset.mem_union.mpr
      (Or.inl (Finset.mem_inter.mpr ⟨hsource, hsourceClass⟩))
  have hsourceNotDeleted :
      source ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    intro hsource
    apply hsourceOutside
    exact Finset.mem_union.mpr
      (Or.inr (Finset.mem_inter.mpr ⟨hsource, hsourceClass⟩))
  have hsourceA : source ∈ D.A :=
    (mem_selectedClass.mp hsourceClass).1
  have hfirstSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives source hsourceA
  have hkeptSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt O.kept O.kept_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.kept_mem_A).mpr hsourceNotKept
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA (oppApex1_mem_A_for_reverseHit S) O.packet.center₂_mem_A
      O.packet.centers_ne hfirstSurvives hkeptSurvives with
    ⟨keptPacket⟩
  have hdeletedBlockerA :
      H.centerAt O.deleted O.deleted_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt O.deleted
        O.deleted_mem_A).toCriticalFourShell.center_mem).2
  have hdeletedCentersNe :
      S.oppApex1 ≠ H.centerAt O.deleted O.deleted_mem_A :=
    (R.actualBlocker_ne_firstApex O.deleted O.deleted_mem_A).symm
  have hdeletedSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt O.deleted O.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.deleted_mem_A).mpr hsourceNotDeleted
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA (oppApex1_mem_A_for_reverseHit S) hdeletedBlockerA
      hdeletedCentersNe hfirstSurvives hdeletedSurvives with
    ⟨deletedPacket⟩
  exact ⟨{
    sourceRadius := radius
    sourceRadius_pos := F.radius_pos
    sourceClass_card_ge_four := R.frontierRadius_class_card_ge_four
    source := source
    source_mem_class := hsourceClass
    source_not_mem_keptShell := hsourceNotKept
    source_not_mem_deletedShell := hsourceNotDeleted
    keptPacket := keptPacket
    deletedPacket := deletedPacket }⟩

/- ### Positive controls for the paired common-deletion leaf

The lemmas in this section are kernel-checked infrastructure for
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`.
None of them closes that leaf or narrows its recorded obligation measure.
The leaf consumes each of them in its proof prefix so that the publish spine
records them.  See
`docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md`,
Phase 1. -/

section TriApexLeafControls

open ATailTriApexFourWitness ATailApexRichFourWitness

/-- A subset of one interior radius slice inherits the slice's one-hit bound
against a shell support. -/
theorem inter_card_le_one_of_subset_of_inter_card_le_one
    {T K L : Finset ℝ²} (hT : T ⊆ L) (hKL : (K ∩ L).card ≤ 1) :
    (T ∩ K).card ≤ 1 := by
  refine le_trans (Finset.card_le_card ?_) hKL
  intro z hz
  rcases Finset.mem_inter.mp hz with ⟨hzT, hzK⟩
  exact Finset.mem_inter.mpr ⟨hzK, hT hzT⟩

/-- A four-point set meeting two sets in at most one point each keeps at
least two points outside their union. -/
theorem two_le_card_sdiff_union_of_card_four
    {T K₁ K₂ : Finset ℝ²} (hT : T.card = 4)
    (h₁ : (T ∩ K₁).card ≤ 1) (h₂ : (T ∩ K₂).card ≤ 1) :
    2 ≤ (T \ (K₁ ∪ K₂)).card := by
  have hsplit := Finset.card_sdiff_add_card_inter T (K₁ ∪ K₂)
  rw [Finset.inter_union_distrib_left] at hsplit
  have hle := Finset.card_union_le (T ∩ K₁) (T ∩ K₂)
  omega

/-- Two distinct points of a set outside `K` give at least two points of the
set outside `K`. -/
theorem two_le_card_sdiff_of_pair
    {T K : Finset ℝ²} {x y : ℝ²} (hx : x ∈ T) (hy : y ∈ T) (hxy : x ≠ y)
    (hxK : x ∉ K) (hyK : y ∉ K) :
    2 ≤ (T \ K).card := by
  have hsub : ({x, y} : Finset ℝ²) ⊆ T \ K := by
    intro z hz
    rcases Finset.mem_insert.mp hz with hzx | hzy
    · subst hzx
      exact Finset.mem_sdiff.mpr ⟨hx, hxK⟩
    · rw [Finset.mem_singleton] at hzy
      subst hzy
      exact Finset.mem_sdiff.mpr ⟨hy, hyK⟩
  calc
    2 = ({x, y} : Finset ℝ²).card := (Finset.card_pair hxy).symm
    _ ≤ (T \ K).card := Finset.card_le_card hsub

/-- Safe-count classification of a strict apex four-witness that carries two
distinct points outside a set `K`.  The one-radius arm keeps at least two of
its four points outside `K`; the two-radii arm keeps at least two points
outside `K` across its two two-point slices. -/
theorem strictApexFourWitness_safe_counts_of_pair
    {A : Finset ℝ²} {S : SurplusCapPacket A} {j : Fin 3}
    (Wj : StrictApexFourWitness A S j) (K : Finset ℝ²) {x y : ℝ²}
    (hx : x ∈ Wj.support) (hy : y ∈ Wj.support) (hxy : x ≠ y)
    (hxK : x ∉ K) (hyK : y ∉ K) :
    (∃ (r : ℝ) (T : Finset ℝ²), 0 < r ∧
        T ⊆ SelectedClass A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j ∧
        T.card = 4 ∧ Wj.support = T ∧ 2 ≤ (T \ K).card) ∨
    (∃ (r₁ r₂ : ℝ) (T₁ T₂ : Finset ℝ²), 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
        T₁ ⊆ SelectedClass A (S.oppositeVertexByIndex j) r₁ ∩
          S.capInteriorByIndex j ∧
        T₂ ⊆ SelectedClass A (S.oppositeVertexByIndex j) r₂ ∩
          S.capInteriorByIndex j ∧
        T₁.card = 2 ∧ T₂.card = 2 ∧ Wj.support = T₁ ∪ T₂ ∧
        2 ≤ (T₁ \ K).card + (T₂ \ K).card) := by
  have hpair := two_le_card_sdiff_of_pair hx hy hxy hxK hyK
  cases Wj with
  | oneRadius r hr T hT hcard =>
      left
      exact ⟨r, T, hr, hT, hcard, rfl, hpair⟩
  | twoRadii r₁ r₂ hr₁ hr₂ hne T₁ T₂ hT₁ hT₂ hcard₁ hcard₂ =>
      right
      refine ⟨r₁, r₂, T₁, T₂, hr₁, hr₂, hne, hT₁, hT₂, hcard₁, hcard₂, rfl, ?_⟩
      have hsplit : (T₁ ∪ T₂) \ K = (T₁ \ K) ∪ (T₂ \ K) :=
        Finset.union_sdiff_distrib T₁ T₂ K
      have hle := Finset.card_union_le (T₁ \ K) (T₂ \ K)
      change 2 ≤ ((T₁ ∪ T₂) \ K).card at hpair
      rw [hsplit] at hpair
      omega

/-- Safe-slice bounds of a strict apex four-witness at a cap in which two
shell supports each meet every interior radius slice at most once.  The
one-radius arm keeps at least two points outside both supports; in the
two-radii arm each support meets each two-point slice at most once, so a
slice may lose both of its points. -/
theorem strictApexFourWitness_safe_counts_of_oneHit
    {A : Finset ℝ²} {S : SurplusCapPacket A} {j : Fin 3}
    (Wj : StrictApexFourWitness A S j) (K₁ K₂ : Finset ℝ²)
    (h₁ : ∀ r : ℝ,
      (K₁ ∩ (SelectedClass A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card ≤ 1)
    (h₂ : ∀ r : ℝ,
      (K₂ ∩ (SelectedClass A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card ≤ 1) :
    (∃ (r : ℝ) (T : Finset ℝ²), 0 < r ∧
        T ⊆ SelectedClass A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j ∧
        T.card = 4 ∧ Wj.support = T ∧ 2 ≤ (T \ (K₁ ∪ K₂)).card) ∨
    (∃ (r₁ r₂ : ℝ) (T₁ T₂ : Finset ℝ²), 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
        T₁ ⊆ SelectedClass A (S.oppositeVertexByIndex j) r₁ ∩
          S.capInteriorByIndex j ∧
        T₂ ⊆ SelectedClass A (S.oppositeVertexByIndex j) r₂ ∩
          S.capInteriorByIndex j ∧
        T₁.card = 2 ∧ T₂.card = 2 ∧ Wj.support = T₁ ∪ T₂ ∧
        (T₁ ∩ K₁).card ≤ 1 ∧ (T₁ ∩ K₂).card ≤ 1 ∧
        (T₂ ∩ K₁).card ≤ 1 ∧ (T₂ ∩ K₂).card ≤ 1) := by
  cases Wj with
  | oneRadius r hr T hT hcard =>
      left
      exact ⟨r, T, hr, hT, hcard, rfl,
        two_le_card_sdiff_union_of_card_four hcard
          (inter_card_le_one_of_subset_of_inter_card_le_one hT (h₁ r))
          (inter_card_le_one_of_subset_of_inter_card_le_one hT (h₂ r))⟩
  | twoRadii r₁ r₂ hr₁ hr₂ hne T₁ T₂ hT₁ hT₂ hcard₁ hcard₂ =>
      right
      exact ⟨r₁, r₂, T₁, T₂, hr₁, hr₂, hne, hT₁, hT₂, hcard₁, hcard₂, rfl,
        inter_card_le_one_of_subset_of_inter_card_le_one hT₁ (h₁ r₁),
        inter_card_le_one_of_subset_of_inter_card_le_one hT₁ (h₂ r₁),
        inter_card_le_one_of_subset_of_inter_card_le_one hT₂ (h₁ r₂),
        inter_card_le_one_of_subset_of_inter_card_le_one hT₂ (h₂ r₂)⟩

/-- Two carrier points have cap-localized canonical blockers, and some cap
index avoids both.  At that index each canonical shell meets every interior
radius slice in at most one point. -/
theorem exists_capIndex_avoiding_two_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x y : ℝ²} (hx : x ∈ D.A) (hy : y ∈ D.A) :
    ∃ ix iy j : Fin 3,
      H.centerAt x hx ∈ S.capInteriorByIndex ix ∧
      H.centerAt y hy ∈ S.capInteriorByIndex iy ∧
      ix ≠ j ∧ iy ≠ j ∧
      ∀ r : ℝ,
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1 ∧
        ((H.selectedAt y hy).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1 := by
  rcases exists_criticalShell_center_with_otherRichCapSlice_card_le_one G hx
    with ⟨ix, hcx, honex⟩
  rcases exists_criticalShell_center_with_otherRichCapSlice_card_le_one G hy
    with ⟨iy, hcy, honey⟩
  have hthird : ∀ a b : Fin 3, ∃ c : Fin 3, a ≠ c ∧ b ≠ c := by decide
  rcases hthird ix iy with ⟨j, hjx, hjy⟩
  exact ⟨ix, iy, j, hcx, hcy, hjx, hjy,
    fun r => ⟨honex j hjx r, honey j hjy r⟩⟩

/-- Every carrier point outside both retained canonical shells carries the
five-survive/one-fail deletion signature: its deletion preserves K4 at the
three rich apices and at both retained blockers, fails at its own canonical
blocker, and that blocker differs from the five surviving centres. -/
theorem deletionSignature_of_not_mem_two_retainedShells
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {q₁ q₂ : ℝ²} (hq₁ : q₁ ∈ D.A) (hq₂ : q₂ ∈ D.A)
    {x : ℝ²} (hx : x ∈ D.A)
    (hsafe :
      x ∉ retainedShellSupport H q₁ hq₁ ∪ retainedShellSupport H q₂ hq₂) :
    (∀ i : Fin 3,
        HasNEquidistantPointsAt 4 (D.A.erase x) (S.oppositeVertexByIndex i)) ∧
      HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₁ hq₁) ∧
      HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₂ hq₂) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt x hx) ∧
      (∀ i : Fin 3, H.centerAt x hx ≠ S.oppositeVertexByIndex i) ∧
      H.centerAt x hx ≠ H.centerAt q₁ hq₁ ∧
      H.centerAt x hx ≠ H.centerAt q₂ hq₂ := by
  have hnot₁ : x ∉ retainedShellSupport H q₁ hq₁ :=
    fun h => hsafe (Finset.mem_union.mpr (Or.inl h))
  have hnot₂ : x ∉ retainedShellSupport H q₂ hq₂ :=
    fun h => hsafe (Finset.mem_union.mpr (Or.inr h))
  have hapex : ∀ i : Fin 3,
      HasNEquidistantPointsAt 4 (D.A.erase x) (S.oppositeVertexByIndex i) :=
    fun i =>
      (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i)).survives
        x hx
  have hret₁ : HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₁ hq₁) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hq₁).mpr hnot₁
  have hret₂ : HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₂ hq₂) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hq₂).mpr hnot₂
  have hfail : ¬ HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt x hx) :=
    H.no_qfree_at x hx
  refine ⟨hapex, hret₁, hret₂, hfail, ?_, ?_, ?_⟩
  · intro i heq
    apply hfail
    rw [heq]
    exact hapex i
  · intro heq
    apply hfail
    rw [heq]
    exact hret₁
  · intro heq
    apply hfail
    rw [heq]
    exact hret₂

/-- Two of the four selected sources share one indexed cap, and both lie
outside both retained canonical shells. -/
theorem exists_index_safe_pair_of_fiveSurviveOneFail
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {q₁ q₂ : ℝ²}
    {hq₁ : q₁ ∈ D.A} {hq₂ : q₂ ∈ D.A}
    (Q : TriApexFiveSurviveOneFail S H q₁ q₂ hq₁ hq₂) :
    ∃ i : Fin 3, ∃ x y : ℝ², x ∈ Q.E ∧ y ∈ Q.E ∧ x ≠ y ∧
      x ∈ Q.W.supportAt i ∧ y ∈ Q.W.supportAt i ∧
      x ∉ retainedShellSupport H q₁ hq₁ ∪ retainedShellSupport H q₂ hq₂ ∧
      y ∉ retainedShellSupport H q₁ hq₁ ∪ retainedShellSupport H q₂ hq₂ := by
  rcases Q.exists_distinct_same_index with ⟨x, y, hx, hy, hxy, i, hxi, hyi⟩
  exact ⟨i, x, y, hx, hy, hxy, hxi, hyi,
    (Finset.mem_sdiff.mp (Q.E_subset hx)).2,
    (Finset.mem_sdiff.mp (Q.E_subset hy)).2⟩

/-- At carrier size fifteen with all three caps large, every strict apex
four-support is the whole strict interior of its cap. -/
theorem strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (G : TriApexAllLargeContext D S)
    (W : StrictApexFourFamily D.A S)
    (hcard : D.A.card = 15) (i : Fin 3) :
    W.supportAt i = S.capInteriorByIndex i := by
  apply Finset.eq_of_subset_of_card_le (W.supportAt_subset_capInterior i)
  rw [ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen
    S hcard G.cap_card_ge_six i]
  exact le_of_eq (W i).support_card_eq_four.symm

/-- The escaping source lies on a selected four-row at the first apex on its
own radius, and rich structure at that apex forces a mutually omitting pair on
that row with distinct canonical blockers.  Whether that pair differs from the
retained pair is not asserted here. -/
theorem exists_firstApex_mutualCrossDeletion_pair_through_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S) :
    ∃ K : SelectedFourClass D.A S.oppApex1,
      J.source ∈ K.support ∧ K.radius = J.sourceRadius ∧
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ K.support ∧ w.1 ∈ K.support ∧ z ≠ w ∧
        HasNEquidistantPointsAt 4 (D.A.erase w.1) (H.centerAt z.1 z.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1) (H.centerAt w.1 w.2) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  rcases
      ATailFirstApexCriticalFiberRow.nonempty_selectedFourClass_preserving_point
        J.sourceRadius_pos J.source_mem_class J.sourceClass_card_ge_four with
    ⟨K, hK⟩
  have hradius : K.radius = J.sourceRadius := by
    rw [← K.support_eq_radius J.source hK]
    exact (mem_selectedClass.mp J.source_mem_class).2
  have hfan := sourceFaithfulDeletionFan_of_triApexAllLargeContext (H := H) G K
  have hcenterNe : ∀ (w : ℝ²) (hw : w ∈ K.support),
      S.oppApex1 ≠ H.centerAt w (K.support_subset_A hw) := by
    intro w hw hcenter
    have hunique := isUniqueFourCenter_centerAt H w (K.support_subset_A hw)
    rw [← hcenter] at hunique
    exact not_isUniqueFourCenter_of_fullyDeletionRobust
      (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich S.oppIndex1))
      (by simpa using hunique)
  rcases exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
      K hfan hcenterNe with ⟨z, w, hz, hw, hzw, hzs, hws, hne⟩
  exact ⟨K, hK, hradius, z, w, hz, hw, hzw, hzs, hws, hne⟩

/-- In the oriented complete cap order of cap `i`, a slot lies in the strict
cap interior exactly when it is neither endpoint slot. -/
theorem orderedCap_points_mem_capInteriorByIndex_iff
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {m : ℕ} {L : CGN.OrderedCap m} (hm : 2 ≤ m)
    (hcap : Finset.univ.image L.points = S.capByIndex i)
    (hends :
      (L.points (CGN.firstIndex hm) = (S.triangleByIndex i).v2 ∧
          L.points (CGN.lastIndex hm) = (S.triangleByIndex i).v3) ∨
        (L.points (CGN.firstIndex hm) = (S.triangleByIndex i).v3 ∧
          L.points (CGN.lastIndex hm) = (S.triangleByIndex i).v2))
    (t : Fin m) :
    L.points t ∈ S.capInteriorByIndex i ↔
      t ≠ CGN.firstIndex hm ∧ t ≠ CGN.lastIndex hm := by
  constructor
  · intro ht
    have hv2 := S.capInteriorByIndex_ne_triangleByIndex_v2 ht
    have hv3 := S.capInteriorByIndex_ne_triangleByIndex_v3 ht
    rcases hends with ⟨hf, hl⟩ | ⟨hf, hl⟩
    · exact ⟨fun h => hv2 (by rw [← hf, h]), fun h => hv3 (by rw [← hl, h])⟩
    · exact ⟨fun h => hv3 (by rw [← hf, h]), fun h => hv2 (by rw [← hl, h])⟩
  · rintro ⟨hf, hl⟩
    have hcapMem : L.points t ∈ S.capByIndex i := by
      rw [← hcap]
      exact Finset.mem_image_of_mem L.points (Finset.mem_univ t)
    have hne2 : L.points t ≠ (S.triangleByIndex i).v2 := by
      intro h
      rcases hends with ⟨hf', _⟩ | ⟨_, hl'⟩
      · exact hf (L.injective (h.trans hf'.symm))
      · exact hl (L.injective (h.trans hl'.symm))
    have hne3 : L.points t ≠ (S.triangleByIndex i).v3 := by
      intro h
      rcases hends with ⟨_, hl'⟩ | ⟨hf', _⟩
      · exact hl (L.injective (h.trans hl'.symm))
      · exact hf (L.injective (h.trans hf'.symm))
    have hneRight : L.points t ≠ S.rightOuterVertexByIndex i := by
      fin_cases i <;>
        simpa [SurplusCapPacket.rightOuterVertexByIndex,
          SurplusCapPacket.triangleByIndex] using hne2
    have hneLeft : L.points t ≠ S.leftOuterVertexByIndex i := by
      fin_cases i <;>
        simpa [SurplusCapPacket.leftOuterVertexByIndex,
          SurplusCapPacket.triangleByIndex] using hne3
    exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i hcapMem
      hneRight hneLeft

/-- The slot count of a complete cap order is the closed cap cardinality. -/
theorem orderedCap_card_eq_of_image_eq_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {m : ℕ} {L : CGN.OrderedCap m}
    (hcap : Finset.univ.image L.points = S.capByIndex i) :
    m = (S.capByIndex i).card := by
  rw [← hcap, Finset.card_image_of_injective _ L.injective, Finset.card_univ,
    Fintype.card_fin]

/-- At carrier size fifteen with all caps large, the complete oriented cap
order of cap `i` has exactly six slots.  Its endpoint slots `0` and `5` are the
two Moser vertices of the cap, and its four consecutive middle slots `1..4`
enumerate the strict cap interior injectively. -/
theorem exists_orderedCap_six_of_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (G : TriApexAllLargeContext D S) (hcard : D.A.card = 15) (i : Fin 3) :
    ∃ (L : CGN.OrderedCap 6) (Packet : CGN.MecCapPacket D.A L)
      (_ : CGN.MinorCapSideHypotheses Packet)
      (_ : CGN.StrictCapOrder D.A L),
      Finset.univ.image L.points = S.capByIndex i ∧
      ((L.points 0 = (S.triangleByIndex i).v2 ∧
          L.points 5 = (S.triangleByIndex i).v3) ∨
        (L.points 0 = (S.triangleByIndex i).v3 ∧
          L.points 5 = (S.triangleByIndex i).v2)) ∧
      (∀ t : Fin 6, L.points t ∈ S.capInteriorByIndex i ↔ (t ≠ 0 ∧ t ≠ 5)) ∧
      Finset.univ.image (fun k : Fin 4 => L.points ⟨k.1 + 1, by omega⟩) =
        S.capInteriorByIndex i := by
  classical
  rcases S.capByIndex_cgn4g_capData_oriented D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap, hends⟩
  have hm6 : m = 6 := by
    rw [orderedCap_card_eq_of_image_eq_capByIndex S i hcap]
    exact ATailExactFifteenApexProfile.capByIndex_card_eq_six_of_card_eq_fifteen
      S hcard G.cap_card_ge_six i
  subst hm6
  have hfirst : CGN.firstIndex Packet.hm = (0 : Fin 6) := Fin.ext (by simp)
  have hlast : CGN.lastIndex Packet.hm = (5 : Fin 6) := Fin.ext (by simp)
  have hmem : ∀ t : Fin 6,
      L.points t ∈ S.capInteriorByIndex i ↔ (t ≠ 0 ∧ t ≠ 5) := by
    intro t
    rw [orderedCap_points_mem_capInteriorByIndex_iff S i Packet.hm hcap hends t,
      hfirst, hlast]
  refine ⟨L, Packet, Hside, Hord, hcap, ?_, hmem, ?_⟩
  · simpa [hfirst, hlast] using hends
  · apply Finset.eq_of_subset_of_card_le
    · intro x hx
      rcases Finset.mem_image.mp hx with ⟨k, _, rfl⟩
      exact (hmem _).mpr
        ⟨Fin.ne_of_val_ne (show k.1 + 1 ≠ 0 by omega),
          Fin.ne_of_val_ne (show k.1 + 1 ≠ 5 by omega)⟩
    · rw [ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen
        S hcard G.cap_card_ge_six i,
        Finset.card_image_of_injective _ (fun a b hab => Fin.ext (by
          have h := Fin.mk.inj_iff.mp (L.injective hab)
          omega)),
        Finset.card_univ, Fintype.card_fin]

end TriApexLeafControls

/-- Residual contradiction after the tri-apex witness count has produced four
strict sources with the full five-survive/one-fail deletion signature.

The producer is now checked.  This residual must consume its cap/radius
provenance; it must not repackage non-first-cap sources as
`PairedApexClassJointDeletion`. -/
theorem false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S)
    (Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A) :
    False := by
  -- Phase 1 positive controls of the closure plan, consumed here so that the
  -- publish spine records them.  They do not narrow the residual.
  obtain ⟨i, x, y, hxE, hyE, hxy, hxi, hyi, hxSafe, hySafe⟩ :=
    exists_index_safe_pair_of_fiveSurviveOneFail Q
  have hcellsAtPair :=
    strictApexFourWitness_safe_counts_of_pair (Q.W i)
      (retainedShellSupport H O.kept O.kept_mem_A ∪
        retainedShellSupport H O.deleted O.deleted_mem_A)
      hxi hyi hxy hxSafe hySafe
  have hxSignature :=
    deletionSignature_of_not_mem_two_retainedShells G O.kept_mem_A
      O.deleted_mem_A (Q.mem_A x hxE) hxSafe
  have hySignature :=
    deletionSignature_of_not_mem_two_retainedShells G O.kept_mem_A
      O.deleted_mem_A (Q.mem_A y hyE) hySafe
  obtain ⟨iKept, iDeleted, j, hkeptCenter, hdeletedCenter, hkj, hdj, honeHit⟩ :=
    exists_capIndex_avoiding_two_blockers G O.kept_mem_A O.deleted_mem_A
  have hcellsAtFree :=
    strictApexFourWitness_safe_counts_of_oneHit (Q.W j)
      (retainedShellSupport H O.kept O.kept_mem_A)
      (retainedShellSupport H O.deleted O.deleted_mem_A)
      (fun r => (honeHit r).1) (fun r => (honeHit r).2)
  have hfifteen :
      D.A.card = 15 → ∀ k : Fin 3, Q.W.supportAt k = S.capInteriorByIndex k :=
    fun hcard k =>
      strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen
        G Q.W hcard k
  obtain ⟨K, hsourceK, hKradius, z, w, hzK, hwK, hzw, hzSurvives, hwSurvives,
      hzwBlockers⟩ :=
    exists_firstApex_mutualCrossDeletion_pair_through_source J G
  have hsixSlots := fun (hcard : D.A.card = 15) (k : Fin 3) =>
    exists_orderedCap_six_of_card_eq_fifteen G hcard k
  sorry

/-- Escaping-source child of the paired common-deletion leaf.

The retained common deletion renews at a carrier point on a first-apex class of
at least four points which is omitted by *both* retained shells.  Deleting it
preserves K4 at the first apex and at both retained blockers, and its own
actual blocker is a fourth centre distinct from all three
(`PairedApexClassJointDeletion.blocker_ne_keptBlocker`,
`…blocker_ne_deletedBlocker`).

Narrowing relative to the parent: the parent supplies only the mutual-omission
pair; this leaf additionally names a third source on a first-apex class with a
four-centre survival surface. -/
theorem false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S) :
    False := by
  let Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A :=
    triApexFiveSurviveOneFailOfApexRich S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A D.convex G.apex_rich
  exact
    false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
      J G Q

/-- A reverse hit already forces the escaping-source child of the paired
common-deletion leaf.  This is the common contradiction route for all
source-faithful refinements of the reverse-hit branch; endpoint data can be
retained by compatibility wrappers without creating new proof obligations. -/
theorem false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (G : TriApexAllLargeContext D S) :
    False := by
  rcases nonempty_pairedApexClassJointDeletion_of_reverseHit R O reverse_mem with
    ⟨J⟩
  exact
    false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
      J G

/-- The source-independent algebraic contradiction behind the two-radius-grid
leaf.  The variables are scaled longitudinal and transverse coordinates along
one shell-blocker axis; all geometric normalization is kept outside this
lemma. -/
private theorem polynomial_nested_escape_core
    {x y X Y u v : ℝ}
    (hx : 0 < x) (hy : 0 < y) (hyY : y < Y)
    (hNest : 0 < X * y - Y * x)
    (hNorm : u ^ 2 + v ^ 2 = x ^ 2 + y ^ 2)
    (hRayOrder : 0 < x * v - y * u)
    (hTriple :
      0 < (x - X) * (v - Y) - (y - Y) * (u - X)) :
    x * v + y * u < 0 := by
  have hNormDiff : x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2 = 0 := by
    nlinarith [hNorm]
  have hN : 0 < x ^ 2 + y ^ 2 := by
    positivity
  have hE : 0 < x ^ 2 + y ^ 2 + x * u + y * v := by
    nlinarith [sq_nonneg (x + u), sq_nonneg (y + v)]
  have hFactor :
      (x ^ 2 + y ^ 2) * (x ^ 2 + y ^ 2 + x * u + y * v) *
          ((x - X) * (v - Y) - (y - Y) * (u - X)) =
        (x * v - y * u) *
          ((x * v - y * u) * (X * y - Y * x) +
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x ^ 2 + y ^ 2 - (X * x + Y * y))) := by
    calc
      _ =
          (x * v - y * u) *
              ((x * v - y * u) * (X * y - Y * x) +
                (x ^ 2 + y ^ 2 + x * u + y * v) *
                  (x ^ 2 + y ^ 2 - (X * x + Y * y))) +
            (x ^ 2 + y ^ 2) * (X * y - Y * x) *
              (x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2) := by ring
      _ = _ := by rw [hNormDiff]; ring
  have hBracket :
      0 < (x * v - y * u) * (X * y - Y * x) +
        (x ^ 2 + y ^ 2 + x * u + y * v) *
          (x ^ 2 + y ^ 2 - (X * x + Y * y)) := by
    have hleft :
        0 < (x ^ 2 + y ^ 2) * (x ^ 2 + y ^ 2 + x * u + y * v) *
          ((x - X) * (v - Y) - (y - Y) * (u - X)) :=
      mul_pos (mul_pos hN hE) hTriple
    rw [hFactor] at hleft
    by_contra hnot
    have hnonpos :
        (x * v - y * u) *
            ((x * v - y * u) * (X * y - Y * x) +
              (x ^ 2 + y ^ 2 + x * u + y * v) *
                (x ^ 2 + y ^ 2 - (X * x + Y * y))) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hRayOrder)
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hleft
  have hLinear :
      x * (X * y - Y * x) +
          y * (x ^ 2 + y ^ 2 - (X * x + Y * y)) < 0 := by
    have hIdentity :
        x * (X * y - Y * x) +
            y * (x ^ 2 + y ^ 2 - (X * x + Y * y)) =
          (x ^ 2 + y ^ 2) * (y - Y) := by ring
    rw [hIdentity]
    exact mul_neg_of_pos_of_neg hN (sub_neg.mpr hyY)
  have hEliminate :
      0 < (X * y - Y * x) *
        ((x * v - y * u) * y -
          (x ^ 2 + y ^ 2 + x * u + y * v) * x) := by
    have hFirst :
        0 < y *
          ((x * v - y * u) * (X * y - Y * x) +
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x ^ 2 + y ^ 2 - (X * x + Y * y))) :=
      mul_pos hy hBracket
    have hSecond :
        (x ^ 2 + y ^ 2 + x * u + y * v) *
            (x * (X * y - Y * x) +
              y * (x ^ 2 + y ^ 2 - (X * x + Y * y))) < 0 :=
      mul_neg_of_pos_of_neg hE hLinear
    calc
      0 <
          y *
              ((x * v - y * u) * (X * y - Y * x) +
                (x ^ 2 + y ^ 2 + x * u + y * v) *
                  (x ^ 2 + y ^ 2 - (X * x + Y * y))) -
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x * (X * y - Y * x) +
                y * (x ^ 2 + y ^ 2 - (X * x + Y * y))) := by
            nlinarith
        _ = _ := by ring
  have hCore :
      0 < (x * v - y * u) * y -
        (x ^ 2 + y ^ 2 + x * u + y * v) * x := by
    by_contra hnot
    have hnonpos :
        (X * y - Y * x) *
            ((x * v - y * u) * y -
              (x ^ 2 + y ^ 2 + x * u + y * v) * x) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hNest)
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hEliminate
  have hCoreIdentity :
      (x * v - y * u) * y -
          (x ^ 2 + y ^ 2 + x * u + y * v) * x =
        -(x ^ 2 + y ^ 2) * (u + x) := by ring
  rw [hCoreIdentity] at hCore
  have hux : u + x < 0 := by
    by_contra hnot
    have hnonpos : -(x ^ 2 + y ^ 2) * (u + x) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr (le_of_lt hN))
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hCore
  have huSquare : x ^ 2 < u ^ 2 := by
    have hdiff : u - x < 0 := by linarith
    have hprod : 0 < (u - x) * (u + x) :=
      mul_pos_of_neg_of_neg hdiff hux
    nlinarith
  have hvSquare : v ^ 2 < y ^ 2 := by
    nlinarith [hNorm]
  have hv : v < y := by
    by_contra hnot
    have hdiff : 0 ≤ v - y := by linarith
    have hsum : 0 ≤ v + y := by linarith
    have hprod : 0 ≤ (v - y) * (v + y) := mul_nonneg hdiff hsum
    nlinarith
  have hxv : x * v < x * y := mul_lt_mul_of_pos_left hv hx
  have hyu : y * u < y * (-x) :=
    mul_lt_mul_of_pos_left (by linarith : u < -x) hy
  nlinarith

/-- Orientation-reversed form of `polynomial_nested_escape_core`.  Negating
all transverse coordinates converts a clockwise boundary packet to the
counterclockwise algebraic normalization without duplicating the elimination
argument. -/
private theorem polynomial_nested_escape_core_of_negative
    {x y X Y u v : ℝ}
    (hx : 0 < x) (hy : y < 0) (hYy : Y < y)
    (hNest : X * y - Y * x < 0)
    (hNorm : u ^ 2 + v ^ 2 = x ^ 2 + y ^ 2)
    (hRayOrder : x * v - y * u < 0)
    (hTriple :
      (x - X) * (v - Y) - (y - Y) * (u - X) < 0) :
    0 < x * v + y * u := by
  have h := polynomial_nested_escape_core
    (x := x) (y := -y) (X := X) (Y := -Y) (u := u) (v := -v)
    hx (by linarith) (by linarith) (by nlinarith)
    (by nlinarith [hNorm]) (by nlinarith) (by nlinarith)
  nlinarith

/-- Point-level positive-orientation wrapper around the polynomial core.  The
determinant transport lemmas turn the three boundary signed-area inequalities
into the exact coordinate hypotheses, while the reflected smaller pair turns
the final boundary determinant into the forbidden positive dot expression. -/
private theorem false_of_scaledNestedEscape_positive
    {o a s sMinus L t : ℝ²}
    (hoa : o ≠ a)
    (hreflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hx : 0 < scaledLongitudinalCoord o a s)
    (hy : 0 < scaledTransverseCoord o a s)
    (hyY :
      scaledTransverseCoord o a s < scaledTransverseCoord o a L)
    (hNest :
      0 < scaledLongitudinalCoord o a L *
          scaledTransverseCoord o a s -
        scaledTransverseCoord o a L * scaledLongitudinalCoord o a s)
    (hNorm :
      scaledLongitudinalCoord o a t ^ 2 +
          scaledTransverseCoord o a t ^ 2 =
        scaledLongitudinalCoord o a s ^ 2 +
          scaledTransverseCoord o a s ^ 2)
    (hRayArea : 0 < signedArea2 o s t)
    (hTripleArea : 0 < signedArea2 L s t)
    (hFinalArea : 0 < signedArea2 o sMinus t) :
    False := by
  let x := scaledLongitudinalCoord o a s
  let y := scaledTransverseCoord o a s
  let X := scaledLongitudinalCoord o a L
  let Y := scaledTransverseCoord o a L
  let u := scaledLongitudinalCoord o a t
  let v := scaledTransverseCoord o a t
  have hRay : 0 < x * v - y * u := by
    have h := (scaledCoordinate_det_pos_iff hoa).2 hRayArea
    simpa only [x, y, u, v] using h
  have hTriple :
      0 < (x - X) * (v - Y) - (y - Y) * (u - X) := by
    have h := (scaledCoordinate_triangle_det_pos_iff hoa).2 hTripleArea
    simpa only [x, y, X, Y, u, v] using h
  have hFinalRaw := (scaledCoordinate_det_pos_iff hoa).2 hFinalArea
  have hsmallLong : scaledLongitudinalCoord o a sMinus = x := by
    exact hreflect.1.symm.trans (by rfl)
  have hsmallTrans : scaledTransverseCoord o a sMinus = -y := by
    dsimp only [y]
    linarith [hreflect.2]
  have hFinal : 0 < x * v + y * u := by
    rw [hsmallLong, hsmallTrans] at hFinalRaw
    change 0 < x * v - (-y) * u at hFinalRaw
    nlinarith
  have hpoly : x * v + y * u < 0 := by
    apply polynomial_nested_escape_core (x := x) (y := y) (X := X) (Y := Y)
    · simpa only [x] using hx
    · simpa only [y] using hy
    · simpa only [y, Y] using hyY
    · simpa only [x, y, X, Y] using hNest
    · simpa only [x, y, u, v] using hNorm
    · exact hRay
    · exact hTriple
  linarith

/-- Clockwise counterpart of `false_of_scaledNestedEscape_positive`.  It uses
the orientation-reversed polynomial wrapper, so the boundary adapter may keep
the repository's native direct-or-mirror signed-area convention. -/
private theorem false_of_scaledNestedEscape_negative
    {o a s sMinus L t : ℝ²}
    (hoa : o ≠ a)
    (hreflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hx : 0 < scaledLongitudinalCoord o a s)
    (hy : scaledTransverseCoord o a s < 0)
    (hYy :
      scaledTransverseCoord o a L < scaledTransverseCoord o a s)
    (hNest :
      scaledLongitudinalCoord o a L *
          scaledTransverseCoord o a s -
        scaledTransverseCoord o a L * scaledLongitudinalCoord o a s < 0)
    (hNorm :
      scaledLongitudinalCoord o a t ^ 2 +
          scaledTransverseCoord o a t ^ 2 =
        scaledLongitudinalCoord o a s ^ 2 +
          scaledTransverseCoord o a s ^ 2)
    (hRayArea : signedArea2 o s t < 0)
    (hTripleArea : signedArea2 L s t < 0)
    (hFinalArea : signedArea2 o sMinus t < 0) :
    False := by
  let x := scaledLongitudinalCoord o a s
  let y := scaledTransverseCoord o a s
  let X := scaledLongitudinalCoord o a L
  let Y := scaledTransverseCoord o a L
  let u := scaledLongitudinalCoord o a t
  let v := scaledTransverseCoord o a t
  have hbase : 0 < ‖a - o‖ ^ 2 :=
    sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm))
  have hRayEq := scaledCoordinate_det o a s t
  have hRay : x * v - y * u < 0 := by
    change x * v - y * u = ‖a - o‖ ^ 2 * signedArea2 o s t at hRayEq
    rw [hRayEq]
    exact mul_neg_of_pos_of_neg hbase hRayArea
  have hTripleEq := scaledCoordinate_triangle_det o a L s t
  have hTriple :
      (x - X) * (v - Y) - (y - Y) * (u - X) < 0 := by
    change
      (x - X) * (v - Y) - (y - Y) * (u - X) =
        ‖a - o‖ ^ 2 * signedArea2 L s t at hTripleEq
    rw [hTripleEq]
    exact mul_neg_of_pos_of_neg hbase hTripleArea
  have hFinalEq := scaledCoordinate_det o a sMinus t
  have hsmallLong : scaledLongitudinalCoord o a sMinus = x := by
    exact hreflect.1.symm.trans (by rfl)
  have hsmallTrans : scaledTransverseCoord o a sMinus = -y := by
    dsimp only [y]
    linarith [hreflect.2]
  have hFinalRaw : x * v - (-y) * u < 0 := by
    rw [hsmallLong, hsmallTrans] at hFinalEq
    change x * v - (-y) * u =
      ‖a - o‖ ^ 2 * signedArea2 o sMinus t at hFinalEq
    rw [hFinalEq]
    exact mul_neg_of_pos_of_neg hbase hFinalArea
  have hFinal : x * v + y * u < 0 := by nlinarith [hFinalRaw]
  have hpoly : 0 < x * v + y * u := by
    apply polynomial_nested_escape_core_of_negative
      (x := x) (y := y) (X := X) (Y := Y)
    · simpa only [x] using hx
    · simpa only [y] using hy
    · simpa only [y, Y] using hYy
    · simpa only [x, y, X, Y] using hNest
    · simpa only [x, y, u, v] using hNorm
    · exact hRay
    · exact hTriple
  linarith

/-- Saturated child of the paired common-deletion leaf.

Both retained critical shells are pinned onto two concentric first-apex classes
of cardinality exactly four: each shell meets each class in a named two-point
set, the shells are disjoint, and their union is the union of the two classes.
Each such two-point set is a reflected pair across the chord joining the first
apex to that shell's blocker
(`PairedTwoRadiusGrid.keptRetainedPair_sep` and its three companions), so this
leaf already carries order-sensitive metric data, not only incidence counts.

Narrowing relative to the parent: the parent's retained class is only known to
have at least four points and its shells are unconstrained off the retained
radius; here both cardinalities are exactly four, both full shells are
determined by the two classes, the two grid radii are the only rich first-apex
radii (`PairedTwoRadiusGrid.richClass_mem`), and `PairedGridCapPlacement` pins
the exact four-point strict first-cap census while placing the two
retained-class partners outside that strict interior. -/
theorem false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (Gr : PairedTwoRadiusGrid O)
    (place : PairedGridCapPlacement Gr)
    (G : TriApexAllLargeContext D S) :
    False := by
  classical
  let labels : PairedGridOrientedLabels Gr place :=
    Classical.choice (nonempty_pairedGridOrientedLabels Gr place)
  let Q : PairedGridNestedPrimary Gr labels :=
    Classical.choice (nonempty_pairedGridNestedPrimary labels)
  let K :=
    (H.selectedAt Q.source Q.source_mem_A).toCriticalFourShell
  have hoa : S.oppApex1 ≠ H.centerAt Q.source Q.source_mem_A :=
    Q.apex_ne_blocker
  have haA : H.centerAt Q.source Q.source_mem_A ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hlargeEscapeA : Q.largeEscape ∈ D.A :=
    K.support_subset_A Q.largeEscape_mem_primaryShell
  have hot : S.oppApex1 ≠ Q.otherSmallEscape := by
    intro h
    have hd := (mem_selectedClass.mp Q.otherSmallEscape_mem_smallClass).2
    rw [h, dist_self] at hd
    linarith [Q.smallRadius_pos]
  have hos : S.oppApex1 ≠ Q.smallInside := by
    intro h
    have hd := (mem_selectedClass.mp Q.smallInside_mem_smallClass).2
    rw [h, dist_self] at hd
    linarith [Q.smallRadius_pos]
  have hosEscape : S.oppApex1 ≠ Q.smallEscape := by
    intro h
    have hd := (mem_selectedClass.mp Q.smallEscape_mem_smallClass).2
    rw [h, dist_self] at hd
    linarith [Q.smallRadius_pos]
  have hasEscape :
      H.centerAt Q.source Q.source_mem_A ≠ Q.smallEscape := by
    intro h
    have hmem := Q.smallEscape_mem_primaryShell
    rw [← h] at hmem
    exact K.center_not_mem_support hmem
  have haLarge :
      H.centerAt Q.source Q.source_mem_A ≠ Q.largeInside := by
    intro h
    have hmem := Q.largeInside_mem_primaryShell
    rw [← h] at hmem
    exact K.center_not_mem_support hmem
  have haLargeEscape :
      H.centerAt Q.source Q.source_mem_A ≠ Q.largeEscape := by
    intro h
    have hmem := Q.largeEscape_mem_primaryShell
    rw [← h] at hmem
    exact K.center_not_mem_support hmem
  have hsmallReflect := Q.smallPair_scaledCoordinates
  have hlargeReflect := Q.largePair_scaledCoordinates
  have hsmallO :
      dist S.oppApex1 Q.smallInside =
        dist S.oppApex1 Q.smallEscape :=
    (mem_selectedClass.mp Q.smallInside_mem_smallClass).2.trans
      (mem_selectedClass.mp Q.smallEscape_mem_smallClass).2.symm
  have hsmallA :
      dist (H.centerAt Q.source Q.source_mem_A) Q.smallInside =
        dist (H.centerAt Q.source Q.source_mem_A) Q.smallEscape :=
    (K.support_eq_radius Q.smallInside
      Q.smallInside_mem_primaryShell).trans
      (K.support_eq_radius Q.smallEscape
        Q.smallEscape_mem_primaryShell).symm
  have hlargeO :
      dist S.oppApex1 Q.largeInside =
        dist S.oppApex1 Q.largeEscape :=
    (mem_selectedClass.mp Q.largeInside_mem_largeClass).2.trans
      (mem_selectedClass.mp Q.largeEscape_mem_largeClass).2.symm
  have hlargeA :
      dist (H.centerAt Q.source Q.source_mem_A) Q.largeInside =
        dist (H.centerAt Q.source Q.source_mem_A) Q.largeEscape :=
    (K.support_eq_radius Q.largeInside
      Q.largeInside_mem_primaryShell).trans
      (K.support_eq_radius Q.largeEscape
        Q.largeEscape_mem_primaryShell).symm
  have hRadius :
      dist S.oppApex1 Q.smallInside <
        dist S.oppApex1 Q.largeInside := by
    calc
      dist S.oppApex1 Q.smallInside = Q.smallRadius :=
        (mem_selectedClass.mp Q.smallInside_mem_smallClass).2
      _ < Q.largeRadius := Q.smallRadius_lt_largeRadius
      _ = dist S.oppApex1 Q.largeInside :=
        (mem_selectedClass.mp Q.largeInside_mem_largeClass).2.symm
  have hCommonBlocker :
      dist (H.centerAt Q.source Q.source_mem_A) Q.smallInside =
        dist (H.centerAt Q.source Q.source_mem_A) Q.largeInside :=
    (K.support_eq_radius Q.smallInside
      Q.smallInside_mem_primaryShell).trans
      (K.support_eq_radius Q.largeInside
        Q.largeInside_mem_primaryShell).symm
  have hpacket := twoRadiusGrid_zeroCut_assembly S haA hlargeEscapeA
    Q.smallInside_mem_capInterior Q.largeInside_mem_capInterior
    Q.smallEscape_mem_left Q.otherSmallEscape_mem_right hoa hot hos
    hosEscape hasEscape Q.smallPair_ne haLarge haLargeEscape Q.largePair_ne
    hsmallReflect hlargeReflect hsmallO hsmallA hlargeO hlargeA hRadius
    hCommonBlocker Q.largeEscape_not_mem_capInterior
  rcases hpacket with hpositive | hnegative
  · rcases hpositive with
      ⟨hnest, _hbaseSign, hRay, hFinal, hTripleOf⟩
    rcases hnest with ⟨hx, hy, hyY, hNest⟩
    have hAreaOLs :
        0 < signedArea2 S.oppApex1 Q.largeInside Q.smallInside :=
      (scaledCoordinate_det_pos_iff hoa).1 hNest
    exact false_of_scaledNestedEscape_positive hoa hsmallReflect hx hy hyY
      hNest Q.smallRadius_scaledNorm hRay (hTripleOf hAreaOLs) hFinal
  · rcases hnegative with
      ⟨⟨hy, _hLargeTransNeg⟩, hmirrorNest, _hbaseSign,
        hRay, hFinal, hTripleOf⟩
    rcases hmirrorNest with ⟨hxMirror, _hyMirror, hyYMirror, hNestMirror⟩
    have hx :
        0 < scaledLongitudinalCoord S.oppApex1
          (H.centerAt Q.source Q.source_mem_A) Q.smallInside := by
      rw [hsmallReflect.1]
      exact hxMirror
    have hYy :
        scaledTransverseCoord S.oppApex1
            (H.centerAt Q.source Q.source_mem_A) Q.largeInside <
          scaledTransverseCoord S.oppApex1
            (H.centerAt Q.source Q.source_mem_A) Q.smallInside := by
      nlinarith [hsmallReflect.2, hlargeReflect.2, hyYMirror]
    have hNest :
        scaledLongitudinalCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.largeInside *
            scaledTransverseCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.smallInside -
          scaledTransverseCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.largeInside *
            scaledLongitudinalCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.smallInside < 0 := by
      rw [hsmallReflect.1, hlargeReflect.1, hsmallReflect.2,
        hlargeReflect.2]
      nlinarith [hNestMirror]
    have hDetSwap :
        0 < scaledLongitudinalCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.smallInside *
            scaledTransverseCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.largeInside -
          scaledTransverseCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.smallInside *
            scaledLongitudinalCoord S.oppApex1
              (H.centerAt Q.source Q.source_mem_A) Q.largeInside := by
      nlinarith [hNest]
    have hAreaSwap :
        0 < signedArea2 S.oppApex1 Q.smallInside Q.largeInside :=
      (scaledCoordinate_det_pos_iff hoa).1 hDetSwap
    have hAreaOLs :
        signedArea2 S.oppApex1 Q.largeInside Q.smallInside < 0 := by
      have hswap :
        signedArea2 S.oppApex1 Q.largeInside Q.smallInside =
            -signedArea2 S.oppApex1 Q.smallInside Q.largeInside := by
        simp [signedArea2]
      rw [hswap]
      linarith
    exact false_of_scaledNestedEscape_negative hoa hsmallReflect hx hy hYy
      hNest Q.smallRadius_scaledNorm hRay (hTripleOf hAreaOLs) hFinal

/-- Paired-common-deletion branch of the E1 geometric consumer.  Its inputs
are exactly the first constructor of `RetainedOmissionAllLargeNormalForm`.

The branch is dispatched by the checked source-return normal form
`nonempty_pairedCommonDeletionOutcome`: the paired arm *is* the source-return
two-step walk, whose exact radius split either renews the common deletion at a
first-apex class point escaping both shells, or — after renewing the exact-four
arm at the second rich first-apex radius — saturates into the two-radius
grid. -/
theorem false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_omission :
      O.kept ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (G : TriApexAllLargeContext D S) :
    False := by
  have hrich : ApexRichClassStructure D.A S.oppApex1 := by
    simpa using G.apex_rich S.oppIndex1
  rcases nonempty_pairedCommonDeletionOutcome O reversePacket hrich with
    ⟨outcome⟩
  cases outcome with
  | apexClassJointDeletion J =>
      exact
        false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
          J G
  | twoRadiusGrid Gr =>
      exact
        false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core Gr
          (pairedGridCapPlacement Gr G) G

/-- The fresh reverse-hit branch is already a nonreturning two-step
common-deletion walk.  Hence its endpoint is classified by either an
origin-tagged blocker collision or three pairwise-distinct actual blockers;
the source-return constructor is ruled out by freshness. -/
theorem exists_reverseHitFresh_nonreturnEndpointClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) :
    ∃ W : RetainedMatchingTwoStepCommonDeletionWalk R,
      W.first = O.kept ∧ W.second = O.deleted ∧ W.next = fresh ∧
        (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
          Nonempty (RetainedMatchingThreeDistinctBlockerPath W)) := by
  let W : RetainedMatchingTwoStepCommonDeletionWalk R := {
    first := O.kept
    second := O.deleted
    next := fresh
    first_mem_A := O.kept_mem_A
    second_mem_A := O.deleted_mem_A
    next_mem_A := freshPacket.q_mem_A
    first_ne_second := O.sources_ne
    second_ne_next := fresh_ne_deleted.symm
    first_mem_radius := O.kept_mem_radius
    second_mem_radius := O.deleted_mem_radius
    first_mem_capInterior := O.kept_mem_capInterior
    second_mem_capInterior := O.deleted_mem_capInterior
    firstPacket := O.packet
    secondPacket := freshPacket
    nextLocation := RetainedMatchingNextLocation.freshFirstCap
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted }
  refine ⟨W, rfl, rfl, rfl, ?_⟩
  rcases nonempty_twoStepEndpointOutcome W with ⟨outcome⟩
  cases outcome with
  | sourceReturn next_eq_first =>
      exact False.elim (fresh_ne_kept (by simpa [W] using next_eq_first))
  | endpointCriticalFiber fiber => exact Or.inl ⟨fiber⟩
  | threeDistinctBlockers path => exact Or.inr ⟨path⟩


/-- The sole cyclic-order input still needed after an endpoint collision has
supplied a fresh first-apex row source.  All metric equalities and the final
cross incidence are kept outside this structure, so a producer of this packet
is exactly a producer of the six-point boundary placement
`O < A < X < J < C < K`. -/
structure EndpointFreshOrderedCrossRowPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt Q.J Q.J_mem_A
  boundary_J : boundary iJ = Q.J
  boundary_C : boundary iC = Q.C
  boundary_K : boundary iK = Q.K

/-- The endpoint cross-hit arm is closed once its six named points occur in
the ordered placement `O < A < X < J < C < K`.  This is a proved adapter to
`OrderedCrossRowCore`; it introduces no new metric hypothesis. -/
theorem false_of_endpointFreshCrossHit_of_orderedPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    {Q : EndpointFreshFirstApexRowSource E}
    (placement : EndpointFreshOrderedCrossRowPlacement Q)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support) :
    False := by
  exact OrderedCrossRowCore.false {
    C := Q.C
    K := Q.K
    fiber_orientation := Q.fiber_orientation
    J := Q.J
    J_mem_A := Q.J_mem_A
    boundary := placement.boundary
    boundary_injective := placement.boundary_injective
    boundary_image := placement.boundary_image
    boundary_ccw := placement.boundary_ccw
    iO := placement.iO
    iA := placement.iA
    iX := placement.iX
    iJ := placement.iJ
    iC := placement.iC
    iK := placement.iK
    hOA := placement.hOA
    hAX := placement.hAX
    hXJ := placement.hXJ
    hJC := placement.hJC
    hCK := placement.hCK
    boundary_O := placement.boundary_O
    boundary_A := placement.boundary_A
    boundary_X := placement.boundary_X
    boundary_J := placement.boundary_J
    boundary_C := placement.boundary_C
    boundary_K := placement.boundary_K
    robust_equidistant :=
      (Q.row.support_eq_radius Q.J Q.J_mem_row).trans
        (Q.row.support_eq_radius Q.C Q.C_mem_row).symm
    K_mem_J_shell := K_mem_J_shell }

/-- Source-proved exact continuation of an endpoint-critical fiber: choose a
fresh first-apex row source and classify its actual critical row by whether it
contains the opposite fiber endpoint. -/
theorem exists_reverseHitFresh_endpointCriticalFiber_continuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W) :
    ∃ Q : EndpointFreshFirstApexRowSource E,
      Nonempty (EndpointFreshCrossOrCommonDeletion Q) := by
  rcases nonempty_endpointFreshFirstApexRowSource E with ⟨Q⟩
  exact ⟨Q, nonempty_endpointFreshCrossOrCommonDeletion Q⟩

/-- The only role coincidences not already excluded by the endpoint-row and
selected-shell interfaces.  In the notation used by the closure plan,
`A` is the common endpoint blocker, `X` is the blocker selected at `J`, and
the three exceptional constructors are exactly `A = J`, `A = X`, and
`X = C`.  The residual constructor records the negation of all three. -/
inductive EndpointFreshCriticalRoleOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type
  | firstCenterEqFreshSource
      (hAJ :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J)
  | sharedBlocker
      (hAX :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
          H.centerAt Q.J Q.J_mem_A)
  | secondCenterEqFirstSource
      (hXC : H.centerAt Q.J Q.J_mem_A = Q.C)
  | generic
      (hAJ :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠ Q.J)
      (hAX :
        H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠
          H.centerAt Q.J Q.J_mem_A)
      (hXC : H.centerAt Q.J Q.J_mem_A ≠ Q.C)

/-- Exhaustive classification by the three endpoint cross-hit role
coincidences that are not ruled out by the inherited exact-row data. -/
theorem nonempty_endpointFreshCriticalRoleOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) :
    Nonempty (EndpointFreshCriticalRoleOutcome Q) := by
  by_cases hAJ :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J
  · exact ⟨EndpointFreshCriticalRoleOutcome.firstCenterEqFreshSource hAJ⟩
  by_cases hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A
  · exact ⟨EndpointFreshCriticalRoleOutcome.sharedBlocker hAX⟩
  by_cases hXC : H.centerAt Q.J Q.J_mem_A = Q.C
  · exact ⟨EndpointFreshCriticalRoleOutcome.secondCenterEqFirstSource hXC⟩
  exact ⟨EndpointFreshCriticalRoleOutcome.generic hAJ hAX hXC⟩

/-- If the common endpoint blocker and the blocker selected at the fresh row
source coincide (`A = X`), then their exact four-shells coincide.  In
particular the common support contains the three pairwise-distinct named
points `C`, `K`, and `J`; only its fourth point remains unnamed. -/
theorem endpointFresh_support_eq_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    let KX := (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell
    KA.radius = KX.radius ∧
      KA.support = KX.support ∧
      Q.C ∈ KA.support ∧
      Q.K ∈ KA.support ∧
      Q.J ∈ KA.support := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  let KX := (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell
  change
    KA.radius = KX.radius ∧
      KA.support = KX.support ∧
      Q.C ∈ KA.support ∧
      Q.K ∈ KA.support ∧
      Q.J ∈ KA.support
  have hC_A : Q.C ∈ KA.support := by
    rcases Q.fiber_orientation with ⟨hC, _⟩ | ⟨hC, _⟩
    · rw [hC]
      exact KA.q_mem_support
    · rw [hC]
      exact E.fiber.source₂_mem_commonSupport
  have hK_A : Q.K ∈ KA.support := by
    rcases Q.fiber_orientation with ⟨_, hK⟩ | ⟨_, hK⟩
    · rw [hK]
      exact E.fiber.source₂_mem_commonSupport
    · rw [hK]
      exact KA.q_mem_support
  have hK_X : Q.K ∈ KX.support := K_mem_J_shell
  have hr : KA.radius = KX.radius := by
    calc
      KA.radius =
          dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K :=
        (KA.support_eq_radius Q.K hK_A).symm
      _ = dist (H.centerAt Q.J Q.J_mem_A) Q.K := by rw [hAX]
      _ = KX.radius := KX.support_eq_radius Q.K hK_X
  have hsupp : KA.support = KX.support := by
    rw [KA.support_eq, KX.support_eq]
    simp only [hAX, hr]
  have hJ_A : Q.J ∈ KA.support := by
    rw [hsupp]
    exact KX.q_mem_support
  exact ⟨hr, hsupp, hC_A, hK_A, hJ_A⟩

/-- In the shared-blocker branch, the common exact shell and the fresh
first-apex row meet in exactly the two named points `C` and `J`. -/
theorem endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ Q.row.support = {Q.C, Q.J} := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change KA.support ∩ Q.row.support = {Q.C, Q.J}
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have hpairSub :
      ({Q.C, Q.J} : Finset ℝ²) ⊆ KA.support ∩ Q.row.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hC_A, Q.C_mem_row⟩
    · exact Finset.mem_inter.mpr ⟨hJ_A, Q.J_mem_row⟩
  have hpairCard : ({Q.C, Q.J} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair Q.J_ne_C.symm
  have hinterCard : (KA.support ∩ Q.row.support).card ≤ 2 := by
    exact SelectedFourClass.inter_card_le_two
      KA.toSelectedFourClass Q.row E.fiber.commonBlocker_ne_firstApex
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub (by
    rw [hpairCard]
    exact hinterCard)

/-- The shared-blocker branch has one uniquely determined fourth point in the
common exact-four shell.  Both this point and K lie outside the fresh
first-apex row. -/
theorem endpointFresh_sharedBlocker_fourth_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change
    KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second
  rcases endpointFresh_support_eq_of_sharedBlocker
      Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, hK_A, hJ_A⟩
  have hinter : KA.support ∩ Q.row.support = {Q.C, Q.J} := by
    simpa only [KA] using
      endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
        Q K_mem_J_shell hAX
  have hCK : Q.C ≠ Q.K := Q.fiber_orientation.ne
  have hKnotRow : Q.K ∉ Q.row.support := by
    intro hKrow
    have hKinter : Q.K ∈ KA.support ∩ Q.row.support :=
      Finset.mem_inter.mpr ⟨hK_A, hKrow⟩
    rw [hinter] at hKinter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hKinter
    exact hKinter.elim
      (fun h ↦ hCK h.symm)
      (fun h ↦ Q.J_ne_K h.symm)
  let named : Finset ℝ² := {Q.C, Q.K, Q.J}
  have hnamedCard : named.card = 3 := by
    simp [named, hCK, Q.J_ne_C.symm, Q.J_ne_K.symm]
  have hnamedSubset : named ⊆ KA.support := by
    intro x hx
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hC_A
    · exact hK_A
    · exact hJ_A
  have hremainingCard : (KA.support \ named).card = 1 := by
    rw [Finset.card_sdiff_of_subset hnamedSubset,
      KA.support_card, hnamedCard]
  obtain ⟨L, hLsingleton⟩ := Finset.card_eq_one.mp hremainingCard
  have hLnotNamed : L ∉ named := by
    have hLdiff : L ∈ KA.support \ named := by
      rw [hLsingleton]
      simp
    exact (Finset.mem_sdiff.mp hLdiff).2
  have hSupport : KA.support = {Q.C, Q.K, Q.J, L} := by
    have hs := (Finset.sdiff_union_of_subset hnamedSubset).symm
    rw [hs, hLsingleton]
    ext x
    simp [named]
  have hLmem : L ∈ KA.support := by
    rw [hSupport]
    simp
  have hLnotRow : L ∉ Q.row.support := by
    intro hLrow
    have hLinter : L ∈ KA.support ∩ Q.row.support :=
      Finset.mem_inter.mpr ⟨hLmem, hLrow⟩
    rw [hinter] at hLinter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hLinter
    rcases hLinter with hLC | hLJ
    · exact hLnotNamed (by simp [named, hLC])
    · exact hLnotNamed (by simp [named, hLJ])
  have hLneCenter :
      L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 := by
    intro h
    rw [h] at hLmem
    exact KA.center_not_mem_support hLmem
  have hmiddleNot : W.second ∉ KA.support := by
    have hsource₁ :
        E.fiber.source₁ = ⟨W.first, W.first_mem_A⟩ :=
      Subtype.ext E.fiber_source₁_eq_first
    change W.second ∉
      (fun source : CriticalShellSystem.CarrierVertex D.A =>
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
        E.fiber.source₁
    rw [hsource₁]
    exact W.second_not_mem_first_shell
  have hLneMiddle : L ≠ W.second := by
    intro h
    rw [h] at hLmem
    exact hmiddleNot hLmem
  refine ⟨hinter, hKnotRow, L, ?_, ?_⟩
  · exact
      ⟨by simpa only [named] using hLnotNamed,
        hSupport, hLnotRow, hLneCenter, hLneMiddle⟩
  · intro Y hY
    rcases hY with ⟨hYnotNamed, hYSupport, _, _, _⟩
    have hYmem : Y ∈ KA.support := by
      rw [hYSupport]
      simp
    rw [hSupport] at hYmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hYmem
    rcases hYmem with hYC | hYK | hYJ | hYL
    · exact False.elim (hYnotNamed (by simp [hYC]))
    · exact False.elim (hYnotNamed (by simp [hYK]))
    · exact False.elim (hYnotNamed (by simp [hYJ]))
    · exact hYL

/-- In the shared-blocker branch, the common critical shell meets the retained
first-apex radius class in exactly the two named points `C` and `J`. -/
theorem endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J}
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have hpairSub :
      ({Q.C, Q.J} : Finset ℝ²) ⊆
        KA.support ∩ SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hC_A, Q.C_mem_radius⟩
    · exact Finset.mem_inter.mpr ⟨hJ_A, Q.J_mem_radius⟩
  have hpairCard : ({Q.C, Q.J} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair Q.J_ne_C.symm
  have hinterCard :
      (KA.support ∩ SelectedClass D.A S.oppApex1 radius).card ≤ 2 := by
    simpa only [KA] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        (R := R) E.fiber.source₁.1 E.fiber.source₁.2
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub (by
    rw [hpairCard]
    exact hinterCard)

/-- The unique unnamed point of the shared critical shell, as well as `K`,
lies outside the whole retained first-apex radius class. -/
theorem endpointFresh_sharedBlocker_frontierRadius_fourth_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    Q.K ∉ Q.row.support ∧
      Q.K ∉ SelectedClass D.A S.oppApex1 radius ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ∉ SelectedClass D.A S.oppApex1 radius ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change
    Q.K ∉ Q.row.support ∧
      Q.K ∉ SelectedClass D.A S.oppApex1 radius ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ∉ SelectedClass D.A S.oppApex1 radius ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second
  have hinter :
      KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} := by
    simpa only [KA] using
      endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
        Q K_mem_J_shell hAX
  rcases endpointFresh_sharedBlocker_fourth_packet Q K_mem_J_shell hAX with
    ⟨_hrowInter, hKnotRow, L,
      ⟨hLnotNamed, hSupport, hLnotRow, hLneCenter, hLneMiddle⟩,
      hunique⟩
  have hKmem : Q.K ∈ KA.support := by
    rw [hSupport]
    simp
  have hKnotClass :
      Q.K ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hKClass
    have hKInter :
        Q.K ∈ KA.support ∩ SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr ⟨hKmem, hKClass⟩
    rw [hinter] at hKInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hKInter
    exact hKInter.elim
      (fun hKC ↦ Q.fiber_orientation.ne hKC.symm)
      (fun hKJ ↦ Q.J_ne_K hKJ.symm)
  have hLmem : L ∈ KA.support := by
    rw [hSupport]
    simp
  have hLnotClass :
      L ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hLClass
    have hLInter :
        L ∈ KA.support ∩ SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr ⟨hLmem, hLClass⟩
    rw [hinter] at hLInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hLInter
    rcases hLInter with hLC | hLJ
    · exact hLnotNamed (by simp [hLC])
    · exact hLnotNamed (by simp [hLJ])
  refine ⟨hKnotRow, hKnotClass, L, ?_, ?_⟩
  · exact
      ⟨hLnotNamed, hSupport, hLnotRow, hLnotClass,
        hLneCenter, hLneMiddle⟩
  · intro Y hY
    rcases hY with
      ⟨hYnotNamed, hYSupport, hYnotRow, _hYnotClass,
        hYneCenter, hYneMiddle⟩
    exact hunique Y
      ⟨hYnotNamed, hYSupport, hYnotRow, hYneCenter, hYneMiddle⟩

/-- A retained-radius point in the left adjacent cap is its unique point in
that cap. -/
theorem endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
  classical
  have happ :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hsingletonSub :
      ({Q.J} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_singleton] at hz
    subst z
    exact Finset.mem_inter.mpr ⟨Q.J_mem_radius, hJLeft⟩
  have hinterCard :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    rw [happ]
    exact S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  symm
  exact Finset.eq_of_subset_of_card_le hsingletonSub (by
    simpa using hinterCard)

/-- A retained-radius point in the right adjacent cap is its unique point in
that cap. -/
theorem endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
  classical
  have happ :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hsingletonSub :
      ({Q.J} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_singleton] at hz
    subst z
    exact Finset.mem_inter.mpr ⟨Q.J_mem_radius, hJRight⟩
  have hinterCard :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    rw [happ]
    exact S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  symm
  exact Finset.eq_of_subset_of_card_le hsingletonSub (by
    simpa using hinterCard)

/-- In the shared-blocker branch, the two common row points alternate between
the first apex and the common blocker in every compatible convex boundary
enumeration.  This is the cyclic-order payload missing from the raw support
collapse. -/
theorem endpointFresh_sharedBlocker_pair_alternates
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩) := by
  let O : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, oppApex1_mem_A_for_reverseHit S⟩
  let A : CriticalShellSystem.CarrierVertex D.A :=
    H.blockerVertex E.fiber.source₁
  let C : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Q.C, Q.fiber_orientation.left_mem_A⟩
  let J : CriticalShellSystem.CarrierVertex D.A := ⟨Q.J, Q.J_mem_A⟩
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  rcases endpointFresh_support_eq_of_sharedBlocker Q K_mem_J_shell hAX with
    ⟨_hr, _hsupp, hC_A, _hK_A, hJ_A⟩
  have mem_of_eq {x y : ℝ²} {s : Finset ℝ²}
      (hxy : x = y) (hx : x ∈ s) : y ∈ s := by
    subst y
    exact hx
  have hA_ne_O : A ≠ O := by
    intro h
    exact E.fiber.commonBlocker_ne_firstApex (congrArg Subtype.val h)
  have hJ_ne_O : J ≠ O := by
    intro h
    have hpoint : Q.J = S.oppApex1 := congrArg Subtype.val h
    exact Q.row.center_not_mem (mem_of_eq hpoint Q.J_mem_row)
  have hJ_ne_A : J ≠ A := by
    intro h
    have hpoint : Q.J = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 :=
      congrArg Subtype.val h
    exact KA.center_not_mem_support (mem_of_eq hpoint hJ_A)
  have hOEq :
      dist S.oppApex1 Q.C = dist S.oppApex1 Q.J :=
    (Q.row.support_eq_radius Q.C Q.C_mem_row).trans
      (Q.row.support_eq_radius Q.J Q.J_mem_row).symm
  have hAEq :
      dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.C =
        dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.J :=
    (KA.support_eq_radius Q.C hC_A).trans
      (KA.support_eq_radius Q.J hJ_A).symm
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hJ_ne_O
  · exact B.index_injective.ne hJ_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm, O, C] using hOEq
  · simpa only [B.point_eq, pointOf, dist_comm, A, C,
      CriticalShellSystem.blockerVertex] using hAEq
  · exact B.boundary_injective.ne
      (B.index_injective.ne (fun h ↦
        Q.J_ne_C (congrArg Subtype.val h).symm))



/-- In the shared-blocker branch, the critical four-shell support and the
selected first-apex four-support form an exact six-point seed: their
intersection is precisely the pair `C, J`.

The first-apex physical radius class may contain six points; this theorem is
about the selected four-support `Q.row.support`, not exact physical
multiplicity at that apex. -/
theorem endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    (endpointFreshTwoShellSeed E Q).card = 6 := by
  classical
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change (KA.support ∪ Q.row.support).card = 6
  have hinter : KA.support ∩ Q.row.support = {Q.C, Q.J} :=
    endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
      Q K_mem_J_shell hAX
  have hpairCard : ({Q.C, Q.J} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair Q.J_ne_C.symm
  rw [Finset.card_union, KA.support_card, Q.row.support_card, hinter]
  omega



/-- Every simultaneous choice of selected four-classes at the six endpoint
seed centers contains an escaping chosen row.

This is the quantifier adapter needed by a finite selected-support search.  It
does not identify a preferred row or treat a selected support as a full
physical radius class. -/
theorem endpointFresh_exists_prescribedRow_escape_twoShellSeed_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hcard : 15 ≤ D.A.card)
    (K : ∀ center : ℝ²,
      center ∈ endpointFreshTwoShellSeed E Q →
        SelectedFourClass D.A center) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ z : ℝ²,
          z ∈ (K center hcenter).support ∧
            z ∉ endpointFreshTwoShellSeed E Q := by
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A :=
    endpointFresh_twoShellSeed_subset_carrier E Q
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card = 6 :=
    endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker
      Q K_mem_J_shell hAX
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card = 6 := by
      simpa [hseedEq] using hseedCard
    omega
  rcases
      exists_faithfulCarrierPattern_with_classes_on
        D.K4 hseedSub hseedNonempty K with
    ⟨G, hG⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  refine ⟨center, hcenter, z, ?_, hzOutside⟩
  simpa only [hG center hcenter] using hzRow

/-- One endpoint seed center is intrinsically escaping: every selected
four-class centered there contains a carrier point outside the two-shell seed.

This is the choice-free consequence of the prescribed-row escape theorem.  It
turns the finite-search quantifier order
`∀ row assignment, ∃ escaping center` into
`∃ center, ∀ selected row, the row escapes`, without identifying a selected
support with a full physical radius class. -/
theorem endpointFresh_exists_seedCenter_all_selectedRows_escape_twoShellSeed_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hcard : 15 ≤ D.A.card) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∀ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧ z ∉ endpointFreshTwoShellSeed E Q := by
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A :=
    endpointFresh_twoShellSeed_subset_carrier E Q
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card = 6 :=
    endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker
      Q K_mem_J_shell hAX
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card = 6 := by
      simpa [hseedEq] using hseedCard
    omega
  exact
    Problem97.exists_center_all_selectedFourClass_escape_of_proper_subset
      R.minimal hseedNonempty hseedSub hseedProper

/-- Pinned-multiplicity form of the universal escape producer: at one of the
six endpoint seed centers, every positive-radius carrier class contains at
most three seed points.

Indeed, four seed points on one such class could be trimmed to a selected
four-class wholly contained in the seed, contradicting universal escape at
the pinned center.  This statement is phrased in full physical
`SelectedClass` multiplicities for direct use by finite encoders. -/
theorem endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hcard : 15 ≤ D.A.card) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∀ shellRadius : ℝ,
          0 < shellRadius →
            ((SelectedClass D.A center shellRadius) ∩
                endpointFreshTwoShellSeed E Q).card ≤ 3 := by
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A :=
    endpointFresh_twoShellSeed_subset_carrier E Q
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card = 6 :=
    endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker
      Q K_mem_J_shell hAX
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card = 6 := by
      simpa [hseedEq] using hseedCard
    omega
  exact
    Problem97.exists_center_selectedClass_inter_card_le_three_of_proper_subset
      R.minimal hseedNonempty hseedSub hseedProper

/-- The pinned low-multiplicity center is neither center of either exposed
four-point shell: it is distinct from the first apex and from the common
blocker center.

Each excluded center already has four points of one positive physical shell
inside the endpoint seed.  This is a role exclusion for the pinned center; it
does not identify which of the other six seed roles the center occupies. -/
theorem endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hcard : 15 ≤ D.A.card) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        center ≠ S.oppApex1 ∧
          center ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
            ∀ shellRadius : ℝ,
              0 < shellRadius →
                ((SelectedClass D.A center shellRadius) ∩
                    endpointFreshTwoShellSeed E Q).card ≤ 3 := by
  rcases
      endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker
        R E Q K_mem_J_shell hAX hcard with
    ⟨center, hcenter, hmult⟩
  refine ⟨center, hcenter, ?_, ?_, hmult⟩
  · intro hcenter
    have hrowSub :
        Q.row.support ⊆
          SelectedClass D.A center Q.row.radius ∩
            endpointFreshTwoShellSeed E Q := by
      intro z hz
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · rw [mem_selectedClass]
        exact ⟨Q.row.support_subset_A hz, by
          simpa [hcenter] using Q.row.support_eq_radius z hz⟩
      · simp only [endpointFreshTwoShellSeed, Finset.mem_union]
        exact Or.inr hz
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult Q.row.radius Q.row.radius_pos
    rw [Q.row.support_card] at hfour
    omega
  · intro hcenter
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    have hrowSub :
        KA.support ⊆
          SelectedClass D.A center KA.radius ∩
            endpointFreshTwoShellSeed E Q := by
      intro z hz
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · rw [mem_selectedClass]
        exact ⟨KA.support_subset_A hz, by
          simpa [hcenter] using KA.support_eq_radius z hz⟩
      · simp only [endpointFreshTwoShellSeed, Finset.mem_union]
        exact Or.inl hz
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult KA.radius KA.radius_pos
    rw [KA.support_card] at hfour
    omega

/-- Uniform source-faithful escape dichotomy at the pinned low-multiplicity
seed center.

The center is chosen once.  Every selected four-row there, and every point of
that row outside the endpoint seed, then falls into one of two exact branches:
either the point's canonical blocker is the pinned center, in which case the
two full supports agree and the center is not deletion robust; or the centers
are distinct and the two supports meet in at most two points.  Unlike an
existential escape-row cut, this quantifier order cannot be satisfied by
switching to a convenient row or outside point. -/
theorem endpointFresh_exists_pinnedCenter_universal_escape_dichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hcard : 15 ≤ D.A.card) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        center ≠ S.oppApex1 ∧
          center ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
            (∀ shellRadius : ℝ,
              0 < shellRadius →
                ((SelectedClass D.A center shellRadius) ∩
                    endpointFreshTwoShellSeed E Q).card ≤ 3) ∧
              ∀ K : SelectedFourClass D.A center,
                ∀ z : ℝ²,
                  ∀ hzK : z ∈ K.support,
                    z ∉ endpointFreshTwoShellSeed E Q →
                      ((center = H.centerAt z (K.support_subset_A hzK) ∧
                          K.support =
                            (H.selectedAt z
                              (K.support_subset_A hzK)).toCriticalFourShell.support ∧
                          ¬ FullyDeletionRobustAt D center) ∨
                        (center ≠ H.centerAt z (K.support_subset_A hzK) ∧
                          (K.support ∩
                            (H.selectedAt z
                              (K.support_subset_A hzK)).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three
        R E Q K_mem_J_shell hAX hcard with
    ⟨center, hcenter, hcenterNeApex, hcenterNeBlocker, hmult⟩
  refine
    ⟨center, hcenter, hcenterNeApex, hcenterNeBlocker, hmult,
      fun K z hzK _hzOutside ↦ ?_⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  by_cases heq : center = H.centerAt z hzA
  · subst center
    left
    refine ⟨rfl, H.selectedFourClass_support_eq_shell z hzA K, ?_⟩
    intro hrobust
    exact H.no_qfree_at z hzA (hrobust.survives z hzA)
  · right
    exact ⟨heq, SelectedFourClass.inter_card_le_two K
      (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass heq⟩

/-- At exact cardinality fifteen, a `D44` first cap forces the two endpoint
deletion rows into opposite rich classes.  The row deleting the retained
source is the other-radius class, while the row deleting the fresh source is
the retained-radius class and hence the named endpoint row. -/
theorem endpointFresh_d44_deletedRows_of_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (hcard : D.A.card = 15)
    {otherRadius : ℝ}
    (hOtherPos : 0 < otherRadius)
    (hRadiusNe : radius ≠ otherRadius)
    (hOtherFour :
      4 ≤ (SelectedClass D.A S.oppApex1 otherRadius).card) :
    Q.K ∈ SelectedClass D.A S.oppApex1 otherRadius ∧
      O.packet.B₁ = SelectedClass D.A S.oppApex1 otherRadius ∧
      C.freshPacket.B₁ = SelectedClass D.A S.oppApex1 radius ∧
      Q.row.support = SelectedClass D.A S.oppApex1 radius ∧
      C.freshPacket.B₁ = Q.row.support ∧
      Q.K ∈ O.packet.B₁ := by
  classical
  have happ :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  let deletedAtM :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      O.packet.row₁ O.packet.B₁_card
  let deletedAtK :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      C.freshPacket.row₁ C.freshPacket.B₁_card
  have hcap :
      (S.capByIndex S.oppIndex1).card = 6 :=
    ATailExactFifteenApexProfile.capByIndex_card_eq_six_of_card_eq_fifteen
      S hcard C.allLarge.cap_card_ge_six S.oppIndex1
  have hCeq : Q.C = O.kept :=
    Q.C_eq_fiber_source₁.trans
      (E.fiber_source₁_eq_first.trans C.walk_first_eq)
  have hKeq : Q.K = C.fresh :=
    Q.K_eq_fiber_source₂.trans
      (E.fiber_source₂_eq_next.trans C.walk_next_eq)
  have hbase :=
    ATailExactFifteenApexProfile.twoRichClass_deletedRows_forced_assignment_of_center_eq_opposite
      S D.convex S.oppIndex1 happ F.radius_pos hOtherPos hRadiusNe
      R.frontierRadius_class_card_ge_four hOtherFour hcap
      deletedAtM deletedAtK Q.C O.deleted Q.K
      Q.C_mem_radius O.deleted_mem_radius
      (by simpa only [hCeq] using O.kept_mem_capInterior)
      O.deleted_mem_capInterior
      (by simpa only [hKeq] using C.fresh_mem_capInterior)
      (by
        intro h
        exact O.sources_ne (hCeq.symm.trans h))
      (by
        intro h
        exact C.fresh_ne_kept (hKeq.symm.trans (h.trans hCeq)))
      (by
        intro h
        exact C.fresh_ne_deleted (hKeq.symm.trans h))
      (by
        simpa [deletedAtM,
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass]
          using O.packet.row₁.q_not_mem)
      (by
        simpa [deletedAtK, hKeq,
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass]
          using C.freshPacket.row₁.q_not_mem)
  have hbase' :
      Q.K ∈ SelectedClass D.A S.oppApex1 otherRadius ∧
        O.packet.B₁ = SelectedClass D.A S.oppApex1 otherRadius ∧
        C.freshPacket.B₁ = SelectedClass D.A S.oppApex1 radius := by
    simpa [deletedAtM, deletedAtK,
      ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass]
      using hbase
  have hfourRadius :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) radius).card := by
    simpa only [← happ] using R.frontierRadius_class_card_ge_four
  have hfourOther :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) otherRadius).card := by
    simpa only [← happ] using hOtherFour
  have hcardsAtIndex :=
    ATailExactFifteenApexProfile.twoRichClasses_card_eq_four_of_cap_card_eq_six
      S D.convex S.oppIndex1 F.radius_pos hOtherPos hRadiusNe
      hfourRadius hfourOther hcap
  have hcards :
      (SelectedClass D.A S.oppApex1 radius).card = 4 ∧
        (SelectedClass D.A S.oppApex1 otherRadius).card = 4 := by
    simpa only [← happ] using hcardsAtIndex
  have hQsub :
      Q.row.support ⊆ SelectedClass D.A S.oppApex1 radius := by
    simpa [Q.row_radius_eq] using
      ATailExactFifteenApexProfile.selectedFourClass_support_subset_selectedClass
        Q.row
  have hQeq :
      Q.row.support = SelectedClass D.A S.oppApex1 radius := by
    apply Finset.eq_of_subset_of_card_le hQsub
    have hclassCard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 := by
      exact hcards.1
    rw [hclassCard, Q.row.support_card]
  exact ⟨hbase'.1, hbase'.2.1, hbase'.2.2, hQeq,
    hbase'.2.2.trans hQeq.symm, by
      rw [hbase'.2.1]
      exact hbase'.1⟩

/-- In the same exact-fifteen `D44` packet, the fresh first-apex deletion row
meets the deleted source's canonical shell in exactly the two retained-radius
sources.  This is the exact `Sigma_B` intersection promised by finite cap
exhaustion; no endpoint blocker placement is inferred here. -/
theorem endpointFresh_d44_freshRow_inter_reverseShell_eq_sources_of_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (hcard : D.A.card = 15)
    {otherRadius : ℝ}
    (hOtherPos : 0 < otherRadius)
    (hRadiusNe : radius ≠ otherRadius)
    (hOtherFour :
      4 ≤ (SelectedClass D.A S.oppApex1 otherRadius).card) :
    C.freshPacket.B₁ ∩
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support =
      {O.kept, O.deleted} := by
  classical
  have hrows := endpointFresh_d44_deletedRows_of_card_eq_fifteen
    R O C E Q hcard hOtherPos hRadiusNe hOtherFour
  have hB₂ :
      C.freshPacket.B₂ =
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support :=
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
      O.deleted_mem_A C.freshPacket.row₂ C.freshPacket.B₂_card
  have hpairSub :
      ({O.kept, O.deleted} : Finset ℝ²) ⊆
        C.freshPacket.B₁ ∩
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨by
        rw [hrows.2.2.1]
        exact O.kept_mem_radius, C.reverse_mem⟩
    · exact Finset.mem_inter.mpr ⟨by
        rw [hrows.2.2.1]
        exact O.deleted_mem_radius,
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.q_mem_support⟩
  have hinterCard :
      (C.freshPacket.B₁ ∩
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support).card ≤ 2 := by
    rw [← hB₂]
    exact C.freshPacket.overlap_le_two
  symm
  exact Finset.eq_of_subset_of_card_le hpairSub (by
    simpa [O.sources_ne] using hinterCard)

/-- Cross-hit subproblem in which the common endpoint blocker is the fresh
first-apex row source (`A = J`). -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Left-adjacent-cap half of the shared-blocker endpoint terminal.  Relative
to the former `A = X` leaf, both exclusion from the strict first-cap interior
and membership in the left adjacent closed cap are now explicit. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Right-adjacent-cap half of the shared-blocker endpoint terminal.  This is
the reflected placement branch of the preceding load-bearing leaf. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Collision localization first excludes `J` from the strict first-cap
interior; the global positive-radius cap cover then splits the old terminal
into the two adjacent-cap leaves above.  Immediate constructor fan-out: two. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JOutsideFirstInterior_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1) :
    False := by
  rcases
      ATailRetainedMatchingEndpointCollisionLocalization.EndpointFreshFirstApexRowSource.J_mem_leftAdjacentCap_or_rightAdjacentCap_of_not_mem_firstCapInterior
        Q hJOutside with hJLeft | hJRight
  · exact
      false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core
        R O C E Q K_mem_J_shell hAX hJOutside hJLeft
  · exact
      false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core
        R O C E Q K_mem_J_shell hAX hJOutside hJRight

/-- Cross-hit subproblem in which the endpoint blocker and the blocker
selected at the fresh source coincide (`A = X`).  Collision localization
reduces it to the explicit outside-first-interior terminal above. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    False := by
  have hKInterior : Q.K ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [Q.K_eq_fiber_source₂, E.fiber_source₂_eq_next, C.walk_next_eq]
    exact C.fresh_mem_capInterior
  have hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1 :=
    EndpointFreshFirstApexRowSource.J_not_mem_firstCapInterior_of_sharedBlocker
      Q K_mem_J_shell hAX hKInterior
  exact
    false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JOutsideFirstInterior_triApexAllLarge_core
      R O C E Q K_mem_J_shell hAX hJOutside

/-- Cross-hit subproblem in which the blocker selected at the fresh source is
the first fiber source (`X = C`). -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hXC : H.centerAt Q.J Q.J_mem_A = Q.C) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Residual cross-hit subproblem after excluding all three unresolved role
coincidences.  Together with the inherited row and shell exclusions, these
hypotheses make the six roles `O,A,X,J,C,K` pairwise distinct. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠ Q.J)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠
        H.centerAt Q.J Q.J_mem_A)
    (hXC : H.centerAt Q.J Q.J_mem_A ≠ Q.C) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Cross-hit child of the endpoint-collision leaf.  The checked dispatcher
retains the complete source data while splitting the only three role
coincidences not already excluded by the inherited interfaces. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support) :
    False := by
  rcases nonempty_endpointFreshCriticalRoleOutcome Q with ⟨outcome⟩
  cases outcome with
  | firstCenterEqFreshSource hAJ =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAJ
  | sharedBlocker hAX =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAX
  | secondCenterEqFirstSource hXC =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core
          R O C E Q K_mem_J_shell hXC
  | generic hAJ hAX hXC =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core
          R O C E Q K_mem_J_shell hAJ hAX hXC

/-- The source-faithful three-step omission cycle forced by distinct secondary
blockers in the endpoint common-deletion branch.

The three packet fields are the directed edges
`O.deleted → Q.J → Q.K → O.deleted`.  The structure retains the original
endpoint caller rather than projecting to three bare survival statements. -/
structure EndpointDistinctBlockerThreeStepDeletionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) : Type where
  J_not_mem_deletedShell :
    Q.J ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  deletedToJPacket :
    CommonDeletionTwoCenterPacket D H Q.J S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)
  K_not_mem_JShell :
    Q.K ∉ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support
  JToKPacket :
    CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
      (H.centerAt Q.J Q.J_mem_A)
  deleted_not_mem_KShell :
    O.deleted ∉
      (H.selectedAt Q.K Q.fiber_orientation.right_mem_A).toCriticalFourShell.support
  KToDeletedPacket :
    CommonDeletionTwoCenterPacket D H O.deleted S.oppApex1
      (H.centerAt Q.K Q.fiber_orientation.right_mem_A)
  deletedBlocker_ne_JBlocker :
    H.centerAt O.deleted O.deleted_mem_A ≠
      H.centerAt Q.J Q.J_mem_A

/-- Distinct secondary blockers force the missing third edge of the endpoint
omission cycle.  The only counting input is the already-proved bound of two
points where one actual critical shell meets the retained first-apex class. -/
theorem nonempty_endpointDistinctBlockerThreeStepDeletionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_not_mem_J_shell :
      Q.K ∉ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (packet : CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
      (H.centerAt Q.J Q.J_mem_A))
    (hbx :
      H.centerAt O.deleted O.deleted_mem_A ≠
        H.centerAt Q.J Q.J_mem_A) :
    Nonempty (EndpointDistinctBlockerThreeStepDeletionCycle R O C E Q) := by
  classical
  have hCeq : Q.C = O.kept :=
    Q.C_eq_fiber_source₁.trans
      (E.fiber_source₁_eq_first.trans C.walk_first_eq)
  have hCneDeleted : Q.C ≠ O.deleted := by
    simpa only [hCeq] using O.sources_ne
  have hJneDeleted : Q.J ≠ O.deleted := by
    simpa only [C.walk_second_eq] using Q.J_ne_middle
  have hJNotReverse :
      Q.J ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    intro hJReverse
    have htripleSubset :
        ({Q.C, O.deleted, Q.J} : Finset ℝ²) ⊆
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨by simpa only [hCeq] using C.reverse_mem, Q.C_mem_radius⟩
      · exact Finset.mem_inter.mpr
          ⟨(H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.q_mem_support,
            O.deleted_mem_radius⟩
      · exact Finset.mem_inter.mpr ⟨hJReverse, Q.J_mem_radius⟩
    have htripleCard : ({Q.C, O.deleted, Q.J} : Finset ℝ²).card = 3 := by
      simp [hCneDeleted, Q.J_ne_C.symm, hJneDeleted.symm]
    have hthree :
        3 ≤
          ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius).card := by
      calc
        3 = ({Q.C, O.deleted, Q.J} : Finset ℝ²).card := htripleCard.symm
        _ ≤
            ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex1 radius).card :=
          Finset.card_le_card htripleSubset
    have htwo :
        ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius).card ≤ 2 :=
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        (R := R) O.deleted O.deleted_mem_A
    omega
  have hJSurvivesDeletedBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase Q.J)
        (H.centerAt O.deleted O.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.deleted_mem_A).mpr hJNotReverse
  rcases nonempty_commonDeletionTwoCenterPacket H
      Q.J_mem_A (oppApex1_mem_A_for_reverseHit S)
      C.freshPacket.center₂_mem_A
      C.freshPacket.centers_ne
      (R.firstApexFullyDeletionRobust.survives Q.J Q.J_mem_A)
      hJSurvivesDeletedBlocker with
    ⟨deletedToJPacket⟩
  have hKBlockerEq :
      H.centerAt Q.K Q.fiber_orientation.right_mem_A =
        H.centerAt O.kept O.kept_mem_A := by
    have hKNext : Q.K = C.walk.next :=
      Q.K_eq_fiber_source₂.trans E.fiber_source₂_eq_next
    simpa only [hKNext, C.walk_first_eq] using E.endpoint_blockers_eq
  have KToDeletedPacket :
      CommonDeletionTwoCenterPacket D H O.deleted S.oppApex1
        (H.centerAt Q.K Q.fiber_orientation.right_mem_A) := by
    simpa only [hKBlockerEq] using O.packet
  have hDeletedNotKShell :
      O.deleted ∉
        (H.selectedAt Q.K Q.fiber_orientation.right_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H Q.fiber_orientation.right_mem_A).mp KToDeletedPacket.survives₂
  exact ⟨{
    J_not_mem_deletedShell := hJNotReverse
    deletedToJPacket := deletedToJPacket
    K_not_mem_JShell := K_not_mem_J_shell
    JToKPacket := packet
    deleted_not_mem_KShell := hDeletedNotKShell
    KToDeletedPacket := KToDeletedPacket
    deletedBlocker_ne_JBlocker := hbx }⟩

/-- Exact geometric terminal left by the distinct-secondary-blocker branch.
The producer above has already completed the source-faithful three-edge cycle;
what remains is a strict cap/order obstruction for that caller-tagged cycle. -/
theorem false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    {C : ReverseHitFreshEndpointContext R O}
    {E : RetainedMatchingEndpointCriticalFiber C.walk}
    {Q : EndpointFreshFirstApexRowSource E}
    (_cycle : EndpointDistinctBlockerThreeStepDeletionCycle R O C E Q) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Omission child of the endpoint-collision leaf.  The missing cross hit is
not discarded: it gives a new source-exact common-deletion packet based at the
opposite fiber endpoint. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (K_not_mem_J_shell :
      Q.K ∉ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (packet : CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
      (H.centerAt Q.J Q.J_mem_A)) :
    False := by
  classical
  by_cases hbx :
      H.centerAt O.deleted O.deleted_mem_A = H.centerAt Q.J Q.J_mem_A
  · have hsupp :
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support =
          (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support := by
      rw [← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
          H O.deleted O.deleted_mem_A,
        ← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
          H Q.J Q.J_mem_A,
        hbx]
    have hCeq : Q.C = O.kept :=
      Q.C_eq_fiber_source₁.trans
        (E.fiber_source₁_eq_first.trans C.walk_first_eq)
    have hCneDeleted : Q.C ≠ O.deleted := by
      simpa only [hCeq] using O.sources_ne
    have hJneDeleted : Q.J ≠ O.deleted := by
      simpa only [C.walk_second_eq] using Q.J_ne_middle
    have hJReverse :
        Q.J ∈
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
      rw [hsupp]
      exact (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.q_mem_support
    have htripleSubset :
        ({Q.C, O.deleted, Q.J} : Finset ℝ²) ⊆
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨by simpa only [hCeq] using C.reverse_mem, Q.C_mem_radius⟩
      · exact Finset.mem_inter.mpr
          ⟨(H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.q_mem_support,
            O.deleted_mem_radius⟩
      · exact Finset.mem_inter.mpr ⟨hJReverse, Q.J_mem_radius⟩
    have htripleCard : ({Q.C, O.deleted, Q.J} : Finset ℝ²).card = 3 := by
      simp [hCneDeleted, Q.J_ne_C.symm, hJneDeleted.symm]
    have hthree :
        3 ≤
          ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius).card := by
      calc
        3 = ({Q.C, O.deleted, Q.J} : Finset ℝ²).card := htripleCard.symm
        _ ≤
            ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex1 radius).card :=
          Finset.card_le_card htripleSubset
    have htwo :
        ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius).card ≤ 2 := by
      exact
        ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
          (R := R) O.deleted O.deleted_mem_A
    omega
  · rcases nonempty_endpointDistinctBlockerThreeStepDeletionCycle
        R O C E Q K_not_mem_J_shell packet hbx with ⟨cycle⟩
    exact
      false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core
        cycle

/-- Endpoint-collision child of the fresh reverse-hit leaf.  This checked
coordinator chooses a genuinely new first-apex row source and dispatches on
its exact cross-hit/common-deletion dichotomy. -/
theorem false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk) :
    False := by
  rcases exists_reverseHitFresh_endpointCriticalFiber_continuation E with
    ⟨Q, continuation⟩
  rcases continuation with ⟨continuation⟩
  cases continuation with
  | crossHit K_mem_J_shell =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core
          R O C E Q K_mem_J_shell
  | freshCommonDeletion K_not_mem_J_shell packet =>
      exact
        false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core
          R O C E Q K_not_mem_J_shell packet

/-- Noncollision child of the fresh reverse-hit leaf.  The three consecutive
actual blockers are pairwise distinct, while the complete reverse-shell and
fresh-packet context remains available to the metric consumer. -/
theorem false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (path : RetainedMatchingThreeDistinctBlockerPath C.walk) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O C.reverse_mem C.allLarge

/-- Reverse-hit/fresh-common-deletion branch of the E1 geometric consumer.
This branch retains the localized reverse blocker, its exact two-point
first-cap intersection, and the fresh common-deletion packet explicitly for
API compatibility.  The contradiction now occurs earlier: the reverse hit
itself produces a frontier-class source omitted from both retained shells and
therefore routes directly to the paired joint-deletion leaf. -/
theorem false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (fresh_not_mem_reverseShell :
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (G : TriApexAllLargeContext D S) :
    False := by
  exact
    false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
      R O reverse_mem G

/- The actual E1 coordinator.  The paired arm retains its D1/D2 outcome split;
the reverse-hit arm now reaches D1 directly through the joint-deletion selector
before any endpoint classification. -/
theorem false_of_retainedOmission_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S) :
    False := by
  cases Q with
  | pairedCommonDeletion O reverse_omission reversePacket =>
      exact
        false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
          R O reverse_omission reversePacket G
  | reverseHitFreshCommonDeletion O reverse_mem
      reverseBlocker_mem_capInterior reverseShell_inter_cap_eq fresh
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
      fresh_not_mem_reverseShell freshPacket =>
      exact
        false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core
          R O reverse_mem reverseBlocker_mem_capInterior
          reverseShell_inter_cap_eq fresh fresh_mem_capInterior fresh_ne_kept
          fresh_ne_deleted fresh_not_mem_reverseShell freshPacket G

/-- The TriApex cluster coordinator: from a retained interior directed
omission and the all-large tri-apex context, produce the normal form and
eliminate it.  The compatibility wrapper below and the registry
factorization entry for the TriApex leaf route through this theorem. -/
theorem false_of_retainedInteriorDirectedOmission_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (G : TriApexAllLargeContext D S) :
    False := by
  have hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    have hcap := G.cap_card_ge_six S.oppIndex1
    omega
  rcases nonempty_retainedOmissionAllLargeNormalForm P hfirstLarge with ⟨Q⟩
  exact false_of_retainedOmission_triApexAllLarge_core (P := P) R Q G

/- Compatibility wrapper retaining the old public theorem and caller API. -/
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  exact false_of_retainedInteriorDirectedOmission_triApexAllLargeContext R P
    (triApexAllLargeContext_of_residuals L N T)






/-- A second first-apex K4 radius cannot enter the protected unique-radius
arm.  The surplus-cap one-hit bound first supplies a frontier at the prescribed
radius; the original frontier radius then refutes uniqueness, leaving a
source-faithful common-deletion parent at the second radius. -/
theorem exists_distinctRadius_commonDeletionParent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (hfrontierFour :
      4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card) :
    ∃ Fρ : CriticalPairFrontier D S ρ H,
      Nonempty (FrontierCommonDeletionParentResidual Fρ) := by
  let E := SelectedClass D.A S.oppApex1 ρ
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hEfour : 4 ≤ E.card := by
    simpa [E] using hρfour
  have hhit : (E ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, E, SelectedClass, dist_comm] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS ρ
  have hsplit := Finset.card_sdiff_add_card_inter E S.surplusCap
  have hthree : 3 ≤ (E \ S.surplusCap).card := by
    omega
  rcases exists_criticalPairFrontier D S ρ H
      (by simpa [E, SelectedClass, dist_comm] using hthree) with ⟨Fρ⟩
  rcases CriticalPairFrontier.originalUnique_or_commonDeletionParent
      Fρ R.minimal R.noM44 R.carrier_card_gt_nine hρfour with
    hunique | hcommon
  · exfalso
    have hradiusPos : 0 < radius := F.radius_pos
    exact hρne
      (hunique.2 radius hradiusPos hfrontierFour).symm
  · exact ⟨Fρ, hcommon⟩




end ATailFrontierLiveClosure
end Problem97
