/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonLabelTransport
import Erdos9796Proof.P97.ATail.FirstApexShellRoleExtractor

/-!
# Source-faithful semantic row table for the exact-five card-thirteen ingress

This scratch module constructs the mathematical witnesses that precede the
Boolean packers.  It deliberately keeps the two global-cover row families
independent: each edge chooses its own deletion-surviving four-row at every
carrier center.

No certificate replay or finite bit packing occurs here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem selectedFourClass_support_transport
    {A : Finset ℝ²} {a b : ℝ²} (h : a = b)
    (K : SelectedFourClass A a) :
    (h ▸ K).support = K.support := by
  cases h
  rfl

/-- One selected ambient four-row obtained from a witness after deleting one
of two endpoints.  The disjunction is the exact source semantics: it does not
choose or assert a common deleted endpoint across centers. -/
structure DeletionCoverRow (A : Finset ℝ²) (center left right : ℝ²) : Type where
  row : SelectedFourClass A center
  omits_left_or_right : left ∉ row.support ∨ right ∉ row.support

/-- A four-witness in an erased carrier lifts to an ambient selected row that
omits the erased point. -/
private theorem exists_selectedFourClass_omitting_of_erasedK4
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hK4 : HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  unfold HasNEquidistantPointsAt at hK4
  rcases hK4 with ⟨r, hradius, hcard⟩
  let shell : Finset ℝ² :=
    (A.erase deleted).filter fun x ↦ dist center x = r
  obtain ⟨support, hsupportSub, hsupportCard⟩ :=
    Finset.exists_subset_card_eq hcard
  have hsupportAmbient : support ⊆ A := by
    intro x hx
    have hxShell : x ∈ shell := hsupportSub hx
    exact Finset.mem_of_mem_erase (Finset.mem_filter.mp hxShell).1
  have hdeleted : deleted ∉ support := by
    intro hmem
    have hxShell : deleted ∈ shell := hsupportSub hmem
    exact (Finset.notMem_erase deleted A) (Finset.mem_filter.mp hxShell).1
  let K : SelectedFourClass A center := {
    support := support
    support_subset_A := hsupportAmbient
    support_card := hsupportCard
    radius := r
    radius_pos := hradius
    support_eq_radius := by
      intro x hx
      exact (Finset.mem_filter.mp (hsupportSub hx)).2
    center_not_mem := by
      intro hcenter
      have hdist : dist center center = r := by
        exact (Finset.mem_filter.mp (hsupportSub hcenter)).2
      have : (0 : ℝ) = r := by simpa using hdist
      linarith }
  exact ⟨K, hdeleted⟩

/-- A pointwise deletion cover produces one ambient selected row.  The
constructor makes no relationship between choices made for different cover
edges. -/
private theorem nonempty_deletionCoverRow
    {A : Finset ℝ²} {center left right : ℝ²}
    (hcover :
      HasNEquidistantPointsAt 4 (A.erase left) center ∨
        HasNEquidistantPointsAt 4 (A.erase right) center) :
    Nonempty (DeletionCoverRow A center left right) := by
  rcases hcover with hleft | hright
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hleft with
      ⟨K, hK⟩
    exact ⟨⟨K, Or.inl hK⟩⟩
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hright with
      ⟨K, hK⟩
    exact ⟨⟨K, Or.inr hK⟩⟩

/-- Complete semantic witness table for the Boolean ingress.

