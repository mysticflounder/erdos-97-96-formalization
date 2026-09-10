/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.Atoms
import Erdos9796Proof.P97.Census554.SeparationGeometry

/-!
# Canonical exact-five common-shell packet

The four v7 instances differ only in the surplus-cap shell label (`2` or `3`)
and the remaining outer shell label (`0` or `9`).  This packet exposes that
finite case and one encoder-selected geometric boundary order.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.SeparationCore

-- The enum `Fintype` derive handler needs this under Lean 4.33, as in
-- `MathlibTest/DeriveFintype.lean`.
set_option backward.isDefEq.respectTransparency false in
/-- Exact-five common-shell V7 inductive. -/
inductive SurplusShellChoice
  | labelTwo
  | labelThree
deriving DecidableEq, Fintype

-- The enum `Fintype` derive handler needs this under Lean 4.33, as in
-- `MathlibTest/DeriveFintype.lean`.
set_option backward.isDefEq.respectTransparency false in
/-- Exact-five common-shell V7 inductive. -/
inductive OtherShellChoice
  | labelZero
  | labelNine
deriving DecidableEq, Fintype

/-- Exact-five common-shell V7 structure. -/
structure ShellCase where
  surplus : SurplusShellChoice
  other : OtherShellChoice
deriving DecidableEq, Fintype

/-- Exact-five common-shell V7 def. -/
def SurplusShellChoice.label : SurplusShellChoice → Label
  | .labelTwo => 2
  | .labelThree => 3

/-- Exact-five common-shell V7 def. -/
def OtherShellChoice.label : OtherShellChoice → Label
  | .labelZero => 0
  | .labelNine => 9

/-- Exact-five common-shell V7 def. -/
def ShellCase.support (c : ShellCase) : Finset Label :=
  {c.other.label, c.surplus.label, 6, 7, 8}

/-- Exact-five common-shell V7 theorem. -/
theorem ShellCase.support_cases (c : ShellCase) :
    c.support = ({0, 2, 6, 7, 8} : Finset Label) ∨
    c.support = ({9, 2, 6, 7, 8} : Finset Label) ∨
    c.support = ({0, 3, 6, 7, 8} : Finset Label) ∨
    c.support = ({9, 3, 6, 7, 8} : Finset Label) := by
  cases c with
  | mk surplus other =>
      cases surplus <;> cases other <;>
        simp [ShellCase.support, SurplusShellChoice.label,
          OtherShellChoice.label]

/-- Exact-five common-shell V7 theorem. -/
theorem exists_shellCase_of_support_cases (T : Finset Label)
    (h :
      T = ({0, 2, 6, 7, 8} : Finset Label) ∨
      T = ({9, 2, 6, 7, 8} : Finset Label) ∨
      T = ({0, 3, 6, 7, 8} : Finset Label) ∨
      T = ({9, 3, 6, 7, 8} : Finset Label)) :
    ∃ c : ShellCase, T = c.support := by
  rcases h with h | h | h | h
  · exact ⟨⟨.labelTwo, .labelZero⟩, by
      simpa [ShellCase.support, SurplusShellChoice.label,
        OtherShellChoice.label] using h⟩
  · exact ⟨⟨.labelTwo, .labelNine⟩, by
      simpa [ShellCase.support, SurplusShellChoice.label,
        OtherShellChoice.label] using h⟩
  · exact ⟨⟨.labelThree, .labelZero⟩, by
      simpa [ShellCase.support, SurplusShellChoice.label,
        OtherShellChoice.label] using h⟩
  · exact ⟨⟨.labelThree, .labelNine⟩, by
      simpa [ShellCase.support, SurplusShellChoice.label,
        OtherShellChoice.label] using h⟩

/-- One selected encoder order together with the CCW boundary that realizes
it. -/
structure SelectedBoundaryOrder (pointOf : Label → ℝ²) where
  selector : Fin 144
  boundary : Label → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  point_eq : ∀ label,
    boundary (selectorIndexEquiv selector label) = pointOf label

/-- Exact-five common-shell V7 def. -/
noncomputable def SelectedBoundaryOrder.ofDirect {pointOf : Label → ℝ²}
    (L : Card11MacroCcwLabeling pointOf) :
    SelectedBoundaryOrder pointOf where
  selector := directSelector L.order
  boundary := L.boundary
  boundary_injective := L.boundary_injective
  boundary_ccw := L.boundary_ccw
  point_eq label := by
    rw [selectorIndexEquiv_directSelector]
    exact L.point_eq label

/-- Exact-five common-shell V7 def. -/
noncomputable def SelectedBoundaryOrder.ofMirror {pointOf : Label → ℝ²}
    (L : Card11MirrorMacroCcwLabeling pointOf) :
    SelectedBoundaryOrder pointOf where
  selector := mirrorSelector L.order
  boundary := L.boundary
  boundary_injective := L.boundary_injective
  boundary_ccw := L.boundary_ccw
  point_eq label := by
    rw [selectorIndexEquiv_mirrorSelector]
    exact L.point_eq label

/-- Exact-five common-shell V7 def. -/
noncomputable def SelectedBoundaryOrder.ofDirectOrMirror {pointOf : Label → ℝ²} :
    Card11DirectOrMirrorCcwLabeling pointOf →
      SelectedBoundaryOrder pointOf
  | .direct L => .ofDirect L
  | .mirror L => .ofMirror L

/-- The finite data common to all four exact-five shell instances.  The exact
metric shell itself is represented by `shellLabels`; the equality field makes
the four-case split explicit rather than hiding it in prose. -/
structure CanonicalPacket
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) where
  cube : Card11SelectedCube L
  shellCase : ShellCase
  shellLabels : Finset Label
  shellLabels_eq : shellLabels = shellCase.support
  shellRadius : ℝ
  shellRadius_pos : 0 < shellRadius
  shellLabels_iff_radius : ∀ label,
    label ∈ shellLabels ↔
      dist (L.pointOf label) (L.pointOf 1) = shellRadius
  selectedAtOne_subset : cube.cube 1 ⊆ shellLabels
  boundaryOrder : SelectedBoundaryOrder L.pointOf

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.ShellCase.support_cases
#print axioms Problem97.ExactFiveCommonShellV7.exists_shellCase_of_support_cases
