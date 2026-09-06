/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenThreeRowsTightAdapter
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBranchIngress

/-!
# Card-at-least-thirteen outcome dispatcher

The C3 two-radius split already has two source-clean stages: a strict-interior
uncovered packet versus an adjacent-cap grid, followed by the three-row
fresh/exact-thirteen-tight split.  This module composes those stages into one
proof-relevant outcome.  It deliberately stops at the geometric residuals;
no solver certificate or open terminal is hidden behind the dispatcher.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

/-- Every source-clean outcome retained by the card-at-least-thirteen C3
branch.  The first three constructors retain the strict-interior packet and
the corresponding finite row-cover residual; the uncovered branch also
retains the three row-disjointness proofs and the resulting cardinal bound;
the last retains the adjacent cap grid without weakening it to an existential
proposition. -/
inductive CardGeThirteenOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type
  | rowOverlap
      (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
      (h : ¬ Disjoint P.base.W.row₁.support P.base.W.row₂.support ∨
        ¬ Disjoint P.base.W.row₁.support P.base.thirdRow.support ∨
        ¬ Disjoint P.base.W.row₂.support P.base.thirdRow.support) :
      CardGeThirteenOutcome R firstRow secondRow
  | uncovered
      (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
      (q : ℝ²)
      (hq : q ∈ D.A)
      (houtside : q ∉ insert P.base.z
        ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
          P.base.thirdRow.support))
      (hdisj01 : Disjoint P.base.W.row₁.support P.base.W.row₂.support)
      (hdisj0K : Disjoint P.base.W.row₁.support P.base.thirdRow.support)
      (hdisj1K : Disjoint P.base.W.row₂.support P.base.thirdRow.support)
      (hcard14 : 14 ≤ D.A.card) :
      CardGeThirteenOutcome R firstRow secondRow
  | exactThirteenTight
      (P : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
      (ingress : ExactThirteenBranchIngress S)
      (hdisj01 : Disjoint P.base.W.row₁.support P.base.W.row₂.support)
      (hdisj0K : Disjoint P.base.W.row₁.support P.base.thirdRow.support)
      (hdisj1K : Disjoint P.base.W.row₂.support P.base.thirdRow.support)
      (hcover : D.A = insert P.base.z
        ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
          P.base.thirdRow.support))
      (hcard : D.A.card = 13) :
      CardGeThirteenOutcome R firstRow secondRow
  | adjacentGrid
      (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        firstRow.radius secondRow.radius) :
      CardGeThirteenOutcome R firstRow secondRow

/-- Compose the strict-interior C3 split with the three-row tight-cover split.
All hypotheses used by the two source producers remain explicit, and every
branch carries its packet data for a later terminal consumer. -/
theorem nonempty_cardGeThirteenOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty (CardGeThirteenOutcome R firstRow secondRow) := by
  rcases nonempty_cardGeThirteenUncoveredStrictInteriorPacket_or_exactAdjacentCapGrid
      R hcard surface rho otherRadius firstRow secondRow hradii hnoFive
        hfirstRadius hsecondRadius hdisjoint with hpacket | hgrid
  · rcases hpacket with ⟨P⟩
    by_cases hdisj01 :
        Disjoint P.base.W.row₁.support P.base.W.row₂.support
    · by_cases hdisj0K :
          Disjoint P.base.W.row₁.support P.base.thirdRow.support
      · by_cases hdisj1K :
            Disjoint P.base.W.row₂.support P.base.thirdRow.support
        · rcases cardGeThirteenPacket_fresh_or_exactThirteenTight_twoArm
              R hcard firstRow secondRow P.base with
            ⟨q, hq, houtside⟩ | ⟨hcard13, hcover, _, _, _⟩
          · have hdisj01K :
                Disjoint (P.base.W.row₁.support ∪ P.base.W.row₂.support)
                  P.base.thirdRow.support :=
              Finset.disjoint_union_left.mpr ⟨hdisj0K, hdisj1K⟩
            have hC01card :
                (P.base.W.row₁.support ∪ P.base.W.row₂.support).card = 8 := by
              rw [Finset.card_union_of_disjoint hdisj01,
                P.base.W.row₁.support_card, P.base.W.row₂.support_card]
            have hC01Kcard :
                ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                  P.base.thirdRow.support).card = 12 := by
              rw [Finset.card_union_of_disjoint hdisj01K, hC01card,
                P.base.thirdRow.support_card]
            have hzUnion :
                P.base.z ∉ (P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                  P.base.thirdRow.support := by
              simp [P.base.z_not_mem_row₁, P.base.z_not_mem_row₂,
                P.base.thirdRow_omits]
            have hTcard :
                (insert P.base.z
                  ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                    P.base.thirdRow.support)).card = 13 := by
              rw [Finset.card_insert_of_notMem hzUnion, hC01Kcard]
            have hQcard :
                (insert q (insert P.base.z
                  ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                    P.base.thirdRow.support))).card = 14 := by
              rw [Finset.card_insert_of_notMem houtside, hTcard]
            have hzA : P.base.z ∈ D.A := by
              rcases Finset.mem_union.mp P.base.z_mem_rows with hz | hz
              · exact firstRow.support_subset_A hz
              · exact secondRow.support_subset_A hz
            have hcoverSub :
                insert P.base.z
                    ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                      P.base.thirdRow.support) ⊆ D.A :=
              Finset.insert_subset hzA
                (Finset.union_subset
                  (Finset.union_subset P.base.W.row₁.support_subset_A
                    P.base.W.row₂.support_subset_A)
                  P.base.thirdRow.support_subset_A)
            have hQsub :
                insert q (insert P.base.z
                  ((P.base.W.row₁.support ∪ P.base.W.row₂.support) ∪
                    P.base.thirdRow.support)) ⊆ D.A :=
              Finset.insert_subset hq hcoverSub
            have hcard14 : 14 ≤ D.A.card := by
              rw [← hQcard]
              exact Finset.card_le_card hQsub
            exact ⟨.uncovered P q hq houtside hdisj01 hdisj0K hdisj1K
              hcard14⟩
          · obtain ⟨ingress⟩ :=
              ExactThirteenBranchIngress.of_twoRadiusBranch R surface rho
                otherRadius firstRow secondRow hradii hnoFive hfirstRadius
                hsecondRadius hdisjoint hcard13
            exact ⟨.exactThirteenTight P ingress hdisj01 hdisj0K hdisj1K
              hcover hcard13⟩
        · exact ⟨.rowOverlap P (Or.inr (Or.inr hdisj1K))⟩
      · exact ⟨.rowOverlap P (Or.inr (Or.inl hdisj0K))⟩
    · exact ⟨.rowOverlap P (Or.inl hdisj01)⟩
  · exact ⟨.adjacentGrid hgrid⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.nonempty_cardGeThirteenOutcome
