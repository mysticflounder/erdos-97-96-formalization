/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2BoundaryAbsorption
import F2GeneratedMetricSink
import CrossSurvivalEliminator

/-!
# Scratch: exact sink surface for the F2 cross-survival residual

The both-q-critical generated branch has two exact strict-`oppCap2` rows,
both containing the actual deleted source.  Boundary absorption supplies a
constructor-uniform genuine generated escape at each center.  Ordered-cap
geometry forces those two escapes to diverge: neither escape can occur in the
other generated row.

The remaining `CrossSurvivalOutput`, however, extracts an arbitrary exact
q-deleted row from the surviving deletion.  Its support is not definitionally
the generated support at the same center.  This file retains both supports and
proves the exact terminal interface:

* in either orientation, the survivor closes if it contains the actual
  deleted source and the genuine escape from the other generated row;
* without those two memberships, the survivor can only be reclassified at
  the actual source as either q-critical or q-deleted.

No support omission is promoted to a metric inequality, and no generated
escape is silently transferred into the independently extracted survivor.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2CrossSurvivalSinkScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralParentProducerScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2AnchoredSupportHeavyCouplingScratch
open ATailRF2BoundaryAbsorptionScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedEscapePlacementScratch.ExactGeneratedAt
open ATailRF2GeneratedMetricSinkScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- A named constructor-uniform genuine escape, retaining its actual
generated support and its cap role. -/
structure GeneratedGenuineEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : ExactGeneratedAt D deleted center) : Type where
  point : ℝ²
  point_mem_generatedSupport : point ∈ G.support
  point_not_mem_dangerousTriple :
    point ∉ (deletedCriticalSupport C).erase deleted
  point_not_mem_oppCap2 : point ∉ S.oppCap2
  point_mem_surplus_or_strictOppCap1 :
    point ∈ S.surplusCap ∨ point ∈ strictOppCap1Region S

/-- Name the constructor-uniform escape supplied by boundary absorption. -/
theorem nonempty_generatedGenuineEscape
    {D : CounterexampleData} {p q t1 t2 t3 deleted center : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (hcenterT : center ∈ (deletedCriticalSupport C).erase deleted)
    (hcenterStrict : center ∈ strictSecondCap S)
    (G : ExactGeneratedAt D deleted center) :
    Nonempty (GeneratedGenuineEscape (C := C) G) := by
  rcases
      ATailRF2BoundaryAbsorptionScratch.ExactGeneratedAt.exists_genuineEscape
        N hcenterT hcenterStrict G with
    ⟨y, hySupport, hyDangerous, hyCap, hyRole⟩
  exact ⟨{
    point := y
    point_mem_generatedSupport := hySupport
    point_not_mem_dangerousTriple := hyDangerous
    point_not_mem_oppCap2 := hyCap
    point_mem_surplus_or_strictOppCap1 := hyRole
  }⟩

namespace BothQCriticalCase

variable
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

/-- A genuine generated escape at the first center cannot occur in the
completed generated row at the second center.  Otherwise that row and the
first generated row would share the actual deleted source and this escape,
two distinct points outside `oppCap2`. -/
theorem firstEscape_not_mem_secondFullRow
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : BothQCriticalCase K.named)
    (E : GeneratedGenuineEscape
      (C := alignedSharedRowPacket X hcenter)
      (exactGeneratedPairOfBothQCritical Q).at_s) :
    E.point ∉
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₂.support := by
  intro hE₂
  let G := exactGeneratedPairOfBothQCritical Q
  have hE₁ : E.point ∈ (G.toTwoContinuationRows).row₁.support := by
    exact G.at_s.support_subset_fullSelectedFourClass
      (alignedSharedRowPacket X hcenter).q_mem_A
      (Finset.mem_erase.mp K.named.s_mem_dangerousTriple).1
      E.point_mem_generatedSupport
  have hX₁ : X.point ∈ (G.toTwoContinuationRows).row₁.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_firstFullRow Q
  have hX₂ : X.point ∈ (G.toTwoContinuationRows).row₂.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_secondFullRow Q
  have hXE : X.point ≠ E.point := by
    intro h
    apply G.at_s.support_not_mem_deleted
    simpa [h] using E.point_mem_generatedSupport
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    (G.toTwoContinuationRows).row₁
    (G.toTwoContinuationRows).row₂
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.s_mem_supportStrict).2)
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.t_mem_supportStrict).2)
    K.named.s_ne_t
    hX₁ hE₁ hX₂ (by simpa [G] using hE₂)
    (by simpa [rebasePacket] using K.deletedSource_not_mem_oppCap2)
    (by simpa [rebasePacket] using E.point_not_mem_oppCap2)
    hXE

