/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CanonicalBoundaryOrderBridge

/-!
# Center-exchange orientation bridge for the canonical boundary orders

The all-orders orientation check `orientedAll48` admits a five-point role
assignment only when the same assignment is oriented in every one of the
forty-eight canonical zero-cut boundary orders.  A role assignment whose two
pair-centers `x` and `y` exchange between the direct and the reflected
boundary orders is oriented in every order, but by two different assignments:
`(a, x, b, c, y)` in some orders and the center-exchanged `(a, y, b, c, x)`
in the rest.  Neither single assignment passes `orientedAll48`.

This file provides the widened decidable check `centerExchangeOrientedAll48`
— in every canonical order, the assignment or its center exchange is oriented
— and the transfer bridge: for every realized frozen boundary order the
disjunction of the two orientation facts holds.  The transfer factors through
`exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks`, which extracts from
the frozen block hypotheses one canonical boundary order whose position map
agrees with the realized position map on every label pair.

This file proves an order-transfer principle only.  It does not assert finite
coverage of the exact-twelve branch, validate any solver output, or close a
live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress

/- ## The widened decidable check -/

/-- Boolean check that in each of the forty-eight canonical boundary orders
the five-point orientation fact holds for the role assignment
`(a, x, b, c, y)` or for its center exchange `(a, y, b, c, x)`. -/
def centerExchangeOrientedAll48 (a x b c y : Label) : Bool :=
  canonicalBoundaryOrders.all fun L =>
    decide (CommonFiveOrientationAt (positionInList L) a x b c y) ||
      decide (CommonFiveOrientationAt (positionInList L) a y b c x)

/-- Soundness of `centerExchangeOrientedAll48`: the Boolean check is true
exactly when every canonical position map orients the assignment or its
center exchange. -/
theorem centerExchangeOrientedAll48_eq_true_iff (a x b c y : Label) :
    centerExchangeOrientedAll48 a x b c y = true ↔
      ∀ L ∈ canonicalBoundaryOrders,
        CommonFiveOrientationAt (positionInList L) a x b c y ∨
          CommonFiveOrientationAt (positionInList L) a y b c x := by
  unfold centerExchangeOrientedAll48
  simp only [List.all_eq_true, Bool.or_eq_true, decide_eq_true_eq]

/- ## Order-isomorphism extraction from the frozen hypotheses -/

private theorem canonicalBoundaryOrders_complete :
    ∀ L ∈ canonicalBoundaryOrders, ∀ label : Label, label ∈ L := by
  decide

private theorem positionInList_lt_iff_of_isChain
    {position : Label → Nat} {L : List Label}
    (hcomplete : ∀ label : Label, label ∈ L)
    (hchain : List.IsChain (fun i j => position i < position j) L) :
    ∀ i j : Label,
      positionInList L i < positionInList L j ↔ position i < position j := by
  letI : Trans (fun i j : Label => position i < position j)
      (fun i j : Label => position i < position j)
      (fun i j : Label => position i < position j) :=
    ⟨fun h₁ h₂ => Nat.lt_trans h₁ h₂⟩
  have hpairwise :=
    List.pairwise_iff_getElem.mp (List.isChain_iff_pairwise.mp hchain)
  have hmono : ∀ i j : Label,
      L.idxOf i < L.idxOf j → position i < position j := by
    intro i j hlt
    have hi : L.idxOf i < L.length :=
      List.idxOf_lt_length_of_mem (hcomplete i)
    have hj : L.idxOf j < L.length :=
      List.idxOf_lt_length_of_mem (hcomplete j)
    have hrel := hpairwise (L.idxOf i) (L.idxOf j) hi hj hlt
    rwa [List.getElem_idxOf hi, List.getElem_idxOf hj] at hrel
  intro i j
  unfold positionInList
  constructor
  · exact hmono i j
  · intro hlt
    rcases Nat.lt_trichotomy (L.idxOf i) (L.idxOf j) with h | h | h
    · exact h
    · exfalso
      have heq : i = j := (List.idxOf_inj (hcomplete i)).mp h
      subst heq
      exact Nat.lt_irrefl _ hlt
    · exact absurd hlt (Nat.lt_asymm (hmono j i h))

private theorem directBoundaryList_mem_canonical
    {second surplus first : List Label}
    (hs : second ∈ secondOppositeBlocks) (hu : surplus ∈ surplusBlocks)
    (hf : first ∈ firstOppositeBlocks) :
    directBoundaryList second surplus first ∈ canonicalBoundaryOrders := by
  unfold canonicalBoundaryOrders
  apply List.mem_append_left
  simp only [List.mem_flatMap, List.mem_map]
  exact ⟨second, hs, surplus, hu, first, hf, rfl⟩

