/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReverseMembershipClosure
import Erdos9796Proof.P97.ATail.PhysicalOmissionCycleParentResidual
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Scratch: direct consumer for the exact-five all-reverse arm

The all-reverse arm already gives two distinct q-critical actual rows for
every cycle source.  This file records the smallest current named-bank
completion of those exact rows.  It deliberately does not assume a repeated
outside pair: such a repeat is already equivalent to the ordered-cap
contradiction.

The missing producer must instead align one adjacent pair of actual blockers
with a dangerous triple and supply the three positive row incidences consumed
by `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`.

This is a source draft while production Lean builds are paused for the
separate `ShellCurvature` lane.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAllReverseDirectFalseScratch

open ATailExactFiveReverseMembershipClosureScratch
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailPhysicalOmissionCycleParentResidual

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The blocker selected at one cycle source. -/
def ownBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (i : Fin R.exactFive.cycle.period) : ℝ² :=
  H.centerAt (R.exactFive.cycle.source i).1
    (PhysicalVertex.mem_A (R.exactFive.cycle.source i))

/-- The blocker selected at the successor cycle source. -/
def successorBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (i : Fin R.exactFive.cycle.period) : ℝ² :=
  ownBlocker R (R.exactFive.cycle.successorIndex i)

/-- The q-erased exact support at the current source's actual blocker. -/
def ownErasedSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (i : Fin R.exactFive.cycle.period) : Finset ℝ² :=
  (H.selectedAt (R.exactFive.cycle.source i).1
      (PhysicalVertex.mem_A
        (R.exactFive.cycle.source i))).toCriticalFourShell.support.erase
    (R.exactFive.cycle.source i).1

/-- The q-erased exact support at the successor source's actual blocker. -/
def successorErasedSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (i : Fin R.exactFive.cycle.period) : Finset ℝ² :=
  (H.selectedAt
      (R.exactFive.cycle.source
        (R.exactFive.cycle.successorIndex i)).1
      (PhysicalVertex.mem_A
        (R.exactFive.cycle.source
          (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support.erase
    (R.exactFive.cycle.source i).1

/-- Exact conditional U5 terminal contract on one all-reverse cycle edge.

The two q-critical rows themselves are not fields: the all-reverse hypothesis
constructs them canonically from the retained critical-shell system.  This
record is not asserted to be easier to produce than the direct contradiction. -/
structure ReverseEdgeU5AdjacentTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F) : Type where
  index : Fin R.exactFive.cycle.period
  dangerousCenter : ℝ²
  dangerousTriple : Finset ℝ²
  triple : U5DangerousTriple D (R.exactFive.cycle.source index).1
    dangerousCenter dangerousTriple
  ownBlocker_mem_triple : ownBlocker R index ∈ dangerousTriple
  successorBlocker_mem_triple : successorBlocker R index ∈ dangerousTriple
  dangerousCenter_mem_own : dangerousCenter ∈ ownErasedSupport R index
  dangerousCenter_mem_successor :
    dangerousCenter ∈ successorErasedSupport R index
  adjacent :
    successorBlocker R index ∈ ownErasedSupport R index ∨
      ownBlocker R index ∈ successorErasedSupport R index

/-- Once the exact aggregate above is produced, the all-reverse arm closes
through the existing U5 adjacent-centers incompatibility. -/
theorem false_of_allReverse_of_reverseEdgeU5Adjacent
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (P : ReverseEdgeU5AdjacentTerminal R) : False := by
  rcases nonempty_reverseMembershipQCriticalPair
      R.exactFive.cycle hreverse P.index with ⟨Q⟩
  rcases Q.own with ⟨Kown⟩
  rcases Q.successor with ⟨Ksuccessor⟩
  exact U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
    P.triple P.ownBlocker_mem_triple P.successorBlocker_mem_triple
    Kown Ksuccessor P.dangerousCenter_mem_own
    P.dangerousCenter_mem_successor P.adjacent

end

end ATailAllReverseDirectFalseScratch
end Problem97
