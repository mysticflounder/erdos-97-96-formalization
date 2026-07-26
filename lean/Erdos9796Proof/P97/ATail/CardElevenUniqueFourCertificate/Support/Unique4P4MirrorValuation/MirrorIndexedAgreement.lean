import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.DirectIndexedAgreement
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4MirrorOuterArcTransport

/-!
# One source-faithful valuation for the reflected compact P4 ledger

The compact atom binding table is orientation-neutral.  This module interprets
its seven atom families through a `P4MirrorBoundaryPacket`, using
`mirrorIndex` for the indexed families and the authenticated reflected
curvature semantics for row-support and outer-arc atoms.

As on the direct side, blocker and critical-support atoms absent from the
compact table are supplied on two disjoint synthetic ranges.
-/

namespace Problem97.P4MirrorValuationScratch

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

abbrev asLabel := P4DirectOuterValuationScratch.asLabel
abbrev fourPointFinset := P4DirectOuterValuationScratch.fourPointFinset
abbrev bitMaskFinset := P4DirectOuterValuationScratch.bitMaskFinset
abbrev toSourceSide := P4DirectOuterValuationScratch.toSourceSide

/-- Faithful mirror interpretation of all seven compact P4 atom families. -/
def mirrorAdapter :
    DirectSourceAdapter (P4MirrorBoundaryPacket R profile distribution) where
  membership P center point :=
    rowMem P.core mirrorIndex (asLabel center) (asLabel point)
  radiusEquality P center left right :=
    radiusEq P.core mirrorIndex
      (asLabel center) (asLabel left) (asLabel right)
  firstApexClass P point :=
    classHit P.core mirrorIndex (asLabel point)
  blockerChoice P source center :=
    blockerVal P.core mirrorIndex (asLabel source) (asLabel center)
  criticalSupport P source point :=
    criticalSupportVal P.core mirrorIndex (asLabel source) (asLabel point)
  rowSupport P center point0 point1 point2 point3 :=
    mirrorRowSupportVal P.core
      ⟨asLabel center, fourPointFinset point0 point1 point2 point3⟩
  outerArc P center side mask :=
    mirrorOuterArcVal P.core
      ⟨asLabel center, toSourceSide side, bitMaskFinset mask⟩

/-- Compact mirror value induced by the authenticated atom binding table. -/
def mirrorCompactVal
    (P : P4MirrorBoundaryPacket R profile distribution) (dense : Nat) : Prop :=
  match bindingAt dense with
  | some binding => binding.parameters.interpret mirrorAdapter P
  | none => False

theorem mirrorCompactVal_of_parameterBinding
    (P : P4MirrorBoundaryPacket R profile distribution)
    {dense : Nat} {parameters : AtomParameters}
    (h : P4DirectOuterValuationScratch.ParameterBinding dense parameters) :
    mirrorCompactVal P dense ↔ parameters.interpret mirrorAdapter P := by
  unfold P4DirectOuterValuationScratch.ParameterBinding
    P4DirectOuterValuationScratch.parameterBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      have hparameters : binding.parameters = parameters := of_decide_eq_true h
      simp [mirrorCompactVal, hlookup, hparameters]

theorem rowVariable_parameterBinding
    (center point : Label) (hcenter : center ≠ point) :
    P4DirectOuterValuationScratch.ParameterBinding
      (rowVariable center point) (.membership center.val point.val) := by
  change P4DirectOuterValuationScratch.parameterBindingBool
    (rowVariable center point) (.membership center.val point.val) = true
  fin_cases center
  all_goals fin_cases point
  all_goals first | exact (hcenter rfl).elim | native_decide

/-- Extend the compact mirror valuation on the two synthetic indexed ranges. -/
def mirrorTotalVal
    (P : P4MirrorBoundaryPacket R profile distribution) (dense : Nat) : Prop :=
  if dense < 10000 then
    mirrorCompactVal P dense
  else if dense < 20000 then
    blockerVal P.core mirrorIndex
      (asLabel ((dense - 10000) / 11)) (asLabel ((dense - 10000) % 11))
  else
    criticalSupportVal P.core mirrorIndex
      (asLabel ((dense - 20000) / 11)) (asLabel ((dense - 20000) % 11))

theorem mirrorTotalVal_of_lt
    (P : P4MirrorBoundaryPacket R profile distribution)
    {dense : Nat} (hsmall : dense < 10000) :
    mirrorTotalVal P dense ↔ mirrorCompactVal P dense := by
  simp [mirrorTotalVal, hsmall]

