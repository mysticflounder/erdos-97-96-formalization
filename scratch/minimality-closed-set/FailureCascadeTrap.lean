import FailureCascade
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# The exact invariant needed to trap a failure cascade

This file isolates the induction principle required by a first-cap deletion
argument.  It does not assert that the production collision packets establish
the hypothesis below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMinimalityClosedSet

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- The deletion seed naturally supplied by two first-cap collision rows:
their four sources and their two common blockers. -/
noncomputable def twoCollisionDeletionSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Finset ℝ² :=
  {P.source₁, P.source₂,
    H.centerAt P.source₁ P.source₁_mem_A,
    Pρ.source₁, Pρ.source₂,
    H.centerAt Pρ.source₁ Pρ.source₁_mem_A}

/-- The two-collision deletion seed is nonempty. -/
theorem twoCollisionDeletionSeed_nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    (twoCollisionDeletionSeed P Pρ).Nonempty := by
  exact ⟨P.source₁, by simp [twoCollisionDeletionSeed]⟩

/-- Both collision source pairs and both common blockers lie in the indexed
first cap.  No localized-deletion or mutual-omission hypothesis is needed. -/
theorem twoCollisionDeletionSeed_subset_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    twoCollisionDeletionSeed P Pρ ⊆ S.capByIndex S.oppIndex1 := by
  intro x hx
  simp only [twoCollisionDeletionSeed, Finset.mem_insert,
    Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior

/-- Every indexed closed cap omits its opposite triangle vertex, so it is a
proper subset of the carrier. -/
theorem exists_carrier_point_outside_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    ∃ x : ℝ², x ∈ A ∧ x ∉ S.capByIndex i := by
  fin_cases i
  · exact ⟨S.triangle.v1, S.triangle.v1_mem,
      S.partition.v1_notin_C1⟩
  · exact ⟨S.triangle.v2, S.triangle.v2_mem,
      S.partition.v2_notin_C2⟩
  · exact ⟨S.triangle.v3, S.triangle.v3_mem,
      S.partition.v3_notin_C3⟩

/-- A failure cascade whose every possible next failed center remains in `C`
cannot leave `C`.

The closure hypothesis is deliberately quantified over every intermediate
deleted set `W ⊆ C`: global minimality supplies a failed center, but does not
control which failed center is supplied. -/
theorem FailureCascade.end_subset_of_failure_trap
    {D : CounterexampleData} {U V C : Finset ℝ²}
    (hUV : FailureCascade D U V)
    (hU : U ⊆ C)
    (htrap :
      ∀ W : Finset ℝ², W ⊆ C →
        ∀ center : ℝ², center ∈ D.A \ W →
          ¬ HasNEquidistantPointsAt 4 (D.A \ W) center →
          center ∈ C) :
    V ⊆ C := by
  induction hUV with
  | refl =>
      exact hU
  | @delete W _ center hcenter hblocked _ ih =>
      apply ih
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hxW
      · exact htrap _ hU _ hcenter hblocked
      · exact hU hxW

#print axioms FailureCascade.end_subset_of_failure_trap
#print axioms twoCollisionDeletionSeed_nonempty
#print axioms twoCollisionDeletionSeed_subset_firstCap
#print axioms exists_carrier_point_outside_capByIndex

end ATailMinimalityClosedSet
end Problem97
