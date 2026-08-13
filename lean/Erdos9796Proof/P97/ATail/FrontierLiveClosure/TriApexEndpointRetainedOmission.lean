/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure
import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm

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
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

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
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
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
  · exact false_of_originalFrontierUniqueRadiusArm freshFrontier
      R.minimal R.noM44 R.carrier_card_gt_nine
  · intro freshParent
    have hsix : 6 ≤ T.oppCap1.card := first_oppCap_card_ge_six freshParent
    rw [hTfirst] at hsix
    omega

/-- The all-large-caps residual: every cap of the partition carries at least six
points, so the carrier has at least fifteen points and the least profile is
`(6, 6, 6)`.  This is the honest residual of the cap-six continuation after the
five-point-cap profiles are dispatched. -/
structure FrontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Prop where
  /-- The surplus cap is large as well, not merely the two opposite caps. -/
  surplusCap_card_ge_six : 6 ≤ S.surplusCap.card

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
  apply false_of_originalFrontierUniqueRadiusArm (H := H)
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

/-- The all-large-caps residual with robustness at **all three** Moser apices.

The bi-apex surface only ever reports `oppApex1` and `oppApex2`.  Rotating the
packet so that the surplus cap takes the second opposite role and running the
fresh common-deletion parent on it reports the third, since
`FullyDeletionRobustAt` is a statement about `D` and a point alone and does not
mention the packet.  That rotation is performed in
`false_of_frontierAllLargeCapsBiApexRobustResidual` below, so this residual is
strictly stronger than `FrontierAllLargeCapsBiApexRobustResidual`. -/
structure FrontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    (N : FrontierAllLargeCapsBiApexRobustResidual L) : Prop where
  /-- Every Moser apex carries a six-point class or two distinct K4 radii.
  Robustness alone only gives a five-point class in the first branch; the
  strengthening comes from the first-apex dichotomy, run at each apex in turn
  by rotating the packet. -/
  oppApex1_rich : ApexRichClassStructure D.A S.oppApex1
  /-- Rich class structure at the second opposite apex. -/
  oppApex2_rich : ApexRichClassStructure D.A S.oppApex2
  /-- Rich class structure at the surplus apex. -/
  surplusApex_rich : ApexRichClassStructure D.A S.surplusApex
  /-- Minimality's positive content, in robustness form: the carrier is covered
  by four-point classes of centres carrying exactly one K4 radius, and those are
  exactly the points where deletion robustness fails. -/
  notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card
  /-- No centre covers all three Moser apices on one radius, so at least two
  distinct covering centres are spent on the apices. -/
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

/-- Two hits of one rich opposite-apex class in a canonical critical shell
force that shell's blocker center into the same indexed strict cap.  This is
the uniform ordered-cap localization needed by the tri-apex terminal. -/
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hqClassInterior := Finset.mem_inter.mp hq'.2
  have hwClassInterior := Finset.mem_inter.mp hw'.2
  have hcenterA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcenterNe :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    apply not_isUniqueFourCenter_of_fullyDeletionRobust
      (fullyDeletionRobustAt_of_apexRichClassStructure hrich)
    simpa [hcenter] using hunique
  have hcenterEq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  have hapexEq :
      dist (S.oppositeVertexByIndex i) q =
        dist (S.oppositeVertexByIndex i) w :=
    (mem_selectedClass.mp hqClassInterior.1).2.trans
      (mem_selectedClass.mp hwClassInterior.1).2.symm
  exact commonPhysicalPair_center_mem_capInteriorByIndex i
    hcenterA hcenterNe hqClassInterior.2 hwClassInterior.2 hqw
    hcenterEq hapexEq

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

/- The indexed context consumed by the E1 core.  The old residual chain is
flattened here once; the core need not repeatedly distinguish the surplus and
the two named opposite roles. -/
structure TriApexAllLargeContext
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card
  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex i)
  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

private theorem capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppIndex1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex2, hi]

private theorem capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

theorem triApexAllLargeContext_index_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.oppIndex1 ∨ i = S.oppIndex2 ∨ i = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  fin_cases i <;>
    interval_cases j <;>
      simp [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/-- Build the indexed E1 context from the existing residual bundle. -/
theorem triApexAllLargeContext_of_residuals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    TriApexAllLargeContext D S := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rw [capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext]
    exact L.firstOppCap_card_ge_six
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rw [capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext]
    exact L.secondOppCap_card_ge_six
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rw [capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext]
    exact N.surplusCap_card_ge_six
  refine {
    cap_card_ge_six := ?_
    apex_rich := ?_
    notRobustCover_card := T.notRobustCover_card
    no_center_covers_all_apices := T.no_center_covers_all_apices }
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · exact hcap1
    · exact hcap2
    · exact hsurplus
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · simpa using T.oppApex1_rich
    · simpa using T.oppApex2_rich
    · simpa using T.surplusApex_rich

/-- Every canonical critical-shell center lies in one of the three strict cap
interiors once all three opposite apices are rich.  Richness makes every Moser
apex deletion robust, whereas a critical-shell center is unique-four; the cap
partition then leaves only the three strict interiors. -/
theorem exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3, H.centerAt x hx ∈ S.capInteriorByIndex i := by
  have hunique : IsUniqueFourCenter D.A (H.centerAt x hx) :=
    isUniqueFourCenter_centerAt H x hx
  have hcenterNe (i : Fin 3) :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
        (by simpa [hcenter] using hunique)
  have hcenterA : H.centerAt x hx ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt x hx).toCriticalFourShell.center_mem
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim ((hcenterNe S.surplusIdx) hsurplus)
    · exact False.elim ((hcenterNe S.oppIndex1) hfirst)
    · exact False.elim ((hcenterNe S.oppIndex2) hsecond)
  · exact hcap

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

/- A residual-independent form of the source-faithful cover ingress.  The
   endpoint leaves already carry `TriApexAllLargeContext`; requiring the
   older nested residual chain here only obscures the available source data. -/
