/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.AllLargeCapCanonicalInterfaces
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation
import Erdos9796Proof.P97.ATail.RetainedMatchingGeometricReduction
import Erdos9796Proof.P97.ATail.RetainedMatchingLargeCapConsumer

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFifteenApexProfile
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

/-- Source-faithful data retained after the fresh reverse-hit branch has been
turned into its nonreturning two-step walk.  The endpoint leaves below receive
this whole context, so the endpoint split does not erase the reverse-shell
localization or any freshness hypothesis. -/
structure ReverseHitFreshEndpointContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) : Type where
  reverse_mem :
    O.kept ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  reverseBlocker_mem_capInterior :
    H.centerAt O.deleted O.deleted_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  reverseShell_inter_cap_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {O.kept, O.deleted}
  fresh : ℝ²
  fresh_mem_capInterior :
    fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_kept : fresh ≠ O.kept
  fresh_ne_deleted : fresh ≠ O.deleted
  fresh_not_mem_reverseShell :
    fresh ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  freshPacket :
    CommonDeletionTwoCenterPacket
      D H fresh S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)
  allLarge : TriApexAllLargeContext D S
  walk : RetainedMatchingTwoStepCommonDeletionWalk R
  walk_first_eq : walk.first = O.kept
  walk_second_eq : walk.second = O.deleted
  walk_next_eq : walk.next = fresh

/- The two selected supports exposed at an endpoint collision.  One is the
critical exact shell through the first collision source; the other is the
fresh first-apex selected row. -/
noncomputable def endpointFreshTwoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E) : Finset ℝ² :=
  (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell.support ∪
    Q.row.support

/-- Both selected supports in the endpoint seed consist of carrier points. -/
theorem endpointFresh_twoShellSeed_subset_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W)
    (Q : EndpointFreshFirstApexRowSource E) :
    endpointFreshTwoShellSeed E Q ⊆ D.A := by
  intro z hz
  simp only [endpointFreshTwoShellSeed, Finset.mem_union] at hz
  rcases hz with hz | hz
  · exact
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell.support_subset_A hz
  · exact Q.row.support_subset_A hz

/-- Minimality and the all-large cap floor force a global K4 row to escape
the two supports already exposed by an endpoint collision.

This is the first all-center continuation beyond the locally realizable
shared-blocker two-circle pattern: the seed has at most eight points, whereas
the three large caps force at least fifteen carrier points. -/
theorem endpointFresh_exists_selectedRow_escape_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧ z ∉ endpointFreshTwoShellSeed E Q := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  have hseedSub : endpointFreshTwoShellSeed E Q ⊆ D.A :=
    endpointFresh_twoShellSeed_subset_carrier E Q
  have hseedNonempty : (endpointFreshTwoShellSeed E Q).Nonempty := by
    refine ⟨E.fiber.source₁.1, ?_⟩
    exact Finset.mem_union_left _ KA.q_mem_support
  have hseedCard : (endpointFreshTwoShellSeed E Q).card ≤ 8 := by
    calc
      (endpointFreshTwoShellSeed E Q).card
          ≤ KA.support.card + Q.row.support.card := by
            exact Finset.card_union_le KA.support Q.row.support
      _ = 8 := by rw [KA.support_card, Q.row.support_card]
  have hseedProper : endpointFreshTwoShellSeed E Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 8 := by
      simpa [hseedEq] using hseedCard
    have hAge : 15 ≤ D.A.card :=
      ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
        S C.allLarge.cap_card_ge_six
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 E.fiber.source₁.2 with
    ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

/-- Source-faithful refinement of the two-shell escape producer.

The escaping selected row can be retained together with a deletion
obstruction: either its center is fully deletion robust, or deleting the
escaping point exposes a critical selected four-class at that center.  This
is the form consumed by source-level continuation arguments; it does not
assert a preferred row or identify a selected support with a full physical
radius class.
-/
theorem endpointFresh_exists_criticalRow_escape_or_fullyDeletionRobust_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ endpointFreshTwoShellSeed E Q ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                      K.support = C.toCriticalFourShell.support) := by
  rcases
      endpointFresh_exists_selectedRow_escape_twoShellSeed
        R O C E Q with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, hcenter, K, z, hzK, hzOutside, ?_⟩
  by_cases hrobust : FullyDeletionRobustAt D center
  · exact Or.inl hrobust
  · right
    have hcenterA : center ∈ D.A :=
      endpointFresh_twoShellSeed_subset_carrier E Q hcenter
    exact
      exists_criticalSelectedFourClass_of_mem_of_not_fullyDeletionRobust
        hcenterA K hzK hrobust

end ATailFrontierLiveClosure
end Problem97
