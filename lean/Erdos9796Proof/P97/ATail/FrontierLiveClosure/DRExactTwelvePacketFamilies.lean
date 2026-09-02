/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveValuation

/-!
# Valuation of the D-R exact-12 two-family CNF: the packet families

Plan item P3.4b of `docs/plans/2026-09-01-dr-two-radius-branch-closure.md`,
packet slice, part A (abstract).  The consumer is the leaf
`false_of_exactFourPostCardElevenTwoRadiusBranch`
(`ATail/FrontierLiveClosure/Rigid221Closure.lean`), through the valuation
theorem of P3.4b that combines this module with `DRExactTwelveValuation`.

## Interface

* `PacketData`: the finite data read by the selector variables of the D-R
  packet, on the Nat labels of the mirror: the two rows `X`, `Y` at
  `secondApex`, the class `U` at `firstApex`, the blocker map `chi` of the
  late shell system, the source and the deleted label of the ingress, the
  chosen row `B₂ ∈ {X, Y}`, and the shell support `B₁` of the source at its
  blocker.
* `PacketValuation pt val P`: a `K4Valuation` whose selector variables read
  `P`, with the geometric content of each field stated on `pt` through
  `dist`: the rows and the class are full radius classes at their centers
  with the cap counts of L3/L4 (`secondApexRow_census_of_twoRadiusBranch_exactTwelve`,
  `firstApexClass_census_of_twoRadiusBranch_exactTwelve`); every four points
  pairwise equidistant from `firstApex` lie in `U`
  (`firstApexClass_radius_unique_of_twoRadiusBranch`); at the blocker of a
  label no four other points are equidistant from it (`CriticalShellSystem.no_qfree`);
  and the ingress data of `CommonDeletionTwoCenterPacket` (`B₁`, `B₂`,
  `overlap_le_two`).

## Theorems

* `secondApexRows_holds`, `firstApexClass_holds`, `blockers_holds`,
  `ingress_holds`: the four packet families hold under a `PacketValuation`.

The cardinality helpers of the encoder are handled once: `exactlyOne_holds`
from a unique true variable, `exactlyK_holds` from the count of true keys of
a `Nodup` key list, `exactClass_holds` from the equidistance and closure of
a class.  The variable tables are read through `lookup_mem` (the looked-up
variable is allocated to its key) and `lookup_injOn`; no table is evaluated.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveValuation

open DRExactTwelveDimacs

/- ## Family combinators -/

theorem familyHolds_append {val : ℕ → Prop} {l₁ l₂ : List (List ℤ)}
    (h₁ : familyHolds val l₁) (h₂ : familyHolds val l₂) : familyHolds val (l₁ ++ l₂) := by
  intro clause hclause
  rcases List.mem_append.mp hclause with h | h
  · exact h₁ clause h
  · exact h₂ clause h

theorem familyHolds_flatMap {α : Type*} {val : ℕ → Prop} {l : List α}
    {f : α → List (List ℤ)} (h : ∀ a ∈ l, familyHolds val (f a)) :
    familyHolds val (l.flatMap f) := by
  intro clause hclause
  obtain ⟨a, ha, hc⟩ := List.mem_flatMap.mp hclause
  exact h a ha clause hc

theorem familyHolds_map {α : Type*} {val : ℕ → Prop} {l : List α} {f : α → List ℤ}
    (h : ∀ a ∈ l, clauseHolds val (f a)) : familyHolds val (l.map f) := by
  intro clause hclause
  obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hclause
  exact h a ha

theorem familyHolds_nil {val : ℕ → Prop} : familyHolds val [] := by
  intro clause hclause
  simp at hclause

theorem familyHolds_cons {val : ℕ → Prop} {clause : List ℤ} {l : List (List ℤ)}
    (h : clauseHolds val clause) (hl : familyHolds val l) : familyHolds val (clause :: l) := by
  intro c hc
  rcases List.mem_cons.mp hc with rfl | hc
  · exact h
  · exact hl c hc

/-- A three-literal clause holds when the failure of the first two literals forces the
third. -/
private theorem clauseHolds_of_three {val : ℕ → Prop} {l₁ l₂ l₃ : ℤ}
    (h : ¬ litHolds val l₁ → ¬ litHolds val l₂ → litHolds val l₃) :
    clauseHolds val [l₁, l₂, l₃] := by
  by_cases h1 : litHolds val l₁
  · exact ⟨l₁, by simp, h1⟩
  · by_cases h2 : litHolds val l₂
    · exact ⟨l₂, by simp, h2⟩
    · exact ⟨l₃, by simp, h h1 h2⟩

/-- In a clause with no true literal, every negative literal names a true variable. -/
private theorem val_of_neg_mem {val : ℕ → Prop} {l : List ℤ}
    (hnone : ∀ lit ∈ l, ¬ litHolds val lit) {v : ℕ} (hv : neg v ∈ l) : val v := by
  have := hnone _ hv
  rwa [litHolds_neg, not_not] at this

/-- In a clause with no true literal, every positive literal names a false variable. -/
private theorem not_val_of_pos_mem {val : ℕ → Prop} {l : List ℤ}
    (hnone : ∀ lit ∈ l, ¬ litHolds val lit) {v : ℕ} (hpos : 0 < v) (hv : pos v ∈ l) :
    ¬ val v := by
  have := hnone _ hv
  rwa [litHolds_pos hpos] at this

/- ## The variable tables -/

theorem map_fst_allocate {α : Type*} (base : ℕ) (keys : List α) :
    (allocate base keys).map Prod.fst = keys := by
  unfold allocate
  rw [List.map_map]
  have : (Prod.fst ∘ fun (p : α × ℕ) => (p.1, base + p.2 + 1)) = Prod.fst := by
    funext ⟨k, i⟩
    rfl
  rw [this, List.zipIdx_map_fst]

theorem mem_allocate_iff {α : Type*} {base : ℕ} {keys : List α} {k : α} {v : ℕ} :
    (k, v) ∈ allocate base keys ↔ ∃ i, keys[i]? = some k ∧ v = base + i + 1 := by
  unfold allocate
  rw [List.mem_map]
  constructor
  · rintro ⟨⟨k', i⟩, hki, hkv⟩
    simp only [Prod.mk.injEq] at hkv
    obtain ⟨rfl, rfl⟩ := hkv
    exact ⟨i, List.mem_zipIdx_iff_getElem?.mp hki, rfl⟩
  · rintro ⟨i, hi, rfl⟩
    exact ⟨(k, i), List.mem_zipIdx_iff_getElem?.mpr hi, rfl⟩

theorem allocate_nodup {α : Type*} {base : ℕ} {keys : List α} (hnd : keys.Nodup) :
    (allocate base keys).Nodup :=
  List.Nodup.of_map Prod.fst (by rwa [map_fst_allocate])

/-- One variable is allocated to at most one key. -/
theorem fst_eq_of_mem_allocate {α : Type*} {base : ℕ} {keys : List α} {k k' : α} {v : ℕ}
    (h : (k, v) ∈ allocate base keys) (h' : (k', v) ∈ allocate base keys) : k = k' := by
  obtain ⟨i, hi, hv⟩ := mem_allocate_iff.mp h
  obtain ⟨j, hj, hv'⟩ := mem_allocate_iff.mp h'
  have hij : i = j := by omega
  subst hij
  rw [hi] at hj
  exact Option.some.inj hj

/-- A key of a `Nodup` key list receives one variable. -/
theorem snd_eq_of_mem_allocate {α : Type*} {base : ℕ} {keys : List α} (hnd : keys.Nodup)
    {k : α} {v v' : ℕ} (h : (k, v) ∈ allocate base keys)
    (h' : (k, v') ∈ allocate base keys) : v = v' := by
  obtain ⟨i, hi, rfl⟩ := mem_allocate_iff.mp h
  obtain ⟨j, hj, rfl⟩ := mem_allocate_iff.mp h'
  obtain ⟨hlen, -⟩ := List.getElem?_eq_some_iff.mp hi
  have := List.getElem?_inj hlen hnd (hi.trans hj.symm)
  omega