`main` is an arbitrary all-center K4 selection, fixed at canonical center `4`
to be the retained first-apex row.  `cover₁` and `cover₂` are separately
chosen from the two star edges.  `blockerIndex`, `exactFiveShell`, and
`firstApexDoubleRow` are the remaining source objects consumed by the
generated formula. -/
structure CanonicalAsymmetricSemanticRowTable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (first : FirstApexShellRolePacket F R) : Type where
  main : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  main_firstApex_support :
    (main 4).support = first.retainedRow.support
  cover₁ : ∀ center : Fin 13,
    DeletionCoverRow D.A (P.point center) star.hub.1 star.spoke₁.1
  cover₂ : ∀ center : Fin 13,
    DeletionCoverRow D.A (P.point center) star.hub.1 star.spoke₂.1
  blockerIndex : Fin 13 → Fin 13
  blocker_point : ∀ source : Fin 13,
    P.point (blockerIndex source) =
      H.centerAt (P.point source) (by
        have hmem : P.point source ∈ Finset.univ.image P.point :=
          Finset.mem_image.mpr ⟨source, Finset.mem_univ _, rfl⟩
        simpa only [P.point_image] using hmem)
  exactFiveShell : Finset (Fin 13)
  exactFiveShell_mem_iff : ∀ point : Fin 13,
    point ∈ exactFiveShell ↔
      P.point point ∈ SelectedClass D.A S.oppApex2 profile.radius
  exactFiveShell_card : exactFiveShell.card = 5
  frontierQIndex : Fin 13
  frontierQ_point : P.point frontierQIndex = F.pair.q
  frontierWIndex : Fin 13
  frontierW_point : P.point frontierWIndex = F.pair.w
  firstApexDoubleRow : SelectedFourClass D.A (P.point 4)
  firstApexDoubleRow_support :
    firstApexDoubleRow.support = first.doubleRow.support

namespace CanonicalAsymmetricSemanticRowTable

/-- Every canonical point is a carrier point. -/
private theorem point_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13) :
    P.point i ∈ D.A := by
  have hmem : P.point i ∈ Finset.univ.image P.point :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  simpa only [P.point_image] using hmem

