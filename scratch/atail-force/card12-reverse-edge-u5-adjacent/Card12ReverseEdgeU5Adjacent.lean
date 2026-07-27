/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllReverseDirectFalse
import ReverseOutsidePairProducer

/-!
# Scratch: exact missing producer for the reverse-edge U5 terminal

The all-reverse capacity packet supplies the two canonical q-critical rows.
The cap-straddle packets constrain their physical order, but do not produce
the third critical row required by the U5 incidence sink.

This file records that missing row as a source-faithful selected-shell packet
and proves, without new axioms, that it constructs
`ReverseEdgeU5AdjacentTerminal`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCard12ReverseEdgeU5AdjacentScratch

open ATailAllReverseDirectFalseScratch
open ATailExactFiveReverseOutsidePairProducerScratch
open ATailPhysicalOmissionCycleParentResidual

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Erasing any named carrier point from an exact critical four-shell that
contains it gives a dangerous triple centered at the shell blocker.  The
shell's deletion source need not be the named point. -/
theorem dangerousTriple_of_mem_criticalFourShell
    (D : CounterexampleData) {source q center : ℝ²}
    (C : CriticalFourShell D.A source center)
    (hq : q ∈ C.support) :
    U5DangerousTriple D q center (C.support.erase q) := by
  let T := C.support.erase q
  have hTsubsetA : T ⊆ D.A := by
    intro x hx
    exact C.support_subset_A (Finset.mem_of_mem_erase hx)
  have hTcard : T.card = 3 := by
    dsimp [T]
    rw [Finset.card_erase_of_mem hq, C.support_card]
  refine
    { q_mem := C.support_subset_A hq
      p_mem := (Finset.mem_erase.mp C.center_mem).2
      p_ne_q := ?_
      T_subset := ?_
      T_card := hTcard
      T_noncollinear := ?_
      q_radius_pos := ?_
      T_same_radius := ?_ }
  · intro hcenterq
    apply C.center_not_mem_support
    exact hcenterq.symm ▸ hq
  · intro x hx
    have hxT : x ∈ T := hx
    have hxC : x ∈ C.support := Finset.mem_of_mem_erase hxT
    have hxq : x ≠ q := (Finset.mem_erase.mp hxT).1
    have hxc : x ≠ center := by
      intro h
      subst x
      exact C.center_not_mem_support hxC
    exact Finset.mem_erase.mpr
      ⟨hxc, Finset.mem_erase.mpr ⟨hxq, C.support_subset_A hxC⟩⟩
  · exact
      (ConvexIndep.mono hTsubsetA D.convex).not_collinear_of_card_ge_three
        (by omega)
  · have hqRadius := C.support_eq_radius q hq
    simpa [hqRadius] using C.radius_pos
  · intro x hx
    have hxRadius := C.support_eq_radius x (Finset.mem_of_mem_erase hx)
    have hqRadius := C.support_eq_radius q hq
    exact hxRadius.trans hqRadius.symm

/-- The exact extra selected-shell data absent from the current all-reverse
capacity and cap-straddle surfaces.

For one reverse edge with deleted point `q`, a third selected critical shell
contains `q` and both adjacent actual blockers.  Its blocker lies in both
canonical q-erased rows, and the two actual blockers satisfy the adjacency
incidence consumed by the U5 bank theorem. -/
structure ReverseEdgeThirdCriticalReturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F) : Type where
  index : Fin R.exactFive.cycle.period
  returnSource : ℝ²
  returnSource_mem_A : returnSource ∈ D.A
  q_mem_returnSupport :
    (R.exactFive.cycle.source index).1 ∈
      (H.selectedAt returnSource returnSource_mem_A).toCriticalFourShell.support
  ownBlocker_mem_returnTriple :
    ownBlocker R index ∈
      (H.selectedAt returnSource returnSource_mem_A).toCriticalFourShell.support.erase
        (R.exactFive.cycle.source index).1
  successorBlocker_mem_returnTriple :
    successorBlocker R index ∈
      (H.selectedAt returnSource returnSource_mem_A).toCriticalFourShell.support.erase
        (R.exactFive.cycle.source index).1
  returnBlocker_mem_own :
    H.centerAt returnSource returnSource_mem_A ∈ ownErasedSupport R index
  returnBlocker_mem_successor :
    H.centerAt returnSource returnSource_mem_A ∈ successorErasedSupport R index
  adjacent :
    successorBlocker R index ∈ ownErasedSupport R index ∨
      ownBlocker R index ∈ successorErasedSupport R index

/-- A third selected critical return constructs the existing exact U5
terminal. -/
theorem nonempty_reverseEdgeU5AdjacentTerminal_of_thirdCriticalReturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (P : ReverseEdgeThirdCriticalReturn R) :
    Nonempty (ReverseEdgeU5AdjacentTerminal R) := by
  let C :=
    (H.selectedAt P.returnSource P.returnSource_mem_A).toCriticalFourShell
  exact ⟨{
    index := P.index
    dangerousCenter := H.centerAt P.returnSource P.returnSource_mem_A
    dangerousTriple :=
      C.support.erase (R.exactFive.cycle.source P.index).1
    triple :=
      dangerousTriple_of_mem_criticalFourShell D C P.q_mem_returnSupport
    ownBlocker_mem_triple := P.ownBlocker_mem_returnTriple
    successorBlocker_mem_triple := P.successorBlocker_mem_returnTriple
    dangerousCenter_mem_own := P.returnBlocker_mem_own
    dangerousCenter_mem_successor := P.returnBlocker_mem_successor
    adjacent := P.adjacent }⟩

/-- The capacity packet already supplies all-reverse membership, so the third
critical return closes the branch through the existing U5 sink.  No
`ReverseRowCapStraddle` field is used. -/
theorem false_of_capacity_of_thirdCriticalReturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (capacity : FrontierCoupledReverseOutsidePairCapacity R)
    (P : ReverseEdgeThirdCriticalReturn R) : False := by
  rcases nonempty_reverseEdgeU5AdjacentTerminal_of_thirdCriticalReturn R P with
    ⟨terminal⟩
  exact false_of_allReverse_of_reverseEdgeU5Adjacent R
    capacity.all_reverseMembership terminal

#print axioms dangerousTriple_of_mem_criticalFourShell
#print axioms nonempty_reverseEdgeU5AdjacentTerminal_of_thirdCriticalReturn
#print axioms false_of_capacity_of_thirdCriticalReturn

end

end ATailCard12ReverseEdgeU5AdjacentScratch
end Problem97
