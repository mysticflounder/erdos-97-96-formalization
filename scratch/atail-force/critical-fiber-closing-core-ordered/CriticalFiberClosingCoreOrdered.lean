/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore

/-!
# Source-faithful ordered closing-core adapter

This scratch module starts from one geometry-chosen production critical fiber
and its source-stable first-apex `RowHit`.  It proves that all fields of the
ordered closing core are routine except:

* the other fiber source belongs to the critical shell sourced by the extra
  first-apex row point; and
* the six actual carrier roles have cyclic order `O,A,X,J,C,K`.

The first field is also characterized exactly as failure of the corresponding
cross deletion.  No existence claim for either missing field is made here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberClosingCoreOrderedScratch

open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- Orient the collision pair so that the first-apex row hit is named `C`.
The point `K` is then the other source in the same actual critical fiber. -/
structure OrientedFiberRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) (hit : RowHit P) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation P C K
  hitSource_eq_C : hit.hitSource = C

/-- Every source-stable row hit admits the required orientation. -/
theorem nonempty_orientedFiberRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} (hit : RowHit P) :
    Nonempty (OrientedFiberRowHit P hit) := by
  rcases hit.hitSource_is_fiber_source with hsource₁ | hsource₂
  · exact ⟨{
      C := P.source₁.1
      K := P.source₂.1
      fiber_orientation := Or.inl ⟨rfl, rfl⟩
      hitSource_eq_C := hsource₁ }⟩
  · exact ⟨{
      C := P.source₂.1
      K := P.source₁.1
      fiber_orientation := Or.inr ⟨rfl, rfl⟩
      hitSource_eq_C := hsource₂ }⟩

namespace OrientedFiberRowHit

/-- The extra point `J` of the first-apex row is a genuine carrier point. -/
theorem other_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    (_oriented : OrientedFiberRowHit P hit) : hit.other ∈ D.A :=
  hit.row.support_subset_A hit.other_mem_row

/-- The row hit already supplies the first equality used by the ordered
consumer: `J` and the oriented collision source `C` have one radius about the
first physical apex. -/
theorem firstApex_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    (oriented : OrientedFiberRowHit P hit) :
    dist S.oppApex1 hit.other = dist S.oppApex1 oriented.C := by
  have hhitC : oriented.C ∈ hit.row.support := by
    rw [← oriented.hitSource_eq_C]
    exact hit.hitSource_mem_row
  exact
    (hit.row.support_eq_radius hit.other hit.other_mem_row).trans
      (hit.row.support_eq_radius oriented.C hhitC).symm

/-- The missing cross-shell membership has an exact deletion-theoretic
meaning.  It is equivalent to deletion of `K` destroying K4 at the actual
blocker selected for `J`; the two deletion-critical fields of the original
fiber concern the old common blocker `A`, so they do not prove this statement. -/
theorem K_mem_other_shell_iff_cross_deletion_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    (oriented : OrientedFiberRowHit P hit) :
    oriented.K ∈
        (H.selectedAt hit.other oriented.other_mem_A).toCriticalFourShell.support ↔
      ¬ HasNEquidistantPointsAt 4 (D.A.erase oriented.K)
        (H.centerAt hit.other oriented.other_mem_A) := by
  constructor
  · intro hmem hsurvives
    exact
      ((cross_deletion_survives_iff_not_mem_selected_support
        H oriented.other_mem_A).mp hsurvives) hmem
  · intro hblocked
    by_contra hnot
    exact hblocked
      ((cross_deletion_survives_iff_not_mem_selected_support
        H oriented.other_mem_A).mpr hnot)

end OrientedFiberRowHit

/-- A global CCW boundary enumeration on the exact carrier cardinality. -/
structure FullCarrierBoundary (D : CounterexampleData) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary

