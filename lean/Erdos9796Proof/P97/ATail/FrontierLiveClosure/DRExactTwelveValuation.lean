/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveDimacs
import Erdos9796Proof.P97.Census554.CyclicOrderDistanceCores

/-!
# Valuation of the D-R exact-12 two-family CNF: the geometric families

Plan item P3.4b of `docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.
The consumer is the leaf `false_of_exactFourPostCardElevenTwoRadiusBranch`
(`ATail/FrontierLiveClosure/Rigid221Closure.lean`), which will combine a
valuation satisfying every clause of `DRExactTwelveDimacs.clauses` with the
UNSAT certificate of P3.5.

## Interface

* `litHolds`, `clauseHolds`, `familyHolds`: a literal `lit : ℤ` holds under
  `val : ℕ → Prop` when `val lit.natAbs` for a positive literal and
  `¬ val lit.natAbs` for a negative one.
* `RelationValuation pt val`: the relation variable `equalVar e e'` of two
  distinct edges of the encoder's `edges` list reads
  `dist (pt e.1) (pt e.2) = dist (pt e'.1) (pt e'.2)`, with the Nat labels
  of the mirror module sent to `Fin 12` by `label`.
* `ConvexBoundaryEnumeration pt φ idx`: the labelled points lie on a CCW
  convex enumeration `φ` through the label-to-index map `idx`, which is
  either `directIndex` (`l ↦ (position l + 5) % 12`) or `mirrorIndex`
  (`l ↦ (19 - position l) % 12`, the reversal `7 - position l` written in
  `ℕ`).  Both send the surplus apex `thirdApex` (label `2`, position `7`) to
  index `0`; the direct map lists `A3, I2, A1, IS, A2, I1` in index order and
  the mirror map the reverse blocks.
* `K4Valuation pt val`: a `RelationValuation` in which every center has a
  selected `K4` selector, and a true selector makes its quad equidistant
  from its center.

## Theorems

* `transitivity_holds`: family 1 from the transitivity of real equality.
* `twoCircleSameArc_holds`: the `two_circle_same_arc` family from
  `Census554.CyclicOrderDistanceCores.false_of_two_circle_same_arc`.
* `fivePointCircleIsoscelesOrder_holds`: the
  `five_point_circle_isosceles_order` family from
  `Census554.CyclicOrderDistanceCores.false_of_circle_isosceles_cyclic`.
* `k4Everywhere_holds`: the `k4_everywhere` family from a `K4Valuation`.

The encoder's emission predicates are bridged to the index conditions of the
two cores by finite lemmas: `forward_direct` and `forward_mirror` identify the
encoder's `forward i j k` with `CyclicThree` on the images of the labels
(kernel `decide` over the 1,728 label triples), and the remaining order
reasoning (`sameArc_order`, `five_order_direct`, `cyclicFive_of_offset`) is
`omega` on offsets from a base index.  No `native_decide` is used.

The clause list `fivePointCircleIsoscelesOrder` is a fold whose result is
read through the projections `Prod.snd` and `Array.toList`; the kernel
unfolds these `abbrev` projections before the constant itself and then
evaluates the whole fold, which does not terminate in practice.  The
parametric copy `dedupClauses` has the same reducibility height as the
mirror constant, so `fivePointCircleIsoscelesOrder_eq_dedupClauses` is
checked structurally, and the fold is analysed on a variable list.

The families `secondApexRows`, `firstApexClass`, `blockers`, and `ingress`
read the D-R packet (the rows, the first-apex class, the shell system, and
the surface); they belong to the packet slice and are not treated here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveValuation

open DRExactTwelveDimacs
open Census554.CyclicOrderDistanceCores

/- ## Literals, clauses, families -/

/-- A literal holds: a positive literal names a true variable, a negative literal a
false one. -/
def litHolds (val : ℕ → Prop) (lit : ℤ) : Prop :=
  if 0 < lit then val lit.natAbs else ¬ val lit.natAbs

/-- A clause holds when one of its literals holds. -/
def clauseHolds (val : ℕ → Prop) (clause : List ℤ) : Prop :=
  ∃ lit ∈ clause, litHolds val lit

/-- A clause family holds when every clause holds. -/
def familyHolds (val : ℕ → Prop) (family : List (List ℤ)) : Prop :=
  ∀ clause ∈ family, clauseHolds val clause

theorem litHolds_pos {val : ℕ → Prop} {v : ℕ} (hv : 0 < v) :
    litHolds val (pos v) ↔ val v := by
  simp [litHolds, pos, hv]

theorem litHolds_neg {val : ℕ → Prop} {v : ℕ} : litHolds val (neg v) ↔ ¬ val v := by
  simp [litHolds, neg]

/-- Membership survives `List.eraseDups` (bounded by the length for the recursion). -/
private theorem mem_eraseDups_of_mem_aux {α : Type*} [BEq α] [LawfulBEq α] :
    ∀ (n : ℕ) {l : List α} {a : α}, l.length ≤ n → a ∈ l → a ∈ l.eraseDups
  | 0, [], _, _, h => by simp at h
  | 0, _ :: _, _, hn, _ => by simp at hn
  | _ + 1, [], _, _, h => by simp at h
  | n + 1, x :: xs, a, hn, h => by
    rw [List.eraseDups_cons]
    rcases List.mem_cons.mp h with rfl | hxs
    · exact List.mem_cons_self
    · by_cases hax : a = x
      · subst hax
        exact List.mem_cons_self
      · refine List.mem_cons_of_mem _ (mem_eraseDups_of_mem_aux n ?_ ?_)
        · have := List.length_filter_le (fun b => !b == x) xs
          simp only [List.length_cons] at hn
          omega
        · rw [List.mem_filter]
          exact ⟨hxs, by simpa using hax⟩

