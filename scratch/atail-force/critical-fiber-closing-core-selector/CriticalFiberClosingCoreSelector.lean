/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Retained-radius selector for the critical-fiber closing core

This scratch module makes the adaptive blocker choice precise.  Restrict the
actual critical-shell blocker map to sources on the retained first-apex radius
class.  Either that restriction has a collision, in which case the two
preimages form a source-faithful critical fiber and the first apex is a genuine
second center for that pair, or the restriction is injective on the whole
class.

The collision arm maps to the production same-cap terminal once the remaining
cap-placement facts are supplied.  The injective arm is intentionally retained:
finite regression shows that the represented critical-row and minimality
surface does not eliminate it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberClosingCoreSelector

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberClosingCore
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : F.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hdist : 0 < dist F.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

/-- Sources of the actual blocker map which lie on the retained first-apex
radius class. -/
abbrev RetainedRadiusSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (radius : ℝ) :=
  {source : CriticalShellSystem.CarrierVertex D.A //
    source.1 ∈ SelectedClass D.A S.oppApex1 radius}

/-- The actual blocker map restricted to retained-radius sources. -/
def retainedRadiusBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A) :
    RetainedRadiusSource (S := S) radius →
      CriticalShellSystem.CarrierVertex D.A :=
  fun source ↦ H.blockerVertex source.1

/-- Any collision of actual blockers can be repackaged as the complete
source-faithful production critical fiber. -/
private def criticalFiberOfBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hsources : source₁ ≠ source₂)
    (hblockers : H.blockerVertex source₁ = H.blockerVertex source₂) :
    FrontierCommonDeletionCriticalFiber R := by
  have hrobust := R.firstApexFullyDeletionRobust
  have hcenters :
      H.centerAt source₁.1 source₁.2 =
        H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  let K₂ : SelectedFourClass D.A (H.centerAt source₁.1 source₁.2) :=
    transportSelectedFourClass
      (H.selectedAt source₂.1 source₂.2).toSelectedFourClass
      hcenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  have hsupports :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
          K₂.support :=
        (H.selectedFourClass_support_eq_shell source₁.1 source₁.2 K₂).symm
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
        hK₂Support
  have hsource₁Own :
      source₁.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support :=
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Own :
      source₂.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
    (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hsource₁Common :
      source₁.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    rw [← hsupports]
    exact hsource₁Own
  have hsource₂Common :
      source₂.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact hsource₂Own
  have hradii :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
          dist (H.centerAt source₁.1 source₁.2) source₁.1 :=
        ((H.selectedAt source₁.1
            source₁.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Own).symm
      _ = dist (H.centerAt source₂.1 source₂.2) source₁.1 := by
        rw [hcenters]
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius :=
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Common
  exact {
    firstApex_robust := hrobust
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := fun hpoints ↦ hsources (Subtype.ext hpoints)
    blockers_eq := hblockers
    commonBlocker_ne_firstApex :=
      hrobust.centerAt_ne H source₁.1 source₁.2
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := hsupports
    radii_eq := hradii
    source₁_mem_commonSupport := hsource₁Common
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical := by
      simpa only [hcenters] using H.no_qfree_at source₂.1 source₂.2 }

/-- A repeated blocker fiber whose two actual sources both lie on the retained
first-apex radius class. -/
structure RetainedRadiusCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F} : Type where
  fiber : FrontierCommonDeletionCriticalFiber R
  source₁_mem_radius :
    fiber.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius
  source₂_mem_radius :
    fiber.source₂.1 ∈ SelectedClass D.A S.oppApex1 radius

namespace RetainedRadiusCollision

/-- The first apex is a source-faithful second center for a collision which
occurs inside its retained radius class. -/
theorem firstApex_is_sourceFaithfulSecondCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) :
    HasSourceFaithfulSecondCenter Q.fiber Q.fiber.source₁.1
      Q.fiber.source₂.1 S.oppApex1 := by
  apply Or.inl
  refine ⟨rfl, ?_⟩
  exact (mem_selectedClass.mp Q.source₁_mem_radius).2.trans
    (mem_selectedClass.mp Q.source₂_mem_radius).2.symm