/-- Symmetric divergence of the genuine escape at the second center. -/
theorem secondEscape_not_mem_firstFullRow
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : BothQCriticalCase K.named)
    (E : GeneratedGenuineEscape
      (C := alignedSharedRowPacket X hcenter)
      (exactGeneratedPairOfBothQCritical Q).at_t) :
    E.point ∉
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₁.support := by
  intro hE₁
  let G := exactGeneratedPairOfBothQCritical Q
  have hE₂ : E.point ∈ (G.toTwoContinuationRows).row₂.support := by
    exact G.at_t.support_subset_fullSelectedFourClass
      (alignedSharedRowPacket X hcenter).q_mem_A
      (Finset.mem_erase.mp K.named.t_mem_dangerousTriple).1
      E.point_mem_generatedSupport
  have hX₁ : X.point ∈ (G.toTwoContinuationRows).row₁.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_firstFullRow Q
  have hX₂ : X.point ∈ (G.toTwoContinuationRows).row₂.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_secondFullRow Q
  have hXE : X.point ≠ E.point := by
    intro h
    apply G.at_t.support_not_mem_deleted
    simpa [h] using E.point_mem_generatedSupport
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    (G.toTwoContinuationRows).row₂
    (G.toTwoContinuationRows).row₁
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.t_mem_supportStrict).2)
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.s_mem_supportStrict).2)
    K.named.s_ne_t.symm
    hX₂ hE₂ hX₁ (by simpa [G] using hE₁)
    (by simpa [rebasePacket] using K.deletedSource_not_mem_oppCap2)
    (by simpa [rebasePacket] using E.point_not_mem_oppCap2)
    hXE

end BothQCriticalCase

/-- The two constructor-uniform genuine escapes in the both-q-critical arm,
together with their forced cross-row divergence. -/
structure BothQCriticalEscapePair
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
    (Q : BothQCriticalCase K.named) : Type where
  first : GeneratedGenuineEscape
    (C := alignedSharedRowPacket X hcenter)
    (exactGeneratedPairOfBothQCritical Q).at_s
  second : GeneratedGenuineEscape
    (C := alignedSharedRowPacket X hcenter)
    (exactGeneratedPairOfBothQCritical Q).at_t
  first_not_mem_secondFullRow :
    first.point ∉
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₂.support
  second_not_mem_firstFullRow :
    second.point ∉
      ((exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows).row₁.support
  first_ne_second : first.point ≠ second.point

/-- Boundary absorption and ordered-cap geometry produce the exact divergent
escape pair unconditionally. -/
theorem nonempty_bothQCriticalEscapePair
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
    Nonempty (BothQCriticalEscapePair K Q) := by
  let G := exactGeneratedPairOfBothQCritical Q
  rcases nonempty_generatedGenuineEscape
      K.named K.named.s_mem_dangerousTriple
      (Finset.mem_inter.mp K.named.s_mem_supportStrict).2 G.at_s with
    ⟨E₁⟩
  rcases nonempty_generatedGenuineEscape
      K.named K.named.t_mem_dangerousTriple
      (Finset.mem_inter.mp K.named.t_mem_supportStrict).2 G.at_t with
    ⟨E₂⟩
  have hE₁₂ :
      E₁.point ∉ (G.toTwoContinuationRows).row₂.support := by
    simpa [G] using
      ATailRF2CrossSurvivalSinkScratch.BothQCriticalCase.firstEscape_not_mem_secondFullRow
        K Q E₁
  have hE₂₁ :
      E₂.point ∉ (G.toTwoContinuationRows).row₁.support := by
    simpa [G] using
      ATailRF2CrossSurvivalSinkScratch.BothQCriticalCase.secondEscape_not_mem_firstFullRow
        K Q E₂
  have hE₁E₂ : E₁.point ≠ E₂.point := by
    intro h
    apply hE₁₂
    have hE₂row :
        E₂.point ∈ (G.toTwoContinuationRows).row₂.support := by
      exact G.at_t.support_subset_fullSelectedFourClass
        (alignedSharedRowPacket X hcenter).q_mem_A
        (Finset.mem_erase.mp K.named.t_mem_dangerousTriple).1
        E₂.point_mem_generatedSupport
    simpa [h] using hE₂row
  exact ⟨{
    first := E₁
    second := E₂
    first_not_mem_secondFullRow := by simpa [G] using hE₁₂
    second_not_mem_firstFullRow := by simpa [G] using hE₂₁
    first_ne_second := hE₁E₂
  }⟩

/-- First orientation: the row at `s` survives deletion of `t`.  Its exact
support remains distinct from the generated support at `s`. -/
structure FirstCrossSurvivalPacket
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
    (Q : BothQCriticalCase K.named) : Type where
  survives :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.t) K.named.s
  exactRow :
    QDeletedFourRow (rebasePacket D S) K.named.t K.named.s
  escapes : BothQCriticalEscapePair K Q

