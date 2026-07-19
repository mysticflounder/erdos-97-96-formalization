/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Boundary separation in the actual-blocker HIT arm

If the mate of a survivor pair belongs to the source's actual critical shell,
then the source and mate are equidistant from two distinct centers: the first
opposite apex and the actual blocker.  The shared-pair separation theorem
therefore puts them on opposite open boundary arcs cut out by the center
chord.

This is the source-faithful boundary-side conclusion available from one HIT
edge.  It does not assert a directed rank move or identify the independently
chosen mates at adjacent blocker-cycle sources.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerBoundarySeparationScratch

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem actualBlocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A := by
  exact (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- If the survivor mate hits the source's selected actual-blocker shell,
the two pair points lie on opposite cyclic boundary intervals determined by
the first opposite apex and the actual blocker.

Equivalently, the two common points alternate with the two common circle
centers on the strictly convex boundary. -/
theorem SurvivorPairRelocationPacket.boundarySeparation_of_crossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (B : BoundaryIndexing D.A)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1) :
    let b := H.centerAt P.q P.q_mem_A
    let oLabel : CarrierLabel D.A := ⟨S.oppApex1, oppApex1_mem_A S⟩
    let bLabel : CarrierLabel D.A := ⟨b, actualBlocker_mem_A H P.q_mem_A⟩
    let qLabel : CarrierLabel D.A := ⟨P.q, P.q_mem_A⟩
    let wLabel : CarrierLabel D.A := ⟨P.w, P.w_mem_A⟩
    SurplusCOMPGBank.btw (B.indexOf oLabel) (B.indexOf bLabel)
        (B.indexOf qLabel) ↔
      ¬ SurplusCOMPGBank.btw (B.indexOf oLabel) (B.indexOf bLabel)
        (B.indexOf wLabel) := by
  let b := H.centerAt P.q P.q_mem_A
  let oLabel : CarrierLabel D.A := ⟨S.oppApex1, oppApex1_mem_A S⟩
  let bLabel : CarrierLabel D.A :=
    ⟨b, actualBlocker_mem_A H P.q_mem_A⟩
  let qLabel : CarrierLabel D.A := ⟨P.q, P.q_mem_A⟩
  let wLabel : CarrierLabel D.A := ⟨P.w, P.w_mem_A⟩
  change
    SurplusCOMPGBank.btw (B.indexOf oLabel) (B.indexOf bLabel)
        (B.indexOf qLabel) ↔
      ¬ SurplusCOMPGBank.btw (B.indexOf oLabel) (B.indexOf bLabel)
        (B.indexOf wLabel)
  have hcentersIndex : B.indexOf oLabel ≠ B.indexOf bLabel := by
    intro h
    apply hcenters
    have := congrArg Subtype.val (B.index_injective h)
    simpa [oLabel, bLabel, b] using this.symm
  have hw_ne_o : P.w ≠ S.oppApex1 := by
    intro h
    apply (Finset.mem_sdiff.mp P.w_mem_marginal).2
    simpa [h] using oppApex1_mem_surplusCap S
  have hw_ne_b : P.w ≠ b := by
    intro h
    rw [h] at hwShell
    exact (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.center_not_mem_support
      (by simpa [b] using hwShell)
  have hwIndex_ne_o : B.indexOf wLabel ≠ B.indexOf oLabel := by
    intro h
    apply hw_ne_o
    have := congrArg Subtype.val (B.index_injective h)
    simpa [wLabel, oLabel] using this
  have hwIndex_ne_b : B.indexOf wLabel ≠ B.indexOf bLabel := by
    intro h
    apply hw_ne_b
    have := congrArg Subtype.val (B.index_injective h)
    simpa [wLabel, bLabel, b] using this
  have hfirst : dist P.q S.oppApex1 = dist P.w S.oppApex1 := by
    have hq := (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
    have hw := (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
    exact hq.trans hw.symm
  have hblocker : dist P.q b = dist P.w b := by
    have hq :=
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
    have hw :=
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwShell
    simpa [b, dist_comm] using hq.trans hw.symm
  have hfirstBoundary :
      dist (B.boundary (B.indexOf qLabel))
          (B.boundary (B.indexOf oLabel)) =
        dist (B.boundary (B.indexOf wLabel))
          (B.boundary (B.indexOf oLabel)) := by
    simpa only [B.point_eq, pointOf, qLabel, wLabel, oLabel] using hfirst
  have hblockerBoundary :
      dist (B.boundary (B.indexOf qLabel))
          (B.boundary (B.indexOf bLabel)) =
        dist (B.boundary (B.indexOf wLabel))
          (B.boundary (B.indexOf bLabel)) := by
    simpa only [B.point_eq, pointOf, qLabel, wLabel, bLabel] using hblocker
  have hpointsBoundary :
      B.boundary (B.indexOf qLabel) ≠
        B.boundary (B.indexOf wLabel) := by
    simpa only [B.point_eq, pointOf, qLabel, wLabel] using P.q_ne_w
  have hsep := SurplusCOMPGBank.btw_sep
    (ψ := B.boundary)
    (i := B.indexOf oLabel) (j := B.indexOf bLabel)
    (a := B.indexOf qLabel) (b := B.indexOf wLabel)
    B.boundary_ccw B.boundary_injective hcentersIndex
    hwIndex_ne_o hwIndex_ne_b
    hfirstBoundary hblockerBoundary hpointsBoundary
  exact hsep

#print axioms
  SurvivorPairRelocationPacket.boundarySeparation_of_crossMembership

end ATailRActualBlockerBoundarySeparationScratch
end Problem97
