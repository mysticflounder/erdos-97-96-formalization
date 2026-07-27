/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four rigid `2+2+1`: source-equals-u other-arm geometry

This file extracts the strongest common-boundary geometry retained by the
`vHeavy` and `exceptional` constructors of
`ExactFourRigid221SourceEqUTerminal`.

The `vHeavy` extraction puts both actual blockers and both named row pairs on
one counterclockwise boundary cut at the physical apex.  The exceptional
extraction orients the source blocker relative to the strict cap.
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

/-- The `vHeavy` arm on the same apex-cut boundary already carried by the
source-row terminal.  In particular, this is not a pair of unrelated cyclic
enumerations: both strict-between conclusions use `boundary`. -/
def ExactFourRigid221SourceEqUVHeavyCommonBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source v : CarrierVertex D.A)
    (xu xv : ℝ²) : Prop :=
  ∃ (card_pos : 0 < D.A.card)
      (boundary : Fin D.A.card → ℝ²)
      (source_blocker_index source_index xu_index : Fin D.A.card)
      (v_blocker_index v_index xv_index : Fin D.A.card),
    Function.Injective boundary ∧
    Finset.univ.image boundary = D.A ∧
    EuclideanGeometry.IsCcwConvexPolygon boundary ∧
    boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
    boundary source_blocker_index =
      (lateFirstApexSystem R).centerAt source.1 source.2 ∧
    boundary source_index = source.1 ∧
    boundary xu_index = xu ∧
    ((source_index < source_blocker_index ∧
        source_blocker_index < xu_index) ∨
      (xu_index < source_blocker_index ∧
        source_blocker_index < source_index)) ∧
    boundary v_blocker_index =
      (lateFirstApexSystem R).centerAt v.1 v.2 ∧
    boundary v_index = v.1 ∧
    boundary xv_index = xv ∧
    ((v_index < v_blocker_index ∧ v_blocker_index < xv_index) ∨
      (xv_index < v_blocker_index ∧ v_blocker_index < v_index)) ∧
    v.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
    xv ∈ SelectedClass D.A S.oppApex2 rho ∧
    ({v.1, xv} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 = {v.1, xv} ∧
    (lateFirstApexSystem R).centerAt v.1 v.2 ∈
      S.capInteriorByIndex S.oppIndex2 ∧
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 = {v.1, xv}

/-- If two distinct centers see the same pair at equal distances, then after
cutting a strictly convex boundary at the first center, the second center lies
strictly between the pair. -/
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

/-- The `vHeavy` constructor yields simultaneous strict-between conclusions
for the source row and the `v` row on one common boundary. -/
theorem exactFourRigid221_sourceEqU_vHeavy_commonBoundary
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
    (pair_interior :
      ({v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 = {v.1, xv})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {v.1, xv}) :
    ExactFourRigid221SourceEqUVHeavyCommonBoundary
      R rho source v xu xv := by
  classical
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 rho
  rcases T.boundary_order with
    ⟨hcard, boundary, sourceBlockerIndex, sourceIndex, xuIndex,
      hinj, himage, hccw, hzero, hsourceBlocker, hsource, hxu,
      hsourceBetween⟩
  have hvClass : v.1 ∈ C := by
    change v.1 ∈ SelectedClass D.A S.oppApex2 rho
    rw [T.named_rows.physical_class]
    simp
  have hxvClass : xv ∈ C := by
    change xv ∈ SelectedClass D.A S.oppApex2 rho
    rw [T.named_rows.physical_class]
    simp
  have hxvA : xv ∈ D.A := (mem_selectedClass.mp hxvClass).1
  have hblockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa using jointDeletion.vPacket.center₁_mem_A
  have hvImage : v.1 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact v.2
  have hxvImage : xv ∈ Finset.univ.image boundary := by
    rw [himage]
    exact hxvA
  have hblockerImage :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈
        Finset.univ.image boundary := by
    rw [himage]
    exact hblockerA
  rcases Finset.mem_image.mp hvImage with
    ⟨vIndex, -, hvBoundary⟩
  rcases Finset.mem_image.mp hxvImage with
    ⟨xvIndex, -, hxvBoundary⟩
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
  have hblockerEq :
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) v.1 =
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) xv :=
    (Kv.support_eq_radius v.1 hvSupport).trans
      (Kv.support_eq_radius xv hxvSupport).symm
  have hvBetween :
      (vIndex < vBlockerIndex ∧ vBlockerIndex < xvIndex) ∨
        (xvIndex < vBlockerIndex ∧ vBlockerIndex < vIndex) := by
    apply commonBisector_secondCenter_between_of_ccw
      D.convex hinj himage hccw hcard hzero hblockerBoundary
        hvBoundary hxvBoundary
    · simpa using jointDeletion.vPacket.centers_ne
    · exact hvNeApex
    · exact hxvNeApex
    · exact hblockerNeV
    · exact hblockerNeXv
    · exact hvNeXv
    · exact hphysicalEq
    · exact hblockerEq
  exact
    ⟨hcard, boundary, sourceBlockerIndex, sourceIndex, xuIndex,
      vBlockerIndex, vIndex, xvIndex, hinj, himage, hccw, hzero,
      hsourceBlocker, hsource, hxu, hsourceBetween, hblockerBoundary,
      hvBoundary, hxvBoundary, hvBetween, hvClass, hxvClass, pair_interior,
      blocker_interior, row_cap_trace⟩