/-- A retained-radius collision naturally produces cyclic alternation, not a
same-cap localization: its two sources lie on opposite boundary arcs between
the first apex and their common blocker. -/
theorem alternates_between_firstApex_and_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, oppApex1_mem_A S⟩)
        (B.indexOf (H.blockerVertex Q.fiber.source₁))
        (B.indexOf Q.fiber.source₁) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, oppApex1_mem_A S⟩)
        (B.indexOf (H.blockerVertex Q.fiber.source₁))
        (B.indexOf Q.fiber.source₂) := by
  let O : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, oppApex1_mem_A S⟩
  let A : CriticalShellSystem.CarrierVertex D.A :=
    H.blockerVertex Q.fiber.source₁
  have hA_ne_O : A ≠ O := by
    intro h
    exact Q.fiber.commonBlocker_ne_firstApex (congrArg Subtype.val h)
  have hsource₂_ne_O : Q.fiber.source₂ ≠ O := by
    intro h
    have hpoint : Q.fiber.source₂.1 = S.oppApex1 :=
      congrArg Subtype.val h
    have hdist := (mem_selectedClass.mp Q.source₂_mem_radius).2
    rw [hpoint, dist_self] at hdist
    exact (ne_of_gt (frontierRadius_pos R)) hdist.symm
  have hsource₂_ne_A : Q.fiber.source₂ ≠ A := by
    intro h
    have hpoint : Q.fiber.source₂.1 = A.1 :=
      congrArg Subtype.val h
    apply (H.selectedAt Q.fiber.source₁.1
      Q.fiber.source₁.2).toCriticalFourShell.center_not_mem_support
    change A.1 ∈
      (H.selectedAt Q.fiber.source₁.1
        Q.fiber.source₁.2).toCriticalFourShell.support
    rw [← hpoint]
    exact Q.fiber.source₂_mem_commonSupport
  have hfirstEq :
      dist O.1 Q.fiber.source₁.1 =
        dist O.1 Q.fiber.source₂.1 := by
    exact (mem_selectedClass.mp Q.source₁_mem_radius).2.trans
      (mem_selectedClass.mp Q.source₂_mem_radius).2.symm
  have hcommonEq :
      dist A.1 Q.fiber.source₁.1 =
        dist A.1 Q.fiber.source₂.1 := by
    simpa only [A, CriticalShellSystem.blockerVertex,
      CriticalShellSystem.centerAt] using
        (IsFiberOrientation.commonBlocker_equidistant
          (P := Q.fiber) (C := Q.fiber.source₁.1)
          (K := Q.fiber.source₂.1) (Or.inl ⟨rfl, rfl⟩))
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hsource₂_ne_O
  · exact B.index_injective.ne hsource₂_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm, O] using hfirstEq
  · simpa only [B.point_eq, pointOf, dist_comm, A] using hcommonEq
  · exact B.boundary_injective.ne
      (B.index_injective.ne Q.fiber.sources_ne)

/-- The natural geometry packet carried by every retained-radius collision:
there is a full carrier boundary on which the two collision sources alternate
across the first apex and common blocker. -/
theorem exists_boundary_alternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) :
    ∃ B : BoundaryIndexing D.A,
      SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, oppApex1_mem_A S⟩)
          (B.indexOf (H.blockerVertex Q.fiber.source₁))
          (B.indexOf Q.fiber.source₁) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, oppApex1_mem_A S⟩)
          (B.indexOf (H.blockerVertex Q.fiber.source₁))
          (B.indexOf Q.fiber.source₂) := by
  have hcard := R.carrier_card_gt_nine
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by omega)
  rcases exists_boundaryIndexing D.convex hncol with ⟨B⟩
  exact ⟨B, Q.alternates_between_firstApex_and_commonBlocker B⟩

