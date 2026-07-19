/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReverseShellCurvatureAdapter

/-!
# Candidate shared-boundary adapter for the period-three all-reverse arm

This file records the smallest source-faithful interface found by the scratch
audit.  It deliberately contains no theorem with an unproved body.  The
producer statement at the bottom is an `abbrev`, not a claimed proof.

The forward four-inequality packet is not the invariant statement.  After
choosing the least of the three source indices in one fixed strict cap block,
the other two sources can occur in successor order or reflected successor
order.  The orientation disjunction below retains both cases.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailThreeRowSharedBoundaryProducerScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailExactFiveReverseMembershipClosureScratch
open ATailExactFiveReverseOutsidePairProducerScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The live all-reverse hypothesis, named without changing its quantifiers. -/
abbrev AllReverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Prop :=
  ∀ i : Fin K.period,
    (K.source i).1 ∈
      (H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support

/-- One reverse row located in a caller-supplied common strict cap block.

This is the fixed-block version of the index extraction already carried out
inside `nonempty_reverseRowGlobalBlockStraddle`.  Its proof uses
`StrictCapBlockData.exists_index_of_mem_cap` and
`CGN.oneSidedDistanceInjective_of_mecCapPacket`; it does not choose a new
block. -/
structure FixedBlockReverseRowStraddle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2))
    (i : Fin K.period) : Type where
  centerIndex : Fin B.m
  currentIndex : Fin B.m
  successorIndex : Fin B.m
  center_point : B.L.points centerIndex = reverseRowCenter K i
  current_point : B.L.points currentIndex = (K.source i).1
  successor_point :
    B.L.points successorIndex = (K.source (K.successorIndex i)).1
  straddles :
    (currentIndex < centerIndex ∧ centerIndex < successorIndex) ∨
      (successorIndex < centerIndex ∧ centerIndex < currentIndex)

/-- One shared physical-cap block with the period-three sources and all three
reverse-row blockers normalized at the least source index.

The first four inequalities in the left orientation are exactly the packet
proposed in the pruning audit:

```text
q0 < c0,  q0 < c2,  c1 < q2,  c2 < q2.
```

The right orientation is the source-faithful reflected alternative:

```text
q0 < c0,  q0 < c2,  c1 < q1,  c0 < q1.
```

Thus one row is disjoint from the other two in either eventual Kalmanson
consumer, but the identity of the exceptional pair depends on orientation.
-/
structure PeriodThreeReverseSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Type where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)

  i0 : Fin K.period
  i1 : Fin K.period
  i2 : Fin K.period
  successor_i0 : K.successorIndex i0 = i1
  successor_i1 : K.successorIndex i1 = i2
  successor_i2 : K.successorIndex i2 = i0

  q0 : Fin block.m
  q1 : Fin block.m
  q2 : Fin block.m
  c0 : Fin block.m
  c1 : Fin block.m
  c2 : Fin block.m
  q0_point : block.L.points q0 = (K.source i0).1
  q1_point : block.L.points q1 = (K.source i1).1
  q2_point : block.L.points q2 = (K.source i2).1
  c0_point : block.L.points c0 = reverseRowCenter K i0
  c1_point : block.L.points c1 = reverseRowCenter K i1
  c2_point : block.L.points c2 = reverseRowCenter K i2

  q0_lt_c0 : q0 < c0
  c0_lt_q1 : c0 < q1
  q0_lt_c2 : q0 < c2
  c2_lt_q2 : c2 < q2

  orientation :
    (q1 < c1 ∧ c1 < q2) ∨
      (q2 < c1 ∧ c1 < q1)

/-- Candidate producer proposition.  The audit classifies its proof as
finite/index plumbing once the fixed-block row-straddle helper is factored.
No proof of this proposition is claimed here. -/
abbrev PeriodThreeReverseSharedCapOrderProducerStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (_hperiod : K.period = 3)
    (_hreverse : AllReverseMembership K) : Prop :=
  Nonempty (PeriodThreeReverseSharedCapOrder K)

/-- Extra evidence required only if a consumer insists on applying the
current global-CCW Kalmanson API directly to `B.phi`.

These fields are true of the particular block built internally by CGN4g, but
they are not fields of an arbitrary `StrictCapBlockData`; hence they cannot be
recovered from `B` by projection.  A local `StrictCapOrder` consumer avoids
this interface strengthening. -/
structure StrictCapBlockGlobalCcwEvidence
    {A C : Finset ℝ²} (B : CGN.StrictCapBlockData A C) : Prop where
  phi_injective : Function.Injective B.phi
  phi_ccw : EuclideanGeometry.IsCcwConvexPolygon B.phi

end

end ATailThreeRowSharedBoundaryProducerScratch
end Problem97