theorem mem_eraseDups_of_mem {α : Type*} [BEq α] [LawfulBEq α] {l : List α} {a : α}
    (h : a ∈ l) : a ∈ l.eraseDups :=
  mem_eraseDups_of_mem_aux l.length le_rfl h

/-- `CNF.add` keeps every literal. -/
theorem mem_normalize_of_mem {l : List ℤ} {lit : ℤ} (h : lit ∈ l) : lit ∈ normalize l :=
  List.mem_mergeSort.mpr (mem_eraseDups_of_mem h)

theorem clauseHolds_normalize {val : ℕ → Prop} {l : List ℤ} (h : clauseHolds val l) :
    clauseHolds val (normalize l) := by
  obtain ⟨lit, hlit, hh⟩ := h
  exact ⟨lit, mem_normalize_of_mem hlit, hh⟩

/- ## The enumeration helpers of the mirror -/

theorem sublist_of_mem_combinations :
    ∀ {xs : List ℕ} {k : ℕ} {l : List ℕ},
      l ∈ combinations xs k → l.Sublist xs ∧ l.length = k
  | xs, 0, l, h => by
    simp only [combinations, List.mem_singleton] at h
    subst h
    exact ⟨List.nil_sublist xs, rfl⟩
  | [], _ + 1, _, h => by simp [combinations] at h
  | x :: xs, k + 1, l, h => by
    simp only [combinations, List.mem_append, List.mem_map] at h
    rcases h with ⟨l', hl', rfl⟩ | h
    · obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hl'
      exact ⟨hs.cons₂ x, by simp [hlen]⟩
    · obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations h
      exact ⟨hs.cons x, hlen⟩

theorem mem_combinations_of_mem_pairs {xs : List ℕ} {a b : ℕ} (h : (a, b) ∈ pairs xs) :
    [a, b] ∈ combinations xs 2 := by
  unfold pairs at h
  rw [List.mem_filterMap] at h
  obtain ⟨l, hl, hab⟩ := h
  rcases l with _ | ⟨a', _ | ⟨b', _ | ⟨c', l⟩⟩⟩ <;>
    simp only [Option.some.injEq, Prod.mk.injEq, reduceCtorEq] at hab
  obtain ⟨rfl, rfl⟩ := hab
  exact hl

theorem mem_pairs {xs : List ℕ} (hnd : xs.Nodup) {a b : ℕ} (h : (a, b) ∈ pairs xs) :
    a ∈ xs ∧ b ∈ xs ∧ a ≠ b := by
  obtain ⟨hs, -⟩ := sublist_of_mem_combinations (mem_combinations_of_mem_pairs h)
  have hsub := hs.subset
  have hnd' := hnd.sublist hs
  refine ⟨hsub (by simp), hsub (by simp), ?_⟩
  rw [List.nodup_cons] at hnd'
  intro hab
  exact hnd'.1 (by simp [hab])

theorem mem_permutations :
    ∀ {k : ℕ} {xs : List ℕ} {l : List ℕ}, xs.Nodup → l ∈ permutations xs k →
      l.length = k ∧ l.Nodup ∧ l ⊆ xs
  | 0, xs, l, _, h => by
    simp only [permutations, List.mem_singleton] at h
    subst h
    exact ⟨rfl, List.nodup_nil, List.nil_subset xs⟩
  | k + 1, xs, l, hnd, h => by
    simp only [permutations, List.mem_flatMap, List.mem_map] at h
    obtain ⟨x, hx, l', hl', rfl⟩ := h
    obtain ⟨hlen, hnd', hsub⟩ := mem_permutations (hnd.erase x) hl'
    refine ⟨by simp [hlen], ?_, ?_⟩
    · rw [List.nodup_cons]
      exact ⟨fun hx' => hnd.not_mem_erase (hsub hx'), hnd'⟩
    · exact List.cons_subset.mpr ⟨hx, hsub.trans List.erase_subset⟩

theorem labels_nodup : labels.Nodup := List.nodup_range

theorem mem_labels {l : ℕ} : l ∈ labels ↔ l < 12 := List.mem_range

theorem mem_others {center l : ℕ} : l ∈ others center ↔ l < 12 ∧ l ≠ center := by
  simp [others, labels, List.mem_filter]

theorem others_nodup (center : ℕ) : (others center).Nodup := labels_nodup.filter _

theorem mem_allocate {α : Type*} {base : ℕ} {keys : List α} {key : α} {v : ℕ}
    (h : (key, v) ∈ allocate base keys) : key ∈ keys ∧ 0 < v := by
  unfold allocate at h
  rw [List.mem_map] at h
  obtain ⟨⟨k, i⟩, hki, hkv⟩ := h
  simp only [Prod.mk.injEq] at hkv
  obtain ⟨rfl, rfl⟩ := hkv
  exact ⟨List.fst_mem_of_mem_zipIdx hki, by omega⟩

/- ## Labels and edges -/

/-- The `Fin 12` label of a Nat label of the mirror. -/
def label (l : ℕ) : Fin 12 := ⟨l % 12, Nat.mod_lt l (by norm_num)⟩

@[simp] theorem label_val {l : ℕ} (h : l < 12) : ((label l : Fin 12) : ℕ) = l :=
  Nat.mod_eq_of_lt h

theorem label_injective {a b : ℕ} (ha : a < 12) (hb : b < 12) (h : label a = label b) :
    a = b := by
  have := congrArg Fin.val h
  rwa [label_val ha, label_val hb] at this

theorem label_ne {a b : ℕ} (ha : a < 12) (hb : b < 12) (h : a ≠ b) : label a ≠ label b :=
  fun h' => h (label_injective ha hb h')

