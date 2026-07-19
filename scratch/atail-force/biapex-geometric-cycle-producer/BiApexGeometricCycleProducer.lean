/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Bi-apex geometric-cycle producer audit

The production bi-apex multiplicity theorem is lifted here to exact
source-indexed critical fibers.  The resulting normal form still supplies
only within-fiber row incidences; it does not manufacture a cross-fiber row
or a cyclic placement.

The file also records the direct fourth-vertex Kalmanson cancellation used by
the successful finite ordinal certificates.  That orientation is not one of
the two constructors currently exposed by `SelectedRowOrdinalComparison`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexGeometricCycleProducerScratch

open ATailBiApexBlockerMultiplicity
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open CapCrossingKalmansonBridge

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

/-- Repackage any collision in the retained actual blocker map as the full
production critical-fiber packet. -/
private def criticalFiberOfBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hsources : source₁ ≠ source₂)
    (hblockers : H.blockerVertex source₁ = H.blockerVertex source₂) :
    FrontierCommonDeletionCriticalFiber parent := by
  have hrobust := parent.firstApexFullyDeletionRobust
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
      _ = (H.selectedAt source₂.1
          source₂.2).toCriticalFourShell.support := hK₂Support
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

/-- Exact source-indexed form of the production bi-apex multiplicity split.

The two-fiber arm retains two different actual blocker values.  The larger
fiber arm retains two overlapping exact critical fibers, hence three distinct
sources in one actual blocker fiber. -/
inductive ExactCriticalFiberMultiplicity
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (parent : FrontierCommonDeletionParentResidual F) : Type
  | twoFibers
      (first second : FrontierCommonDeletionCriticalFiber parent)
      (blockers_ne :
        H.blockerVertex first.source₁ ≠ H.blockerVertex second.source₁)
  | largerFiber
      (first extension : FrontierCommonDeletionCriticalFiber parent)
      (shared_source : first.source₁ = extension.source₁)
      (third_ne_second : extension.source₂ ≠ first.source₂)

/-- The bi-apex endpoint produces exact critical fibers, not merely an
anonymous collision in a finite endomap. -/
theorem FrontierBiApexRobustResidual.nonempty_exactCriticalFiberMultiplicity
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (ExactCriticalFiberMultiplicity parent) := by
  rcases
      _root_.Problem97.ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
        R with
    ⟨source₁, source₂, hsources, hblockers, hmore⟩
  let first :=
    criticalFiberOfBlockerCollision (parent := parent)
      source₁ source₂ hsources hblockers
  rcases hmore with hsecond | hlarger
  · rcases hsecond with ⟨a, b, hab, habBlockers, hdifferent⟩
    let second :=
      criticalFiberOfBlockerCollision (parent := parent) a b hab habBlockers
    exact ⟨.twoFibers first second (by
      simpa [first, second, criticalFiberOfBlockerCollision] using
        hdifferent.symm)⟩
  · rcases hlarger with ⟨source₃, h31, h32, hblocker31⟩
    let extension :=
      criticalFiberOfBlockerCollision (parent := parent)
        source₁ source₃ h31.symm hblocker31.symm
    exact ⟨.largerFiber first extension (by
      rfl) (by
      simpa [first, extension, criticalFiberOfBlockerCollision] using h32)⟩

/-- Missing fourth-vertex cancellation orientation.

For `ia < ib < ic < id`, an equality row at `id` through `ia,ib` cancels
the `ia-id` and `ib-id` terms in the first strict Kalmanson inequality and
forces `dist ib ic < dist ia ic`. -/
theorem dist_secondSide_lt_firstDiagonal_of_ccw_of_lastRow
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (row : SelectedFourClass carrier (boundary id))
    (hia_mem : boundary ia ∈ row.support)
    (hib_mem : boundary ib ∈ row.support) :
    dist (boundary ib) (boundary ic) <
      dist (boundary ia) (boundary ic) := by
  have hlast :
      dist (boundary ia) (boundary id) =
        dist (boundary ib) (boundary id) := by
    rw [dist_comm (boundary ia) (boundary id),
      dist_comm (boundary ib) (boundary id)]
    exact (row.support_eq_radius _ hia_mem).trans
      (row.support_eq_radius _ hib_mem).symm
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  linarith

#print axioms FrontierBiApexRobustResidual.nonempty_exactCriticalFiberMultiplicity
#print axioms dist_secondSide_lt_firstDiagonal_of_ccw_of_lastRow

end ATailBiApexGeometricCycleProducerScratch
end Problem97
