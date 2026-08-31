/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

/- Source excerpt from base HEAD beb71db498ad47cca5c343a76a359423ff47f9e2.
   Historical span: live TwoSourceFreshThirdFiber.lean:819-882. -/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.FirstFiberOverlapDescent
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_cross_blocker_localization
import Erdos9796Proof.P97.Census554.CapSelectedGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
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
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 = {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²)
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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

/- Copied prerequisites immediately preceding the archived blocks. -/
abbrev FirstFiberCapSourceDescentResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ATailFirstFiberOverlapDescent.FirstFiberCycleAlignedResidual
      P Pρ Q source LPρ MPρ LP MP ∨
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex

/- Copied live prerequisite; this declaration was not removed. -/
omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe in
/-- Every complete cap-source witness enters the exact five-arm first-fiber
descent.  All hypotheses used here are fields of the live source packet or
the ambient localized-deletion cycles. -/
theorem firstFiber_capSourceDescentResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source) :
    FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q source := by
  rcases hsource with
    ⟨_hcap, _hinterior, _houtside, hcenterNeP, _hcenterNePρ,
      _hcenterNeApex1, _hcenterNeApex2, _hself, _hcard,
      hviewP, hviewPρ⟩
  exact
    ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion
      P Pρ Q source hcenterNeP hviewP.omits hviewPρ.omits
      LPρ hLPρ MPρ LP hLP MP
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)

abbrev TwoCapSourcesFirstFiberDescentResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) : Prop :=
  FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q C.firstSource ∧
    FirstFiberCapSourceDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ Q C.secondSource

/-- The remaining live first-fiber consumer after extracting both exact
five-arm descents.  Unlike the former broad leaf, this statement is ready for
finite obstruction mining without assuming a cardinality bound. -/
theorem false_of_twoCapSources_firstFiberDescentResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hdescent : TwoCapSourcesFirstFiberDescentResidual
      (LPρ := LPρ) (MPρ := MPρ) (LP := LP) (MP := MP)
      P Pρ C Q) :
    False := by
  sorry

/-- Load-bearing first enlarged-fiber residual for the two-source packet.  It
includes the one-sided-deletion branch that must no longer recurse through the
global cap-source root. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  apply false_of_twoCapSources_firstFiberDescentResidual
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
  exact ⟨
    firstFiber_capSourceDescentResidual
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q C.firstSource C.firstSource_data,
    firstFiber_capSourceDescentResidual
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q C.secondSource C.secondSource_data⟩

/-- Swap-compatible second enlarged-fiber residual for the two-source packet. -/
theorem false_of_twoCapSources_freshOutsideSecondBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hsecond : Nonempty (FreshOutsideSecondBlockerFiber P Pρ)) :
    False := by
  let Bswap : FrontierBiApexRobustResidual Rρ :=
    ⟨B.secondApex_robust⟩
  let Lswap : FrontierLargeOppositeCapsBiApexRobustResidual Bswap :=
    ⟨L.firstOppCap_card_ge_six, L.secondOppCap_card_ge_six⟩
  let Nswap : FrontierAllLargeCapsBiApexRobustResidual Lswap :=
    ⟨N.surplusCap_card_ge_six⟩
  let Tswap : FrontierAllLargeCapsTriApexRobustResidual Nswap :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  exact false_of_twoCapSources_freshOutsideFirstBlockerFiber
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (twoCapSourceThirdCanonicalRowSurface_swap P Pρ C)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
