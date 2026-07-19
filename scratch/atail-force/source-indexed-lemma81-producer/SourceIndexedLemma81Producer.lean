/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderBridge

/-!
# Scratch: source-indexed Lemma 81 producer boundary

This file records the smallest source-faithful specialization of the five-point
circle-isosceles obstruction to one repeated fiber of a `CriticalShellSystem`.

It is a source draft only.  It has not been elaborated because production Lean
and Lake builds are paused while the separate `ShellCurvature` lane is active.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSourceIndexedLemma81ProducerScratch

open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- The first missing positive incidence after choosing a repeated blocker fiber.

The repeated fiber is centered at its common blocker `Z`.  Its two sources are
already members of the exact `Z`-row.  The critical row sourced by `Z` is centered
at `W := H.centerAt Z`; it already contains `Z`.  A return hit says that at least
one of the two fiber sources also belongs to this `W`-row. -/
def FiberParentReturnHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (fiber : FrontierCommonDeletionCriticalFiber R) : Prop :=
  fiber.source₁.1 ∈
      (H.selectedAt
        (H.centerAt fiber.source₁.1 fiber.source₁.2)
        fiber.commonBlocker_mem_A).toCriticalFourShell.support ∨
    fiber.source₂.1 ∈
      (H.selectedAt
        (H.centerAt fiber.source₁.1 fiber.source₁.2)
        fiber.commonBlocker_mem_A).toCriticalFourShell.support

/-- Exact source-indexed Lemma 81 occurrence.

Write `Z` for the repeated fiber's common blocker and `W` for the blocker selected
at source `Z`.  The fiber supplies `P,X` in the `Z`-row.  Source membership supplies
`Z` in the `W`-row.  Thus the only non-definitional row membership below is
`X_mem_parentShell`; the remaining load-bearing data is the five-role cyclic order. -/
structure CriticalFiberLemma81Occurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (fiber : FrontierCommonDeletionCriticalFiber R) : Type where
  roleP : ℝ²
  roleX : ℝ²
  fiber_orientation : IsFiberOrientation fiber roleP roleX
  X_mem_parentShell :
    roleX ∈
      (H.selectedAt
        (H.centerAt fiber.source₁.1 fiber.source₁.2)
        fiber.commonBlocker_mem_A).toCriticalFourShell.support
  roleF : ℝ²
  F_mem_parentShell :
    roleF ∈
      (H.selectedAt
        (H.centerAt fiber.source₁.1 fiber.source₁.2)
        fiber.commonBlocker_mem_A).toCriticalFourShell.support
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iW : Fin D.A.card
  iF : Fin D.A.card
  iP : Fin D.A.card
  iX : Fin D.A.card
  iZ : Fin D.A.card
  hWF : iW < iF
  hFP : iF < iP
  hPX : iP < iX
  hXZ : iX < iZ
  boundary_W :
    boundary iW =
      H.centerAt
        (H.centerAt fiber.source₁.1 fiber.source₁.2)
        fiber.commonBlocker_mem_A
  boundary_F : boundary iF = roleF
  boundary_P : boundary iP = roleP
  boundary_X : boundary iX = roleX
  boundary_Z :
    boundary iZ = H.centerAt fiber.source₁.1 fiber.source₁.2

namespace CriticalFiberLemma81Occurrence