theorem exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    (q : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty (SelectedFourClass D.A q.1) ∧
      Nonempty (CriticalSelectedFourClass D.A q.1
        (H.centerAt q.1 q.2)) ∧
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase q.1) (H.centerAt q.1 q.2) ∧
      H.centerAt q.1 q.2 ≠ S.oppApex1 ∧
      H.centerAt q.1 q.2 ≠ S.oppApex2 ∧
      H.centerAt q.1 q.2 ≠ S.surplusApex ∧
      ∃ i : Fin 3,
        H.centerAt q.1 q.2 ∈ S.capInteriorByIndex i := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 q.2 with ⟨Kq⟩
  have hcoverUnique :
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) :=
    isUniqueFourCenter_centerAt H q.1 q.2
  have hcoverNe (i : Fin 3) :
      H.centerAt q.1 q.2 ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
          (by simpa [hcenter] using hcoverUnique)
  have hcoverNe₁ :
      H.centerAt q.1 q.2 ≠ S.oppApex1 := by
    intro hcenter
    exact hcoverNe S.oppIndex1 (by simpa using hcenter)
  have hcoverNe₂ :
      H.centerAt q.1 q.2 ≠ S.oppApex2 := by
    intro hcenter
    exact hcoverNe S.oppIndex2 (by simpa using hcenter)
  have hcoverNe₃ :
      H.centerAt q.1 q.2 ≠ S.surplusApex := by
    intro hcenter
    exact hcoverNe S.surplusIdx (by simpa using hcenter)
  exact
    ⟨⟨Kq⟩, ⟨H.selectedAt q.1 q.2⟩, hcoverUnique,
      H.no_qfree_at q.1 q.2, hcoverNe₁, hcoverNe₂, hcoverNe₃,
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G q.2⟩

/-- The bounded source-faithful deletion-fan packet for a selected four-row.

This is a proved finite interface, not an active proof obligation: it records
the canonical blocker data uniformly over all four support points. -/
def SourceFaithfulSelectedFourDeletionFan
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {center : ℝ²} (Row : SelectedFourClass D.A center) : Prop :=
  ∀ (w : ℝ²) (hw : w ∈ Row.support),
    ∃ blockerCap : Fin 3,
      H.centerAt w (Row.support_subset_A hw) ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt w (Row.support_subset_A hw)) ∧
        ((center = H.centerAt w (Row.support_subset_A hw) ∧
            Row.support =
              (H.selectedAt w
                (Row.support_subset_A hw)).toCriticalFourShell.support ∧
            ¬ FullyDeletionRobustAt D center) ∨
          (center ≠ H.centerAt w (Row.support_subset_A hw) ∧
            (Row.support ∩
              (H.selectedAt w
                (Row.support_subset_A hw)).toCriticalFourShell.support).card ≤
              2))

/-- The complete source-faithful packet attached by the deletion fan to one
selected-row point.  This alias lets pair-producing lemmas retain the
dependent packet proofs rather than merely retaining the fan as a whole. -/
def SourceFaithfulSelectedFourDeletionPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (w : ℝ²) (hw : w ∈ Row.support) : Prop :=
  ∃ blockerCap : Fin 3,
    H.centerAt w (Row.support_subset_A hw) ∈
        S.capInteriorByIndex blockerCap ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt w (Row.support_subset_A hw)) ∧
      ((center = H.centerAt w (Row.support_subset_A hw) ∧
          Row.support =
            (H.selectedAt w
              (Row.support_subset_A hw)).toCriticalFourShell.support ∧
          ¬ FullyDeletionRobustAt D center) ∨
        (center ≠ H.centerAt w (Row.support_subset_A hw) ∧
          (Row.support ∩
            (H.selectedAt w
              (Row.support_subset_A hw)).toCriticalFourShell.support).card ≤
            2))

/-- The source-faithful deletion fan over all points of a selected four-row.

For every row point, its canonical blocker is cap-localized and genuinely
blocks after deleting that point.  Comparing the row center with the blocker
then gives the exact equal-support/non-robust versus distinct-center/small-
overlap dichotomy used by the live FreshThird residual.  The statement is
cardinality-independent: the only bounded object is the already selected
four-row itself. -/
theorem sourceFaithfulDeletionFan_of_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {center : ℝ²} (Row : SelectedFourClass D.A center) :
    SourceFaithfulSelectedFourDeletionFan D S H Row := by
  intro w hw
  have hwA : w ∈ D.A := Row.support_subset_A hw
  let q : CriticalShellSystem.CarrierVertex D.A := ⟨w, hwA⟩
  rcases
      exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
        G q with
    ⟨_, _, _, hblocked, _, _, _, blockerCap, hblockerCap⟩
  refine ⟨blockerCap, ?_, ?_, ?_⟩
  · simpa [q] using hblockerCap
  · simpa [q] using hblocked
  · by_cases heq : center = H.centerAt w hwA
    · subst center
      left
      refine
        ⟨rfl, H.selectedFourClass_support_eq_shell w hwA Row, ?_⟩
      intro hrobust
      exact H.no_qfree_at w hwA (hrobust.survives w hwA)
    · right
      exact
        ⟨heq,
          SelectedFourClass.inter_card_le_two Row
            (H.selectedAt w hwA).toCriticalFourShell.toSelectedFourClass heq⟩

/-- Two points outside a chosen cap retain their complete source-faithful
deletion-fan packets.  The two points are returned as carrier vertices, with
their outside proofs made explicit so the dependent packets remain available
to the endpoint consumer. -/
theorem exists_distinct_outsideCap_sourceFaithful_packets
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (i : Fin 3)
    (houtside : 2 ≤ (Row.support \ S.capByIndex i).card)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Row.support \ S.capByIndex i,
        ∃ hw : w.1 ∈ Row.support \ S.capByIndex i,
          z ≠ w ∧ SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
              (Finset.mem_sdiff.mp hw).1 := by
  classical
  let outside : Finset ℝ² := Row.support \ S.capByIndex i
  have hpair : ∃ x ∈ outside, ∃ y ∈ outside, x ≠ y := by
    by_contra hno
    have hle : outside.card ≤ 1 := Finset.card_le_one.mpr (by
      intro x hx y hy
      by_contra hxy
      exact hno ⟨x, hx, y, hy, hxy⟩)
    have : 2 ≤ outside.card := by simpa [outside] using houtside
    omega
  rcases hpair with ⟨x, hx, y, hy, hxy⟩
  have hxRow : x ∈ Row.support :=
    (Finset.mem_sdiff.mp (by simpa [outside] using hx)).1
  have hyRow : y ∈ Row.support :=
    (Finset.mem_sdiff.mp (by simpa [outside] using hy)).1
  let z : CriticalShellSystem.CarrierVertex D.A :=
    ⟨x, Row.support_subset_A hxRow⟩
  let w : CriticalShellSystem.CarrierVertex D.A :=
    ⟨y, Row.support_subset_A hyRow⟩
  have hz : z.1 ∈ Row.support \ S.capByIndex i := by
    simpa [z, outside] using hx
  have hw : w.1 ∈ Row.support \ S.capByIndex i := by
    simpa [w, outside] using hy
  have hzw : z ≠ w := by
    intro h
    apply hxy
    exact congrArg Subtype.val h
  exact ⟨z, w, hz, hw, hzw,
    (show SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
        (Finset.mem_sdiff.mp hz).1 from by
      simpa [SourceFaithfulSelectedFourDeletionPacket] using
        hfan z.1 (Finset.mem_sdiff.mp hz).1),
    (show SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
        (Finset.mem_sdiff.mp hw).1 from by
      simpa [SourceFaithfulSelectedFourDeletionPacket] using
        hfan w.1 (Finset.mem_sdiff.mp hw).1)⟩