theorem mirrorTotalVal_rowVariable_iff_rowMem
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center point : Label) (hcenter : center ≠ point) :
    mirrorTotalVal P (rowVariable center point) ↔
      rowMem P.core mirrorIndex center point := by
  rw [mirrorTotalVal_of_lt P
    (P4DirectOuterValuationScratch.rowVariable_lt_10000 center point)]
  rw [mirrorCompactVal_of_parameterBinding P
    (rowVariable_parameterBinding center point hcenter)]
  simp [AtomParameters.interpret, mirrorAdapter,
    P4DirectOuterValuationScratch.asLabel_val]

theorem mirrorTotalVal_radiusVariable_iff_radiusEq
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center left right : Label) (hleftRight : left < right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    mirrorTotalVal P (radiusVariable center left right) ↔
      radiusEq P.core mirrorIndex center left right := by
  rw [mirrorTotalVal_of_lt P
    (P4DirectOuterValuationScratch.radiusVariable_lt_10000 center left right)]
  rw [mirrorCompactVal_of_parameterBinding P
    (P4DirectOuterValuationScratch.radiusVariable_parameterBinding
      center left right hleftRight hleftCenter hrightCenter)]
  simp [AtomParameters.interpret, mirrorAdapter,
    P4DirectOuterValuationScratch.asLabel_val]

theorem mirrorTotalVal_classVariable_iff_classHit
    (P : P4MirrorBoundaryPacket R profile distribution) (point : Label) :
    mirrorTotalVal P (classVariable point) ↔
      classHit P.core mirrorIndex point := by
  rw [mirrorTotalVal_of_lt P
    (P4DirectOuterValuationScratch.classVariable_lt_10000 point)]
  rw [mirrorCompactVal_of_parameterBinding P
    (P4DirectOuterValuationScratch.classVariable_parameterBinding point)]
  simp [AtomParameters.interpret, mirrorAdapter,
    P4DirectOuterValuationScratch.asLabel_val]

theorem mirrorTotalVal_blockerVariable_iff_blockerVal
    (P : P4MirrorBoundaryPacket R profile distribution)
    (source center : Label) :
    mirrorTotalVal P (blockerVariable source center) ↔
      blockerVal P.core mirrorIndex source center := by
  by_cases hsmall : blockerVariable source center < 10000
  · rw [mirrorTotalVal_of_lt P hsmall,
      mirrorCompactVal_of_parameterBinding P
        (P4DirectOuterValuationScratch.blockerVariable_parameterBinding
          source center hsmall)]
    simp [AtomParameters.interpret, mirrorAdapter,
      P4DirectOuterValuationScratch.asLabel_val]
  · fin_cases source <;> fin_cases center <;>
      simp [blockerVariable, mirrorTotalVal,
        P4DirectOuterValuationScratch.asLabel] at hsmall ⊢

theorem mirrorTotalVal_supportVariable_iff_criticalSupportVal
    (P : P4MirrorBoundaryPacket R profile distribution)
    (source point : Label) :
    mirrorTotalVal P (supportVariable source point) ↔
      criticalSupportVal P.core mirrorIndex source point := by
  by_cases hsmall : supportVariable source point < 10000
  · rw [mirrorTotalVal_of_lt P hsmall,
      mirrorCompactVal_of_parameterBinding P
        (P4DirectOuterValuationScratch.supportVariable_parameterBinding
          source point hsmall)]
    simp [AtomParameters.interpret, mirrorAdapter,
      P4DirectOuterValuationScratch.asLabel_val]
  · fin_cases source <;> fin_cases point <;>
      simp [supportVariable, mirrorTotalVal,
        P4DirectOuterValuationScratch.asLabel] at hsmall ⊢

/-- The common indexed agreement consumed by all orientation-generic P4
occurrence bridges. -/
def mirrorValAgreement
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ValAgreement P.core mirrorIndex (mirrorTotalVal P) where
  row := mirrorTotalVal_rowVariable_iff_rowMem P
  radius := mirrorTotalVal_radiusVariable_iff_radiusEq P
  firstApexClass := mirrorTotalVal_classVariable_iff_classHit P
  blocker := mirrorTotalVal_blockerVariable_iff_blockerVal P
  support := mirrorTotalVal_supportVariable_iff_criticalSupportVal P

end Problem97.P4MirrorValuationScratch
