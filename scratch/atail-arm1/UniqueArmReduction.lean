import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Scratch: obstruction analysis for `OriginalFrontierUniqueRadiusArm F → False`

This file substantiates, in compiling Lean, the two structural facts the
"KEY IDEA" rests on, and reduces the target to its exact open residual.

The two `sorry`s are the genuine remaining obligations (deliberately left
open). Everything else compiles clean.
-/

open scoped EuclideanGeometry

namespace Problem97

open ATailOrientedPhysicalApexIngress
open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

noncomputable section

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}

/-- `q` lies in `oppApex1`'s radius class. -/
theorem pair_q_mem_class (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

/-- The frontier radius is positive (via `q` off-surplus, `oppApex1` in the
surplus cap). Replicates the private module argument, needing only `F.pair`. -/
theorem radius_pos_of_frontier (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

/-- FACT A (PROVEN). If the unique class has card ≥ 5, `oppApex1` is fully
deletion-robust. -/
theorem factA_robust_of_card_five (F : CriticalPairFrontier D S radius H)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    FullyDeletionRobustAt D S.oppApex1 :=
  fullyDeletionRobustAt_of_five_le_selectedClass (radius_pos_of_frontier F) hfive

/-- FACT B (PROVEN). Under the arm's uniqueness clause, if the unique class has
card exactly 4, `oppApex1` is NOT fully deletion-robust: deleting `q` (a class
member) destroys the only radius reaching four. -/
theorem factB_critical_of_card_four (F : CriticalPairFrontier D S radius H)
    (huniq : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius)
    (hcard4 : (SelectedClass D.A S.oppApex1 radius).card = 4) :
    ¬ FullyDeletionRobustAt D S.oppApex1 := by
  intro R
  have hsurv := R.survives F.pair.q F.pair.q_mem_A
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurv with
    ⟨rho, hrho, hcardrho⟩
  have hfullge : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    refine hcardrho.trans (Finset.card_le_card ?_)
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxE, hxd⟩
    exact mem_selectedClass.mpr ⟨Finset.mem_of_mem_erase hxE, hxd⟩
  have hrhoRadius : rho = radius := huniq rho hrho hfullge
  subst hrhoRadius
  have hqclass : F.pair.q ∈ SelectedClass D.A S.oppApex1 rho := pair_q_mem_class F
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hqclass, hcard4] at hcardrho
  omega

/-- TARGET (reduced). The unique-radius arm splits into two residuals, each of
which is left OPEN (the two `sorry`s). Both residuals lack the opposite-cap
size bounds `6 ≤ oppCap1.card`, `6 ≤ oppCap2.card`. -/
theorem unique_arm_false
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (arm : OriginalFrontierUniqueRadiusArm F) :
    False := by
  obtain ⟨hcard45, huniq⟩ := arm
  rcases hcard45 with hc4 | hc5
  · -- card = 4 branch. oppApex1 is NOT robust.
    have hnotrobust : ¬ FullyDeletionRobustAt D S.oppApex1 :=
      factB_critical_of_card_four F huniq hc4
    -- RESIDUAL 1 (OPEN): derive False from a non-robust `oppApex1` whose only
    -- radius reaching four has card 4, together with minimality + noM44.
    sorry
  · -- card = 5 branch. oppApex1 IS robust.
    have hrobust : FullyDeletionRobustAt D S.oppApex1 :=
      factA_robust_of_card_five F (by omega)
    -- RESIDUAL 2 (OPEN): derive False from a robust `oppApex1` WITHOUT the
    -- opposite-cap bounds and WITHOUT robustness at oppApex2 — strictly weaker
    -- hypotheses than the open `false_of_largeOppositeCapsBiApexRobust`.
    sorry

end

end Problem97

-- Axiom hygiene check for the two PROVEN facts (should be sorry-free):
#print axioms Problem97.factA_robust_of_card_five
#print axioms Problem97.factB_critical_of_card_four
#print axioms Problem97.radius_pos_of_frontier
