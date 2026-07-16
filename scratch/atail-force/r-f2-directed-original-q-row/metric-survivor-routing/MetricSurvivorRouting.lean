/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UnifiedParentCoupling

/-!
# Exact routing for the equal-source generated metric survivors

The paired original-`q` successor split retains a raw `MetricResidual`.  The
existing non-equilateral consumer instead accepts `NonEquilateralOutput`,
whose extra field is a common-deletion packet at the second apex.  This file
checks that the retained concrete critical system is already enough to build
that packet.

The generic strict-first-cap common-hit consumer below remains a valid
sufficient interface.  It is not the producer target on the actual
equal-source-at-live-center branch: the later
`strict-oppcap1-hit-producer/` audit proves that branch's two native supports
meet exactly at the live center in `oppCap2`, and hence proves that the common
hit is impossible.  That branch must instead retain the existing
non-equilateral support dichotomy.

For an equilateral residual, the existing joint-transition construction
already produces all rows and transition packets.  The branch-local missing
field is a `JointTransitionClosingSelection` for one such packet; the uniform
alternative is the existing `JointTransitionCoreEliminator`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2MetricSurvivorRoutingScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralContinuationScratch
open ATailUnifiedParentCouplingScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

private theorem survives_erase_of_not_mem_support
    {A : Finset ℝ²} {center deleted : ℝ²}
    (R : SelectedFourClass A center)
    (hdeleted : deleted ∉ R.support) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ ((A.erase deleted).filter
        fun x ↦ dist center x = R.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h ↦ hdeleted (h ▸ hx), R.support_subset_A hx⟩,
          R.support_eq_radius x hx⟩

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A raw non-equilateral metric residual already supplies the two deletion
survival facts needed to package the exact `NonEquilateralOutput` for any
retained concrete critical system. -/
theorem nonEquilateralOutput_of_residual
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K)
    (h : NonEquilateralResidual P) :
    NonEquilateralOutput H P := by
  rcases h with
    ⟨hd, hz₂row₁, hz₁row₂, hradius₁, hradius₂,
      hapex₁, hapex₂⟩
  have hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) P.z₁ :=
    survives_erase_of_not_mem_support P.row₁ hapex₁
  have hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) P.z₂ :=
    survives_erase_of_not_mem_support P.row₂ hapex₂
  have hz₁A : P.z₁ ∈ D.A :=
    K.support_subset_A (Finset.mem_inter.mp P.z₁_mem).1
  have hz₂A : P.z₂ ∈ D.A :=
    K.support_subset_A (Finset.mem_inter.mp P.z₂_mem).1
  exact
    { residual := ⟨hd, hz₂row₁, hz₁row₂,
        hradius₁, hradius₂, hapex₁, hapex₂⟩
      commonDeletion :=
        nonempty_commonDeletionTwoCenterPacket
          (D := rebasePacket D S) H (oppApex2_mem_A S)
          hz₁A hz₂A P.z₁_ne_z₂ hsurvives₁ hsurvives₂ }

/-- The consumer-facing normalization of a raw generated metric residual.
Unlike `routedContinuationBranch`, this preserves the already-realized metric
arm instead of permitting the generic classifier to choose cross survival. -/
inductive MetricConsumerRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop
  | nonEquilateral (output : NonEquilateralOutput H P)
  | equilateral (residual : P.EquilateralResidual)

/-- Route either constructor of the raw metric residual to the exact input
shape expected by the current branch consumers. -/
theorem metricConsumerRoute_of_metricResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K)
    (hmetric : P.MetricResidual) :
    MetricConsumerRoute H P := by
  rcases hmetric with hnon | hequilateral
  · exact .nonEquilateral
      (nonEquilateralOutput_of_residual D S H P hnon)
  · exact .equilateral hequilateral

/-- Branch-local selection object for one realized equilateral residual.
The global-K4 choices, the two divergent outside witnesses, and the joint
transition packet are all constructed by existing theorems; only the closing
selection for the resulting packet remains mathematical content. -/
def RealizedJointTransitionClosingSelection
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (C : TwoContinuationRows (rebasePacket D S) K)
    (h : C.EquilateralResidual) : Prop :=
  ∃ u v : ℝ²,
    ∃ Ku : SelectedFourClass D.A u,
      ∃ Kv : SelectedFourClass D.A v,
        ∃ J : JointTransitionPacket D S H
            (equilateralRowsOfResidual C h) Ku Kv,
          JointTransitionClosingSelection D S H
            (equilateralRowsOfResidual C h) Ku Kv J

/-- A branch-local closing selection suffices for the realized equilateral
residual; no uniform eliminator over unrelated row choices is required. -/
theorem false_of_equilateralResidual_of_realizedClosingSelection
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (C : TwoContinuationRows (rebasePacket D S) K)
    (h : C.EquilateralResidual)
    (W : RealizedJointTransitionClosingSelection D S H C h) : False := by
  rcases W with ⟨u, v, Ku, Kv, J, close⟩
  exact false_of_jointTransition_of_closingSelection J close

/-- Generic sufficient consumer fields for one already-realized metric
residual.

This is an interface, not a producer.  In particular, its non-equilateral
field must not be treated as the actual equal-source-at-live-center target:
that branch proves the requested common hit false and instead continues
through the non-equilateral support dichotomy. -/
structure MetricConsumerSelections
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop where
  nonEquilateral :
    NonEquilateralOutput H P → StrictOppCap1CommonHit P
  equilateral :
    ∀ h : P.EquilateralResidual,
      RealizedJointTransitionClosingSelection D S H P h

/-- The exact two-field interface closes any raw metric survivor. -/
theorem false_of_metricResidual_of_consumerSelections
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K)
    (hmetric : P.MetricResidual)
    (C : MetricConsumerSelections H P) : False := by
  rcases metricConsumerRoute_of_metricResidual D S H P hmetric with
    N | hequilateral
  · exact false_of_nonEquilateral_of_strictOppCap1CommonHit
      N (C.nonEquilateral N)
  · exact false_of_equilateralResidual_of_realizedClosingSelection
      D S H P hequilateral (C.equilateral hequilateral)

#print axioms nonEquilateralOutput_of_residual
#print axioms metricConsumerRoute_of_metricResidual
#print axioms false_of_equilateralResidual_of_realizedClosingSelection
#print axioms false_of_metricResidual_of_consumerSelections

end ATailRF2MetricSurvivorRoutingScratch
end Problem97
