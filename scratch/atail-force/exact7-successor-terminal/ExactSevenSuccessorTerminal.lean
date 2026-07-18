/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Normal form of a source-as-successor-blocker occurrence

The exact-card-seven counting argument produces a physical source `q` whose
actual critical blocker is its transition successor.  This file records the
strongest source-clean consequence available from that occurrence without
inventing another row packet.

Global reverse membership makes the transition a permutation, so `q` has a
predecessor `p`.  The selected critical row at `q` is therefore exactly the
successor row of `p`: it meets the physical cap in `{p,q}` and has a
two-point outside residual `{a,b}`.  At its center `successor q`, deleting
`q` destroys K4 while deleting the center preserves K4.  These facts are
consistent.  The one already-consumed terminal antecedent is that `a,b` are
co-radial from the retained first apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSevenSuccessorTerminalScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

section NormalForm

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)

/-- A source whose actual blocker is its transition successor determines a
complete predecessor row.  The only additional metric fact needed by the
existing ordered-cap terminal is first-apex co-radiality of that row's exact
two-point outside residual. -/
theorem exists_predecessor_outsidePair_normalForm_of_center_eq_successor
    (q : PhysicalVertex profile)
    (hcenter :
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
        (A.transition.successor q).1) :
    ∃ p : PhysicalVertex profile, ∃ a b : ℝ²,
      A.transition.successor p = q ∧
        transitionReverseRowCenter A.transition p =
          (A.transition.successor q).1 ∧
        a ≠ b ∧
        transitionReverseOutsidePair A.transition p = {a, b} ∧
        a ∈ D.A \ S.capByIndex S.oppIndex2 ∧
        b ∈ D.A \ S.capByIndex S.oppIndex2 ∧
        ((H.selectedAt q.1
              (PhysicalVertex.mem_A q)).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex2) = {p.1, q.1} ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q.1)
          (A.transition.successor q).1 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase (A.transition.successor q).1)
          (A.transition.successor q).1 ∧
        (dist S.oppApex1 a = dist S.oppApex1 b → False) := by
  have hreverse (x : PhysicalVertex profile) :
      x.1 ∈
        (H.selectedAt (A.transition.successor x).1
          (PhysicalVertex.mem_A
            (A.transition.successor x))).toCriticalFourShell.support :=
    A.allReverse x (A.transition.successor x)
      (A.transition.successor_not_mem_actualCriticalSupport x)
  have hinjective : Function.Injective A.transition.successor :=
    transition_successor_injective_of_all_reverseMembership
      A.transition hreverse
  have hsurjective : Function.Surjective A.transition.successor :=
    Finite.injective_iff_surjective.mp hinjective
  rcases hsurjective q with ⟨p, hpq⟩
  rcases exists_transitionReverseOutsidePair_eq_pair
      A.transition hreverse p with ⟨a, b, hab, hpair⟩
  have haPair : a ∈ transitionReverseOutsidePair A.transition p := by
    rw [hpair]
    simp
  have hbPair : b ∈ transitionReverseOutsidePair A.transition p := by
    rw [hpair]
    simp
  have haOutside : a ∈ D.A \ S.capByIndex S.oppIndex2 :=
    transitionReverseOutsidePair_subset_complement A.transition p haPair
  have hbOutside : b ∈ D.A \ S.capByIndex S.oppIndex2 :=
    transitionReverseOutsidePair_subset_complement A.transition p hbPair
  have hrowCenter :
      transitionReverseRowCenter A.transition p =
        (A.transition.successor q).1 := by
    simp only [transitionReverseRowCenter, hpq]
    exact hcenter
  have hcapIntersection :
      ((H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2) = {p.1, q.1} := by
    have hcap :=
      transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
        A.transition hreverse p
    rw [hpq] at hcap
    exact hcap
  have hdeleteSourceFails :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q.1)
        (A.transition.successor q).1 := by
    simpa only [hcenter] using
      H.no_qfree_at q.1 (PhysicalVertex.mem_A q)
  have hdeleteCenterSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase (A.transition.successor q).1)
        (A.transition.successor q).1 := by
    simpa only [hcenter] using
      A.transition.successor_deletion_survives_actualBlocker q
  refine ⟨p, a, b, hpq, hrowCenter, hab, hpair, haOutside, hbOutside,
    hcapIntersection, hdeleteSourceFails, hdeleteCenterSurvives, ?_⟩
  intro hfirst
  exact false_of_transitionReverseOutsidePair_coRadial_firstApex
    A.transition hreverse p hab haPair hbPair hfirst

#print axioms exists_predecessor_outsidePair_normalForm_of_center_eq_successor

end NormalForm

end

end ATailExactSevenSuccessorTerminalScratch
end Problem97
