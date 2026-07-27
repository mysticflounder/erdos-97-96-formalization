import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Cross-blocker coincidence audit

The first four theorems record a source-level obstruction in the live
two-collision-row interface: a blocker/source coincidence makes the
corresponding named cross hit false, because a critical shell never contains
its own center.

The remaining theorems give an exact rational strictly-convex model of the
ordered-cap geometry in which one blocker is a source of the other row.
Thus ordered-cap and Kalmanson geometry alone cannot refute any of the four
cross-blocker coincidence arms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CrossBlockerCoincidenceAudit

open ATailCriticalPairFrontier
open ATailApexRichClassStructure
open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

theorem firstBlocker_eq_secondSource₁_not_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁) :
    Pρ.source₁ ∉
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem firstBlocker_eq_secondSource₂_not_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂) :
    Pρ.source₂ ∉
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem secondBlocker_eq_firstSource₁_not_mem_secondShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁) :
    P.source₁ ∉
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

theorem secondBlocker_eq_firstSource₂_not_mem_secondShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    P.source₂ ∉
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

/-- The displayed conclusion of the live coincidence leaf is already
impossible from the two exact disjoint collision rows.  Consequently any
proof of that leaf must first derive `False` from its global hypotheses; none
of the displayed alternatives can be constructed positively. -/
theorem targetConclusion_impossible_of_exactDisjointCollisionRows
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

abbrev Pt := ℚ × ℚ

def sqDist (x y : Pt) : ℚ :=
  (x.1 - y.1) ^ 2 + (x.2 - y.2) ^ 2

def orient (x y z : Pt) : ℚ :=
  (y.1 - x.1) * (z.2 - x.2) - (y.2 - x.2) * (z.1 - x.1)

def betweenX (b x y : Pt) : Prop :=
  (x.1 < b.1 ∧ b.1 < y.1) ∨ (y.1 < b.1 ∧ b.1 < x.1)

def CollisionRows (b₀ p q b₁ u v : Pt) : Prop :=
  p ≠ q ∧ u ≠ v ∧
    Disjoint ({p, q} : Finset Pt) {u, v} ∧
    b₀ ≠ b₁ ∧
    betweenX b₀ p q ∧ betweenX b₁ u v ∧
    sqDist b₀ p = sqDist b₀ q ∧
    sqDist b₁ u = sqDist b₁ v

def a : Pt := (1, 15 / 4)
def p : Pt := (0, 1)
def u : Pt := (1, 0)
def q : Pt := (2, 1)
def b₁ : Pt := (3, 11 / 4)
def v : Pt := (4, 6)
def b₀ : Pt := u

theorem common_apex_two_distinct_radii :
    sqDist a p = sqDist a q ∧
      sqDist a u = sqDist a v ∧
      sqDist a p ≠ sqDist a u := by
  norm_num [sqDist, a, p, q, u, v]

theorem first_blocker_eq_second_source_realizable :
    CollisionRows b₀ p q b₁ u v ∧ b₀ = u := by
  norm_num [CollisionRows, betweenX, sqDist, b₀, b₁, p, q, u, v,
    Finset.disjoint_left]

theorem strict_convex_full_order :
    0 < orient a p u ∧
    0 < orient a p q ∧
    0 < orient a p b₁ ∧
    0 < orient a p v ∧
    0 < orient a u q ∧
    0 < orient a u b₁ ∧
    0 < orient a u v ∧
    0 < orient a q b₁ ∧
    0 < orient a q v ∧
    0 < orient a b₁ v ∧
    0 < orient p u q ∧
    0 < orient p u b₁ ∧
    0 < orient p u v ∧
    0 < orient p q b₁ ∧
    0 < orient p q v ∧
    0 < orient p b₁ v ∧
    0 < orient u q b₁ ∧
    0 < orient u q v ∧
    0 < orient u b₁ v ∧
    0 < orient q b₁ v := by
  norm_num [orient, a, p, q, u, v, b₁]

theorem all_four_cross_equalities_by_relabeling :
    (CollisionRows b₀ p q b₁ u v ∧ b₀ = u) ∧
    (CollisionRows b₀ p q b₁ v u ∧ b₀ = u) ∧
    (CollisionRows b₁ u v b₀ p q ∧ b₀ = u) ∧
    (CollisionRows b₁ v u b₀ p q ∧ b₀ = u) := by
  norm_num [CollisionRows, betweenX, sqDist, b₀, b₁, p, q, u, v,
    Finset.disjoint_left]

end CrossBlockerCoincidenceAudit
end Problem97

#print axioms Problem97.CrossBlockerCoincidenceAudit.firstBlocker_eq_secondSource₁_not_mem_firstShell
#print axioms Problem97.CrossBlockerCoincidenceAudit.firstBlocker_eq_secondSource₂_not_mem_firstShell
#print axioms Problem97.CrossBlockerCoincidenceAudit.secondBlocker_eq_firstSource₁_not_mem_secondShell
#print axioms Problem97.CrossBlockerCoincidenceAudit.secondBlocker_eq_firstSource₂_not_mem_secondShell
#print axioms Problem97.CrossBlockerCoincidenceAudit.targetConclusion_impossible_of_exactDisjointCollisionRows
#print axioms Problem97.CrossBlockerCoincidenceAudit.common_apex_two_distinct_radii
#print axioms Problem97.CrossBlockerCoincidenceAudit.first_blocker_eq_second_source_realizable
#print axioms Problem97.CrossBlockerCoincidenceAudit.strict_convex_full_order
#print axioms Problem97.CrossBlockerCoincidenceAudit.all_four_cross_equalities_by_relabeling
