/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceTripleShellEscape

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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP -- [shard-prologue-state]

namespace FreshThirdTwoCapSourceObstruction

/-- The normalized two-source packet contains two distinct new centers on the
fresh pair's perpendicular bisector.  The stronger equal-blocker/all-endpoint-
omission constructor intentionally does not erase into this generic case. -/
def HasDistinctCrossRows :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowHit P Pρ C.firstSource Q ∧
        FreshThirdCrossRowHit P Pρ C.secondSource Q ∧
        H.centerAt C.firstSource.1 C.firstSource.2 ≠
          H.centerAt C.secondSource.1 C.secondSource.2
  | .sameBlockerAllEndpointOmission .. => False

/-- Positive residual interface left after the checked three-center arm.  The
all-endpoint-omission constructor keeps all of its stronger fields in
`obstruction`; the proposition merely marks that it is already a residual
constructor rather than a generic normalized packet. -/
def IsResidual :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
  | .sameBlockerAllEndpointOmission .. => True

/-- Constructor-level positive residual packet consumed by the load-bearing
leaf.  Unlike `IsResidual`, the normalized arm has already converted failed
cross-row hits into equal-blocker or source-row-omission data. -/
def ResidualCase :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ => FreshThirdNormalizedResidualCase P Pρ C Q
  | .sameBlockerAllEndpointOmission .. => True

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Convert the negative guard used by the coordinator into the explicit
three-arm residual normal form. -/
theorem isResidual_of_not_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : ¬ obstruction.HasDistinctCrossRows) :
    obstruction.IsResidual := by
  cases obstruction with
  | normalized C Q _ _ =>
      by_cases hfirst :
          FreshThirdCrossRowHit P Pρ C.firstSource Q
      · by_cases hsecond :
            FreshThirdCrossRowHit P Pρ C.secondSource Q
        · by_cases hcenters :
              H.centerAt C.firstSource.1 C.firstSource.2 =
                H.centerAt C.secondSource.1 C.secondSource.2
          · exact Or.inr (Or.inr hcenters)
          · exact (hrows ⟨hfirst, hsecond, hcenters⟩).elim
        · exact Or.inr (Or.inl hsecond)
      · exact Or.inl hfirst
  | sameBlockerAllEndpointOmission => trivial

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Expose the strict residual as constructor-specific positive data before it
reaches the single load-bearing leaf. -/
theorem residualCase_of_isResidual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.IsResidual) :
    obstruction.ResidualCase := by
  cases obstruction with
  | normalized C Q firstInteraction secondInteraction =>
      exact freshThirdNormalizedResidualCase_of_crossRowResidual
        (P := P) (Pρ := Pρ) C Q firstInteraction secondInteraction hresidual
  | sameBlockerAllEndpointOmission => trivial

/-! This is the narrowed frontier left after consuming the canonical
equal-center/`oppIndex1` interaction.  The positive equal-center packet now
stores only distinct-cap or noncanonical same-cap interactions; the original
same-blocker and source-row-omission constructors are eliminated by the hit
hypotheses before this packet is built. -/
inductive FreshThirdNormalizedResidualRemainingCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
  | secondNonHit
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)
      (firstInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.secondSource Q)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Refine the broad residual packet to the remaining-case interface.  The
