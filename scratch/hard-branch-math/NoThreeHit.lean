import Erdos9796Proof.P97.ATail.ApexRichClassStructure

/-!
# Hard-branch conclusion audit

The `three-hit` arm displayed by
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
is impossible independently of that theorem's collision-row hypotheses.
Its own `ApexRichClassStructure` witness invokes the imported two-circle
upper bound.

This file imports only the upstream rich-apex module, not
`FrontierLiveClosure`, so the check cannot use the live target or any
downstream declaration circularly.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace HardBranchMathScratch

open ATailApexRichClassStructure

/-- No canonical critical shell can have three strict-cap hits in one radius
class centered at an apex carrying the advertised rich-class structure. -/
theorem not_exists_canonical_three_hit_at_rich_apex
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

end HardBranchMathScratch
end Problem97

#print axioms
  Problem97.HardBranchMathScratch.not_exists_canonical_three_hit_at_rich_apex
