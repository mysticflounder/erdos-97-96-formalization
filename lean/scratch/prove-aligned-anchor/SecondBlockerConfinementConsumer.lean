import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Second-blocker confinement consumer

Source-clean check of the exact bounded-support bridge needed by the aligned
singleton-radius/nonbisector leaf.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- A bounded-support confinement of the second collision row to the two
off-cap points named by the enlarged first blocker fiber immediately
contradicts second-blocker non-bisection.

This is the source-clean consumer for the missing geometric producer; it does
not use any terminal theorem from `FrontierLiveClosure`. -/
theorem false_of_secondBlockerOutsideSupport_confinement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hconfined :
      (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 ⊆
        ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²))
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have houtsideCard : K.card = 2 := by
    rcases
        exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_card
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_card
          P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
          P.sources_ne Pρ.sources_ne hpairsDisjoint with
      ⟨_, _, _, _, _, hcard⟩
    exact hcard
  have hK :
      K = ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
    apply Finset.eq_of_subset_of_card_le hconfined
    rw [houtsideCard]
    exact Finset.card_le_two
  have hsourceMem :
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    have : Q.source.1 ∈ K := by
      rw [hK]
      simp
    exact (Finset.mem_sdiff.mp this).1
  have hotherMem :
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    have : Q.otherOutsidePoint ∈ K := by
      rw [hK]
      simp
    exact (Finset.mem_sdiff.mp this).1
  apply hsecondNe
  exact
    ((H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 hsourceMem).trans
      ((H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint hotherMem).symm

#print axioms false_of_secondBlockerOutsideSupport_confinement

end Problem97.ATailFrontierLiveClosure
