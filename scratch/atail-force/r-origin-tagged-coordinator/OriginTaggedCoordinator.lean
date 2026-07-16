/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReciprocalSwapIntegration
import AnchoredTwoRowCoverConsumer
import FailureProfilesParentLift
import F2StrictCellNormalForm

/-!
# Origin-tagged R coordinator

The resolved and collapsed R normal forms project common-deletion packets to
anonymous existential data.  That projection is too weak for the remaining
closure work: it forgets the reciprocal directed-cross witness and, on the
spent branch, the frontier, the spent-entry certificate, the deleted source,
and the first opposite apex.

This scratch interface rebuilds the normal form directly from the chosen
frontier and retains the exact anchored, reciprocal, or spent origin of every
common-deletion packet.  It also exposes a motive-valued eliminator whose
handlers visibly cover:

* unaligned and live-center-aligned packets;
* the two-off-live positive continuation and its failure;
* F1, F2, and F3; and
* F2 live-heavy, support-heavy, and mixed.

No handler is implemented here.  In particular, taking the motive to be
`False` still requires a genuine producer for every displayed branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailROriginTaggedCoordinatorScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRDangerousRetainingFullParentNormalFormScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2StrictCellNormalFormScratch
open ATailRF2ThreeRowChainScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.AmbientRobustHistoryPair
open ATailRFullParentEntryScratch.CriticalPairFrontier
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual
open ATailRFullParentNormalFormScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch
open ATailRTwoOffLiveFailureScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The unchanged protected unique-radius arm at the original first apex. -/
def OriginalUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (_F : CriticalPairFrontier D S radius H) : Prop :=
  ((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius

/-- The exact common-deletion arm of the reciprocal global continuation.

The earlier resolved coordinator kept only `z` and the packet.  This record
also retains the reciprocal residual and every source-row, carrier,
uniqueness, and directed-cross field produced before the final
common-deletion/critical split. -/
structure ReciprocalCommonDeletionContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_X : ReciprocalDirectedCrossResidual R) : Type where
  z : ℝ²
  z_mem_deletedRow :
    z ∈ R.reciprocalDeletedRow.support
  z_not_mem_fixedClass :
    z ∉ SelectedClass D.A S.oppApex1 radius
  z_mem_terminalCarrier :
    z ∈ T.carrier
  z_not_mem_sourceRow :
    z ∉ R.sourceRow.support
  sourceRow_exact_after_deleted_and_z :
    SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter R.sourceRow.radius =
      R.sourceRow.support
  sourceRow_unique_radius_after_deleted_and_z :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter tau).card →
      tau = R.sourceRow.radius
  directedCross_signedArea_product_neg :
    signedArea2 R.sourcePair.x S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
      signedArea2 R.deleted S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0
  packet :
    CommonDeletionTwoCenterPacket
      D H z R.firstCenter S.oppApex2

/-- Preserve the complete reciprocal witness on the common-deletion arm and
route only the prescribed second-apex-critical arm to swapped `FA-UNIQ4`. -/
theorem reciprocalCommonDeletionContinuation_or_swappedFirstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    Nonempty (ReciprocalCommonDeletionContinuation X) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases X.exists_fresh_commonDeletion_or_secondApexCritical with
    ⟨z, hzDeletedRow, hzNotFixed, hzCarrier, hzOutsideSource,
      hsourceExact, hsourceUnique, hsign, hnext⟩
  rcases hnext with hcommon | ⟨C, hblocked, _hsupport⟩
  · rcases hcommon with ⟨G⟩
    exact Or.inl ⟨{
      z := z
      z_mem_deletedRow := hzDeletedRow
      z_not_mem_fixedClass := hzNotFixed
      z_mem_terminalCarrier := hzCarrier
      z_not_mem_sourceRow := hzOutsideSource
      sourceRow_exact_after_deleted_and_z := hsourceExact
      sourceRow_unique_radius_after_deleted_and_z := hsourceUnique
      directedCross_signedArea_product_neg := hsign
      packet := G }⟩
  · exact Or.inr
      (secondApexCritical_reorients_to_firstApexUniqueFour C hblocked)