theorem mem_edges_of_lt : ∀ a b : Fin 12, a < b → ((a : ℕ), (b : ℕ)) ∈ edges := by
  decide +kernel

theorem mem_edges_minmax {a b : ℕ} (ha : a < 12) (hb : b < 12) (hab : a ≠ b) :
    (min a b, max a b) ∈ edges := by
  rcases Nat.lt_or_gt_of_ne hab with h | h
  · rw [min_eq_left h.le, max_eq_right h.le]
    exact mem_edges_of_lt ⟨a, ha⟩ ⟨b, hb⟩ h
  · rw [min_eq_right h.le, max_eq_left h.le]
    exact mem_edges_of_lt ⟨b, hb⟩ ⟨a, ha⟩ h

theorem edgeIndex_minmax (a b : ℕ) : edgeIndex (min a b) (max a b) = edgeIndex a b := by
  unfold edgeIndex
  rw [min_eq_left min_le_max, max_eq_right min_le_max]

/-- Every edge index `0, …, 65` is the index of an edge of the list. -/
theorem edgeIndex_surjective : ∀ i : Fin 66, ∃ e ∈ edges, edgeIndex e.1 e.2 = i := by
  decide +kernel

theorem equalVar_pos (e e' : ℕ) : 0 < equalVar e e' := Nat.succ_pos _

theorem dist_label_minmax (pt : Fin 12 → ℝ²) (a b : ℕ) :
    dist (pt (label (min a b))) (pt (label (max a b))) =
      dist (pt (label a)) (pt (label b)) := by
  rcases le_total a b with h | h
  · rw [min_eq_left h, max_eq_right h]
  · rw [min_eq_right h, max_eq_left h, dist_comm]

/- ## The relation valuation -/

/-- The relation variables read distance equality on the labelled points. -/
structure RelationValuation (pt : Fin 12 → ℝ²) (val : ℕ → Prop) : Prop where
  equal : ∀ e ∈ edges, ∀ e' ∈ edges, e ≠ e' →
    (val (equalVar (edgeIndex e.1 e.2) (edgeIndex e'.1 e'.2)) ↔
      dist (pt (label e.1)) (pt (label e.2)) = dist (pt (label e'.1)) (pt (label e'.2)))

/-- The relation variable of two label pairs, in either orientation. -/
theorem RelationValuation.equal_labels {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (h : RelationValuation pt val) {a b c d : ℕ} (ha : a < 12) (hb : b < 12) (hc : c < 12)
    (hd : d < 12) (hab : a ≠ b) (hcd : c ≠ d)
    (hne : ¬ ((a = c ∧ b = d) ∨ (a = d ∧ b = c))) :
    val (equalVar (edgeIndex a b) (edgeIndex c d)) ↔
      dist (pt (label a)) (pt (label b)) = dist (pt (label c)) (pt (label d)) := by
  have hmem := h.equal (min a b, max a b) (mem_edges_minmax ha hb hab) (min c d, max c d)
    (mem_edges_minmax hc hd hcd) (by
      intro heq
      simp only [Prod.mk.injEq] at heq
      omega)
  simpa only [edgeIndex_minmax, dist_label_minmax] using hmem

/- ## The label-to-index maps -/

/-- The direct map: surplus apex `thirdApex` at index `0`, then `I2, A1, IS, A2, I1`. -/
def directIndex (l : Fin 12) : Fin 12 := ⟨(position l + 5) % 12, Nat.mod_lt _ (by norm_num)⟩

/-- The mirror map, the reversal `7 - position l` written in `ℕ`: `thirdApex` at
index `0`, then `I1, A2, IS, A1, I2`. -/
def mirrorIndex (l : Fin 12) : Fin 12 := ⟨(19 - position l) % 12, Nat.mod_lt _ (by norm_num)⟩

theorem directIndex_thirdApex : directIndex (label thirdApex) = 0 := by decide

theorem mirrorIndex_thirdApex : mirrorIndex (label thirdApex) = 0 := by decide

instance instDecidableCyclicThree {n : ℕ} (i j k : Fin n) : Decidable (CyclicThree i j k) :=
  inferInstanceAs (Decidable ((i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)))

theorem directIndex_injective : Function.Injective directIndex := by
  intro a b h
  revert a b
  decide +kernel

theorem mirrorIndex_injective : Function.Injective mirrorIndex := by
  intro a b h
  revert a b
  decide +kernel

/-- The encoder's `forward i j k` is the cyclic order of the direct indices. -/
theorem forward_direct : ∀ i j k : Fin 12, i ≠ j → j ≠ k → i ≠ k →
    (forward i j k = true ↔ CyclicThree (directIndex i) (directIndex j) (directIndex k)) := by
  decide +kernel

/-- The encoder's `forward i j k` is the reversed cyclic order of the mirror indices. -/
theorem forward_mirror : ∀ i j k : Fin 12, i ≠ j → j ≠ k → i ≠ k →
    (forward i j k = true ↔ CyclicThree (mirrorIndex i) (mirrorIndex k) (mirrorIndex j)) := by
  decide +kernel

theorem forward_direct_label {i j k : ℕ} (hi : i < 12) (hj : j < 12) (hk : k < 12)
    (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) :
    forward i j k = true ↔
      CyclicThree (directIndex (label i)) (directIndex (label j)) (directIndex (label k)) := by
  have := forward_direct (label i) (label j) (label k) (label_ne hi hj hij) (label_ne hj hk hjk)
    (label_ne hi hk hik)
  rwa [label_val hi, label_val hj, label_val hk] at this

theorem forward_mirror_label {i j k : ℕ} (hi : i < 12) (hj : j < 12) (hk : k < 12)
    (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) :
    forward i j k = true ↔
      CyclicThree (mirrorIndex (label i)) (mirrorIndex (label k)) (mirrorIndex (label j)) := by
  have := forward_mirror (label i) (label j) (label k) (label_ne hi hj hij) (label_ne hj hk hjk)
    (label_ne hi hk hik)
  rwa [label_val hi, label_val hj, label_val hk] at this

/- ## Cyclic order on `Fin 12` through offsets from a base index -/

/-- The offset of `a` from `f` going forward along the enumeration. -/
def offset (f a : Fin 12) : ℕ := ((a : ℕ) + 12 - f) % 12

theorem offset_ne {f a b : Fin 12} (hab : a ≠ b) : offset f a ≠ offset f b := by
  unfold offset
  omega

theorem cyclicThree_iff_offset {f a b : Fin 12} (ha : a ≠ f) :
    CyclicThree f a b ↔ offset f a < offset f b := by
  unfold CyclicThree offset
  omega

theorem cyclicThree_mid_iff_offset {f a b : Fin 12} (hb : b ≠ f) :
    CyclicThree a f b ↔ offset f b < offset f a := by
  unfold CyclicThree offset
  omega

theorem cyclicThree_swap {a b c : Fin 12} (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) :
    CyclicThree a c b ↔ ¬ CyclicThree a b c := by
  unfold CyclicThree
  omega

theorem cyclicFive_rot {a b c d e : Fin 12} : CyclicFive a b c d e ↔ CyclicFive b c d e a := by
  unfold CyclicFive
  constructor
  · rintro (h | h | h | h | h)
    · exact Or.inr (Or.inr (Or.inr (Or.inr h)))
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
  · rintro (h | h | h | h | h)
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr h)))
    · exact Or.inl h

