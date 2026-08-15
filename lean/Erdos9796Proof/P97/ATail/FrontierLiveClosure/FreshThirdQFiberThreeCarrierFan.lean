/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeSynchronization

/-!
# Carrier-wide deletion fans at the FreshThird exact-three boundary

The pinned-fan finite view does not name the canonical blocker row of the
unique nonfiber point of the exact `Q` row unless that point already lies in
the pinned fan.  This module exports that omitted source data without assuming
the desired fan/`Q` synchronization.

The first intrinsic fan indexes the exact `Q` row itself.  Its distinguished
index is the unique source whose actual blocker differs from the common `Q`
center.  The second intrinsic fan indexes that source's actual blocker row.
Both are derived from the carrier-wide tri-apex context and remain valid at
arbitrary carrier cardinality.

This is theorem-discovery ingress, not a contradiction: none of the
declarations below asserts that the boundary source or a blocker-fiber point
belongs to the pinned fan.
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

namespace FreshThirdQFiberThreeCarrierFanView

/-- The distinguished source's blocker is its source-proved distinct center. -/
theorem boundary_blockerCenter_eq
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary) :
    View.qFan.blockerCenter View.boundaryIndex =
      H.centerAt Boundary.source.1 Boundary.source.2 := by
  change (H.blockerVertex (View.qFan.source View.boundaryIndex)).1 =
    (H.blockerVertex Boundary.source).1
  exact congrArg Subtype.val (congrArg H.blockerVertex View.boundary_eq)

/-- Every nondistinguished `Q`-row source has the common `Q` actual blocker. -/
theorem blockerCenter_eq_qCenter_of_ne_boundaryIndex
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary)
    {i : Fin 4} (hi : i ≠ View.boundaryIndex) :
    View.qFan.blockerCenter i = H.centerAt Q.source₁.1 Q.source₁.2 := by
  have hsourcesNe : View.qFan.source i ≠ Boundary.source := by
    intro hsources
    apply hi
    apply View.qFan.source_injective
    rw [hsources, View.boundary_eq]
  have hvaluesNe : (View.qFan.source i).1 ≠ Boundary.source.1 := by
    intro hvalues
    exact hsourcesNe (Subtype.ext hvalues)
  exact Boundary.centerAt_eq_qCenter_of_mem_ne_source
    (P := P) (Pρ := Pρ) Q (View.qFan.source_mem_support i) hvaluesNe

/-- Normalize the source-faithful packet at the unique nonfiber point.  Its
actual blocker is distinct from the `Q` center, its deletion is blocked there,
and the two exact rows overlap in at most two points. -/
theorem boundary_deletionPacket
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary) :
    ∃ blockerCap : Fin 3,
      View.qFan.blockerCenter View.boundaryIndex ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase (View.qFan.source View.boundaryIndex).1)
          (View.qFan.blockerCenter View.boundaryIndex) ∧
        ((freshThirdQFiberThreeSelectedRow P Pρ Q).support ∩
          (View.qFan.blockerRow
            View.boundaryIndex).toCriticalFourShell.support).card ≤ 2 := by
  rcases View.qFan.deletionPacket View.boundaryIndex with
    ⟨blockerCap, hcap, hblocked, hsame | hdistinct⟩
  · exfalso
    apply Boundary.centers_ne
    calc
      H.centerAt Boundary.source.1 Boundary.source.2 =
          View.qFan.blockerCenter View.boundaryIndex :=
        View.boundary_blockerCenter_eq.symm
      _ = H.centerAt Q.source₁.1 Q.source₁.2 := hsame.1.symm
  · exact ⟨blockerCap, hcap, hblocked, hdistinct.2⟩

/-- Normalize every other exact `Q`-row source into the center-blocker arm.
Its canonical blocker row is exactly the `Q` row, and the common center is not
fully deletion-robust. -/
theorem nonboundary_deletionPacket
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary)
    {i : Fin 4} (hi : i ≠ View.boundaryIndex) :
    ∃ blockerCap : Fin 3,
      View.qFan.blockerCenter i = H.centerAt Q.source₁.1 Q.source₁.2 ∧
        View.qFan.blockerCenter i ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase (View.qFan.source i).1)
          (View.qFan.blockerCenter i) ∧
        (freshThirdQFiberThreeSelectedRow P Pρ Q).support =
          (View.qFan.blockerRow i).toCriticalFourShell.support ∧
        ¬ FullyDeletionRobustAt D (H.centerAt Q.source₁.1 Q.source₁.2) := by
  have hcenter := View.blockerCenter_eq_qCenter_of_ne_boundaryIndex
    (P := P) (Pρ := Pρ) hi
  rcases View.qFan.deletionPacket i with
    ⟨blockerCap, hcap, hblocked, hsame | hdistinct⟩
  · exact ⟨blockerCap, hcenter, hcap, hblocked, hsame.2.1, hsame.2.2⟩
  · exact False.elim (hdistinct.1 hcenter.symm)

/-- The actual blocker row of the unique nonfiber source, viewed as an exact
selected four-row. -/
abbrev boundaryBlockerRow
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary) :
    SelectedFourClass D.A (View.qFan.blockerCenter View.boundaryIndex) :=
  (View.qFan.blockerRow View.boundaryIndex).toCriticalFourShell.toSelectedFourClass

/-- Carrier-wide source-faithful fan of the boundary source's own blocker row.
This is the second-order deletion data absent from the pinned-fan projection. -/
noncomputable def boundaryBlockerRowFan
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary) :
    IndexedSourceFaithfulSelectedFourFan D S H View.boundaryBlockerRow := by
  have hcenter : View.qFan.blockerCenter View.boundaryIndex ∈ D.A :=
    (Finset.mem_erase.mp
      (View.qFan.blockerRow
        View.boundaryIndex).toCriticalFourShell.center_mem).2
  exact IndexedSourceFaithfulSelectedFourFan.ofSourceFaithfulFan
    hcenter View.boundaryBlockerRow
      (sourceFaithfulDeletionFan_of_triApexAllLargeContext G
        View.boundaryBlockerRow)

/-- The boundary source occurs as an intrinsic slot of its own canonical
blocker row, independently of any pinned-fan synchronization. -/
theorem exists_boundaryBlockerRow_sourceIndex
    {G : TriApexAllLargeContext D S}
    {Q : FreshThirdBlockerFiber P Pρ}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary) :
    ∃ i : Fin 4,
      (View.boundaryBlockerRowFan.source i).1 = Boundary.source.1 := by
  have hsource : Boundary.source.1 ∈ View.boundaryBlockerRow.support := by
    have hq := (View.qFan.blockerRow
      View.boundaryIndex).toCriticalFourShell.q_mem_support
    simpa [boundaryBlockerRow, View.boundary_eq] using hq
  let i : Fin 4 :=
    View.boundaryBlockerRowFan.index ⟨Boundary.source.1, hsource⟩
  refine ⟨i, ?_⟩
  simpa [i] using congrArg Subtype.val
    (View.boundaryBlockerRowFan.source_index_support
      Boundary.source hsource)

end FreshThirdQFiberThreeCarrierFanView

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
