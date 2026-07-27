import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Audit lemma: the advertised output of the live source-exact collision-row
leaf is already impossible from checked pre-leaf results. -/
theorem audit_not_three_hit_or_collision_crossHit
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
  · rcases hthree with ⟨i, x, hx, r, hrich, hthree⟩
    have htwo :=
      criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
        S i H x hx hrich r
    omega
  · have homit :=
      exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_card
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support_card
        P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
        P.sources_ne Pρ.sources_ne hpairsDisjoint
    rcases hcross with h | h | h | h
    · exact homit.1 h
    · exact homit.2.1 h
    · exact homit.2.2.1 h
    · exact homit.2.2.2.1 h

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.audit_not_three_hit_or_collision_crossHit