private theorem mirrorBoundaryList_mem_canonical
    {second surplus first : List Label}
    (hs : second ∈ secondOppositeBlocks) (hu : surplus ∈ surplusBlocks)
    (hf : first ∈ firstOppositeBlocks) :
    mirrorBoundaryList second surplus first ∈ canonicalBoundaryOrders := by
  unfold canonicalBoundaryOrders
  apply List.mem_append_right
  simp only [List.mem_flatMap, List.mem_map]
  exact ⟨second, hs, surplus, hu, first, hf, rfl⟩

private theorem isChain_directBoundaryList
    {R : Label → Label → Prop} {second surplus first : List Label}
    (hs : List.IsChain R ((0 : Label) :: (second ++ [2])))
    (hu : List.IsChain R ((2 : Label) :: (surplus ++ [1])))
    (hf : List.IsChain R ((1 : Label) :: first)) :
    List.IsChain R (directBoundaryList second surplus first) := by
  change List.IsChain R
    (((0 : Label) :: second) ++ (2 : Label) :: (surplus ++ (1 : Label) :: first))
  rw [List.isChain_split]
  refine ⟨hs, ?_⟩
  change List.IsChain R (((2 : Label) :: surplus) ++ (1 : Label) :: first)
  rw [List.isChain_split]
  exact ⟨hu, hf⟩

private theorem isChain_mirrorBoundaryList
    {R : Label → Label → Prop} {second surplus first : List Label}
    (hf : List.IsChain R ((0 : Label) :: (first ++ [1])))
    (hu : List.IsChain R ((1 : Label) :: (surplus ++ [2])))
    (hs : List.IsChain R ((2 : Label) :: second)) :
    List.IsChain R (mirrorBoundaryList second surplus first) := by
  change List.IsChain R
    (((0 : Label) :: first) ++ (1 : Label) :: (surplus ++ (2 : Label) :: second))
  rw [List.isChain_split]
  refine ⟨hf, ?_⟩
  change List.IsChain R (((1 : Label) :: surplus) ++ (2 : Label) :: second)
  rw [List.isChain_split]
  exact ⟨hu, hs⟩

private theorem exists_secondOpposite_bounded
    {position : Label → Nat} {lo hi : Label}
    (h6 : position lo < position 6 ∧ position 6 < position hi)
    (h9 : position lo < position 9 ∧ position 9 < position hi)
    (hforced : FrozenForcedSecondCapOrder position) :
    ∃ second ∈ secondOppositeBlocks,
      List.IsChain (fun i j => position i < position j)
        (lo :: (second ++ [hi])) := by
  rcases hforced with ⟨h67, h78, h89⟩ | ⟨h98, h87, h76⟩
  · refine ⟨[6, 7, 8, 9], by decide, ?_⟩
    simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
      List.isChain_singleton, and_true]
    omega
  · refine ⟨[9, 8, 7, 6], by decide, ?_⟩
    simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
      List.isChain_singleton, and_true]
    omega

private theorem exists_secondOpposite_tail
    {position : Label → Nat} {lo : Label}
    (h6 : position lo < position 6) (h9 : position lo < position 9)
    (hforced : FrozenForcedSecondCapOrder position) :
    ∃ second ∈ secondOppositeBlocks,
      List.IsChain (fun i j => position i < position j) (lo :: second) := by
  rcases hforced with ⟨h67, h78, h89⟩ | ⟨h98, h87, h76⟩
  · refine ⟨[6, 7, 8, 9], by decide, ?_⟩
    simp only [List.isChain_cons_cons, List.isChain_singleton, and_true]
    omega
  · refine ⟨[9, 8, 7, 6], by decide, ?_⟩
    simp only [List.isChain_cons_cons, List.isChain_singleton, and_true]
    omega

