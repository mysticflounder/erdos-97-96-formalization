import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-! # Cross-blocker equality audit -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

theorem forward_first_blocker_eq_forces_not_corresponding_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hEq :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁) :
    Pρ.source₁ ∉
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← hEq]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem forward_second_blocker_eq_forces_not_corresponding_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hEq :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂) :
    Pρ.source₂ ∉
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← hEq]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem reverse_first_blocker_eq_forces_not_corresponding_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hEq :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁) :
    P.source₁ ∉
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← hEq]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem reverse_second_blocker_eq_forces_not_corresponding_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hEq :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    P.source₂ ∉
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← hEq]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem forward_first_blocker_eq_packet_only_recovers_nonself_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (hEq :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁) :
    H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₁ := by
  simpa only [hLPρ, hEq] using LPρ.packet.actual_blocker_ne_center₂

theorem forward_second_blocker_eq_packet_only_recovers_nonself_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (hEq :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂) :
    H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₂ := by
  simpa only [hLPρ, hEq] using LPρ.packet.actual_blocker_ne_center₂

theorem reverse_first_blocker_eq_packet_only_recovers_nonself_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (hEq :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁) :
    H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ := by
  simpa only [hLP, hEq] using LP.packet.actual_blocker_ne_center₂

theorem reverse_second_blocker_eq_packet_only_recovers_nonself_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (hEq :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
  simpa only [hLP, hEq] using LP.packet.actual_blocker_ne_center₂

theorem forward_cycle_only_recovers_distinct_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ) :
    H.centerAt P.source₁ P.source₁_mem_A ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
  rw [← MPρ.collisionSource_blocker_eq_commonBlocker]
  simpa only [hLPρ] using MPρ.blockers_ne

theorem reverse_cycle_only_recovers_distinct_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
      H.centerAt P.source₁ P.source₁_mem_A := by
  rw [← MP.collisionSource_blocker_eq_commonBlocker]
  simpa only [hLP] using MP.blockers_ne

theorem all_four_positive_cross_hits_are_impossible
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
    ¬
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
  have hcrossOmissions :=
    exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
      P.sources_ne Pρ.sources_ne hpairsDisjoint
  rintro (h | h | h | h)
  · exact hcrossOmissions.1 h
  · exact hcrossOmissions.2.1 h
  · exact hcrossOmissions.2.2.1 h
  · exact hcrossOmissions.2.2.2.1 h

/-- The complete advertised conclusion of the source-exact collision-row leaf
is already impossible from tri-apex richness and the exact cap slices.  Thus
an equality arm cannot be discharged by choosing a different arm of the
conclusion: it must derive `False` from additional global incidence data. -/
theorem sourceExactCollisionRows_advertised_conclusion_is_impossible
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
    ¬
      ((∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
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
  rintro (hthree | hcross)
  · rcases hthree with ⟨i, x, hx, r, hrich, hthree⟩
    have hle :
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card ≤ 2 :=
      criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
        S i H x hx hrich r
    omega
  · exact (all_four_positive_cross_hits_are_impossible P Pρ hpairsDisjoint)
      hcross

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.sourceExactCollisionRows_advertised_conclusion_is_impossible