/-- Exact provenance tag for one R common-deletion packet.

The indices force the packet itself to be the one constructed by the named
origin; there is no later equality transport or anonymous replacement. -/
inductive RCommonDeletionOrigin
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H) :
    (deleted center₁ : ℝ²) →
      CommonDeletionTwoCenterPacket
        D W.H deleted center₁ S.oppApex2 →
      Type
  | anchored
      {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (A : AnchoredSourceCriticalTransition R)
      (X : RowExternalCommonDeletionSource A)
      (fresh_off_surplus : X.point ∉ S.surplusCap) :
      RCommonDeletionOrigin S W F X.point R.firstCenter
        X.toSharedRowCommonDeletionPacket
  | reciprocal
      {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (X : ReciprocalDirectedCrossResidual R)
      (G : ReciprocalCommonDeletionContinuation X) :
      RCommonDeletionOrigin S W F G.z R.firstCenter G.packet
  | spent
      (E : FrontierRadiusSpentAtEntry F)
      (C : CommonDeletionTwoCenterPacket
        D W.H F.pair.q S.oppApex1 S.oppApex2) :
      RCommonDeletionOrigin S W F F.pair.q S.oppApex1 C

/-- A common-deletion packet together with its exact R origin. -/
structure OriginTaggedRCommonDeletion
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H) : Type where
  deleted : ℝ²
  firstCenter : ℝ²
  packet :
    CommonDeletionTwoCenterPacket
      D W.H deleted firstCenter S.oppApex2
  origin :
    RCommonDeletionOrigin S W F deleted firstCenter packet

/-- Source-current coordinator with the surplus placement and every R origin
retained.  The protected unique-radius and swapped-`FA-UNIQ4` arms remain
explicit dependencies. -/
structure OriginTaggedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H) : Prop where
  q_mem_surplus :
    q ∈ S.surplusCap
  outcome :
    OriginalUniqueRadiusArm F ∨
      Nonempty (OriginTaggedRCommonDeletion S W F) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H)

/-- Rebuild the coordinator from the chosen frontier before either
reciprocal or spent provenance is projected away. -/
theorem CriticalPairFrontier.originTaggedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    (hqSurplus : q ∈ S.surplusCap)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    OriginTaggedCurrentFirstApexFixedRadiusNormalForm S W F := by
  refine {
    q_mem_surplus := hqSurplus
    outcome := ?_ }
  rcases
      firstApexUnique_or_fixedSingleRadiusOrbit_or_spent
        F hradius hfour with hunique | hcoherent | hspent
  · exact Or.inl hunique
  · rcases hcoherent with ⟨T, P, hsource, _horbit⟩
    rcases nonempty_oppCap1OrderedData D S with ⟨O⟩
    rcases anchoredTransition_or_terminalDirectedCross
        T.terminal P W.H O with hanchored | hreciprocal
    · rcases hanchored with ⟨R, ⟨A⟩⟩
      rcases exists_offSurplus_sharedRowSource A with ⟨X, hXOff⟩
      exact Or.inr <| Or.inl ⟨{
        deleted := X.point
        firstCenter := R.firstCenter
        packet := X.toSharedRowCommonDeletionPacket
        origin := RCommonDeletionOrigin.anchored hsource A X hXOff }⟩
    · rcases hreciprocal with ⟨R, ⟨X⟩⟩
      rcases
          reciprocalCommonDeletionContinuation_or_swappedFirstApexUniqueFour
            X with
        hcommon | hswapped
      · rcases hcommon with ⟨G⟩
        exact Or.inr <| Or.inl ⟨{
          deleted := G.z
          firstCenter := R.firstCenter
          packet := G.packet
          origin := RCommonDeletionOrigin.reciprocal hsource X G }⟩
      · exact Or.inr (Or.inr hswapped)
  · rcases hspent with ⟨E⟩
    rcases E.both_originalPoints_commonDeletion.1 with ⟨C⟩
    exact Or.inr <| Or.inl ⟨{
      deleted := F.pair.q
      firstCenter := S.oppApex1
      packet := C
      origin := RCommonDeletionOrigin.spent E C }⟩

