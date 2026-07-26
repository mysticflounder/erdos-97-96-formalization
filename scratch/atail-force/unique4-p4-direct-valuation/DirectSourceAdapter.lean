/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectOuterBindingIntegrity
import Core

/-!
# Direct source adapter for compact P4 atoms

This supplies the seven source meanings requested by the compact atom table
for a direct P4 source packet.  It is only a valuation definition; no theorem
here says that every compact clause, or even every P4 family, is satisfied.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4CompactAtomBindingScratch
open P4DirectOuterArcAdapterScratch
open P5IndexedSourceScratch
open P4CriticalSupportOccurrenceBridgeScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

abbrev Label := P4DirectOuterArcAdapterScratch.Label

def asLabel (n : Nat) : Label :=
  ⟨n % 11, Nat.mod_lt _ (by omega)⟩

def fourPointFinset (point0 point1 point2 point3 : Nat) : Finset Label :=
  {asLabel point0, asLabel point1, asLabel point2, asLabel point3}

/-- Decode the encoder's 11-bit turn-mask representation. -/
def bitMaskFinset (mask : Nat) : Finset Label :=
  Finset.univ.filter fun i : Label => mask.testBit i.val

def toSourceSide : P4CompactAtomBindingScratch.OuterSide →
    ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.OuterSide
  | .left => .left
  | .right => .right

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Faithful direct-branch interpretation of all compact P4 atom families. -/
def directAdapter :
    DirectSourceAdapter (DirectSource R profile distribution) where
  membership Q center point :=
    membershipVal Q.curvature ⟨asLabel center, asLabel point⟩
  radiusEquality Q center left right :=
    radiusEq Q.packet.core directIndex (asLabel center) (asLabel left) (asLabel right)
  firstApexClass Q point :=
    classHit Q.packet.core directIndex (asLabel point)
  blockerChoice Q source center :=
    blockerVal Q.packet.core directIndex (asLabel source) (asLabel center)
  criticalSupport Q source point :=
    criticalSupportVal Q.packet.core directIndex (asLabel source) (asLabel point)
  rowSupport Q center point0 point1 point2 point3 :=
    rowSupportVal Q.curvature
      ⟨asLabel center, fourPointFinset point0 point1 point2 point3⟩
  outerArc Q center side mask :=
    outerArcVal Q.curvature ⟨asLabel center, toSourceSide side, bitMaskFinset mask⟩

/-- The compact value induced by the direct source meaning of a named atom.
Variables absent from the authenticated compact binding table are false. -/
def directVal (Q : DirectSource R profile distribution) (dense : Nat) : Prop :=
  match bindingAt dense with
  | some binding => binding.parameters.interpret directAdapter Q
  | none => False

end Problem97.P4DirectOuterValuationScratch
