import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Residual-field attack on the source-exact collision-row terminal

This scratch file isolates and checks the missing outside-overlap bridge and
records a finite incidence countermodel to the cap-eight-only route.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The exact local premise that would close the two collision-row target:
two shared support points outside the first opposite cap contradict the
ordered-cap uniqueness theorem for their distinct blocker centers. -/
theorem false_of_two_sourceExactCollisionRows_two_shared_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsharedOutside :
      2 ≤
        (((H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1) ∩
          ((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1)).card) :
    False := by
  have hPBlockerCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hPρBlockerCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hle :
      (((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1) ∩
        ((H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1)).card ≤ 1 :=
    selectedFourClass_outside_overlap_card_le_one
      S S.oppIndex1 hPBlockerCap hPρBlockerCap hblockersNe.symm
      (H.selectedAt P.source₁
        P.source₁_mem_A).toSelectedFourClass
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toSelectedFourClass
  omega

/-- Full-interface closure of the live source-exact collision-row target from
the one missing global incidence bridge: the two exact rows share two support
points outside the first opposite cap.  No assumption is discharged through
the production theorem under test. -/
theorem exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows_of_two_shared_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂)
    (hsharedOutside :
      2 ≤
        (((H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1) ∩
          ((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1)).card) :
    (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) ∨
      (Pρ.source₁ ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∨
        Pρ.source₂ ∈
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₁ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∨
            P.source₂ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  exact (false_of_two_sourceExactCollisionRows_two_shared_outside
    P Pρ hblockersNe hsharedOutside).elim

/-- A concrete finite incidence model showing why the `cap ≥ 8` arm alone
cannot close the local collision-row conclusion.  Both rows have four points,
meet the eight-point cap in disjoint exact pairs, have distinct in-cap centers,
and satisfy the cap-eight disjunction, while every cross hit and every shared
outside point is absent. -/
private def abstractCapEight : Finset (Fin 12) :=
  {0, 1, 2, 3, 4, 5, 6, 7}

private def abstractFirstRow : Finset (Fin 12) :=
  {0, 1, 8, 9}

private def abstractSecondRow : Finset (Fin 12) :=
  {2, 3, 10, 11}

theorem abstract_capEight_collisionRow_fragment_has_no_cross_hit :
    abstractCapEight.card = 8 ∧
    abstractFirstRow.card = 4 ∧
    abstractSecondRow.card = 4 ∧
    abstractFirstRow ∩ abstractCapEight = {0, 1} ∧
    abstractSecondRow ∩ abstractCapEight = {2, 3} ∧
    Disjoint ({0, 1} : Finset (Fin 12)) {2, 3} ∧
    (4 : Fin 12) ∈ abstractCapEight ∧
    (5 : Fin 12) ∈ abstractCapEight ∧
    (4 : Fin 12) ≠ 5 ∧
    (8 ≤ abstractCapEight.card ∨
      (4 : Fin 12) = 2 ∨ (4 : Fin 12) = 3 ∨
        (5 : Fin 12) = 0 ∨ (5 : Fin 12) = 1) ∧
    (2 : Fin 12) ∉ abstractFirstRow ∧
    (3 : Fin 12) ∉ abstractFirstRow ∧
    (0 : Fin 12) ∉ abstractSecondRow ∧
    (1 : Fin 12) ∉ abstractSecondRow ∧
    (((abstractFirstRow \ abstractCapEight) ∩
      (abstractSecondRow \ abstractCapEight)).card = 0) := by
  decide

#print axioms false_of_two_sourceExactCollisionRows_two_shared_outside
#print axioms
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows_of_two_shared_outside
#print axioms abstract_capEight_collisionRow_fragment_has_no_cross_hit

end ATailFrontierLiveClosure
end Problem97