/-- On the first-spoke asymmetric arm, the canonical role points are exactly
`(spoke₁, hub, spoke₂)`.  This is the source alignment needed when the two
independent cover families are assigned to the generated `g0/g1` names. -/
theorem spoke₁_role_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (star : PhysicalGlobalCrossDeletionStar profile)
    {N : SourceTwoHitNormalForm Q profile
      star.spoke₁HubPair.toMutualOmissionPair}
    (P : CanonicalAsymmetricRolePrepacket N) :
    P.point P.sourceIndex = star.spoke₁.1 ∧
      P.point P.blockerIndex = star.hub.1 ∧
      P.point P.thirdIndex = star.spoke₂.1 := by
  refine ⟨?_, ?_, ?_⟩
  · simpa [PhysicalGlobalCrossDeletionStar.spoke₁HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using
      P.source_point
  · simpa [PhysicalGlobalCrossDeletionStar.spoke₁HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using
      P.blocker_point
  · exact P.third_point.trans (congrArg Subtype.val
      (ATailExactFiveGlobalCoverStarGeometry.SourceTwoHitNormalForm.third_eq_spoke₂
        star N))

/-- In the second-spoke arm the unused third physical point is the first
spoke.  This is the symmetric source fact to `third_eq_spoke₂`. -/
private theorem third_eq_spoke₁_of_spoke₂_arm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (star : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile
      star.spoke₂HubPair.toMutualOmissionPair) :
    N.third = star.spoke₁ := by
  have hthird := N.third.2
  change N.third.1 ∈ physicalVertices profile at hthird
  rw [star.physicalVertices_eq] at hthird
  simp only [Finset.mem_insert, Finset.mem_singleton] at hthird
  rcases hthird with hhub | hspoke₁ | hspoke₂
  · exfalso
    apply N.third_ne_target
    apply Subtype.ext
    simpa [PhysicalGlobalCrossDeletionStar.spoke₂HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using hhub
  · exact Subtype.ext hspoke₁
  · exfalso
    apply N.third_ne_source
    apply Subtype.ext
    simpa [PhysicalGlobalCrossDeletionStar.spoke₂HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using hspoke₂

/-- On the second-spoke asymmetric arm, the canonical role points are exactly
`(spoke₂, hub, spoke₁)`. -/
theorem spoke₂_role_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (star : PhysicalGlobalCrossDeletionStar profile)
    {N : SourceTwoHitNormalForm Q profile
      star.spoke₂HubPair.toMutualOmissionPair}
    (P : CanonicalAsymmetricRolePrepacket N) :
    P.point P.sourceIndex = star.spoke₂.1 ∧
      P.point P.blockerIndex = star.hub.1 ∧
      P.point P.thirdIndex = star.spoke₁.1 := by
  refine ⟨?_, ?_, ?_⟩
  · simpa [PhysicalGlobalCrossDeletionStar.spoke₂HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using
      P.source_point
  · simpa [PhysicalGlobalCrossDeletionStar.spoke₂HubPair,
      PhysicalGlobalCrossDeletionPair.toMutualOmissionPair] using
      P.blocker_point
  · exact P.third_point.trans
      (congrArg Subtype.val (third_eq_spoke₁_of_spoke₂_arm star N))

/-- The two independent star-edge row families, reordered by canonical
boundary position.  `left` is the edge from index `2` to index `1`; `right`
is the edge from index `2` to index `3`.  This is a permutation of the source
star families, never an equality or sharing assumption. -/
structure CanonicalCoverFamilies
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) : Type where
  left : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  right : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  left_omits : ∀ center : Fin 13,
    P.point 2 ∉ (left center).support ∨
      P.point 1 ∉ (left center).support
  right_omits : ∀ center : Fin 13,
    P.point 2 ∉ (right center).support ∨
      P.point 3 ∉ (right center).support
  left_is_source_cover :
    (∀ center, (left center).support = (T.cover₁ center).row.support) ∨
      (∀ center, (left center).support = (T.cover₂ center).row.support)
  right_is_source_cover :
    (∀ center, (right center).support = (T.cover₁ center).row.support) ∨
      (∀ center, (right center).support = (T.cover₂ center).row.support)

/-- In a first-spoke source arm, permute the two independently selected
cover families into canonical left/right order. -/
theorem nonempty_canonicalCoverFamilies_spoke₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {N : SourceTwoHitNormalForm Q profile
      star.spoke₁HubPair.toMutualOmissionPair}
    {P : CanonicalAsymmetricRolePrepacket N}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    Nonempty (CanonicalCoverFamilies T) := by
  rcases spoke₁_role_points star P with ⟨hsource, hhub, hthird⟩
  rcases P.source_role_orbits with hleft | hright
  · have hpointOne : P.point 1 = star.spoke₁.1 := by
      rw [← hleft.1]
      exact hsource
    have hpointTwo : P.point 2 = star.hub.1 := by
      rw [← hleft.2.1]
      exact hhub
    have hpointThree : P.point 3 = star.spoke₂.1 := by
      rw [← hleft.2.2]
      exact hthird
    exact ⟨{
      left := fun center ↦ (T.cover₁ center).row
      right := fun center ↦ (T.cover₂ center).row
      left_omits := fun center ↦ by
        simpa only [hpointOne, hpointTwo] using
          (T.cover₁ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hpointTwo, hpointThree] using
          (T.cover₂ center).omits_left_or_right
      left_is_source_cover := Or.inl (fun _ ↦ rfl)
      right_is_source_cover := Or.inr (fun _ ↦ rfl) }⟩
  · have hpointOne : P.point 1 = star.spoke₂.1 := by
      rw [← hright.2.2]
      exact hthird
    have hpointTwo : P.point 2 = star.hub.1 := by
      rw [← hright.2.1]
      exact hhub
    have hpointThree : P.point 3 = star.spoke₁.1 := by
      rw [← hright.1]
      exact hsource
    exact ⟨{
      left := fun center ↦ (T.cover₂ center).row
      right := fun center ↦ (T.cover₁ center).row
      left_omits := fun center ↦ by
        simpa only [hpointOne, hpointTwo] using
          (T.cover₂ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hpointTwo, hpointThree] using
          (T.cover₁ center).omits_left_or_right
      left_is_source_cover := Or.inr (fun _ ↦ rfl)
      right_is_source_cover := Or.inl (fun _ ↦ rfl) }⟩

/-- In a second-spoke source arm, permute the two independently selected
cover families into canonical left/right order. -/
theorem nonempty_canonicalCoverFamilies_spoke₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {N : SourceTwoHitNormalForm Q profile
      star.spoke₂HubPair.toMutualOmissionPair}
    {P : CanonicalAsymmetricRolePrepacket N}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    Nonempty (CanonicalCoverFamilies T) := by
  rcases spoke₂_role_points star P with ⟨hsource, hhub, hthird⟩
  rcases P.source_role_orbits with hleft | hright
  · have hpointOne : P.point 1 = star.spoke₂.1 := by
      rw [← hleft.1]
      exact hsource
    have hpointTwo : P.point 2 = star.hub.1 := by
      rw [← hleft.2.1]
      exact hhub
    have hpointThree : P.point 3 = star.spoke₁.1 := by
      rw [← hleft.2.2]
      exact hthird
    exact ⟨{
      left := fun center ↦ (T.cover₂ center).row
      right := fun center ↦ (T.cover₁ center).row
      left_omits := fun center ↦ by
        simpa only [hpointOne, hpointTwo] using
          (T.cover₂ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hpointTwo, hpointThree] using
          (T.cover₁ center).omits_left_or_right
      left_is_source_cover := Or.inr (fun _ ↦ rfl)
      right_is_source_cover := Or.inl (fun _ ↦ rfl) }⟩
  · have hpointOne : P.point 1 = star.spoke₁.1 := by
      rw [← hright.2.2]
      exact hthird
    have hpointTwo : P.point 2 = star.hub.1 := by
      rw [← hright.2.1]
      exact hhub
    have hpointThree : P.point 3 = star.spoke₂.1 := by
      rw [← hright.1]
      exact hsource
    exact ⟨{
      left := fun center ↦ (T.cover₁ center).row
      right := fun center ↦ (T.cover₂ center).row
      left_omits := fun center ↦ by
        simpa only [hpointOne, hpointTwo] using
          (T.cover₁ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hpointTwo, hpointThree] using
          (T.cover₂ center).omits_left_or_right
      left_is_source_cover := Or.inl (fun _ ↦ rfl)
      right_is_source_cover := Or.inr (fun _ ↦ rfl) }⟩

/-- The source inputs construct the complete semantic witness table.  In
particular, the two cover families are selected by two separate choice
functions, so no equality between them is introduced. -/
theorem nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (first : FirstApexShellRolePacket F R) :
    Nonempty (CanonicalAsymmetricSemanticRowTable P star first) := by
  classical
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  let pointMem : ∀ i : Fin 13, P.point i ∈ D.A :=
    fun i ↦ point_mem_A P i
  let firstRowAtFour : SelectedFourClass D.A (P.point 4) :=
    hpointFirst.symm ▸ first.retainedRow
  let main : ∀ i : Fin 13, SelectedFourClass D.A (P.point i) :=
    fun i ↦ if hi : i = 4 then
      hi.symm ▸ firstRowAtFour
    else
      Classical.choice (exists_selectedFourClass_of_globalK4 D.K4 (pointMem i))
  have hmain : (main 4).support = first.retainedRow.support := by
    simp only [main, dite_true]
    exact selectedFourClass_support_transport hpointFirst.symm first.retainedRow
  let cover₁ : ∀ i : Fin 13,
      DeletionCoverRow D.A (P.point i) star.hub.1 star.spoke₁.1 :=
    fun i ↦ Classical.choice <|
      nonempty_deletionCoverRow (star.hub_spoke₁_cover _ (pointMem i))
  let cover₂ : ∀ i : Fin 13,
      DeletionCoverRow D.A (P.point i) star.hub.1 star.spoke₂.1 :=
    fun i ↦ Classical.choice <|
      nonempty_deletionCoverRow (star.hub_spoke₂_cover _ (pointMem i))
  have hblockerExists : ∀ source : Fin 13, ∃ target : Fin 13,
      P.point target = H.centerAt (P.point source) (pointMem source) := by
    intro source
    have hcenterA : H.centerAt (P.point source) (pointMem source) ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt (P.point source) (pointMem source)).toCriticalFourShell.center_mem).2
    have hcenterImage :
        H.centerAt (P.point source) (pointMem source) ∈
          Finset.univ.image P.point := by
      simpa only [P.point_image] using hcenterA
    rcases Finset.mem_image.mp hcenterImage with
      ⟨target, _htarget, htarget⟩
    exact ⟨target, htarget⟩
  let blockerIndex : Fin 13 → Fin 13 :=
    fun source ↦ Classical.choose (hblockerExists source)
  have hblockerPoint : ∀ source : Fin 13,
      P.point (blockerIndex source) =
        H.centerAt (P.point source) (pointMem source) :=
    fun source ↦ Classical.choose_spec (hblockerExists source)
  let exactFiveShell : Finset (Fin 13) :=
    Finset.univ.filter fun i ↦
      P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius
  have hshellMem : ∀ i : Fin 13, i ∈ exactFiveShell ↔
      P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius := by
    intro i
    simp [exactFiveShell]
  have hshellImage : exactFiveShell.image P.point =
      SelectedClass D.A S.oppApex2 profile.radius := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact (hshellMem i).mp hi
    · intro hx
      have hxA : x ∈ D.A := (mem_selectedClass.mp hx).1
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr ⟨i, (hshellMem i).mpr hx, rfl⟩
  have hshellCard : exactFiveShell.card = 5 := by
    calc
      exactFiveShell.card = (exactFiveShell.image P.point).card :=
        (Finset.card_image_of_injective _ P.point_injective).symm
      _ = (SelectedClass D.A S.oppApex2 profile.radius).card := by
        rw [hshellImage]
      _ = 5 := profile.class_card_eq_five
  have hqIndexExists : ∃ i : Fin 13, P.point i = F.pair.q := by
    have hqImage : F.pair.q ∈ Finset.univ.image P.point := by
      simpa only [P.point_image] using F.pair.q_mem_A
    rcases Finset.mem_image.mp hqImage with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let frontierQIndex : Fin 13 := Classical.choose hqIndexExists
  have hfrontierQPoint : P.point frontierQIndex = F.pair.q :=
    Classical.choose_spec hqIndexExists
  have hwIndexExists : ∃ i : Fin 13, P.point i = F.pair.w := by
    have hwImage : F.pair.w ∈ Finset.univ.image P.point := by
      simpa only [P.point_image] using F.pair.w_mem_A
    rcases Finset.mem_image.mp hwImage with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let frontierWIndex : Fin 13 := Classical.choose hwIndexExists
  have hfrontierWPoint : P.point frontierWIndex = F.pair.w :=
    Classical.choose_spec hwIndexExists
  let firstApexDoubleRow : SelectedFourClass D.A (P.point 4) :=
    hpointFirst.symm ▸ first.doubleRow
  have hfirstDouble :
      firstApexDoubleRow.support = first.doubleRow.support := by
    exact selectedFourClass_support_transport hpointFirst.symm first.doubleRow
  exact ⟨{
    main := main
    main_firstApex_support := hmain
    cover₁ := cover₁
    cover₂ := cover₂
    blockerIndex := blockerIndex
    blocker_point := hblockerPoint
    exactFiveShell := exactFiveShell
    exactFiveShell_mem_iff := hshellMem
    exactFiveShell_card := hshellCard
    frontierQIndex := frontierQIndex
    frontierQ_point := hfrontierQPoint
    frontierWIndex := frontierWIndex
    frontierW_point := hfrontierWPoint
    firstApexDoubleRow := firstApexDoubleRow
    firstApexDoubleRow_support := hfirstDouble }⟩

/-- Parent-only wrapper: the existing first-apex extractor followed by
`nonempty` constructs the full semantic table without an additional
geometric hypothesis. -/
theorem nonempty_from_parent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    (star : PhysicalGlobalCrossDeletionStar profile) :
    Nonempty (Σ first : FirstApexShellRolePacket F R,
      CanonicalAsymmetricSemanticRowTable P star first) := by
  rcases nonempty_firstApexShellRolePacket F R with ⟨first⟩
  rcases nonempty P star first with ⟨table⟩
  exact ⟨⟨first, table⟩⟩

/-- The canonical frontier indices are distinct. -/
theorem frontier_indices_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    T.frontierQIndex ≠ T.frontierWIndex := by
  intro h
  apply F.pair.q_ne_w
  calc
    F.pair.q = P.point T.frontierQIndex := T.frontierQ_point.symm
    _ = P.point T.frontierWIndex := congrArg P.point h
    _ = F.pair.w := T.frontierW_point

/-- The retained first-apex row contains both frontier sources, while the
double-deletion row omits both. -/
theorem frontier_row_facts
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    P.point T.frontierQIndex ∈ (T.main 4).support ∧
      P.point T.frontierWIndex ∈ (T.main 4).support ∧
      P.point T.frontierQIndex ∉ T.firstApexDoubleRow.support ∧
      P.point T.frontierWIndex ∉ T.firstApexDoubleRow.support := by
  have hqMain : P.point T.frontierQIndex ∈ (T.main 4).support := by
    rw [T.main_firstApex_support, T.frontierQ_point]
    exact first.q_mem_retainedRow
  have hwMain : P.point T.frontierWIndex ∈ (T.main 4).support := by
    rw [T.main_firstApex_support, T.frontierW_point]
    exact first.w_mem_retainedRow
  have hqDouble : P.point T.frontierQIndex ∉
      T.firstApexDoubleRow.support := by
    intro hq
    have hqSource : F.pair.q ∈ first.doubleRow.support := by
      rw [← T.frontierQ_point, ← T.firstApexDoubleRow_support]
      exact hq
    have hqErase := first.doubleRow_subset_doubleErase hqSource
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqErase).2).1 rfl
  have hwDouble : P.point T.frontierWIndex ∉
      T.firstApexDoubleRow.support := by
    intro hw
    have hwSource : F.pair.w ∈ first.doubleRow.support := by
      rw [← T.frontierW_point, ← T.firstApexDoubleRow_support]
      exact hw
    have hwErase := first.doubleRow_subset_doubleErase hwSource
    exact (Finset.mem_erase.mp hwErase).1 rfl
  exact ⟨hqMain, hwMain, hqDouble, hwDouble⟩

