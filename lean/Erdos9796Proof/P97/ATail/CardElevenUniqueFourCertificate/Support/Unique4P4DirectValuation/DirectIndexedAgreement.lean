/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.RightCapDirectValuation

/-!
# Direct compact valuation agreement for the indexed P4 source

The compact atom table is total on the five indexed atom families used by the
generic, critical-support, strict-unit, Kalmanson, and CEGAR occurrence
bridges.  This file authenticates those bindings and packages their source
meaning as the common `ValAgreement` needed by the full-ledger coordinator.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4CompactAtomBindingScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Boolean authentication that a compact variable has exactly the supplied
typed source parameters. -/
def parameterBindingBool (dense : Nat) (parameters : AtomParameters) : Bool :=
  match bindingAt dense with
  | some binding => decide (binding.parameters = parameters)
  | none => false

def ParameterBinding (dense : Nat) (parameters : AtomParameters) : Prop :=
  parameterBindingBool dense parameters = true

/-- Any exactly authenticated parameter binding evaluates by the direct
source adapter. -/
theorem directVal_of_parameterBinding
    (Q : DirectSource R profile distribution) {dense : Nat} {parameters : AtomParameters}
    (h : ParameterBinding dense parameters) :
    directVal Q dense ↔ parameters.interpret directAdapter Q := by
  unfold ParameterBinding parameterBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      have hparameters : binding.parameters = parameters := of_decide_eq_true h
      simp [directVal, hlookup, hparameters]

@[simp] theorem asLabel_val (point : Label) : asLabel point.val = point := by
  apply Fin.ext
  simp [asLabel]

