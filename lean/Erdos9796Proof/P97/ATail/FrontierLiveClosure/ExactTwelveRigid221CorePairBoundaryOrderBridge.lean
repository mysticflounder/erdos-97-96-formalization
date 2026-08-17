/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CenterExchangeBoundaryOrderBridge

/-!
# Core-pair orientation bridge for the canonical boundary orders

The center-exchange check `centerExchangeOrientedAll48` admits a five-point
role assignment when, in each of the forty-eight canonical boundary orders,
that assignment or its center exchange is oriented.  A five-point membership
pattern can escape that check while still being unorientable in every order:
one core assignment orients one part of the order deck and a *second* core
assignment on the same labels orients the rest, with neither core covering
all forty-eight orders alone.

This file widens the decidable check to an unordered pair of core
assignments.  `corePairOrientedAll48` requires, in each canonical order, that
one of the four orientations

* `(a₁, x₁, b₁, c₁, y₁)`, its center exchange `(a₁, y₁, b₁, c₁, x₁)`,
* `(a₂, x₂, b₂, c₂, y₂)`, its center exchange `(a₂, y₂, b₂, c₂, x₂)`

holds.  The transfer bridge then yields, for every realized frozen boundary
order, the four-way orientation disjunction.  The consumer case-splits on it
and refutes with the corresponding core; because the checked membership rows
of both cores are consumed together, every branch has the rows it needs.  The
center-exchange check is the degenerate case of this one in which the two core
assignments coincide.

The private position-transfer helpers are re-derived here rather than shared:
their counterparts in the center-exchange bridge are file-private, and that
file is pinned by a frozen bank attestation, so it is not edited.

This is a decidable-check bridge, not terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual, and it
asserts no orbit cardinality.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress

/- ## The core-pair decidable check -/

/-- Boolean check that in each of the forty-eight canonical boundary orders
the five-point orientation fact holds for one of the two role assignments
`(a₁, x₁, b₁, c₁, y₁)` and `(a₂, x₂, b₂, c₂, y₂)`, each up to exchanging its
own two pair-centers. -/
def corePairOrientedAll48
    (a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ : Label) : Bool :=
  canonicalBoundaryOrders.all fun L =>
    decide (CommonFiveOrientationAt (positionInList L) a₁ x₁ b₁ c₁ y₁) ||
      (decide (CommonFiveOrientationAt (positionInList L) a₁ y₁ b₁ c₁ x₁) ||
        (decide (CommonFiveOrientationAt (positionInList L) a₂ x₂ b₂ c₂ y₂) ||
          decide (CommonFiveOrientationAt (positionInList L) a₂ y₂ b₂ c₂ x₂)))

/-- Soundness of `corePairOrientedAll48`: the Boolean check is true exactly
when every canonical position map orients one of the two assignments, each up
to its own center exchange. -/
theorem corePairOrientedAll48_eq_true_iff
    (a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ : Label) :
    corePairOrientedAll48 a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ = true ↔
      ∀ L ∈ canonicalBoundaryOrders,
        CommonFiveOrientationAt (positionInList L) a₁ x₁ b₁ c₁ y₁ ∨
          CommonFiveOrientationAt (positionInList L) a₁ y₁ b₁ c₁ x₁ ∨
            CommonFiveOrientationAt (positionInList L) a₂ x₂ b₂ c₂ y₂ ∨
              CommonFiveOrientationAt (positionInList L) a₂ y₂ b₂ c₂ x₂ := by
  unfold corePairOrientedAll48
  simp only [List.all_eq_true, Bool.or_eq_true, decide_eq_true_eq]

/- ## The core-pair transfer bridge -/

private theorem cyclicTripleAt_of_orderIso' {p q : Label → Nat}
    (hagree : ∀ i j : Label, p i < p j ↔ q i < q j) {a b c : Label}
    (h : CyclicTripleAt p a b c) : CyclicTripleAt q a b c := by
  unfold CyclicTripleAt at h ⊢
  simp only [hagree] at h
  exact h

private theorem commonFiveOrientationAt_of_orderIso' {p q : Label → Nat}
    (hagree : ∀ i j : Label, p i < p j ↔ q i < q j) {a x b c y : Label}
    (h : CommonFiveOrientationAt p a x b c y) :
    CommonFiveOrientationAt q a x b c y := by
  unfold CommonFiveOrientationAt at h ⊢
  rcases h with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact Or.inl ⟨cyclicTripleAt_of_orderIso' hagree h₁,
      cyclicTripleAt_of_orderIso' hagree h₂⟩
  · exact Or.inr ⟨cyclicTripleAt_of_orderIso' hagree h₁,
      cyclicTripleAt_of_orderIso' hagree h₂⟩

/-- Core-pair bridge at position level: when in each of the forty-eight
canonical boundary orders one of the two role assignments is oriented up to
its own center exchange, every injective position map satisfying the frozen
block hypotheses and the forced second-cap order orients one of the four
assignments. -/
theorem commonFiveOrientationAt_corePair_of_frozenBlocks
    {position : Label → Nat}
    (hinj : Function.Injective position)
    (hblocks : FrozenDirectBoundaryOrder position ∨
      FrozenMirrorBoundaryOrder position)
    (hforced : FrozenForcedSecondCapOrder position)
    {a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ : Label}
    (horiented : corePairOrientedAll48 a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ = true) :
    CommonFiveOrientationAt position a₁ x₁ b₁ c₁ y₁ ∨
      CommonFiveOrientationAt position a₁ y₁ b₁ c₁ x₁ ∨
        CommonFiveOrientationAt position a₂ x₂ b₂ c₂ y₂ ∨
          CommonFiveOrientationAt position a₂ y₂ b₂ c₂ x₂ := by
  obtain ⟨L, hmem, hagree⟩ :=
    exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks hinj hblocks hforced
  rcases (corePairOrientedAll48_eq_true_iff a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂).mp
      horiented L hmem with h | h | h | h
  · exact Or.inl (commonFiveOrientationAt_of_orderIso' hagree h)
  · exact Or.inr (Or.inl (commonFiveOrientationAt_of_orderIso' hagree h))
  · exact Or.inr (Or.inr (Or.inl (commonFiveOrientationAt_of_orderIso' hagree h)))
  · exact Or.inr (Or.inr (Or.inr (commonFiveOrientationAt_of_orderIso' hagree h)))

/-- Core-pair bridge for a realized frozen boundary order: the packaged
`FrozenBoundaryOrder` supplies the injectivity and the direct-or-mirror block
structure, so the core-pair check yields the four-way orientation
disjunction. -/
theorem FrozenBoundaryOrder.commonFiveOrientationAt_corePair
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ : Label}
    (horiented : corePairOrientedAll48 a₁ x₁ b₁ c₁ y₁ a₂ x₂ b₂ c₂ y₂ = true) :
    CommonFiveOrientationAt order.position a₁ x₁ b₁ c₁ y₁ ∨
      CommonFiveOrientationAt order.position a₁ y₁ b₁ c₁ x₁ ∨
        CommonFiveOrientationAt order.position a₂ x₂ b₂ c₂ y₂ ∨
          CommonFiveOrientationAt order.position a₂ y₂ b₂ c₂ x₂ :=
  commonFiveOrientationAt_corePair_of_frozenBlocks
    order.position_injective order.blocks hforced horiented

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
