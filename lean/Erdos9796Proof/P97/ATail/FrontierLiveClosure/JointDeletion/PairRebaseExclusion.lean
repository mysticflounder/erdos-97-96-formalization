/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Pair rebase exclusion

For a mutually omitted pair reselected from the B1 physical class, a deletion
outside the two canonical deleted sources cannot have both fresh endpoint
blockers among the two old live-row blockers.  The proof uses the normal-form
cover and exact selected-support equality under equal actual blockers.
-/

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

/-- A noncanonical reselected deletion has a blocker outside the two old
live-row blockers at `C.u` and `C.v`.  The old blockers are deliberately the
live-row centers, rather than the blockers attached to the canonical deleted
sources `C.first.deleted` and `C.second.deleted`. -/
theorem b1_noncanonicalJointDeletion_blocker_escapes_original_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    {u' v' : CarrierVertex D.A}
    (J : ExactFourMutualOmissionJointDeletion C.R C.rho u' v')
    (hfirst : J.deleted ≠ C.first.deleted)
    (hsecond : J.deleted ≠ C.second.deleted) :
    let L := lateFirstApexSystem C.R
    (L.centerAt u'.1 u'.2 ≠ L.centerAt C.u.1 C.u.2 ∧
        L.centerAt u'.1 u'.2 ≠ L.centerAt C.v.1 C.v.2) ∨
      (L.centerAt v'.1 v'.2 ≠ L.centerAt C.u.1 C.u.2 ∧
        L.centerAt v'.1 v'.2 ≠ L.centerAt C.v.1 C.v.2) := by
  classical
  let L := lateFirstApexSystem C.R
  change
    (L.centerAt u'.1 u'.2 ≠ L.centerAt C.u.1 C.u.2 ∧
        L.centerAt u'.1 u'.2 ≠ L.centerAt C.v.1 C.v.2) ∨
      (L.centerAt v'.1 v'.2 ≠ L.centerAt C.u.1 C.u.2 ∧
        L.centerAt v'.1 v'.2 ≠ L.centerAt C.v.1 C.v.2)
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    (L.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    (L.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  have hcover :
      physicalClass =
        {C.first.deleted.1, C.second.deleted.1} ∪
          (uSlice ∪ vSlice) := by
    simpa [physicalClass, uSlice, vSlice] using hnormal.2.2
  have hdeleted : J.deleted.1 ∈ physicalClass := by
    simpa [physicalClass] using J.deleted_mem_class
  rw [hcover] at hdeleted
  rcases Finset.mem_union.mp hdeleted with hcanonical | hlive
  · rcases Finset.mem_insert.mp hcanonical with hfirst' | hsecond'
    · exact (hfirst (Subtype.ext hfirst')).elim
    · exact (hsecond (Subtype.ext (Finset.mem_singleton.mp hsecond'))).elim
  · rcases Finset.mem_union.mp hlive with hu | hv
    · have hu' :
          J.deleted.1 ∈
            (L.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 C.rho := by
        simpa [uSlice, physicalClass] using hu
      have hdeletedU : J.deleted.1 ∈
          (L.selectedAt C.u.1 C.u.2).toCriticalFourShell.support :=
        (Finset.mem_inter.mp hu').1
      have hu'_ne_u :
          L.centerAt u'.1 u'.2 ≠ L.centerAt C.u.1 C.u.2 := by
        intro h
        apply J.deleted_not_mem_uRow
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            L u'.2 C.u.2 h
        rw [hsupports]
        exact hdeletedU
      have hv'_ne_u :
          L.centerAt v'.1 v'.2 ≠ L.centerAt C.u.1 C.u.2 := by
        intro h
        apply J.deleted_not_mem_vRow
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            L v'.2 C.u.2 h
        rw [hsupports]
        exact hdeletedU
      by_cases hu'_eq_v : L.centerAt u'.1 u'.2 = L.centerAt C.v.1 C.v.2
      · right
        refine ⟨hv'_ne_u, ?_⟩
        intro hv'_eq_v
        apply J.blockers_ne
        exact hu'_eq_v.trans hv'_eq_v.symm
      · exact Or.inl ⟨hu'_ne_u, hu'_eq_v⟩
    · have hv' :
          J.deleted.1 ∈
            (L.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 C.rho := by
        simpa [vSlice, physicalClass] using hv
      have hdeletedV : J.deleted.1 ∈
          (L.selectedAt C.v.1 C.v.2).toCriticalFourShell.support :=
        (Finset.mem_inter.mp hv').1
      have hu'_ne_v :
          L.centerAt u'.1 u'.2 ≠ L.centerAt C.v.1 C.v.2 := by
        intro h
        apply J.deleted_not_mem_uRow
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            L u'.2 C.v.2 h
        rw [hsupports]
        exact hdeletedV
      have hv'_ne_v :
          L.centerAt v'.1 v'.2 ≠ L.centerAt C.v.1 C.v.2 := by
        intro h
        apply J.deleted_not_mem_vRow
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            L v'.2 C.v.2 h
        rw [hsupports]
        exact hdeletedV
      by_cases hu'_eq_u : L.centerAt u'.1 u'.2 = L.centerAt C.u.1 C.u.2
      · right
        refine ⟨?_, hv'_ne_v⟩
        intro hv'_eq_u
        apply J.blockers_ne
        exact hu'_eq_u.trans hv'_eq_u.symm
      · exact Or.inl ⟨hu'_eq_u, hu'_ne_v⟩

end ATailFrontierLiveClosure
end Problem97
