import GlobalMutualPairCloser
import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore

/-!
# Terminal constraints for the full-parent equal-blocker mutual arm

The equal-blocker fiber has one source at the continuation's unused physical-cap
point and the other at a physical exact-five point.  Both therefore lie in the
closed physical second cap.  Distance from the first physical-cap endpoint is
injective on that cap, so the first apex cannot be the source-faithful second
center of a same-cap terminal.  Any ordered terminal must use a genuinely new
source outside the physical cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMutualEqualBlockerTerminalScratch

open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiberRow
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex1_eq_triangleByIndex_v3_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = (S.triangleByIndex S.oppIndex2).v3 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.triangleByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- Distances from the first endpoint of the physical second cap are
injective on all vertices of that closed cap. -/
theorem dist_firstApex_ne_of_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y : ℝ²}
    (hx : x ∈ S.capByIndex S.oppIndex2)
    (hy : y ∈ S.capByIndex S.oppIndex2)
    (hxy : x ≠ y) :
    dist S.oppApex1 x ≠ dist S.oppApex1 y := by
  classical
  by_cases hxO : x = S.oppApex1
  · intro hdist
    have hOy : S.oppApex1 = y := by
      apply dist_eq_zero.mp
      simpa [hxO] using hdist.symm
    exact hxy (hxO.trans hOy)
  by_cases hyO : y = S.oppApex1
  · intro hdist
    have hOx : S.oppApex1 = x := by
      apply dist_eq_zero.mp
      simpa [hyO] using hdist
    exact hxy (hOx.symm.trans hyO.symm)
  rcases S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap, hends⟩
  have hxImage : x ∈ Finset.univ.image L.points := by
    rwa [hcap]
  have hyImage : y ∈ Finset.univ.image L.points := by
    rwa [hcap]
  rcases Finset.mem_image.mp hxImage with ⟨ix, _hix, hixPoint⟩
  rcases Finset.mem_image.mp hyImage with ⟨iy, _hiy, hiyPoint⟩
  have hixy : ix ≠ iy := by
    intro h
    apply hxy
    calc
      x = L.points ix := hixPoint.symm
      _ = L.points iy := by rw [h]
      _ = y := hiyPoint
  have hfirst_lt_of_ne (i : Fin m)
      (hi : i ≠ CGN.firstIndex Packet.hm) :
      CGN.firstIndex Packet.hm < i := by
    change 0 < i.val
    have hval : i.val ≠ 0 := by
      intro hzero
      apply hi
      apply Fin.ext
      simpa [CGN.firstIndex] using hzero
    omega
  have hlt_last_of_ne (i : Fin m)
      (hi : i ≠ CGN.lastIndex Packet.hm) :
      i < CGN.lastIndex Packet.hm := by
    change i.val < m - 1
    have hval : i.val ≠ m - 1 := by
      intro hlast
      apply hi
      apply Fin.ext
      simpa [CGN.lastIndex] using hlast
    have hilimit := i.isLt
    omega
  have hinj :=
    CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  have hO := oppApex1_eq_triangleByIndex_v3_oppIndex2 S
  rcases hends with ⟨hfirst, hlast⟩ | ⟨hfirst, hlast⟩
  · have hOlast :
        L.points (CGN.lastIndex Packet.hm) = S.oppApex1 :=
      hlast.trans hO.symm
    have hixLast : ix ≠ CGN.lastIndex Packet.hm := by
      intro h
      apply hxO
      calc
        x = L.points ix := hixPoint.symm
        _ = L.points (CGN.lastIndex Packet.hm) := by rw [h]
        _ = S.oppApex1 := hOlast
    have hiyLast : iy ≠ CGN.lastIndex Packet.hm := by
      intro h
      apply hyO
      calc
        y = L.points iy := hiyPoint.symm
        _ = L.points (CGN.lastIndex Packet.hm) := by rw [h]
        _ = S.oppApex1 := hOlast
    rcases lt_or_gt_of_ne hixy with hixiy | hiyix
    · intro hdist
      apply hinj.2 hixiy (hlt_last_of_ne iy hiyLast)
      simpa only [hOlast, hixPoint, hiyPoint] using hdist
    · intro hdist
      apply hinj.2 hiyix (hlt_last_of_ne ix hixLast)
      simpa only [hOlast, hixPoint, hiyPoint] using hdist.symm
  · have hOfirst :
        L.points (CGN.firstIndex Packet.hm) = S.oppApex1 :=
      hfirst.trans hO.symm
    have hixFirst : ix ≠ CGN.firstIndex Packet.hm := by
      intro h
      apply hxO
      calc
        x = L.points ix := hixPoint.symm
        _ = L.points (CGN.firstIndex Packet.hm) := by rw [h]
        _ = S.oppApex1 := hOfirst
    have hiyFirst : iy ≠ CGN.firstIndex Packet.hm := by
      intro h
      apply hyO
      calc
        y = L.points iy := hiyPoint.symm
        _ = L.points (CGN.firstIndex Packet.hm) := by rw [h]
        _ = S.oppApex1 := hOfirst
    rcases lt_or_gt_of_ne hixy with hixiy | hiyix
    · intro hdist
      apply hinj.1 (hfirst_lt_of_ne ix hixFirst) hixiy
      simpa only [hOfirst, hixPoint, hiyPoint] using hdist
    · intro hdist
      apply hinj.1 (hfirst_lt_of_ne iy hiyFirst) hiyix
      simpa only [hOfirst, hixPoint, hiyPoint] using hdist.symm

