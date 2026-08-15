/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFan

/-!
# Finite query ingress for the FreshThird exact-three carrier fans

This module joins the existing pinned-fan finite view to the source-clean
carrier data exported by `FreshThirdQFiberThreeCarrierFan`.  Only exact
four-point supports are indexed.  The ambient carrier remains arbitrary.

The extra vocabulary names the actual `Q` row, the blocker row of its unique
nonfiber source, and the complete deletion fan on that blocker row.  It does
not assert that any of those points occur in the pinned fan.
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

/-- New point names introduced by the exact-three carrier-fan extension.

These are roles, not distinctness assertions.  In particular,
`qSource boundaryIndex` and one `boundaryRowSource` denote the same boundary
source, and both may alias roles in the pre-existing pinned-fan vocabulary. -/
inductive FreshThirdQFiberThreeCarrierExtraPointRole where
  | qSource (i : Fin 4)
  | boundaryBlockerCenter
  | boundaryRowSource (i : Fin 4)
  | boundaryFanBlockerCenter (i : Fin 4)
  | boundaryFanBlockerRowSource (i j : Fin 4)
deriving DecidableEq, Fintype

/-- Exact selected-four rows added by the carrier-fan extension. -/
inductive FreshThirdQFiberThreeCarrierExtraRowRole where
  | q
  | boundaryBlocker
  | boundaryFanBlocker (i : Fin 4)
deriving DecidableEq, Fintype

/-- The old pinned-fan vocabulary and the carrier-fan extension in one finite
role type. -/
abbrev FreshThirdQFiberThreeCarrierPointRole :=
  Sum FreshThirdPinnedEndpointOutsideSeedPointRole
    FreshThirdQFiberThreeCarrierExtraPointRole

/-- The old pinned-fan rows and the carrier-fan rows in one finite role type. -/
abbrev FreshThirdQFiberThreeCarrierRowRole :=
  Sum FreshThirdPinnedEndpointOutsideSeedRowRole
    FreshThirdQFiberThreeCarrierExtraRowRole

/-- The four exact support slots attached to every row in the combined
carrier query. -/
def freshThirdQFiberThreeCarrierRowSlot :
    FreshThirdQFiberThreeCarrierRowRole → Fin 4 →
      FreshThirdQFiberThreeCarrierPointRole
  | .inl row, i =>
      .inl (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
  | .inr .q, i => .inr (.qSource i)
  | .inr .boundaryBlocker, i => .inr (.boundaryRowSource i)
  | .inr (.boundaryFanBlocker row), i =>
      .inr (.boundaryFanBlockerRowSource row i)

/-- The actual selected-row center attached to every combined row role. -/
def freshThirdQFiberThreeCarrierRowCenter :
    FreshThirdQFiberThreeCarrierRowRole →
      FreshThirdQFiberThreeCarrierPointRole
  | .inl row =>
      .inl (freshThirdPinnedEndpointOutsideSeedRowCenter row)
  | .inr .q => .inl .freshCenter
  | .inr .boundaryBlocker => .inr .boundaryBlockerCenter
  | .inr (.boundaryFanBlocker row) =>
      .inr (.boundaryFanBlockerCenter row)

private theorem carrier_finset_eq_univ_image_equiv
    {α : Type} [DecidableEq α] (support : Finset α)
    (index : support ≃ Fin 4) :
    support = Finset.univ.image (fun i : Fin 4 ↦ (index.symm i).1) := by
  ext x
  constructor
  · intro hx
    refine Finset.mem_image.mpr
      ⟨index ⟨x, hx⟩, Finset.mem_univ _, ?_⟩
    simp
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, _, rfl⟩
    exact (index.symm i).2

/-- Intrinsic finite view combining the pinned packet with the two
source-faithful carrier fans.

The only new choices index the four canonical blocker rows attached to the
second-order boundary-row fan.  No ambient point is enumerated. -/
structure FreshThirdQFiberThreeCarrierFiniteView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (G : TriApexAllLargeContext D S)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q) where
  pinned : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet
  carrier : FreshThirdQFiberThreeCarrierFanView P Pρ G Q Boundary
  boundaryFanBlockerRowIndex : ∀ i : Fin 4,
    ((carrier.boundaryBlockerRowFan.blockerRow i).toCriticalFourShell.support) ≃
      Fin 4

