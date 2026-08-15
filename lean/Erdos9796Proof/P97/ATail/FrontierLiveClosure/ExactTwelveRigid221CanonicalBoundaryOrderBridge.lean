/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer

/-!
# Canonical boundary orders for the exact-twelve Rigid221 lane

The frozen exact-twelve boundary hypotheses (`FrozenDirectBoundaryOrder` or
`FrozenMirrorBoundaryOrder`, together with `FrozenForcedSecondCapOrder`) leave
exactly forty-eight linear boundary orders free: direct versus mirror cap-block
layout, ascending versus descending second-opposite interior, one of six
internal orders of the surplus interior `{3, 4, 5}`, and one of two internal
orders of the first-opposite interior `{10, 11}`.

This file enumerates those forty-eight orders as explicit canonical position
maps and proves the transfer bridge: a `CommonFiveOrientationAt` fact that is
checked on all forty-eight canonical maps holds for every injective position
map satisfying the frozen hypotheses.  The bridge lets a single decidable check
replace per-family orientation case analysis in membership producers.

This file proves an order-transfer principle only.  It does not assert finite
coverage of the exact-twelve branch, validate any solver output, or close a
live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress

/- ## The canonical forty-eight boundary orders -/

/-- The two internal boundary orders of the strict second-opposite cap
interior `{6, 7, 8, 9}` admitted by `FrozenForcedSecondCapOrder`. -/
def secondOppositeBlocks : List (List Label) :=
  [[6, 7, 8, 9], [9, 8, 7, 6]]

/-- The six internal boundary orders of the strict surplus cap interior
`{3, 4, 5}`. -/
def surplusBlocks : List (List Label) :=
  [[3, 4, 5], [3, 5, 4], [4, 3, 5], [4, 5, 3], [5, 3, 4], [5, 4, 3]]

/-- The two internal boundary orders of the strict first-opposite cap
interior `{10, 11}`. -/
def firstOppositeBlocks : List (List Label) :=
  [[10, 11], [11, 10]]

/-- The direct zero-cut boundary list
`0, second-opposite, 2, surplus, 1, first-opposite`. -/
def directBoundaryList (second surplus first : List Label) : List Label :=
  0 :: (second ++ 2 :: (surplus ++ 1 :: first))

/-- The reflected zero-cut boundary list
`0, first-opposite, 1, surplus, 2, second-opposite`. -/
def mirrorBoundaryList (second surplus first : List Label) : List Label :=
  0 :: (first ++ 1 :: (surplus ++ 2 :: second))

/-- The forty-eight canonical zero-cut boundary orders of the frozen
exact-twelve profile: twenty-four direct and twenty-four mirror lists,
parametrized by the second-opposite direction, the internal surplus order,
and the internal first-opposite order. -/
def canonicalBoundaryOrders : List (List Label) :=
  (secondOppositeBlocks.flatMap fun second =>
    surplusBlocks.flatMap fun surplus =>
      firstOppositeBlocks.map fun first =>
        directBoundaryList second surplus first) ++
  (secondOppositeBlocks.flatMap fun second =>
    surplusBlocks.flatMap fun surplus =>
      firstOppositeBlocks.map fun first =>
        mirrorBoundaryList second surplus first)

/-- The canonical enumeration has exactly forty-eight boundary orders. -/
theorem canonicalBoundaryOrders_length : canonicalBoundaryOrders.length = 48 := by
  decide

/-- The forty-eight canonical boundary orders are pairwise distinct. -/
theorem canonicalBoundaryOrders_nodup : canonicalBoundaryOrders.Nodup := by
  decide

private theorem canonicalBoundaryOrders_complete :
    ∀ L ∈ canonicalBoundaryOrders, ∀ label : Label, label ∈ L := by
  decide

/-- The position map of one boundary list: each label is assigned its index
in the list, in boundary order. -/
def positionInList (L : List Label) (label : Label) : Nat :=
  L.idxOf label

/- ## The decidable all-orders orientation check -/

instance (position : Label → Nat) (a b c : Label) :
    Decidable (CyclicTripleAt position a b c) :=
  decidable_of_iff
    ((position a < position b ∧ position b < position c) ∨
      (position b < position c ∧ position c < position a) ∨
      (position c < position a ∧ position a < position b))
    Iff.rfl