set_option linter.unusedVariables false in
/-- Parent-facing adapter.  It deliberately re-enters through the chosen
frontier instead of attempting to invert the lossy current or resolved
normal-form proposition. -/
theorem fullParent_extracts_dangerousRetainingOriginTaggedNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D S radius W.H,
                OriginTaggedCurrentFirstApexFixedRadiusNormalForm S W F := by
  rcases
      fullParent_extracts_dangerousRetainingCurrentNormalForm
        MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase Hlive
        hcenter hsupport with
    ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F, _hcurrent⟩
  exact ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F,
    CriticalPairFrontier.originTaggedCurrentFirstApexFixedRadiusNormalForm
      W F hqSurplus hradius hfour⟩

/-- Retype a common-deletion packet after its first center is identified with
the retained live center.  No row or radius witness is reselected. -/
def commonDeletionAtLiveCenter
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (hcenter : center₁ = p) :
    CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2 := by
  subst center₁
  exact C

/-- Complete aligned branch surface.  Each constructor records a checked
reduction, not a contradiction. -/
inductive AlignedRCommonDeletionBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Prop
  | twoOffLive
      (htwo :
        2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
          ({q, t1, t2, t3} : Finset ℝ²))).card)
      (continuation :
        (∃ X : FreshCriticalSource C,
          X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
            Nonempty (CommonDeletionTwoCenterPacket
              D W.H X.point p S.oppApex2)) ∨
          Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) :
      AlignedRCommonDeletionBranch S W C
  | f1
      (cap : SecondApexRowCapProfile S C)
      (failure :
        OneLiveOverlapFailureProfile deleted C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C))
      (support_inter_live_card_le_one :
        (deletedCriticalSupport C ∩
          ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 1) :
      AlignedRCommonDeletionBranch S W C
  | f2LiveHeavy
      (profile : TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
      (chain : SourceFaithfulF2ThreeRowChain S W C) :
      AlignedRCommonDeletionBranch S W C
  | f2SupportHeavy
      (profile : TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
      (reduction : F2SupportHeavyReduction S W C) :
      AlignedRCommonDeletionBranch S W C
  | f2Mixed
      (profile : TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
      (boundary : F2MixedOneLiveOneSupportBoundary S W C) :
      AlignedRCommonDeletionBranch S W C
  | f3
      (cap : SecondApexRowCapProfile S C)
      (failure :
        TwoLiveOneOffFailureProfile deleted C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C))
      (support_inter_live_card_le_two :
        (deletedCriticalSupport C ∩
          ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2) :
      AlignedRCommonDeletionBranch S W C

/-- Construct the complete aligned branch surface from the exact packet. -/
theorem alignedRCommonDeletionBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (hqSurplus : q ∈ S.surplusCap) :
    AlignedRCommonDeletionBranch S W C := by
  by_cases htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card
  · exact AlignedRCommonDeletionBranch.twoOffLive htwo
      (successor_or_secondCenterAlignment_of_two_off_live_sources
        W C htwo)
  · rcases liveSecondApex_failure_refinement S W C htwo with
      ⟨cap, hF1 | hF2 | hF3⟩
    · exact AlignedRCommonDeletionBranch.f1 cap hF1.1 hF1.2
    · let N := resolvedF2StrictCellNormalForm S W C hqSurplus hF2
      rcases N.branch with hlive | hsupport | hmixed
      · exact AlignedRCommonDeletionBranch.f2LiveHeavy hF2 hlive
      · exact AlignedRCommonDeletionBranch.f2SupportHeavy hF2 hsupport
      · exact AlignedRCommonDeletionBranch.f2Mixed hF2 hmixed
    · exact AlignedRCommonDeletionBranch.f3 cap hF3.1 hF3.2

/-- Complete live-center alignment split for an exact common-deletion
packet. -/
inductive RCommonDeletionBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2) : Prop
  | unaligned
      (center_ne_live : center₁ ≠ p) :
      RCommonDeletionBranch S W C
  | aligned
      (center_eq_live : center₁ = p)
      (branch :
        AlignedRCommonDeletionBranch S W
          (commonDeletionAtLiveCenter C center_eq_live)) :
      RCommonDeletionBranch S W C

/-- Every exact common-deletion packet reaches one and only one displayed
alignment surface; the aligned surface then exposes the complete finite
failure classifier. -/
theorem rCommonDeletionBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (hqSurplus : q ∈ S.surplusCap) :
    RCommonDeletionBranch S W C := by
  by_cases hcenter : center₁ = p
  · exact RCommonDeletionBranch.aligned hcenter
      (alignedRCommonDeletionBranch S W
        (commonDeletionAtLiveCenter C hcenter) hqSurplus)
  · exact RCommonDeletionBranch.unaligned hcenter

set_option linter.unusedVariables false in
/-- Motive-valued handler contract for the aligned branch surface.

Setting `Goal := False` is the eventual closure use, but this structure
asserts no handler and proves no branch impossible. -/
structure AlignedRCommonDeletionEliminator
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (Goal : Prop) : Prop where
  twoOffLive :
    ∀ (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card),
      ((∃ X : FreshCriticalSource C,
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          Nonempty (CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2)) ∨
        Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) →
      Goal
  f1 :
    SecondApexRowCapProfile S C →
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) →
      (deletedCriticalSupport C ∩
        ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 1 →
      Goal
  f2LiveHeavy :
    TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C →
      SourceFaithfulF2ThreeRowChain S W C →
      Goal
  f2SupportHeavy :
    TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C →
      F2SupportHeavyReduction S W C →
      Goal
  f2Mixed :
    TwoLiveExactCoverSecondApexProfile
        (live := ({q, t1, t2, t3} : Finset ℝ²)) S C →
      F2MixedOneLiveOneSupportBoundary S W C →
      Goal
  f3 :
    SecondApexRowCapProfile S C →
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) →
      (deletedCriticalSupport C ∩
        ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2 →
      Goal

/-- Apply a complete aligned handler contract to the checked branch
surface. -/
theorem AlignedRCommonDeletionEliminator.eliminate
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {Goal : Prop}
    (E : AlignedRCommonDeletionEliminator S W C Goal)
    (B : AlignedRCommonDeletionBranch S W C) :
    Goal := by
  rcases B with
    ⟨htwo, hnext⟩ | ⟨cap, F1, hone⟩ |
      ⟨F2, P⟩ | ⟨F2, P⟩ | ⟨F2, P⟩ | ⟨cap, F3, htwo⟩
  · exact E.twoOffLive htwo hnext
  · exact E.f1 cap F1 hone
  · exact E.f2LiveHeavy F2 P
  · exact E.f2SupportHeavy F2 P
  · exact E.f2Mixed F2 P
  · exact E.f3 cap F3 htwo

/-- Motive-valued handler contract for an exact packet before live-center
alignment is known. -/
structure RCommonDeletionEliminator
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (Goal : Prop) : Prop where
  unaligned :
    center₁ ≠ p → Goal
  aligned :
    ∀ hcenter : center₁ = p,
      AlignedRCommonDeletionEliminator
        S W (commonDeletionAtLiveCenter C hcenter) Goal

/-- Apply the alignment and finite-branch handlers to an exact packet. -/
theorem RCommonDeletionEliminator.eliminate
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2}
    {Goal : Prop}
    (E : RCommonDeletionEliminator S W C Goal)
    (hqSurplus : q ∈ S.surplusCap) :
    Goal := by
  rcases rCommonDeletionBranch S W C hqSurplus with
    hunaligned | ⟨hcenter, haligned⟩
  · exact E.unaligned hunaligned
  · exact (E.aligned hcenter).eliminate haligned

set_option linter.unusedVariables false in
/-- Origin-visible handler contract.  Each origin receives its complete
source data before supplying the packet-level alignment handlers. -/
structure OriginTaggedRCommonDeletionEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    (Goal : Prop) : Prop where
  anchored :
    ∀ {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (A : AnchoredSourceCriticalTransition R)
      (X : RowExternalCommonDeletionSource A)
      (fresh_off_surplus : X.point ∉ S.surplusCap),
      RCommonDeletionEliminator
        S W X.toSharedRowCommonDeletionPacket Goal
  reciprocal :
    ∀ {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (X : ReciprocalDirectedCrossResidual R)
      (G : ReciprocalCommonDeletionContinuation X),
      RCommonDeletionEliminator S W G.packet Goal
  spent :
    ∀ (E : FrontierRadiusSpentAtEntry F)
      (C : CommonDeletionTwoCenterPacket
        D W.H F.pair.q S.oppApex1 S.oppApex2),
      RCommonDeletionEliminator S W C Goal

/-- Eliminate an origin-tagged packet only after handlers for all three
origins and every downstream branch have been supplied. -/
theorem OriginTaggedRCommonDeletionEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {Goal : Prop}
    (E : OriginTaggedRCommonDeletionEliminator S W F Goal)
    (hqSurplus : q ∈ S.surplusCap)
    (O : OriginTaggedRCommonDeletion S W F) :
    Goal := by
  rcases O with ⟨deleted, center₁, C, origin⟩
  rcases origin with
    ⟨hsource, A, X, hXOff⟩ | ⟨hsource, X, G⟩ | ⟨Espent, Cspent⟩
  · exact (E.anchored hsource A X hXOff).eliminate hqSurplus
  · exact (E.reciprocal hsource X G).eliminate hqSurplus
  · exact (E.spent Espent Cspent).eliminate hqSurplus

/-- Full coordinator eliminator.  The unique-row and swapped-unique-row
handlers remain separate protected dependencies, while the R handler is the
origin- and branch-complete contract above. -/
structure OriginTaggedCoordinatorEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    (Goal : Prop) : Prop where
  originalUnique :
    OriginalUniqueRadiusArm F → Goal
  commonDeletion :
    OriginTaggedRCommonDeletionEliminator S W F Goal
  swappedUniqueFour :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H) → Goal

/-- Consume the source-current coordinator with no hidden packet projection.
For closure, instantiate `Goal := False` only after every handler has a real
producer. -/
theorem OriginTaggedCoordinatorEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {Goal : Prop}
    (E : OriginTaggedCoordinatorEliminator S W F Goal)
    (N : OriginTaggedCurrentFirstApexFixedRadiusNormalForm S W F) :
    Goal := by
  rcases N.outcome with hunique | hcommon | hswapped
  · exact E.originalUnique hunique
  · rcases hcommon with ⟨O⟩
    exact E.commonDeletion.eliminate N.q_mem_surplus O
  · exact E.swappedUniqueFour hswapped

#print axioms
  reciprocalCommonDeletionContinuation_or_swappedFirstApexUniqueFour
#print axioms
  CriticalPairFrontier.originTaggedCurrentFirstApexFixedRadiusNormalForm
#print axioms
  fullParent_extracts_dangerousRetainingOriginTaggedNormalForm
#print axioms alignedRCommonDeletionBranch
#print axioms rCommonDeletionBranch
#print axioms AlignedRCommonDeletionEliminator.eliminate
#print axioms RCommonDeletionEliminator.eliminate
#print axioms OriginTaggedRCommonDeletionEliminator.eliminate
#print axioms OriginTaggedCoordinatorEliminator.eliminate

end ATailROriginTaggedCoordinatorScratch
end Problem97