private theorem exists_surplus_bounded
    {position : Label → Nat} {lo hi : Label}
    (h3 : position lo < position 3 ∧ position 3 < position hi)
    (h4 : position lo < position 4 ∧ position 4 < position hi)
    (h5 : position lo < position 5 ∧ position 5 < position hi)
    (hne34 : position 3 ≠ position 4)
    (hne35 : position 3 ≠ position 5)
    (hne45 : position 4 ≠ position 5) :
    ∃ surplus ∈ surplusBlocks,
      List.IsChain (fun i j => position i < position j)
        (lo :: (surplus ++ [hi])) := by
  rcases lt_or_gt_of_ne hne34 with h34 | h43
  · rcases lt_or_gt_of_ne hne45 with h45 | h54
    · refine ⟨[3, 4, 5], by decide, ?_⟩
      simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
        List.isChain_singleton, and_true]
      omega
    · rcases lt_or_gt_of_ne hne35 with h35 | h53
      · refine ⟨[3, 5, 4], by decide, ?_⟩
        simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
          List.isChain_singleton, and_true]
        omega
      · refine ⟨[5, 3, 4], by decide, ?_⟩
        simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
          List.isChain_singleton, and_true]
        omega
  · rcases lt_or_gt_of_ne hne35 with h35 | h53
    · refine ⟨[4, 3, 5], by decide, ?_⟩
      simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
        List.isChain_singleton, and_true]
      omega
    · rcases lt_or_gt_of_ne hne45 with h45 | h54
      · refine ⟨[4, 5, 3], by decide, ?_⟩
        simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
          List.isChain_singleton, and_true]
        omega
      · refine ⟨[5, 4, 3], by decide, ?_⟩
        simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
          List.isChain_singleton, and_true]
        omega

private theorem exists_firstOpposite_bounded
    {position : Label → Nat} {lo hi : Label}
    (h10 : position lo < position 10 ∧ position 10 < position hi)
    (h11 : position lo < position 11 ∧ position 11 < position hi)
    (hne : position 10 ≠ position 11) :
    ∃ first ∈ firstOppositeBlocks,
      List.IsChain (fun i j => position i < position j)
        (lo :: (first ++ [hi])) := by
  rcases lt_or_gt_of_ne hne with h1011 | h1110
  · refine ⟨[10, 11], by decide, ?_⟩
    simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
      List.isChain_singleton, and_true]
    omega
  · refine ⟨[11, 10], by decide, ?_⟩
    simp only [List.cons_append, List.nil_append, List.isChain_cons_cons,
      List.isChain_singleton, and_true]
    omega

private theorem exists_firstOpposite_tail
    {position : Label → Nat} {lo : Label}
    (h10 : position lo < position 10) (h11 : position lo < position 11)
    (hne : position 10 ≠ position 11) :
    ∃ first ∈ firstOppositeBlocks,
      List.IsChain (fun i j => position i < position j) (lo :: first) := by
  rcases lt_or_gt_of_ne hne with h1011 | h1110
  · refine ⟨[10, 11], by decide, ?_⟩
    simp only [List.isChain_cons_cons, List.isChain_singleton, and_true]
    omega
  · refine ⟨[11, 10], by decide, ?_⟩
    simp only [List.isChain_cons_cons, List.isChain_singleton, and_true]
    omega

/-- Order-isomorphism extraction: an injective position map satisfying the
frozen direct-or-mirror block hypotheses and the forced second-cap order
agrees, on every label pair, with the position map of one canonical boundary
order.

Injectivity is required: the frozen hypotheses do not separate the positions
inside the surplus block `{3, 4, 5}` or inside the first-opposite block
`{10, 11}`. -/
theorem exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks
    {position : Label → Nat}
    (hinj : Function.Injective position)
    (hblocks : FrozenDirectBoundaryOrder position ∨
      FrozenMirrorBoundaryOrder position)
    (hforced : FrozenForcedSecondCapOrder position) :
    ∃ L ∈ canonicalBoundaryOrders,
      ∀ i j : Label,
        positionInList L i < positionInList L j ↔ position i < position j := by
  have hne34 : position 3 ≠ position 4 := fun h => absurd (hinj h) (by decide)
  have hne35 : position 3 ≠ position 5 := fun h => absurd (hinj h) (by decide)
  have hne45 : position 4 ≠ position 5 := fun h => absurd (hinj h) (by decide)
  have hne1011 : position 10 ≠ position 11 := fun h =>
    absurd (hinj h) (by decide)
  rcases hblocks with hdir | hmir
  · obtain ⟨second, hsMem, hsChain⟩ :=
      exists_secondOpposite_bounded
        (hdir.secondOpposite_between 6 (by decide))
        (hdir.secondOpposite_between 9 (by decide)) hforced
    obtain ⟨surplus, huMem, huChain⟩ :=
      exists_surplus_bounded
        (hdir.surplus_between 3 (by decide))
        (hdir.surplus_between 4 (by decide))
        (hdir.surplus_between 5 (by decide)) hne34 hne35 hne45
    obtain ⟨first, hfMem, hfChain⟩ :=
      exists_firstOpposite_tail
        (hdir.firstOpposite_after 10 (by decide))
        (hdir.firstOpposite_after 11 (by decide)) hne1011
    have hmem := directBoundaryList_mem_canonical hsMem huMem hfMem
    exact ⟨directBoundaryList second surplus first, hmem,
      positionInList_lt_iff_of_isChain
        (canonicalBoundaryOrders_complete _ hmem)
        (isChain_directBoundaryList hsChain huChain hfChain)⟩
  · obtain ⟨first, hfMem, hfChain⟩ :=
      exists_firstOpposite_bounded
        (hmir.firstOpposite_between 10 (by decide))
        (hmir.firstOpposite_between 11 (by decide)) hne1011
    obtain ⟨surplus, huMem, huChain⟩ :=
      exists_surplus_bounded
        (hmir.surplus_between 3 (by decide))
        (hmir.surplus_between 4 (by decide))
        (hmir.surplus_between 5 (by decide)) hne34 hne35 hne45
    obtain ⟨second, hsMem, hsChain⟩ :=
      exists_secondOpposite_tail
        (hmir.secondOpposite_after 6 (by decide))
        (hmir.secondOpposite_after 9 (by decide)) hforced
    have hmem := mirrorBoundaryList_mem_canonical hsMem huMem hfMem
    exact ⟨mirrorBoundaryList second surplus first, hmem,
      positionInList_lt_iff_of_isChain
        (canonicalBoundaryOrders_complete _ hmem)
        (isChain_mirrorBoundaryList hfChain huChain hsChain)⟩