theorem exists_mem_allocate {α : Type*} {base : ℕ} {keys : List α} {k : α} (h : k ∈ keys) :
    ∃ v, (k, v) ∈ allocate base keys := by
  have hmap := map_fst_allocate base keys
  rw [← hmap, List.mem_map] at h
  obtain ⟨⟨k', v⟩, hkv, rfl⟩ := h
  exact ⟨v, hkv⟩

/-- `lookup` returns the variable of the first table entry with the given key. -/
theorem lookup_mem_of_fst_mem {α : Type*} [BEq α] [LawfulBEq α] :
    ∀ {table : List (α × ℕ)} {k : α},
      k ∈ table.map Prod.fst → (k, lookup table k) ∈ table
  | [], _, h => by simp at h
  | (k', v') :: table, k, h => by
    by_cases hk : k' = k
    · subst hk
      simp [lookup]
    · have h' : k ∈ table.map Prod.fst := by
        rw [List.map_cons, List.mem_cons] at h
        exact h.resolve_left (Ne.symm hk)
      have ih := lookup_mem_of_fst_mem h'
      have hbeq : (k' == k) = false := beq_eq_false_iff_ne.mpr hk
      simp only [lookup, List.find?_cons, hbeq] at ih ⊢
      exact List.mem_cons_of_mem _ ih

theorem lookup_mem {α : Type*} [BEq α] [LawfulBEq α] {base : ℕ} {keys : List α} {k : α}
    (h : k ∈ keys) : (k, lookup (allocate base keys) k) ∈ allocate base keys :=
  lookup_mem_of_fst_mem (by rwa [map_fst_allocate])

theorem lookup_pos {α : Type*} [BEq α] [LawfulBEq α] {base : ℕ} {keys : List α} {k : α}
    (h : k ∈ keys) : 0 < lookup (allocate base keys) k :=
  (mem_allocate (lookup_mem h)).2

theorem lookup_injOn {α : Type*} [BEq α] [LawfulBEq α] {base : ℕ} {keys : List α} {k k' : α}
    (hk : k ∈ keys) (hk' : k' ∈ keys)
    (h : lookup (allocate base keys) k = lookup (allocate base keys) k') : k = k' :=
  fst_eq_of_mem_allocate (lookup_mem hk) (h ▸ lookup_mem hk')

/- ## The label lists of the packet -/

theorem mem_blockerCenters {z c : ℕ} :
    c ∈ blockerCenters z ↔ c < 12 ∧ c ≠ z ∧ c ≠ secondApex := by
  simp [blockerCenters, labels, List.mem_filter]

theorem blockerCenters_nodup (z : ℕ) : (blockerCenters z).Nodup := labels_nodup.filter _

theorem deletedKeys_nodup : deletedKeys.Nodup := labels_nodup.filter _

theorem mem_others_firstApex_of_mem_deletedKeys :
    ∀ d ∈ deletedKeys, d ∈ others firstApex := by
  decide

theorem xVar_pos {z : ℕ} (hz : z ∈ others secondApex) : 0 < xVar z := lookup_pos hz

theorem yVar_pos {z : ℕ} (hz : z ∈ others secondApex) : 0 < yVar z := lookup_pos hz

theorem uVar_pos {z : ℕ} (hz : z ∈ others firstApex) : 0 < uVar z := lookup_pos hz

theorem chiVar_pos {z c : ℕ} (hc : c ∈ blockerCenters z) : 0 < chiVar z c := lookup_pos hc

theorem chiVar_injOn {z c c' : ℕ} (hc : c ∈ blockerCenters z) (hc' : c' ∈ blockerCenters z)
    (h : chiVar z c = chiVar z c') : c = c' :=
  lookup_injOn hc hc' h

theorem srcVar_pos {z : ℕ} (hz : z ∈ labels) : 0 < srcVar z := lookup_pos hz

theorem srcVar_injOn {z z' : ℕ} (hz : z ∈ labels) (hz' : z' ∈ labels)
    (h : srcVar z = srcVar z') : z = z' :=
  lookup_injOn hz hz' h

theorem b2x_pos : 0 < b2x := by
  unfold b2x
  omega

theorem b2y_pos : 0 < b2y := by
  unfold b2y
  omega

theorem b2x_ne_b2y : b2x ≠ b2y := by
  unfold b2y
  omega

/- ## Pairs and sublists -/

theorem mem_combinations_of_sublist :
    ∀ {xs l : List ℕ}, l.Sublist xs → l ∈ combinations xs l.length
  | _, _, List.Sublist.slnil => by simp [combinations]
  | _, l, List.Sublist.cons x h => by
    cases l with
    | nil => simp [combinations]
    | cons y l =>
      have ih := mem_combinations_of_sublist h
      simp only [List.length_cons, combinations, List.mem_append]
      exact Or.inr ih
  | _, _, List.Sublist.cons₂ x h => by
    have ih := mem_combinations_of_sublist h
    simp only [List.length_cons, combinations, List.mem_append, List.mem_map]
    exact Or.inl ⟨_, ih, rfl⟩

theorem mem_pairs_of_sublist {l : List ℕ} {a b : ℕ} (h : [a, b].Sublist l) :
    (a, b) ∈ pairs l :=
  List.mem_filterMap.mpr ⟨[a, b], mem_combinations_of_sublist h, rfl⟩

theorem sublist_pair_of_mem :
    ∀ {l : List ℕ} {a b : ℕ}, a ∈ l → b ∈ l → a ≠ b →
      [a, b].Sublist l ∨ [b, a].Sublist l
  | [], _, _, ha, _, _ => absurd ha List.not_mem_nil
  | x :: l, a, b, ha, hb, hab => by
    rcases List.mem_cons.mp ha with rfl | ha'
    · have hb' : b ∈ l := by
        rcases List.mem_cons.mp hb with rfl | hb'
        · exact absurd rfl hab
        · exact hb'
      exact Or.inl ((List.singleton_sublist.mpr hb').cons₂ a)
    · rcases List.mem_cons.mp hb with rfl | hb'
      · exact Or.inr ((List.singleton_sublist.mpr ha').cons₂ b)
      · rcases sublist_pair_of_mem ha' hb' hab with h | h
        · exact Or.inl (h.cons x)
        · exact Or.inr (h.cons x)

/-- The variable `same(center, a, b)` on distinct labels other than the center. -/
theorem RelationValuation.sameVar_iff {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (h : RelationValuation pt val) {center a b : ℕ} (hc : center < 12) (ha : a < 12)
    (hb : b < 12) (hca : center ≠ a) (hcb : center ≠ b) (hab : a ≠ b) :
    val (sameVar center a b) ↔
      dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b)) :=
  h.equal_labels hc ha hc hb hca hcb (by omega)

/-- Equidistance from a center over a `Nodup` label list, from its `pairs`. -/
theorem equidistant_of_pairs {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (hrel : RelationValuation pt val) {center : ℕ} (hc : center < 12) {l : List ℕ}
    (hl : ∀ s ∈ l, s < 12 ∧ s ≠ center)
    (h : ∀ p ∈ pairs l, val (sameVar center p.1 p.2)) :
    ∀ a ∈ l, ∀ b ∈ l,
      dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b)) := by
  intro a ha b hb
  by_cases hab : a = b
  · subst hab
    rfl
  · have key : ∀ x y, x ∈ l → y ∈ l → x ≠ y → (x, y) ∈ pairs l →
        dist (pt (label center)) (pt (label x)) = dist (pt (label center)) (pt (label y)) := by
      intro x y hx hy hxy hp
      obtain ⟨hx12, hxc⟩ := hl x hx
      obtain ⟨hy12, hyc⟩ := hl y hy
      exact (hrel.sameVar_iff hc hx12 hy12 hxc.symm hyc.symm hxy).mp (h (x, y) hp)
    rcases sublist_pair_of_mem ha hb hab with hs | hs
    · exact key a b ha hb hab (mem_pairs_of_sublist hs)
    · exact (key b a hb ha (Ne.symm hab) (mem_pairs_of_sublist hs)).symm

/- ## The cardinality helpers -/

/-- `_exactly_one` from a unique true variable of a `Nodup` variable list. -/
theorem exactlyOne_holds {val : ℕ → Prop} {vs : List ℕ} (hpos : ∀ v ∈ vs, 0 < v)
    (hnd : vs.Nodup) (hex : ∃ v ∈ vs, val v)
    (huniq : ∀ v ∈ vs, ∀ v' ∈ vs, val v → val v' → v = v') :
    familyHolds val (exactlyOne vs) := by
  intro clause hclause
  unfold exactlyOne at hclause
  rw [List.mem_cons, List.mem_map] at hclause
  rcases hclause with rfl | ⟨pair, hpair, rfl⟩
  · obtain ⟨v, hv, hval⟩ := hex
    exact clauseHolds_normalize
      ⟨pos v, List.mem_map.mpr ⟨v, hv, rfl⟩, (litHolds_pos (hpos v hv)).mpr hval⟩
  · obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hpair
    rcases pair with _ | ⟨a, _ | ⟨b, _ | ⟨c, l⟩⟩⟩ <;>
      simp only [List.length_cons, List.length_nil] at hlen <;> try omega
    have hnd' := hnd.sublist hs
    rw [List.nodup_cons] at hnd'
    have hab : a ≠ b := fun h => hnd'.1 (by simp [h])
    have ha : a ∈ vs := hs.subset (by simp)
    have hb : b ∈ vs := hs.subset (by simp)
    apply clauseHolds_normalize
    by_cases hva : val a
    · by_cases hvb : val b
      · exact absurd (huniq a ha b hb hva hvb) hab
      · exact ⟨neg b, by simp, litHolds_neg.mpr hvb⟩
    · exact ⟨neg a, by simp, litHolds_neg.mpr hva⟩

/-- `_exactly_k` on the variables of a `Nodup` key list, from the count of true keys. -/
theorem exactlyK_holds {val : ℕ → Prop} {ks : List ℕ} (hnd : ks.Nodup) {f : ℕ → ℕ}
    (hpos : ∀ k ∈ ks, 0 < f k) {P : Finset ℕ} (hval : ∀ k ∈ ks, (val (f k) ↔ k ∈ P))
    {n : ℕ} (hcount : (ks.toFinset ∩ P).card = n) :
    familyHolds val (exactlyK (ks.map f) n) := by
  intro clause hclause
  unfold exactlyK at hclause
  rw [List.mem_append, List.mem_map, List.mem_map] at hclause
  have hcard : ks.toFinset.card = ks.length := List.toFinset_card_of_nodup hnd
  have hsdiff := Finset.card_sdiff_add_card_inter ks.toFinset P
  rcases hclause with ⟨subset, hsub, rfl⟩ | ⟨subset, hsub, rfl⟩
  · obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hsub
    obtain ⟨l, hl, rfl⟩ := List.sublist_map_iff.mp hs
    simp only [List.length_map] at hlen
    apply clauseHolds_normalize
    by_contra hnone
    have hall : ∀ k ∈ l, k ∉ P := by
      intro k hk hkP
      exact hnone ⟨pos (f k), List.mem_map.mpr ⟨f k, List.mem_map.mpr ⟨k, hk, rfl⟩, rfl⟩,
        (litHolds_pos (hpos k (hl.subset hk))).mpr ((hval k (hl.subset hk)).mpr hkP)⟩
    have hlsub : l.toFinset ⊆ ks.toFinset \ P := by
      intro k hk
      rw [List.mem_toFinset] at hk
      exact Finset.mem_sdiff.mpr ⟨List.mem_toFinset.mpr (hl.subset hk), hall k hk⟩
    have := Finset.card_le_card hlsub
    rw [List.toFinset_card_of_nodup (hnd.sublist hl)] at this
    omega
  · obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hsub
    obtain ⟨l, hl, rfl⟩ := List.sublist_map_iff.mp hs
    simp only [List.length_map] at hlen
    apply clauseHolds_normalize
    by_contra hnone
    have hall : ∀ k ∈ l, k ∈ P := by
      intro k hk
      by_contra hkP
      exact hnone ⟨neg (f k), List.mem_map.mpr ⟨f k, List.mem_map.mpr ⟨k, hk, rfl⟩, rfl⟩,
        litHolds_neg.mpr fun h => hkP ((hval k (hl.subset hk)).mp h)⟩
    have hlsub : l.toFinset ⊆ ks.toFinset ∩ P := by
      intro k hk
      rw [List.mem_toFinset] at hk
      exact Finset.mem_inter.mpr ⟨List.mem_toFinset.mpr (hl.subset hk), hall k hk⟩
    have := Finset.card_le_card hlsub
    rw [List.toFinset_card_of_nodup (hnd.sublist hl)] at this
    omega

/-- `exact_class`: the member variables of a table read a class of labels that is
equidistant from the center and closed under equidistance. -/
theorem exactClass_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (hrel : RelationValuation pt val) {center : ℕ} (hc : center < 12) {member : List (ℕ × ℕ)}
    (hpos : ∀ a ∈ others center, 0 < lookup member a) {P : Finset ℕ}
    (hval : ∀ a ∈ others center, (val (lookup member a) ↔ a ∈ P))
    (hequi : ∀ a ∈ others center, ∀ b ∈ others center, a ∈ P → b ∈ P →
      dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b)))
    (hclosed : ∀ a ∈ others center, ∀ b ∈ others center, a ∈ P →
      dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b)) →
      b ∈ P) :
    familyHolds val (exactClass center member) := by
  intro clause hclause
  unfold exactClass at hclause
  rw [List.mem_flatMap] at hclause
  obtain ⟨⟨a, b⟩, hab, hclause⟩ := hclause
  obtain ⟨ha, hb, hab'⟩ := mem_pairs (others_nodup center) hab
  obtain ⟨ha12, hac⟩ := mem_others.mp ha
  obtain ⟨hb12, hbc⟩ := mem_others.mp hb
  have hs := hrel.sameVar_iff hc ha12 hb12 hac.symm hbc.symm hab'
  have hspos : 0 < sameVar center a b := equalVar_pos _ _
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hclause
  rcases hclause with rfl | rfl | rfl
  · refine clauseHolds_normalize (clauseHolds_of_three fun h1 h2 => ?_)
    rw [litHolds_neg, not_not] at h1 h2
    rw [litHolds_pos hspos]
    exact hs.mpr (hequi a ha b hb ((hval a ha).mp h1) ((hval b hb).mp h2))
  · refine clauseHolds_normalize (clauseHolds_of_three fun h1 h2 => ?_)
    rw [litHolds_neg, not_not] at h1
    rw [litHolds_pos (hpos b hb)] at h2
    rw [litHolds_neg]
    intro hsame
    exact h2 ((hval b hb).mpr (hclosed a ha b hb ((hval a ha).mp h1) (hs.mp hsame)))
  · refine clauseHolds_normalize (clauseHolds_of_three fun h1 h2 => ?_)
    rw [litHolds_pos (hpos a ha)] at h1
    rw [litHolds_neg, not_not] at h2
    rw [litHolds_neg]
    intro hsame
    exact h1 ((hval a ha).mpr (hclosed b hb a ha ((hval b hb).mp h2) (hs.mp hsame).symm))

/- ## The packet data and the packet valuation -/

/-- The finite data of the D-R packet read by the selector variables, on the Nat
labels of the mirror: the rows `X`, `Y` at `secondApex`, the class `U` at
`firstApex`, the blocker map, the source and the deleted label, the chosen row
`B₂`, and the shell support `B₁` of the source at its blocker. -/
structure PacketData where
  /-- `X`: the first exact four-class row at `secondApex` (radius `rho`). -/
  firstRow : Finset ℕ
  /-- `Y`: the second row at `secondApex` (radius `otherRadius`). -/
  secondRow : Finset ℕ
  /-- `U`: the class at `firstApex` at the frontier radius. -/
  apexClass : Finset ℕ
  /-- `chi`: the blocker center of each label in the late shell system. -/
  blocker : ℕ → ℕ
  /-- `src`: the source label. -/
  source : ℕ
  /-- `deleted`: the deleted label. -/
  deleted : ℕ
  /-- `B₂`: the chosen row, `X` or `Y`. -/
  chosenRow : Finset ℕ
  /-- `B₁`: the shell support of the source at its blocker. -/
  shell : Finset ℕ

/-- A `K4Valuation` whose packet variables read the data `P`, with the geometric
content of the packet on `pt`. -/
structure PacketValuation (pt : Fin 12 → ℝ²) (val : ℕ → Prop) (P : PacketData) : Prop
    extends K4Valuation pt val where
  /-- `X:z` reads membership in the first row. -/
  xVar_iff : ∀ z ∈ others secondApex, (val (xVar z) ↔ z ∈ P.firstRow)
  /-- `Y:z` reads membership in the second row. -/
  yVar_iff : ∀ z ∈ others secondApex, (val (yVar z) ↔ z ∈ P.secondRow)
  /-- The first row is equidistant from `secondApex`. -/
  firstRow_equidistant : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex,
    a ∈ P.firstRow → b ∈ P.firstRow →
      dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b))
  /-- The first row is the full class of its radius at `secondApex`. -/
  firstRow_closed : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex, a ∈ P.firstRow →
    dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b)) →
      b ∈ P.firstRow
  /-- The second row is equidistant from `secondApex`. -/
  secondRow_equidistant : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex,
    a ∈ P.secondRow → b ∈ P.secondRow →
      dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b))
  /-- The second row is the full class of its radius at `secondApex`. -/
  secondRow_closed : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex, a ∈ P.secondRow →
    dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b)) →
      b ∈ P.secondRow
  /-- The first row has two points in the strict second-opposite interior. -/
  firstRow_secondOpposite : (secondOppositeInterior.toFinset ∩ P.firstRow).card = 2
  /-- The first row has one point in the closed surplus cap. -/
  firstRow_surplus : ((surplusInterior ++ [firstApex]).toFinset ∩ P.firstRow).card = 1
  /-- The first row has one point in the closed first-opposite cap. -/
  firstRow_firstOpposite :
    ((firstOppositeInterior ++ [thirdApex]).toFinset ∩ P.firstRow).card = 1
  /-- The second row has two points in the strict second-opposite interior. -/
  secondRow_secondOpposite : (secondOppositeInterior.toFinset ∩ P.secondRow).card = 2
  /-- The second row has one point in the closed surplus cap. -/
  secondRow_surplus : ((surplusInterior ++ [firstApex]).toFinset ∩ P.secondRow).card = 1
  /-- The second row has one point in the closed first-opposite cap. -/
  secondRow_firstOpposite :
    ((firstOppositeInterior ++ [thirdApex]).toFinset ∩ P.secondRow).card = 1
  /-- The rows are disjoint. -/
  rows_disjoint : ∀ z ∈ others secondApex, ¬ (z ∈ P.firstRow ∧ z ∈ P.secondRow)
  /-- `U:z` reads membership in the first-apex class. -/
  uVar_iff : ∀ z ∈ others firstApex, (val (uVar z) ↔ z ∈ P.apexClass)
  /-- The first-apex class is equidistant from `firstApex`. -/
  apexClass_equidistant : ∀ a ∈ others firstApex, ∀ b ∈ others firstApex,
    a ∈ P.apexClass → b ∈ P.apexClass →
      dist (pt (label firstApex)) (pt (label a)) = dist (pt (label firstApex)) (pt (label b))
  /-- The first-apex class is the full class of its radius at `firstApex`. -/
  apexClass_closed : ∀ a ∈ others firstApex, ∀ b ∈ others firstApex, a ∈ P.apexClass →
    dist (pt (label firstApex)) (pt (label a)) = dist (pt (label firstApex)) (pt (label b)) →
      b ∈ P.apexClass
  /-- `interior_q` lies in the first-apex class. -/
  interiorQ_mem : interiorQ ∈ P.apexClass
  /-- `interior_w` lies in the first-apex class. -/
  interiorW_mem : interiorW ∈ P.apexClass
  /-- The first-apex class has one point in the closed surplus cap. -/
  apexClass_surplus : ((surplusInterior ++ [secondApex]).toFinset ∩ P.apexClass).card = 1
  /-- The first-apex class has one point in the closed second-opposite cap. -/
  apexClass_secondOpposite :
    ((secondOppositeInterior ++ [thirdApex]).toFinset ∩ P.apexClass).card = 1
  /-- Every four labels pairwise equidistant from `firstApex` lie in the class. -/
  apexClass_of_four : ∀ Q : Finset ℕ, Q.card = 4 → (∀ s ∈ Q, s ∈ others firstApex) →
    (∀ a ∈ Q, ∀ b ∈ Q,
      dist (pt (label firstApex)) (pt (label a)) = dist (pt (label firstApex)) (pt (label b))) →
    ∀ z ∈ Q, z ∈ P.apexClass
  /-- The blocker of a label is a candidate blocker. -/
  blocker_mem : ∀ z ∈ labels, P.blocker z ∈ blockerCenters z
  /-- `chi:z:c` reads `c` being the blocker of `z`. -/
  chiVar_iff : ∀ z ∈ labels, ∀ c ∈ blockerCenters z, (val (chiVar z c) ↔ P.blocker z = c)
  /-- At the blocker of `z`, no four labels other than `z` are equidistant. -/
  blocker_noFour : ∀ z ∈ labels, ∀ Q : Finset ℕ, Q.card = 4 →
    (∀ s ∈ Q, s ∈ labels ∧ s ≠ z ∧ s ≠ P.blocker z) →
    (∀ a ∈ Q, ∀ b ∈ Q, dist (pt (label (P.blocker z))) (pt (label a)) =
      dist (pt (label (P.blocker z))) (pt (label b))) → False
  /-- The late system sends the first-apex class to `firstApex`. -/
  blocker_of_apexClass : ∀ z ∈ others firstApex, z ∈ P.apexClass → P.blocker z = firstApex
  /-- The source is a label. -/
  source_mem : P.source ∈ labels
  /-- `src:z` reads `z` being the source. -/
  srcVar_iff : ∀ z ∈ labels, (val (srcVar z) ↔ z = P.source)
  /-- The blocker of the source is not `firstApex`. -/
  blocker_source : P.blocker P.source ≠ firstApex
  /-- The deleted label is a deletion candidate. -/
  deleted_mem : P.deleted ∈ deletedKeys
  /-- `deleted:d` reads `d` being the deleted label. -/
  deleted_iff : ∀ d v, (d, v) ∈ deletedVars → (val v ↔ d = P.deleted)
  /-- The deleted label lies in the first-apex class. -/
  deleted_mem_apexClass : P.deleted ∈ P.apexClass
  /-- The chosen row is one of the two rows. -/
  chosenRow_eq : P.chosenRow = P.firstRow ∨ P.chosenRow = P.secondRow
  /-- `B2:X` reads the chosen row being the first row. -/
  b2x_iff : val b2x ↔ P.chosenRow = P.firstRow
  /-- `B2:Y` reads the chosen row being the second row. -/
  b2y_iff : val b2y ↔ P.chosenRow = P.secondRow
  /-- The chosen row avoids the deleted label. -/
  deleted_not_mem_chosenRow : P.deleted ∉ P.chosenRow
  /-- The deleted label is not the source. -/
  deleted_ne_source : P.deleted ≠ P.source
  /-- The shell is the class of the source at its blocker. -/
  shell_iff : ∀ t ∈ others (P.blocker P.source), (t ∈ P.shell ↔
    dist (pt (label (P.blocker P.source))) (pt (label t)) =
      dist (pt (label (P.blocker P.source))) (pt (label P.source)))
  /-- The shell avoids the deleted label. -/
  deleted_not_mem_shell : P.deleted ∉ P.shell
  /-- The shell and the chosen row share at most two labels. -/
  overlap_le_two : (P.shell ∩ P.chosenRow).card ≤ 2