/-- Four source-faithful blocker-cap choices on one selected four-row contain
two distinct row points whose actual blockers lie in the same strict indexed
cap.  This is the cardinality-independent repeated-cap normalization at the
front of the remaining FreshThird fan-to-consumer lift. -/
theorem exists_distinct_support_points_with_same_blockerCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        ∃ blockerCap : Fin 3,
          H.centerAt z.1 z.2 ∈
              S.capInteriorByIndex blockerCap ∧
            H.centerAt w.1 w.2 ∈
              S.capInteriorByIndex blockerCap := by
  classical
  let e : Row.support ≃ Fin 4 :=
    Finset.equivFinOfCardEq Row.support_card
  let source : Fin 4 → CriticalShellSystem.CarrierVertex D.A := fun i ↦
    ⟨(e.symm i).1, Row.support_subset_A (e.symm i).2⟩
  have hsource (i : Fin 4) : (source i).1 ∈ Row.support := by
    exact (e.symm i).2
  let capOf : Fin 4 → Fin 3 := fun i ↦
    Classical.choose (hfan (source i).1 (hsource i))
  have hcapOf (i : Fin 4) :
      H.centerAt (source i).1 (source i).2 ∈
        S.capInteriorByIndex (capOf i) := by
    exact (Classical.choose_spec (hfan (source i).1 (hsource i))).1
  have hnotInjective : ¬ Function.Injective capOf := by
    intro hinjective
    have hcard : Fintype.card (Fin 4) ≤ Fintype.card (Fin 3) :=
      Fintype.card_le_of_injective capOf hinjective
    norm_num at hcard
  rcases Function.not_injective_iff.mp hnotInjective with
    ⟨i, j, hcaps, hij⟩
  have hsourcesNe : source i ≠ source j := by
    intro hsources
    apply hij
    apply e.symm.injective
    apply Subtype.ext
    simpa [source] using congrArg Subtype.val hsources
  refine
    ⟨source i, source j, hsource i, hsource j, hsourcesNe,
      capOf i, hcapOf i, ?_⟩
  simpa [hcaps] using hcapOf j

/-- If two distinct sources outside one cap have distinct canonical blockers
inside that cap, at least one cross-deletion preserves a four-point row.

Indeed, if both cross-deletions blocked, each source would lie in the other
source's canonical critical row.  The two blocker centers would then bisect
the same outside pair, contradicting ordered-cap geometry. -/
theorem crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {z w : ℝ²}
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) (hzw : z ≠ w)
    (k : Fin 3)
    (hzCap : H.centerAt z hzA ∈ S.capByIndex k)
    (hwCap : H.centerAt w hwA ∈ S.capByIndex k)
    (hcentersNe : H.centerAt z hzA ≠ H.centerAt w hwA)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k) :
    HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt z hzA) ∨
      HasNEquidistantPointsAt 4 (D.A.erase z) (H.centerAt w hwA) := by
  by_contra hblocked
  push_neg at hblocked
  have hwInZ :
      w ∈ (H.selectedAt z hzA).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt z hzA) hblocked.1
  have hzInW :
      z ∈ (H.selectedAt w hwA).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt w hwA) hblocked.2
  have hzEq :
      dist (H.centerAt z hzA) z = dist (H.centerAt z hzA) w :=
    ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z
        (H.selectedAt z hzA).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius w hwInZ).symm
  have hwEq :
      dist (H.centerAt w hwA) z = dist (H.centerAt w hwA) w :=
    ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius z hzInW).trans
      ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius w
        (H.selectedAt w hwA).toCriticalFourShell.q_mem_support).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S k hzCap hwCap hcentersNe hzA hwA hzw hzOff hwOff hzEq hwEq

/-- Two distinct sources on a selected four-row whose center is itself a
carrier point cannot have distinct canonical blockers while both cross
deletions fail.