/- ## The center-exchange transfer bridge -/

private theorem cyclicTripleAt_of_orderIso {p q : Label → Nat}
    (hagree : ∀ i j : Label, p i < p j ↔ q i < q j) {a b c : Label}
    (h : CyclicTripleAt p a b c) : CyclicTripleAt q a b c := by
  unfold CyclicTripleAt at h ⊢
  simp only [hagree] at h
  exact h

private theorem commonFiveOrientationAt_of_orderIso {p q : Label → Nat}
    (hagree : ∀ i j : Label, p i < p j ↔ q i < q j) {a x b c y : Label}
    (h : CommonFiveOrientationAt p a x b c y) :
    CommonFiveOrientationAt q a x b c y := by
  unfold CommonFiveOrientationAt at h ⊢
  rcases h with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact Or.inl ⟨cyclicTripleAt_of_orderIso hagree h₁,
      cyclicTripleAt_of_orderIso hagree h₂⟩
  · exact Or.inr ⟨cyclicTripleAt_of_orderIso hagree h₁,
      cyclicTripleAt_of_orderIso hagree h₂⟩

/-- Center-exchange bridge at position level: when in each of the
forty-eight canonical boundary orders the role assignment `(a, x, b, c, y)`
or its center exchange `(a, y, b, c, x)` is oriented, every injective
position map satisfying the frozen block hypotheses and the forced
second-cap order orients one of the two assignments. -/
theorem commonFiveOrientationAt_or_exchange_of_frozenBlocks
    {position : Label → Nat}
    (hinj : Function.Injective position)
    (hblocks : FrozenDirectBoundaryOrder position ∨
      FrozenMirrorBoundaryOrder position)
    (hforced : FrozenForcedSecondCapOrder position)
    {a x b c y : Label}
    (horiented : centerExchangeOrientedAll48 a x b c y = true) :
    CommonFiveOrientationAt position a x b c y ∨
      CommonFiveOrientationAt position a y b c x := by
  obtain ⟨L, hmem, hagree⟩ :=
    exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks hinj hblocks hforced
  rcases (centerExchangeOrientedAll48_eq_true_iff a x b c y).mp
      horiented L hmem with h | h
  · exact Or.inl (commonFiveOrientationAt_of_orderIso hagree h)
  · exact Or.inr (commonFiveOrientationAt_of_orderIso hagree h)

/-- Center-exchange bridge for a realized frozen boundary order: the packaged
`FrozenBoundaryOrder` supplies the injectivity and the direct-or-mirror block
structure, so the widened decidable check yields the orientation fact for the
role assignment or for its center exchange. -/
theorem FrozenBoundaryOrder.commonFiveOrientationAt_or_exchange
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {a x b c y : Label}
    (horiented : centerExchangeOrientedAll48 a x b c y = true) :
    CommonFiveOrientationAt order.position a x b c y ∨
      CommonFiveOrientationAt order.position a y b c x :=
  commonFiveOrientationAt_or_exchange_of_frozenBlocks
    order.position_injective order.blocks hforced horiented

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
