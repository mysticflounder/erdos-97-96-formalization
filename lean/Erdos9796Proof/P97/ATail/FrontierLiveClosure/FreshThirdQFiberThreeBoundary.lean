/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdPinnedFanPacket

/-!
# FreshThird exact-three Q-fiber boundary

This foundational module records the exact-three blocker boundary and its
source-faithful intrinsic indexing.  It stays below the synchronization
consumers so both the residual and the carrier-fan extensions can depend on
the same cycle-safe interface.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open Census554.GeneralCarrierBridge

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- The exact-three arm of the `Q` blocker boundary.  Besides recording the
fiber cardinality, it retains the source-clean distinct-center row and the two
deletion successors forced by the missing fourth source. -/
structure FreshThirdQFiberThreeBoundary
    (Q : FreshThirdBlockerFiber P Pρ) where
  card_eq :
    (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 3
  source : CriticalShellSystem.CarrierVertex D.A
  source_mem :
    source.1 ∈
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
  centers_ne :
    H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2
  two_le_difference :
    2 ≤
      ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support \
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support).card
  deletion_successors :
    ∀ w ∈
        (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support \
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support,
      w ≠ source.1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source.1 source.2)

/-- The selected four-row at the common `Q` blocker center. -/
abbrev freshThirdQFiberThreeSelectedRow
    (Q : FreshThirdBlockerFiber P Pρ) :
    SelectedFourClass D.A (H.centerAt Q.source₁.1 Q.source₁.2) :=
  (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass

/-- Source-proved intrinsic indexing of the exact `Q` row, retaining its full
source-faithful deletion fan and the index of the unique nonfiber source. -/
structure FreshThirdQFiberThreeCarrierFanView
    (G : TriApexAllLargeContext D S)
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q) where
  qFan : IndexedSourceFaithfulSelectedFourFan D S H
    (freshThirdQFiberThreeSelectedRow P Pρ Q)
  boundaryIndex : Fin 4
  boundary_eq : qFan.source boundaryIndex = Boundary.source

/-- Construct the carrier-fan view from the actual exact-three boundary.  The
only finite choice is an indexing of the already exact four-point `Q` row. -/
noncomputable def FreshThirdQFiberThreeCarrierFanView.ofBoundary
    (G : TriApexAllLargeContext D S)
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q) :
    FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary := by
  let qRow := freshThirdQFiberThreeSelectedRow P Pρ Q
  have hcenter : H.centerAt Q.source₁.1 Q.source₁.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.center_mem).2
  let qFan : IndexedSourceFaithfulSelectedFourFan D S H qRow :=
    IndexedSourceFaithfulSelectedFourFan.ofSourceFaithfulFan
      hcenter qRow
        (sourceFaithfulDeletionFan_of_triApexAllLargeContext G qRow)
  have hsource : Boundary.source.1 ∈ qRow.support := by
    exact Boundary.source_mem
  let boundaryIndex : Fin 4 := qFan.index ⟨Boundary.source.1, hsource⟩
  refine ⟨qFan, boundaryIndex, ?_⟩
  simpa only [boundaryIndex] using
    qFan.source_index_support Boundary.source hsource

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
