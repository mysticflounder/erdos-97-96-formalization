/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.MirrorTransport

/-!
# Mirror transport for the P4 retained outer-arc overlay

The P4 compact CNF uses a fixed clockwise/anticlockwise convention for its
row-support and retained-arc atoms.  A `P4MirrorBoundaryPacket` evaluates its
CNF position `i` at `mirrorIndex i`; it is therefore not sound to reuse the
direct packet adapter verbatim.

This file records the parameter transport that makes the mirror branch an
ordinary CCW curvature source again.  We first cyclically shift the boundary,
then read compact labels through `reflFin i = 10 - i`.  Under that reading,
row labels are reflected, left and right arcs are exchanged, and an outer-arc
turn label is sent to `10 - i (mod 11)`.

The occurrence materializer will use these definitions to authenticate the
three direct-overlay families under the mirror valuation.  No equality between
the direct and mirror packets is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The shifted CCW curvature source used to read a mirror packet. -/
def mirrorCurvatureSource (Q : ExactTwoBoundaryCore R distribution) :
    P5CurvatureSource D.A where
  boundary := shiftedBoundary Q
  boundary_injective := shiftedBoundary_injective Q
  boundary_ccw := shiftedBoundary_ccw Q
  boundary_image := shiftedBoundary_image Q
  carrierPattern := Q.carrierPattern

/-- The source point at reflected label `reflFin i` is the point named by the
mirror CNF position `i`. -/
theorem mirrorCurvatureSource_reflFin
    (Q : ExactTwoBoundaryCore R distribution) (i : Label) :
    (mirrorCurvatureSource Q).boundary (reflFin i) = Q.boundary (mirrorIndex i) :=
  shiftedBoundary_reflFin Q i

/-- Reflect a compact boundary support into the shifted CCW chart. -/
def reflectSupport (support : Finset Label) : Finset Label :=
  support.image reflFin

/-- Reflection reverses the two retained outer sides. -/
def reflectSide : OuterSide → OuterSide
  | .left => .right
  | .right => .left

@[simp] theorem reflectSide_reflectSide (side : OuterSide) :
    reflectSide (reflectSide side) = side := by
  cases side <;> rfl

/-- The boundary-turn relabelling induced by the shift followed by reflection:
`i ↦ 10 - i (mod 11)`.  This is exactly `reflFin`; the cyclic re-cut has
already been accounted for in `mirrorCurvatureSource`. -/
def reflectTurnLabel (i : Label) : Label := reflFin i

/-- Reflect a compact turn mask into the shifted CCW chart. -/
def reflectMask (mask : Finset Label) : Finset Label :=
  mask.image reflectTurnLabel

/-- Mirror reading of a membership atom. -/
def reflectMembershipAtom (a : MembershipAtom) : MembershipAtom where
  center := reflFin a.center
  point := reflFin a.point

/-- Mirror reading of a selected-row-support atom. -/
def reflectRowSupportAtom (a : RowSupportAtom) : RowSupportAtom where
  center := reflFin a.center
  support := reflectSupport a.support

/-- Mirror reading of a retained outer-arc atom. -/
def reflectOuterArcAtom (a : OuterArcAtom) : OuterArcAtom where
  center := reflFin a.center
  side := reflectSide a.side
  mask := reflectMask a.mask

/-- The mirror valuation for the direct-overlay membership variables. -/
def mirrorMembershipVal (Q : ExactTwoBoundaryCore R distribution)
    (a : MembershipAtom) : Prop :=
  membershipVal (mirrorCurvatureSource Q) (reflectMembershipAtom a)

/-- The mirror valuation for direct-overlay row-support variables. -/
def mirrorRowSupportVal (Q : ExactTwoBoundaryCore R distribution)
    (a : RowSupportAtom) : Prop :=
  rowSupportVal (mirrorCurvatureSource Q) (reflectRowSupportAtom a)

/-- The mirror valuation for direct-overlay outer-arc variables. -/
def mirrorOuterArcVal (Q : ExactTwoBoundaryCore R distribution)
    (a : OuterArcAtom) : Prop :=
  outerArcVal (mirrorCurvatureSource Q) (reflectOuterArcAtom a)

