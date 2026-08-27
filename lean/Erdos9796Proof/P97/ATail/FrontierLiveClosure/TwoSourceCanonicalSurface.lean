/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.AllLargeCapCanonicalInterfaces
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy.TriApexWrappers
import Erdos9796Proof.P97.ATail.SecondRadiusMutualCrossMembership
import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointCollisionLocalization
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation
import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer
import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Phase3SharedPairSeparation

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailMinimalUniqueFourCover
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The first opposite apex is a carrier point. -/
private theorem oppApex1_mem_A_local {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Standalone helper for cyclic alternation separation on a collision pair. -/
private theorem collision_btw_sep
    {A : Finset ℝ²}
    (B : BoundaryIndexing (A := A))
    (O A' s₁ s₂ : CriticalShellSystem.CarrierVertex A)
    (hA_ne_O : A' ≠ O) (hs₂_ne_O : s₂ ≠ O) (hs₂_ne_A : s₂ ≠ A')
    (hfirstApexEq : dist O.1 s₁.1 = dist O.1 s₂.1)
    (hcommonBlockerEq : dist A'.1 s₁.1 = dist A'.1 s₂.1)
    (hsources_ne : s₁.1 ≠ s₂.1) :
    SurplusCOMPGBank.btw (B.indexOf O) (B.indexOf A') (B.indexOf s₁) ↔
      ¬ SurplusCOMPGBank.btw (B.indexOf O) (B.indexOf A') (B.indexOf s₂) := by
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hs₂_ne_O
  · exact B.index_injective.ne hs₂_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm] using hfirstApexEq
  · simpa only [B.point_eq, pointOf, dist_comm] using hcommonBlockerEq
  · exact B.boundary_injective.ne (B.index_injective.ne (fun h ↦ hsources_ne (congrArg Subtype.val h)))

namespace TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP

/-- Global exclusion still required for the four cross-blocker equalities,
retaining the geometric-multiplicity residual that produced this branch.

The equalities themselves point away from the requested cross hits, so this
leaf must use the retained minimality, no-M44, tri-apex, and two-cycle data.
Its immediate constructor fan-out is four equality arms crossed with the
three geometric-multiplicity alternatives. -/
theorem false_of_crossBlockerCoincidence
    (hcoincidence : CrossBlockerCoincidence P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  sorry

/-- Source-exact witness carried by the cap-eight third-row surface, with the
existential source exposed for downstream geometric alignment arguments. -/
abbrev CapSourceThirdCanonicalRowWitness
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  8 ≤ (S.capByIndex S.oppIndex1).card ∧
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    source.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support.card = 4 ∧
    CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
    CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂

/-- The additive two-source packet for the cap-eight third-row producer.

This keeps both actual `CriticalShellSystem` source vertices and their complete
canonical-row witnesses.  The duplicated cap-card field is intentional: it is
the producer's cardinality margin at the packet boundary, rather than a fact
that downstream consumers must recover by destructuring one witness. -/
structure TwoCapSourceThirdCanonicalRowSurface where
  cap_card_ge_eight : 8 ≤ (S.capByIndex S.oppIndex1).card
  firstSource : CriticalShellSystem.CarrierVertex D.A
  secondSource : CriticalShellSystem.CarrierVertex D.A
  sources_ne : firstSource.1 ≠ secondSource.1
  firstSource_data : CapSourceThirdCanonicalRowWitness P Pρ firstSource
  secondSource_data : CapSourceThirdCanonicalRowWitness P Pρ secondSource

/-- The producer contract that preserves the common-radius provenance instead
of returning only the generic cap-source packet.  This is intentionally a
separate structure: the generic packet remains the compatibility interface,
while the live FreshThird ingress can carry the radius through normalization. -/
structure CommonRadiusTwoCapSourceThirdCanonicalRowSurface where
  commonRadius : ℝ
  cap_card_ge_eight : 8 ≤ (S.capByIndex S.oppIndex1).card
  commonRadius_card :
    2 ≤
      (SelectedClass D.A S.oppApex1 commonRadius ∩
        S.capInteriorByIndex S.oppIndex1).card
  commonRadius_ne_radius : commonRadius ≠ radius
  commonRadius_ne_ρ : commonRadius ≠ ρ
  surface : TwoCapSourceThirdCanonicalRowSurface P Pρ
  firstSource_mem :
    surface.firstSource.1 ∈
      SelectedClass D.A S.oppApex1 commonRadius
  secondSource_mem :
    surface.secondSource.1 ∈
      SelectedClass D.A S.oppApex1 commonRadius

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- If an actual blocker center lies in an indexed cap, at most two source
vertices from that cap can have that blocker.  Their source points all lie in
the blocker's exact selected four-class, and one-sided cap geometry bounds
that class's intersection with the cap by two. -/
theorem actualBlockerFiber_filter_capByIndex_card_le_two
    (anchor : CriticalShellSystem.CarrierVertex D.A)
    (i : Fin 3)
    (hcenter : H.centerAt anchor.1 anchor.2 ∈ S.capByIndex i) :
    ((ATailSurvivalCover.actualBlockerFiber H anchor).filter
      (fun source => source.1 ∈ S.capByIndex i)).card ≤ 2 := by
  classical
  let capFiber :=
    (ATailSurvivalCover.actualBlockerFiber H anchor).filter
      (fun source => source.1 ∈ S.capByIndex i)
  let points : Finset ℝ² := capFiber.image fun source => source.1
  have hpoints :
      points ⊆
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support ∩
          S.capByIndex i := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceCapFiber, rfl⟩
    have hsourceFiber := (Finset.mem_filter.mp hsourceCapFiber).1
    have hsourceCap := (Finset.mem_filter.mp hsourceCapFiber).2
    have hblockerVertex := (Finset.mem_filter.mp hsourceFiber).2
    have hsourceCenter :
        H.centerAt source.1 source.2 = H.centerAt anchor.1 anchor.2 :=
      congrArg Subtype.val hblockerVertex
    have hsupport :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 anchor.2 hsourceCenter
    have hsourceSupport :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
    rw [hsupport] at hsourceSupport
    exact Finset.mem_inter.mpr ⟨hsourceSupport, hsourceCap⟩
  have hcapTwo :
      ((H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support ∩
        S.capByIndex i).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i
        (H.selectedAt anchor.1
          anchor.2).toCriticalFourShell.toSelectedFourClass hcenter
  calc
    ((ATailSurvivalCover.actualBlockerFiber H anchor).filter
        (fun source => source.1 ∈ S.capByIndex i)).card = capFiber.card := rfl
    _ = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ ((H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support ∩
          S.capByIndex i).card := Finset.card_le_card hpoints
    _ ≤ 2 := hcapTwo

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- If both common-radius source rows are the fresh blocker's selected row,
the two distinct common-radius cap-interior sources localize that blocker in
the canonical first cap. -/
theorem freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    H.centerAt Q.source₁.1 Q.source₁.2 ∈
      S.capInteriorByIndex S.oppIndex1 := by
  classical
  have hfirstFresh :
      C.surface.firstSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hfirstSupport]
    exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecondFresh :
      C.surface.secondSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hsecondSupport]
    exact
      (H.selectedAt C.surface.secondSource.1
        C.surface.secondSource.2).toCriticalFourShell.q_mem_support
  have hpairSubsetSlice :
      ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ⊆
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
            S.capInteriorByIndex S.oppIndex1) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨hfirstFresh, by
          simpa only [oppositeVertexByIndex_oppIndex1] using
            Finset.mem_inter.mpr
              ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨hsecondFresh, by
          simpa only [oppositeVertexByIndex_oppIndex1] using
            Finset.mem_inter.mpr
              ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩⟩
  have htwo :
      2 ≤
        ((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
          (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
            S.capInteriorByIndex S.oppIndex1)).card := by
    simpa [C.surface.sources_ne] using Finset.card_le_card hpairSubsetSlice
  exact
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      Q.source₁.2
      (by simpa only [oppositeVertexByIndex_oppIndex1] using T.oppApex1_rich)
      (isUniqueFourCenter_centerAt H Q.source₁.1 Q.source₁.2)
      htwo

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- If both common-radius source rows are the fresh blocker's selected row,
that row meets the canonical first cap in exactly the two cap sources. -/
theorem freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {C.surface.firstSource.1, C.surface.secondSource.1} := by
  classical
  have hcenterFirst :=
    freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap
      (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
      (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport
  have hpairSubset :
      ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ⊆
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨by
          rw [← hfirstSupport]
          exact
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            C.surface.firstSource_data.2.1⟩
    · exact Finset.mem_inter.mpr
        ⟨by
          rw [← hsecondSupport]
          exact
            (H.selectedAt C.surface.secondSource.1
              C.surface.secondSource.2).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            C.surface.secondSource_data.2.1⟩
  have hcapTwo :
      ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterFirst)
  exact
    (Finset.eq_of_subset_of_card_le hpairSubset
      (by simpa [C.surface.sources_ne] using hcapTwo)).symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the common-radius same-blocker branch, at least four strict canonical-cap
points lie outside the saturated fresh selected row.  This is the exact
cardinality margin left after the two common-radius cap sources exhaust that
row's possible intersection with the cap. -/
theorem freshThird_commonRadius_sameBlocker_four_capInterior_points_outside_selectedShell
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    4 ≤
      (S.capInteriorByIndex S.oppIndex1 \
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support).card := by
  classical
  have hcapEq :=
    freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources
      (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
      (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport
  have hfirstMem :
      C.surface.firstSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hfirstSupport]
    exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecondMem :
      C.surface.secondSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hsecondSupport]
    exact
      (H.selectedAt C.surface.secondSource.1
        C.surface.secondSource.2).toCriticalFourShell.q_mem_support
  have hinterEq :
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
          S.capInteriorByIndex S.oppIndex1 =
        {C.surface.firstSource.1, C.surface.secondSource.1} := by
    apply Finset.Subset.antisymm
    · intro z hz
      have hzParts := Finset.mem_inter.mp hz
      have hzCap : z ∈ S.capByIndex S.oppIndex1 :=
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzParts.2
      have hzClosed :
          z ∈
            (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support ∩
              S.capByIndex S.oppIndex1 :=
        Finset.mem_inter.mpr ⟨hzParts.1, hzCap⟩
      rwa [hcapEq] at hzClosed
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨hfirstMem, C.surface.firstSource_data.2.1⟩
      · exact Finset.mem_inter.mpr
          ⟨hsecondMem, C.surface.secondSource_data.2.1⟩
  have hinteriorSix : 6 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hcard :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex1
    have hcapEight := C.cap_card_ge_eight
    omega
  have hinterCard :
      (S.capInteriorByIndex S.oppIndex1 ∩
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support).card = 2 := by
    rw [Finset.inter_comm, hinterEq]
    simp [C.surface.sources_ne]
  have hsplit :=
    Finset.card_sdiff_add_card_inter
      (S.capInteriorByIndex S.oppIndex1)
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Finite ingress for the common-radius same-blocker branch: four distinct
strict canonical-cap sources lie outside the fresh selected row, and every one
therefore has actual blocker center distinct from the fresh row's center.

The four-point set is cardinality-independent.  It records exactly the finite
source data available before any solver or global incidence argument is used. -/
theorem freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    ∃ W : Finset ℝ²,
      W.card = 4 ∧
      ∀ z ∈ W,
        z ∈ S.capInteriorByIndex S.oppIndex1 ∧
        z ∉ (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∧
        ∃ hzA : z ∈ D.A,
          H.centerAt z hzA ≠ H.centerAt Q.source₁.1 Q.source₁.2 := by
  classical
  have hfour :=
    freshThird_commonRadius_sameBlocker_four_capInterior_points_outside_selectedShell
      (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
      (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport
  rcases Finset.exists_subset_card_eq hfour with ⟨W, hW, hWcard⟩
  refine ⟨W, hWcard, ?_⟩
  intro z hzW
  have hzOutside := Finset.mem_sdiff.mp (hW hzW)
  have hzA : z ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 hzOutside.1
  refine ⟨hzOutside.1, hzOutside.2, hzA, ?_⟩
  exact blocker_centers_ne_of_not_mem_other_selected_support
    H hzA Q.source₁.2 hzOutside.2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The four-source ingress also records that deleting each source preserves
the fresh row's four-equidistant class. -/
theorem freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell_with_deletion_survivals
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    ∃ W : Finset ℝ²,
      W.card = 4 ∧
      ∀ z ∈ W,
        z ∈ S.capInteriorByIndex S.oppIndex1 ∧
        z ∉ (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∧
        ∃ hzA : z ∈ D.A,
          H.centerAt z hzA ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
          HasNEquidistantPointsAt 4 (D.A.erase z)
            (H.centerAt Q.source₁.1 Q.source₁.2) := by
  rcases
      freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell
        (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
        (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport with
    ⟨W, hWcard, hW⟩
  refine ⟨W, hWcard, ?_⟩
  intro z hzW
  rcases hW z hzW with ⟨hzCap, hzSupport, hzA, hzCenter⟩
  refine ⟨hzCap, hzSupport, hzA, hzCenter, ?_⟩
  exact
    (cross_deletion_survives_iff_not_mem_selected_support
      H Q.source₁.2).mpr hzSupport

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the common-radius same-blocker branch, some first-apex radius carries
two strict canonical-cap points outside the fresh selected row.  In the S6
arm this follows by subtracting the row's universal two-point intersection
bound from the four-point rich slice.  In the D44 arm, one of the two rich
radii differs from the common source radius, so its strict-cap slice is
entirely outside the row. -/
theorem freshThird_commonRadius_sameBlocker_exists_sameRadius_pair_off_selectedShell
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    ∃ r : ℝ, ∃ W : Finset ℝ²,
      0 < r ∧
      W.card = 2 ∧
      W ⊆
        (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1) \
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support := by
  classical
  have hcapEq :=
    freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources
      (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
      (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport
  have hpattern :
      (∃ r : ℝ, 0 < r ∧
          4 ≤ (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1).card) ∨
        (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
          2 ≤ (SelectedClass D.A S.oppApex1 r₁ ∩
            S.capInteriorByIndex S.oppIndex1).card ∧
          2 ≤ (SelectedClass D.A S.oppApex1 r₂ ∩
            S.capInteriorByIndex S.oppIndex1).card) := by
    simpa only [OppositeCapRichClassInteriorPattern,
      oppositeVertexByIndex_oppIndex1] using
      (oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
        S D.convex S.oppIndex1
        (by simpa only [oppositeVertexByIndex_oppIndex1] using
          T.oppApex1_rich))
  have hoff_of_ne_common (r : ℝ) (hrne : r ≠ C.commonRadius) :
      SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1 ⊆
        (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1) \
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support := by
    intro z hz
    refine Finset.mem_sdiff.mpr ⟨hz, ?_⟩
    intro hzRow
    have hzCap : z ∈ S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (Finset.mem_inter.mp hz).2
    have hzPair :
        z ∈ ({C.surface.firstSource.1,
          C.surface.secondSource.1} : Finset ℝ²) := by
      rw [← hcapEq]
      exact Finset.mem_inter.mpr ⟨hzRow, hzCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    rcases hzPair with rfl | rfl
    · exact hrne
        (selectedClass_radius_unique_of_mem
          (Finset.mem_inter.mp hz).1 C.firstSource_mem)
    · exact hrne
        (selectedClass_radius_unique_of_mem
          (Finset.mem_inter.mp hz).1 C.secondSource_mem)
  rcases hpattern with ⟨r, hr, hfour⟩ |
      ⟨r₁, r₂, hr₁, hr₂, hradii, htwo₁, htwo₂⟩
  · have hinterRaw :=
      criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
        S S.oppIndex1 H Q.source₁.1 Q.source₁.2
        (by simpa only [oppositeVertexByIndex_oppIndex1] using
          T.oppApex1_rich) r
    have hinter :
        ((SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1) ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2 := by
      rw [Finset.inter_comm]
      simpa only [oppositeVertexByIndex_oppIndex1] using hinterRaw
    have hsplit :=
      Finset.card_sdiff_add_card_inter
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1)
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support
    have htwo :
        2 ≤
          ((SelectedClass D.A S.oppApex1 r ∩
              S.capInteriorByIndex S.oppIndex1) \
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card := by
      omega
    rcases Finset.exists_subset_card_eq htwo with ⟨W, hW, hWcard⟩
    exact ⟨r, W, hr, hWcard, hW⟩
  · by_cases hr₁common : r₁ = C.commonRadius
    · have hr₂common : r₂ ≠ C.commonRadius := by
        intro h
        exact hradii (hr₁common.trans h.symm)
      rcases Finset.exists_subset_card_eq htwo₂ with ⟨W, hW, hWcard⟩
      exact ⟨r₂, W, hr₂, hWcard,
        fun _ hz => hoff_of_ne_common r₂ hr₂common (hW hz)⟩
    · rcases Finset.exists_subset_card_eq htwo₁ with ⟨W, hW, hWcard⟩
      exact ⟨r₁, W, hr₁, hWcard,
        fun _ hz => hoff_of_ne_common r₁ hr₁common (hW hz)⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- If both common-radius source rows coincide with the fresh blocker row,
then either one of the cap sources aliases a fresh endpoint, or that row is
exactly the four named sources and both fresh endpoints lie outside the
canonical first cap.  This is the exhaustive alias split needed before any
metric or cyclic-order consumer is invoked. -/
theorem freshThird_commonRadius_sameBlocker_alias_or_exact_namedShell
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    C.surface.firstSource.1 = Q.source₁.1 ∨
      C.surface.firstSource.1 = Q.source₂.1 ∨
      C.surface.secondSource.1 = Q.source₁.1 ∨
      C.surface.secondSource.1 = Q.source₂.1 ∨
      ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support =
          {C.surface.firstSource.1, C.surface.secondSource.1,
            Q.source₁.1, Q.source₂.1} ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) := by
  classical
  by_cases hfirstQ₁ : C.surface.firstSource.1 = Q.source₁.1
  · exact Or.inl hfirstQ₁
  by_cases hfirstQ₂ : C.surface.firstSource.1 = Q.source₂.1
  · exact Or.inr (Or.inl hfirstQ₂)
  by_cases hsecondQ₁ : C.surface.secondSource.1 = Q.source₁.1
  · exact Or.inr (Or.inr (Or.inl hsecondQ₁))
  by_cases hsecondQ₂ : C.surface.secondSource.1 = Q.source₂.1
  · exact Or.inr (Or.inr (Or.inr (Or.inl hsecondQ₂)))
  have hfirstMem :
      C.surface.firstSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hfirstSupport]
    exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecondMem :
      C.surface.secondSource.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    rw [← hsecondSupport]
    exact
      (H.selectedAt C.surface.secondSource.1
        C.surface.secondSource.2).toCriticalFourShell.q_mem_support
  have hsource₁Mem :
      Q.source₁.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Mem :
      Q.source₂.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support :=
    Q.source₂_mem_source₁_shell
  have hnamedSubset :
      ({C.surface.firstSource.1, C.surface.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact hfirstMem
    · exact hsecondMem
    · exact hsource₁Mem
    · exact hsource₂Mem
  have hnamedCard :
      ({C.surface.firstSource.1, C.surface.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 4 := by
    simp [C.surface.sources_ne, hfirstQ₁, hfirstQ₂,
      hsecondQ₁, hsecondQ₂, Q.sources_ne]
  have hsupportEq :
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {C.surface.firstSource.1, C.surface.secondSource.1,
          Q.source₁.1, Q.source₂.1} :=
    (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [(H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_card, hnamedCard])).symm
  have hcapEq :=
    freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources
      (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
      (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport
  have hsource₁Outside : Q.source₁.1 ∉ S.capByIndex S.oppIndex1 := by
    intro hsource₁Cap
    have hpairMem :
        Q.source₁.1 ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) := by
      rw [← hcapEq]
      exact Finset.mem_inter.mpr ⟨hsource₁Mem, hsource₁Cap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
    rcases hpairMem with h | h
    · exact hfirstQ₁ h.symm
    · exact hsecondQ₁ h.symm
  have hsource₂Outside : Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
    intro hsource₂Cap
    have hpairMem :
        Q.source₂.1 ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) := by
      rw [← hcapEq]
      exact Finset.mem_inter.mpr ⟨hsource₂Mem, hsource₂Cap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
    rcases hpairMem with h | h
    · exact hfirstQ₂ h.symm
    · exact hsecondQ₂ h.symm
  exact Or.inr (Or.inr (Or.inr (Or.inr
    ⟨hsupportEq, hsource₁Outside, hsource₂Outside⟩)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Shared-pair separation on a caller-supplied boundary indexing.  Keeping
the boundary as an input lets the FreshThird cap-order producer use the same
zero-cut enumeration for both the cap blocks and the two-row alternation. -/
private theorem freshThird_sharedPairCyclicSeparation_atBoundary
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (B : BoundaryIndexing D.A) :
    (SurplusCOMPGBank.btw
        (B.indexOf
          ⟨H.centerAt C.firstSource.1 C.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf
          ⟨H.centerAt C.firstSource.1 C.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩)) := by
  classical
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  let Ksource :=
    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  let Kfresh :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hsourceCenter_ne_freshCenter : sourceCenter ≠ freshCenter := by
    intro h
    exact centers_ne (congrArg Subtype.val h)
  have hsourceCenter_val_ne_freshCenter_val :
      sourceCenter.1 ≠ freshCenter.1 := by
    simpa [sourceCenter, freshCenter] using centers_ne
  have hpoints_ne : firstPoint ≠ secondPoint := by
    intro h
    apply Q.sources_ne
    exact Subtype.ext (congrArg Subtype.val h)
  rcases exists_faithfulCarrierPattern_with_two_classes D.K4
      sourceCenter.2 freshCenter.2 hsourceCenter_val_ne_freshCenter_val Ksource Kfresh with
    ⟨F, hFsource, hFfresh⟩
  let rowAt : (center : CarrierLabel D.A) → SelectedFourClass D.A center.1 :=
    fun center => F.classAt center.1 center.2
  have hsource_mem_row :
      firstPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₁_mem
  have hsecond_mem_row :
      secondPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₂_mem
  have hfirst_mem_fresh :
      firstPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsecond_mem_fresh :
      secondPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact Q.source₂_mem_source₁_shell
  exact selectedFourClass_shared_pair_separated rowAt B.boundary B.indexOf
    B.boundary_ccw B.boundary_injective B.index_injective B.point_eq
    hsourceCenter_ne_freshCenter hpoints_ne
    hsource_mem_row hsecond_mem_row hfirst_mem_fresh hsecond_mem_fresh

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- A zero-cut boundary indexing whose three strict Moser-cap interiors occur
in the canonical direct or mirror blocks.  Unlike the card-eleven boundary
package, this uses no exact-cardinality or `IsM44` hypothesis. -/
private theorem exists_zeroCutBoundaryIndexing_with_capBlocks :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      D.nonempty D.convex D.K4 with
    ⟨n, hn, boundary, iv, iw, hboundary, hboundaryImage, hccw,
      hu, hv, hw, horder⟩
  have hex (label : CarrierLabel D.A) :
      ∃ i : Fin n, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [hboundaryImage]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel D.A → Fin n :=
    fun label => Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label :=
    fun label => Classical.choose_spec (hex label)
  have hindexInj : Function.Injective indexOf := by
    intro a b hab
    apply Subtype.ext
    calc
      a.1 = boundary (indexOf a) := (hpoint a).symm
      _ = boundary (indexOf b) := congrArg boundary hab
      _ = b.1 := hpoint b
  let B : BoundaryIndexing D.A :=
    { n := n
      boundary := boundary
      indexOf := indexOf
      boundary_injective := hboundary
      boundary_image := hboundaryImage
      boundary_ccw := hccw
      index_injective := hindexInj
      point_eq := hpoint }
  have hu' : boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx := by
    simpa [zeroIndex] using hu
  have huSurplusV1 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.surplusIdx).v1 :=
    hu'.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
  have hvSurplusV2 :
      boundary iv = (S.triangleByIndex S.surplusIdx).v2 :=
    hv.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hwSurplusV3 :
      boundary iw = (S.triangleByIndex S.surplusIdx).v3 :=
    hw.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hvOpp1V1 :
      boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hwOpp1V2 :
      boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have huOpp1V3 :
      boundary (zeroIndex hn) = (S.triangleByIndex S.oppIndex1).v3 :=
    hu'.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hwOpp2V1 :
      boundary iw = (S.triangleByIndex S.oppIndex2).v1 :=
    hw.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
  have huOpp2V2 :
      boundary (zeroIndex hn) = (S.triangleByIndex S.oppIndex2).v2 :=
    hu'.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hvOpp2V3 :
      boundary iv = (S.triangleByIndex S.oppIndex2).v3 :=
    hv.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have horientation :
      DirectBoundaryBlocks S boundary hn iv iw ∨
        MirrorBoundaryBlocks S boundary hn iv iw := by
    rcases horder with hdirect | hmirror
    · left
      refine
        { apex_order := hdirect
          opp2_between := ?_
          surplus_between := ?_
          opp1_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.oppIndex2 hccw hboundary hboundaryImage hdirect.1
          (Or.inr hdirect.2) hwOpp2V1 huOpp2V2 hvOpp2V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hdirect.2
          (Or.inl hdirect.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
            S.oppIndex1 hccw hboundary hboundaryImage hdirect.1
            hdirect.2 hvOpp1V1 hwOpp1V2 huOpp1V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
    · right
      refine
        { apex_order := hmirror
          opp1_between := ?_
          surplus_between := ?_
          opp2_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.oppIndex1 hccw hboundary hboundaryImage hmirror.1
          (Or.inr hmirror.2) hvOpp1V1 hwOpp1V2 huOpp1V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hmirror.2
          (Or.inl hmirror.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
            S.oppIndex2 hccw hboundary hboundaryImage hmirror.1
            hmirror.2 hwOpp2V1 huOpp2V2 hvOpp2V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
  exact ⟨B, hn, iv, iw, hu', hv, hw, horientation⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the direct zero-cut orientation, every carrier point outside the first
opposite cap occurs before the second-opposite apex.  This is the converse
boundary-block fact needed to distinguish the outside shared endpoint from
the endpoint between the two FreshThird centers. -/
private theorem index_lt_oppIndex2_of_not_mem_opp1Cap_of_direct
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hdirect : DirectBoundaryBlocks S B.boundary hn iv iw)
    (x : CarrierLabel D.A) (hxOff : x.1 ∉ S.capByIndex S.oppIndex1) :
    B.indexOf x < iw := by
  have hivV1 :
      B.boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hiv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hiwV2 :
      B.boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hiw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hzeroV3 :
      B.boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcap :=
    S.capByIndex_reverse_complement_interval_of_global_indices
      S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
      hdirect.apex_order.1 hdirect.apex_order.2 hivV1 hiwV2 hzeroV3 x.1
  by_contra hnot
  apply hxOff
  exact hcap.mpr
    ⟨B.indexOf x, Or.inr (le_of_not_gt hnot), B.point_eq x⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the mirror zero-cut orientation, every carrier point outside the first
opposite cap occurs after the second-opposite apex. -/
private theorem oppIndex2_lt_index_of_not_mem_opp1Cap_of_mirror
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hmirror : MirrorBoundaryBlocks S B.boundary hn iv iw)
    (x : CarrierLabel D.A) (hxOff : x.1 ∉ S.capByIndex S.oppIndex1) :
    iw < B.indexOf x := by
  have hivV1 :
      B.boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hiv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hiwV2 :
      B.boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hiw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hzeroV3 :
      B.boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcap :=
    S.capByIndex_reverse_interval_of_global_indices
      S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
      hmirror.apex_order.1 (Or.inr hmirror.apex_order.2)
      hivV1 hiwV2 hzeroV3 x.1
  by_contra hnot
  apply hxOff
  apply hcap.mpr
  refine ⟨B.indexOf x, ?_, le_of_not_gt hnot, B.point_eq x⟩
  change 0 ≤ (B.indexOf x).val
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Consume the common-radius producer in the remaining noncanonical same-cap
arm.  The equal-center shell lemma places the source center in the canonical
cap; the interaction places that same center in a distinct cap, so strict cap
interiority gives the contradiction. -/
theorem false_of_commonRadius_equalCenters_noncanonicalSameCap
    {commonRadius : ℝ}
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hfirstRadius :
      C.firstSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsecondRadius :
      C.secondSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    {capIndex : Fin 3}
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (hcapIndex : capIndex ≠ S.oppIndex1)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    False := by
  have hfirstIndexed :
      C.firstSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr ⟨hfirstRadius, C.firstSource_data.2.1⟩)
  have hsecondIndexed :
      C.secondSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr ⟨hsecondRadius, C.secondSource_data.2.1⟩)
  have hgeometry :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      C.firstSource.2 C.secondSource.2 hfirstIndexed hsecondIndexed
      C.sources_ne hcenters
      (by simpa only [oppositeVertexByIndex_oppIndex1] using hrich)
      (isUniqueFourCenter_centerAt H
        C.firstSource.1 C.firstSource.2)
  exact
    (S.capInteriorByIndex_ne_of_mem_of_mem_ne
      hgeometry.1 sourceCenter_mem hcapIndex.symm) rfl

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Packet-consuming form of the common-radius equal-center terminal. -/
theorem false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    {capIndex : Fin 3}
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (hcapIndex : capIndex ≠ S.oppIndex1)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2) :
    False := by
  exact
    false_of_commonRadius_equalCenters_noncanonicalSameCap
      (P := P) (Pρ := Pρ) C.surface C.firstSource_mem C.secondSource_mem
      hrich sourceCenter_mem hcapIndex hcenters

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The source-clean part of the common-radius producer: once the source
blocker is in the canonical cap and the two shell rows have the exact
two-point overlap, neither fresh endpoint can lie in that cap.  This is the
finite incidence fact needed by both the canonical fresh-cap contradiction
and the remaining different-cap producer.
-/
theorem freshThird_commonRadius_distinctCaps_sources_off_canonicalCap
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
      Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
  have hfirstIndexed :
      C.surface.firstSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩)
  have hsecondIndexed :
      C.surface.secondSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩)
  have hgeometry :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
          S.capInteriorByIndex S.oppIndex1 ∧
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {C.surface.firstSource.1, C.surface.secondSource.1} :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      (D := D) (S := S) (H := H) (i := S.oppIndex1) (r := C.commonRadius)
      C.surface.firstSource.2 C.surface.secondSource.2
      hfirstIndexed hsecondIndexed C.surface.sources_ne hcenters
      (by simpa only [oppositeVertexByIndex_oppIndex1] using T.oppApex1_rich)
      (isUniqueFourCenter_centerAt H
        C.surface.firstSource.1 C.surface.firstSource.2)
  have hq1Off : Q.source₁.1 ∉ S.capByIndex S.oppIndex1 := by
    intro hqCap
    have hqInter :
        Q.source₁.1 ∈
          (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨source₁_mem, hqCap⟩
    rw [hgeometry.2] at hqInter
    have hqCases :
        Q.source₁.1 = C.surface.firstSource.1 ∨
          Q.source₁.1 = C.surface.secondSource.1 := by
      simpa [Finset.mem_insert, Finset.mem_singleton] using hqInter
    rcases hqCases with hq | hq
    · apply centers_ne
      exact
        (congrArg
          (fun z : CriticalShellSystem.CarrierVertex D.A => H.centerAt z.1 z.2)
          (Subtype.ext hq)).symm
    · apply centers_ne
      exact
        hcenters.trans
          (congrArg
            (fun z : CriticalShellSystem.CarrierVertex D.A => H.centerAt z.1 z.2)
            (Subtype.ext hq)).symm
  have hq2Off : Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
    intro hqCap
    have hqInter :
        Q.source₂.1 ∈
          (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨source₂_mem, hqCap⟩
    rw [hgeometry.2] at hqInter
    have hqCases :
        Q.source₂.1 = C.surface.firstSource.1 ∨
          Q.source₂.1 = C.surface.secondSource.1 := by
      simpa [Finset.mem_insert, Finset.mem_singleton] using hqInter
    have hQCenters :
        H.centerAt Q.source₂.1 Q.source₂.2 =
          H.centerAt Q.source₁.1 Q.source₁.2 := by
      simpa [CriticalShellSystem.blockerVertex] using
        (congrArg Subtype.val Q.blockers_eq).symm
    rcases hqCases with hq | hq
    · apply centers_ne
      exact
        (congrArg
          (fun z : CriticalShellSystem.CarrierVertex D.A => H.centerAt z.1 z.2)
          (Subtype.ext hq)).symm.trans hQCenters
    · apply centers_ne
      exact
        (hcenters.trans
          (congrArg
            (fun z : CriticalShellSystem.CarrierVertex D.A => H.centerAt z.1 z.2)
            (Subtype.ext hq)).symm).trans hQCenters
  exact ⟨hq1Off, hq2Off⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Producer split for the only common-radius interaction not already handled
by the same-cap consumer.  The source blocker is forced into the canonical
cap.  If the fresh blocker is in that cap too, the two fresh endpoints are
outside it (otherwise the exact shell-cap intersection identifies one with a
source endpoint), so the existing cap-wide alignment contradiction applies.
The surviving arm carries the complete finite interface needed by the next
producer: canonical source cap, different fresh cap, and both fresh endpoints
outside the canonical cap. -/
theorem false_or_freshCap_ne_opp_of_commonRadius_distinctCaps
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap) :
    False ∨
      (sourceCap = S.oppIndex1 ∧
        freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) := by
  have hfirstIndexed :
      C.surface.firstSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩)
  have hsecondIndexed :
      C.surface.secondSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩)
  have hgeometry :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
          S.capInteriorByIndex S.oppIndex1 ∧
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {C.surface.firstSource.1, C.surface.secondSource.1} :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      (D := D) (S := S) (H := H) (i := S.oppIndex1) (r := C.commonRadius)
      C.surface.firstSource.2 C.surface.secondSource.2
      hfirstIndexed hsecondIndexed C.surface.sources_ne hcenters
      (by simpa only [oppositeVertexByIndex_oppIndex1] using T.oppApex1_rich)
      (isUniqueFourCenter_centerAt H
        C.surface.firstSource.1 C.surface.firstSource.2)
  have hsourceCanonical : sourceCap = S.oppIndex1 := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        hgeometry.1 sourceCenter_mem (Ne.symm hne)) rfl
  have hqOff :=
    freshThird_commonRadius_distinctCaps_sources_off_canonicalCap
      (P := P) (Pρ := Pρ) (T := T) C Q hcenters centers_ne
      source₁_mem source₂_mem overlap_eq
  by_cases hfreshCanonical : freshCap = S.oppIndex1
  · have hsourceCap :
        H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
          S.capByIndex S.oppIndex1 :=
      S.capInteriorByIndex_subset_capByIndex _ hgeometry.1
    have hfreshCap :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capByIndex S.oppIndex1 := by
      rw [← hfreshCanonical]
      exact S.capInteriorByIndex_subset_capByIndex _ freshCenter_mem
    have hfalse : False := by
      let Kcommon :=
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass
      let Ksource :=
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.toSelectedFourClass
      have hoverlap :=
        selectedFourClass_outside_overlap_card_le_one
          S S.oppIndex1 hfreshCap hsourceCap centers_ne.symm Kcommon Ksource
      have hsource₁Common : Q.source₁.1 ∈ Kcommon.support := by
        exact
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support
      have hsource₂Common : Q.source₂.1 ∈ Kcommon.support := by
        exact Q.source₂_mem_source₁_shell
      have hsource₁Overlap :
          Q.source₁.1 ∈
            ((Kcommon.support \ S.capByIndex S.oppIndex1) ∩
              (Ksource.support \ S.capByIndex S.oppIndex1)) := by
        exact
          Finset.mem_inter.mpr
            ⟨Finset.mem_sdiff.mpr ⟨hsource₁Common, hqOff.1⟩,
              Finset.mem_sdiff.mpr ⟨source₁_mem, hqOff.1⟩⟩
      have hsource₂Overlap :
          Q.source₂.1 ∈
            ((Kcommon.support \ S.capByIndex S.oppIndex1) ∩
              (Ksource.support \ S.capByIndex S.oppIndex1)) := by
        exact
          Finset.mem_inter.mpr
            ⟨Finset.mem_sdiff.mpr ⟨hsource₂Common, hqOff.2⟩,
              Finset.mem_sdiff.mpr ⟨source₂_mem, hqOff.2⟩⟩
      have hsourcesPointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
        intro h
        exact Q.sources_ne (Subtype.ext h)
      have htwo :
          1 <
            ((Kcommon.support \ S.capByIndex S.oppIndex1) ∩
              (Ksource.support \ S.capByIndex S.oppIndex1)).card :=
        Finset.one_lt_card.mpr
          ⟨Q.source₁.1, hsource₁Overlap,
            Q.source₂.1, hsource₂Overlap, hsourcesPointsNe⟩
      omega
    exact Or.inl hfalse
  · exact Or.inr ⟨hsourceCanonical, hfreshCanonical, hqOff.1, hqOff.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Transport the one-row cap split across both interaction rows.  Equal
center data identifies the two selected four-shell supports, so the second
row can use the first-row shell-cap geometry.  The result is the concrete
dual packet for the only unresolved arm: both source caps are canonical, both
fresh caps are noncanonical, and the two cap indices agree across rows while
both fresh endpoints stay outside the canonical cap. -/
theorem freshThird_commonRadius_distinctCaps_dual_packet
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne₁ :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem₁ :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem₁ :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq₁ :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap₁ freshCap₁ : Fin 3)
    (sourceCenter_mem₁ :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap₁)
    (freshCenter_mem₁ :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap₁)
    (caps_ne₁ : sourceCap₁ ≠ freshCap₁)
    (centers_ne₂ :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem₂ :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem₂ :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (_overlap_eq₂ :
      (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap₂ freshCap₂ : Fin 3)
    (sourceCenter_mem₂ :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap₂)
    (freshCenter_mem₂ :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap₂)
    (caps_ne₂ : sourceCap₂ ≠ freshCap₂) :
    sourceCap₁ = S.oppIndex1 ∧
      freshCap₁ ≠ S.oppIndex1 ∧
      sourceCap₂ = S.oppIndex1 ∧
      freshCap₂ ≠ S.oppIndex1 ∧
      sourceCap₁ = sourceCap₂ ∧
      freshCap₁ = freshCap₂ ∧
      Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
      Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
  have hsupportEq :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          C.surface.firstSource.1 C.surface.firstSource.2,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H
          C.surface.secondSource.1 C.surface.secondSource.2,
      hcenters]
  have centers_ne₂' :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 := by
    intro h
    exact centers_ne₂ (hcenters.symm.trans h)
  have source₁_mem₂' :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support := by
    rw [hsupportEq]
    exact source₁_mem₂
  have source₂_mem₂' :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support := by
    rw [hsupportEq]
    exact source₂_mem₂
  have sourceCenter_mem₂' :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap₂ := by
    simpa [hcenters] using sourceCenter_mem₂
  rcases
      false_or_freshCap_ne_opp_of_commonRadius_distinctCaps
        (P := P) (Pρ := Pρ) (T := T) C Q hcenters centers_ne₁
        source₁_mem₁ source₂_mem₁ overlap_eq₁ sourceCap₁ freshCap₁
        sourceCenter_mem₁ freshCenter_mem₁ caps_ne₁ with
    hfalse₁ | hpacket₁
  · exact False.elim hfalse₁
  rcases
      false_or_freshCap_ne_opp_of_commonRadius_distinctCaps
        (P := P) (Pρ := Pρ) (T := T) C Q hcenters centers_ne₂'
        source₁_mem₂' source₂_mem₂' overlap_eq₁ sourceCap₂ freshCap₂
        sourceCenter_mem₂' freshCenter_mem₂ caps_ne₂ with
    hfalse₂ | hpacket₂
  · exact False.elim hfalse₂
  rcases hpacket₁ with ⟨hsource₁, hfresh₁, hq₁Off, hq₂Off⟩
  rcases hpacket₂ with ⟨hsource₂, hfresh₂, _hq₁Off₂, _hq₂Off₂⟩
  have hsourceCapsEq : sourceCap₁ = sourceCap₂ := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        sourceCenter_mem₁ sourceCenter_mem₂ hne) hcenters
  have hfreshCapsEq : freshCap₁ = freshCap₂ := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        freshCenter_mem₁ freshCenter_mem₂ hne) rfl
  exact ⟨hsource₁, hfresh₁, hsource₂, hfresh₂,
    hsourceCapsEq, hfreshCapsEq, hq₁Off, hq₂Off⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Build the cyclic-order ingress for the exceptional FreshThird packet.

The packet has two selected four-rows (the canonical source row and the
fresh-blocker row) sharing the two fresh endpoints.  Rather than searching
for a pre-existing global row pattern, choose those two rows explicitly in a
`FaithfulCarrierPattern`, obtain a convex boundary indexing of the whole
carrier, and apply the kernel-checked shared-pair separation theorem.  The
cap facts are returned alongside the separation so the next consumer cannot
silently forget the canonical/different-cap arm.

This is a producer boundary, not a contradiction: the remaining consumer
must turn the cyclic separation plus the cap packet into a cap-order or
Kalmanson contradiction. -/
theorem freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧
        freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ B : BoundaryIndexing D.A,
      (SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩)) ∧
          sourceCap = S.oppIndex1 ∧
          freshCap ≠ S.oppIndex1 ∧
          Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
          Q.source₂.1 ∉ S.capByIndex S.oppIndex1 ∧
          H.centerAt C.firstSource.1 C.firstSource.2 ∈
            S.capInteriorByIndex sourceCap ∧
          H.centerAt Q.source₁.1 Q.source₁.2 ∈
            S.capInteriorByIndex freshCap := by
  classical
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  let Ksource :=
    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  let Kfresh :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hsourceCenter_ne_freshCenter : sourceCenter ≠ freshCenter := by
    intro h
    exact centers_ne (congrArg Subtype.val h)
  have hsourceCenter_val_ne_freshCenter_val :
      sourceCenter.1 ≠ freshCenter.1 := by
    simpa [sourceCenter, freshCenter] using centers_ne
  have hpoints_ne : firstPoint ≠ secondPoint := by
    intro h
    apply Q.sources_ne
    exact Subtype.ext (congrArg Subtype.val h)
  rcases exists_faithfulCarrierPattern_with_two_classes D.K4
      sourceCenter.2 freshCenter.2 hsourceCenter_val_ne_freshCenter_val Ksource Kfresh with
    ⟨F, hFsource, hFfresh⟩
  let rowAt : (center : CarrierLabel D.A) → SelectedFourClass D.A center.1 :=
    fun center => F.classAt center.1 center.2
  have hsource_mem_row :
      firstPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₁_mem
  have hsecond_mem_row :
      secondPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₂_mem
  have hfirst_mem_fresh :
      firstPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsecond_mem_fresh :
      secondPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact Q.source₂_mem_source₁_shell
  have hcard : 4 < D.A.card := D.card_gt_four
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by omega)
  rcases exists_boundaryIndexing D.convex hncol with ⟨B⟩
  have hseparated :=
    selectedFourClass_shared_pair_separated rowAt B.boundary B.indexOf
      B.boundary_ccw B.boundary_injective B.index_injective B.point_eq
      hsourceCenter_ne_freshCenter hpoints_ne
      hsource_mem_row hsecond_mem_row hfirst_mem_fresh hsecond_mem_fresh
  exact ⟨B, hseparated, hpacket.1, hpacket.2.1, hpacket.2.2.1,
    hpacket.2.2.2, sourceCenter_mem, freshCenter_mem⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Canonical zero-cut boundary placement for the exceptional FreshThird arm.

All cap blocks and the shared-pair alternation are expressed on the same
boundary indexing.  This is the missing ingress needed by an order-sensitive
consumer; it deliberately retains the canonical-source/different-fresh-cap
facts instead of collapsing them into an arbitrary cyclic enumeration. -/
theorem freshThird_canonicalDifferentCap_boundary
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧
        freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) ∧
      (SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩)) ∧
      sourceCap = S.oppIndex1 ∧
      freshCap ≠ S.oppIndex1 ∧
      Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
      Q.source₂.1 ∉ S.capByIndex S.oppIndex1 ∧
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap := by
  rcases exists_zeroCutBoundaryIndexing_with_capBlocks
      (D := D) (S := S) with
    ⟨B, hn, iv, iw, hu, hv, hw, hblocks⟩
  have hseparated :=
    freshThird_sharedPairCyclicSeparation_atBoundary
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem B
  exact ⟨B, hn, iv, iw, hu, hv, hw, hblocks, hseparated,
    hpacket.1, hpacket.2.1, hpacket.2.2.1, hpacket.2.2.2,
    sourceCenter_mem, freshCenter_mem⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The boundary producer has only four possible center placements.

The canonical source is in the first opposite-cap interior, while the fresh
center is in either the second opposite cap or the surplus cap.  Pulling the
cap blocks through `BoundaryIndexing.indexOf` therefore gives an explicit
strict order in each direct/mirror arm.  This is the finite order packet that
an eventual metric consumer must consume; it is not itself a contradiction.
-/
private theorem freshThird_canonicalDifferentCap_centerOrder_of_boundary
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (sourceCap freshCap : Fin 3)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n)
    (iv iw : Fin B.n)
    (hblocks :
      DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
      (DirectBoundaryBlocks S B.boundary hn iv iw ∧
        freshCap = S.oppIndex2 ∧
        zeroIndex hn <
            B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
        B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ <
            iv ∧
        iv < iw ∧
        iw <
            B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩) ∨
      (DirectBoundaryBlocks S B.boundary hn iv iw ∧
        freshCap = S.surplusIdx ∧
        zeroIndex hn < iv ∧
        iv <
            B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
        B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ <
            iw ∧
        iw <
            B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩) ∨
      (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
        freshCap = S.oppIndex2 ∧
        zeroIndex hn <
            B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ ∧
        B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ <
            iw ∧
        iw < iv ∧
        iv <
            B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩) ∨
      (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
        freshCap = S.surplusIdx ∧
        zeroIndex hn <
            B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ ∧
        B.indexOf
              ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                (Finset.mem_erase.mp
                  (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ <
            iw ∧
        iw <
            B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
        B.indexOf
              ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                (Finset.mem_erase.mp
                  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ <
            iv) := by
  classical
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  have hsource_mem_opp1 : sourceCenter.1 ∈ S.oppInterior1 := by
    simpa [sourceCenter, SurplusCapPacket.oppInterior1, hpacket.1] using sourceCenter_mem
  have hfresh_cases := triApexAllLargeContext_index_cases S freshCap
  rcases hblocks with hdirect | hmirror
  · have hsource_hit := hdirect.opp1_after sourceCenter.1 hsource_mem_opp1
    rcases hsource_hit with ⟨qsource, hsource_order, hsource_value⟩
    have hsource_idx : qsource = B.indexOf sourceCenter := by
      apply B.boundary_injective
      calc
        B.boundary qsource = sourceCenter.1 := hsource_value
        _ = pointOf sourceCenter := rfl
        _ = B.boundary (B.indexOf sourceCenter) :=
          (B.point_eq sourceCenter).symm
    have hsource_after : iw < B.indexOf sourceCenter := by
      simpa only [hsource_idx] using hsource_order
    rcases hfresh_cases with hfresh | hfresh | hfresh
    · exact False.elim (hpacket.2.1 hfresh)
    · have hfresh_mem_opp2 : freshCenter.1 ∈ S.oppInterior2 := by
        simpa [freshCenter, SurplusCapPacket.oppInterior2, hfresh] using freshCenter_mem
      rcases hdirect.opp2_between freshCenter.1 hfresh_mem_opp2 with
        ⟨qfresh, hfresh_zero, hfresh_iv, hfresh_value⟩
      have hfresh_idx : qfresh = B.indexOf freshCenter := by
        apply B.boundary_injective
        calc
          B.boundary qfresh = freshCenter.1 := hfresh_value
          _ = pointOf freshCenter := rfl
          _ = B.boundary (B.indexOf freshCenter) :=
            (B.point_eq freshCenter).symm
      refine Or.inl ⟨hdirect, hfresh, ?_, ?_, hdirect.apex_order.2, ?_⟩
      · simpa [freshCenter, hfresh_idx] using hfresh_zero
      · simpa [freshCenter, hfresh_idx] using hfresh_iv
      · simpa [sourceCenter] using hsource_after
    · have hfresh_mem_surplus :
          freshCenter.1 ∈ S.capInteriorByIndex S.surplusIdx := by
        simpa [freshCenter, hfresh] using freshCenter_mem
      rcases hdirect.surplus_between freshCenter.1 hfresh_mem_surplus with
        ⟨qfresh, hfresh_iv, hfresh_iw, hfresh_value⟩
      have hfresh_idx : qfresh = B.indexOf freshCenter := by
        apply B.boundary_injective
        calc
          B.boundary qfresh = freshCenter.1 := hfresh_value
          _ = pointOf freshCenter := rfl
          _ = B.boundary (B.indexOf freshCenter) :=
            (B.point_eq freshCenter).symm
      refine Or.inr (Or.inl ⟨hdirect, hfresh, hdirect.apex_order.1, ?_, ?_, ?_⟩)
      · simpa [freshCenter, hfresh_idx] using hfresh_iv
      · simpa [freshCenter, hfresh_idx] using hfresh_iw
      · simpa [sourceCenter] using hsource_after
  · have hsource_hit := hmirror.opp1_between sourceCenter.1 hsource_mem_opp1
    rcases hsource_hit with ⟨qsource, hsource_zero, hsource_iw, hsource_value⟩
    have hsource_idx : qsource = B.indexOf sourceCenter := by
      apply B.boundary_injective
      calc
        B.boundary qsource = sourceCenter.1 := hsource_value
        _ = pointOf sourceCenter := rfl
        _ = B.boundary (B.indexOf sourceCenter) :=
          (B.point_eq sourceCenter).symm
    have hsource_before :
        zeroIndex hn < B.indexOf sourceCenter ∧
          B.indexOf sourceCenter < iw := by
      exact ⟨by simpa only [hsource_idx] using hsource_zero,
        by simpa only [hsource_idx] using hsource_iw⟩
    rcases hfresh_cases with hfresh | hfresh | hfresh
    · exact False.elim (hpacket.2.1 hfresh)
    · have hfresh_mem_opp2 : freshCenter.1 ∈ S.oppInterior2 := by
        simpa [freshCenter, SurplusCapPacket.oppInterior2, hfresh] using freshCenter_mem
      rcases hmirror.opp2_after freshCenter.1 hfresh_mem_opp2 with
        ⟨qfresh, hfresh_iv, hfresh_value⟩
      have hfresh_idx : qfresh = B.indexOf freshCenter := by
        apply B.boundary_injective
        calc
          B.boundary qfresh = freshCenter.1 := hfresh_value
          _ = pointOf freshCenter := rfl
          _ = B.boundary (B.indexOf freshCenter) :=
            (B.point_eq freshCenter).symm
      refine Or.inr (Or.inr (Or.inl ⟨hmirror, hfresh, hsource_before.1,
        hsource_before.2, hmirror.apex_order.2, ?_⟩))
      simpa [freshCenter, hfresh_idx] using hfresh_iv
    · have hfresh_mem_surplus :
          freshCenter.1 ∈ S.capInteriorByIndex S.surplusIdx := by
        simpa [freshCenter, hfresh] using freshCenter_mem
      rcases hmirror.surplus_between freshCenter.1 hfresh_mem_surplus with
        ⟨qfresh, hfresh_iw, hfresh_iv, hfresh_value⟩
      have hfresh_idx : qfresh = B.indexOf freshCenter := by
        apply B.boundary_injective
        calc
          B.boundary qfresh = freshCenter.1 := hfresh_value
          _ = pointOf freshCenter := rfl
          _ = B.boundary (B.indexOf freshCenter) :=
            (B.point_eq freshCenter).symm
      refine Or.inr (Or.inr (Or.inr ⟨hmirror, hfresh, hsource_before.1,
        hsource_before.2, ?_, ?_⟩))
      · simpa [freshCenter, hfresh_idx] using hfresh_iw
      · simpa [freshCenter, hfresh_idx] using hfresh_iv

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Compose the canonical boundary packet with its four-way center-order
producer.  This is the concrete ingress for an order-sensitive FreshThird
consumer; no finite-cardinality or fixed-`n` assumption is introduced. -/
theorem freshThird_canonicalDifferentCap_centerOrder
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf
            ⟨H.centerAt C.firstSource.1 C.firstSource.2,
              (Finset.mem_erase.mp
                (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
          (B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩)) ∧
      ((DirectBoundaryBlocks S B.boundary hn iv iw ∧
          freshCap = S.oppIndex2 ∧
          zeroIndex hn <
              B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
          B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ < iv ∧
          iv < iw ∧
          iw <
              B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩) ∨
        (DirectBoundaryBlocks S B.boundary hn iv iw ∧
          freshCap = S.surplusIdx ∧ zeroIndex hn < iv ∧
          iv <
              B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
          B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ < iw ∧
          iw <
              B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩) ∨
        (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
          freshCap = S.oppIndex2 ∧
          zeroIndex hn <
              B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ ∧
          B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ < iw ∧
          iw < iv ∧
          iv <
              B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩) ∨
        (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
          freshCap = S.surplusIdx ∧
          zeroIndex hn <
              B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ ∧
          B.indexOf
                ⟨H.centerAt C.firstSource.1 C.firstSource.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩ < iw ∧
          iw <
              B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ∧
                B.indexOf
                  ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                    (Finset.mem_erase.mp
                      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩ < iv)) := by
  rcases freshThird_canonicalDifferentCap_boundary
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, hseparated,
      hsourceCap, hfreshNe, hq₁Off, hq₂Off, hsourceMem, hfreshMem⟩
  have horder :=
    freshThird_canonicalDifferentCap_centerOrder_of_boundary
      (P := P) (Pρ := Pρ) C Q sourceCap freshCap B hn iv iw hblocks
      sourceCenter_mem freshCenter_mem hpacket
  exact ⟨B, hn, iv, iw, hzero, hiv, hiw, hseparated, horder⟩

/-- The finite endpoint-order packet extracted from the canonical FreshThird
boundary.  The two center labels are ordered, and exactly one endpoint lies
between them; the other endpoint lies outside the open interval.  This is the
source-level finite producer needed before any order-sensitive consumer can be
applied. -/
def FreshThirdAlternatingEndpointPlacement {n : ℕ}
    (sourceCenter freshCenter firstPoint secondPoint : Fin n) : Prop :=
  (sourceCenter < freshCenter ∧ sourceCenter < firstPoint ∧
      firstPoint < freshCenter ∧
      (secondPoint < sourceCenter ∨ freshCenter < secondPoint)) ∨
    (sourceCenter < freshCenter ∧ sourceCenter < secondPoint ∧
      secondPoint < freshCenter ∧
      (firstPoint < sourceCenter ∨ freshCenter < firstPoint)) ∨
    (freshCenter < sourceCenter ∧ freshCenter < firstPoint ∧
      firstPoint < sourceCenter ∧
      (secondPoint < freshCenter ∨ sourceCenter < secondPoint)) ∨
    (freshCenter < sourceCenter ∧ freshCenter < secondPoint ∧
      secondPoint < sourceCenter ∧
      (firstPoint < freshCenter ∨ sourceCenter < firstPoint))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Turn the boundary producer and shared-pair alternation into a finite
endpoint-placement packet.  The proof uses only exact linear order and the
center-exclusion facts from the two shell rows; it does not introduce a
cardinality bound or a fixed ambient `n`. -/
theorem freshThird_canonicalDifferentCap_endpointPlacement
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) ∧
      (let sourceCenter : CarrierLabel D.A :=
          ⟨H.centerAt C.firstSource.1 C.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
       let freshCenter : CarrierLabel D.A :=
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
       let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
       let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
       FreshThirdAlternatingEndpointPlacement
          (B.indexOf sourceCenter) (B.indexOf freshCenter)
          (B.indexOf firstPoint) (B.indexOf secondPoint) ∧
        firstPoint.1 ∈
          (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
        secondPoint.1 ∈
          (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
        firstPoint.1 ∈
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
        secondPoint.1 ∈
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) := by
  classical
  rcases freshThird_canonicalDifferentCap_boundary
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, hseparated,
      hsourceCap, hfreshNe, hq₁Off, hq₂Off, hsourceMem, hfreshMem⟩
  have horder :=
    freshThird_canonicalDifferentCap_centerOrder_of_boundary
      (P := P) (Pρ := Pρ) C Q sourceCap freshCap B hn iv iw hblocks
      sourceCenter_mem freshCenter_mem hpacket
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  let iSource : Fin B.n := B.indexOf sourceCenter
  let iFresh : Fin B.n := B.indexOf freshCenter
  let iFirst : Fin B.n := B.indexOf firstPoint
  let iSecond : Fin B.n := B.indexOf secondPoint
  have hsource_ne_fresh : sourceCenter ≠ freshCenter := by
    intro h
    exact centers_ne (congrArg Subtype.val h)
  have hsource_ne_first : sourceCenter ≠ firstPoint := by
    intro h
    apply (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_not_mem_support
    have hval :
        H.centerAt C.firstSource.1 C.firstSource.2 = Q.source₁.1 :=
      congrArg Subtype.val h
    simpa [hval] using source₁_mem
  have hsource_ne_second : sourceCenter ≠ secondPoint := by
    intro h
    apply (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_not_mem_support
    have hval :
        H.centerAt C.firstSource.1 C.firstSource.2 = Q.source₂.1 :=
      congrArg Subtype.val h
    simpa [hval] using source₂_mem
  have hfresh_ne_first : freshCenter ≠ firstPoint := by
    intro h
    exact (centerAt_ne_source H Q.source₁.1 Q.source₁.2)
      (congrArg Subtype.val h)
  have hfresh_ne_second : freshCenter ≠ secondPoint := by
    intro h
    apply (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_not_mem_support
    have hval :
        H.centerAt Q.source₁.1 Q.source₁.2 = Q.source₂.1 :=
      congrArg Subtype.val h
    simpa [hval] using Q.source₂_mem_source₁_shell
  have hfirst_ne_second : firstPoint ≠ secondPoint := by
    intro h
    apply Q.sources_ne
    exact Subtype.ext (congrArg Subtype.val h)
  have hiSourceFresh : iSource ≠ iFresh := by
    exact B.index_injective.ne hsource_ne_fresh
  have hiSourceFirst : iSource ≠ iFirst := by
    exact B.index_injective.ne hsource_ne_first
  have hiSourceSecond : iSource ≠ iSecond := by
    exact B.index_injective.ne hsource_ne_second
  have hiFreshFirst : iFresh ≠ iFirst := by
    exact B.index_injective.ne hfresh_ne_first
  have hiFreshSecond : iFresh ≠ iSecond := by
    exact B.index_injective.ne hfresh_ne_second
  have hseparated' :
      SurplusCOMPGBank.btw iSource iFresh iFirst ↔
        ¬ SurplusCOMPGBank.btw iSource iFresh iSecond := by
    simpa [iSource, iFresh, iFirst, iSecond, sourceCenter, freshCenter,
      firstPoint, secondPoint] using hseparated
  have hbetween_or_outside :
      ∀ {a b x y : Fin B.n},
        a < b → a ≠ x → b ≠ x → a ≠ y → b ≠ y →
          (SurplusCOMPGBank.btw a b x ↔ ¬ SurplusCOMPGBank.btw a b y) →
          ((a < x ∧ x < b ∧ (y < a ∨ b < y)) ∨
            (a < y ∧ y < b ∧ (x < a ∨ b < x))) := by
    intro a b x y hab hax hbx hay hby hxy
    by_cases hx : SurplusCOMPGBank.btw a b x
    · have hx' := hx
      simp only [SurplusCOMPGBank.btw] at hx'
      rcases hx' with hx' | hx'
      · left
        refine ⟨hx'.1, hx'.2, ?_⟩
        have hnoty := hxy.mp hx
        have hnoty' :
            ¬ ((a < y ∧ y < b) ∨ (b < y ∧ y < a)) := by
          simpa only [SurplusCOMPGBank.btw] using hnoty
        by_cases hya : y < a
        · exact Or.inl hya
        by_cases hby' : b < y
        · exact Or.inr hby'
        exfalso
        omega
      · exfalso
        omega
    · right
      have hy : SurplusCOMPGBank.btw a b y := by
        by_contra hny
        exact hx (hxy.mpr hny)
      have hy' := hy
      simp only [SurplusCOMPGBank.btw] at hy'
      rcases hy' with hy' | hy'
      · refine ⟨hy'.1, hy'.2, ?_⟩
        have hnotx' :
            ¬ ((a < x ∧ x < b) ∨ (b < x ∧ x < a)) := by
          simpa only [SurplusCOMPGBank.btw] using hx
        by_cases hxa : x < a
        · exact Or.inl hxa
        by_cases hbx' : b < x
        · exact Or.inr hbx'
        exfalso
        omega
      · exfalso
        omega
  have hbtw_symm : ∀ {a b k : Fin B.n},
      SurplusCOMPGBank.btw a b k ↔ SurplusCOMPGBank.btw b a k := by
    intro a b k
    unfold SurplusCOMPGBank.btw
    constructor
    · intro h
      rcases h with h | h
      · exact Or.inr h
      · exact Or.inl h
    · intro h
      rcases h with h | h
      · exact Or.inr h
      · exact Or.inl h
  have hseparated_swap {a b x y : Fin B.n}
      (hxy : SurplusCOMPGBank.btw a b x ↔
        ¬ SurplusCOMPGBank.btw a b y) :
      SurplusCOMPGBank.btw b a x ↔
        ¬ SurplusCOMPGBank.btw b a y := by
    constructor
    · intro hx hy
      exact (hxy.mp (hbtw_symm.mpr hx)) (hbtw_symm.mpr hy)
    · intro hny
      apply hbtw_symm.mp
      apply hxy.mpr
      intro hy
      exact hny (hbtw_symm.mp hy)
  have hplacement :
      FreshThirdAlternatingEndpointPlacement iSource iFresh iFirst iSecond := by
    rcases horder with horder | horder | horder | horder
    · rcases horder with ⟨_, _, _, h₁, h₂, h₃⟩
      have hFreshSource : iFresh < iSource := by
        dsimp [iFresh, iSource, freshCenter, sourceCenter]
        omega
      have hseparated'' :
          SurplusCOMPGBank.btw iFresh iSource iFirst ↔
            ¬ SurplusCOMPGBank.btw iFresh iSource iSecond := by
        exact hseparated_swap hseparated'
      rcases hbetween_or_outside hFreshSource hiFreshFirst hiSourceFirst
          hiFreshSecond hiSourceSecond hseparated'' with h | h
      · exact Or.inr (Or.inr (Or.inl
          ⟨hFreshSource, h.1, h.2.1, h.2.2⟩))
      · exact Or.inr (Or.inr (Or.inr
          ⟨hFreshSource, h.1, h.2.1, h.2.2⟩))
    · rcases horder with ⟨_, _, _, h₁, h₂, h₃⟩
      have hFreshSource : iFresh < iSource := by
        dsimp [iFresh, iSource, freshCenter, sourceCenter]
        omega
      have hseparated'' :
          SurplusCOMPGBank.btw iFresh iSource iFirst ↔
            ¬ SurplusCOMPGBank.btw iFresh iSource iSecond := by
        exact hseparated_swap hseparated'
      rcases hbetween_or_outside hFreshSource hiFreshFirst hiSourceFirst
          hiFreshSecond hiSourceSecond hseparated'' with h | h
      · exact Or.inr (Or.inr (Or.inl
          ⟨hFreshSource, h.1, h.2.1, h.2.2⟩))
      · exact Or.inr (Or.inr (Or.inr
          ⟨hFreshSource, h.1, h.2.1, h.2.2⟩))
    · rcases horder with ⟨_, _, _, h₁, h₂, h₃⟩
      have hSourceFresh : iSource < iFresh := by
        dsimp [iFresh, iSource, freshCenter, sourceCenter]
        omega
      rcases hbetween_or_outside hSourceFresh hiSourceFirst hiFreshFirst
          hiSourceSecond hiFreshSecond hseparated' with h | h
      · exact Or.inl ⟨hSourceFresh, h.1, h.2.1, h.2.2⟩
      · exact Or.inr (Or.inl ⟨hSourceFresh, h.1, h.2.1, h.2.2⟩)
    · rcases horder with ⟨_, _, _, h₁, h₂, h₃⟩
      have hSourceFresh : iSource < iFresh := by
        dsimp [iFresh, iSource, freshCenter, sourceCenter]
        omega
      rcases hbetween_or_outside hSourceFresh hiSourceFirst hiFreshFirst
          hiSourceSecond hiFreshSecond hseparated' with h | h
      · exact Or.inl ⟨hSourceFresh, h.1, h.2.1, h.2.2⟩
      · exact Or.inr (Or.inl ⟨hSourceFresh, h.1, h.2.1, h.2.2⟩)
  refine ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, ?_⟩
  dsimp [sourceCenter, freshCenter, firstPoint, secondPoint,
    iSource, iFresh, iFirst, iSecond]
  exact ⟨hplacement, source₁_mem, source₂_mem,
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support,
    Q.source₂_mem_source₁_shell⟩

/-- Placement of the actual canonical source point in the same zero-cut
boundary packet.  The endpoint producer records the shell-center position;
this companion producer keeps the support point that lives in the canonical
`oppIndex1` block.  A downstream third-shell/Kalmanson consumer needs both
positions, not merely the center order. -/
def FreshThirdCanonicalSourceSupportPlacement {n : ℕ}
    (zero iv iw sourcePoint : Fin n) : Prop :=
  (zero < iv ∧ iv < iw ∧ iw < sourcePoint) ∨
    (zero < sourcePoint ∧ sourcePoint < iw ∧ iw < iv)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Extract the canonical source-point block from the endpoint boundary.
This is source-clean and cardinality-free; it is the next concrete input to
the missing third-incidence producer. -/
theorem freshThird_canonicalDifferentCap_sourceSupportPlacement
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n)
    (iv iw : Fin B.n)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    FreshThirdCanonicalSourceSupportPlacement
        (zeroIndex hn) iv iw
        (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩) := by
  let sourcePoint : CarrierLabel D.A :=
    ⟨C.firstSource.1, C.firstSource.2⟩
  have hsource_mem_opp1 : sourcePoint.1 ∈ S.oppInterior1 := by
    simpa [sourcePoint, SurplusCapPacket.oppInterior1] using
      C.firstSource_data.2.1
  have hsource_idx {q : Fin B.n}
      (hvalue : B.boundary q = sourcePoint.1) :
      q = B.indexOf sourcePoint := by
    apply B.boundary_injective
    calc
      B.boundary q = sourcePoint.1 := hvalue
      _ = pointOf sourcePoint := rfl
      _ = B.boundary (B.indexOf sourcePoint) :=
        (B.point_eq sourcePoint).symm
  rcases hblocks with hdirect | hmirror
  · rcases hdirect.opp1_after sourcePoint.1 hsource_mem_opp1 with
      ⟨qsource, hsource_order, hsource_value⟩
    have hsource_order' :
        iw < B.indexOf sourcePoint := by
      simpa [hsource_idx hsource_value] using hsource_order
    exact Or.inl ⟨hdirect.apex_order.1, hdirect.apex_order.2,
      hsource_order'⟩
  · rcases hmirror.opp1_between sourcePoint.1 hsource_mem_opp1 with
      ⟨qsource, hsource_zero, hsource_iw, hsource_value⟩
    have hsource_order' :
        zeroIndex hn < B.indexOf sourcePoint ∧
          B.indexOf sourcePoint < iw := by
      exact ⟨by simpa [hsource_idx hsource_value] using hsource_zero,
        by simpa [hsource_idx hsource_value] using hsource_iw⟩
    exact Or.inr ⟨hsource_order'.1, hsource_order'.2,
      hmirror.apex_order.2⟩

/-- The four linear five-point orders forced by the exceptional FreshThird
boundary packet.  `qOutside` is the shared endpoint outside the interval
between the two shell centers, while `qBetween` is the shared endpoint inside
that interval.  The canonical source point lies in the first opposite-cap
block with the source center.

This is an order producer, not a contradiction: a downstream Kalmanson
consumer must additionally obtain the two order-selected deletion-row
equalities. -/
def FreshThirdFivePointKalmansonOrder {n : ℕ}
    (qOutside freshCenter qBetween sourceCenter canonicalSource : Fin n) : Prop :=
  (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < sourceCenter ∧ sourceCenter < canonicalSource) ∨
    (qOutside < freshCenter ∧ freshCenter < qBetween ∧
      qBetween < canonicalSource ∧ canonicalSource < sourceCenter) ∨
    (canonicalSource < sourceCenter ∧ sourceCenter < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside) ∨
    (sourceCenter < canonicalSource ∧ canonicalSource < qBetween ∧
      qBetween < freshCenter ∧ freshCenter < qOutside)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Extract the source-faithful five-point Kalmanson order from the canonical
different-cap FreshThird packet.  The result is cardinality-free and records
which named shared endpoint is outside and which lies between the centers. -/
theorem freshThird_canonicalDifferentCap_fivePointKalmansonOrder
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    ∃ (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n),
      (((qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩)) ∧
      FreshThirdFivePointKalmansonOrder qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.firstSource.1 C.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.firstSource.1, C.firstSource.2⟩)) := by
  classical
  rcases freshThird_canonicalDifferentCap_endpointPlacement
      (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, hendpoint⟩
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.firstSource.1 C.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let canonicalSource : CarrierLabel D.A :=
    ⟨C.firstSource.1, C.firstSource.2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  let iSource : Fin B.n := B.indexOf sourceCenter
  let iFresh : Fin B.n := B.indexOf freshCenter
  let iCanonical : Fin B.n := B.indexOf canonicalSource
  let iFirst : Fin B.n := B.indexOf firstPoint
  let iSecond : Fin B.n := B.indexOf secondPoint
  have hplacement :
      FreshThirdAlternatingEndpointPlacement iSource iFresh iFirst iSecond := by
    simpa [sourceCenter, freshCenter, firstPoint, secondPoint,
      iSource, iFresh, iFirst, iSecond] using hendpoint.1
  have hcanonicalPlacement :=
    freshThird_canonicalDifferentCap_sourceSupportPlacement
      (P := P) (Pρ := Pρ) C B hn iv iw hblocks
  have hcenterOrder :=
    freshThird_canonicalDifferentCap_centerOrder_of_boundary
      (P := P) (Pρ := Pρ) C Q sourceCap freshCap B hn iv iw hblocks
      sourceCenter_mem freshCenter_mem hpacket
  have hsource_ne_canonical : sourceCenter ≠ canonicalSource := by
    intro h
    apply
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.center_not_mem_support
    have hvalue :
        H.centerAt C.firstSource.1 C.firstSource.2 = C.firstSource.1 :=
      congrArg Subtype.val h
    simpa [hvalue] using
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.q_mem_support
  have hiSource_ne_iCanonical : iSource ≠ iCanonical := by
    intro h
    exact hsource_ne_canonical (B.index_injective h)
  have hlocal :
      ∃ qOutside qBetween : Fin B.n,
        (((qOutside = iFirst ∧ qBetween = iSecond) ∨
          (qOutside = iSecond ∧ qBetween = iFirst)) ∧
        FreshThirdFivePointKalmansonOrder qOutside iFresh qBetween
          iSource iCanonical) := by
    rcases hblocks with hdirect | hmirror
    · have hiFirst_iw : iFirst < iw := by
        exact index_lt_oppIndex2_of_not_mem_opp1Cap_of_direct
          B hn iv iw hzero hiv hiw hdirect firstPoint
            (by simpa [firstPoint] using hpacket.2.2.1)
      have hiSecond_iw : iSecond < iw := by
        exact index_lt_oppIndex2_of_not_mem_opp1Cap_of_direct
          B hn iv iw hzero hiv hiw hdirect secondPoint
            (by simpa [secondPoint] using hpacket.2.2.2)
      have hiw_iSource : iw < iSource := by
        rcases hcenterOrder with h | h | h | h
        · simpa [iSource, sourceCenter] using h.2.2.2.2.2
        · simpa [iSource, sourceCenter] using h.2.2.2.2.2
        · have hdirectOrder := hdirect.apex_order.2
          have hcontra := h.1.apex_order.2
          omega
        · have hdirectOrder := hdirect.apex_order.2
          have hcontra := h.1.apex_order.2
          omega
      have hiw_iCanonical : iw < iCanonical := by
        rcases hcanonicalPlacement with h | h
        · simpa [iCanonical, canonicalSource] using h.2.2
        · have hdirectOrder := hdirect.apex_order.2
          omega
      rcases hplacement with h | h | h | h
      · omega
      · omega
      · rcases h with ⟨_hfs, hff, hfi, houtside⟩
        have hsecond_fresh : iSecond < iFresh := by
          rcases houtside with h | h
          · exact h
          · omega
        rcases lt_trichotomy iSource iCanonical with hsc | hsc | hcs
        · refine ⟨iSecond, iFirst, Or.inr ⟨rfl, rfl⟩, Or.inl ?_⟩
          exact ⟨hsecond_fresh, hff, hfi, hsc⟩
        · exact False.elim (hiSource_ne_iCanonical hsc)
        · refine ⟨iSecond, iFirst, Or.inr ⟨rfl, rfl⟩,
            Or.inr (Or.inl ?_)⟩
          exact ⟨hsecond_fresh, hff, by omega, hcs⟩
      · rcases h with ⟨_hfs, hsf, hsi, houtside⟩
        have hfirst_fresh : iFirst < iFresh := by
          rcases houtside with h | h
          · exact h
          · omega
        rcases lt_trichotomy iSource iCanonical with hsc | hsc | hcs
        · refine ⟨iFirst, iSecond, Or.inl ⟨rfl, rfl⟩, Or.inl ?_⟩
          exact ⟨hfirst_fresh, hsf, hsi, hsc⟩
        · exact False.elim (hiSource_ne_iCanonical hsc)
        · refine ⟨iFirst, iSecond, Or.inl ⟨rfl, rfl⟩,
            Or.inr (Or.inl ?_)⟩
          exact ⟨hfirst_fresh, hsf, by omega, hcs⟩
    · have hiw_iFirst : iw < iFirst := by
        exact oppIndex2_lt_index_of_not_mem_opp1Cap_of_mirror
          B hn iv iw hzero hiv hiw hmirror firstPoint
            (by simpa [firstPoint] using hpacket.2.2.1)
      have hiw_iSecond : iw < iSecond := by
        exact oppIndex2_lt_index_of_not_mem_opp1Cap_of_mirror
          B hn iv iw hzero hiv hiw hmirror secondPoint
            (by simpa [secondPoint] using hpacket.2.2.2)
      have hiSource_iw : iSource < iw := by
        rcases hcenterOrder with h | h | h | h
        · have hmirrorOrder := hmirror.apex_order.2
          have hcontra := h.1.apex_order.2
          omega
        · have hmirrorOrder := hmirror.apex_order.2
          have hcontra := h.1.apex_order.2
          omega
        · simpa [iSource, sourceCenter] using h.2.2.2.1
        · simpa [iSource, sourceCenter] using h.2.2.2.1
      have hiCanonical_iw : iCanonical < iw := by
        rcases hcanonicalPlacement with h | h
        · have hmirrorOrder := hmirror.apex_order.2
          omega
        · simpa [iCanonical, canonicalSource] using h.2.1
      rcases hplacement with h | h | h | h
      · rcases h with ⟨_hsf, hsi, hif, houtside⟩
        have hfresh_second : iFresh < iSecond := by
          rcases houtside with h | h
          · omega
          · exact h
        rcases lt_trichotomy iSource iCanonical with hsc | hsc | hcs
        · refine ⟨iSecond, iFirst, Or.inr ⟨rfl, rfl⟩,
            Or.inr (Or.inr (Or.inr ?_))⟩
          exact ⟨hsc, by omega, hif, hfresh_second⟩
        · exact False.elim (hiSource_ne_iCanonical hsc)
        · refine ⟨iSecond, iFirst, Or.inr ⟨rfl, rfl⟩,
            Or.inr (Or.inr (Or.inl ?_))⟩
          exact ⟨hcs, hsi, hif, hfresh_second⟩
      · rcases h with ⟨_hsf, hss, hsfresh, houtside⟩
        have hfresh_first : iFresh < iFirst := by
          rcases houtside with h | h
          · omega
          · exact h
        rcases lt_trichotomy iSource iCanonical with hsc | hsc | hcs
        · refine ⟨iFirst, iSecond, Or.inl ⟨rfl, rfl⟩,
            Or.inr (Or.inr (Or.inr ?_))⟩
          exact ⟨hsc, by omega, hsfresh, hfresh_first⟩
        · exact False.elim (hiSource_ne_iCanonical hsc)
        · refine ⟨iFirst, iSecond, Or.inl ⟨rfl, rfl⟩,
            Or.inr (Or.inr (Or.inl ?_))⟩
          exact ⟨hcs, hss, hsfresh, hfresh_first⟩
      · omega
      · omega
  rcases hlocal with ⟨qOutside, qBetween, hnames, horder⟩
  refine ⟨B, qOutside, qBetween, ?_, ?_⟩
  · simpa [iFirst, iSecond, firstPoint, secondPoint] using hnames
  · simpa [iFresh, iSource, iCanonical, freshCenter, sourceCenter,
      canonicalSource] using horder

/-- Project the first source of the additive packet back to the retained
single-source interface. -/
theorem twoCapSourceThirdCanonicalRowSurface_toSingle
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  exact ⟨C.cap_card_ge_eight, C.firstSource, C.firstSource_data.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Swap the two collision rows in one complete canonical-row witness. -/
theorem capSourceThirdCanonicalRowWitness_swap
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source) :
    CapSourceThirdCanonicalRowWitness Pρ P source := by
  rcases hsource with
    ⟨hcap, hinterior, houtside, hneqP, hneqPρ, hneqA1, hneqA2,
      hsupport, hcard, hviewP, hviewPρ⟩
  exact
    ⟨hcap, hinterior,
      by simpa [Finset.union_comm] using houtside,
      hneqPρ, hneqP, hneqA1, hneqA2,
      hsupport, hcard, hviewPρ, hviewP⟩

/-- Swap-compatible form of the additive two-source packet. -/
def twoCapSourceThirdCanonicalRowSurface_swap
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    TwoCapSourceThirdCanonicalRowSurface Pρ P := by
  exact
    ⟨C.cap_card_ge_eight, C.secondSource, C.firstSource,
      C.sources_ne.symm,
      capSourceThirdCanonicalRowWitness_swap
        (P := P) (Pρ := Pρ) C.secondSource C.secondSource_data,
      capSourceThirdCanonicalRowWitness_swap
        (P := P) (Pρ := Pρ) C.firstSource C.firstSource_data⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Package the already checked two-source cap-eight producer without changing
the existing global-split interface. -/
noncomputable def twoCapSourceThirdCanonicalRowSurface_of_capEight
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  let hproducer :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
      P Pρ secondApexRobust hpairsDisjoint hcap
  let source := Classical.choose hproducer
  let hproducer' := Classical.choose_spec hproducer
  let source' := Classical.choose hproducer'
  have hproducer_spec := Classical.choose_spec hproducer'
  have hsourcesNe : source.1 ≠ source'.1 := hproducer_spec.1
  have hsource :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source :=
    hproducer_spec.2.1
  have hsource' :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source' :=
    hproducer_spec.2.2
  refine ⟨hcap, source, source', hsourcesNe, ?_, ?_⟩
  · exact
      ⟨hcap, hsource.1, hsource.2.1,
        hsource.2.2.1, hsource.2.2.2.1,
        hsource.2.2.2.2.1, hsource.2.2.2.2.2.1,
        (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source.1 source.2).toCriticalFourShell.support_card,
        ⟨hsource.2.2.2.2.2.2.1⟩,
        ⟨hsource.2.2.2.2.2.2.2⟩⟩
  · exact
      ⟨hcap, hsource'.1, hsource'.2.1,
        hsource'.2.2.1, hsource'.2.2.2.1,
        hsource'.2.2.2.2.1, hsource'.2.2.2.2.2.1,
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support_card,
        ⟨hsource'.2.2.2.2.2.2.1⟩,
        ⟨hsource'.2.2.2.2.2.2.2⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Lift the single-source global-split packet to the additive two-source
surface.  The global split remains unchanged until its consumers are ready. -/
noncomputable def twoCapSourceThirdCanonicalRowSurface_of_capSource
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  exact
    twoCapSourceThirdCanonicalRowSurface_of_capEight
      (P := P) (Pρ := Pρ)
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      hpairsDisjoint hcapSource.1


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
