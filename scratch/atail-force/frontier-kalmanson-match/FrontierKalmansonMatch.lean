/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Strict boundary-order test for the critical-pair frontier

This scratch module tests the smallest strict Kalmanson consumer using only
the actual names exported by `SurvivorPairRelocationPacket`.  A cross hit in
the selected critical class at `pair.q` makes the first apex and the actual
blocker two centers equidistant from `pair.q,pair.w`.  They cannot occur
adjacently before those two sources in a CCW boundary enumeration.

The theorem is a conditional consumer.  The current frontier does not supply
the required boundary order, and the module introduces no producer for it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierKalmansonMatchScratch

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- Four named carrier points occur in the displayed order in some injective
CCW boundary enumeration.  The existential enumeration makes the predicate
independent of a particular linear cut of the cyclic boundary. -/
def OccursInCcwOrder
    (D : CounterexampleData) (a b c d : ℝ²) : Prop :=
  ∃ boundary : Fin D.A.card → ℝ²,
    Function.Injective boundary ∧
    Finset.univ.image boundary = D.A ∧
    EuclideanGeometry.IsCcwConvexPolygon boundary ∧
    ∃ ia ib ic id : Fin D.A.card,
      ia < ib ∧ ib < ic ∧ ic < id ∧
      boundary ia = a ∧ boundary ib = b ∧
      boundary ic = c ∧ boundary id = d

/-- The actual first-apex marginal makes the two frontier sources equidistant
from the first apex. -/
theorem firstApex_dist_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    dist S.oppApex1 P.q = dist S.oppApex1 P.w := by
  have hq : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hw : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  simpa only [dist_comm] using hq.trans hw.symm

/-- A cross hit makes the same two sources equidistant from the actual blocker
selected for `P.q`. -/
theorem blocker_dist_eq_of_crossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    dist (H.centerAt P.q P.q_mem_A) P.q =
      dist (H.centerAt P.q P.q_mem_A) P.w := by
  exact
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
      P.q (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
    |>.trans
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwSupport).symm

/-- Smallest actual-role strict Kalmanson terminal found on the frontier.

The first apex and the blocker at `P.q` are two centers of the pair
`P.q,P.w`.  If the four roles occur in the order

`first apex, blocker, P.q, P.w`,

the ordinal Kalmanson inequality makes the blocker distances strictly
ordered, contradicting the selected critical class. -/
theorem false_of_crossMembership_and_adjacentCentersOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (horder : OccursInCcwOrder D S.oppApex1
      (H.centerAt P.q P.q_mem_A) P.q P.w) : False := by
  rcases horder with
    ⟨boundary, hboundaryInjective, hboundaryImage, hboundaryCcw,
      iO, iB, iq, iw, hOB, hBq, hqw, hO, hB, hq, hw⟩
  have hfirst :
      dist (boundary iO) (boundary iq) =
        dist (boundary iO) (boundary iw) := by
    simpa only [hO, hq, hw] using firstApex_dist_eq P
  have hstrict :
      dist (boundary iB) (boundary iq) <
        dist (boundary iB) (boundary iw) :=
    _root_.Problem97.CapCrossingKalmansonBridge.dist_lt_of_ccw_of_dist_diagonal_eq_side
      D.convex
      hboundaryInjective hboundaryImage hboundaryCcw hOB hBq hqw hfirst
  have hblocker :
      dist (boundary iB) (boundary iq) =
        dist (boundary iB) (boundary iw) := by
    simpa only [hB, hq, hw] using
      blocker_dist_eq_of_crossMembership P hwSupport
  exact (ne_of_lt hstrict) hblocker

#print axioms firstApex_dist_eq
#print axioms blocker_dist_eq_of_crossMembership
#print axioms false_of_crossMembership_and_adjacentCentersOrder

end ATailFrontierKalmansonMatchScratch
end Problem97
