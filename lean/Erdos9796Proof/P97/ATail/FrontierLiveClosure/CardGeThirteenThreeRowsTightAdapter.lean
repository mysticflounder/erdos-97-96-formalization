/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.ThreeRowsFreshOrExactThirteenTight
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTerminalSplitV2

/-!
# Finite adapter for the card-thirteen three-row tight cover

This module translates the selected-four-class fields of the live uncovered
packet into the source-independent Finset cover theorem.  The packet itself
is only a card-at-least-thirteen packet and does not record pairwise
disjointness of its three retained supports.  Accordingly, the adapter keeps
the exact-cardinality and pairwise-disjointness facts as explicit premises;
the live branch must supply them before this theorem can be used.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

/-- The exact-cardinality, pairwise-disjoint arm of a CardGe three-center
packet is the insertion cover supplied by the pure Finset kernel. -/
theorem cardGeThirteenPacket_exactThirteenTight_of_disjointRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (hcard13 : D.A.card = 13)
    (hdisj01 : Disjoint P.W.row₁.support P.W.row₂.support)
    (hdisj0K : Disjoint P.W.row₁.support P.thirdRow.support)
    (hdisj1K : Disjoint P.W.row₂.support P.thirdRow.support) :
    D.A = insert P.z ((P.W.row₁.support ∪ P.W.row₂.support) ∪
      P.thirdRow.support) := by
  have hzA : P.z ∈ D.A := by
    rcases Finset.mem_union.mp P.z_mem_rows with hz | hz
    · exact firstRow.support_subset_A hz
    · exact secondRow.support_subset_A hz
  exact ThreeRowsFreshOrExactThirteenTight
    hcard13 hzA
    P.W.row₁.support_card P.W.row₂.support_card P.thirdRow.support_card
    P.W.row₁.support_subset_A P.W.row₂.support_subset_A
      P.thirdRow.support_subset_A
    P.z_not_mem_row₁ P.z_not_mem_row₂ P.thirdRow_omits
    hdisj01 hdisj0K hdisj1K

/-- The packet-facing unconditional split.  The producer supplies the
`12 < D.A.card` bound; all row facts and the distinguished-point membership
are read directly from the packet, so no exact-cardinality or disjointness
premise is smuggled into this dichotomy. -/
theorem cardGeThirteenPacket_fresh_or_exactThirteenTight
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow) :
    (¬ Disjoint P.W.row₁.support P.W.row₂.support ∨
        ¬ Disjoint P.W.row₁.support P.thirdRow.support ∨
        ¬ Disjoint P.W.row₂.support P.thirdRow.support) ∨
      (∃ q ∈ D.A, q ∉ insert P.z ((P.W.row₁.support ∪
        P.W.row₂.support) ∪ P.thirdRow.support)) ∨
      (D.A = insert P.z ((P.W.row₁.support ∪ P.W.row₂.support) ∪
        P.thirdRow.support) ∧ D.A.card = 13) := by
  have hzA : P.z ∈ D.A := by
    rcases Finset.mem_union.mp P.z_mem_rows with hz | hz
    · exact firstRow.support_subset_A hz
    · exact secondRow.support_subset_A hz
  exact ThreeRowsFreshOrExactThirteenTight_split
    hcard hzA
    P.W.row₁.support_card P.W.row₂.support_card P.thirdRow.support_card
    P.W.row₁.support_subset_A P.W.row₂.support_subset_A
      P.thirdRow.support_subset_A
    P.z_not_mem_row₁ P.z_not_mem_row₂ P.thirdRow_omits