/-- The two sources of the equal-blocker critical fiber both lie in the
physical second cap. -/
theorem equalBlocker_fiberSources_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    Q.criticalFiber.source₁.1 ∈ S.capByIndex S.oppIndex2 ∧
      Q.criticalFiber.source₂.1 ∈ S.capByIndex S.oppIndex2 := by
  constructor
  · rw [Q.criticalFiber_source₁]
    exact M.continuation.unusedRow.unused.point_mem_capByIndex
  · rw [Q.criticalFiber_source₂]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp Q.chosen.partner.2).2

/-- The equal-blocker fiber cannot use the first apex as a second
equidistance center. -/
theorem equalBlocker_firstApex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    dist S.oppApex1 Q.criticalFiber.source₁.1 ≠
      dist S.oppApex1 Q.criticalFiber.source₂.1 := by
  rcases equalBlocker_fiberSources_mem_physicalCap Q with ⟨hsource₁, hsource₂⟩
  exact dist_firstApex_ne_of_mem_physicalCap hsource₁ hsource₂
    Q.criticalFiber.source_points_ne

/-- On the source-faithful first-apex row split, the second row point must be
outside the physical cap.  Thus the row-hit arm cannot be completed using
another named physical-cap source. -/
theorem equalBlocker_rowHit_other_not_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualEqualBlockerShell M}
    (hit : RowHit Q.criticalFiber) :
    hit.other ∉ S.capByIndex S.oppIndex2 := by
  intro hotherCap
  have hhitCap : hit.hitSource ∈ S.capByIndex S.oppIndex2 := by
    rcases equalBlocker_fiberSources_mem_physicalCap Q with ⟨hsource₁, hsource₂⟩
    rcases hit.hitSource_is_fiber_source with hsource | hsource
    · simpa only [hsource] using hsource₁
    · simpa only [hsource] using hsource₂
  have hdistNe := dist_firstApex_ne_of_mem_physicalCap
    hotherCap hhitCap hit.other_ne_hitSource
  apply hdistNe
  exact
    (hit.row.support_eq_radius hit.other hit.other_mem_row).trans
      (hit.row.support_eq_radius hit.hitSource hit.hitSource_mem_row).symm

/-- Consequently the `sameCap` terminal, if supplied at all, must use an
actual critical row as its source-faithful second center. -/
theorem equalBlocker_sameCap_secondCenter_is_actualRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualEqualBlockerShell M}
    (core : SameCapCollisionPairCore Q.criticalFiber) :
    ∃ (J : ℝ²) (hJ : J ∈ D.A),
      core.secondCenter = H.centerAt J hJ ∧
        core.C ∈ (H.selectedAt J hJ).toCriticalFourShell.support ∧
        core.K ∈ (H.selectedAt J hJ).toCriticalFourShell.support := by
  rcases core.source_faithful_secondCenter with hfirst | hactual
  · rcases hfirst with ⟨_hcenter, heq⟩
    exfalso
    have hne := equalBlocker_firstApex_dist_ne Q
    rcases core.fiber_orientation with horient | horient
    · exact hne (by simpa only [horient.1, horient.2] using heq)
    · exact hne (by simpa only [horient.1, horient.2] using heq.symm)
  · exact hactual