namespace FreshThirdQFiberThreeCarrierFiniteView

/-- Construct the combined finite view from the exact live packet and one
exact-three boundary witness. -/
noncomputable def ofPacketBoundary
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (G : TriApexAllLargeContext D S)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    (Pinned : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary where
  pinned := Pinned
  carrier := FreshThirdQFiberThreeCarrierFanView.ofBoundary P Pρ G Q Boundary
  boundaryFanBlockerRowIndex := fun i ↦
    Finset.equivFinOfCardEq
      ((FreshThirdQFiberThreeCarrierFanView.ofBoundary P Pρ G Q Boundary).boundaryBlockerRowFan
        |>.blockerRow i).toCriticalFourShell.support_card

/-- Interpret every combined point role as its actual carrier point. -/
noncomputable def point
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    FreshThirdQFiberThreeCarrierPointRole → ℝ²
  | .inl role =>
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View.pinned role
  | .inr (.qSource i) => (View.carrier.qFan.source i).1
  | .inr .boundaryBlockerCenter =>
      View.carrier.qFan.blockerCenter View.carrier.boundaryIndex
  | .inr (.boundaryRowSource i) =>
      (View.carrier.boundaryBlockerRowFan.source i).1
  | .inr (.boundaryFanBlockerCenter i) =>
      View.carrier.boundaryBlockerRowFan.blockerCenter i
  | .inr (.boundaryFanBlockerRowSource i j) =>
      ((View.boundaryFanBlockerRowIndex i).symm j).1

/-- Every combined role denotes a genuine point of the arbitrary carrier. -/
theorem point_mem_carrier
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (role : FreshThirdQFiberThreeCarrierPointRole) :
    point P Pρ View role ∈ D.A := by
  rcases role with role | role
  · exact FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
      P Pρ View.pinned role
  · cases role with
    | qSource i => exact (View.carrier.qFan.source i).2
    | boundaryBlockerCenter =>
        exact (Finset.mem_erase.mp
          (View.carrier.qFan.blockerRow View.carrier.boundaryIndex
            ).toCriticalFourShell.center_mem).2
    | boundaryRowSource i =>
        exact (View.carrier.boundaryBlockerRowFan.source i).2
    | boundaryFanBlockerCenter i =>
        exact (Finset.mem_erase.mp
          (View.carrier.boundaryBlockerRowFan.blockerRow i
            ).toCriticalFourShell.center_mem).2
    | boundaryFanBlockerRowSource i j =>
        exact
          (View.carrier.boundaryBlockerRowFan.blockerRow i
            ).toCriticalFourShell.support_subset_A
              ((View.boundaryFanBlockerRowIndex i).symm j).2

/-- Exact support selected by each combined row role. -/
noncomputable def rowSupport
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    FreshThirdQFiberThreeCarrierRowRole → Finset ℝ²
  | .inl row =>
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View.pinned row
  | .inr .q => (freshThirdQFiberThreeSelectedRow P Pρ Q).support
  | .inr .boundaryBlocker => View.carrier.boundaryBlockerRow.support
  | .inr (.boundaryFanBlocker i) =>
      (View.carrier.boundaryBlockerRowFan.blockerRow i
        ).toCriticalFourShell.support

/-- Every added or inherited row is an exact four-point support. -/
theorem rowSupport_card_eq_four
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (row : FreshThirdQFiberThreeCarrierRowRole) :
    (rowSupport P Pρ View row).card = 4 := by
  rcases row with row | row
  · exact FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_card_eq_four
      P Pρ View.pinned row
  · cases row with
    | q => exact (freshThirdQFiberThreeSelectedRow P Pρ Q).support_card
    | boundaryBlocker => exact View.carrier.boundaryBlockerRow.support_card
    | boundaryFanBlocker i =>
        exact (View.carrier.boundaryBlockerRowFan.blockerRow i
          ).toCriticalFourShell.support_card

/-- The exact selected four-class represented by a combined row role. -/
noncomputable def rowClass
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    (row : FreshThirdQFiberThreeCarrierRowRole) →
      SelectedFourClass D.A
        (point P Pρ View (freshThirdQFiberThreeCarrierRowCenter row))
  | .inl row =>
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
        P Pρ View.pinned row
  | .inr .q => freshThirdQFiberThreeSelectedRow P Pρ Q
  | .inr .boundaryBlocker => View.carrier.boundaryBlockerRow
  | .inr (.boundaryFanBlocker i) =>
      (View.carrier.boundaryBlockerRowFan.blockerRow i
        ).toCriticalFourShell.toSelectedFourClass

/-- Every combined row is exactly the image of its four declared slots. -/
theorem rowSupport_eq_slot_image
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (row : FreshThirdQFiberThreeCarrierRowRole) :
    rowSupport P Pρ View row =
      Finset.univ.image (fun i : Fin 4 ↦
        point P Pρ View (freshThirdQFiberThreeCarrierRowSlot row i)) := by
  classical
  rcases row with row | row
  · simpa [rowSupport, freshThirdQFiberThreeCarrierRowSlot, point] using
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
        P Pρ View.pinned row
  · cases row with
    | q =>
        simpa [rowSupport, freshThirdQFiberThreeCarrierRowSlot, point] using
          View.carrier.qFan.support_eq_source_image
    | boundaryBlocker =>
        simpa [rowSupport, freshThirdQFiberThreeCarrierRowSlot, point] using
          View.carrier.boundaryBlockerRowFan.support_eq_source_image
    | boundaryFanBlocker i =>
        simpa [rowSupport, freshThirdQFiberThreeCarrierRowSlot, point] using
          (carrier_finset_eq_univ_image_equiv
            (support :=
              (View.carrier.boundaryBlockerRowFan.blockerRow i
                ).toCriticalFourShell.support)
            (index := View.boundaryFanBlockerRowIndex i))

@[simp] theorem rowClass_support_eq_rowSupport
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (row : FreshThirdQFiberThreeCarrierRowRole) :
    (rowClass P Pρ View row).support = rowSupport P Pρ View row := by
  rcases row with row | row
  · exact FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport
      P Pρ View.pinned row
  · cases row <;> rfl

/-- The unique nonfiber `Q`-row source aliases one of the two old fresh-
remainder roles.  This is the first source-clean bridge between the old and
new finite vocabularies. -/
theorem exists_boundary_freshRemainder_alias
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    ∃ i : Fin 2,
      point P Pρ View (.inr (.qSource View.carrier.boundaryIndex)) =
        point P Pρ View (.inl (.freshRemainder i)) := by
  let i : Fin 2 := View.pinned.freshRemainderIndex
    ⟨Boundary.source.1,
      Boundary.source_mem_freshRemainder (P := P) (Pρ := Pρ) Q Packet⟩
  refine ⟨i, ?_⟩
  change (View.carrier.qFan.source View.carrier.boundaryIndex).1 =
    (View.pinned.freshRemainderIndex.symm i).1
  rw [View.carrier.boundary_eq]
  simp [i]

/-- The boundary source also occurs in its own canonical blocker row. -/
theorem exists_boundaryRow_source_alias
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    ∃ i : Fin 4,
      point P Pρ View (.inr (.boundaryRowSource i)) =
        point P Pρ View (.inr (.qSource View.carrier.boundaryIndex)) := by
  rcases View.carrier.exists_boundaryBlockerRow_sourceIndex
      (P := P) (Pρ := Pρ) with ⟨i, hi⟩
  exact ⟨i, hi.trans (congrArg Subtype.val View.carrier.boundary_eq.symm)⟩

end FreshThirdQFiberThreeCarrierFiniteView

/-- Boolean vocabulary for the combined pinned/carrier finite view. -/
structure FreshThirdQFiberThreeCarrierFiniteAssignment where
  samePoint : FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierPointRole → Bool
  incident : FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierRowRole → Bool
  inCap : FreshThirdQFiberThreeCarrierPointRole → Fin 3 → Bool
  inCapInterior : FreshThirdQFiberThreeCarrierPointRole → Fin 3 → Bool
  before : FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierPointRole → Bool
  sameDistanceFrom : FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierPointRole → Bool
  hasFourAfterDeleting : FreshThirdQFiberThreeCarrierPointRole →
    FreshThirdQFiberThreeCarrierPointRole → Bool
  nonrobust : FreshThirdQFiberThreeCarrierPointRole → Bool
deriving DecidableEq

namespace FreshThirdQFiberThreeCarrierFiniteAssignment

abbrev PointRole := FreshThirdQFiberThreeCarrierPointRole
abbrev RowRole := FreshThirdQFiberThreeCarrierRowRole

def Same (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (left right : PointRole) : Prop :=
  A.samePoint left right = true

def Incident (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (point : PointRole) (row : RowRole) : Prop :=
  A.incident point row = true

def InCap (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Prop :=
  A.inCap point cap = true

def InCapInterior (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Prop :=
  A.inCapInterior point cap = true

def Before (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (left right : PointRole) : Prop :=
  A.before left right = true

def SameDistanceFrom (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (center left right : PointRole) : Prop :=
  A.sameDistanceFrom center left right = true

def HasFourAfterDeleting
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (deleted atCenter : PointRole) : Prop :=
  A.hasFourAfterDeleting deleted atCenter = true

def Nonrobust (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (center : PointRole) : Prop :=
  A.nonrobust center = true

/-- Solver-sized form of an overlap-cardinality bound: no three distinct
slots from one indexed row all occur in the target row. -/
def NoThreeSourcesInRow
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (source : Fin 4 → PointRole) (row : RowRole) : Prop :=
  ∀ e : Fin 3 ↪ Fin 4, ¬ ∀ k : Fin 3, A.Incident (source (e k)) row

attribute [local instance] Classical.propDecidable

/-- Evaluate the combined Boolean vocabulary on an exact carrier-fan view. -/
noncomputable def ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    FreshThirdQFiberThreeCarrierFiniteAssignment where
  samePoint := fun left right ↦ decide
    (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left =
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right)
  incident := fun point row ↦ decide
    (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
      FreshThirdQFiberThreeCarrierFiniteView.rowSupport P Pρ View row)
  inCap := fun point cap ↦ decide
    (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
      S.capByIndex cap)
  inCapInterior := fun point cap ↦ decide
    (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
      S.capInteriorByIndex cap)
  before := fun left right ↦ decide
    (B.indexOf
        ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left,
          FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
            P Pρ View left⟩ <
      B.indexOf
        ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right,
          FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
            P Pρ View right⟩)
  sameDistanceFrom := fun centerRole left right ↦ decide
    (dist (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole)
          (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left) =
      dist (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole)
          (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right))
  hasFourAfterDeleting := fun deleted atCenter ↦ decide
    (HasNEquidistantPointsAt 4
      (D.A.erase
        (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View deleted))
      (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View atCenter))
  nonrobust := fun centerRole ↦ decide
    (¬ FullyDeletionRobustAt D
      (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole))

@[simp] theorem same_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (left right : PointRole) :
    Same (ofView P Pρ View) left right ↔
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left =
        FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right := by
  simp [Same, ofView]

@[simp] theorem incident_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (point : PointRole) (row : RowRole) :
    Incident (ofView P Pρ View) point row ↔
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
        FreshThirdQFiberThreeCarrierFiniteView.rowSupport P Pρ View row := by
  simp [Incident, ofView]

@[simp] theorem inCapInterior_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (point : PointRole) (cap : Fin 3) :
    InCapInterior (ofView P Pρ View) point cap ↔
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
        S.capInteriorByIndex cap := by
  simp [InCapInterior, ofView]

@[simp] theorem inCap_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (point : PointRole) (cap : Fin 3) :
    InCap (ofView P Pρ View) point cap ↔
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View point ∈
        S.capByIndex cap := by
  simp [InCap, ofView]

@[simp] theorem before_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (left right : PointRole) :
    Before (ofView P Pρ View) left right ↔
      B.indexOf
          ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left,
            FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
              P Pρ View left⟩ <
        B.indexOf
          ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right,
            FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
              P Pρ View right⟩ := by
  simp [Before, ofView]

@[simp] theorem sameDistanceFrom_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (centerRole left right : PointRole) :
    SameDistanceFrom (ofView P Pρ View) centerRole left right ↔
      dist (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole)
          (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left) =
        dist (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole)
          (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right) := by
  simp [SameDistanceFrom, ofView]

@[simp] theorem hasFourAfterDeleting_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (deleted atCenter : PointRole) :
    HasFourAfterDeleting (ofView P Pρ View) deleted atCenter ↔
      HasNEquidistantPointsAt 4
        (D.A.erase
          (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View deleted))
        (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View atCenter) := by
  simp [HasFourAfterDeleting, ofView]

@[simp] theorem nonrobust_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (centerRole : PointRole) :
    Nonrobust (ofView P Pρ View) centerRole ↔
      ¬ FullyDeletionRobustAt D
        (FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View centerRole) := by
  simp [Nonrobust, ofView]

end FreshThirdQFiberThreeCarrierFiniteAssignment

/-- Equality and exact-row semantics over the complete old/new carrier
vocabulary.  In particular, the newly introduced Q and second-order fan rows
cannot collapse support slots or contain their positive-radius centers. -/
structure FreshThirdQFiberThreeCarrierFiniteRowTheory
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment) : Prop where
  same_refl : ∀ point, A.Same point point
  same_symm : ∀ {left right}, A.Same left right → A.Same right left
  same_trans : ∀ {left middle right},
    A.Same left middle → A.Same middle right → A.Same left right
  slot_same_iff_eq : ∀ row i j,
    A.Same
        (freshThirdQFiberThreeCarrierRowSlot row i)
        (freshThirdQFiberThreeCarrierRowSlot row j) ↔
      i = j
  incident_iff_slot : ∀ point row,
    A.Incident point row ↔
      ∃ i : Fin 4,
        A.Same point (freshThirdQFiberThreeCarrierRowSlot row i)
  row_center_not_incident : ∀ row,
    ¬ A.Incident (freshThirdQFiberThreeCarrierRowCenter row) row
  row_slots_same_distance : ∀ row i j,
    A.SameDistanceFrom
      (freshThirdQFiberThreeCarrierRowCenter row)
      (freshThirdQFiberThreeCarrierRowSlot row i)
      (freshThirdQFiberThreeCarrierRowSlot row j)
  deletion_survives_iff_robust_or_not_incident : ∀ deleted row,
    A.HasFourAfterDeleting deleted
        (freshThirdQFiberThreeCarrierRowCenter row) ↔
      ¬ A.Nonrobust (freshThirdQFiberThreeCarrierRowCenter row) ∨
        ¬ A.Incident deleted row
  row_no_three_of_centers_ne : ∀ sourceRow targetRow,
    ¬ A.Same
        (freshThirdQFiberThreeCarrierRowCenter sourceRow)
        (freshThirdQFiberThreeCarrierRowCenter targetRow) →
      A.NoThreeSourcesInRow
        (freshThirdQFiberThreeCarrierRowSlot sourceRow) targetRow

namespace FreshThirdQFiberThreeCarrierFiniteRowTheory

/-- Convert the geometric two-circle overlap bound into the indexed no-three
predicate used by the finite query. -/
private theorem noThreeSlots_of_inter_card_le_two
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary)
    (sourceRow targetRow : FreshThirdQFiberThreeCarrierRowRole)
    (hoverlap :
      ((FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View sourceRow).support ∩
        (FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View targetRow).support).card ≤ 2) :
    (FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View).NoThreeSourcesInRow
      (freshThirdQFiberThreeCarrierRowSlot sourceRow) targetRow := by
  intro e hall
  let slotPoint : Fin 4 → ℝ² := fun i ↦
    FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View
      (freshThirdQFiberThreeCarrierRowSlot sourceRow i)
  have hslotInjective : Function.Injective slotPoint := by
    have hcardImage :
        (Finset.univ.image slotPoint).card =
          (Finset.univ : Finset (Fin 4)).card := by
      rw [← FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image
        (P := P) (Pρ := Pρ) View sourceRow]
      rw [FreshThirdQFiberThreeCarrierFiniteView.rowSupport_card_eq_four
        (P := P) (Pρ := Pρ) View sourceRow]
      simp
    have hinj : Set.InjOn slotPoint (Finset.univ : Finset (Fin 4)) :=
      Finset.card_image_iff.mp hcardImage
    intro i j hij
    exact hinj (Finset.mem_univ i) (Finset.mem_univ j) hij
  let chosen : Finset ℝ² :=
    Finset.univ.image (fun k : Fin 3 ↦ slotPoint (e k))
  have hchosenInjective :
      Function.Injective (fun k : Fin 3 ↦ slotPoint (e k)) :=
    hslotInjective.comp e.injective
  have hcard : chosen.card = 3 := by
    simp [chosen, Finset.card_image_of_injective _ hchosenInjective]
  have hsubset :
      chosen ⊆
        (FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View sourceRow).support ∩
          (FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View targetRow).support := by
    intro point hpoint
    rcases Finset.mem_image.mp hpoint with ⟨k, _, rfl⟩
    apply Finset.mem_inter.mpr
    constructor
    · rw [FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport,
        FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image]
      exact Finset.mem_image.mpr ⟨e k, Finset.mem_univ _, rfl⟩
    · rw [FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport]
      exact
        (FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).1 (hall k)
  have hle := Finset.card_le_card hsubset
  rw [hcard] at hle
  omega

/-- Every exact carrier view satisfies the complete row theory. -/
theorem ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    FreshThirdQFiberThreeCarrierFiniteRowTheory
      (FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View) := by
  classical
  let A := FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View
  refine {
    same_refl := ?_
    same_symm := ?_
    same_trans := ?_
    slot_same_iff_eq := ?_
    incident_iff_slot := ?_
    row_center_not_incident := ?_
    row_slots_same_distance := ?_
    deletion_survives_iff_robust_or_not_incident := ?_
    row_no_three_of_centers_ne := ?_
  }
  · intro point
    exact (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ) View point point).2 rfl
  · intro left right h
    exact (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ) View right left).2
        ((FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View left right).1 h).symm
  · intro left middle right hleft hright
    exact (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ) View left right).2
        (((FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View left middle).1 hleft).trans
        ((FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View middle right).1 hright))
  · intro row i j
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ)]
    let slotPoint : Fin 4 → ℝ² := fun k ↦
      FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View
        (freshThirdQFiberThreeCarrierRowSlot row k)
    have hcardImage :
        (Finset.univ.image slotPoint).card =
          (Finset.univ : Finset (Fin 4)).card := by
      rw [← FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image
        (P := P) (Pρ := Pρ) View row]
      rw [FreshThirdQFiberThreeCarrierFiniteView.rowSupport_card_eq_four
        (P := P) (Pρ := Pρ) View row]
      simp
    have hinj : Set.InjOn slotPoint (Finset.univ : Finset (Fin 4)) :=
      Finset.card_image_iff.mp hcardImage
    constructor
    · exact fun h ↦ hinj (Finset.mem_univ i) (Finset.mem_univ j) h
    · rintro rfl
      rfl
  · intro point row
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image]
    simp only [Finset.mem_image, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨i, hpoint⟩
      exact ⟨i,
        (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).2 hpoint.symm⟩
    · rintro ⟨i, hsame⟩
      exact ⟨i,
        ((FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).1 hsame).symm⟩
  · intro row hincident
    have hmem :=
      (FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).1 hincident
    rw [← FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport
      (P := P) (Pρ := Pρ) View row] at hmem
    exact (FreshThirdQFiberThreeCarrierFiniteView.rowClass
      P Pρ View row).center_not_mem hmem
  · intro row i j
    apply
      (FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff
        (P := P) (Pρ := Pρ) View _ _ _).2
    let K := FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View row
    have hi :
        FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View
            (freshThirdQFiberThreeCarrierRowSlot row i) ∈ K.support := by
      rw [FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport,
        FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
    have hj :
        FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View
            (freshThirdQFiberThreeCarrierRowSlot row j) ∈ K.support := by
      rw [FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport,
        FreshThirdQFiberThreeCarrierFiniteView.rowSupport_eq_slot_image]
      exact Finset.mem_image.mpr ⟨j, Finset.mem_univ j, rfl⟩
    exact (K.support_eq_radius _ hi).trans (K.support_eq_radius _ hj).symm
  · intro deleted row
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [selectedFourClass_survives_erase_iff_robust_or_not_mem
      (FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View
        (freshThirdQFiberThreeCarrierRowCenter row))
      (FreshThirdQFiberThreeCarrierFiniteView.rowClass P Pρ View row)]
    rw [FreshThirdQFiberThreeCarrierFiniteView.rowClass_support_eq_rowSupport]
    simp
  · intro sourceRow targetRow hcenters
    apply noThreeSlots_of_inter_card_le_two
    apply SelectedFourClass.inter_card_le_two
    intro hcenterEq
    apply hcenters
    exact
      (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 hcenterEq

end FreshThirdQFiberThreeCarrierFiniteRowTheory

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
