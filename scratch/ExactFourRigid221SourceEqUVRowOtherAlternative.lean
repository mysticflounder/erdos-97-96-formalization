/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four rigid `2+2+1`: source-equals-`u`, blocker in the other `v`-row slot

This scratch file isolates the additional checked information supplied by the
production `blockerVRowOther` leaf.  In the named physical-five decomposition,
the actual source blocker is exactly the named companion `xv` of the `v` row.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The common apex-cut boundary forced by the `v`-row-other hypothesis.
The source blocker is the named point `xv`; the distinct `v`-row blocker is
strictly between `v` and that same point. -/
def ExactFourRigid221SourceEqUVRowOtherCommonBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (source v : CarrierVertex D.A) (xu xv : ℝ²) : Prop :=
  ∃ (card_pos : 0 < D.A.card)
      (boundary : Fin D.A.card → ℝ²)
      (source_blocker_index source_index xu_index : Fin D.A.card)
      (v_blocker_index v_index : Fin D.A.card),
    Function.Injective boundary ∧
    Finset.univ.image boundary = D.A ∧
    EuclideanGeometry.IsCcwConvexPolygon boundary ∧
    boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
    boundary source_blocker_index =
      (lateFirstApexSystem R).centerAt source.1 source.2 ∧
    boundary source_blocker_index = xv ∧
    boundary source_index = source.1 ∧
    boundary xu_index = xu ∧
    ((source_index < source_blocker_index ∧
        source_blocker_index < xu_index) ∨
      (xu_index < source_blocker_index ∧
        source_blocker_index < source_index)) ∧
    boundary v_blocker_index =
      (lateFirstApexSystem R).centerAt v.1 v.2 ∧
    boundary v_index = v.1 ∧
    ((v_index < v_blocker_index ∧
        v_blocker_index < source_blocker_index) ∨
      (source_blocker_index < v_blocker_index ∧
        v_blocker_index < v_index))

/-- Common-bisector order lemma copied from the checked source-equals-`u`
terminal argument. -/
private theorem vRowOther_commonBisector_secondCenter_between_of_ccw
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

/-- Once the source blocker is identified with `xv`, the two named rows give
two strict-between statements on the same boundary cut. -/
theorem exactFourRigid221_sourceEqU_vRowOther_commonBoundary_of_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v}
    {G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion}
    {xu xv : ℝ²}
    (T :
      ExactFourRigid221SourceEqUTerminal
        R rho source other v jointDeletion G xu xv)
    (hblockerEq :
      (lateFirstApexSystem R).centerAt source.1 source.2 = xv) :
    ExactFourRigid221SourceEqUVRowOtherCommonBoundary
      R source v xu xv := by
  classical
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 rho
  rcases T.boundary_order with
    ⟨hcard, boundary, sourceBlockerIndex, sourceIndex, xuIndex,
      hinj, himage, hccw, hzero, hsourceBlocker, hsource, hxu,
      hsourceBetween⟩
  have hxvBoundary : boundary sourceBlockerIndex = xv :=
    hsourceBlocker.trans hblockerEq
  have hvClass : v.1 ∈ C := by
    change v.1 ∈ SelectedClass D.A S.oppApex2 rho
    rw [T.named_rows.physical_class]
    simp
  have hxvClass : xv ∈ C := by
    change xv ∈ SelectedClass D.A S.oppApex2 rho
    rw [T.named_rows.physical_class]
    simp
  have hblockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa using jointDeletion.vPacket.center₁_mem_A
  have hvImage : v.1 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact v.2
  have hblockerImage :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈
        Finset.univ.image boundary := by
    rw [himage]
    exact hblockerA
  rcases Finset.mem_image.mp hvImage with
    ⟨vIndex, -, hvBoundary⟩
  rcases Finset.mem_image.mp hblockerImage with
    ⟨vBlockerIndex, -, hblockerBoundary⟩
  have hvSupport : v.1 ∈ Kv.support := by
    simpa [Kv] using Kv.q_mem_support
  have hxvSupport : xv ∈ Kv.support := by
    have hxvInter : xv ∈ Kv.support ∩ C := by
      rw [show Kv.support ∩ C = {v.1, xv} by
        simpa [Kv, C] using T.named_rows.v_row_trace]
      simp
    exact (Finset.mem_inter.mp hxvInter).1
  have hblockerNeV :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ v.1 := by
    intro h
    apply Kv.center_not_mem_support
    convert hvSupport using 1
  have hblockerNeXv :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ xv := by
    intro h
    apply Kv.center_not_mem_support
    convert hxvSupport using 1
  have hvNeXv : v.1 ≠ xv := T.named_rows.xv_ne_v.symm
  have hvNeApex : v.1 ≠ S.oppApex2 := by
    intro hvApex
    apply T.named_rows.xv_ne_v
    apply dist_eq_zero.mp
    calc
      dist xv v.1 = dist S.oppApex2 xv := by
        rw [hvApex, dist_comm]
      _ = rho := (mem_selectedClass.mp hxvClass).2
      _ = dist S.oppApex2 v.1 :=
        (mem_selectedClass.mp hvClass).2.symm
      _ = 0 := by rw [hvApex]; simp
  have hxvNeApex : xv ≠ S.oppApex2 := by
    intro hxvApex
    apply T.named_rows.xv_ne_v
    apply dist_eq_zero.mp
    calc
      dist xv v.1 = dist S.oppApex2 v.1 := by rw [hxvApex]
      _ = rho := (mem_selectedClass.mp hvClass).2
      _ = dist S.oppApex2 xv :=
        (mem_selectedClass.mp hxvClass).2.symm
      _ = 0 := by rw [hxvApex]; simp
  have hphysicalEq :
      dist S.oppApex2 v.1 = dist S.oppApex2 xv :=
    (mem_selectedClass.mp hvClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hblockerDistEq :
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) v.1 =
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) xv :=
    (Kv.support_eq_radius v.1 hvSupport).trans
      (Kv.support_eq_radius xv hxvSupport).symm
  have hvBetween :
      (vIndex < vBlockerIndex ∧
          vBlockerIndex < sourceBlockerIndex) ∨
        (sourceBlockerIndex < vBlockerIndex ∧
          vBlockerIndex < vIndex) := by
    apply vRowOther_commonBisector_secondCenter_between_of_ccw
      D.convex hinj himage hccw hcard hzero hblockerBoundary
        hvBoundary hxvBoundary
    · simpa using jointDeletion.vPacket.centers_ne
    · exact hvNeApex
    · exact hxvNeApex
    · exact hblockerNeV
    · exact hblockerNeXv
    · exact hvNeXv
    · exact hphysicalEq
    · exact hblockerDistEq
  exact
    ⟨hcard, boundary, sourceBlockerIndex, sourceIndex, xuIndex,
      vBlockerIndex, vIndex, hinj, himage, hccw, hzero,
      hsourceBlocker, hxvBoundary, hsource, hxu, hsourceBetween,
      hblockerBoundary, hvBoundary, hvBetween⟩