/-- At least one frontier source occupies the exact private first-opposite
index block `9,10,11,12`. -/
theorem frontier_index_gt_eight
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    (8 : Fin 13) < T.frontierQIndex ∨
      (8 : Fin 13) < T.frontierWIndex := by
  rcases first.one_frontier_source_strict with hq | hw
  · apply Or.inl
    apply (P.strictFirstOppositeCap_mem_iff_index_gt_eight _).mp
    simpa only [T.frontierQ_point] using hq
  · apply Or.inr
    apply (P.strictFirstOppositeCap_mem_iff_index_gt_eight _).mp
    simpa only [T.frontierW_point] using hw

/-- Every one of the three independently selected row families agrees at an
actual blocker-image center.  This is derived from criticality; it is not
implemented by sharing the cover-row choices. -/
theorem blocker_image_supports_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (source : Fin 13) :
    (T.cover₁ (T.blockerIndex source)).row.support =
        (T.main (T.blockerIndex source)).support ∧
      (T.cover₂ (T.blockerIndex source)).row.support =
        (T.main (T.blockerIndex source)).support := by
  let hsourceA : P.point source ∈ D.A := point_mem_A P source
  let center := H.centerAt (P.point source) hsourceA
  have hcenter : P.point (T.blockerIndex source) = center := by
    simpa [hsourceA, center] using T.blocker_point source
  let Kmain : SelectedFourClass D.A center :=
    hcenter ▸ T.main (T.blockerIndex source)
  let Kcover₁ : SelectedFourClass D.A center :=
    hcenter ▸ (T.cover₁ (T.blockerIndex source)).row
  let Kcover₂ : SelectedFourClass D.A center :=
    hcenter ▸ (T.cover₂ (T.blockerIndex source)).row
  have hmain := H.selectedFourClass_support_eq_shell
    (P.point source) hsourceA Kmain
  have hcover₁ := H.selectedFourClass_support_eq_shell
    (P.point source) hsourceA Kcover₁
  have hcover₂ := H.selectedFourClass_support_eq_shell
    (P.point source) hsourceA Kcover₂
  constructor
  · calc
      (T.cover₁ (T.blockerIndex source)).row.support = Kcover₁.support :=
        (selectedFourClass_support_transport hcenter
          (T.cover₁ (T.blockerIndex source)).row).symm
      _ = Kmain.support := hcover₁.trans hmain.symm
      _ = (T.main (T.blockerIndex source)).support :=
        selectedFourClass_support_transport hcenter
          (T.main (T.blockerIndex source))
  · calc
      (T.cover₂ (T.blockerIndex source)).row.support = Kcover₂.support :=
        (selectedFourClass_support_transport hcenter
          (T.cover₂ (T.blockerIndex source)).row).symm
      _ = Kmain.support := hcover₂.trans hmain.symm
      _ = (T.main (T.blockerIndex source)).support :=
        selectedFourClass_support_transport hcenter
          (T.main (T.blockerIndex source))