/-- In the exceptional arm, the source blocker is either in the strict cap or
is exactly the unique outside point of the named `v` pair.  This is the exact
orientation available from the retained terminal packet. -/
inductive ExactFourRigid221SourceEqUExceptionalBlockerSideAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (xv : ℝ²) : Prop
  | interior
      (blocker_mem :
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          S.capInteriorByIndex S.oppIndex2)
  | vOutside
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = v.1)
      (v_not_mem :
        v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_mem :
        xv ∈ S.capInteriorByIndex S.oppIndex2)
  | xvOutside
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = xv)
      (xv_not_mem :
        xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_mem :
        v.1 ∈ S.capInteriorByIndex S.oppIndex2)

/-- The source-blocker placement and exceptional pair orientation give the
complete blocker-side classification. -/
theorem exactFourRigid221_sourceEqU_exceptional_blockerSide
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
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R rho source other source v jointDeletion G xu xv) :
    ExactFourRigid221SourceEqUExceptionalBlockerSideAt
      R rho source v jointDeletion xv := by
  rcases T.source_blocker_placement with hd | hv | hxv
  · exact .interior (by
      simpa [hd] using packet.deleted_mem_interior)
  · rcases packet.v_interior_trace with hinside | houtside
    · exact .interior (by simpa [hv] using hinside.1)
    · exact .vOutside hv houtside.1 houtside.2.1
  · rcases packet.v_interior_trace with hinside | houtside
    · exact .xvOutside hxv hinside.2.1 hinside.1
    · exact .interior (by simpa [hxv] using houtside.2.1)

/-- The fully normalized exceptional residual retained by the terminal:
source is the unique strict-interior member of its named row, its blocker has
the exact side classification above, and its strict-between boundary order is
preserved. -/
def ExactFourRigid221SourceEqUExceptionalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²) : Prop :=
  ExactFourRigid221PhysicalFiveExceptionalArm
      R rho source other source v jointDeletion G xu xv ∧
    ExactFourRigid221SourceEqUExceptionalBlockerSideAt
        R rho source v jointDeletion xv ∧
    ExactFourRigid221SourceEqUBoundaryOrder R source xu ∧
    ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support ∩
      (SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2) = {source.1}