instance (position : Label → Nat) (a x b c y : Label) :
    Decidable (CommonFiveOrientationAt position a x b c y) :=
  decidable_of_iff
    ((CyclicTripleAt position a x b ∧ CyclicTripleAt position b c y) ∨
      (CyclicTripleAt position a b x ∧ CyclicTripleAt position b y c))
    Iff.rfl

/-- Boolean check that the five-point orientation fact holds in all
forty-eight canonical boundary orders. -/
def orientedAll48 (a x b c y : Label) : Bool :=
  canonicalBoundaryOrders.all fun L =>
    decide (CommonFiveOrientationAt (positionInList L) a x b c y)

/-- Soundness of `orientedAll48`: the Boolean check is true exactly when the
orientation proposition holds for every canonical position map. -/
theorem orientedAll48_eq_true_iff (a x b c y : Label) :
    orientedAll48 a x b c y = true ↔
      ∀ L ∈ canonicalBoundaryOrders,
        CommonFiveOrientationAt (positionInList L) a x b c y := by
  unfold orientedAll48
  simp only [List.all_eq_true, decide_eq_true_eq]

/- ## Order transfer -/

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

/-- A position map that lists the labels of `L` in strictly increasing
position order agrees with the index order of `L` on every label pair. -/
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

private theorem commonFiveOrientationAt_of_canonicalChain
    {position : Label → Nat} {a x b c y : Label} {L : List Label}
    (hall : ∀ L' ∈ canonicalBoundaryOrders,
      CommonFiveOrientationAt (positionInList L') a x b c y)
    (hmem : L ∈ canonicalBoundaryOrders)
    (hchain : List.IsChain (fun i j => position i < position j) L) :
    CommonFiveOrientationAt position a x b c y :=
  commonFiveOrientationAt_of_orderIso
    (positionInList_lt_iff_of_isChain
      (canonicalBoundaryOrders_complete L hmem) hchain)
    (hall L hmem)

/- ## Membership of the assembled boundary lists -/

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

/- ## Chain assembly from cap blocks -/

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

/- ## Block chains from the frozen hypotheses -/

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

/- ## The bridge -/

/-- Canonical-order bridge at position level: an orientation fact checked on
all forty-eight canonical boundary orders holds for every injective position
map satisfying the frozen direct-or-mirror block hypotheses and the forced
second-cap order.

Injectivity is required: the frozen hypotheses do not separate the positions
inside the surplus block `{3, 4, 5}` or inside the first-opposite block
`{10, 11}`, and a position map identifying two such labels satisfies no
strict cyclic triple through them. -/
theorem commonFiveOrientationAt_of_frozenBlocks
    {position : Label → Nat}
    (hinj : Function.Injective position)
    (hblocks : FrozenDirectBoundaryOrder position ∨
      FrozenMirrorBoundaryOrder position)
    (hforced : FrozenForcedSecondCapOrder position)
    {a x b c y : Label}
    (horiented : orientedAll48 a x b c y = true) :
    CommonFiveOrientationAt position a x b c y := by
  have hall := (orientedAll48_eq_true_iff a x b c y).mp horiented
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
    exact commonFiveOrientationAt_of_canonicalChain hall
      (directBoundaryList_mem_canonical hsMem huMem hfMem)
      (isChain_directBoundaryList hsChain huChain hfChain)
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
    exact commonFiveOrientationAt_of_canonicalChain hall
      (mirrorBoundaryList_mem_canonical hsMem huMem hfMem)
      (isChain_mirrorBoundaryList hfChain huChain hsChain)

/-- Canonical-order bridge for a realized frozen boundary order: the packaged
`FrozenBoundaryOrder` supplies the injectivity and the direct-or-mirror block
structure, so a decidable all-orders check yields the orientation fact needed
by the ordered five-point consumer. -/
theorem FrozenBoundaryOrder.commonFiveOrientationAt_of_orientedAll48
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {a x b c y : Label}
    (horiented : orientedAll48 a x b c y = true) :
    CommonFiveOrientationAt order.position a x b c y :=
  commonFiveOrientationAt_of_frozenBlocks
    order.position_injective order.blocks hforced horiented

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