same-blocker, source-omission, and canonical-cap arms are discharged here;
the two genuinely noncanonical interaction shapes are retained. -/
private theorem freshThirdNormalizedResidualRemainingCase_of_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    FreshThirdNormalizedResidualRemainingCase P Pρ C Q := by
  have false_of_omission :
      ∀ (source : CriticalShellSystem.CarrierVertex D.A)
        (h : FreshThirdCrossRowHit P Pρ source Q)
        (deleted : CriticalShellSystem.CarrierVertex D.A)
        (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
        (deleted_not_mem :
          deleted.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support),
        False := by
    intro source h deleted deleted_eq deleted_not_mem
    rcases deleted_eq with rfl | rfl
    · exact deleted_not_mem h.2.1
    · exact deleted_not_mem h.2.2
  cases hresidual with
  | firstNonHit data => exact .firstNonHit data secondInteraction
  | secondNonHit data => exact .secondNonHit firstInteraction data
  | equalCrossRowCenters hfirst hsecond hcenters =>
      have closeCanonicalFirst :
          ∀ {capIndex : Fin 3},
            H.centerAt C.firstSource.1 C.firstSource.2 ∈
              S.capInteriorByIndex capIndex →
            (Q.source₁.1 ∈ S.capByIndex capIndex ∨
              Q.source₂.1 ∈ S.capByIndex capIndex) →
            capIndex = S.oppIndex1 → False := by
        intro capIndex sourceCenter_mem fiberSource_mem_cap hcapIndex
        exact
          false_of_freshThirdEqualCenter_sameCapOppIndex
            (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
            hfirst.2.1 hfirst.2.2 capIndex sourceCenter_mem
            fiberSource_mem_cap hcapIndex
      cases firstInteraction with
      | sameBlocker center_eq _ => exact False.elim (hfirst.1 center_eq)
      | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
          exact False.elim (false_of_omission C.firstSource hfirst deleted
            deleted_eq deleted_not_mem)
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          let firstNonCanonical :=
            FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
              centers_ne source₁_mem source₂_mem overlap_eq sourceCap freshCap
              sourceCenter_mem freshCenter_mem caps_ne
          cases secondInteraction with
          | sameBlocker center_eq _ => exact False.elim (hsecond.1 center_eq)
          | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
              exact False.elim (false_of_omission C.secondSource hsecond deleted
                deleted_eq deleted_not_mem)
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              exact .equalCrossRowCenters hfirst hsecond hcenters
                firstNonCanonical
                (.distinctBlockersDifferentCaps centers_ne' source₁_mem'
                  source₂_mem' overlap_eq' sourceCap' freshCap'
                  sourceCenter_mem' freshCenter_mem' caps_ne')
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' =>
              by_cases hcapIndex' : capIndex' = S.oppIndex1
              · exact False.elim <| closeCanonicalFirst
                  (by simpa [hcenters] using sourceCenter_mem')
                  fiberSource_mem_cap' hcapIndex'
              · exact .equalCrossRowCenters hfirst hsecond hcenters
                  firstNonCanonical
                  (.sameCapWithInternalFiberSource centers_ne' source₁_mem'
                    source₂_mem' overlap_eq' capIndex' sourceCenter_mem'
                    freshCenter_mem' fiberSource_mem_cap' hcapIndex')
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap =>
          by_cases hcapIndex : capIndex = S.oppIndex1
          · exact False.elim <| closeCanonicalFirst sourceCenter_mem
              fiberSource_mem_cap hcapIndex
          · let firstNonCanonical :=
              FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                centers_ne source₁_mem source₂_mem overlap_eq capIndex
                sourceCenter_mem freshCenter_mem fiberSource_mem_cap hcapIndex
            cases secondInteraction with
            | sameBlocker center_eq _ => exact False.elim (hsecond.1 center_eq)
            | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
                exact False.elim (false_of_omission C.secondSource hsecond deleted
                  deleted_eq deleted_not_mem)
            | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
                overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                caps_ne' =>
                have hsrc : capIndex = sourceCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : capIndex = freshCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact False.elim (caps_ne' (hsrc.symm.trans hfr))
            | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
                overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
                fiberSource_mem_cap' =>
                by_cases hcapIndex' : capIndex' = S.oppIndex1
                · exact False.elim <| closeCanonicalFirst
                    (by simpa [hcenters] using sourceCenter_mem')
                    fiberSource_mem_cap' hcapIndex'
                · exact .equalCrossRowCenters hfirst hsecond hcenters
                    firstNonCanonical
                    (.sameCapWithInternalFiberSource centers_ne' source₁_mem'
                      source₂_mem' overlap_eq' capIndex' sourceCenter_mem'
                      freshCenter_mem' fiberSource_mem_cap' hcapIndex')

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The positive three-center subcase of the obstruction is source-clean. -/
theorem false_of_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : obstruction.HasDistinctCrossRows) :
    False := by
  cases obstruction with
  | normalized C Q _ _ =>
      exact
        false_of_two_freshThirdCrossRowHits_distinctCenters
          (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource
          hrows.1 hrows.2.1 hrows.2.2
  | sameBlockerAllEndpointOmission => exact hrows

end FreshThirdTwoCapSourceObstruction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The triple-shell escape is now paired with the canonical global cover at
the escaped point.  This is the concrete FreshThird producer contract:
global K4 supplies the escaping row, the critical-shell system supplies the
source-faithful cover and deletion obstruction, and distinct centers give the
exact two-circle overlap bound.  No cyclic order or finite-cardinality
assumption is hidden in this packet; those are the only clauses still needed
by a terminal consumer. -/
theorem exists_freshThird_escape_with_sourceFaithful_cover
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈
        freshThirdCriticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            ∃ hzA : z ∈ D.A,
              z ∈ K.support ∧
                z ∉ freshThirdCriticalTripleShellSeed P Pρ source ∧
                ∃ i : Fin 3,
                  H.centerAt z hzA ∈ S.capInteriorByIndex i ∧
                  ¬ HasNEquidistantPointsAt 4
                    (D.A.erase z) (H.centerAt z hzA) ∧
                  ((center = H.centerAt z hzA ∧
                      K.support =
                        (H.selectedAt z hzA).toCriticalFourShell.support) ∨
                    (center ≠ H.centerAt z hzA ∧
                      (K.support ∩
                        (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      exists_freshThird_selectedRow_escape_tripleShellSeed
        (P := P) (Pρ := Pρ) (hlarge := L) source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) ⟨z, hzA⟩ with ⟨i, hi⟩
  have hzBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase z) (H.centerAt z hzA) :=
    H.no_qfree_at z hzA
  by_cases hcenters : center = H.centerAt z hzA
  · subst center
    refine ⟨H.centerAt z hzA, hcenter, K, z, hzA, hzK, hzOutside,
      i, hi, hzBlocked, ?_⟩
    exact Or.inl ⟨rfl, H.selectedFourClass_support_eq_shell z hzA K⟩
  · refine ⟨center, hcenter, K, z, hzA, hzK, hzOutside,
      i, hi, hzBlocked, Or.inr ⟨hcenters, ?_⟩⟩
    simpa [CriticalFourShell.toSelectedFourClass] using
      (SelectedFourClass.inter_card_le_two K
        (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass
        hcenters)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean multiplicity ingress for the two-collision producer.

The older three-hit theorem consumed the geometric residual immediately,
which made its apparent producer transitively depend on the FreshThird
contradiction it was supposed to feed.  This boundary stops before any
terminal: it exposes either a named cross-row hit, or the geometric residual
together with the independent cap-eight/global split.  Any later consumer can
now be audited against this proposition without importing a circular closer.
-/
theorem collisionRows_sourceCleanMultiplicityIngress
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    CollisionCrossHit P Pρ ∨
      (GeometricMultiplicityResidual P Pρ ∧
        TwoCollisionGlobalSplit P Pρ) := by
  classical
  have hglobalCapSplit : TwoCollisionGlobalSplit P Pρ :=
    hcapEightOrCross.imp
      (fun hcap =>
        exists_capSource_thirdCanonicalRow_omits_each_collisionPair
          P Pρ B.secondApex_robust hpairsDisjoint hcap)
      id
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  let a₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have homitted₁ : ∀ x, H.blockerVertex x ≠ apex₁ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H x apex₁.2
  have homitted₂ : ∀ x, H.blockerVertex x ≠ apex₂ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H x apex₂.2
  have homitted₃ : ∀ x, H.blockerVertex x ≠ apex₃ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H x apex₃.2
  have hapex₁₂ : apex₁ ≠ apex₂ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
        (by simpa [apex₁, apex₂] using congrArg Subtype.val h)
  have hapex₁₃ : apex₁ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1).symm
        (by simpa [apex₁, apex₃] using congrArg Subtype.val h)
  have hapex₂₃ : apex₂ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2).symm
        (by simpa [apex₂, apex₃] using congrArg Subtype.val h)
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  have hvalues : H.blockerVertex a₁ ≠ H.blockerVertex b₁ := by
    intro h
    apply hblockersNe
    exact congrArg Subtype.val h.symm
  have hblockerMultiplicity :=
    third_fiber_or_larger_known_fiber_of_three_omissions
      H.blockerVertex homitted₁ homitted₂ homitted₃
      hapex₁₂ hapex₁₃ hapex₂₃ hfa hfb hvalues
  rcases collisionCrossHit_or_geometricMultiplicity
      P Pρ hblockerMultiplicity with hcross | hresidual
  · exact Or.inl hcross
  · exact Or.inr ⟨hresidual, hglobalCapSplit⟩

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A cap-wide alignment producer immediately kills a first-source non-hit.
This adapter is intentionally source-clean: it consumes only the positive
alignment packet and the non-hit constructor, leaving the cap-wide producer
itself as the single mathematical bridge still required by the residual. -/
theorem false_of_freshThird_firstNonHit_of_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

/-- Symmetric cap-wide alignment adapter for a second-source non-hit. -/
theorem false_of_freshThird_secondNonHit_of_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unresolved residual leaf after the canonical equal-center/`oppIndex1`
arm has been removed.  Its interface is deliberately narrower than the
former constructor-product obligation. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consume the common-radius packet in the equal-center residual.  The
packet is useful precisely when either positive interaction is a
noncanonical same-cap interaction: its source-center witness is then enough
for the common-radius shell consumer.  The remaining constructor arms still
use the original residual leaf, so this helper is an ingress refinement, not
an independent closure claim. -/
private theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C.surface Q) :
    False := by
  cases hremaining with
  | firstNonHit data secondInteraction =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C.surface Q (.firstNonHit data secondInteraction)
  | secondNonHit firstInteraction data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C.surface Q (.secondNonHit firstInteraction data)
  | equalCrossRowCenters hfirst hsecond hcenters firstInteraction secondInteraction =>
      cases firstInteraction with
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          cases secondInteraction with
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              have hdual :=
                freshThird_commonRadius_distinctCaps_dual_packet
                  (P := P) (Pρ := Pρ) (T := T) C Q hcenters centers_ne
                  source₁_mem source₂_mem overlap_eq sourceCap freshCap
                  sourceCenter_mem freshCenter_mem caps_ne centers_ne'
                  source₁_mem' source₂_mem' overlap_eq' sourceCap' freshCap'
                  sourceCenter_mem' freshCenter_mem' caps_ne'
              rcases hdual with
                ⟨hsourceCanonical, hfreshNe, hsourceCanonical', hfreshNe',
                  hsourceCapsEq, hfreshCapsEq, hq1Off, hq2Off⟩
              -- This is now the exact producer boundary rather than a
              -- theorem-bank lookup: both rows have the same canonical
              -- source cap and the same noncanonical fresh cap, while both
              -- fresh endpoints are outside the canonical cap.  The next
              -- consumer must use this packet; the residual itself remains
              -- the sole load-bearing obligation.
              have _hpacket :
                  sourceCap = S.oppIndex1 ∧
                    freshCap ≠ S.oppIndex1 ∧
                    sourceCap' = S.oppIndex1 ∧
                    freshCap' ≠ S.oppIndex1 ∧
                    sourceCap = sourceCap' ∧
                    freshCap = freshCap' ∧
                    Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
                    Q.source₂.1 ∉ S.capByIndex S.oppIndex1 :=
                ⟨hsourceCanonical, hfreshNe, hsourceCanonical', hfreshNe',
                  hsourceCapsEq, hfreshCapsEq, hq1Off, hq2Off⟩
              have _hendpointPacket :=
                freshThird_canonicalDifferentCap_endpointPlacement
                  (P := P) (Pρ := Pρ) C.surface Q centers_ne
                  source₁_mem source₂_mem sourceCap freshCap
                  sourceCenter_mem freshCenter_mem
                  ⟨hsourceCanonical, hfreshNe, hq1Off, hq2Off⟩
              have _hcyclicPacket :=
                freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket
                  (P := P) (Pρ := Pρ) C.surface Q centers_ne
                  source₁_mem source₂_mem sourceCap freshCap
                  sourceCenter_mem freshCenter_mem
                  ⟨hsourceCanonical, hfreshNe, hq1Off, hq2Off⟩
              exact
                false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                  (P := P) (Pρ := Pρ)
                  (hρne := hρne) (hfrontierFour := hfrontierFour)
                  (hρfour := hρfour)
                  (hfrontierInteriorEq := hfrontierInteriorEq)
                  (hρInteriorEq := hρInteriorEq)
                  (T := T) (hpairsDisjoint := hpairsDisjoint)
                  (hblockersNe := hblockersNe)
                  (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                  (LP := LP) (hLP := hLP) (MP := MP)
                  C.surface Q
                  (.equalCrossRowCenters hfirst hsecond hcenters
                    (.distinctBlockersDifferentCaps centers_ne source₁_mem
                      source₂_mem overlap_eq sourceCap freshCap sourceCenter_mem
                      freshCenter_mem caps_ne)
                    (.distinctBlockersDifferentCaps centers_ne' source₁_mem'
                      source₂_mem' overlap_eq' sourceCap' freshCap' sourceCenter_mem'
                      freshCenter_mem' caps_ne'))
              /-
              · have hsourceCap :
                    H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
                      S.capByIndex S.oppIndex1 :=
                  S.capInteriorByIndex_subset_capByIndex _ hgeometry.1
                have hfreshCap :
                    H.centerAt Q.source₁.1 Q.source₁.2 ∈
                      S.capByIndex S.oppIndex1 := by
                  rw [← hfreshCanonical]
                  exact
                    S.capInteriorByIndex_subset_capByIndex _ freshCenter_mem
                have hq1Off : Q.source₁.1 ∉ S.capByIndex S.oppIndex1 := by
                  intro hqCap
                  have hqInter :
                      Q.source₁.1 ∈
                        (H.selectedAt C.surface.firstSource.1
                          C.surface.firstSource.2).toCriticalFourShell.support ∩
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
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans
                      (hcenters.symm.trans hcenters)
                have hq2Off : Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
                  intro hqCap
                  have hqInter :
                      Q.source₂.1 ∈
                        (H.selectedAt C.surface.firstSource.1
                          C.surface.firstSource.2).toCriticalFourShell.support ∩
                          S.capByIndex S.oppIndex1 :=
                    Finset.mem_inter.mpr ⟨source₂_mem, hqCap⟩
                  rw [hgeometry.2] at hqInter
                  have hqCases :
                      Q.source₂.1 = C.surface.firstSource.1 ∨
                        Q.source₂.1 = C.surface.secondSource.1 := by
                    simpa [Finset.mem_insert, Finset.mem_singleton] using hqInter
                  have hQCenters :
                      H.centerAt Q.source₂.1 Q.source₂.2 =
                        H.centerAt Q.source₁.1 Q.source₁.2 :=
                    congrArg Subtype.val Q.blockers_eq
                  rcases hqCases with hq | hq
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans hQCenters
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans
                      (hcenters.symm.trans hcenters).trans hQCenters
                exact
                  false_of_freshThird_sameCapCrossRowAlignment
                    (P := P) (Pρ := Pρ) Q C.surface.firstSource
                    ⟨S.oppIndex1, hfreshCap, hsourceCap, centers_ne,
                      hq1Off, hq2Off, source₁_mem, source₂_mem⟩
              · exact
                  false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                    (P := P) (Pρ := Pρ)
                    (hρne := hρne) (hfrontierFour := hfrontierFour)
                    (hρfour := hρfour)
                    (hfrontierInteriorEq := hfrontierInteriorEq)
                    (hρInteriorEq := hρInteriorEq)
                    (T := T) (hpairsDisjoint := hpairsDisjoint)
                    (hblockersNe := hblockersNe)
                    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                    (LP := LP) (hLP := hLP) (MP := MP)
                    C.surface Q
                    (.equalCrossRowCenters hfirst hsecond hcenters
                      (.distinctBlockersDifferentCaps centers_ne source₁_mem
                        source₂_mem overlap_eq sourceCap freshCap sourceCenter_mem
                        freshCenter_mem caps_ne)
                      (.distinctBlockersDifferentCaps centers_ne' source₁_mem'
                        source₂_mem' overlap_eq' sourceCap' freshCap'
                        sourceCenter_mem' freshCenter_mem' caps_ne'))
              -/
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' hcapIndex' =>
              have sourceCenter_mem_first :
                  H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
                    S.capInteriorByIndex capIndex' := by
                simpa [hcenters] using sourceCenter_mem'
              exact
                false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
                  (P := P) (Pρ := Pρ) C T.oppApex1_rich
                  sourceCenter_mem_first hcapIndex' hcenters
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap
          hcapIndex =>
          exact
            false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
              (P := P) (Pρ := Pρ) C T.oppApex1_rich
              sourceCenter_mem hcapIndex hcenters

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Common-radius version of the normalized core.  It keeps the producer's
provenance through residual construction, allowing the packet-aware terminal
to consume same-cap/equal-center branches before falling back to the existing
residual leaf. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.secondSource Q) :
    False := by
  let obstruction :=
    FreshThirdTwoCapSourceObstruction.normalized
      (P := P) (Pρ := Pρ) C.surface Q firstInteraction secondInteraction
  by_cases hrows : obstruction.HasDistinctCrossRows
  · exact
      FreshThirdTwoCapSourceObstruction.false_of_hasDistinctCrossRows
        (P := P) (Pρ := Pρ) obstruction hrows
  · exact
      let hresidual :=
        FreshThirdTwoCapSourceObstruction.residualCase_of_isResidual
          (P := P) (Pρ := Pρ) obstruction
          (FreshThirdTwoCapSourceObstruction.isResidual_of_not_hasDistinctCrossRows
            (P := P) (Pρ := Pρ) obstruction hrows)
      have hremaining :=
        FreshThirdTwoCapSourceObstruction.freshThirdNormalizedResidualRemainingCase_of_residual
          (P := P) (Pρ := Pρ) C.surface Q firstInteraction secondInteraction
          hresidual
      false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        C Q hremaining

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor-specific terminal for the normalized fresh-third packet after
the checked distinct-three-center arm has been removed. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    False := by
  have false_of_omission :
      ∀ (source : CriticalShellSystem.CarrierVertex D.A)
        (h : FreshThirdCrossRowHit P Pρ source Q)
        (deleted : CriticalShellSystem.CarrierVertex D.A)
        (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
        (deleted_not_mem :
          deleted.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support),
        False := by
    intro source h deleted deleted_eq deleted_not_mem
    rcases deleted_eq with rfl | rfl
    · exact deleted_not_mem h.2.1
    · exact deleted_not_mem h.2.2
  cases hresidual with
  | firstNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q
          (.firstNonHit data secondInteraction)
  | secondNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q
          (.secondNonHit firstInteraction data)
  | equalCrossRowCenters hfirst hsecond hcenters =>
      have closeCanonicalFirst :
          ∀ {capIndex : Fin 3},
            H.centerAt C.firstSource.1 C.firstSource.2 ∈
              S.capInteriorByIndex capIndex →
            (Q.source₁.1 ∈ S.capByIndex capIndex ∨
              Q.source₂.1 ∈ S.capByIndex capIndex) →
            capIndex = S.oppIndex1 → False := by
        intro capIndex sourceCenter_mem fiberSource_mem_cap hcapIndex
        exact
          false_of_freshThirdEqualCenter_sameCapOppIndex
            (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
            hfirst.2.1 hfirst.2.2 capIndex sourceCenter_mem
            fiberSource_mem_cap hcapIndex
      cases firstInteraction with
      | sameBlocker center_eq _ =>
          exact hfirst.1 center_eq
      | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
          exact false_of_omission C.firstSource hfirst deleted deleted_eq
            deleted_not_mem
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          let firstNonCanonical :=
            FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
              centers_ne source₁_mem source₂_mem overlap_eq sourceCap freshCap
              sourceCenter_mem freshCenter_mem caps_ne
          cases secondInteraction with
          | sameBlocker center_eq _ =>
              exact hsecond.1 center_eq
          | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
              exact false_of_omission C.secondSource hsecond deleted deleted_eq
                deleted_not_mem
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              exact
                false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                  (P := P) (Pρ := Pρ)
                  (hρne := hρne) (hfrontierFour := hfrontierFour)
                  (hρfour := hρfour)
                  (hfrontierInteriorEq := hfrontierInteriorEq)
                  (hρInteriorEq := hρInteriorEq)
                  (T := T) (hpairsDisjoint := hpairsDisjoint)
                  (hblockersNe := hblockersNe)
                  (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                  (LP := LP) (hLP := hLP) (MP := MP)
                  C Q
                  (.equalCrossRowCenters hfirst hsecond hcenters
                    firstNonCanonical
                    (FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
                      centers_ne' source₁_mem' source₂_mem' overlap_eq'
                      sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                      caps_ne'))
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' =>
              by_cases hcapIndex' : capIndex' = S.oppIndex1
              · have sourceCenter_mem_first :
                    H.centerAt C.firstSource.1 C.firstSource.2 ∈
                      S.capInteriorByIndex capIndex' := by
                  simpa [hcenters] using sourceCenter_mem'
                exact closeCanonicalFirst sourceCenter_mem_first
                  fiberSource_mem_cap' hcapIndex'
              · have hsrc : sourceCap = capIndex' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : freshCap = capIndex' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact caps_ne (hsrc.trans hfr.symm)
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap =>
          by_cases hcapIndex : capIndex = S.oppIndex1
          · exact closeCanonicalFirst sourceCenter_mem fiberSource_mem_cap hcapIndex
          · let firstNonCanonical :=
              FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                centers_ne source₁_mem source₂_mem overlap_eq capIndex
                sourceCenter_mem freshCenter_mem fiberSource_mem_cap hcapIndex
            cases secondInteraction with
            | sameBlocker center_eq _ =>
                exact hsecond.1 center_eq
            | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
                exact false_of_omission C.secondSource hsecond deleted deleted_eq
                  deleted_not_mem
            | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
                overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                caps_ne' =>
                have hsrc : capIndex = sourceCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : capIndex = freshCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact caps_ne' (hsrc.symm.trans hfr)
            | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
                overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
                fiberSource_mem_cap' =>
                by_cases hcapIndex' : capIndex' = S.oppIndex1
                · have sourceCenter_mem_first :
                      H.centerAt C.firstSource.1 C.firstSource.2 ∈
                        S.capInteriorByIndex capIndex' := by
                    simpa [hcenters] using sourceCenter_mem'
                  exact closeCanonicalFirst sourceCenter_mem_first
                    fiberSource_mem_cap' hcapIndex'
                · exact
                    false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                      (P := P) (Pρ := Pρ)
                      (hρne := hρne) (hfrontierFour := hfrontierFour)
                      (hρfour := hρfour)
                      (hfrontierInteriorEq := hfrontierInteriorEq)
                      (hρInteriorEq := hρInteriorEq)
                      (T := T) (hpairsDisjoint := hpairsDisjoint)
                      (hblockersNe := hblockersNe)
                      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                      (LP := LP) (hLP := hLP) (MP := MP)
                      C Q
                      (.equalCrossRowCenters hfirst hsecond hcenters
                        firstNonCanonical
                        (FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                          centers_ne' source₁_mem' source₂_mem' overlap_eq'
                          capIndex' sourceCenter_mem' freshCenter_mem'
                          fiberSource_mem_cap' hcapIndex'))


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