/-- The collision arm reaches the checked same-cap terminal as soon as full
geometry places the common blocker and first apex in one cap while excluding
the two collision sources from that cap. -/
def toSameCapCollisionPairCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (capIndex : Fin 3)
    (hcommon :
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈ S.capByIndex capIndex)
    (hfirst : S.oppApex1 ∈ S.capByIndex capIndex)
    (hsource₁Off : Q.fiber.source₁.1 ∉ S.capByIndex capIndex)
    (hsource₂Off : Q.fiber.source₂.1 ∉ S.capByIndex capIndex) :
    SameCapCollisionPairCore Q.fiber where
  C := Q.fiber.source₁.1
  K := Q.fiber.source₂.1
  fiber_orientation := Or.inl ⟨rfl, rfl⟩
  capIndex := capIndex
  secondCenter := S.oppApex1
  commonBlocker_mem_cap := hcommon
  secondCenter_mem_cap := hfirst
  secondCenter_ne_commonBlocker := Q.fiber.commonBlocker_ne_firstApex.symm
  C_not_mem_cap := hsource₁Off
  K_not_mem_cap := hsource₂Off
  source_faithful_secondCenter := Q.firstApex_is_sourceFaithfulSecondCenter

/-- Closing-core wrapper for the cap-localized collision arm. -/
def toClosingCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    (capIndex : Fin 3)
    (hcommon :
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 ∈ S.capByIndex capIndex)
    (hfirst : S.oppApex1 ∈ S.capByIndex capIndex)
    (hsource₁Off : Q.fiber.source₁.1 ∉ S.capByIndex capIndex)
    (hsource₂Off : Q.fiber.source₂.1 ∉ S.capByIndex capIndex) :
    CriticalFiberClosingCore R :=
  .sameCap Q.fiber
    (Q.toSameCapCollisionPairCore capIndex hcommon hfirst hsource₁Off hsource₂Off)

end RetainedRadiusCollision

/-- The complementary arm: actual blockers are injective on every source in
the retained first-apex radius class. -/
structure RetainedRadiusBlockerMatching
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Prop where
  injective :
    Function.Injective (retainedRadiusBlocker (S := S) (radius := radius) H)

/-- Exact adaptive split for the blocker map on the retained radius class. -/
inductive RetainedRadiusBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | collision (data : RetainedRadiusCollision (R := R))
  | matching (data : RetainedRadiusBlockerMatching R)

/-- The actual blocker map on the retained first-apex radius class either has
a source-faithful critical collision or is injective on that whole class. -/
theorem nonempty_retainedRadiusBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedRadiusBlockerOutcome R) := by
  by_cases hinjective :
      Function.Injective (retainedRadiusBlocker (S := S) (radius := radius) H)
  · exact ⟨RetainedRadiusBlockerOutcome.matching ⟨hinjective⟩⟩
  · rcases Function.not_injective_iff.mp hinjective with
      ⟨source₁, source₂, hblockers, hsources⟩
    have hcarrierSources : source₁.1 ≠ source₂.1 := by
      intro h
      exact hsources (Subtype.ext h)
    let P : FrontierCommonDeletionCriticalFiber R :=
      criticalFiberOfBlockerCollision source₁.1 source₂.1
        hcarrierSources hblockers
    exact ⟨RetainedRadiusBlockerOutcome.collision {
      fiber := P
      source₁_mem_radius := source₁.2
      source₂_mem_radius := source₂.2 }⟩

#print axioms nonempty_retainedRadiusBlockerOutcome
#print axioms RetainedRadiusCollision.firstApex_is_sourceFaithfulSecondCenter
#print axioms RetainedRadiusCollision.exists_boundary_alternation
#print axioms RetainedRadiusCollision.toClosingCore

end ATailCriticalFiberClosingCoreSelector
end Problem97