/-- Canonically reordered cover families retain blocker-image
synchronization because each is one of the two independently chosen source
families. -/
theorem CanonicalCoverFamilies.blocker_supports_eq_main
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (source : Fin 13) :
    (C.left (T.blockerIndex source)).support =
        (T.main (T.blockerIndex source)).support ∧
      (C.right (T.blockerIndex source)).support =
        (T.main (T.blockerIndex source)).support := by
  have hsource := blocker_image_supports_eq T source
  constructor
  · rcases C.left_is_source_cover with hleft | hleft
    · exact (hleft _).trans hsource.1
    · exact (hleft _).trans hsource.2
  · rcases C.right_is_source_cover with hright | hright
    · exact (hright _).trans hsource.1
    · exact (hright _).trans hsource.2

#print axioms CanonicalAsymmetricSemanticRowTable.nonempty
#print axioms CanonicalAsymmetricSemanticRowTable.nonempty_from_parent
#print axioms CanonicalAsymmetricSemanticRowTable.frontier_indices_ne
#print axioms CanonicalAsymmetricSemanticRowTable.frontier_row_facts
#print axioms CanonicalAsymmetricSemanticRowTable.frontier_index_gt_eight
#print axioms CanonicalAsymmetricSemanticRowTable.blocker_image_supports_eq
#print axioms CanonicalAsymmetricSemanticRowTable.spoke₁_role_points
#print axioms CanonicalAsymmetricSemanticRowTable.spoke₂_role_points
#print axioms CanonicalAsymmetricSemanticRowTable.nonempty_canonicalCoverFamilies_spoke₁
#print axioms CanonicalAsymmetricSemanticRowTable.nonempty_canonicalCoverFamilies_spoke₂
#print axioms CanonicalAsymmetricSemanticRowTable.CanonicalCoverFamilies.blocker_supports_eq_main

end CanonicalAsymmetricSemanticRowTable

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
