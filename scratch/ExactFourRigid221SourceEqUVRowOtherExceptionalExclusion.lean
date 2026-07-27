/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherExceptionalDirect
import scratch.ExactFourRigid221SourceEqUVRowOtherCapGrowth

/-!
# Exact-four source-equals-u cross-row exceptional exclusion residual

The existing checked APIs do not exclude the exceptional cap-shape arm.
This file records the strongest direct source-clean decomposition currently
available there.  It crosses the exact contextual-other placement with the
two possible `v`-row orientations and retains the independent robust
cap-growth split.

The four constructors are genuinely narrower than the exceptional arm:

* the two deletion constructors respectively need a directed fact excluding
  `other = deleted` in that fixed `v`-row orientation;
* `otherVInterior` needs a directed cross-row fact excluding `other = v`;
* `otherXvInterior` needs a retained-peer/source-blocker collision fact
  excluding `other.1 = xv`.

No conditional closer interface is introduced: these are the direct finite
residual branches themselves.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

/-- Exhaustive direct residual in the exceptional
`sourceEqU_blockerVRowOther` arm.

The terminal, blocker identification, and exceptional packet are indices of
the proposition, so every constructor retains the complete checked context
rather than erasing it to a placement-only outcome.  Each constructor also
retains the robust cap-growth profile. -/
inductive ExactFourRigid221SourceEqUVRowOtherExceptionalExclusionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) : Prop
  /-- Requires a new directed deletion-row exclusion in the orientation
  `v ∈ J`, `xv ∉ J`. -/
  | otherDeletedVInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_deleted : P.other = P.jointDeletion.deleted)
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_mem_interior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_mem_interior : xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1})
  /-- Requires a new directed deletion-row exclusion in the orientation
  `v ∉ J`, `xv ∈ J`. -/
  | otherDeletedXvInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_deleted : P.other = P.jointDeletion.deleted)
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_not_mem_interior : P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_mem_interior : xv ∈ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {xv})
  /-- Requires a new directed cross-row exclusion proving `P.other ≠ P.v`
  in this fixed orientation. -/
  | otherVInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_v : P.other = P.v)
      (v_mem_interior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_mem_interior : xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1})
  /-- Requires a new collision/minimality fact proving
  `P.other.1 ≠ xv`, where `xv` is the actual source blocker. -/
  | otherXvInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_point_eq_xv : P.other.1 = xv)
      (v_not_mem_interior : P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_mem_interior : xv ∈ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {xv})

/-- The exceptional arm has exactly four direct placement/orientation
residuals, each further carrying one of the three checked cap-growth
profiles. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_exclusion_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) :
    ExactFourRigid221SourceEqUVRowOtherExceptionalExclusionResidual
      P xu xv terminal blocker_eq packet := by
  have hcap :=
    exactFourRigid221_sourceEqU_blockerVRowOther_capProfile P
  obtain ⟨_, _, _, _, _, _, hvTrace, hother, _, _, _, _⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_direct_narrowing
      P xu xv terminal blocker_eq packet
  rcases hother with hdeleted | hv | hxv
  · rcases hvTrace with hvInterior | hxvInterior
    · exact .otherDeletedVInterior hcap hdeleted.1 hdeleted.2
        hvInterior.1 hvInterior.2.1 hvInterior.2.2
    · exact .otherDeletedXvInterior hcap hdeleted.1 hdeleted.2
        hxvInterior.1 hxvInterior.2.1 hxvInterior.2.2
  · rcases hvTrace with hvInterior | hxvInterior
    · exact .otherVInterior hcap hv.1
        hvInterior.1 hvInterior.2.1 hvInterior.2.2
    · exact (hxvInterior.1 hv.2.1).elim
  · rcases hvTrace with hvInterior | hxvInterior
    · exact (hxv.2.1 hvInterior.1).elim
    · exact .otherXvInterior hcap hxv.1
        hxvInterior.1 hxvInterior.2.1 hxvInterior.2.2