/-- Boundary existence is automatic from the live parent geometry.  It is
not part of the missing producer; only the relative cyclic order of the six
distinguished roles remains new. -/
theorem nonempty_fullCarrierBoundary (D : CounterexampleData) :
    Nonempty (FullCarrierBoundary D) := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_isCcwConvexPolygon_of_convexIndep D.convex hnoncoll with
    ⟨n, _hn, boundary, hboundaryInj, hboundaryImage, hboundaryCcw⟩
  have hnCard : n = D.A.card := by
    calc
      n = (Finset.univ : Finset (Fin n)).card := by simp
      _ = (Finset.univ.image boundary).card :=
        (Finset.card_image_of_injective _ hboundaryInj).symm
      _ = D.A.card := congrArg Finset.card hboundaryImage
  subst n
  exact ⟨{
    boundary := boundary
    boundary_injective := hboundaryInj
    boundary_image := hboundaryImage
    boundary_ccw := hboundaryCcw }⟩

/-- One global CCW boundary enumeration with the six roles in the exact
linear order consumed by `OrderedCrossRowCore`.  This is the re-cut form of
the cyclic-subsequence assertion `O,A,X,J,C,K`.

The structure intentionally contains no metric or row facts. -/
structure OrderedBoundaryRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    (oriented : OrientedFiberRowHit P hit) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A : boundary iA = H.centerAt P.source₁.1 P.source₁.2
  boundary_X :
    boundary iX = H.centerAt hit.other oriented.other_mem_A
  boundary_J : boundary iJ = hit.other
  boundary_C : boundary iC = oriented.C
  boundary_K : boundary iK = oriented.K

/-- The exact two genuinely new producer fields on the row-hit arm. -/
structure OrderedRowHitProducerFields
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    (oriented : OrientedFiberRowHit P hit) : Type where
  K_mem_J_shell :
    oriented.K ∈
      (H.selectedAt hit.other oriented.other_mem_A).toCriticalFourShell.support
  ordered : OrderedBoundaryRoles oriented

/-- A source-stable row hit plus exactly the two producer fields assembles the
production ordered cross-row terminal. -/
def OrderedRowHitProducerFields.toOrderedCrossRowCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    {oriented : OrientedFiberRowHit P hit}
    (fields : OrderedRowHitProducerFields oriented) : OrderedCrossRowCore P := {
  C := oriented.C
  K := oriented.K
  fiber_orientation := oriented.fiber_orientation
  J := hit.other
  J_mem_A := oriented.other_mem_A
  boundary := fields.ordered.boundary
  boundary_injective := fields.ordered.boundary_injective
  boundary_image := fields.ordered.boundary_image
  boundary_ccw := fields.ordered.boundary_ccw
  iO := fields.ordered.iO
  iA := fields.ordered.iA
  iX := fields.ordered.iX
  iJ := fields.ordered.iJ
  iC := fields.ordered.iC
  iK := fields.ordered.iK
  hOA := fields.ordered.hOA
  hAX := fields.ordered.hAX
  hXJ := fields.ordered.hXJ
  hJC := fields.ordered.hJC
  hCK := fields.ordered.hCK
  boundary_O := fields.ordered.boundary_O
  boundary_A := fields.ordered.boundary_A
  boundary_X := fields.ordered.boundary_X
  boundary_J := fields.ordered.boundary_J
  boundary_C := fields.ordered.boundary_C
  boundary_K := fields.ordered.boundary_K
  robust_equidistant := oriented.firstApex_equidistant
  K_mem_J_shell := fields.K_mem_J_shell }

/-- The same exact packet reaches the production `ordered` constructor. -/
def OrderedRowHitProducerFields.toClosingCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    {oriented : OrientedFiberRowHit P hit}
    (fields : OrderedRowHitProducerFields oriented) : CriticalFiberClosingCore R :=
  .ordered P fields.toOrderedCrossRowCore

/-- The row-hit ordered producer fields close immediately through the
production closing-core consumer. -/
theorem false_of_orderedRowHitProducerFields
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {hit : RowHit P}
    {oriented : OrientedFiberRowHit P hit}
    (fields : OrderedRowHitProducerFields oriented) : False :=
  false_of_criticalFiberClosingCore fields.toClosingCore

#print axioms nonempty_orientedFiberRowHit
#print axioms OrientedFiberRowHit.K_mem_other_shell_iff_cross_deletion_blocked
#print axioms nonempty_fullCarrierBoundary
#print axioms OrderedRowHitProducerFields.toOrderedCrossRowCore
#print axioms OrderedRowHitProducerFields.toClosingCore
#print axioms false_of_orderedRowHitProducerFields

end ATailCriticalFiberClosingCoreOrderedScratch
end Problem97
