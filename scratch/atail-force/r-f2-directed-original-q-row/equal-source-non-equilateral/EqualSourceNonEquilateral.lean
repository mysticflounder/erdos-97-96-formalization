/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import StrictOppCap1HitProducer
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Scratch: exact bank sink for the equal-source non-equilateral residual

The singleton-intersection correction fixes the common point in the natural
five-point role map to the live center `p`.  This file records two consequences
without duplicating that correction:

* the local `U1TwoLargeCapHypotheses` packet is already terminal through the
  import-reachable U5 metric kernel; and
* for the fixed live-center role map, the full packet is equivalent to exactly
  the three reverse equalities not supplied by the two native rows.

No claim is made that the retained parent fields produce those equalities.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2EqualSourceNonEquilateralScratch

open ATailContinuationBankMatchScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralGeometryConsumerScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2StrictOppCap1HitProducerScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The sibling five-point packet is already contradictory through a current,
import-reachable production metric kernel. -/
theorem false_of_u1TwoLargeCapHypotheses_currentKernel
    {a c d e f : ℝ²}
    (H : U1TwoLargeCapHypotheses a c d e f) : False := by
  have hr : 0 < dist c d := by
    rw [← H.c_a_eq_c_d]
    exact dist_pos.mpr H.a_ne_c.symm
  have hfd : dist f d = dist c d := by
    calc
      dist f d = dist d f := dist_comm _ _
      _ = dist d c := H.d_c_eq_d_f.symm
      _ = dist c d := dist_comm _ _
  have hfa : dist f a = dist c d := H.f_a_eq_f_d.trans hfd
  exact u5_equilateral_opposite_point_metric_incompatibility
    (p := c) (a := f) (b := d) (c := a) (x := e)
    hr
    (H.c_a_eq_c_f.symm.trans H.c_a_eq_c_d)
    rfl
    H.c_a_eq_c_d
    hfd
    hfa
    (H.f_a_eq_f_e.symm.trans hfa)
    (by
      calc
        dist d e = dist d c := H.d_c_eq_d_e.symm
        _ = dist c d := dist_comm _ _)
    H.e_a_eq_e_c.symm

/-- The three fields left after fixing the common bank point to the live
center.  The parameter order follows the natural role map
`(a,c,d,e,f) = (x,z₁,z₂,y,p)`. -/
structure LiveCenterReverseEqualities
    (p x z₁ z₂ y : ℝ²) : Prop where
  p_x_eq_p_z₂ : dist p x = dist p z₂
  p_x_eq_p_y : dist p x = dist p y
  y_x_eq_y_z₁ : dist y x = dist y z₁

/-- On the fixed strict-witness role map, the three reverse equalities are
exactly equivalent to the complete sibling-bank hypothesis packet. -/
theorem liveCenterReverseEqualities_iff_u1TwoLargeCapHypotheses
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    {N : NonEquilateralOutput W.H Q.generated.toTwoContinuationRows}
    (hsource : Q.at_x.source = Q.at_y.source)
    (hsourceLive : Q.at_x.source = p)
    (V : StrictWitnessMetricHinge N) :
    LiveCenterReverseEqualities p V.x
        Q.generated.toTwoContinuationRows.z₁
        Q.generated.toTwoContinuationRows.z₂ V.y ↔
      U1TwoLargeCapHypotheses V.x
        Q.generated.toTwoContinuationRows.z₁
        Q.generated.toTwoContinuationRows.z₂ V.y p := by
  constructor
  · intro E
    exact u1TwoLargeCapHypotheses_of_equalSource_strictWitness_reverseEqualities
      Q hsource hsourceLive V E.p_x_eq_p_z₂ E.p_x_eq_p_y E.y_x_eq_y_z₁
  · intro H
    exact {
      p_x_eq_p_z₂ := H.f_a_eq_f_d
      p_x_eq_p_y := H.f_a_eq_f_e
      y_x_eq_y_z₁ := H.e_a_eq_e_c }

/-- Immediate current-repository sink for the corrected strict-witness
interface.  This uses the same three fields as the sibling role map, but no
unimported sibling declaration. -/
theorem false_of_equalSource_strictWitness_reverseEqualities
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    {N : NonEquilateralOutput W.H Q.generated.toTwoContinuationRows}
    (hsource : Q.at_x.source = Q.at_y.source)
    (hsourceLive : Q.at_x.source = p)
    (V : StrictWitnessMetricHinge N)
    (E : LiveCenterReverseEqualities p V.x
      Q.generated.toTwoContinuationRows.z₁
      Q.generated.toTwoContinuationRows.z₂ V.y) : False := by
  apply false_of_u1TwoLargeCapHypotheses_currentKernel
  exact (liveCenterReverseEqualities_iff_u1TwoLargeCapHypotheses
    Q hsource hsourceLive V).mp E

#print axioms false_of_u1TwoLargeCapHypotheses_currentKernel
#print axioms liveCenterReverseEqualities_iff_u1TwoLargeCapHypotheses
#print axioms false_of_equalSource_strictWitness_reverseEqualities

end ATailRF2EqualSourceNonEquilateralScratch
end Problem97