/-- The complete retained data of the first exceptional constructor. -/
structure ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) : Prop where
  cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S
  other_eq_deleted : P.other = P.jointDeletion.deleted
  deleted_mem_interior :
    P.jointDeletion.deleted.1 ∈
      S.capInteriorByIndex S.oppIndex2
  v_mem_interior :
    P.v.1 ∈ S.capInteriorByIndex S.oppIndex2
  xv_not_mem_interior :
    xv ∉ S.capInteriorByIndex S.oppIndex2
  v_pair_trace :
    ({P.v.1, xv} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 =
      {P.v.1}

/-- The exact remaining strict metric split in the first exceptional branch.

The equidistant case is excluded below: Kalmanson puts `xv` strictly between
the two strict-cap points on the boundary cut at the indexed opposite apex,
while indexed-cap interval contiguity then puts `xv` back in the strict cap. -/
inductive ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorMetricResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv)
    (branch :
      ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorData
        P xu xv terminal blocker_eq packet) : Prop
  | closerToDeleted
      (distance_lt :
        dist xv P.jointDeletion.deleted.1 < dist xv P.v.1)
  | closerToV
      (distance_lt :
        dist xv P.v.1 < dist xv P.jointDeletion.deleted.1)

/-- Direct Kalmanson lemma used only by the equidistant subcase below. -/
private theorem deletedV_commonBisector_blocker_between_of_ccw
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