theorem radiusVariable_parameterBinding
    (center left right : Label) (hleftRight : left < right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    ParameterBinding (radiusVariable center left right)
      (.radiusEquality center.val left.val right.val) := by
  change parameterBindingBool (radiusVariable center left right)
    (.radiusEquality center.val left.val right.val) = true
  fin_cases center
  all_goals fin_cases left
  all_goals fin_cases right
  all_goals first
    | exact (hleftCenter rfl).elim
    | exact (hrightCenter rfl).elim
    | exact (not_lt_of_ge (by decide) hleftRight).elim
    | native_decide

theorem classVariable_parameterBinding (point : Label) :
    ParameterBinding (classVariable point) (.firstApexClass point.val) := by
  change parameterBindingBool (classVariable point) (.firstApexClass point.val) = true
  fin_cases point <;> native_decide

theorem blockerVariable_parameterBinding (source center : Label)
    (hsmall : blockerVariable source center < 10000) :
    ParameterBinding (blockerVariable source center)
      (.blockerChoice source.val center.val) := by
  change parameterBindingBool (blockerVariable source center)
    (.blockerChoice source.val center.val) = true
  fin_cases source <;> fin_cases center
  all_goals first
    | exact (not_lt_of_ge (by decide) hsmall).elim
    | native_decide

theorem supportVariable_parameterBinding (source point : Label)
    (hsmall : supportVariable source point < 10000) :
    ParameterBinding (supportVariable source point)
      (.criticalSupport source.val point.val) := by
  change parameterBindingBool (supportVariable source point)
    (.criticalSupport source.val point.val) = true
  fin_cases source <;> fin_cases point
  all_goals first
    | exact (not_lt_of_ge (by decide) hsmall).elim
    | native_decide

/-- The critical-support bridge uses synthetic variables above the compact
range for source atoms absent from this particular compact formula.  Extend
the compact valuation on exactly those two disjoint synthetic ranges. -/
def directTotalVal (Q : DirectSource R profile distribution) (dense : Nat) : Prop :=
  if dense < 10000 then
    directVal Q dense
  else if dense < 20000 then
    blockerVal Q.packet.core directIndex
      (asLabel ((dense - 10000) / 11)) (asLabel ((dense - 10000) % 11))
  else
    criticalSupportVal Q.packet.core directIndex
      (asLabel ((dense - 20000) / 11)) (asLabel ((dense - 20000) % 11))

theorem directTotalVal_of_lt
    (Q : DirectSource R profile distribution) {dense : Nat} (hsmall : dense < 10000) :
    directTotalVal Q dense ↔ directVal Q dense := by
  simp [directTotalVal, hsmall]

theorem rowVariable_lt_10000 (center point : Label) :
    rowVariable center point < 10000 := by
  fin_cases center <;> fin_cases point <;> native_decide

theorem radiusVariable_lt_10000 (center left right : Label) :
    radiusVariable center left right < 10000 := by
  fin_cases center <;> fin_cases left <;> fin_cases right <;> native_decide

theorem classVariable_lt_10000 (point : Label) :
    classVariable point < 10000 := by
  fin_cases point <;> native_decide

theorem directVal_radiusVariable_iff_radiusEq
    (Q : DirectSource R profile distribution)
    (center left right : Label) (hleftRight : left < right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    directVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right := by
  rw [directVal_of_parameterBinding Q
    (radiusVariable_parameterBinding center left right hleftRight hleftCenter hrightCenter)]
  simp [AtomParameters.interpret, directAdapter, directIndex]

theorem directVal_classVariable_iff_classHit
    (Q : DirectSource R profile distribution) (point : Label) :
    directVal Q (classVariable point) ↔
      classHit Q.packet.core directIndex point := by
  rw [directVal_of_parameterBinding Q (classVariable_parameterBinding point)]
  simp [AtomParameters.interpret, directAdapter, directIndex]

theorem directVal_blockerVariable_iff_blockerVal
    (Q : DirectSource R profile distribution) (source center : Label)
    (hsmall : blockerVariable source center < 10000) :
    directVal Q (blockerVariable source center) ↔
      blockerVal Q.packet.core directIndex source center := by
  rw [directVal_of_parameterBinding Q
    (blockerVariable_parameterBinding source center hsmall)]
  simp [AtomParameters.interpret, directAdapter, directIndex]

theorem directVal_supportVariable_iff_criticalSupportVal
    (Q : DirectSource R profile distribution) (source point : Label)
    (hsmall : supportVariable source point < 10000) :
    directVal Q (supportVariable source point) ↔
      criticalSupportVal Q.packet.core directIndex source point := by
  rw [directVal_of_parameterBinding Q
    (supportVariable_parameterBinding source point hsmall)]
  simp [AtomParameters.interpret, directAdapter, directIndex]

/-- The totalized valuation has the direct row meaning on every row variable. -/
theorem directTotalVal_rowVariable_iff_rowMem
    (Q : DirectSource R profile distribution)
    (center point : Label) (hcenter : center ≠ point) :
    directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point := by
  rw [directTotalVal_of_lt Q (rowVariable_lt_10000 center point)]
  exact directVal_rowVariable_iff_rowMem Q center point hcenter

/-- The totalized valuation has the direct radius meaning on every radius variable. -/
theorem directTotalVal_radiusVariable_iff_radiusEq
    (Q : DirectSource R profile distribution)
    (center left right : Label) (hleftRight : left < right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    directTotalVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right := by
  rw [directTotalVal_of_lt Q (radiusVariable_lt_10000 center left right)]
  exact directVal_radiusVariable_iff_radiusEq Q center left right
    hleftRight hleftCenter hrightCenter

/-- The totalized valuation has the direct class meaning on every class variable. -/
theorem directTotalVal_classVariable_iff_classHit
    (Q : DirectSource R profile distribution) (point : Label) :
    directTotalVal Q (classVariable point) ↔
      classHit Q.packet.core directIndex point := by
  rw [directTotalVal_of_lt Q (classVariable_lt_10000 point)]
  exact directVal_classVariable_iff_classHit Q point

/-- The totalized valuation supplies both compact and synthetic blocker atoms. -/
theorem directTotalVal_blockerVariable_iff_blockerVal
    (Q : DirectSource R profile distribution) (source center : Label) :
    directTotalVal Q (blockerVariable source center) ↔
      blockerVal Q.packet.core directIndex source center := by
  by_cases hsmall : blockerVariable source center < 10000
  · rw [directTotalVal_of_lt Q hsmall,
      directVal_blockerVariable_iff_blockerVal Q source center hsmall]
  · fin_cases source <;> fin_cases center <;>
      simp [blockerVariable, directTotalVal, asLabel] at hsmall ⊢

/-- The totalized valuation supplies both compact and synthetic support atoms. -/
theorem directTotalVal_supportVariable_iff_criticalSupportVal
    (Q : DirectSource R profile distribution) (source point : Label) :
    directTotalVal Q (supportVariable source point) ↔
      criticalSupportVal Q.packet.core directIndex source point := by
  by_cases hsmall : supportVariable source point < 10000
  · rw [directTotalVal_of_lt Q hsmall,
      directVal_supportVariable_iff_criticalSupportVal Q source point hsmall]
  · fin_cases source <;> fin_cases point <;>
      simp [supportVariable, directTotalVal, asLabel] at hsmall ⊢

/-- One valuation agrees with every indexed atom used by the generated
critical-support interface while remaining unchanged on compact indices. -/
def directValAgreement (Q : DirectSource R profile distribution) :
    ValAgreement Q.packet.core directIndex (directTotalVal Q) where
  row := directTotalVal_rowVariable_iff_rowMem Q
  radius := directTotalVal_radiusVariable_iff_radiusEq Q
  firstApexClass := directTotalVal_classVariable_iff_classHit Q
  blocker := directTotalVal_blockerVariable_iff_blockerVal Q
  support := directTotalVal_supportVariable_iff_criticalSupportVal Q

end Problem97.P4DirectOuterValuationScratch
