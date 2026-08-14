/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual
import Erdos9796Proof.P97.ATail.FivePointEuclideanObstruction

/-!
# Five-point cuts for the FreshThird pinned-endpoint finite view

This module transports the two source-clean five-point Euclidean row
obstructions to the intrinsic finite role vocabulary of the pinned-endpoint
packet.  The adapters quantify only over visible role and row indices.  They
therefore give a finite detector a replayable geometric cut without bounding
the ambient carrier or treating unrepresented points as absent.

These are conditional contradiction consumers, not a proof that any current
packet realizes either forbidden incidence pattern.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open Census554.GeneralCarrierBridge

namespace TwoSourceExactCollisionRowsTerminal
namespace FreshThirdPinnedEndpointOutsideSeedFiniteView

noncomputable section

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

private theorem boundary_boundaryPosition
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole) :
    B.boundary (boundaryPosition P Pρ View role) = point P Pρ View role := by
  simpa [boundaryPosition, pointOf] using
    B.point_eq
      ⟨point P Pρ View role, point_mem_carrier P Pρ View role⟩

private def rowClassAtBoundaryCenter
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    SelectedFourClass D.A
      (B.boundary (boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter row))) :=
  transportSelectedFourClass (rowClass P Pρ View row)
    (boundary_boundaryPosition P Pρ View _).symm

@[simp] private theorem rowClassAtBoundaryCenter_support
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    (rowClassAtBoundaryCenter P Pρ View row).support =
      rowSupport P Pρ View row := by
  simp [rowClassAtBoundaryCenter, rowClass_support_eq_rowSupport]

private theorem boundary_mem_rowClassAtBoundaryCenter_of_incident
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole)
    (hincident : Incident P Pρ View role row) :
    B.boundary (boundaryPosition P Pρ View role) ∈
      (rowClassAtBoundaryCenter P Pρ View row).support := by
  change point P Pρ View role ∈ rowSupport P Pρ View row at hincident
  simpa only [rowClassAtBoundaryCenter_support,
    boundary_boundaryPosition] using hincident

/-- Replay adapter for the five-point pattern whose two selected-row centers
are the second and third points in increasing boundary order. -/
theorem false_of_fivePoint_bcRowPattern
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    {a d e : FreshThirdPinnedEndpointOutsideSeedPointRole}
    {bRow cRow : FreshThirdPinnedEndpointOutsideSeedRowRole}
    (hab : boundaryPosition P Pρ View a <
      boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter bRow))
    (hbc : boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter bRow) <
      boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter cRow))
    (hcd : boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter cRow) <
      boundaryPosition P Pρ View d)
    (hde : boundaryPosition P Pρ View d < boundaryPosition P Pρ View e)
    (haB : Incident P Pρ View a bRow)
    (heB : Incident P Pρ View e bRow)
    (haC : Incident P Pρ View a cRow)
    (hbC : Incident P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter bRow) cRow)
    (hdC : Incident P Pρ View d cRow) : False := by
  let BClass := rowClassAtBoundaryCenter P Pρ View bRow
  let CClass := rowClassAtBoundaryCenter P Pρ View cRow
  have haB' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View a bRow haB
  have heB' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View e bRow heB
  have haC' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View a cRow haC
  have hbC' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter bRow) cRow hbC
  have hdC' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View d cRow hdC
  have hb := (BClass.support_eq_radius _ haB').trans
    (BClass.support_eq_radius _ heB').symm
  have hca := (CClass.support_eq_radius _ haC').trans
    (CClass.support_eq_radius _ hbC').symm
  have hcd' := (CClass.support_eq_radius _ haC').trans
    (CClass.support_eq_radius _ hdC').symm
  exact
    FivePointEuclideanObstruction.false_of_five_ccw_three_row_equalities
      B.boundary_injective B.boundary_ccw hab hbc hcd hde hb hca hcd'

/-- Replay adapter for the five-point pattern whose two selected-row centers
are the fourth and fifth points in increasing boundary order. -/
theorem false_of_fivePoint_deRowPattern
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    {a b c : FreshThirdPinnedEndpointOutsideSeedPointRole}
    {dRow eRow : FreshThirdPinnedEndpointOutsideSeedRowRole}
    (hab : boundaryPosition P Pρ View a < boundaryPosition P Pρ View b)
    (hbc : boundaryPosition P Pρ View b < boundaryPosition P Pρ View c)
    (hcd : boundaryPosition P Pρ View c <
      boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter dRow))
    (hde : boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter dRow) <
      boundaryPosition P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowCenter eRow))
    (haD : Incident P Pρ View a dRow)
    (hcD : Incident P Pρ View c dRow)
    (heD : Incident P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter eRow) dRow)
    (haE : Incident P Pρ View a eRow)
    (hbE : Incident P Pρ View b eRow) : False := by
  let DClass := rowClassAtBoundaryCenter P Pρ View dRow
  let EClass := rowClassAtBoundaryCenter P Pρ View eRow
  have haD' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View a dRow haD
  have hcD' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View c dRow hcD
  have heD' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter eRow) dRow heD
  have haE' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View a eRow haE
  have hbE' :=
    boundary_mem_rowClassAtBoundaryCenter_of_incident P Pρ View b eRow hbE
  have hda := (DClass.support_eq_radius _ haD').trans
    (DClass.support_eq_radius _ hcD').symm
  have hdc := (DClass.support_eq_radius _ hcD').trans
    (DClass.support_eq_radius _ heD').symm
  have hea := (EClass.support_eq_radius _ haE').trans
    (EClass.support_eq_radius _ hbE').symm
  exact
    FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities
      B.boundary_injective B.boundary_ccw hab hbc hcd hde hda hdc hea

end

end

end FreshThirdPinnedEndpointOutsideSeedFiniteView
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