If both deletions failed, each source would lie on the other source's
canonical critical shell.  The row center and the two distinct blocker
centers would then be three distinct carrier points on the perpendicular
bisector of the source pair, contradicting convex position.  Unlike the
cap-localized variant above, this producer needs no hypothesis about where
the sources lie relative to the blocker cap. -/
theorem crossDeletion_survives_of_distinct_selectedRow_blockers
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) (hwRow : w.1 ∈ Row.support)
    (hzw : z ≠ w)
    (hzBlockerNeCenter : H.centerAt z.1 z.2 ≠ center)
    (hwBlockerNeCenter : H.centerAt w.1 w.2 ≠ center)
    (hblockersNe : H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2) :
    HasNEquidistantPointsAt 4 (D.A.erase w.1) (H.centerAt z.1 z.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase z.1)
        (H.centerAt w.1 w.2) := by
  classical
  by_contra hblocked
  push_neg at hblocked
  have hwInZ :
      w.1 ∈ (H.selectedAt z.1 z.2).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt z.1 z.2) hblocked.1
  have hzInW :
      z.1 ∈ (H.selectedAt w.1 w.2).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt w.1 w.2) hblocked.2
  have hzwVal : z.1 ≠ w.1 := by
    intro hvals
    exact hzw (Subtype.ext hvals)
  have hcenterEq : dist center z.1 = dist center w.1 :=
    (Row.support_eq_radius z.1 hzRow).trans
      (Row.support_eq_radius w.1 hwRow).symm
  have hzBlockerA : H.centerAt z.1 z.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt z.1 z.2).toCriticalFourShell.center_mem).2
  have hwBlockerA : H.centerAt w.1 w.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt w.1 w.2).toCriticalFourShell.center_mem).2
  have hzBlockerEq :
      dist (H.centerAt z.1 z.2) z.1 =
        dist (H.centerAt z.1 z.2) w.1 :=
    ((H.selectedAt z.1 z.2).toCriticalFourShell.support_eq_radius z.1
        (H.selectedAt z.1 z.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt z.1 z.2).toCriticalFourShell.support_eq_radius w.1
        hwInZ).symm
  have hwBlockerEq :
      dist (H.centerAt w.1 w.2) z.1 =
        dist (H.centerAt w.1 w.2) w.1 :=
    ((H.selectedAt w.1 w.2).toCriticalFourShell.support_eq_radius z.1
        hzInW).trans
      ((H.selectedAt w.1 w.2).toCriticalFourShell.support_eq_radius w.1
        (H.selectedAt w.1 w.2).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex z.2 w.2 hzwVal
  have hthree :
      2 < (D.A.filter (fun p ↦ dist p z.1 = dist p w.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨center, Finset.mem_filter.mpr ⟨hcenterA, hcenterEq⟩,
        H.centerAt z.1 z.2,
          Finset.mem_filter.mpr ⟨hzBlockerA, hzBlockerEq⟩,
        H.centerAt w.1 w.2,
          Finset.mem_filter.mpr ⟨hwBlockerA, hwBlockerEq⟩,
        hzBlockerNeCenter.symm, hwBlockerNeCenter.symm, hblockersNe⟩
  exact (not_lt_of_ge hbound) hthree

/-- Source-faithful repeated-cap normalization with the first geometric case
split already discharged.  Two distinct points of a selected four-row have
blockers in one strict cap; either the blockers coincide, one source lies in
that closed cap, or one of the two cross-deletions survives. -/
theorem exists_repeatedBlockerCap_pair_outcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        ∃ blockerCap : Fin 3,
          H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
            H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
            (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
              z.1 ∈ S.capByIndex blockerCap ∨
              w.1 ∈ S.capByIndex blockerCap ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  rcases exists_distinct_support_points_with_same_blockerCap Row hfan with
    ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCapInterior, hwCapInterior⟩
  have hzwVal : z.1 ≠ w.1 := by
    intro hvals
    exact hzw (Subtype.ext hvals)
  have hzCap : H.centerAt z.1 z.2 ∈ S.capByIndex blockerCap :=
    S.capInteriorByIndex_subset_capByIndex blockerCap hzCapInterior
  have hwCap : H.centerAt w.1 w.2 ∈ S.capByIndex blockerCap :=
    S.capInteriorByIndex_subset_capByIndex blockerCap hwCapInterior
  refine
    ⟨z, w, hzRow, hwRow, hzw, blockerCap,
      hzCapInterior, hwCapInterior, ?_⟩
  by_cases hcenters : H.centerAt z.1 z.2 = H.centerAt w.1 w.2
  · exact Or.inl hcenters
  by_cases hzIn : z.1 ∈ S.capByIndex blockerCap
  · exact Or.inr (Or.inl hzIn)
  by_cases hwIn : w.1 ∈ S.capByIndex blockerCap
  · exact Or.inr (Or.inr (Or.inl hwIn))
  rcases
      crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
        z.2 w.2 hzwVal blockerCap hzCap hwCap hcenters hzIn hwIn with
    hzwSurvives | hwzSurvives
  · exact Or.inr (Or.inr (Or.inr (Or.inl hzwSurvives)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr hwzSurvives)))

/-- A four-vertex directed graph with at least two outgoing non-edges at
every vertex contains a mutually missing pair.  Keeping this closed finite
kernel separate makes the geometric lift below independent of a hand-written
case split on the four support slots. -/
private theorem finFour_exists_mutualFalse_of_row_card_le_two :
    ∀ contains : Fin 4 → Fin 4 → Bool,
      (∀ i, contains i i = true) →
      (∀ i, (Finset.univ.filter fun j ↦ contains i j).card ≤ 2) →
      ∃ i j : Fin 4,
        i ≠ j ∧ contains i j = false ∧ contains j i = false := by
  native_decide

/-- If none of the four sources in a source-faithful deletion fan uses the
row center itself as its canonical blocker, two sources mutually omit one
another from their actual critical shells.  Equivalently, deleting either
source preserves a four-point row at the other source's blocker.

This is cardinality-independent: the only enumeration is the already exact
four-point support. -/
theorem exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hcenterNe : ∀ (w : ℝ²) (hw : w ∈ Row.support),
      center ≠ H.centerAt w (Row.support_subset_A hw)) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        HasNEquidistantPointsAt 4 (D.A.erase w.1)
          (H.centerAt z.1 z.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1)
          (H.centerAt w.1 w.2) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  classical
  let e : Row.support ≃ Fin 4 :=
    Finset.equivFinOfCardEq Row.support_card
  let source : Fin 4 → CriticalShellSystem.CarrierVertex D.A := fun i ↦
    ⟨(e.symm i).1, Row.support_subset_A (e.symm i).2⟩
  have hsource (i : Fin 4) : (source i).1 ∈ Row.support := by
    exact (e.symm i).2
  let contains : Fin 4 → Fin 4 → Bool := fun i j ↦
    decide ((source j).1 ∈
      (H.selectedAt (source i).1 (source i).2).toCriticalFourShell.support)
  have hself (i : Fin 4) : contains i i = true := by
    simp only [contains, decide_eq_true_eq]
    exact
      (H.selectedAt (source i).1
        (source i).2).toCriticalFourShell.q_mem_support
  have hrowBound (i : Fin 4) :
      (Finset.univ.filter fun j ↦ contains i j).card ≤ 2 := by
    have hinter :
        (Row.support ∩
          (H.selectedAt (source i).1
            (source i).2).toCriticalFourShell.support).card ≤ 2 := by
      rcases hfan (source i).1 (hsource i) with
        ⟨_, _, _, hsame | hdistinct⟩
      · exact False.elim ((hcenterNe (source i).1 (hsource i)) hsame.1)
      · exact hdistinct.2
    rw [← show
      (Finset.univ.filter fun j ↦ contains i j).card =
          (Row.support ∩
            (H.selectedAt (source i).1
              (source i).2).toCriticalFourShell.support).card by
        refine Finset.card_bij (fun j _ ↦ (e.symm j).1) ?_ ?_ ?_
        · intro j hj
          have hjContains : contains i j = true :=
            (Finset.mem_filter.mp hj).2
          exact Finset.mem_inter.mpr ⟨(e.symm j).2, by
            simpa only [contains, decide_eq_true_eq] using hjContains⟩
        · intro a _ b _ hab
          apply e.symm.injective
          exact Subtype.ext hab
        · intro point hpoint
          let pointInRow : Row.support :=
            ⟨point, (Finset.mem_inter.mp hpoint).1⟩
          refine ⟨e pointInRow, ?_, ?_⟩
          · refine Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩
            simp only [contains, decide_eq_true_eq]
            simpa [source, pointInRow] using
              (Finset.mem_inter.mp hpoint).2
          · simp [pointInRow]
      ] at hinter
    exact hinter
  rcases finFour_exists_mutualFalse_of_row_card_le_two contains hself hrowBound with
    ⟨i, j, hij, hijOmit, hjiOmit⟩
  have hsourcesNe : source i ≠ source j := by
    intro hsources
    apply hij
    apply e.symm.injective
    apply Subtype.ext
    simpa [source] using congrArg Subtype.val hsources
  have hijNotMem :
      (source j).1 ∉
        (H.selectedAt (source i).1
          (source i).2).toCriticalFourShell.support := by
    simpa only [contains, decide_eq_false_iff_not] using hijOmit
  have hjiNotMem :
      (source i).1 ∉
        (H.selectedAt (source j).1
          (source j).2).toCriticalFourShell.support := by
    simpa only [contains, decide_eq_false_iff_not] using hjiOmit
  exact
    ⟨source i, source j, hsource i, hsource j, hsourcesNe,
      (cross_deletion_survives_iff_not_mem_selected_support
        H (source i).2).mpr hijNotMem,
      (cross_deletion_survives_iff_not_mem_selected_support
        H (source j).2).mpr hjiNotMem,
      blocker_centers_ne_of_not_mem_other_selected_support
        H (source i).2 (source j).2 hjiNotMem⟩

/-- Preserve the concrete source and canonical blocker when a source-faithful
four-row enters its nonrobust-center arm.  The existing cap-synchronized fan
theorem deliberately forgets this witness; this adapter retains the blocker
cap, blocked deletion, selected-shell equality, and unique-four provenance. -/
theorem exists_nonrobustCenter_witness_of_sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hcenterBlocker :
      ∃ (q : ℝ²) (hq : q ∈ Row.support),
        center = H.centerAt q (Row.support_subset_A hq)) :
    ∃ (q : ℝ²) (hq : q ∈ Row.support) (blockerCap : Fin 3),
      center = H.centerAt q (Row.support_subset_A hq) ∧
        H.centerAt q (Row.support_subset_A hq) ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt q (Row.support_subset_A hq)) ∧
        Row.support =
          (H.selectedAt q
            (Row.support_subset_A hq)).toCriticalFourShell.support ∧
        IsUniqueFourCenter D.A center ∧
        ¬ FullyDeletionRobustAt D center := by
  rcases hcenterBlocker with ⟨q, hq, hcenter⟩
  rcases hfan q hq with ⟨blockerCap, hcap, hblocked, hsame | hdistinct⟩
  · refine ⟨q, hq, blockerCap, hcenter, hcap, hblocked, hsame.2.1, ?_, hsame.2.2⟩
    rw [hcenter]
    exact isUniqueFourCenter_centerAt H q (Row.support_subset_A hq)
  · exact False.elim (hdistinct.1 hcenter)

