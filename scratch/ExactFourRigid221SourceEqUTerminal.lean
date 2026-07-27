/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221ExceptionalArm
import scratch.ExactFourSourceBlockerGeometryMain

/-!
# Exact-four rigid `2+2+1`: the physical-apex `u = source` terminal

This file isolates the axiom-clean content of the physical-apex branch in
which the retained contextual source is `u` and its actual blocker belongs to
the physical five-class.

The remaining geometry is an explicit product of three blocker placements
(`deleted`, `v`, or `xv`) and three strict-cap shapes (`u`-heavy, `v`-heavy,
or the oriented exceptional arm).  In every case the source blocker is also
strictly between `u` and its named row companion on a convex-boundary cut at
the physical apex.  The source row additionally satisfies the checked
blocker-interior/unique-interior dichotomy.
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

/-- The three actual source-blocker locations left after imposing
`u = source` and membership in the rigid physical five-class. -/
inductive ExactFourRigid221SourceEqUBlockerPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (xv : ℝ²) : Prop
  | deleted
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1)
  | v
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = v.1)
  | xv
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = xv)

/-- The retained peer is likewise one of the singleton or the two named
`v`-row points.  Each constructor records the strict-interior membership
already supplied by the contextual source packet. -/
inductive ExactFourRigid221SourceEqUOtherPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (other source v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (xv : ℝ²) : Prop
  | deleted
      (other_eq : other = jointDeletion.deleted)
      (deleted_mem_interior :
        jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
  | v
      (other_eq : other = v)
      (v_mem_interior :
        v.1 ∈ S.capInteriorByIndex S.oppIndex2)
  | xv
      (other_point_eq : other.1 = xv)
      (xv_mem_interior :
        xv ∈ S.capInteriorByIndex S.oppIndex2)

/-- The exact three-way strict-cap split, with the exceptional arm already
oriented by the retained source context. -/
inductive ExactFourRigid221SourceEqUCapShape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²) : Prop
  | uHeavy
      (pair_interior :
        ({source.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {source.1, xu})
      (blocker_interior :
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          S.capInteriorByIndex S.oppIndex2)
      (row_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 = {source.1, xu})
  | vHeavy
      (pair_interior :
        ({v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {v.1, xv})
      (blocker_interior :
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈
          S.capInteriorByIndex S.oppIndex2)
      (row_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 = {v.1, xv})
  | exceptional
      (packet :
        ExactFourRigid221PhysicalFiveExceptionalArm
          R rho source other source v jointDeletion G xu xv)

/-- A global counterclockwise boundary cut at the physical apex on which the
actual source blocker occurs strictly between the two points of the source
row. -/
def ExactFourRigid221SourceEqUBoundaryOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (source : CarrierVertex D.A) (xu : ℝ²) : Prop :=
  ∃ (card_pos : 0 < D.A.card)
      (boundary : Fin D.A.card → ℝ²)
      (blocker_index source_index companion_index : Fin D.A.card),
    Function.Injective boundary ∧
    Finset.univ.image boundary = D.A ∧
    EuclideanGeometry.IsCcwConvexPolygon boundary ∧
    boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
    boundary blocker_index =
      (lateFirstApexSystem R).centerAt source.1 source.2 ∧
    boundary source_index = source.1 ∧
    boundary companion_index = xu ∧
    ((source_index < blocker_index ∧
        blocker_index < companion_index) ∨
      (companion_index < blocker_index ∧
        blocker_index < source_index))

/-- The fully checked residual terminal.  Its blocker-placement and cap-shape
fields form the explicit `3 × 3` case split; the remaining fields retain the
strictly stronger geometry shared by all nine cases. -/
structure ExactFourRigid221SourceEqUTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²) : Prop where
  named_rows :
    ExactFourRigid221PhysicalFiveNamedRows
      R rho source v jointDeletion G xu xv
  source_blocker_placement :
    ExactFourRigid221SourceEqUBlockerPlacement
      R rho source v jointDeletion xv
  other_placement :
    ExactFourRigid221SourceEqUOtherPlacement
      R rho other source v jointDeletion xv
  cap_shape :
    ExactFourRigid221SourceEqUCapShape
      R rho source other v jointDeletion G xu xv
  boundary_order :
    ExactFourRigid221SourceEqUBoundaryOrder R source xu
  source_row_interior :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        S.capInteriorByIndex S.oppIndex2 ∨
      ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2) =
        {source.1}

/-- If two distinct centers see the same pair at equal distances, then after
cutting a strictly convex boundary at the first center, the second center lies
strictly between the pair. -/
private theorem sourceEqU_commonBisector_secondCenter_between_of_ccw
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

/-- In the already-specialized `u = source` branch, physical-class membership
of the source blocker reduces to exactly `deleted`, `v`, or `xv`. -/
theorem exactFourRigid221_sourceEqU_blockerPlacement_of_namedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v}
    {G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion}
    {xu xv : ℝ²}
    (namedRows :
      ExactFourRigid221PhysicalFiveNamedRows
        R rho source v jointDeletion G xu xv)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    ExactFourRigid221SourceEqUBlockerPlacement
      R rho source v jointDeletion xv := by
  classical
  let Ksource :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  have hnamed :
      blocker = jointDeletion.deleted.1 ∨
        (blocker = source.1 ∨ blocker = xu) ∨
          blocker = v.1 ∨ blocker = xv := by
    rw [namedRows.physical_class] at hsourceBlockerClass
    simpa only [Finset.mem_insert, Finset.mem_union,
      Finset.mem_singleton] using hsourceBlockerClass
  have hblockerNotSupport : blocker ∉ Ksource.support := by
    simpa [blocker, Ksource] using Ksource.center_not_mem_support
  have hxuSourceRow : xu ∈ Ksource.support := by
    have hxu :
        xu ∈ Ksource.support ∩
          SelectedClass D.A S.oppApex2 rho := by
      simpa [Ksource] using
        (show
          xu ∈
            ((lateFirstApexSystem R).selectedAt
                source.1 source.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho by
          rw [namedRows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp hxu).1
  rcases hnamed with hd | (hsource | hxu) | hv | hxv
  · exact .deleted hd
  · exfalso
    apply hblockerNotSupport
    rw [hsource]
    exact Ksource.q_mem_support
  · exact
      (hblockerNotSupport (hxu ▸ hxuSourceRow)).elim
  · exact .v hv
  · exact .xv hxv

/-- Exact placement of the retained peer in the specialized source row. -/
theorem exactFourRigid221_sourceEqU_otherPlacement_of_namedRows
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other source v)
    (namedRows :
      ExactFourRigid221PhysicalFiveNamedRows
        R rho source v jointDeletion G xu xv) :
    ExactFourRigid221SourceEqUOtherPlacement
      R rho other source v jointDeletion xv := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hplacement :=
    exactFourRigid221_context_u_eq_source_otherPlacement
      context G rfl
  change other = jointDeletion.deleted ∨ other.1 ∈ Iv at hplacement
  rcases hplacement with hd | hIv
  · exact .deleted hd (by
      simpa [hd] using context.other_mem_interior)
  · have hvxv : other.1 = v.1 ∨ other.1 = xv := by
      rw [show Iv = {v.1, xv} by
        simpa [C, Iv] using namedRows.v_row_trace] at hIv
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hIv
    rcases hvxv with hv | hxv
    · have hotherEq : other = v := Subtype.ext hv
      exact .v hotherEq (by
        simpa [hotherEq] using context.other_mem_interior)
    · exact .xv hxv (by
        have hinterior := context.other_mem_interior
        rw [hxv] at hinterior
        exact hinterior)

/-- Boundary-order refinement for the source blocker.  Unlike the older
heavy-`u` statement, this proof uses only the named source row, so it applies
uniformly to all three cap-shape arms and does not inherit the open directed
deleted-row producer. -/
theorem exactFourRigid221_sourceEqU_boundaryOrder_of_namedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (source v : CarrierVertex D.A)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (xu xv : ℝ²)
    (namedRows :
      ExactFourRigid221PhysicalFiveNamedRows
        R rho source v jointDeletion G xu xv) :
    ExactFourRigid221SourceEqUBoundaryOrder R source xu := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex source).2
  have hapexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have hxuClass :
      xu ∈ SelectedClass D.A S.oppApex2 rho := by
    rw [namedRows.physical_class]
    simp
  have hxuA : xu ∈ D.A :=
    (mem_selectedClass.mp hxuClass).1
  have hxuRow : xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 rho := by
      simpa [Ku] using
        (show
          xu ∈
            ((lateFirstApexSystem R).selectedAt
                source.1 source.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho by
          rw [namedRows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp hmem).1
  have hblockerNeApex : blocker ≠ S.oppApex2 := by
    simpa [blocker] using
      surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) source.1 source.2
  have hsourceNeApex : source.1 ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hsourceClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith
  have hxuNeApex : xu ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hxuClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith
  have hblockerNeSource : blocker ≠ source.1 := by
    intro h
    apply Ku.center_not_mem_support
    simpa [Ku, blocker, h] using Ku.q_mem_support
  have hblockerNeXu : blocker ≠ xu := by
    intro h
    apply Ku.center_not_mem_support
    simpa [Ku, blocker, h] using hxuRow
  have hsourceNeXu : source.1 ≠ xu :=
    namedRows.xu_ne_u.symm
  have hapexEq :
      dist S.oppApex2 source.1 =
        dist S.oppApex2 xu :=
    (mem_selectedClass.mp hsourceClass).2.trans
      (mem_selectedClass.mp hxuClass).2.symm
  have hblockerEq :
      dist blocker source.1 = dist blocker xu := by
    simpa [Ku, blocker] using
      (Ku.support_eq_radius source.1 Ku.q_mem_support).trans
        (Ku.support_eq_radius xu hxuRow).symm
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
  have hAcard : 0 < D.A.card := by omega
  rcases
      exists_isCcwConvexPolygon_cyclicShift_at_zero
        hAcard hphiInj hphiImage hphiCcw hapexA with
    ⟨cut, hboundaryInj, hboundaryImage,
      hboundaryCcw, hboundaryZero⟩
  let boundary : Fin D.A.card → ℝ² := fun i ↦ phi (i + cut)
  have hblockerImage : blocker ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hblockerA
  have hsourceImage : source.1 ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact source.2
  have hxuImage : xu ∈ Finset.univ.image boundary := by
    rw [show Finset.univ.image boundary = D.A by
      simpa [boundary] using hboundaryImage]
    exact hxuA
  rcases Finset.mem_image.mp hblockerImage with
    ⟨ib, _hibUniv, hib⟩
  rcases Finset.mem_image.mp hsourceImage with
    ⟨isource, _hsourceUniv, hsource⟩
  rcases Finset.mem_image.mp hxuImage with
    ⟨ixu, _hxuUniv, hixu⟩
  have hbetween :
      (isource < ib ∧ ib < ixu) ∨
        (ixu < ib ∧ ib < isource) :=
    sourceEqU_commonBisector_secondCenter_between_of_ccw
      D.convex
      (by simpa [boundary] using hboundaryInj)
      (by simpa [boundary] using hboundaryImage)
      (by simpa [boundary] using hboundaryCcw)
      hAcard
      (by simpa [boundary] using hboundaryZero)
      hib hsource hixu hblockerNeApex hsourceNeApex hxuNeApex
      hblockerNeSource hblockerNeXu hsourceNeXu hapexEq hblockerEq
  exact
    ⟨hAcard, boundary, ib, isource, ixu,
      by simpa [boundary] using hboundaryInj,
      by simpa [boundary] using hboundaryImage,
      by simpa [boundary] using hboundaryCcw,
      by simpa [boundary] using hboundaryZero,
      by simpa [blocker] using hib,
      hsource, hixu, hbetween⟩

/-- Axiom-clean producer for the exact physical-apex `u = source` terminal.

The conclusion is exhaustive but is not a contradiction: it records the nine
remaining named cases and the common boundary/interior geometry that a future
closer must use. -/
theorem exactFourRigid221_physicalApex_sourceEqUTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (v : CarrierVertex D.A)
    (hsourceNeV : source ≠ v)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hsourceOmitted :
      source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other source v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion)
    (hcenter : G.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221SourceEqUTerminal
        R rho source other v jointDeletion G xu xv := by
  classical
  rcases
      exactFourRigid221_physicalApex_exceptionalArmRefinement
        R hcard surface rho source other hrho hfive source v
          hsourceNeV hsourceClass hvClass hvOmitted hsourceOmitted
          context jointDeletion hclassFive G hcenter with
    ⟨xu, xv, namedRows, hcap⟩
  have hblockerData :=
    exactFourRigid221_sourceEqU_blockerPlacement_of_namedRows
      namedRows hsourceBlockerClass
  have hother :=
    exactFourRigid221_sourceEqU_otherPlacement_of_namedRows
      context namedRows
  have hboundary :=
    exactFourRigid221_sourceEqU_boundaryOrder_of_namedRows
      R hcard surface rho hrho source v hsourceClass
        jointDeletion G xu xv namedRows
  have hinterior :=
    exactFourSourceContext_sourceBlockerInterior_or_uniquePhysicalInterior
      R surface source other source v context
  have hcapShape :
      ExactFourRigid221SourceEqUCapShape
        R rho source other v jointDeletion G xu xv := by
    rcases hcap with hu | hv | hexceptional
    · exact .uHeavy hu.1 hu.2.1 hu.2.2
    · exact .vHeavy hv.1 hv.2.1 hv.2.2
    · exact .exceptional hexceptional
  exact
    ⟨xu, xv,
      { named_rows := namedRows
        source_blocker_placement := hblockerData
        other_placement := hother
        cap_shape := hcapShape
        boundary_order := hboundary
        source_row_interior := hinterior }⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerPlacement_of_namedRows

#print axioms
  exactFourRigid221_sourceEqU_otherPlacement_of_namedRows

#print axioms
  exactFourRigid221_sourceEqU_boundaryOrder_of_namedRows

#print axioms
  exactFourRigid221_physicalApex_sourceEqUTerminal

end ATailFrontierLiveClosure
end Problem97
