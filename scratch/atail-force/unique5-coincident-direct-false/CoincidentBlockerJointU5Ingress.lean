/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CoincidentBlockerContinuation

/-!
# Exact-five coincident-blocker joint-deletion U5 ingress

The joint deletion produced by the coincident-blocker continuation already
contains three pairwise-distinct centers at which deleting one source
preserves K4.  This file exposes the corresponding U5 mining surface: a
dangerous triple on the complete first-apex radius class, the two exact
q-deleted blocker rows, and the source's actual q-critical row.

This is an incidence-bank ingress, not yet a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFiveCoincidentDirectFalseScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

/-- U5-facing form of the exact-five coincident-blocker joint deletion. -/
structure CoincidentBlockerJointU5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveCoincidentBlockerResidual F}
    {L : CoincidentBlockerFreshCommonDeletion R}
    {C : CoincidentBlockerMutualOmissionCycle R L}
    (J : CoincidentBlockerJointDeletion R L C) : Type where
  T : Finset ℝ²
  dangerous : U5DangerousTriple D J.source S.oppApex1 T
  commonBlockerRow :
    U5QDeletedK4Class D J.source
      (H.centerAt C.collisionSource C.collisionSource_mem_A)
      J.commonBlockerPacket.B₂
  freshBlockerRow :
    U5QDeletedK4Class D J.source
      (H.centerAt L.fresh L.packet.q_mem_A)
      J.freshBlockerPacket.B₂
  actualCriticalRow :
    U5QCriticalTripleClass D J.source
      (H.centerAt J.source
        (mem_selectedClass.mp J.source_mem_firstClass).1)
      ((H.selectedAt J.source
        (mem_selectedClass.mp J.source_mem_firstClass).1).toCriticalFourShell.support.erase
          J.source)

private def criticalShellToQAllowedK4Class
    {D : CounterexampleData} {source center : ℝ²}
    (K : CriticalFourShell D.A source center) :
    U5QAllowedK4Class D center K.support where
  subset := by
    intro z hz
    exact Finset.mem_erase.mpr
      ⟨fun hzc ↦ K.center_not_mem_support (hzc ▸ hz),
        K.support_subset_A hz⟩
  card_four := by rw [K.support_card]
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- The exact-five coincident joint deletion unconditionally supplies its
concrete U5 incidence-bank ingress. -/
theorem CoincidentBlockerJointDeletion.nonempty_u5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFiveCoincidentBlockerResidual F}
    {L : CoincidentBlockerFreshCommonDeletion R}
    {C : CoincidentBlockerMutualOmissionCycle R L}
    (J : CoincidentBlockerJointDeletion R L C) :
    Nonempty (CoincidentBlockerJointU5Ingress J) := by
  classical
  let radiusClass := SelectedClass D.A S.oppApex1 radius
  have hsourceA : J.source ∈ D.A :=
    (mem_selectedClass.mp J.source_mem_firstClass).1
  have hradiusPos : 0 < radius := frontier_radius_pos F
  have hsourceNeApex : J.source ≠ S.oppApex1 := by
    intro h
    have hzero := (mem_selectedClass.mp J.source_mem_firstClass).2
    rw [h, dist_self] at hzero
    linarith
  have hEraseThree : 3 ≤ (radiusClass.erase J.source).card := by
    have hClassFive : radiusClass.card = 5 := by
      simpa only [radiusClass] using R.base.class_card_eq_five
    rw [Finset.card_erase_of_mem
      (by simpa only [radiusClass] using J.source_mem_firstClass)]
    omega
  rcases Finset.exists_subset_card_eq
      (s := radiusClass.erase J.source) hEraseThree with
    ⟨T, hTsub, hTcard⟩
  have hTsubA : T ⊆ D.A := by
    intro z hz
    have hzClass : z ∈ radiusClass :=
      (Finset.mem_erase.mp (hTsub hz)).2
    exact (mem_selectedClass.mp hzClass).1
  have hTnoncollinear : ¬ Collinear ℝ (T : Set ℝ²) :=
    (D.convex.mono hTsubA).not_collinear_of_card_ge_three (by omega)
  have hTsubsetSkeleton :
      T ⊆ (D.skeleton J.source).erase S.oppApex1 := by
    intro z hz
    have hzErase := Finset.mem_erase.mp (hTsub hz)
    have hzClass : z ∈ radiusClass := hzErase.2
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    have hzNeApex : z ≠ S.oppApex1 := by
      intro h
      have hzero := (mem_selectedClass.mp hzClass).2
      rw [h, dist_self] at hzero
      linarith
    change z ∈ (D.A.erase J.source).erase S.oppApex1
    exact Finset.mem_erase.mpr
      ⟨hzNeApex, Finset.mem_erase.mpr ⟨hzErase.1, hzA⟩⟩
  let dangerous : U5DangerousTriple D J.source S.oppApex1 T := {
    q_mem := hsourceA
    p_mem := J.commonBlockerPacket.center₁_mem_A
    p_ne_q := hsourceNeApex.symm
    T_subset := hTsubsetSkeleton
    T_card := hTcard
    T_noncollinear := hTnoncollinear
    q_radius_pos := by
      simpa only [(mem_selectedClass.mp J.source_mem_firstClass).2] using
        hradiusPos
    T_same_radius := by
      intro z hz
      have hzClass : z ∈ radiusClass :=
        (Finset.mem_erase.mp (hTsub hz)).2
      calc
        dist S.oppApex1 z = radius := (mem_selectedClass.mp hzClass).2
        _ = dist S.oppApex1 J.source :=
          (mem_selectedClass.mp J.source_mem_firstClass).2.symm }
  let actualShell := (H.selectedAt J.source hsourceA).toCriticalFourShell
  have hactualCritical :
      Nonempty (U5QCriticalTripleClass D J.source
        (H.centerAt J.source hsourceA)
        (actualShell.support.erase J.source)) :=
    (criticalShellToQAllowedK4Class actualShell).qCriticalTriple_of_mem_q
      actualShell.support_card actualShell.q_mem_support
  rcases hactualCritical with ⟨actualCritical⟩
  exact ⟨{
    T := T
    dangerous := dangerous
    commonBlockerRow := J.commonBlockerPacket.row₂
    freshBlockerRow := J.freshBlockerPacket.row₂
    actualCriticalRow := by simpa [actualShell] using actualCritical }⟩

