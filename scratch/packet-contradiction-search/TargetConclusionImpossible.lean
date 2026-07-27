import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
The advertised conclusion of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
is already impossible from the exact disjoint collision rows.

The three-hit arm violates the two-circle bound attached to its own
`ApexRichClassStructure` witness.  The four cross-hit arms violate the exact
closed-cap intersections of the two disjoint canonical source rows.

Thus the production leaf is logically a direct contradiction theorem for its
hypotheses; neither side of its displayed disjunction can be constructed
positively.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ScratchPacketContradictionSearch

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

theorem targetConclusion_impossible_of_exact_disjoint_collisionRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}) :
    ¬ ((∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
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
                  Pρ.source₁_mem_A).toCriticalFourShell.support)) := by
  intro hout
  rcases hout with hthree | hcross
  · obtain ⟨i, x, hx, r, hrich, hthree⟩ := hthree
    have htwo :=
      criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
        S i H x hx hrich r
    omega
  · have homissions :=
      exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_card
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support_card
        P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
        P.sources_ne Pρ.sources_ne hpairsDisjoint
    rcases hcross with hcross | hcross | hcross | hcross
    · exact homissions.1 hcross
    · exact homissions.2.1 hcross
    · exact homissions.2.2.1 hcross
    · exact homissions.2.2.2.1 hcross

end ScratchPacketContradictionSearch
end Problem97

#print axioms
  Problem97.ScratchPacketContradictionSearch.targetConclusion_impossible_of_exact_disjoint_collisionRows
