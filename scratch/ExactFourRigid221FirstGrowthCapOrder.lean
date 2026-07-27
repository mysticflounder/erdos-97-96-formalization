/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Boundary order in the exact-five first-growth source-heavy leaf

The live packet does determine one exact cyclic-order fact.  Cut a CCW
enumeration of the carrier at the physical second apex.  Since that apex and
the actual source blocker are distinct common perpendicular-bisector points
of the source-row pair, strict Kalmanson inequalities force the blocker to lie
between the two row points.

Thus the cap-order data do not by themselves give a Kalmanson contradiction:
they give the alternating order.  The final theorem records the exact
additional (non-alternation) bridge that would close the production leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem commonBisector_secondCenter_between_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hcard : 0 < A.card)
    {p b x y : ℝ²} {ib ix iy : Fin A.card}
    (hp : boundary (⟨0, hcard⟩ : Fin A.card) = p)
    (hb : boundary ib = b)
    (hx : boundary ix = x)
    (hy : boundary iy = y)
    (hbp : b ≠ p)
    (hxp : x ≠ p)
    (hyp : y ≠ p)
    (hbx : b ≠ x)
    (hby : b ≠ y)
    (hxy : x ≠ y)
    (hpEq : dist p x = dist p y)
    (hbEq : dist b x = dist b y) :
    (ix < ib ∧ ib < iy) ∨ (iy < ib ∧ ib < ix) := by
  let izero : Fin A.card := ⟨0, hcard⟩
  have hib0 : ib ≠ izero := by
    intro h
    apply hbp
    calc
      b = boundary ib := hb.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hix0 : ix ≠ izero := by
    intro h
    apply hxp
    calc
      x = boundary ix := hx.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hiy0 : iy ≠ izero := by
    intro h
    apply hyp
    calc
      y = boundary iy := hy.symm
      _ = boundary izero := congrArg boundary h
      _ = p := hp
  have hibix : ib ≠ ix := by
    intro h
    apply hbx
    calc
      b = boundary ib := hb.symm
      _ = boundary ix := congrArg boundary h
      _ = x := hx
  have hibiy : ib ≠ iy := by
    intro h
    apply hby
    calc
      b = boundary ib := hb.symm
      _ = boundary iy := congrArg boundary h
      _ = y := hy
  have hixiy : ix ≠ iy := by
    intro h
    apply hxy
    calc
      x = boundary ix := hx.symm
      _ = boundary iy := congrArg boundary h
      _ = y := hy
  have hibpos : 0 < ib.val := by
    by_contra h
    apply hib0
    apply Fin.ext
    simp [izero]
    omega
  have hixpos : 0 < ix.val := by
    by_contra h
    apply hix0
    apply Fin.ext
    simp [izero]
    omega
  have hiypos : 0 < iy.val := by
    by_contra h
    apply hiy0
    apply Fin.ext
    simp [izero]
    omega
  have horders :
      (ib < ix ∧ ix < iy) ∨
      (ib < iy ∧ iy < ix) ∨
      (ix < ib ∧ ib < iy) ∨
      (iy < ib ∧ ib < ix) ∨
      (ix < iy ∧ iy < ib) ∨
      (iy < ix ∧ ix < ib) := by
    omega
  rcases horders with h | h | h | h | h | h
  · have hzero : izero < ib := hibpos
    have hstrict :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hb, hx, hy] at hstrict
    linarith
  · have hzero : izero < ib := hibpos
    have hstrict :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hb, hy, hx] at hstrict
    linarith
  · exact Or.inl h
  · exact Or.inr h
  · have hzero : izero < ix := hixpos
    have hstrict :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hx, hy, hb] at hstrict
    rw [dist_comm y b, dist_comm x b] at hstrict
    linarith
  · have hzero : izero < iy := hiypos
    have hstrict :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hinj himage hccw hzero h.1 h.2
    rw [hp, hy, hx, hb] at hstrict
    rw [dist_comm x b, dist_comm y b] at hstrict
    linarith