/-- The exceptional constructor of the source-equals-u terminal yields the
normalized exceptional residual without any further case assumptions. -/
theorem exactFourRigid221_sourceEqU_exceptional_residual
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
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R rho source other source v jointDeletion G xu xv) :
    ExactFourRigid221SourceEqUExceptionalResidual
      R rho source other v jointDeletion G xu xv := by
  classical
  have horientation :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∉ S.capInteriorByIndex S.oppIndex2 := by
    rcases packet.contextual_trace with hsource | hnotSource
    · exact ⟨hsource.2.1, hsource.2.2.1⟩
    · exact (hnotSource.1 rfl).elim
  have hsourceRow :
      ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2) = {source.1} := by
    rw [← Finset.inter_assoc, T.named_rows.u_row_trace]
    simp [horientation.1, horientation.2]
  exact
    ⟨packet,
      exactFourRigid221_sourceEqU_exceptional_blockerSide T packet,
      T.boundary_order, hsourceRow⟩

/-- The raw data of the `uHeavy` constructor, retained here only so the
strengthened cap-shape decomposition below is exhaustive. -/
def ExactFourRigid221SourceEqUUHeavyGeometry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (source : CarrierVertex D.A) (xu : ℝ²) : Prop :=
  ({source.1, xu} : Finset ℝ²) ∩
      S.capInteriorByIndex S.oppIndex2 = {source.1, xu} ∧
  (lateFirstApexSystem R).centerAt source.1 source.2 ∈
      S.capInteriorByIndex S.oppIndex2 ∧
  ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support ∩
    S.capByIndex S.oppIndex2 = {source.1, xu}

/-- The exact two other-arm residuals after restoring the full producer's
physical-apex equality.  This is the stable input boundary for a genuine
other-arm closer. -/
def ExactFourRigid221SourceEqUOtherArmsApexResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²) : Prop :=
  (G.center = S.oppApex2 ∧
      ExactFourRigid221SourceEqUVHeavyCommonBoundary
        R rho source v xu xv) ∨
    (G.center = S.oppApex2 ∧
      ExactFourRigid221SourceEqUExceptionalResidual
        R rho source other v jointDeletion G xu xv)

/-- The terminal's cap-shape split strengthened by the common-boundary
`vHeavy` theorem and the exceptional blocker-side normalization. -/
theorem exactFourRigid221_sourceEqU_strengthened_capShape
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
    (hcenter : G.center = S.oppApex2) :
    ExactFourRigid221SourceEqUUHeavyGeometry R source xu ∨
      ExactFourRigid221SourceEqUOtherArmsApexResidual
        R rho source other v jointDeletion G xu xv := by
  cases T.cap_shape with
  | uHeavy pair_interior blocker_interior row_cap_trace =>
      exact Or.inl ⟨pair_interior, blocker_interior, row_cap_trace⟩
  | vHeavy pair_interior blocker_interior row_cap_trace =>
      exact Or.inr (Or.inl
      ⟨hcenter,
        exactFourRigid221_sourceEqU_vHeavy_commonBoundary
          T pair_interior blocker_interior row_cap_trace⟩)
  | exceptional packet =>
      exact Or.inr (Or.inr
      ⟨hcenter,
        exactFourRigid221_sourceEqU_exceptional_residual
          T packet⟩)

/-- `PARKED-SPEC`: this is the precise geometric fact still needed to close
the two non-`uHeavy` constructors.  It is intentionally a proposition-valued
specification, not an active proof obligation and not evidence of closure. -/
def ExactFourRigid221SourceEqUOtherArmsApexExclusionSpec
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²) : Prop :=
  ¬ ExactFourRigid221SourceEqUOtherArmsApexResidual
      R rho source other v jointDeletion G xu xv

#print axioms exactFourRigid221_sourceEqU_vHeavy_commonBoundary
#print axioms exactFourRigid221_sourceEqU_exceptional_blockerSide
#print axioms exactFourRigid221_sourceEqU_exceptional_residual
#print axioms exactFourRigid221_sourceEqU_strengthened_capShape

end ATailFrontierLiveClosure
end Problem97