private theorem pairwise_disjoint_of_exactThirteenCover
    {α : Type*} [DecidableEq α]
    {A C0 C1 K : Finset α} {z : α}
    (hA : A.card = 13)
    (hC0card : C0.card = 4)
    (hC1card : C1.card = 4)
    (hKcard : K.card = 4)
    (hzC0 : z ∉ C0)
    (hzC1 : z ∉ C1)
    (hzK : z ∉ K)
    (hcover : A = insert z ((C0 ∪ C1) ∪ K)) :
    Disjoint C0 C1 ∧ Disjoint C0 K ∧ Disjoint C1 K := by
  have hzUnion : z ∉ (C0 ∪ C1) ∪ K := by
    simp [hzC0, hzC1, hzK]
  have hunionCard : ((C0 ∪ C1) ∪ K).card = 12 := by
    have hcard13 : (insert z ((C0 ∪ C1) ∪ K)).card = 13 := by
      simpa [hcover] using hA
    rw [Finset.card_insert_of_notMem hzUnion] at hcard13
    omega
  have pairContradiction :
      ∀ (X Y Z : Finset α),
        X.card = 4 → Y.card = 4 → Z.card = 4 →
        ¬ Disjoint X Y → ((X ∪ Y) ∪ Z).card = 12 → False := by
    intro X Y Z hXcard hYcard hZcard hnot htotal
    have hinterPos : 0 < (X ∩ Y).card := by
      exact Finset.card_pos.mpr
        (Finset.not_disjoint_iff_nonempty_inter.mp hnot)
    have hsum := Finset.card_union_add_card_inter X Y
    rw [hXcard, hYcard] at hsum
    have hXYlt : (X ∪ Y).card < 8 := by
      omega
    have htotalLe : ((X ∪ Y) ∪ Z).card ≤ (X ∪ Y).card + Z.card :=
      Finset.card_union_le _ _
    omega
  have hdisj01 : Disjoint C0 C1 := by
    by_contra hnot
    exact pairContradiction C0 C1 K hC0card hC1card hKcard hnot hunionCard
  have hdisj0K : Disjoint C0 K := by
    by_contra hnot
    exact pairContradiction C0 K C1 hC0card hKcard hC1card hnot (by
      simpa [Finset.union_assoc, Finset.union_comm, Finset.union_left_comm]
        using hunionCard)
  have hdisj1K : Disjoint C1 K := by
    by_contra hnot
    exact pairContradiction C1 K C0 hC1card hKcard hC0card hnot (by
      simpa [Finset.union_assoc, Finset.union_comm, Finset.union_left_comm]
        using hunionCard)
  exact ⟨hdisj01, hdisj0K, hdisj1K⟩

/-! The overlap arms of the finite three-row split are impossible once the
ambient set is contained in the insertion cover.  This gives the compact
two-arm form used by consumers that only need a fresh point or the exact
thirteen-point tight cover. -/
theorem threeRowsFresh_or_exactThirteenTight_twoArm
    {α : Type*} [DecidableEq α]
    {A C0 C1 K : Finset α} {z : α}
    (hcard : 12 < A.card)
    (hzA : z ∈ A)
    (hC0card : C0.card = 4)
    (hC1card : C1.card = 4)
    (hKcard : K.card = 4)
    (hC0sub : C0 ⊆ A)
    (hC1sub : C1 ⊆ A)
    (hKsub : K ⊆ A)
    (hzC0 : z ∉ C0)
    (hzC1 : z ∉ C1)
    (hzK : z ∉ K) :
    (∃ q ∈ A, q ∉ insert z ((C0 ∪ C1) ∪ K)) ∨
      (A.card = 13 ∧ A = insert z ((C0 ∪ C1) ∪ K) ∧
        Disjoint C0 C1 ∧ Disjoint C0 K ∧ Disjoint C1 K) := by
  have hTsub : insert z ((C0 ∪ C1) ∪ K) ⊆ A := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hzA
    · rcases Finset.mem_union.mp hx with hx | hx
      · rcases Finset.mem_union.mp hx with hx | hx
        · exact hC0sub hx
        · exact hC1sub hx
      · exact hKsub hx
  by_cases hAT : A ⊆ insert z ((C0 ∪ C1) ∪ K)
  · have hEq : A = insert z ((C0 ∪ C1) ∪ K) :=
      Finset.Subset.antisymm hAT hTsub
    have hzUnion : z ∉ (C0 ∪ C1) ∪ K := by
      simp [hzC0, hzC1, hzK]
    have hTcard : (insert z ((C0 ∪ C1) ∪ K)).card ≤ 13 := by
      rw [Finset.card_insert_of_notMem hzUnion]
      have hC01 : (C0 ∪ C1).card ≤ C0.card + C1.card :=
        Finset.card_union_le _ _
      have hC01K : ((C0 ∪ C1) ∪ K).card ≤
          (C0 ∪ C1).card + K.card := Finset.card_union_le _ _
      omega
    have hAcard_le : A.card ≤ 13 := by
      calc
        A.card = (insert z ((C0 ∪ C1) ∪ K)).card := congrArg Finset.card hEq
        _ ≤ 13 := hTcard
    have hAcard : A.card = 13 := by omega
    have hdisj := pairwise_disjoint_of_exactThirteenCover
      hAcard hC0card hC1card hKcard hzC0 hzC1 hzK hEq
    exact Or.inr ⟨hAcard, hEq, hdisj.1, hdisj.2.1, hdisj.2.2⟩
  · rcases Finset.not_subset.mp hAT with ⟨q, hqA, hqT⟩
    exact Or.inl ⟨q, hqA, hqT⟩