namespace PacketValuation

variable {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}

theorem firstRow_ne_secondRow (hP : PacketValuation pt val P) : P.firstRow ≠ P.secondRow := by
  intro heq
  have hpos : 0 < (secondOppositeInterior.toFinset ∩ P.firstRow).card := by
    rw [hP.firstRow_secondOpposite]
    omega
  obtain ⟨a, ha⟩ := Finset.card_pos.mp hpos
  rw [Finset.mem_inter, List.mem_toFinset] at ha
  have hsub : ∀ k ∈ secondOppositeInterior, k ∈ others secondApex := by decide
  exact hP.rows_disjoint a (hsub a ha.1) ⟨ha.2, heq ▸ ha.2⟩

theorem source_mem_shell (hP : PacketValuation pt val P) : P.source ∈ P.shell := by
  obtain ⟨hb12, hbs, -⟩ := mem_blockerCenters.mp (hP.blocker_mem P.source hP.source_mem)
  exact (hP.shell_iff P.source
    (mem_others.mpr ⟨mem_labels.mp hP.source_mem, Ne.symm hbs⟩)).mpr rfl

end PacketValuation

/- ## Family 3: `second_apex_rows` -/

/-- One row block of `secondApexRows`: a full class at `secondApex` with the three
cap counts. -/
private theorem secondApexRow_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop}
    (hrel : RelationValuation pt val) {member : List (ℕ × ℕ)}
    (hpos : ∀ z ∈ others secondApex, 0 < lookup member z) {R : Finset ℕ}
    (hval : ∀ z ∈ others secondApex, (val (lookup member z) ↔ z ∈ R))
    (hequi : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex, a ∈ R → b ∈ R →
      dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b)))
    (hclosed : ∀ a ∈ others secondApex, ∀ b ∈ others secondApex, a ∈ R →
      dist (pt (label secondApex)) (pt (label a)) = dist (pt (label secondApex)) (pt (label b)) →
      b ∈ R)
    (h2 : (secondOppositeInterior.toFinset ∩ R).card = 2)
    (h1 : ((surplusInterior ++ [firstApex]).toFinset ∩ R).card = 1)
    (h1' : ((firstOppositeInterior ++ [thirdApex]).toFinset ∩ R).card = 1) :
    familyHolds val (exactClass secondApex member ++
      exactlyK (secondOppositeInterior.map (lookup member)) 2 ++
      exactlyK ((surplusInterior ++ [firstApex]).map (lookup member)) 1 ++
      exactlyK ((firstOppositeInterior ++ [thirdApex]).map (lookup member)) 1) := by
  have hsub2 : ∀ k ∈ secondOppositeInterior, k ∈ others secondApex := by decide
  have hsub1 : ∀ k ∈ surplusInterior ++ [firstApex], k ∈ others secondApex := by decide
  have hsub1' : ∀ k ∈ firstOppositeInterior ++ [thirdApex], k ∈ others secondApex := by decide
  refine familyHolds_append (familyHolds_append (familyHolds_append ?_ ?_) ?_) ?_
  · exact exactClass_holds hrel (by decide) hpos hval hequi hclosed
  · exact exactlyK_holds (by decide) (fun k hk => hpos k (hsub2 k hk))
      (fun k hk => hval k (hsub2 k hk)) h2
  · exact exactlyK_holds (by decide) (fun k hk => hpos k (hsub1 k hk))
      (fun k hk => hval k (hsub1 k hk)) h1
  · exact exactlyK_holds (by decide) (fun k hk => hpos k (hsub1' k hk))
      (fun k hk => hval k (hsub1' k hk)) h1'

/-- Family 3, `second_apex_rows`: `X` and `Y` are full classes at `secondApex` with
the cap counts of L3, and they are disjoint. -/
theorem secondApexRows_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}
    (hP : PacketValuation pt val P) : familyHolds val secondApexRows := by
  unfold secondApexRows
  refine familyHolds_append (familyHolds_flatMap ?_) (familyHolds_map ?_)
  · intro member hmember
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hmember
    rcases hmember with rfl | rfl
    · exact secondApexRow_holds hP.toRelationValuation (fun z hz => xVar_pos hz) hP.xVar_iff
        hP.firstRow_equidistant hP.firstRow_closed hP.firstRow_secondOpposite
        hP.firstRow_surplus hP.firstRow_firstOpposite
    · exact secondApexRow_holds hP.toRelationValuation (fun z hz => yVar_pos hz) hP.yVar_iff
        hP.secondRow_equidistant hP.secondRow_closed hP.secondRow_secondOpposite
        hP.secondRow_surplus hP.secondRow_firstOpposite
  · intro z hz
    apply clauseHolds_normalize
    by_cases hx : val (xVar z)
    · refine ⟨neg (yVar z), by simp, litHolds_neg.mpr fun hy => ?_⟩
      exact hP.rows_disjoint z hz ⟨(hP.xVar_iff z hz).mp hx, (hP.yVar_iff z hz).mp hy⟩
    · exact ⟨neg (xVar z), by simp, litHolds_neg.mpr hx⟩

/- ## Family 4: `first_apex_class` -/

/-- Family 4, `first_apex_class`: `U` is the full class at `firstApex` containing
`interior_q`, `interior_w`, with the cap counts of L4, and every four labels
pairwise equidistant from `firstApex` lie in `U`. -/
theorem firstApexClass_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}
    (hP : PacketValuation pt val P) : familyHolds val firstApexClass := by
  have hsub1 : ∀ k ∈ surplusInterior ++ [secondApex], k ∈ others firstApex := by decide
  have hsub2 : ∀ k ∈ secondOppositeInterior ++ [thirdApex], k ∈ others firstApex := by decide
  have hq : interiorQ ∈ others firstApex := by decide
  have hw : interiorW ∈ others firstApex := by decide
  unfold firstApexClass
  refine familyHolds_append (familyHolds_append (familyHolds_append (familyHolds_append ?_ ?_)
    ?_) ?_) ?_
  · exact exactClass_holds hP.toRelationValuation (by decide) (fun z hz => uVar_pos hz)
      hP.uVar_iff hP.apexClass_equidistant hP.apexClass_closed
  · refine familyHolds_cons ?_ (familyHolds_cons ?_ familyHolds_nil)
    · exact clauseHolds_normalize ⟨pos (uVar interiorQ), by simp,
        (litHolds_pos (uVar_pos hq)).mpr ((hP.uVar_iff _ hq).mpr hP.interiorQ_mem)⟩
    · exact clauseHolds_normalize ⟨pos (uVar interiorW), by simp,
        (litHolds_pos (uVar_pos hw)).mpr ((hP.uVar_iff _ hw).mpr hP.interiorW_mem)⟩
  · exact exactlyK_holds (by decide) (fun k hk => uVar_pos (hsub1 k hk))
      (fun k hk => hP.uVar_iff k (hsub1 k hk)) hP.apexClass_surplus
  · exact exactlyK_holds (by decide) (fun k hk => uVar_pos (hsub2 k hk))
      (fun k hk => hP.uVar_iff k (hsub2 k hk)) hP.apexClass_secondOpposite
  · refine familyHolds_flatMap ?_
    intro quad hquad
    obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hquad
    have hnd := (others_nodup firstApex).sublist hs
    refine familyHolds_map ?_
    intro z hz
    apply clauseHolds_normalize
    by_contra hnone
    simp only [clauseHolds, not_exists, not_and] at hnone
    have hpairs : ∀ p ∈ pairs quad, val (sameVar firstApex p.1 p.2) := by
      rintro ⟨a, b⟩ hp
      exact val_of_neg_mem hnone (List.mem_append_left _ (List.mem_map.mpr ⟨(a, b), hp, rfl⟩))
    have hnotU : ¬ val (uVar z) :=
      not_val_of_pos_mem hnone (uVar_pos (hs.subset hz)) (List.mem_append_right _ (by simp))
    apply hnotU
    rw [hP.uVar_iff z (hs.subset hz)]
    refine hP.apexClass_of_four quad.toFinset (by rw [List.toFinset_card_of_nodup hnd, hlen])
      (fun s hs' => hs.subset (List.mem_toFinset.mp hs')) ?_ z (List.mem_toFinset.mpr hz)
    intro a ha b hb
    rw [List.mem_toFinset] at ha hb
    exact equidistant_of_pairs hP.toRelationValuation (by decide)
      (fun s hs' => (mem_others.mp (hs.subset hs')).imp_right Ne.symm |>.imp_right Ne.symm)
      hpairs a ha b hb