/-- The source-indexed occurrence is consumed directly by the checked Lemma 81
metric obstruction and the checked convex-boundary crossing bridge. -/
theorem false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {fiber : FrontierCommonDeletionCriticalFiber R}
    (Q : CriticalFiberLemma81Occurrence fiber) : False := by
  let Z := H.centerAt fiber.source₁.1 fiber.source₁.2
  let W := H.centerAt Z fiber.commonBlocker_mem_A
  let Wrow :=
    (H.selectedAt Z fiber.commonBlocker_mem_A).toCriticalFourShell
  let Zrow :=
    (H.selectedAt fiber.source₁.1 fiber.source₁.2).toCriticalFourShell
  have hP_mem_Zrow : Q.roleP ∈ Zrow.support := by
    rcases Q.fiber_orientation with h | h
    · rw [h.1]
      exact Zrow.q_mem_support
    · rw [h.1]
      exact fiber.source₂_mem_commonSupport
  have hX_mem_Zrow : Q.roleX ∈ Zrow.support := by
    rcases Q.fiber_orientation with h | h
    · rw [h.2]
      exact fiber.source₂_mem_commonSupport
    · rw [h.2]
      exact Zrow.q_mem_support
  have hZ_mem_Wrow : Z ∈ Wrow.support := Wrow.q_mem_support
  have hWF_WX : dist W Q.roleF = dist W Q.roleX :=
    (Wrow.support_eq_radius Q.roleF Q.F_mem_parentShell).trans
      (Wrow.support_eq_radius Q.roleX Q.X_mem_parentShell).symm
  have hWF_WZ : dist W Q.roleF = dist W Z :=
    (Wrow.support_eq_radius Q.roleF Q.F_mem_parentShell).trans
      (Wrow.support_eq_radius Z hZ_mem_Wrow).symm
  have hPZ_XZ : dist Q.roleP Z = dist Q.roleX Z := by
    simpa only [dist_comm] using
      (Zrow.support_eq_radius Q.roleP hP_mem_Zrow).trans
        (Zrow.support_eq_radius Q.roleX hX_mem_Zrow).symm
  have hiFZ : Q.iF < Q.iZ := Q.hFP.trans (Q.hPX.trans Q.hXZ)
  have hiFX : Q.iF < Q.iX := Q.hFP.trans Q.hPX
  have hFZ : Q.roleF ≠ Z := by
    intro h
    apply (ne_of_lt hiFZ)
    apply Q.boundary_injective
    calc
      Q.boundary Q.iF = Q.roleF := Q.boundary_F
      _ = Z := h
      _ = Q.boundary Q.iZ := Q.boundary_Z.symm
  have hPX : Q.roleP ≠ Q.roleX := by
    intro h
    apply (ne_of_lt Q.hPX)
    apply Q.boundary_injective
    calc
      Q.boundary Q.iP = Q.roleP := Q.boundary_P
      _ = Q.roleX := h
      _ = Q.boundary Q.iX := Q.boundary_X.symm
  have hXZ : Q.roleX ≠ Z := by
    intro h
    apply (ne_of_lt Q.hXZ)
    apply Q.boundary_injective
    calc
      Q.boundary Q.iX = Q.roleX := Q.boundary_X
      _ = Z := h
      _ = Q.boundary Q.iZ := Q.boundary_Z.symm
  have hWFZ : signedArea2 W Q.roleF Z < 0 := by
    have harea := hneg_of_ccw Q.boundary_injective Q.boundary_ccw Q.hWF hiFZ
    simpa only [Q.boundary_W, Q.boundary_F, Q.boundary_Z, W, Z] using harea
  have hFXZ : signedArea2 Q.roleF Q.roleX Z < 0 := by
    have harea := hneg_of_ccw Q.boundary_injective Q.boundary_ccw hiFX Q.hXZ
    simpa only [Q.boundary_F, Q.boundary_X, Q.boundary_Z, Z] using harea
  have hside :
      signedArea2 W Q.roleF Z * signedArea2 Q.roleX Q.roleF Z < 0 := by
    have hswap :
        signedArea2 Q.roleX Q.roleF Z = -signedArea2 Q.roleF Q.roleX Z := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact mul_neg_of_neg_of_pos hWFZ (neg_pos.mpr hFXZ)
  obtain ⟨q, hqFX, hqPZ⟩ :=
    CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
      D.convex Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.hFP Q.hPX Q.hXZ
  apply Census554.FivePointCircleIsoscelesOrderCore.metric_order_incompatibility
    hFZ hPX hXZ hWF_WX hWF_WZ hPZ_XZ hside
  exact ⟨q,
    by simpa only [Q.boundary_F, Q.boundary_X] using hqFX,
    by simpa only [Q.boundary_P, Q.boundary_Z, Z] using hqPZ⟩

end CriticalFiberLemma81Occurrence
end ATailSourceIndexedLemma81ProducerScratch
end Problem97