/-- Every source-faithful four-row exposes one of the two genuinely global
fan outcomes: either its center is not deletion-robust, or two row sources
mutually omit one another from their actual critical shells.  The first arm
is forced as soon as one actual blocker is the row center; otherwise the
finite four-vertex producer above supplies the second arm. -/
theorem nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          HasNEquidistantPointsAt 4 (D.A.erase w.1)
            (H.centerAt z.1 z.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase z.1)
            (H.centerAt w.1 w.2) ∧
          H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  classical
  by_cases hcenterBlocker :
      ∃ (w : ℝ²) (hw : w ∈ Row.support),
        center = H.centerAt w (Row.support_subset_A hw)
  · rcases hcenterBlocker with ⟨w, hw, hcenter⟩
    rcases hfan w hw with ⟨_, _, _, hsame | hdistinct⟩
    · exact Or.inl hsame.2.2
    · exact False.elim (hdistinct.1 hcenter)
  · right
    exact
      exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
        Row hfan (by
          intro w hw hcenter
          exact hcenterBlocker ⟨w, hw, hcenter⟩)

/-- A source-faithful row whose center is a carrier point has a cap-synchronized
terminal normalization.

Either the row center is not fully deletion-robust, or two distinct row
sources have blockers in the same strict cap and expose the only remaining
alternatives: the blockers coincide, or one of the two cross-deletions
survives.  The perpendicular-bisector producer above removes the former
"one source lies inside the blocker cap" escape from this carrier-centered
version. -/
theorem
    nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          ∃ blockerCap : Fin 3,
            H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
              H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
              (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
                HasNEquidistantPointsAt 4 (D.A.erase w.1)
                  (H.centerAt z.1 z.2) ∨
                HasNEquidistantPointsAt 4 (D.A.erase z.1)
                  (H.centerAt w.1 w.2)) := by
  classical
  by_cases hcenterBlocker :
      ∃ (w : ℝ²) (hw : w ∈ Row.support),
        center = H.centerAt w (Row.support_subset_A hw)
  · rcases hcenterBlocker with ⟨w, hw, hcenter⟩
    rcases hfan w hw with ⟨_, _, _, hsame | hdistinct⟩
    · exact Or.inl hsame.2.2
    · exact False.elim (hdistinct.1 hcenter)
  · right
    rcases exists_distinct_support_points_with_same_blockerCap Row hfan with
      ⟨z, w, hzRow, hwRow, hzw, blockerCap,
        hzCapInterior, hwCapInterior⟩
    refine
      ⟨z, w, hzRow, hwRow, hzw, blockerCap,
        hzCapInterior, hwCapInterior, ?_⟩
    by_cases hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2
    · exact Or.inl hblockers
    · have hzBlockerNeCenter : H.centerAt z.1 z.2 ≠ center := by
        intro hzEq
        exact hcenterBlocker ⟨z.1, hzRow, hzEq.symm⟩
      have hwBlockerNeCenter : H.centerAt w.1 w.2 ≠ center := by
        intro hwEq
        exact hcenterBlocker ⟨w.1, hwRow, hwEq.symm⟩
      rcases
          crossDeletion_survives_of_distinct_selectedRow_blockers
            hcenterA Row z w hzRow hwRow hzw
              hzBlockerNeCenter hwBlockerNeCenter hblockers with
        hzwSurvives | hwzSurvives
      · exact Or.inr (Or.inl hzwSurvives)
      · exact Or.inr (Or.inr hwzSurvives)

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
  sorry

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
radii (`PairedTwoRadiusGrid.richClass_mem`), and the strict first-cap interior
placement of all eight grid points is pinned by `PairedGridCapPlacement`. -/
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
  sorry

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

/-- Source-faithful data retained after the fresh reverse-hit branch has been
turned into its nonreturning two-step walk.  The endpoint leaves below receive
this whole context, so the endpoint split does not erase the reverse-shell
localization or any freshness hypothesis. -/
structure ReverseHitFreshEndpointContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) : Type where
  reverse_mem :
    O.kept ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  reverseBlocker_mem_capInterior :
    H.centerAt O.deleted O.deleted_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  reverseShell_inter_cap_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {O.kept, O.deleted}
  fresh : ℝ²
  fresh_mem_capInterior :
    fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_kept : fresh ≠ O.kept
  fresh_ne_deleted : fresh ≠ O.deleted
  fresh_not_mem_reverseShell :
    fresh ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  freshPacket :
    CommonDeletionTwoCenterPacket
      D H fresh S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)
  allLarge : TriApexAllLargeContext D S
  walk : RetainedMatchingTwoStepCommonDeletionWalk R
  walk_first_eq : walk.first = O.kept
  walk_second_eq : walk.second = O.deleted
  walk_next_eq : walk.next = fresh

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

