import Erdos9796Proof.P97.MEC.ArcAngle
import Erdos9796Proof.P97.N9Endpoint.N67
import Erdos9796Proof.P97.TwoCircleCrossing

/-!
# Section 3 endpoint `N8h/N8i` same-cap obstructions

This file formalizes the two startable same-cap `(1,1,1,1)` leaves assigned to
W9:

* `N8h`: endpoint-Moser same-cap obstruction, via the existing two-circle
  crossing kernel.
* `N8i`: cap-center same-cap obstruction, via the existing chord-length /
  arc-angle equality bridge.

W7's shared N8 vocabulary is not available in this worktree yet, so this file
packages the minimum shell-facing interfaces locally.  The theorem names are the
W10 consumer targets; the packet shapes are the default `{{NEEDS_ADAM_INPUT}}`
choices from the W9 spec.
-/

open scoped EuclideanGeometry
open EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- Provisional W9 default: the selected same-cap `(1,1,1,1)` packet records the
apex-centered selected radius for the non-Moser point `x`.  This is the minimal
shared shell export used by both `N8h` and `N8i` until W7's vocabulary lands. -/
structure N8SameCapClassPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (x : ℝ²) (i : Fin 3) where
  center : ℝ²
  radius : ℝ
  radius_pos : 0 < radius
  x_on_selected_circle : dist x center = radius

/-- Provisional W9 default for `N8h`: the endpoint-Moser branch is packaged as a
two-circle configuration.  The selected same-cap circle and the adjacent-cap
circle share the spent endpoint and one outside point; a required strict-interior
adjacent witness would be a third common point, impossible by the two-circle
kernel. -/
structure N8hEndpointMoserPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {hN4e : S.N4eCapContainment}
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i) where
  /-- Center of the apex-selected circle (should be `x` in the W10 construction). -/
  selectedCenter : ℝ²
  selectedRadius : ℝ
  selectedRadius_pos : 0 < selectedRadius
  adjacentCenter : ℝ²
  adjacentRadius : ℝ
  sharedEndpoint : ℝ²
  outsidePoint : ℝ²
  adjacentWitness : ℝ²
  circles_ne : (⟨selectedCenter, selectedRadius⟩ : Sphere ℝ²) ≠
    ⟨adjacentCenter, adjacentRadius⟩
  shared_ne_outside : sharedEndpoint ≠ outsidePoint
  shared_on_selected : dist sharedEndpoint selectedCenter = selectedRadius
  shared_on_adjacent : dist sharedEndpoint adjacentCenter = adjacentRadius
  outside_on_selected : dist outsidePoint selectedCenter = selectedRadius
  outside_on_adjacent : dist outsidePoint adjacentCenter = adjacentRadius
  witness_on_selected : dist adjacentWitness selectedCenter = selectedRadius
  witness_on_adjacent : dist adjacentWitness adjacentCenter = adjacentRadius
  witness_ne_shared : adjacentWitness ≠ sharedEndpoint
  witness_ne_outside : adjacentWitness ≠ outsidePoint

/-- Provisional W9 default for `N8i`: the cap-center branch is packaged against a
full-width reference point on the same apex-centered circle.  Equal chord lengths
force the same absolute arc-angle difference, but the open-cap witness bound says
the same-cap mate is strictly short of the full `π/3` width. -/
structure N8iCapCenterPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {hN4e : S.N4eCapContainment}
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i) where
  sameCapMate : ℝ²
  fullWidthPoint : ℝ²
  mate_on_selected_circle : dist sameCapMate hx.center = hx.radius
  ref_on_selected_circle : dist fullWidthPoint hx.center = hx.radius
  x_mate_eq_radius : dist x sameCapMate = hx.radius
  x_ref_eq_radius : dist x fullWidthPoint = hx.radius
  mate_open_width :
    |(arcAngle hx.center x - arcAngle hx.center sameCapMate).toReal| <
      Real.pi / 3
  ref_full_width :
    |(arcAngle hx.center x - arcAngle hx.center fullWidthPoint).toReal| =
      Real.pi / 3

/-- Default `{{NEEDS_ADAM_INPUT}}` shape for W9/D1.  The proof is the pinned
two-circle calculation: once the same-cap mate is forced to the endpoint mirror,
the adjacent-cap witness would be a forbidden third common point of two distinct
circles. -/
theorem N8h_endpoint_moser_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i)
    (hEndpointMoser : S.N8hEndpointMoserPacket hx) :
    False := by
  rcases
      two_circle_common_point_eq_endpoint
        (s₁ := ⟨hEndpointMoser.selectedCenter, hEndpointMoser.selectedRadius⟩)
        (s₂ := ⟨hEndpointMoser.adjacentCenter, hEndpointMoser.adjacentRadius⟩)
        hEndpointMoser.circles_ne
        hEndpointMoser.shared_ne_outside
        (mem_sphere.mpr hEndpointMoser.shared_on_selected)
        (mem_sphere.mpr hEndpointMoser.outside_on_selected)
        (mem_sphere.mpr hEndpointMoser.shared_on_adjacent)
        (mem_sphere.mpr hEndpointMoser.outside_on_adjacent)
        (mem_sphere.mpr hEndpointMoser.witness_on_selected)
        (mem_sphere.mpr hEndpointMoser.witness_on_adjacent) with h | h
  · exact hEndpointMoser.witness_ne_shared h
  · exact hEndpointMoser.witness_ne_outside h

/-- Default `{{NEEDS_ADAM_INPUT}}` shape for W9/D2.  The proof is the pinned
chord-length calculation: equal-radius / equal-chord data force the same
absolute arc-angle as a full-width reference chord, contradicting the strict
open-cap width bound. -/
theorem N8i_capcenter_fullwidth_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : S.N8SameCapClassPacket hN4e x i)
    (hCapCenterMoser : S.N8iCapCenterPacket hx) :
    False := by
  have hsameWidth :
      |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.sameCapMate).toReal| =
        |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.fullWidthPoint).toReal| := by
    apply
      (arcAngle_chord_length_eq_iff
        hx.center hx.radius hx.radius_pos
        x hCapCenterMoser.sameCapMate hCapCenterMoser.fullWidthPoint
        hx.x_on_selected_circle
        hCapCenterMoser.mate_on_selected_circle
        hCapCenterMoser.ref_on_selected_circle).mp
    calc
      dist x hCapCenterMoser.sameCapMate = hx.radius := hCapCenterMoser.x_mate_eq_radius
      _ = dist x hCapCenterMoser.fullWidthPoint := hCapCenterMoser.x_ref_eq_radius.symm
  have hfull :
      |(arcAngle hx.center x - arcAngle hx.center hCapCenterMoser.sameCapMate).toReal| =
        Real.pi / 3 := by
    exact hsameWidth.trans hCapCenterMoser.ref_full_width
  linarith [hCapCenterMoser.mate_open_width, hfull, Real.pi_pos]

end FiniteEndpointShell

end Problem97
