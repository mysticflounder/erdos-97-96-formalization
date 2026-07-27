import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Two-collision cap-partition bridge audit

Checked reductions for the cap-eight third-blocker output and the live
three-hit-or-cross-hit target.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace TwoCollisionCapPartitionBridgeScratch

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The deletion-survival output of the cap-eight third-blocker producer is
exactly a pair of disjunctive omissions in the third source's critical shell. -/
theorem crossPairDeletionSurvivals_iff_crossPairOmissions
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source q₁ q₂ q₃ q₄ : ℝ²} (hsource : source ∈ D.A) :
    ((HasNEquidistantPointsAt 4 (D.A.erase q₁)
          (H.centerAt source hsource) ∨
        HasNEquidistantPointsAt 4 (D.A.erase q₂)
          (H.centerAt source hsource)) ∧
      (HasNEquidistantPointsAt 4 (D.A.erase q₃)
          (H.centerAt source hsource) ∨
        HasNEquidistantPointsAt 4 (D.A.erase q₄)
          (H.centerAt source hsource))) ↔
    ((q₁ ∉ (H.selectedAt source hsource).toCriticalFourShell.support ∨
        q₂ ∉ (H.selectedAt source hsource).toCriticalFourShell.support) ∧
      (q₃ ∉ (H.selectedAt source hsource).toCriticalFourShell.support ∨
        q₄ ∉ (H.selectedAt source hsource).toCriticalFourShell.support)) := by
  simp only [cross_deletion_survives_iff_not_mem_selected_support H hsource]

/-- A canonical critical shell can never be the requested three-hit witness
at a rich Moser apex: the rich apex is deletion-robust, so the two circle
centres differ and their classes meet in at most two points. -/
theorem not_exists_richApex_threeHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} :
    ¬ (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) := by
  rintro ⟨i, x, hx, r, hrich, hthree⟩
  have htwo :=
    criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  omega

/-- Consequently, a disjunction of the exact target shape is equivalent to
its collision-cross-hit arm. -/
theorem threeHit_or_crossHit_iff_crossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} (CrossHit : Prop) :
    ((∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
          3 ≤
            ((H.selectedAt x hx).toCriticalFourShell.support ∩
              (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
                S.capInteriorByIndex i)).card) ∨ CrossHit) ↔
      CrossHit := by
  constructor
  · rintro (hthree | hcross)
    · exact False.elim (not_exists_richApex_threeHit hthree)
    · exact hcross
  · exact Or.inr

/-- The exact non-three-hit arm of the live collision-row target. -/
def CollisionCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  Pρ.source₁ ∈
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
    Pρ.source₂ ∈
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∨
      P.source₁ ∈
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∨
        P.source₂ ∈
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support

/-- At the exact production types, the desired disjunction reduces to the
four named collision cross memberships. -/
theorem threeHit_or_collisionCrossHit_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    ((∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
          3 ≤
            ((H.selectedAt x hx).toCriticalFourShell.support ∩
              (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
                S.capInteriorByIndex i)).card) ∨
      CollisionCrossHit P Pρ) ↔ CollisionCrossHit P Pρ :=
  threeHit_or_crossHit_iff_crossHit (CollisionCrossHit P Pρ)

#print axioms crossPairDeletionSurvivals_iff_crossPairOmissions
#print axioms not_exists_richApex_threeHit
#print axioms threeHit_or_collisionCrossHit_iff

end TwoCollisionCapPartitionBridgeScratch
end Problem97