/-- The source-row order forced by the live first-growth packet. -/
def ExactFourRigid221FirstGrowthSourceAlternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
  (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    Prop :=
  ∃ (hcard : 0 < D.A.card)
      (boundary : Fin D.A.card → ℝ²)
      (blockerIndex uIndex xuIndex : Fin D.A.card),
    Function.Injective boundary ∧
    Finset.univ.image boundary = D.A ∧
    EuclideanGeometry.IsCcwConvexPolygon boundary ∧
    boundary (⟨0, hcard⟩ : Fin D.A.card) = S.oppApex2 ∧
    boundary blockerIndex = packet.xv ∧
    boundary uIndex = P.u.1 ∧
    boundary xuIndex = packet.xu ∧
    ((uIndex < blockerIndex ∧ blockerIndex < xuIndex) ∨
      (xuIndex < blockerIndex ∧ blockerIndex < uIndex))

/-- The current packet forces alternation, rather than the endpoint-center
order needed by the mixed selected-row/radius-class Kalmanson terminal. -/
theorem exactFourRigid221_firstGrowth_sourceAlternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W : ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet) :
    ExactFourRigid221FirstGrowthSourceAlternation P packet := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hxuRow : packet.xu ∈ Ku.support := by
    have hmem :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho =
          {P.u.1, packet.xu} by
        simpa [Ku] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hblocker :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [P.huSource] using packet.blocker_eq_xv
  have hblockerA : packet.xv ∈ D.A := by
    rw [← hblocker]
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex P.u).2
  have hapexA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxuA : packet.xu ∈ D.A :=
    (mem_selectedClass.mp hxuClass).1
  have hblockerNeApex : packet.xv ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hxvClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    exact (ne_of_gt P.hrho) hdist.symm
  have huNeApex : P.u.1 ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp P.huClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    exact (ne_of_gt P.hrho) hdist.symm
  have hxuNeApex : packet.xu ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hxuClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    exact (ne_of_gt P.hrho) hdist.symm
  have hblockerNeU : packet.xv ≠ P.u.1 := by
    intro h
    have hmemEq :
        (((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support)) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hblocker
    have hxv : packet.xv ∈ Ku.support := by
      simpa only [h] using Ku.q_mem_support
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hblockerNeXu : packet.xv ≠ packet.xu := by
    intro h
    have hmemEq :
        (((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support)) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hblocker
    have hxv : packet.xv ∈ Ku.support := by
      simpa only [h] using hxuRow
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hapexEq :
      dist S.oppApex2 P.u.1 =
        dist S.oppApex2 packet.xu :=
    (mem_selectedClass.mp P.huClass).2.trans
      (mem_selectedClass.mp hxuClass).2.symm
  have hblockerEq :
      dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hblocker]
    exact
      (Ku.support_eq_radius P.u.1 Ku.q_mem_support).trans
        (Ku.support_eq_radius packet.xu hxuRow).symm
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    not_collinear_of_K4 D.nonempty D.convex D.K4
  obtain ⟨c, hc⟩ :=
    exists_center_interior_convexHull_of_convexIndep_noncoll
      D.convex hnoncoll
  obtain ⟨phi, hphiInj, hphiImage, hphiSorted⟩ :=
    exists_cut_sorted_enumeration_of_convexIndep D.convex hc
  have hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi :=
    isCcwConvexPolygon_of_cut_sorted_arcAngle
      D.convex hc hphiInj hphiImage hphiSorted
  have hAcard : 0 < D.A.card := Finset.card_pos.mpr D.nonempty
  rcases
      exists_isCcwConvexPolygon_cyclicShift_at_zero
        hAcard hphiInj hphiImage hphiCcw hapexA with
    ⟨cut, hboundaryInj, hboundaryImage, hboundaryCcw, hboundaryZero⟩
  let boundary : Fin D.A.card → ℝ² := fun i ↦ phi (i + cut)
  have hblockerImage : packet.xv ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hblockerA
  have huImage : P.u.1 ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact P.u.2
  have hxuImage : packet.xu ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hxuA
  rcases Finset.mem_image.mp hblockerImage with
    ⟨ib, _hibUniv, hib⟩
  rcases Finset.mem_image.mp huImage with
    ⟨iu, _hiuUniv, hiu⟩
  rcases Finset.mem_image.mp hxuImage with
    ⟨ixu, _hixuUniv, hixu⟩
  have hbetween :
      (iu < ib ∧ ib < ixu) ∨
        (ixu < ib ∧ ib < iu) :=
    commonBisector_secondCenter_between_of_ccw
      D.convex
      (by simpa [boundary] using hboundaryInj)
      (by simpa [boundary] using hboundaryImage)
      (by simpa [boundary] using hboundaryCcw)
      hAcard
      (by simpa [boundary] using hboundaryZero)
      hib hiu hixu hblockerNeApex huNeApex hxuNeApex
      hblockerNeU hblockerNeXu packet.xu_ne_u.symm
      hapexEq hblockerEq
  exact
    ⟨hAcard, boundary, ib, iu, ixu,
      by simpa [boundary] using hboundaryInj,
      by simpa [boundary] using hboundaryImage,
      by simpa [boundary] using hboundaryCcw,
      by simpa [boundary] using hboundaryZero,
      hib, hiu, hixu, hbetween⟩

/-- Exact irreducible closure bridge: any theorem extracting non-alternation
of this source blocker from the remaining first-growth/global-deletion data
closes the live leaf immediately.  The current packet proves the opposite
order, so a shared-late-pair argument requires an additional selected row or
incidence fact, not another cap-membership rewrite. -/
theorem false_of_exactFourRigid221_firstGrowth_of_sourceNonalternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W : ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (sourceNonalternation :
      ¬ ExactFourRigid221FirstGrowthSourceAlternation P packet) :
    False := by
  exact sourceNonalternation
    (exactFourRigid221_firstGrowth_sourceAlternation P packet W)

/-- A concrete second-row bridge that would close the leaf through
`false_of_two_selected_rows_shared_late_pair`.

The live packet supplies the row at `packet.xv` and its two late points
`P.u.1, packet.xu`.  What is not present in the packet is the earlier row
`anchor`, its two shared incidences, and the compatible four-index order. -/
theorem false_of_exactFourRigid221_firstGrowth_of_sharedPairPredecessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W : ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (anchor : CarrierVertex D.A)
    (boundary : Fin D.A.card → ℝ²)
    (ia ib ic id : Fin D.A.card)
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = D.A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hia :
      boundary ia =
        (lateFirstApexSystem R).centerAt anchor.1 anchor.2)
    (hib : boundary ib = packet.xv)
    (hic : boundary ic = P.u.1)
    (hid : boundary id = packet.xu)
    (huAnchor :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          anchor.1 anchor.2).toCriticalFourShell.support)
    (hxuAnchor :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          anchor.1 anchor.2).toCriticalFourShell.support) :
    False := by
  let AShell :=
    ((lateFirstApexSystem R).selectedAt
      anchor.1 anchor.2).toCriticalFourShell
  let BShell :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hcenterB :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [P.huSource] using packet.blocker_eq_xv
  have huB : P.u.1 ∈ BShell.support := BShell.q_mem_support
  have hxuB : packet.xu ∈ BShell.support := by
    have hmem :
        packet.xu ∈ BShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show BShell.support ∩ SelectedClass D.A S.oppApex2 P.rho =
          {P.u.1, packet.xu} by
        simpa [BShell] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hAeq :
      dist (boundary ia) (boundary ic) =
        dist (boundary ia) (boundary id) := by
    rw [hia, hic, hid]
    exact
      (AShell.support_eq_radius _ huAnchor).trans
        (AShell.support_eq_radius _ hxuAnchor).symm
  have hBeq :
      dist (boundary ib) (boundary ic) =
        dist (boundary ib) (boundary id) := by
    rw [hib, hic, hid, ← hcenterB]
    exact
      (BShell.support_eq_radius _ huB).trans
        (BShell.support_eq_radius _ hxuB).symm
  have hstrict :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      D.convex hboundary_injective hboundary_image hboundary_ccw
      hiab hibc hicd
  linarith

end ATailFrontierLiveClosure
end Problem97