/-- Second orientation: the row at `t` survives deletion of `s`. -/
structure SecondCrossSurvivalPacket
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
    (Q : BothQCriticalCase K.named) : Type where
  survives :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.s) K.named.t
  exactRow :
    QDeletedFourRow (rebasePacket D S) K.named.s K.named.t
  escapes : BothQCriticalEscapePair K Q

/-- Exact oriented output after the metric residual has been eliminated. -/
theorem nonempty_first_or_secondCrossSurvivalPacket
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
    Nonempty (FirstCrossSurvivalPacket K Q) ∨
      Nonempty (SecondCrossSurvivalPacket K Q) := by
  rcases nonempty_bothQCriticalEscapePair K Q with ⟨E⟩
  rcases crossSurvivalOutput_of_bothQCritical K Q with
    ⟨hsurvives, ⟨row⟩⟩ | ⟨hsurvives, ⟨row⟩⟩
  · exact Or.inl ⟨{
      survives := hsurvives
      exactRow := row
      escapes := E
    }⟩
  · exact Or.inr ⟨{
      survives := hsurvives
      exactRow := row
      escapes := E
    }⟩

/-- The exact two-membership bridge needed in the first orientation.  Both
fields are about the independently extracted survivor support. -/
structure FirstOtherGeneratedOutsidePairCoupling
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
    {K : AnchoredSupportHeavyCoupling W R A X hcenter P}
    {Q : BothQCriticalCase K.named}
    (C : FirstCrossSurvivalPacket K Q) : Prop where
  deletedSource_mem_survivor : X.point ∈ C.exactRow.support
  otherEscape_mem_survivor : C.escapes.second.point ∈ C.exactRow.support

/-- The symmetric two-membership bridge in the second orientation. -/
structure SecondOtherGeneratedOutsidePairCoupling
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
    {K : AnchoredSupportHeavyCoupling W R A X hcenter P}
    {Q : BothQCriticalCase K.named}
    (C : SecondCrossSurvivalPacket K Q) : Prop where
  deletedSource_mem_survivor : X.point ∈ C.exactRow.support
  otherEscape_mem_survivor : C.escapes.first.point ∈ C.exactRow.support

/-- The first cross-survival orientation closes from exactly the actual
deleted source and the other generated row's genuine escape. -/
theorem false_of_firstCrossSurvival_otherGeneratedOutsidePair
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
    {K : AnchoredSupportHeavyCoupling W R A X hcenter P}
    {Q : BothQCriticalCase K.named}
    (C : FirstCrossSurvivalPacket K Q)
    (L : FirstOtherGeneratedOutsidePairCoupling C) :
    False := by
  let G := exactGeneratedPairOfBothQCritical Q
  let Ksurvivor : SelectedFourClass D.A K.named.s :=
    ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass
      (D := rebasePacket D S) C.exactRow
  have hXSurvivor : X.point ∈ Ksurvivor.support := by
    simpa [Ksurvivor,
      ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass]
      using L.deletedSource_mem_survivor
  have hESurvivor : C.escapes.second.point ∈ Ksurvivor.support := by
    simpa [Ksurvivor,
      ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass]
      using L.otherEscape_mem_survivor
  have hXOther : X.point ∈ (G.toTwoContinuationRows).row₂.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_secondFullRow Q
  have hEOther :
      C.escapes.second.point ∈ (G.toTwoContinuationRows).row₂.support := by
    exact G.at_t.support_subset_fullSelectedFourClass
      (alignedSharedRowPacket X hcenter).q_mem_A
      (Finset.mem_erase.mp K.named.t_mem_dangerousTriple).1
      C.escapes.second.point_mem_generatedSupport
  have hXE : X.point ≠ C.escapes.second.point := by
    intro h
    apply G.at_t.support_not_mem_deleted
    simpa [h] using C.escapes.second.point_mem_generatedSupport
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Ksurvivor (G.toTwoContinuationRows).row₂
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.s_mem_supportStrict).2)
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.t_mem_supportStrict).2)
    K.named.s_ne_t
    hXSurvivor hESurvivor hXOther hEOther
    (by simpa [rebasePacket] using K.deletedSource_not_mem_oppCap2)
    (by
      simpa [rebasePacket] using
        C.escapes.second.point_not_mem_oppCap2)
    hXE