/- The two selected supports exposed at an endpoint collision.  One is the
critical exact shell through the first collision source; the other is the
fresh first-apex selected row. -/
noncomputable def endpointFreshTwoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E) : Finset ℝ² :=
  (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell.support ∪
    Q.row.support

/-- Both selected supports in the endpoint seed consist of carrier points. -/
theorem endpointFresh_twoShellSeed_subset_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E) :
    endpointFreshTwoShellSeed E Q ⊆ D.A := by
  intro z hz
  simp only [endpointFreshTwoShellSeed, Finset.mem_union] at hz
  rcases hz with hz | hz
  · exact
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell.support_subset_A hz
  · exact Q.row.support_subset_A hz

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

/-- Minimality and the all-large cap floor force a global K4 row to escape
the two supports already exposed by an endpoint collision.

This is the first all-center continuation beyond the locally realizable
shared-blocker two-circle pattern: the seed has at most eight points, whereas
the three large caps force at least fifteen carrier points. -/
theorem endpointFresh_exists_selectedRow_escape_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧ z ∉ endpointFreshTwoShellSeed E Q := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A :=
    endpointFresh_twoShellSeed_subset_carrier E Q
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card ≤ 8 := by
    calc
      (endpointFreshTwoShellSeed E Q).card
          ≤ KA.support.card + Q.row.support.card := by
            exact Finset.card_union_le KA.support Q.row.support
      _ = 8 := by rw [KA.support_card, Q.row.support_card]
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 8 := by
      simpa [hseedEq] using hseedCard
    have hAge : 15 ≤ D.A.card :=
      ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
        S C.allLarge.cap_card_ge_six
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 E.fiber.source₁.2 with
    ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

/-- Source-faithful refinement of the two-shell escape producer.

The escaping selected row can be retained together with a deletion
obstruction: either its center is fully deletion robust, or deleting the
escaping point exposes a critical selected four-class at that center.  This
is the form consumed by source-level continuation arguments; it does not
assert a preferred row or identify a selected support with a full physical
radius class.
-/
theorem endpointFresh_exists_criticalRow_escape_or_fullyDeletionRobust_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ endpointFreshTwoShellSeed E Q ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                      K.support = C.toCriticalFourShell.support) := by
  rcases
      endpointFresh_exists_selectedRow_escape_twoShellSeed
        R O C E Q with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, hcenter, K, z, hzK, hzOutside, ?_⟩
  by_cases hrobust : FullyDeletionRobustAt D center
  · exact Or.inl hrobust
  · right
    have hcenterA : center ∈ D.A :=
      endpointFresh_twoShellSeed_subset_carrier E Q hcenter
    exact
      exists_criticalSelectedFourClass_of_mem_of_not_fullyDeletionRobust
        hcenterA K hzK hrobust

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

/-- Reverse-hit/fresh-common-deletion branch of the E1 geometric consumer.
This branch retains the localized reverse blocker, its exact two-point
first-cap intersection, and the fresh common-deletion packet explicitly.  Its
body is now a checked dispatch to the two exact nonreturn endpoint shapes. -/
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
  rcases exists_reverseHitFresh_nonreturnEndpointClassification R O fresh
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted freshPacket with
    ⟨W, hfirst, hsecond, hnext, endpoint⟩
  let C : ReverseHitFreshEndpointContext R O := {
    reverse_mem := reverse_mem
    reverseBlocker_mem_capInterior := reverseBlocker_mem_capInterior
    reverseShell_inter_cap_eq := reverseShell_inter_cap_eq
    fresh := fresh
    fresh_mem_capInterior := fresh_mem_capInterior
    fresh_ne_kept := fresh_ne_kept
    fresh_ne_deleted := fresh_ne_deleted
    fresh_not_mem_reverseShell := fresh_not_mem_reverseShell
    freshPacket := freshPacket
    allLarge := G
    walk := W
    walk_first_eq := hfirst
    walk_second_eq := hsecond
    walk_next_eq := hnext }
  rcases endpoint with
    ⟨endpointCriticalFiber⟩ | ⟨threeDistinctBlockers⟩
  · rcases endpointCriticalFiber with ⟨endpointCriticalFiber⟩
    have endpointCriticalFiber' :
        RetainedMatchingEndpointCriticalFiber C.walk := by
      simpa [C] using endpointCriticalFiber
    exact
      false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core
        R O C endpointCriticalFiber'
  · rcases threeDistinctBlockers with ⟨threeDistinctBlockers⟩
    have threeDistinctBlockers' :
        RetainedMatchingThreeDistinctBlockerPath C.walk := by
      simpa [C] using threeDistinctBlockers
    exact
      false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core
        R O C threeDistinctBlockers'

/- The actual E1 coordinator.  The former single obligation dispatches to the
paired terminal and the proved reverse-hit/fresh coordinator, which in turn
dispatches to its two endpoint terminals. -/
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
  have hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    have hcap :=
      (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six
        S.oppIndex1
    omega
  rcases nonempty_retainedOmissionAllLargeNormalForm P hfirstLarge with ⟨Q⟩
  exact false_of_retainedOmission_triApexAllLarge_core (P := P) R Q
    (triApexAllLargeContext_of_residuals L N T)

/-- A strict first-cap point on a radius distinct from the retained frontier
radius cannot lie in the localized collision shell.  Indeed, that shell has
only the two collision sources in the whole first cap, and both sources lie on
the retained frontier radius. -/
theorem secondRadiusInterior_disjoint_collisionShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1) =
      ∅ := by
  classical
  ext z
  constructor
  · intro hz
    exfalso
    rcases Finset.mem_inter.mp hz with ⟨hzShell, hzρInterior⟩
    rcases Finset.mem_inter.mp hzρInterior with ⟨hzρ, hzInterior⟩
    have hzPair : z ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr
        ⟨hzShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    rcases hzPair with rfl | rfl
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₂_mem_radius).2
  · simp

/-- Every strict first-cap point on the distinct second radius has an actual
blocker different from the localized collision blocker. -/
theorem secondRadiusInterior_blocker_ne_collisionBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    H.centerAt z hzA ≠
      H.centerAt P.source₁ P.source₁_mem_A := by
  intro hcenters
  have hsupportEq :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt z hzA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H z hzA,
      hcenters]
  have hzBoth :
      z ∈
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1) := by
    exact Finset.mem_inter.mpr
      ⟨hsupportEq.symm ▸
          (H.selectedAt z hzA).toCriticalFourShell.q_mem_support,
        hzρInterior⟩
  rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
  simp at hzBoth