/-- Source-facing aggregate of the complete coincident-blocker producer chain
and its concrete U5 incidence-bank ingress. -/
structure CoincidentBlockerU5IngressOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Type where
  freshDeletion : CoincidentBlockerFreshCommonDeletion R
  omissionCycle :
    CoincidentBlockerMutualOmissionCycle R freshDeletion
  jointDeletion :
    CoincidentBlockerJointDeletion R freshDeletion omissionCycle
  ingress : CoincidentBlockerJointU5Ingress jointDeletion

/-- The original exact-five coincident-blocker residual unconditionally
reaches the concrete U5 incidence-bank ingress. -/
theorem nonempty_coincidentBlockerU5IngressOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) :
    Nonempty (CoincidentBlockerU5IngressOutcome R) := by
  rcases nonempty_coincidentBlockerFreshCommonDeletion R with
    ⟨freshDeletion⟩
  rcases nonempty_coincidentBlockerMutualOmissionCycle R freshDeletion with
    ⟨omissionCycle⟩
  rcases nonempty_coincidentBlockerJointDeletion R freshDeletion
      omissionCycle with
    ⟨jointDeletion⟩
  rcases jointDeletion.nonempty_u5Ingress with ⟨ingress⟩
  exact ⟨{
    freshDeletion := freshDeletion
    omissionCycle := omissionCycle
    jointDeletion := jointDeletion
    ingress := ingress }⟩

/-- Exact remaining consumer after the coincident-blocker branch has been
reduced to its U5 incidence-bank ingress. -/
def CoincidentBlockerU5IngressClosingStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Prop :=
  CoincidentBlockerU5IngressOutcome R → False

/-- Any terminal consumer of the concrete U5 ingress closes the original
exact-five coincident-blocker residual. -/
theorem false_of_u5IngressClosingStatement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (hclose : CoincidentBlockerU5IngressClosingStatement R) : False := by
  rcases nonempty_coincidentBlockerU5IngressOutcome R with ⟨outcome⟩
  exact hclose outcome

#print axioms CoincidentBlockerJointU5Ingress
#print axioms CoincidentBlockerJointDeletion.nonempty_u5Ingress
#print axioms CoincidentBlockerU5IngressOutcome
#print axioms nonempty_coincidentBlockerU5IngressOutcome
#print axioms CoincidentBlockerU5IngressClosingStatement
#print axioms false_of_u5IngressClosingStatement

end ATailUniqueFiveCoincidentDirectFalseScratch
end Problem97