/-- The generic membership-to-row theorem transported to the mirror valuation.
The occurrence bridge supplies the reflected four-element support certificate;
the four positive compact membership literals are then exactly the four source
memberships required by the ordinary CCW theorem. -/
theorem mirror_direct_memberships_imply_row_pattern
    (Q : ExactTwoBoundaryCore R distribution)
    (row : RowSupportAtom)
    (hcard : (reflectSupport row.support).card = 4)
    (hmembers :
      ∀ point ∈ row.support,
        mirrorMembershipVal Q ⟨row.center, point⟩) :
    mirrorRowSupportVal Q row := by
  apply direct_memberships_imply_row_pattern (mirrorCurvatureSource Q)
    (reflectRowSupportAtom row) hcard
  intro point hpoint
  change point ∈ row.support.image reflFin at hpoint
  rcases Finset.mem_image.mp hpoint with ⟨original, horiginal, rfl⟩
  exact hmembers original horiginal

/-- The finite row-to-arc schema theorem transported to the mirror valuation.
The materializer supplies a checked datum whose row and arc are the reflected
compact atoms.  Its finite validity is converted to the ordinary CCW schema,
which is then applied to the shifted curvature source. -/
theorem mirror_direct_row_pattern_implies_outer_arc
    (Q : ExactTwoBoundaryCore R distribution)
    (row : RowSupportAtom) (arc : OuterArcAtom)
    (datum : DirectRowArcFiniteDatum) (hvalid : datum.Valid)
    (hrowDatum : datum.row = reflectRowSupportAtom row)
    (harcDatum : datum.arc = reflectOuterArcAtom arc)
    (hrow : mirrorRowSupportVal Q row) :
    mirrorOuterArcVal Q arc := by
  have hrow' : rowSupportVal (mirrorCurvatureSource Q) datum.row := by
    simpa only [mirrorRowSupportVal, hrowDatum] using hrow
  have harc' : outerArcVal (mirrorCurvatureSource Q) datum.arc :=
    direct_row_pattern_implies_outer_arc (mirrorCurvatureSource Q)
      (datum.toSchema hvalid) hrow'
  simpa only [mirrorOuterArcVal, harcDatum] using harc'

/-- The generic four-disjoint-arcs contradiction transported to the mirror
valuation.  The occurrence materializer checks the six displayed reflected
mask disjointness facts; no reflection-invariance assumption about the compact
ledger is used. -/
theorem mirror_direct_no_four_turn_disjoint_outer_arcs
    (Q : ExactTwoBoundaryCore R distribution)
    (a₁ a₂ a₃ a₄ : OuterArcAtom)
    (ha₁ : mirrorOuterArcVal Q a₁)
    (ha₂ : mirrorOuterArcVal Q a₂)
    (ha₃ : mirrorOuterArcVal Q a₃)
    (ha₄ : mirrorOuterArcVal Q a₄)
    (h₁₂ : Disjoint (reflectMask a₁.mask) (reflectMask a₂.mask))
    (h₁₃ : Disjoint (reflectMask a₁.mask) (reflectMask a₃.mask))
    (h₁₄ : Disjoint (reflectMask a₁.mask) (reflectMask a₄.mask))
    (h₂₃ : Disjoint (reflectMask a₂.mask) (reflectMask a₃.mask))
    (h₂₄ : Disjoint (reflectMask a₂.mask) (reflectMask a₄.mask))
    (h₃₄ : Disjoint (reflectMask a₃.mask) (reflectMask a₄.mask)) : False :=
  direct_no_four_turn_disjoint_outer_arcs (mirrorCurvatureSource Q)
    (reflectOuterArcAtom a₁) (reflectOuterArcAtom a₂)
    (reflectOuterArcAtom a₃) (reflectOuterArcAtom a₄)
    ha₁ ha₂ ha₃ ha₄ h₁₂ h₁₃ h₁₄ h₂₃ h₂₄ h₃₄

#print axioms mirror_direct_memberships_imply_row_pattern
#print axioms mirror_direct_row_pattern_implies_outer_arc
#print axioms mirror_direct_no_four_turn_disjoint_outer_arcs

end P4DirectOuterArcAdapterScratch
end Problem97