/-- The perpendicular-bisector blocker rigidity argument only needs the two
sources to share some first-apex radius; that radius need not be the frontier
radius indexing `R`. -/
theorem blocker_centers_eq_of_secondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {frontierRadius commonRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S frontierRadius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using R.common.packet.center₁_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- Two distinct strict-cap points on one rich-apex radius whose canonical
critical shells have the same blocker determine that blocker's complete
intersection with the indexed cap.  In particular, the common blocker is
strictly inside the cap and its selected shell meets the whole cap in exactly
the two source points. -/
theorem equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3} {r : ℝ}
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A)
    (hx :
      x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hy :
      y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hxy : x ≠ y)
    (hblockers : H.centerAt x hxA = H.centerAt y hyA)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hxA)) :
    H.centerAt x hxA ∈ S.capInteriorByIndex i ∧
      (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i =
        {x, y} := by
  classical
  have hsupports :
      (H.selectedAt x hxA).toCriticalFourShell.support =
        (H.selectedAt y hyA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H y hyA,
      hblockers]
  have hyShell :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support := by
    rw [hsupports]
    exact (H.selectedAt y hyA).toCriticalFourShell.q_mem_support
  have hpairSubsetSlice :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support, hx⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hyShell, hy⟩
  have htwo :
      2 ≤
        ((H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
    simpa [hxy] using Finset.card_le_card hpairSubsetSlice
  have hcenterInterior :
      H.centerAt x hxA ∈ S.capInteriorByIndex i :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hxA hrich hunique htwo
  have hpairSubsetCap :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hx).2⟩
    · subst z
      exact Finset.mem_inter.mpr
        ⟨hyShell,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hy).2⟩
  have hcapTwo :
      ((H.selectedAt x hxA).toCriticalFourShell.support ∩
        S.capByIndex i).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i
        (H.selectedAt x hxA).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex i hcenterInterior)
  exact ⟨hcenterInterior,
    (Finset.eq_of_subset_of_card_le hpairSubsetCap (by
      simpa [hxy] using hcapTwo)).symm⟩

/-- Two exact two-point cap intersections of four-point rows, supported on
disjoint pairs, force the complete cross-omission rectangle.  Each row also
has exactly two support points outside the cap. -/
theorem exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
    {α : Type*} [DecidableEq α]
    {K₀ K₁ C : Finset α} {a b u v : α}
    (hK₀card : K₀.card = 4)
    (hK₁card : K₁.card = 4)
    (hK₀cap : K₀ ∩ C = {a, b})
    (hK₁cap : K₁ ∩ C = {u, v})
    (hab : a ≠ b) (huv : u ≠ v)
    (hpairs : Disjoint ({a, b} : Finset α) {u, v}) :
    u ∉ K₀ ∧ v ∉ K₀ ∧ a ∉ K₁ ∧ b ∉ K₁ ∧
      (K₀ \ C).card = 2 ∧ (K₁ \ C).card = 2 := by
  have haC : a ∈ C := by
    have haInter : a ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp haInter).2
  have hbC : b ∈ C := by
    have hbInter : b ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp hbInter).2
  have huC : u ∈ C := by
    have huInter : u ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp huInter).2
  have hvC : v ∈ C := by
    have hvInter : v ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp hvInter).2
  have huNotK₀ : u ∉ K₀ := by
    intro huK₀
    have huPair₀ : u ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨huK₀, huC⟩
    exact Finset.disjoint_left.mp hpairs huPair₀ (by simp)
  have hvNotK₀ : v ∉ K₀ := by
    intro hvK₀
    have hvPair₀ : v ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨hvK₀, hvC⟩
    exact Finset.disjoint_left.mp hpairs hvPair₀ (by simp)
  have haNotK₁ : a ∉ K₁ := by
    intro haK₁
    have haPair₁ : a ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨haK₁, haC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) haPair₁
  have hbNotK₁ : b ∉ K₁ := by
    intro hbK₁
    have hbPair₁ : b ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨hbK₁, hbC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) hbPair₁
  have hsplit₀ := Finset.card_sdiff_add_card_inter K₀ C
  have houtside₀ : (K₀ \ C).card = 2 := by
    rw [hK₀card, hK₀cap] at hsplit₀
    simp [hab] at hsplit₀
    omega
  have hsplit₁ := Finset.card_sdiff_add_card_inter K₁ C
  have houtside₁ : (K₁ \ C).card = 2 := by
    rw [hK₁card, hK₁cap] at hsplit₁
    simp [huv] at hsplit₁
    omega
  exact
    ⟨huNotK₀, hvNotK₀, haNotK₁, hbNotK₁, houtside₀, houtside₁⟩

/-- Six pairwise accounted-for interior points are forced unless one blocker
coincides with a source from the other pair. -/
theorem six_interior_or_cross_blocker_coincidence
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀b₁ : b₀ ≠ b₁)
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I) :
    6 ≤ I.card ∨ b₀ = u ∨ b₀ = v ∨ b₁ = p₁ ∨ b₁ = p₂ := by
  by_cases hb₀u : b₀ = u
  · exact Or.inr (Or.inl hb₀u)
  by_cases hb₀v : b₀ = v
  · exact Or.inr (Or.inr (Or.inl hb₀v))
  by_cases hb₁p₁ : b₁ = p₁
  · exact Or.inr (Or.inr (Or.inr (Or.inl hb₁p₁)))
  by_cases hb₁p₂ : b₁ = p₂
  · exact Or.inr (Or.inr (Or.inr (Or.inr hb₁p₂)))
  left
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hb₀NotPairUnion : b₀ ∉ pairUnion := by
    simp [pairUnion, hb₀p₁, hb₀p₂, hb₀u, hb₀v]
  have hb₁NotInsert : b₁ ∉ insert b₀ pairUnion := by
    simp [pairUnion, hb₀b₁.symm, hb₁p₁, hb₁p₂, hb₁u, hb₁v]
  have hpacketCard :
      (insert b₁ (insert b₀ pairUnion)).card = 6 := by
    simp [hb₁NotInsert, hb₀NotPairUnion, hpairUnionCard]
  have hpacketSubset : insert b₁ (insert b₀ pairUnion) ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₁I
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₀I
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  calc
    6 = (insert b₁ (insert b₀ pairUnion)).card := hpacketCard.symm
    _ ≤ I.card := Finset.card_le_card hpacketSubset