/- ## Family 6: `blockers` -/

/-- Family 6, `blockers`: every label has exactly one blocker; at the blocker `c` of
`z` the selected `K4` quad contains `z` (no four labels avoiding `z` are equidistant
from `c`), and no four labels avoiding `z` are equidistant from `c` in either
clause shape; the first-apex class has blocker `firstApex`. -/
theorem blockers_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}
    (hP : PacketValuation pt val P) : familyHolds val blockers := by
  unfold blockers
  refine familyHolds_append (familyHolds_flatMap ?_) (familyHolds_map ?_)
  · intro z hz
    have hz12 := mem_labels.mp hz
    have hbc := hP.blocker_mem z hz
    dsimp only
    refine familyHolds_append ?_ (familyHolds_flatMap ?_)
    · refine exactlyOne_holds ?_ ?_ ?_ ?_
      · intro v hv
        obtain ⟨c, hc, rfl⟩ := List.mem_map.mp hv
        exact chiVar_pos hc
      · exact (blockerCenters_nodup z).map_on fun c hc c' hc' h => chiVar_injOn hc hc' h
      · exact ⟨chiVar z (P.blocker z), List.mem_map.mpr ⟨_, hbc, rfl⟩,
          (hP.chiVar_iff z hz _ hbc).mpr rfl⟩
      · intro v hv v' hv' hval hval'
        obtain ⟨c, hc, rfl⟩ := List.mem_map.mp hv
        obtain ⟨c', hc', rfl⟩ := List.mem_map.mp hv'
        rw [((hP.chiVar_iff z hz c hc).mp hval).symm.trans ((hP.chiVar_iff z hz c' hc').mp hval')]
    · intro c hc
      obtain ⟨hc12, hcz, -⟩ := mem_blockerCenters.mp hc
      have hrest : ∀ s ∈ labels.filter (fun l => l != z && l != c),
          s < 12 ∧ s ≠ z ∧ s ≠ c := by
        intro s hs
        simpa [labels, List.mem_filter] using hs
      have hrest_nodup : (labels.filter (fun l => l != z && l != c)).Nodup := labels_nodup.filter _
      refine familyHolds_append (familyHolds_append ?_ ?_) ?_
      · refine familyHolds_cons ?_ familyHolds_nil
        apply clauseHolds_normalize
        by_cases hchi : val (chiVar z c)
        · have hcb : P.blocker z = c := (hP.chiVar_iff z hz c hc).mp hchi
          subst hcb
          obtain ⟨⟨quad, sel⟩, hqs, hsel⟩ := hP.selected _ (mem_labels.mpr hc12)
          obtain ⟨hquad, hselpos⟩ := mem_allocate hqs
          obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hquad
          have hnd := (others_nodup _).sublist hs
          have hzq : z ∈ quad := by
            by_contra hzq
            refine hP.blocker_noFour z hz quad.toFinset
              (by rw [List.toFinset_card_of_nodup hnd, hlen]) ?_ ?_
            · intro s hs'
              rw [List.mem_toFinset] at hs'
              obtain ⟨hs12, hsc⟩ := mem_others.mp (hs.subset hs')
              exact ⟨mem_labels.mpr hs12, fun h => hzq (h ▸ hs'), hsc⟩
            · intro a ha b hb
              rw [List.mem_toFinset] at ha hb
              exact hP.equidistant _ (mem_labels.mpr hc12) (quad, sel) hqs hsel a ha b hb
          refine ⟨pos sel,
            List.mem_cons_of_mem _ (List.mem_filterMap.mpr ⟨(quad, sel), hqs, ?_⟩),
            (litHolds_pos hselpos).mpr hsel⟩
          simp [hzq]
        · exact ⟨neg (chiVar z c), List.mem_cons_self, litHolds_neg.mpr hchi⟩
      · refine familyHolds_map ?_
        intro quad hquad
        apply clauseHolds_normalize
        by_contra hnone
        simp only [clauseHolds, not_exists, not_and] at hnone
        have hchi : val (chiVar z c) := val_of_neg_mem hnone List.mem_cons_self
        have hcb : P.blocker z = c := (hP.chiVar_iff z hz c hc).mp hchi
        subst hcb
        obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hquad
        have hnd := hrest_nodup.sublist hs
        refine hP.blocker_noFour z hz quad.toFinset
          (by rw [List.toFinset_card_of_nodup hnd, hlen]) ?_ ?_
        · intro s hs'
          rw [List.mem_toFinset] at hs'
          obtain ⟨hs12, hsz, hsc⟩ := hrest s (hs.subset hs')
          exact ⟨mem_labels.mpr hs12, hsz, hsc⟩
        · intro a ha b hb
          rw [List.mem_toFinset] at ha hb
          obtain ⟨ha12, haz, hac⟩ := hrest a (hs.subset ha)
          obtain ⟨hb12, hbz, hbc'⟩ := hrest b (hs.subset hb)
          have hva := val_of_neg_mem hnone
            (List.mem_cons_of_mem _ (List.mem_map.mpr ⟨a, ha, rfl⟩))
          have hvb := val_of_neg_mem hnone
            (List.mem_cons_of_mem _ (List.mem_map.mpr ⟨b, hb, rfl⟩))
          have hda := (hP.toRelationValuation.sameVar_iff hc12 hz12 ha12 hcz hac.symm
            haz.symm).mp hva
          have hdb := (hP.toRelationValuation.sameVar_iff hc12 hz12 hb12 hcz hbc'.symm
            hbz.symm).mp hvb
          exact hda.symm.trans hdb
      · refine familyHolds_map ?_
        intro quad hquad
        apply clauseHolds_normalize
        by_contra hnone
        simp only [clauseHolds, not_exists, not_and] at hnone
        have hchi : val (chiVar z c) := val_of_neg_mem hnone List.mem_cons_self
        have hcb : P.blocker z = c := (hP.chiVar_iff z hz c hc).mp hchi
        subst hcb
        obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations hquad
        have hnd := hrest_nodup.sublist hs
        refine hP.blocker_noFour z hz quad.toFinset
          (by rw [List.toFinset_card_of_nodup hnd, hlen]) ?_ ?_
        · intro s hs'
          rw [List.mem_toFinset] at hs'
          obtain ⟨hs12, hsz, hsc⟩ := hrest s (hs.subset hs')
          exact ⟨mem_labels.mpr hs12, hsz, hsc⟩
        · intro a ha b hb
          rw [List.mem_toFinset] at ha hb
          refine equidistant_of_pairs hP.toRelationValuation hc12
            (fun s hs' => ⟨(hrest s (hs.subset hs')).1, (hrest s (hs.subset hs')).2.2⟩) ?_
            a ha b hb
          rintro ⟨x, y⟩ hp
          exact val_of_neg_mem hnone
            (List.mem_cons_of_mem _ (List.mem_map.mpr ⟨(x, y), hp, rfl⟩))
  · intro z hz
    obtain ⟨hz12, hz1⟩ := mem_others.mp hz
    apply clauseHolds_normalize
    by_cases hu : val (uVar z)
    · have h1 : firstApex ∈ blockerCenters z :=
        mem_blockerCenters.mpr ⟨by decide, Ne.symm hz1, by decide⟩
      refine ⟨pos (chiVar z firstApex), by simp, (litHolds_pos (chiVar_pos h1)).mpr ?_⟩
      exact (hP.chiVar_iff z (mem_labels.mpr hz12) firstApex h1).mpr
        (hP.blocker_of_apexClass z hz ((hP.uVar_iff z hz).mp hu))
    · exact ⟨neg (uVar z), by simp, litHolds_neg.mpr hu⟩

/- ## Family 7: `ingress` -/

/-- The overlap clauses of `ingress` for one row variable: under the source, its
blocker, and the row, no three candidates lie in the row and in the class of the
source at its blocker. -/
private theorem ingress_triple_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}
    (hP : PacketValuation pt val P) {z c : ℕ} (hz : z ∈ labels) (hc : c ∈ blockerCenters z)
    {row : ℕ} {member : List (ℕ × ℕ)} {R : Finset ℕ} (hrow : val row → P.chosenRow = R)
    (hval : ∀ t ∈ others secondApex, (val (lookup member t) ↔ t ∈ R)) {triple : List ℕ}
    (htriple : triple ∈ combinations (labels.filter fun t => t != secondApex && t != c) 3) :
    clauseHolds val (normalize ([neg (srcVar z), neg (chiVar z c)] ++ [neg row] ++
      (triple.map fun t => neg (lookup member t)) ++
      ((triple.filter fun t => t != z).map fun t => neg (sameVar c z t)))) := by
  have hz12 := mem_labels.mp hz
  obtain ⟨hc12, hcz, hc0⟩ := mem_blockerCenters.mp hc
  obtain ⟨hs, hlen⟩ := sublist_of_mem_combinations htriple
  have hcand : ∀ t ∈ triple, t < 12 ∧ t ≠ secondApex ∧ t ≠ c := by
    intro t ht
    simpa [labels, List.mem_filter] using hs.subset ht
  have hnd := (labels_nodup.filter _).sublist hs
  apply clauseHolds_normalize
  by_contra hnone
  simp only [clauseHolds, not_exists, not_and] at hnone
  have hsrc : z = P.source :=
    (hP.srcVar_iff z hz).mp (val_of_neg_mem hnone (by simp))
  have hcb : P.blocker z = c := (hP.chiVar_iff z hz c hc).mp (val_of_neg_mem hnone (by simp))
  have hR : P.chosenRow = R := hrow (val_of_neg_mem hnone (by simp))
  subst hsrc
  subst hcb
  have hall : ∀ t ∈ triple, t ∈ P.shell ∩ P.chosenRow := by
    intro t ht
    obtain ⟨ht12, ht0, htc⟩ := hcand t ht
    rw [Finset.mem_inter, hR]
    refine ⟨?_, (hval t (mem_others.mpr ⟨ht12, ht0⟩)).mp (val_of_neg_mem hnone
      (List.mem_append_left _ (List.mem_append_right _ (List.mem_map.mpr ⟨t, ht, rfl⟩))))⟩
    by_cases htz : t = P.source
    · subst htz
      exact hP.source_mem_shell
    · have hsame := val_of_neg_mem hnone (List.mem_append_right _ (List.mem_map.mpr
        ⟨t, List.mem_filter.mpr ⟨ht, by simpa using htz⟩, rfl⟩))
      rw [hP.shell_iff t (mem_others.mpr ⟨ht12, htc⟩)]
      exact ((hP.toRelationValuation.sameVar_iff hc12 hz12 ht12 hcz htc.symm
        (Ne.symm htz)).mp hsame).symm
  rcases triple with _ | ⟨t₁, _ | ⟨t₂, _ | ⟨t₃, _ | ⟨t₄, l⟩⟩⟩⟩ <;>
    simp only [List.length_cons, List.length_nil] at hlen <;> try omega
  simp only [List.nodup_cons, List.mem_cons, List.not_mem_nil, or_false, not_or,
    List.nodup_nil, and_true, not_false_eq_true] at hnd
  obtain ⟨⟨h12, h13⟩, h23⟩ := hnd
  have := Finset.two_lt_card.mpr ⟨t₁, hall t₁ (by simp), t₂, hall t₂ (by simp), t₃,
    hall t₃ (by simp), h12, h13, h23⟩
  have := hP.overlap_le_two
  omega

/-- Family 7, `ingress`: a unique source whose blocker is not `firstApex`; a unique
deleted label in `U`; a unique chosen row avoiding the deleted label; the deleted
label is not the source and lies outside the shell of the source at its blocker;
and the shell and the chosen row share at most two labels. -/
theorem ingress_holds {pt : Fin 12 → ℝ²} {val : ℕ → Prop} {P : PacketData}
    (hP : PacketValuation pt val P) : familyHolds val ingress := by
  unfold ingress
  refine familyHolds_append (familyHolds_append (familyHolds_append (familyHolds_append
    (familyHolds_append (familyHolds_append ?_ ?_) ?_) ?_) ?_) ?_) ?_
  · -- exactly one source
    refine exactlyOne_holds ?_ ?_ ?_ ?_
    · intro v hv
      obtain ⟨z, hz, rfl⟩ := List.mem_map.mp hv
      exact srcVar_pos hz
    · exact labels_nodup.map_on fun z hz z' hz' h => srcVar_injOn hz hz' h
    · exact ⟨srcVar P.source, List.mem_map.mpr ⟨_, hP.source_mem, rfl⟩,
        (hP.srcVar_iff _ hP.source_mem).mpr rfl⟩
    · intro v hv v' hv' hval hval'
      obtain ⟨z, hz, rfl⟩ := List.mem_map.mp hv
      obtain ⟨z', hz', rfl⟩ := List.mem_map.mp hv'
      rw [((hP.srcVar_iff z hz).mp hval).trans ((hP.srcVar_iff z' hz').mp hval').symm]
  · -- the blocker of the source is not the first apex
    refine familyHolds_map ?_
    intro z hz
    obtain ⟨hz12, hz1⟩ := mem_others.mp hz
    apply clauseHolds_normalize
    by_cases hsrc : val (srcVar z)
    · refine ⟨neg (chiVar z firstApex), by simp, litHolds_neg.mpr fun hchi => ?_⟩
      have h1 : firstApex ∈ blockerCenters z :=
        mem_blockerCenters.mpr ⟨by decide, Ne.symm hz1, by decide⟩
      have hzs := (hP.srcVar_iff z (mem_labels.mpr hz12)).mp hsrc
      have hb := (hP.chiVar_iff z (mem_labels.mpr hz12) firstApex h1).mp hchi
      rw [hzs] at hb
      exact hP.blocker_source hb
    · exact ⟨neg (srcVar z), by simp, litHolds_neg.mpr hsrc⟩
  · -- exactly one deleted label
    refine exactlyOne_holds ?_ ?_ ?_ ?_
    · intro v hv
      obtain ⟨⟨d, v⟩, hdv, rfl⟩ := List.mem_map.mp hv
      exact (mem_allocate hdv).2
    · refine (allocate_nodup deletedKeys_nodup).map_on ?_
      rintro ⟨d, v⟩ hdv ⟨d', v'⟩ hdv' h
      dsimp only at h
      subst h
      rw [fst_eq_of_mem_allocate hdv hdv']
    · obtain ⟨v, hv⟩ := exists_mem_allocate (base := srcBase + srcVars.length) hP.deleted_mem
      exact ⟨v, List.mem_map.mpr ⟨(P.deleted, v), hv, rfl⟩, (hP.deleted_iff _ _ hv).mpr rfl⟩
    · intro v hv v' hv' hval hval'
      obtain ⟨⟨d, v⟩, hdv, rfl⟩ := List.mem_map.mp hv
      obtain ⟨⟨d', v'⟩, hdv', rfl⟩ := List.mem_map.mp hv'
      have hd := (hP.deleted_iff d v hdv).mp hval
      have hd' := (hP.deleted_iff d' v' hdv').mp hval'
      subst hd
      subst hd'
      exact snd_eq_of_mem_allocate deletedKeys_nodup hdv hdv'
  · -- the deleted label lies in the first-apex class
    refine familyHolds_map ?_
    rintro ⟨d, v⟩ hdv
    dsimp only
    apply clauseHolds_normalize
    by_cases hdel : val v
    · have hd1 : d ∈ others firstApex :=
        mem_others_firstApex_of_mem_deletedKeys d (mem_allocate hdv).1
      have hd := (hP.deleted_iff d v hdv).mp hdel
      refine ⟨pos (uVar d), by simp, (litHolds_pos (uVar_pos hd1)).mpr ?_⟩
      rw [hP.uVar_iff d hd1, hd]
      exact hP.deleted_mem_apexClass
    · exact ⟨neg v, by simp, litHolds_neg.mpr hdel⟩
  · -- exactly one chosen row
    refine exactlyOne_holds ?_ ?_ ?_ ?_
    · intro v hv
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hv
      rcases hv with hv | hv <;> rw [hv]
      · exact b2x_pos
      · exact b2y_pos
    · simp [b2x_ne_b2y]
    · rcases hP.chosenRow_eq with h | h
      · exact ⟨b2x, by simp, hP.b2x_iff.mpr h⟩
      · exact ⟨b2y, by simp, hP.b2y_iff.mpr h⟩
    · intro v hv v' hv' hval hval'
      have hxy : ¬ (val b2x ∧ val b2y) := fun ⟨hx, hy⟩ =>
        hP.firstRow_ne_secondRow ((hP.b2x_iff.mp hx).symm.trans (hP.b2y_iff.mp hy))
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hv hv'
      rcases hv with hv | hv <;> rcases hv' with hv' | hv' <;> rw [hv] at hval <;>
        rw [hv'] at hval' <;> rw [hv, hv']
      · exact absurd ⟨hval, hval'⟩ hxy
      · exact absurd ⟨hval', hval⟩ hxy
  · -- the chosen row avoids the deleted label
    refine familyHolds_flatMap ?_
    rintro ⟨d, v⟩ hdv
    dsimp only
    split
    · exact familyHolds_nil
    · rename_i hd0
      have hd0' : d ≠ secondApex := by simpa using hd0
      have hd12 : d < 12 :=
        (mem_others.mp (mem_others_firstApex_of_mem_deletedKeys d (mem_allocate hdv).1)).1
      have hd : d ∈ others secondApex := mem_others.mpr ⟨hd12, hd0'⟩
      refine familyHolds_cons ?_ (familyHolds_cons ?_ familyHolds_nil)
      · refine clauseHolds_normalize (clauseHolds_of_three fun h1 h2 => ?_)
        rw [litHolds_neg, not_not] at h1 h2
        rw [litHolds_neg, hP.xVar_iff d hd]
        intro hx
        have hdd := (hP.deleted_iff d v hdv).mp h2
        have hrow := hP.b2x_iff.mp h1
        apply hP.deleted_not_mem_chosenRow
        rw [hrow, ← hdd]
        exact hx
      · refine clauseHolds_normalize (clauseHolds_of_three fun h1 h2 => ?_)
        rw [litHolds_neg, not_not] at h1 h2
        rw [litHolds_neg, hP.yVar_iff d hd]
        intro hy
        have hdd := (hP.deleted_iff d v hdv).mp h2
        have hrow := hP.b2y_iff.mp h1
        apply hP.deleted_not_mem_chosenRow
        rw [hrow, ← hdd]
        exact hy
  · -- the source, its blocker, the deleted label, and the overlap bound
    refine familyHolds_flatMap ?_
    intro z hz
    have hz12 := mem_labels.mp hz
    dsimp only
    refine familyHolds_flatMap ?_
    intro c hc
    obtain ⟨hc12, hcz, hc0⟩ := mem_blockerCenters.mp hc
    refine familyHolds_append ?_ (familyHolds_flatMap ?_)
    · intro clause hclause
      obtain ⟨⟨d, v⟩, hdv, hf⟩ := List.mem_filterMap.mp hclause
      dsimp only at hf
      split at hf
      · rename_i hdz
        rw [Option.some.injEq] at hf
        subst hf
        have hdz' : d = z := by simpa using hdz
        subst hdz'
        apply clauseHolds_normalize
        by_cases hsrc : val (srcVar d)
        · refine ⟨neg v, by simp, litHolds_neg.mpr fun hdel => ?_⟩
          have h1 := (hP.srcVar_iff d hz).mp hsrc
          have h2 := (hP.deleted_iff d v hdv).mp hdel
          exact hP.deleted_ne_source (h2.symm.trans h1)
        · exact ⟨neg (srcVar d), by simp, litHolds_neg.mpr hsrc⟩
      · split at hf
        · simp at hf
        · rename_i hdz hdc
          rw [Option.some.injEq] at hf
          subst hf
          have hdz' : d ≠ z := by simpa using hdz
          have hdc' : d ≠ c := by simpa using hdc
          have hd12 : d < 12 :=
            (mem_others.mp (mem_others_firstApex_of_mem_deletedKeys d (mem_allocate hdv).1)).1
          apply clauseHolds_normalize
          by_contra hnone
          simp only [clauseHolds, not_exists, not_and] at hnone
          have hsrc : z = P.source := (hP.srcVar_iff z hz).mp (val_of_neg_mem hnone (by simp))
          have hcb : P.blocker z = c :=
            (hP.chiVar_iff z hz c hc).mp (val_of_neg_mem hnone (by simp))
          have hdel : d = P.deleted := (hP.deleted_iff d v hdv).mp (val_of_neg_mem hnone (by simp))
          have hsame := val_of_neg_mem hnone (v := sameVar c z d) (by simp)
          subst hsrc
          subst hcb
          subst hdel
          apply hP.deleted_not_mem_shell
          rw [hP.shell_iff P.deleted (mem_others.mpr ⟨hd12, hdc'⟩)]
          exact ((hP.toRelationValuation.sameVar_iff hc12 hz12 hd12 hcz hdc'.symm
            (Ne.symm hdz')).mp hsame).symm
    · intro p hp
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hp
      rcases hp with rfl | rfl
      · refine familyHolds_map ?_
        intro triple htriple
        exact ingress_triple_holds hP hz hc (fun h => hP.b2x_iff.mp h) hP.xVar_iff htriple
      · refine familyHolds_map ?_
        intro triple htriple
        exact ingress_triple_holds hP hz hc (fun h => hP.b2y_iff.mp h) hP.yVar_iff htriple

end DRExactTwelveValuation
end ATailFrontierLiveClosure
end Problem97