/-- Increasing offsets from `f` give the cyclic pattern `f, a, b, c, d`; the linear
rotation is fixed by which of the four lie below `f`. -/
theorem cyclicFive_of_offset {f a b c d : Fin 12} (ha : a ≠ f)
    (hab : offset f a < offset f b) (hbc : offset f b < offset f c)
    (hcd : offset f c < offset f d) : CyclicFive f a b c d := by
  unfold CyclicFive offset at *
  by_cases h4 : d < f
  · by_cases h3 : c < f
    · by_cases h2 : b < f
      · by_cases h1 : a < f
        · exact Or.inr (Or.inl ⟨by omega, by omega, by omega, by omega⟩)
        · exact Or.inr (Or.inr (Or.inl ⟨by omega, by omega, by omega, by omega⟩))
      · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨by omega, by omega, by omega, by omega⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨by omega, by omega, by omega, by omega⟩)))
  · exact Or.inl ⟨by omega, by omega, by omega, by omega⟩

/-- Same-arc order core: with `u`, `y` on the same side of `q, v` in the cyclic
order, the linear between-conditions agree in both orientations of the chord. -/
theorem sameArc_order {q v u y : Fin 12} (huq : u ≠ q) (huv : u ≠ v) (hyq : y ≠ q)
    (hyv : y ≠ v) (h : CyclicThree q u v ↔ CyclicThree q y v) :
    ((q < u ∧ u < v) ↔ (q < y ∧ y < v)) ∧ ((v < u ∧ u < q) ↔ (v < y ∧ y < q)) := by
  unfold CyclicThree at h
  omega

/-- Five-point order core on offsets: `w, x` on opposite sides of `f z` and `p, z` on
opposite sides of `f x` force one of the two cyclic patterns. -/
theorem five_order_direct {ow op ox oz : ℕ} (hpx : op ≠ ox) (hxz : ox ≠ oz) (hzw : oz ≠ ow)
    (h1 : oz < ow ↔ ¬ oz < ox) (h2 : op < ox ↔ ¬ oz < ox) :
    (op < ox ∧ ox < oz ∧ oz < ow) ∨ (ow < oz ∧ oz < ox ∧ ox < op) := by
  omega

/-- The encoder's `five_point_circle_isosceles_order` predicate on cyclic triples gives
the pattern `W, F, P, X, Z` or its reverse. -/
theorem cyclicFive_pattern_of_cyclicThree {w f p x z : Fin 12} (hwf : w ≠ f) (hpf : p ≠ f)
    (hzf : z ≠ f) (hpx : p ≠ x) (hxz : x ≠ z) (hzw : z ≠ w)
    (h1 : CyclicThree w f z ↔ ¬ CyclicThree x f z)
    (h2 : CyclicThree f p x ↔ ¬ CyclicThree f z x) :
    CyclicFive w f p x z ∨ CyclicFive z x p f w := by
  rw [cyclicThree_mid_iff_offset hzf, cyclicThree_mid_iff_offset hzf] at h1
  rw [cyclicThree_iff_offset hpf, cyclicThree_iff_offset hzf] at h2
  rcases five_order_direct (offset_ne hpx) (offset_ne hxz) (offset_ne hzw) h1 h2 with
    ⟨h3, h4, h5⟩ | ⟨h3, h4, h5⟩
  · exact Or.inl (cyclicFive_rot.mpr (cyclicFive_of_offset hpf h3 h4 h5))
  · exact Or.inr (cyclicFive_rot.mpr (cyclicFive_rot.mpr (cyclicFive_rot.mpr
      (cyclicFive_of_offset hwf h3 h4 h5))))

theorem eq_true_iff_not_of_ne {a b : Bool} (h : a ≠ b) : (a = true ↔ ¬ b = true) := by
  cases a <;> cases b <;> simp_all

/- ## The boundary enumeration -/