/-- If the interior consists of the four disjoint source points, each blocker
must be one of the sources from the other pair. -/
theorem four_interior_forces_both_cross_blocker_coincidences
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4) :
    (b₀ = u ∨ b₀ = v) ∧ (b₁ = p₁ ∨ b₁ = p₂) := by
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hpairUnionSubset : pairUnion ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  have hpairUnionEq : pairUnion = I :=
    Finset.eq_of_subset_of_card_le hpairUnionSubset (by omega)
  have hb₀PairUnion : b₀ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₀I
  have hb₁PairUnion : b₁ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₁I
  constructor
  · rcases Finset.mem_union.mp hb₀PairUnion with hb₀pair | hb₀pair
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact False.elim (hb₀p₁ h)
      · exact False.elim (hb₀p₂ (Finset.mem_singleton.mp h))
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
  · rcases Finset.mem_union.mp hb₁PairUnion with hb₁pair | hb₁pair
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact False.elim (hb₁u h)
      · exact False.elim (hb₁v (Finset.mem_singleton.mp h))

/-- Every strict first-cap point on the distinct second radius can replace the
fresh point in a localized common-deletion packet and hence seed a
source-exact mutual-omission cycle. -/
theorem exists_secondRadiusInterior_localizedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²}
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    ∃ L : LocalizedCollisionCommonDeletion P,
      L.fresh = z ∧
        Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hzρInterior).1).1
  have hzNotShell :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzBoth :
        z ∈
          (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∩
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1) :=
      Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
    simp at hzBoth
  have hzNeSource₁ : z ≠ P.source₁ := by
    intro h
    apply hzNotShell
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hzNeSource₂ : z ≠ P.source₂ := by
    intro h
    apply hzNotShell
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hzNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives z hzA
  have hblockerA :
      H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hzA R.common.packet.center₁_mem_A hblockerA
      (R.actualBlocker_ne_firstApex
        P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  let L : LocalizedCollisionCommonDeletion P := {
    fresh := z
    fresh_mem_capInterior := (Finset.mem_inter.mp hzρInterior).2
    fresh_ne_source₁ := hzNeSource₁
    fresh_ne_source₂ := hzNeSource₂
    fresh_not_mem_shell := hzNotShell
    packet := packet }
  refine ⟨L, rfl, ?_⟩
  exact nonempty_localizedCollisionMutualOmissionCycle P L

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

/-- Two selected four-classes with distinct centres in one indexed ordered cap
share at most one support point outside that cap. -/
theorem selectedFourClass_outside_overlap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {c d : ℝ²}
    (hcCap : c ∈ S.capByIndex i)
    (hdCap : d ∈ S.capByIndex i)
    (hcd : c ≠ d)
    (Kc : SelectedFourClass D.A c)
    (Kd : SelectedFourClass D.A d) :
    ((Kc.support \ S.capByIndex i) ∩
      (Kd.support \ S.capByIndex i)).card ≤ 1 := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  by_contra hcard
  have hone :
      1 <
        ((Kc.support \ S.capByIndex i) ∩
          (Kd.support \ S.capByIndex i)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_inter.mp ha with ⟨haKcOff, haKdOff⟩
  rcases Finset.mem_inter.mp hb with ⟨hbKcOff, hbKdOff⟩
  have haKc : a ∈ Kc.support := (Finset.mem_sdiff.mp haKcOff).1
  have hbKc : b ∈ Kc.support := (Finset.mem_sdiff.mp hbKcOff).1
  have haKd : a ∈ Kd.support := (Finset.mem_sdiff.mp haKdOff).1
  have hbKd : b ∈ Kd.support := (Finset.mem_sdiff.mp hbKdOff).1
  have haOff : a ∉ S.capByIndex i := (Finset.mem_sdiff.mp haKcOff).2
  have hbOff : b ∉ S.capByIndex i := (Finset.mem_sdiff.mp hbKcOff).2
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have hcEq : dist c a = dist c b :=
    (Kc.support_eq_radius a haKc).trans
      (Kc.support_eq_radius b hbKc).symm
  have hdEq : dist d a = dist d b :=
    (Kd.support_eq_radius a haKd).trans
      (Kd.support_eq_radius b hbKd).symm
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)

/-- If two distinct carrier points lie on one selected four-class and have the
same actual selected-row centre, then the original row centre and that common
centre cannot lie in one indexed cap while both points lie outside it. -/
theorem false_of_selectedFourClass_common_actualCenter_pair_outside_cap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3)
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support)
    (hwRow : w.1 ∈ Row.support)
    (hzw : z.1 ≠ w.1)
    (hactualCenters :
      H.centerAt z.1 z.2 = H.centerAt w.1 w.2)
    (hcenterCap : center ∈ S.capByIndex i)
    (hactualCenterCap : H.centerAt z.1 z.2 ∈ S.capByIndex i)
    (hzOutside : z.1 ∉ S.capByIndex i)
    (hwOutside : w.1 ∉ S.capByIndex i)
    (hcenter_ne_actualCenter : center ≠ H.centerAt z.1 z.2) :
    False := by
  classical
  let ActualRow : SelectedFourClass D.A (H.centerAt z.1 z.2) :=
    (H.selectedAt z.1 z.2).toCriticalFourShell.toSelectedFourClass
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H z.2 w.2 hactualCenters
  have hzActual : z.1 ∈ ActualRow.support := by
    simpa [ActualRow, CriticalFourShell.toSelectedFourClass] using
      (H.selectedAt z.1 z.2).toCriticalFourShell.q_mem_support
  have hwActual : w.1 ∈ ActualRow.support := by
    have hown :=
      (H.selectedAt w.1 w.2).toCriticalFourShell.q_mem_support
    rw [← hsupports] at hown
    simpa [ActualRow, CriticalFourShell.toSelectedFourClass] using hown
  have hpairSubset :
      ({z.1, w.1} : Finset ℝ²) ⊆
        (Row.support \ S.capByIndex i) ∩
          (ActualRow.support \ S.capByIndex i) := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hzRow, hzOutside⟩,
          Finset.mem_sdiff.mpr ⟨hzActual, hzOutside⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hwRow, hwOutside⟩,
          Finset.mem_sdiff.mpr ⟨hwActual, hwOutside⟩⟩
  have htwo :
      2 ≤
        ((Row.support \ S.capByIndex i) ∩
          (ActualRow.support \ S.capByIndex i)).card := by
    simpa [hzw] using Finset.card_le_card hpairSubset
  have hone :=
    selectedFourClass_outside_overlap_card_le_one
      S i hcenterCap hactualCenterCap hcenter_ne_actualCenter Row ActualRow
  omega

end ATailFrontierLiveClosure
end Problem97
