/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredSupportHeavyCoupling
import F2GeneratedEscapePlacement

/-!
# Scratch: anchored sink for the both-q-critical generated metric residual

The exact generated-row classifier leaves two cross-survival arms and one
`MetricResidual`.  In the both-q-critical branch, both completed selected
four-rows contain the actual deleted source.  The anchored F2 packet places
that source in strict `oppCap1`, so it separates the two strict-`oppCap2`
centers by distance.

Every arm of `MetricResidual`, however, says that the two completed rows have
the same radius.  Common membership of the deleted source would therefore
make it equidistant from the two centers, contradicting the anchored
cap-order separation.  Thus the both-q-critical branch reduces all the way to
one of the two cross-survival outputs.

No support omission is converted into a radius inequality: the only radius
equalities used below come from actual selected-support membership.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedMetricSinkScratch

open ATailContinuationGeometryClassifier
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2AnchoredSupportHeavyCouplingScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Forget the both-q-critical case wrapper while retaining both exact
q-critical supports. -/
def exactGeneratedPairOfBothQCritical
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (Q : BothQCriticalCase N) :
    ExactGeneratedPair N where
  at_s := .qCritical Q.at_s
  at_t := .qCritical Q.at_t

namespace BothQCriticalCase

/-- The completed row at the first named center contains the actual deleted
source, by construction of a q-critical selected four-class. -/
theorem deleted_mem_firstFullRow
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (Q : BothQCriticalCase N) :
    deleted ∈
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₁.support := by
  change deleted ∈ (insert deleted Q.at_s.support : Finset ℝ²)
  exact Finset.mem_insert_self deleted Q.at_s.support

/-- The completed row at the second named center also contains the actual
deleted source. -/
theorem deleted_mem_secondFullRow
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (Q : BothQCriticalCase N) :
    deleted ∈
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₂.support := by
  change deleted ∈ (insert deleted Q.at_t.support : Finset ℝ²)
  exact Finset.mem_insert_self deleted Q.at_t.support

end BothQCriticalCase

namespace ExactGeneratedPair

/-- Both arms of `MetricResidual` make the two continuation-row radii equal. -/
theorem rowRadii_eq_of_metricResidual
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (G : ExactGeneratedPair N)
    (hmetric : (G.toTwoContinuationRows).MetricResidual) :
    (G.toTwoContinuationRows).row₁.radius =
      (G.toTwoContinuationRows).row₂.radius := by
  rcases hmetric with
    ⟨_hdiff, _hz₂row₁, _hz₁row₂, hradius₁, hradius₂,
      _hapex₁, _hapex₂⟩ |
    ⟨_heq, _hz₂row₁, _hz₁row₂, _hapex₁, _hapex₂,
      hradius₁, hradius₂⟩
  · exact hradius₁.trans hradius₂.symm
  · exact hradius₁.trans hradius₂.symm

end ExactGeneratedPair

/-- Under the anchored provenance-bearing F2 hypotheses, the both-q-critical
generated pair cannot enter either arm of `MetricResidual`.

The actual deleted source belongs to both completed rows.  Equal row radii
would therefore make it equidistant from the two named strict-`oppCap2`
centers, contradicting the anchored cap-order separation theorem. -/
theorem false_of_bothQCritical_metricResidual
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : BothQCriticalCase K.named)
    (hmetric :
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).MetricResidual) :
    False := by
  let G := exactGeneratedPairOfBothQCritical Q
  have hX₁ : X.point ∈ (G.toTwoContinuationRows).row₁.support := by
    simpa [G] using
      (Problem97.ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_firstFullRow
        Q)
  have hX₂ : X.point ∈ (G.toTwoContinuationRows).row₂.support := by
    simpa [G] using
      (Problem97.ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_secondFullRow
        Q)
  have hradii :
      (G.toTwoContinuationRows).row₁.radius =
        (G.toTwoContinuationRows).row₂.radius :=
    Problem97.ATailRF2GeneratedMetricSinkScratch.ExactGeneratedPair.rowRadii_eq_of_metricResidual
      G (by simpa [G] using hmetric)
  have hcenters :
      dist K.named.s X.point = dist K.named.t X.point := by
    calc
      dist K.named.s X.point =
          (G.toTwoContinuationRows).row₁.radius :=
        (G.toTwoContinuationRows).row₁.support_eq_radius X.point hX₁
      _ = (G.toTwoContinuationRows).row₂.radius := hradii
      _ = dist K.named.t X.point :=
        ((G.toTwoContinuationRows).row₂.support_eq_radius X.point hX₂).symm
  apply K.deletedSource_separates_supportPair
  calc
    dist X.point K.named.s = dist K.named.s X.point := dist_comm _ _
    _ = dist K.named.t X.point := hcenters
    _ = dist X.point K.named.t := dist_comm _ _

/-- Consequently, the existing generated-row classifier reduces the
both-q-critical arm to one of the two cross-survival outputs. -/
theorem cross_survival_of_bothQCritical
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : BothQCriticalCase K.named) :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.t) K.named.s ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.s) K.named.t := by
  let G := exactGeneratedPairOfBothQCritical Q
  rcases G.cross_survival_or_metricResidual with
    hsurvive₁ | hsurvive₂ | hmetric
  · exact Or.inl hsurvive₁
  · exact Or.inr hsurvive₂
  · exact False.elim
      (false_of_bothQCritical_metricResidual K Q
        (by simpa [G] using hmetric))

/-- Exact remaining interface: the surviving cross-deletion arm carries the
existing q-deleted four-row package.  This packet is a continuation output,
not a contradiction. -/
theorem crossSurvivalOutput_of_bothQCritical
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : BothQCriticalCase K.named) :
    CrossSurvivalOutput
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows) := by
  rcases cross_survival_of_bothQCritical K Q with
    hsurvive₁ | hsurvive₂
  · exact Or.inl
      ⟨hsurvive₁,
        nonempty_qDeletedFourRow_of_survival
          (D := rebasePacket D S) hsurvive₁⟩
  · exact Or.inr
      ⟨hsurvive₂,
        nonempty_qDeletedFourRow_of_survival
          (D := rebasePacket D S) hsurvive₂⟩

#print axioms BothQCriticalCase.deleted_mem_firstFullRow
#print axioms BothQCriticalCase.deleted_mem_secondFullRow
#print axioms ExactGeneratedPair.rowRadii_eq_of_metricResidual
#print axioms false_of_bothQCritical_metricResidual
#print axioms cross_survival_of_bothQCritical
#print axioms crossSurvivalOutput_of_bothQCritical

end ATailRF2GeneratedMetricSinkScratch
end Problem97