/-- On a boundary cut at an indexed opposite apex, strict-cap membership is
order-convex: a point strictly between two strict-cap points is itself in the
strict cap. -/
private theorem mem_capInteriorByIndex_of_between_on_opposite_apex_cut
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {boundary : Fin A.card → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hcard : 0 < A.card)
    {x y z : ℝ²} {ix iy iz : Fin A.card}
    (hzero :
      boundary (⟨0, hcard⟩ : Fin A.card) =
        S.oppositeVertexByIndex i)
    (hx : boundary ix = x)
    (hy : boundary iy = y)
    (hz : boundary iz = z)
    (hxI : x ∈ S.capInteriorByIndex i)
    (hyI : y ∈ S.capInteriorByIndex i)
    (hbetween : (ix < iz ∧ iz < iy) ∨ (iy < iz ∧ iz < ix)) :
    z ∈ S.capInteriorByIndex i := by
  let izero : Fin A.card := ⟨0, hcard⟩
  have hv2Image :
      (S.triangleByIndex i).v2 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact (S.triangleByIndex i).v2_mem
  have hv3Image :
      (S.triangleByIndex i).v3 ∈ Finset.univ.image boundary := by
    rw [himage]
    exact (S.triangleByIndex i).v3_mem
  rcases Finset.mem_image.mp hv2Image with ⟨ia, -, hia⟩
  rcases Finset.mem_image.mp hv3Image with ⟨ib, -, hib⟩
  have hic :
      boundary izero = (S.triangleByIndex i).v1 := by
    simpa [izero, S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hzero
  have hzeroNeIa : izero ≠ ia := by
    intro h
    exact (S.triangleByIndex i).v12_ne
      (calc
        (S.triangleByIndex i).v1 = boundary izero := hic.symm
        _ = boundary ia := congrArg boundary h
        _ = (S.triangleByIndex i).v2 := hia)
  have hzeroNeIb : izero ≠ ib := by
    intro h
    exact (S.triangleByIndex i).v13_ne
      (calc
        (S.triangleByIndex i).v1 = boundary izero := hic.symm
        _ = boundary ib := congrArg boundary h
        _ = (S.triangleByIndex i).v3 := hib)
  have hzeroLtIa : izero < ia := by
    have hiaVal : ia.val ≠ 0 := by
      intro h
      apply hzeroNeIa
      apply Fin.ext
      simpa [izero] using h.symm
    change 0 < ia.val
    omega
  have hzeroLtIb : izero < ib := by
    have hibVal : ib.val ≠ 0 := by
      intro h
      apply hzeroNeIb
      apply Fin.ext
      simpa [izero] using h.symm
    change 0 < ib.val
    omega
  have hiaNeIb : ia ≠ ib := by
    intro h
    exact (S.triangleByIndex i).v23_ne
      (calc
        (S.triangleByIndex i).v2 = boundary ia := hia.symm
        _ = boundary ib := congrArg boundary h
        _ = (S.triangleByIndex i).v3 := hib)
  have hright :
      S.rightOuterVertexByIndex i = (S.triangleByIndex i).v2 := by
    fin_cases i <;> rfl
  have hleft :
      S.leftOuterVertexByIndex i = (S.triangleByIndex i).v3 := by
    fin_cases i <;> rfl
  rcases lt_or_gt_of_ne hiaNeIb with hab | hiba
  · rcases S.capInteriorByIndex_open_interval_of_global_indices i
        hccw hinj himage hab (Or.inl hzeroLtIa) hic hia hib hxI with
      ⟨qx, hiaqx, hqxib, hqx⟩
    rcases S.capInteriorByIndex_open_interval_of_global_indices i
        hccw hinj himage hab (Or.inl hzeroLtIa) hic hia hib hyI with
      ⟨qy, hiaqy, hqyib, hqy⟩
    have hqxEq : qx = ix := hinj (hqx.trans hx.symm)
    have hqyEq : qy = iy := hinj (hqy.trans hy.symm)
    subst qx
    subst qy
    have hizBounds : ia ≤ iz ∧ iz ≤ ib := by
      rcases hbetween with h | h <;> omega
    have hzCap : z ∈ S.capByIndex i := by
      exact (S.capByIndex_interval_of_global_indices i hccw hinj himage
        hab (Or.inl hzeroLtIa) hic hia hib z).2
          ⟨iz, hizBounds.1, hizBounds.2, hz⟩
    have hizNeIa : iz ≠ ia := by
      rcases hbetween with h | h <;> omega
    have hizNeIb : iz ≠ ib := by
      rcases hbetween with h | h <;> omega
    exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i hzCap
      (by
        rw [hright]
        intro hzv2
        apply hizNeIa
        exact hinj (hz.trans (hzv2.trans hia.symm)))
      (by
        rw [hleft]
        intro hzv3
        apply hizNeIb
        exact hinj (hz.trans (hzv3.trans hib.symm)))
  · rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices i
        hccw hinj himage hiba (Or.inl hzeroLtIb) hic hia hib hxI with
      ⟨qx, hibqx, hqxia, hqx⟩
    rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices i
        hccw hinj himage hiba (Or.inl hzeroLtIb) hic hia hib hyI with
      ⟨qy, hibqy, hqyia, hqy⟩
    have hqxEq : qx = ix := hinj (hqx.trans hx.symm)
    have hqyEq : qy = iy := hinj (hqy.trans hy.symm)
    subst qx
    subst qy
    have hizBounds : ib ≤ iz ∧ iz ≤ ia := by
      rcases hbetween with h | h <;> omega
    have hzCap : z ∈ S.capByIndex i := by
      exact (S.capByIndex_reverse_interval_of_global_indices i
        hccw hinj himage hiba (Or.inl hzeroLtIb) hic hia hib z).2
          ⟨iz, hizBounds.1, hizBounds.2, hz⟩
    have hizNeIa : iz ≠ ia := by
      rcases hbetween with h | h <;> omega
    have hizNeIb : iz ≠ ib := by
      rcases hbetween with h | h <;> omega
    exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i hzCap
      (by
        rw [hright]
        intro hzv2
        apply hizNeIa
        exact hinj (hz.trans (hzv2.trans hia.symm)))
      (by
        rw [hleft]
        intro hzv3
        apply hizNeIb
        exact hinj (hz.trans (hzv3.trans hib.symm)))

/-- Checked exhaustive coordinator for the first exceptional constructor.

The only unresolved comparison is now a strict orientation of the distance
from the actual source blocker `xv` to the two strict-cap points `deleted`
and `v`; equality is impossible by Kalmanson plus cap interval contiguity. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_otherDeletedVInterior_metricResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv)
    (branch :
      ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorData
        P xu xv terminal blocker_eq packet) :
    ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorMetricResidual
      P xu xv terminal blocker_eq packet branch := by
  classical
  rcases lt_trichotomy
      (dist xv P.jointDeletion.deleted.1) (dist xv P.v.1) with
    hlt | heq | hgt
  · exact .closerToDeleted hlt
  · rcases terminal.boundary_order with
      ⟨hcard, boundary, blockerIndex, sourceIndex, companionIndex,
        hinj, himage, hccw, hzero, hblocker, hsource, hcompanion,
        hsourceBetween⟩
    have hblockerEqU :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
      simpa [P.huSource] using blocker_eq
    have hblockerXv : boundary blockerIndex = xv :=
      hblocker.trans hblockerEqU
    have hsourceActual :
        boundary sourceIndex = P.source.1 := by
      simpa [P.huSource] using hsource
    have hdeletedImage :
        P.jointDeletion.deleted.1 ∈ Finset.univ.image boundary := by
      rw [himage]
      exact P.jointDeletion.deleted.2
    have hvImage : P.v.1 ∈ Finset.univ.image boundary := by
      rw [himage]
      exact P.v.2
    rcases Finset.mem_image.mp hdeletedImage with
      ⟨deletedIndex, -, hdeletedBoundary⟩
    rcases Finset.mem_image.mp hvImage with
      ⟨vIndex, -, hvBoundary⟩
    have hxvClass :
        xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
      rw [terminal.named_rows.physical_class]
      simp
    have hxvNeApex : xv ≠ S.oppApex2 := by
      intro hxvApex
      have hzeroDist : dist S.oppApex2 xv = 0 := by
        rw [hxvApex]
        simp
      have hrhoZero :
          P.rho = 0 :=
        (mem_selectedClass.mp hxvClass).2.symm.trans hzeroDist
      linarith [P.hrho]
    have hdeletedNeApex :
        P.jointDeletion.deleted.1 ≠ S.oppApex2 := by
      intro hdeletedApex
      have hzeroDist :
          dist S.oppApex2 P.jointDeletion.deleted.1 = 0 := by
        rw [hdeletedApex]
        simp
      have hrhoZero :=
        (mem_selectedClass.mp
          P.jointDeletion.deleted_mem_class).2.symm.trans hzeroDist
      linarith [P.hrho]
    have hvNeApex : P.v.1 ≠ S.oppApex2 := by
      intro hvApex
      have hzeroDist : dist S.oppApex2 P.v.1 = 0 := by
        rw [hvApex]
        simp
      have hrhoZero :=
        (mem_selectedClass.mp P.hvClass).2.symm.trans hzeroDist
      linarith [P.hrho]
    have hxvNeDeleted : xv ≠ P.jointDeletion.deleted.1 := by
      intro hxvDeleted
      apply P.jointDeletion.deleted_not_mem_vRow
      have hxvInter :
          xv ∈
            ((lateFirstApexSystem R).selectedAt
                P.v.1 P.v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho := by
        rw [terminal.named_rows.v_row_trace]
        simp
      exact hxvDeleted ▸ (Finset.mem_inter.mp hxvInter).1
    have hxvNeV : xv ≠ P.v.1 :=
      terminal.named_rows.xv_ne_v
    have hdeletedNeV :
        P.jointDeletion.deleted.1 ≠ P.v.1 := by
      intro h
      exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
    have hapexEq :
        dist S.oppApex2 P.jointDeletion.deleted.1 =
          dist S.oppApex2 P.v.1 :=
      (mem_selectedClass.mp
          P.jointDeletion.deleted_mem_class).2.trans
        (mem_selectedClass.mp P.hvClass).2.symm
    have hdeletedBetween :=
      deletedV_commonBisector_blocker_between_of_ccw
        D.convex hinj himage hccw hcard hzero hblockerXv
          hdeletedBoundary hvBoundary hxvNeApex hdeletedNeApex
          hvNeApex hxvNeDeleted hxvNeV hdeletedNeV hapexEq heq
    have hxvInterior :
        xv ∈ S.capInteriorByIndex S.oppIndex2 :=
      mem_capInteriorByIndex_of_between_on_opposite_apex_cut
        S S.oppIndex2 hinj himage hccw hcard
          (by simpa using hzero)
          hdeletedBoundary hvBoundary hblockerXv
          branch.deleted_mem_interior branch.v_mem_interior hdeletedBetween
    exact (branch.xv_not_mem_interior hxvInterior).elim
  · exact .closerToV hgt

end ATailFrontierLiveClosure
end Problem97