/-- The labelled points `pt` lie on the CCW convex enumeration `φ` through the direct
or the mirror label-to-index map. -/
structure ConvexBoundaryEnumeration (pt φ : Fin 12 → ℝ²) (idx : Fin 12 → Fin 12) :
    Prop where
  injective : Function.Injective φ
  ccw : EuclideanGeometry.IsCcwConvexPolygon φ
  convexIndep : ConvexIndep (Finset.univ.image φ)
  pt_eq : ∀ l, pt l = φ (idx l)
  orientation : idx = directIndex ∨ idx = mirrorIndex

namespace ConvexBoundaryEnumeration

variable {pt φ : Fin 12 → ℝ²} {idx : Fin 12 → Fin 12}

theorem idx_injective (hB : ConvexBoundaryEnumeration pt φ idx) : Function.Injective idx := by
  rcases hB.orientation with rfl | rfl
  · exact directIndex_injective
  · exact mirrorIndex_injective

theorem idx_label_ne (hB : ConvexBoundaryEnumeration pt φ idx) {a b : ℕ} (ha : a < 12)
    (hb : b < 12) (h : a ≠ b) : idx (label a) ≠ idx (label b) :=
  fun h' => label_ne ha hb h (hB.idx_injective h')

/-- The same-arc bridge: `sameArc q v u y` on labels gives the cyclic-order iff on
indices under either map. -/
theorem cyclicThree_iff_of_sameArc (hB : ConvexBoundaryEnumeration pt φ idx) {q v u y : ℕ}
    (hq : q < 12) (hv : v < 12) (hu : u < 12) (hy : y < 12) (hqv : q ≠ v) (huq : u ≠ q)
    (huv : u ≠ v) (hyq : y ≠ q) (hyv : y ≠ v) (h : sameArc q v u y = true) :
    CyclicThree (idx (label q)) (idx (label u)) (idx (label v)) ↔
      CyclicThree (idx (label q)) (idx (label y)) (idx (label v)) := by
  have h' : forward q u v = true ↔ forward q y v = true := by
    unfold sameArc at h
    rw [beq_iff_eq] at h
    rw [h]
  rcases hB.orientation with rfl | rfl
  · rwa [forward_direct_label hq hu hv huq.symm huv hqv,
      forward_direct_label hq hy hv hyq.symm hyv hqv] at h'
  · rw [forward_mirror_label hq hu hv huq.symm huv hqv,
      forward_mirror_label hq hy hv hyq.symm hyv hqv] at h'
    rw [cyclicThree_swap (hB.idx_label_ne hq hu huq.symm) (hB.idx_label_ne hu hv huv)
      (hB.idx_label_ne hq hv hqv), cyclicThree_swap (hB.idx_label_ne hq hy hyq.symm)
      (hB.idx_label_ne hy hv hyv) (hB.idx_label_ne hq hv hqv)] at h'
    exact not_iff_not.mp h'

/-- The five-point bridge: the encoder's instance predicate on labels gives the
`CyclicFive` pattern on indices under either map. -/
theorem cyclicFive_of_instance (hB : ConvexBoundaryEnumeration pt φ idx) {w f p x z : ℕ}
    (hw : w < 12) (hf : f < 12) (hp : p < 12) (hx : x < 12) (hz : z < 12)
    (hwf : w ≠ f) (hwz : w ≠ z) (hfp : f ≠ p) (hfx : f ≠ x) (hfz : f ≠ z) (hpx : p ≠ x)
    (hxz : x ≠ z) (h1 : forward w f z ≠ forward x f z) (h2 : forward f p x ≠ forward f z x) :
    CyclicFive (idx (label w)) (idx (label f)) (idx (label p)) (idx (label x))
        (idx (label z)) ∨
      CyclicFive (idx (label z)) (idx (label x)) (idx (label p)) (idx (label f))
        (idx (label w)) := by
  have h1' := eq_true_iff_not_of_ne h1
  have h2' := eq_true_iff_not_of_ne h2
  rcases hB.orientation with rfl | rfl
  · rw [forward_direct_label hw hf hz hwf hfz hwz,
      forward_direct_label hx hf hz hfx.symm hfz hxz] at h1'
    rw [forward_direct_label hf hp hx hfp hpx hfx,
      forward_direct_label hf hz hx hfz hxz.symm hfx] at h2'
    exact cyclicFive_pattern_of_cyclicThree (hB.idx_label_ne hw hf hwf)
      (hB.idx_label_ne hp hf hfp.symm) (hB.idx_label_ne hz hf hfz.symm)
      (hB.idx_label_ne hp hx hpx) (hB.idx_label_ne hx hz hxz) (hB.idx_label_ne hz hw hwz.symm)
      h1' h2'
  · rw [forward_mirror_label hw hf hz hwf hfz hwz,
      forward_mirror_label hx hf hz hfx.symm hfz hxz] at h1'
    rw [forward_mirror_label hf hp hx hfp hpx hfx,
      forward_mirror_label hf hz hx hfz hxz.symm hfx] at h2'
    rw [cyclicThree_swap (hB.idx_label_ne hw hf hwf) (hB.idx_label_ne hf hz hfz)
        (hB.idx_label_ne hw hz hwz),
      cyclicThree_swap (hB.idx_label_ne hx hf hfx.symm) (hB.idx_label_ne hf hz hfz)
        (hB.idx_label_ne hx hz hxz)] at h1'
    rw [cyclicThree_swap (hB.idx_label_ne hf hp hfp) (hB.idx_label_ne hp hx hpx)
        (hB.idx_label_ne hf hx hfx),
      cyclicThree_swap (hB.idx_label_ne hf hz hfz) (hB.idx_label_ne hz hx hxz.symm)
        (hB.idx_label_ne hf hx hfx)] at h2'
    exact cyclicFive_pattern_of_cyclicThree (hB.idx_label_ne hw hf hwf)
      (hB.idx_label_ne hp hf hfp.symm) (hB.idx_label_ne hz hf hfz.symm)
      (hB.idx_label_ne hp hx hpx) (hB.idx_label_ne hx hz hxz) (hB.idx_label_ne hz hw hwz.symm)
      (not_iff_not.mp h1') (not_iff_not.mp h2')