/-- The cap used by any same-cap terminal for this fiber is not the physical
second cap containing both fiber sources. -/
theorem equalBlocker_sameCap_capIndex_ne_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualEqualBlockerShell M}
    (core : SameCapCollisionPairCore Q.criticalFiber) :
    core.capIndex ≠ S.oppIndex2 := by
  intro hcap
  rcases equalBlocker_fiberSources_mem_physicalCap Q with ⟨hsource₁, hsource₂⟩
  apply core.C_not_mem_cap
  rw [hcap]
  rcases core.fiber_orientation with horient | horient
  · simpa only [horient.1] using hsource₁
  · simpa only [horient.1] using hsource₂

/-- The source `J` of any ordered terminal must lie outside the physical
second cap.  Thus the continuation's unused point and the physical mutual
partner cannot themselves be this cross-row source. -/
theorem equalBlocker_ordered_source_not_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualEqualBlockerShell M}
    (core : OrderedCrossRowCore Q.criticalFiber) :
    core.J ∉ S.capByIndex S.oppIndex2 := by
  intro hJCap
  have hCNeJ : core.C ≠ core.J := by
    intro h
    have hindices : core.iC = core.iJ := by
      apply core.boundary_injective
      simpa only [core.boundary_C, core.boundary_J] using h
    exact (ne_of_gt core.hJC) hindices
  have hCCap : core.C ∈ S.capByIndex S.oppIndex2 := by
    rcases equalBlocker_fiberSources_mem_physicalCap Q with ⟨hsource₁, hsource₂⟩
    rcases core.fiber_orientation with horient | horient
    · simpa only [horient.1] using hsource₁
    · simpa only [horient.1] using hsource₂
  exact
    (dist_firstApex_ne_of_mem_physicalCap hJCap hCCap hCNeJ.symm)
      core.robust_equidistant

/-- In particular, none of the continuation's three named physical-cap
sources, nor the mutual partner, can be the ordered terminal's source `J`. -/
theorem equalBlocker_ordered_source_ne_namedPhysicalSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualEqualBlockerShell M}
    (core : OrderedCrossRowCore Q.criticalFiber) :
    core.J ≠ M.continuation.unusedRow.unused.point ∧
      core.J ≠ M.continuation.first ∧
      core.J ≠ M.continuation.second ∧
      core.J ≠ Q.chosen.partner.1 := by
  have hJOff := equalBlocker_ordered_source_not_mem_physicalCap core
  have hunusedCap := M.continuation.unusedRow.unused.point_mem_capByIndex
  have hfirstCap : M.continuation.first ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp M.continuation.first_mem_physicalInterior).2
  have hsecondCap : M.continuation.second ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp M.continuation.second_mem_physicalInterior).2
  have hpartnerCap : Q.chosen.partner.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp Q.chosen.partner.2).2
  constructor
  · intro h
    exact hJOff (by simpa only [h] using hunusedCap)
  constructor
  · intro h
    exact hJOff (by simpa only [h] using hfirstCap)
  constructor
  · intro h
    exact hJOff (by simpa only [h] using hsecondCap)
  · intro h
    exact hJOff (by simpa only [h] using hpartnerCap)

#print axioms dist_firstApex_ne_of_mem_physicalCap
#print axioms equalBlocker_firstApex_dist_ne
#print axioms equalBlocker_rowHit_other_not_mem_physicalCap
#print axioms equalBlocker_sameCap_secondCenter_is_actualRow
#print axioms equalBlocker_sameCap_capIndex_ne_physicalCap
#print axioms equalBlocker_ordered_source_not_mem_physicalCap
#print axioms equalBlocker_ordered_source_ne_namedPhysicalSources

end

end ATailGlobalMutualEqualBlockerTerminalScratch
end Problem97