/-- Checked narrowing of the production `blockerVRowOther` leaf to the named
`xv` point in the source-equals-`u` terminal. -/
theorem exactFourRigid221_physicalApex_sourceEqU_blockerVRowOther_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv ∧
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv ∧
        ExactFourRigid221SourceEqUVRowOtherCommonBoundary
          R P.u P.v xu xv := by
  let contextU :
      ExactFourMutualOmissionSourceContext
        R P.rho P.u P.other P.u P.v :=
    P.huSource.symm ▸ P.context
  have hsourceBlockerClassU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        SelectedClass D.A S.oppApex2 P.rho := by
    rw [P.huSource]
    exact P.hsourceBlockerClass
  rcases
      exactFourRigid221_physicalApex_sourceEqUTerminal
        R P.hcard P.surface P.rho P.u P.other P.hrho P.hfive
          P.v P.huNeV P.huClass P.hvClass P.hvOmitted P.huOmitted
          contextU P.jointDeletion P.hclassFive P.globalDeletion
          P.hcenter hsourceBlockerClassU with
    ⟨xu, xv, terminal⟩
  have hblockerEqXv :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv := by
    have hblockerInVRow :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      hblockerVRow
    rw [terminal.named_rows.v_row_trace] at hblockerInVRow
    rcases Finset.mem_insert.mp hblockerInVRow with
      hblockerEqV | hblockerEqXv
    · exact (hblockerNeV hblockerEqV).elim
    · simpa using hblockerEqXv
  refine
    ⟨xu, xv, terminal, hblockerEqXv, ?_⟩
  apply
    exactFourRigid221_sourceEqU_vRowOther_commonBoundary_of_terminal
      terminal
  rw [P.huSource]
  exact hblockerEqXv

/-
The exact remaining closer is:

  (T : ExactFourRigid221SourceEqUTerminal
    R rho source other v jointDeletion G xu xv)
  (hblockerEq :
    (lateFirstApexSystem R).centerAt source.1 source.2 = xv) :
  False

The common-boundary order facts alone do not prove it.  For example, the
abstract index pattern

  source = 1 < xv = 2 < xu = 5
  xv = 2 < vBlocker = 3 < v = 4

satisfies both strict-between conclusions.  A valid closer therefore has to
consume additional information retained in `T.cap_shape` and/or the global
deletion packet; merely repeating the two named-row Kalmanson arguments
cannot close the leaf.
-/

#print axioms
  exactFourRigid221_physicalApex_sourceEqU_blockerVRowOther_terminal

end ATailFrontierLiveClosure
end Problem97