/-- Symmetric terminal for the second cross-survival orientation. -/
theorem false_of_secondCrossSurvival_otherGeneratedOutsidePair
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
    {K : AnchoredSupportHeavyCoupling W R A X hcenter P}
    {Q : BothQCriticalCase K.named}
    (C : SecondCrossSurvivalPacket K Q)
    (L : SecondOtherGeneratedOutsidePairCoupling C) :
    False := by
  let G := exactGeneratedPairOfBothQCritical Q
  let Ksurvivor : SelectedFourClass D.A K.named.t :=
    ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass
      (D := rebasePacket D S) C.exactRow
  have hXSurvivor : X.point ∈ Ksurvivor.support := by
    simpa [Ksurvivor,
      ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass]
      using L.deletedSource_mem_survivor
  have hESurvivor : C.escapes.first.point ∈ Ksurvivor.support := by
    simpa [Ksurvivor,
      ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass]
      using L.otherEscape_mem_survivor
  have hXOther : X.point ∈ (G.toTwoContinuationRows).row₁.support := by
    simpa [G] using
      ATailRF2GeneratedMetricSinkScratch.BothQCriticalCase.deleted_mem_firstFullRow Q
  have hEOther :
      C.escapes.first.point ∈ (G.toTwoContinuationRows).row₁.support := by
    exact G.at_s.support_subset_fullSelectedFourClass
      (alignedSharedRowPacket X hcenter).q_mem_A
      (Finset.mem_erase.mp K.named.s_mem_dangerousTriple).1
      C.escapes.first.point_mem_generatedSupport
  have hXE : X.point ≠ C.escapes.first.point := by
    intro h
    apply G.at_s.support_not_mem_deleted
    simpa [h] using C.escapes.first.point_mem_generatedSupport
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Ksurvivor (G.toTwoContinuationRows).row₁
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.t_mem_supportStrict).2)
    (by
      simpa [rebasePacket, strictSecondCap] using
        (Finset.mem_inter.mp K.named.s_mem_supportStrict).2)
    K.named.s_ne_t.symm
    hXSurvivor hESurvivor hXOther hEOther
    (by simpa [rebasePacket] using K.deletedSource_not_mem_oppCap2)
    (by
      simpa [rebasePacket] using
        C.escapes.first.point_not_mem_oppCap2)
    hXE

namespace QDeletedFourRow

/-- Reclassify any exact q-deleted survivor at another named source.  If the
source lies on the row it becomes a q-critical triple; otherwise it remains
an exact q-deleted class.  This is the complete source-incidence split
available without transferring generated-support membership. -/
theorem reclassify_at_source
    {D : CounterexampleData} {deleted center source : ℝ²}
    (C : QDeletedFourRow D deleted center) :
    Nonempty
        (U5QCriticalTripleClass D source center
          (C.support.erase source)) ∨
      Nonempty (U5QDeletedK4Class D source center C.support) := by
  let Kallowed : U5QAllowedK4Class D center C.support :=
    C.row.toQAllowedK4Class
  by_cases hsource : source ∈ C.support
  · exact Or.inl
      (Kallowed.qCriticalTriple_of_mem_q C.support_card hsource)
  · exact Or.inr
      ⟨Kallowed.toQDeletedK4Class_of_not_mem_q hsource⟩

end QDeletedFourRow

#print axioms nonempty_generatedGenuineEscape
#print axioms BothQCriticalCase.firstEscape_not_mem_secondFullRow
#print axioms BothQCriticalCase.secondEscape_not_mem_firstFullRow
#print axioms nonempty_bothQCriticalEscapePair
#print axioms nonempty_first_or_secondCrossSurvivalPacket
#print axioms false_of_firstCrossSurvival_otherGeneratedOutsidePair
#print axioms false_of_secondCrossSurvival_otherGeneratedOutsidePair
#print axioms QDeletedFourRow.reclassify_at_source

end ATailRF2CrossSurvivalSinkScratch
end Problem97