end ConvexBoundaryEnumeration

/- ## The transitivity family -/

private theorem clauseHolds_three {val : ℕ → Prop} {x y z : ℕ} {P Q R : Prop} (hz : 0 < z)
    (Hx : val x ↔ P) (Hy : val y ↔ Q) (Hz : val z ↔ R) (himp : P → Q → R) :
    clauseHolds val [neg x, neg y, pos z] := by
  by_cases hx : val x
  · by_cases hy : val y
    · exact ⟨pos z, by simp, (litHolds_pos hz).mpr (Hz.mpr (himp (Hx.mp hx) (Hy.mp hy)))⟩
    · exact ⟨neg y, by simp, litHolds_neg.mpr hy⟩
  · exact ⟨neg x, by simp, litHolds_neg.mpr hx⟩

/-- Family 1: `eq` is transitive because real equality is. -/
theorem transitivity_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (hval : RelationValuation pt val) : familyHolds val transitivity := by
  intro clause hclause
  unfold transitivity at hclause
  rw [List.mem_flatMap] at hclause
  obtain ⟨l, hl, hclause⟩ := hclause
  obtain ⟨hsub, hlen⟩ := sublist_of_mem_combinations hl
  rcases l with _ | ⟨a, _ | ⟨b, _ | ⟨c, _ | ⟨d, l⟩⟩⟩⟩ <;>
    simp only [List.length_cons, List.length_nil] at hlen <;> try omega
  have hnd := List.nodup_range.sublist hsub
  simp only [List.nodup_cons, List.mem_cons, List.not_mem_nil, or_false, not_or,
    List.nodup_nil, and_true, not_false_eq_true] at hnd
  obtain ⟨⟨hab, hac⟩, hbc⟩ := hnd
  have hsub' := hsub.subset
  have ha : a < 66 := List.mem_range.mp (hsub' (by simp))
  have hb : b < 66 := List.mem_range.mp (hsub' (by simp))
  have hc : c < 66 := List.mem_range.mp (hsub' (by simp))
  obtain ⟨ea, hea, hea'⟩ : ∃ e ∈ edges, edgeIndex e.1 e.2 = a :=
    edgeIndex_surjective ⟨a, ha⟩
  obtain ⟨eb, heb, heb'⟩ : ∃ e ∈ edges, edgeIndex e.1 e.2 = b :=
    edgeIndex_surjective ⟨b, hb⟩
  obtain ⟨ec, hec, hec'⟩ : ∃ e ∈ edges, edgeIndex e.1 e.2 = c :=
    edgeIndex_surjective ⟨c, hc⟩
  have Hab := hval.equal ea hea eb heb (fun h => hab (by subst h; omega))
  have Hac := hval.equal ea hea ec hec (fun h => hac (by subst h; omega))
  have Hbc := hval.equal eb heb ec hec (fun h => hbc (by subst h; omega))
  rw [hea', heb'] at Hab
  rw [hea', hec'] at Hac
  rw [heb', hec'] at Hbc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hclause
  rcases hclause with rfl | rfl | rfl
  · exact clauseHolds_normalize
      (clauseHolds_three (equalVar_pos _ _) Hab Hbc Hac fun h1 h2 => h1.trans h2)
  · exact clauseHolds_normalize
      (clauseHolds_three (equalVar_pos _ _) Hab Hac Hbc fun h1 h2 => h1.symm.trans h2)
  · exact clauseHolds_normalize
      (clauseHolds_three (equalVar_pos _ _) Hac Hbc Hab fun h1 h2 => h1.trans h2.symm)

/- ## The same-arc family -/

/-- Same-arc core on indices: the two clause literals cannot both hold. -/
theorem false_of_sameArc_cyclic {φ : Fin 12 → ℝ²} (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) {iq iv iu iy : Fin 12}
    (hqv : iq ≠ iv) (huq : iu ≠ iq) (huv : iu ≠ iv) (hyq : iy ≠ iq) (hyv : iy ≠ iv)
    (huy : iu ≠ iy) (hC : CyclicThree iq iu iv ↔ CyclicThree iq iy iv)
    (hqu_qy : dist (φ iq) (φ iu) = dist (φ iq) (φ iy))
    (huv_yv : dist (φ iu) (φ iv) = dist (φ iy) (φ iv)) : False := by
  obtain ⟨h1, h2⟩ := sameArc_order huq huv hyq hyv hC
  rcases lt_or_gt_of_ne hqv with h | h
  · exact false_of_two_circle_same_arc hinj hccw h huy huq huv hyq hyv h1 hqu_qy huv_yv
  · refine false_of_two_circle_same_arc hinj hccw h huy huv huq hyv hyq h2 ?_ ?_
    · rw [dist_comm (φ iv) (φ iu), dist_comm (φ iv) (φ iy)]
      exact huv_yv
    · rw [dist_comm (φ iu) (φ iq), dist_comm (φ iy) (φ iq)]
      exact hqu_qy

/-- Family `two_circle_same_arc`: for `u, y` on the same arc of the chord `q v`, not
both `qu = qy` and `uv = yv`. -/
theorem twoCircleSameArc_holds {pt φ : Fin 12 → ℝ²} {idx : Fin 12 → Fin 12}
    {val : ℕ → Prop} (hval : RelationValuation pt val)
    (hB : ConvexBoundaryEnumeration pt φ idx) :
    familyHolds val twoCircleSameArc := by
  intro clause hclause
  unfold twoCircleSameArc at hclause
  rw [List.mem_flatMap] at hclause
  obtain ⟨⟨q, v⟩, hqv, hclause⟩ := hclause
  dsimp only at hclause
  rw [List.mem_filterMap] at hclause
  obtain ⟨⟨u, y⟩, huy, hclause⟩ := hclause
  dsimp only at hclause
  obtain ⟨hq, hv, hqv'⟩ := mem_pairs labels_nodup hqv
  rw [mem_labels] at hq hv
  obtain ⟨hu, hy, huy'⟩ := mem_pairs (labels_nodup.filter _) huy
  simp only [List.mem_filter, mem_labels, Bool.and_eq_true, bne_iff_ne] at hu hy
  obtain ⟨hu, huq, huv⟩ := hu
  obtain ⟨hy, hyq, hyv⟩ := hy
  split at hclause
  · rename_i hsame
    rw [Option.some.injEq] at hclause
    subst hclause
    apply clauseHolds_normalize
    by_cases h1 : val (equalVar (edgeIndex q u) (edgeIndex q y))
    · by_cases h2 : val (equalVar (edgeIndex u v) (edgeIndex y v))
      · exfalso
        have hd1 := (hval.equal_labels hq hu hq hy huq.symm hyq.symm (by omega)).mp h1
        have hd2 := (hval.equal_labels hu hv hy hv huv hyv (by omega)).mp h2
        simp only [hB.pt_eq] at hd1 hd2
        exact false_of_sameArc_cyclic hB.injective hB.ccw (hB.idx_label_ne hq hv hqv')
          (hB.idx_label_ne hu hq huq) (hB.idx_label_ne hu hv huv) (hB.idx_label_ne hy hq hyq)
          (hB.idx_label_ne hy hv hyv) (hB.idx_label_ne hu hy huy')
          (hB.cyclicThree_iff_of_sameArc hq hv hu hy hqv' huq huv hyq hyv hsame) hd1 hd2
      · exact ⟨neg (equalVar (edgeIndex u v) (edgeIndex y v)), by simp, litHolds_neg.mpr h2⟩
    · exact ⟨neg (equalVar (edgeIndex q u) (edgeIndex q y)), by simp, litHolds_neg.mpr h1⟩
  · simp at hclause

/- ## The five-point isosceles family -/

/-- The dedup fold of `fivePointCircleIsoscelesOrder`, parametric in the instance list.
The body is the mirror's body verbatim, so this constant has the same reducibility
height as the mirror constant and `fivePointCircleIsoscelesOrder_eq_dedupClauses` is
checked by the kernel structurally, without evaluating the fold. -/
def dedupClauses (l : List (List ℕ)) : List (List ℤ) :=
  let step (state : Std.HashSet (List Int) × Array (List Int)) (labelTuple : List Nat) :=
    let clause := normalize (circleIsoscelesClause labelTuple)
    if state.1.contains clause then state else (state.1.insert clause, state.2.push clause)
  (l.foldl step (Std.HashSet.emptyWithCapacity 8192, #[])).2.toList

theorem fivePointCircleIsoscelesOrder_eq_dedupClauses :
    fivePointCircleIsoscelesOrder = dedupClauses circleIsoscelesInstances := rfl

/-- Every clause of the dedup fold is the normalized clause of a tuple of the list. -/
theorem mem_dedupClauses {l : List (List ℕ)} {clause : List ℤ} (h : clause ∈ dedupClauses l) :
    ∃ t ∈ l, clause = normalize (circleIsoscelesClause t) := by
  unfold dedupClauses at h
  exact List.foldlRecOn (motive := fun st => ∀ c ∈ Array.toList (Prod.snd st),
      ∃ t ∈ l, c = normalize (circleIsoscelesClause t))
    l _ (fun c hc => absurd hc List.not_mem_nil)
    (fun st hst t ht c hc => by
      dsimp only at hc
      split at hc
      · exact hst c hc
      · dsimp only at hc
        rw [Array.toList_push, List.mem_append, List.mem_singleton] at hc
        rcases hc with hc | rfl
        · exact hst c hc
        · exact ⟨t, ht, rfl⟩) clause h

/-- Every emitted clause of the family is the normalized clause of an instance. -/
theorem exists_instance_of_mem_fivePointCircleIsoscelesOrder {clause : List ℤ}
    (h : clause ∈ fivePointCircleIsoscelesOrder) :
    ∃ t ∈ circleIsoscelesInstances, clause = normalize (circleIsoscelesClause t) := by
  rw [fivePointCircleIsoscelesOrder_eq_dedupClauses] at h
  exact mem_dedupClauses h

/-- An instance is an injective label quintuple satisfying the encoder's orientation
predicate. -/
theorem mem_circleIsoscelesInstances {t : List ℕ} (h : t ∈ circleIsoscelesInstances) :
    ∃ w f p x z, t = [w, f, p, x, z] ∧ [w, f, p, x, z].Nodup ∧
      w < 12 ∧ f < 12 ∧ p < 12 ∧ x < 12 ∧ z < 12 ∧
      forward w f z ≠ forward x f z ∧ forward f p x ≠ forward f z x := by
  unfold circleIsoscelesInstances at h
  rw [List.mem_filter] at h
  obtain ⟨hperm, hpred⟩ := h
  obtain ⟨hlen, hnd, hsub⟩ := mem_permutations labels_nodup hperm
  rcases t with _ | ⟨w, _ | ⟨f, _ | ⟨p, _ | ⟨x, _ | ⟨z, _ | ⟨w', t⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_cons, List.length_nil] at hlen <;> try omega
  simp only [Bool.and_eq_true, bne_iff_ne] at hpred
  refine ⟨w, f, p, x, z, rfl, hnd, ?_, ?_, ?_, ?_, ?_, hpred.1, hpred.2⟩ <;>
    exact mem_labels.mp (hsub (by simp))

/-- Family `five_point_circle_isosceles_order`: no instance has `WF = WX = WZ` and
`PZ = XZ`. -/
theorem fivePointCircleIsoscelesOrder_holds {pt φ : Fin 12 → ℝ²} {idx : Fin 12 → Fin 12}
    {val : ℕ → Prop} (hval : RelationValuation pt val)
    (hB : ConvexBoundaryEnumeration pt φ idx) :
    familyHolds val fivePointCircleIsoscelesOrder := by
  intro clause hclause
  obtain ⟨t, ht, rfl⟩ := exists_instance_of_mem_fivePointCircleIsoscelesOrder hclause
  obtain ⟨w, f, p, x, z, rfl, hnd, hw, hf, hp, hx, hz, h1, h2⟩ :=
    mem_circleIsoscelesInstances ht
  simp only [List.nodup_cons, List.mem_cons, List.not_mem_nil, or_false, not_or,
    List.nodup_nil, and_true, not_false_eq_true] at hnd
  obtain ⟨⟨hwf, -, hwx, hwz⟩, ⟨hfp, hfx, hfz⟩, ⟨hpx, hpz⟩, hxz⟩ := hnd
  simp only [circleIsoscelesClause]
  apply clauseHolds_normalize
  by_cases e1 : val (equalVar (edgeIndex w f) (edgeIndex w x))
  · by_cases e2 : val (equalVar (edgeIndex w f) (edgeIndex w z))
    · by_cases e3 : val (equalVar (edgeIndex p z) (edgeIndex x z))
      · exfalso
        have hd1 := (hval.equal_labels hw hf hw hx hwf hwx (by omega)).mp e1
        have hd2 := (hval.equal_labels hw hf hw hz hwf hwz (by omega)).mp e2
        have hd3 := (hval.equal_labels hp hz hx hz hpz hxz (by omega)).mp e3
        simp only [hB.pt_eq] at hd1 hd2 hd3
        exact false_of_circle_isosceles_cyclic hB.convexIndep hB.injective rfl hB.ccw
          (hB.cyclicFive_of_instance hw hf hp hx hz hwf hwz hfp hfx hfz hpx hxz h1 h2)
          hd1 hd2 hd3
      · exact ⟨neg (equalVar (edgeIndex p z) (edgeIndex x z)), by simp, litHolds_neg.mpr e3⟩
    · exact ⟨neg (equalVar (edgeIndex w f) (edgeIndex w z)), by simp, litHolds_neg.mpr e2⟩
  · exact ⟨neg (equalVar (edgeIndex w f) (edgeIndex w x)), by simp, litHolds_neg.mpr e1⟩

/- ## The `k4_everywhere` family -/

/-- A relation valuation with the `K4` selectors read from the geometry: every center
has a selected quad, and a selected quad is equidistant from its center. -/
structure K4Valuation (pt : Fin 12 → ℝ²) (val : ℕ → Prop) : Prop
    extends RelationValuation pt val where
  selected : ∀ center ∈ labels, ∃ qs ∈ k4Selectors center, val qs.2
  equidistant : ∀ center ∈ labels, ∀ qs ∈ k4Selectors center, val qs.2 →
    ∀ a ∈ qs.1, ∀ b ∈ qs.1,
      dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b))

/-- Family `k4_everywhere`: a true selector forces its quad's equalities at its center,
and every center has a true selector. -/
theorem k4Everywhere_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} (hK : K4Valuation pt val) :
    familyHolds val k4Everywhere := by
  intro clause hclause
  unfold k4Everywhere at hclause
  rw [List.mem_flatMap] at hclause
  obtain ⟨center, hcenter, hclause⟩ := hclause
  dsimp only at hclause
  rw [List.mem_append, List.mem_flatMap, List.mem_singleton] at hclause
  have hc12 : center < 12 := mem_labels.mp hcenter
  rcases hclause with ⟨⟨quad, sel⟩, hqs, hclause⟩ | rfl
  · dsimp only at hclause
    rw [List.mem_map] at hclause
    obtain ⟨⟨a, b⟩, hab, rfl⟩ := hclause
    dsimp only
    obtain ⟨hquad, hsel⟩ := mem_allocate hqs
    obtain ⟨hs, -⟩ := sublist_of_mem_combinations hquad
    obtain ⟨ha, hb, hab'⟩ := mem_pairs ((others_nodup center).sublist hs) hab
    obtain ⟨ha12, hac⟩ := mem_others.mp (hs.subset ha)
    obtain ⟨hb12, hbc⟩ := mem_others.mp (hs.subset hb)
    apply clauseHolds_normalize
    by_cases hv : val sel
    · refine ⟨pos (sameVar center a b), by simp, (litHolds_pos (equalVar_pos _ _)).mpr ?_⟩
      have hd := hK.equidistant center hcenter (quad, sel) hqs hv a ha b hb
      exact (hK.toRelationValuation.equal_labels hc12 ha12 hc12 hb12 hac.symm hbc.symm
        (by omega)).mpr hd
    · exact ⟨neg sel, by simp, litHolds_neg.mpr hv⟩
  · apply clauseHolds_normalize
    obtain ⟨⟨quad, sel⟩, hqs, hv⟩ := hK.selected center hcenter
    exact ⟨pos sel, List.mem_map.mpr ⟨(quad, sel), hqs, rfl⟩,
      (litHolds_pos (mem_allocate hqs).2).mpr hv⟩

end DRExactTwelveValuation
end ATailFrontierLiveClosure
end Problem97