/-- Packet adapter for the compact two-arm three-row split. -/
theorem cardGeThirteenPacket_fresh_or_exactThirteenTight_twoArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow) :
    (∃ q ∈ D.A, q ∉ insert P.z ((P.W.row₁.support ∪
      P.W.row₂.support) ∪ P.thirdRow.support)) ∨
      (D.A.card = 13 ∧
        D.A = insert P.z ((P.W.row₁.support ∪ P.W.row₂.support) ∪
          P.thirdRow.support) ∧
        Disjoint P.W.row₁.support P.W.row₂.support ∧
        Disjoint P.W.row₁.support P.thirdRow.support ∧
        Disjoint P.W.row₂.support P.thirdRow.support) := by
  have hzA : P.z ∈ D.A := by
    rcases Finset.mem_union.mp P.z_mem_rows with hz | hz
    · exact firstRow.support_subset_A hz
    · exact secondRow.support_subset_A hz
  exact threeRowsFresh_or_exactThirteenTight_twoArm
    hcard hzA
    P.W.row₁.support_card P.W.row₂.support_card P.thirdRow.support_card
    P.W.row₁.support_subset_A P.W.row₂.support_subset_A
      P.thirdRow.support_subset_A
    P.z_not_mem_row₁ P.z_not_mem_row₂ P.thirdRow_omits

/-- A proof-relevant version of the three-row finite split.  The packet is an
index of every constructor, so the row cards, subsets, and omissions remain
available to downstream finite classifiers.  In particular, the tight arm
retains the pairwise-disjointness proofs that are implicit in its exact
thirteen-point cover. -/
inductive CardGeThirteenThreeRowsTightOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow) : Prop
  | overlap01
      (h : ¬ Disjoint P.W.row₁.support P.W.row₂.support) :
      CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P
  | overlap0K
      (h : ¬ Disjoint P.W.row₁.support P.thirdRow.support) :
      CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P
  | overlap1K
      (h : ¬ Disjoint P.W.row₂.support P.thirdRow.support) :
      CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P
  | fresh
      (q : ℝ²)
      (hqA : q ∈ D.A)
      (hq : q ∉ insert P.z ((P.W.row₁.support ∪ P.W.row₂.support) ∪
        P.thirdRow.support)) :
      CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P
  | tight
      (hdisj01 : Disjoint P.W.row₁.support P.W.row₂.support)
      (hdisj0K : Disjoint P.W.row₁.support P.thirdRow.support)
      (hdisj1K : Disjoint P.W.row₂.support P.thirdRow.support)
      (hcover : D.A = insert P.z ((P.W.row₁.support ∪ P.W.row₂.support) ∪
        P.thirdRow.support))
      (hcard13 : D.A.card = 13) :
      CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P

/-- Packet adapter for the proof-relevant three-row split.  The only external
cardinality premise is `12 < D.A.card`; all exact-row premises are projected
from the uncovered packet, and the tight arm reconstructs disjointness from
the exact thirteen-point cover. -/
theorem cardGeThirteenPacket_fresh_or_exactThirteenTight_provenance
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (P : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow) :
    CardGeThirteenThreeRowsTightOutcome R firstRow secondRow P := by
  have hzA : P.z ∈ D.A := by
    rcases Finset.mem_union.mp P.z_mem_rows with hz | hz
    · exact firstRow.support_subset_A hz
    · exact secondRow.support_subset_A hz
  rcases cardGeThirteenPacket_fresh_or_exactThirteenTight
      R hcard firstRow secondRow P with hoverlap | hfresh | htight
  · rcases hoverlap with h01 | h0K | h1K
    · exact .overlap01 h01
    · exact .overlap0K h0K
    · exact .overlap1K h1K
  · rcases hfresh with ⟨q, hqA, hq⟩
    exact .fresh q hqA hq
  · have hdisj := pairwise_disjoint_of_exactThirteenCover
      htight.2
      P.W.row₁.support_card P.W.row₂.support_card P.thirdRow.support_card
      P.z_not_mem_row₁ P.z_not_mem_row₂ P.thirdRow_omits htight.1
    exact .tight hdisj.1 hdisj.2.1 hdisj.2.2 htight.1 htight.2

end ATailFrontierLiveClosure
end Problem97
