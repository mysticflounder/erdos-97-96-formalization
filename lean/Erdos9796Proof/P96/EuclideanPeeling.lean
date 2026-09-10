import Mathlib.Data.Finset.Sym
import Mathlib.Data.Sym.Card
import FormalConjecturesForMathlib.Geometry.Metric
import FormalConjectures.ErdosProblems.«97»
import FormalConjecturesForMathlib.Geometry.«2d»
import Erdos9796Proof.P97.UniversalLocal
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# P96 unit-distance bound by Euclidean-native peeling from P97

For any convex-independent finset `A : Finset ℝ²` (where `ℝ² =
EuclideanSpace ℝ (Fin 2)`), the number of Euclidean unit-distance pairs
satisfies

```
unitDistNum A ≤ 3 * A.card.
```

## Proof strategy

The proof is a clean ~200-line Euclidean-native rewrite of the classical
"peeling" argument that derives the `≤ 3n` bound from Problem 97. It
sidesteps the metric mismatch documented in
`docs/p96-peeling-port-blocker.md` (the sibling lane's `Track1`
development is on `Finset (ℝ × ℝ)` with `Prod.dist = max ·.1 ·.2` = the
L∞ metric, not Euclidean).

1. **Peel-vertex extraction.** From `Problem97.UniversalProblem97`, every
   nonempty convex-independent `A` admits a vertex `p ∈ A` with at most
   `3` other points at Euclidean unit distance (Lemma
   `peel_vertex_exists`).
2. **Doubled-count erase recurrence.** Working with the doubled count
   `doubledUnitCount A := |{(p,q) ∈ A.offDiag | dist p q = 1}|`, we get a
   clean recurrence (Lemma `doubledUnitCount_erase`):
   ```
   doubledUnitCount A = doubledUnitCount (A.erase p)
                       + 2 * |{q ∈ A | dist p q = 1}|
   ```
   The factor `2` arises because each unit edge at `p` appears in
   `A.offDiag` twice: as `(p, q)` and as `(q, p)`.
3. **Strong induction.** On `A.card`, peel the low-degree vertex `p` and
   apply the IH:
   `doubledUnitCount A ≤ 6 * (A.card - 1) + 2 * 3 = 6 * A.card`.
4. **Divide by 2** to get `unitDistNum A ≤ 3 * A.card`.

`ConvexIndep` is preserved under `erase` (via `ConvexIndep.erase` in
`ConvexIndepHelpers.lean`), so the inductive step on `A.erase p`
inherits the hypothesis.

The full theorem closes the obligation
`p96-euclidean-peeling-from-scratch`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem96
namespace EuclideanPeeling

/- ### The doubled unit-edge count -/

/-- The "doubled" Euclidean unit-distance count on `A`: the number of
ordered pairs `(p, q) ∈ A.offDiag` with `dist p q = 1`. Each unit
edge contributes twice (once as `(p, q)`, once as `(q, p)`). The
unordered count `unitDistNum A` is this
divided by `2`. -/
noncomputable def doubledUnitCount (A : Finset ℝ²) : ℕ :=
  (A.offDiag.filter (fun p => dist p.1 p.2 = 1)).card

/- ### Bridge to the upstream unordered count

At Lean/mathlib v4.33.1 the upstream interface is the `Sym2`-based
`unitDistNum`, which counts UNORDERED unit pairs directly.  The former
`EuclideanGeometry.unitDistancePairsCount`, whose body was literally
`doubledUnitCount / 2`, no longer exists, and the bridge below is a real
theorem rather than the `rfl` that sufficed against that body. -/

section UnitDistNumBridge

variable {X : Type*} [MetricSpace X]

omit [MetricSpace X] in
/-- P96 EuclideanPeeling lemma. -/
private lemma sym2_mk_out (z : Sym2 X) : s(z.out.1, z.out.2) = z := z.out_eq

/-- P96 EuclideanPeeling lemma. -/
private lemma dist_out_mk (a b : X) :
    dist (s(a, b) : Sym2 X).out.1 (s(a, b) : Sym2 X).out.2 = dist a b := by
  rcases Sym2.eq_iff.mp (sym2_mk_out (s(a, b) : Sym2 X)) with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · rw [h1, h2]
  · rw [h1, h2, dist_comm]

/-- Every unordered unit pair has exactly two ordered representatives, so the
ordered count is twice the unordered one.  Stated for a general metric space;
the `ℝ²` instance is what P96 consumes. -/
theorem two_mul_unitDistNum (A : Finset X) :
    2 * unitDistNum A = (A.offDiag.filter fun p : X × X => dist p.1 p.2 = 1).card := by
  classical
  set T : Finset (X × X) := A.offDiag.filter (fun p : X × X => dist p.1 p.2 = 1) with hT
  have hmemT : ∀ x y : X, ((x, y) ∈ T ↔ (x ∈ A ∧ y ∈ A ∧ x ≠ y) ∧ dist x y = 1) := by
    intro x y
    simp [hT, Finset.mem_filter, Finset.mem_offDiag]
  have key : {z ∈ A.sym2 | dist z.out.1 z.out.2 = 1} = T.image Sym2.mk.uncurry := by
    ext z
    induction z using Sym2.ind with
    | _ a b =>
      rw [Finset.mem_filter, Finset.mem_image]
      rw [Finset.mk_mem_sym2_iff, dist_out_mk]
      constructor
      · rintro ⟨⟨ha, hb⟩, hd⟩
        refine ⟨(a, b), (hmemT a b).mpr ⟨⟨ha, hb, ?_⟩, hd⟩, rfl⟩
        rintro rfl
        rw [dist_self] at hd
        exact zero_ne_one hd
      · rintro ⟨⟨x, y⟩, hxy, heq⟩
        obtain ⟨⟨hx, hy, -⟩, hd⟩ := (hmemT x y).mp hxy
        have heq' : s(x, y) = s(a, b) := heq
        rcases Sym2.eq_iff.mp heq' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
        · exact ⟨⟨hx, hy⟩, hd⟩
        · exact ⟨⟨hy, hx⟩, by rwa [dist_comm]⟩
  rw [unitDistNum, key,
    Finset.card_eq_sum_card_image (Sym2.mk.uncurry : X × X → Sym2 X) T,
    Finset.sum_const_nat (Sym2.ind ?_), mul_comm]
  intro a b hab
  obtain ⟨⟨x, y⟩, hxy, hmk⟩ := Finset.mem_image.mp hab
  obtain ⟨⟨hx, hy, hxyne⟩, hxyd⟩ := (hmemT x y).mp hxy
  have hmk' : s(x, y) = s(a, b) := hmk
  have hab' : (a ∈ A ∧ b ∈ A ∧ a ≠ b) ∧ dist a b = 1 := by
    rcases Sym2.eq_iff.mp hmk' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
    · exact ⟨⟨hx, hy, hxyne⟩, hxyd⟩
    · exact ⟨⟨hy, hx, hxyne.symm⟩, by rwa [dist_comm]⟩
  obtain ⟨⟨haA, hbA, hne⟩, hd⟩ := hab'
  have hfib : T.filter (fun z => Sym2.mk.uncurry z = s(a, b)) = {(a, b), (b, a)} := by
    ext p
    obtain ⟨u, v⟩ := p
    rw [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨-, heq⟩
      have heq' : s(u, v) = s(a, b) := heq
      rcases Sym2.eq_iff.mp heq' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
      · exact Or.inl rfl
      · exact Or.inr rfl
    · rintro (h | h)
      · rw [Prod.mk.injEq] at h
        obtain ⟨rfl, rfl⟩ := h
        exact ⟨(hmemT u v).mpr ⟨⟨haA, hbA, hne⟩, hd⟩, rfl⟩
      · rw [Prod.mk.injEq] at h
        obtain ⟨rfl, rfl⟩ := h
        exact ⟨(hmemT u v).mpr ⟨⟨hbA, haA, hne.symm⟩, by rwa [dist_comm]⟩, Sym2.eq_swap⟩
  rw [hfib, Finset.card_pair_eq_two_iff.mpr (by rw [Ne, Prod.mk.injEq]; exact fun h => hne h.1)]

end UnitDistNumBridge

/-- The upstream unordered count in terms of our doubled count: it is exactly
`doubledUnitCount / 2`.  This replaces the pre-v4.33.1 `rfl` bridge to
`EuclideanGeometry.unitDistancePairsCount`. -/
theorem unitDistNum_eq_doubledUnitCount_div_two (A : Finset ℝ²) :
    unitDistNum A = doubledUnitCount A / 2 := by
  unfold doubledUnitCount
  rw [← two_mul_unitDistNum A, Nat.mul_div_cancel_left _ (by norm_num)]

/- ### A bookkeeping equality

The unit-distance neighbours of `p` in `A` and in `A.erase p` are the
same finset, because `dist p p = 0 ≠ 1` already excludes `p` itself
from the filter. -/

/-- P96 EuclideanPeeling lemma. -/
lemma card_filter_unit_erase (A : Finset ℝ²) (p : ℝ²) :
    ((A.erase p).filter (fun q => dist p q = 1)).card =
      (A.filter (fun q => dist p q = 1)).card := by
  congr 1
  ext q
  simp only [Finset.mem_filter, Finset.mem_erase]
  refine ⟨fun ⟨⟨_, h2⟩, h3⟩ => ⟨h2, h3⟩, fun ⟨h1, h2⟩ => ⟨⟨?_, h1⟩, h2⟩⟩
  intro heq
  rw [heq, dist_self] at h2
  norm_num at h2

/- ### The doubled-count erase recurrence

Removing `p ∈ A` from `A` removes exactly `2 · (unit-degree of p)`
ordered unit-distance pairs from `A.offDiag`. The proof decomposes
`A.offDiag` along `Finset.offDiag_insert` into three pairwise-disjoint
pieces, then carries the filter through each. -/

/-- P96 EuclideanPeeling lemma. -/
lemma doubledUnitCount_erase (A : Finset ℝ²) (p : ℝ²) (hp : p ∈ A) :
    doubledUnitCount A =
      doubledUnitCount (A.erase p) +
        2 * (A.filter (fun q => dist p q = 1)).card := by
  unfold doubledUnitCount
  rw [← card_filter_unit_erase A p]
  -- Decomposition of A.offDiag via insert_erase + offDiag_insert.
  have hdecomp : A.offDiag =
      (A.erase p).offDiag ∪ ({p} ×ˢ (A.erase p)) ∪ ((A.erase p) ×ˢ {p}) := by
    have heq : A = insert p (A.erase p) := (Finset.insert_erase hp).symm
    conv_lhs => rw [heq]
    rw [Finset.offDiag_insert (Finset.notMem_erase p A)]
  -- (A.erase p).offDiag is disjoint from {p} ×ˢ (A.erase p):
  -- offDiag entries have both coordinates in A.erase p, hence ≠ p; product
  -- entries have first coordinate p.
  have hd_off_left : Disjoint ((A.erase p).offDiag) ({p} ×ˢ (A.erase p)) := by
    rw [Finset.disjoint_left]
    intro pp h1 h2
    simp only [Finset.mem_offDiag, Finset.mem_product,
      Finset.mem_singleton] at h1 h2
    exact (Finset.notMem_erase p A) (h2.1 ▸ h1.1)
  -- ((A.erase p).offDiag ∪ {p} ×ˢ A.erase p) is disjoint from (A.erase p) ×ˢ {p}.
  have hd_off_right :
      Disjoint ((A.erase p).offDiag ∪ ({p} ×ˢ (A.erase p)))
        ((A.erase p) ×ˢ {p}) := by
    rw [Finset.disjoint_union_left]
    refine ⟨?_, ?_⟩
    · rw [Finset.disjoint_left]
      intro pp h1 h2
      simp only [Finset.mem_offDiag, Finset.mem_product,
        Finset.mem_singleton] at h1 h2
      exact (Finset.notMem_erase p A) (h2.2 ▸ h1.2.1)
    · rw [Finset.disjoint_left]
      intro pp h1 h2
      simp only [Finset.mem_product, Finset.mem_singleton] at h1 h2
      exact (Finset.notMem_erase p A) (h1.1 ▸ h2.1)
  -- Each singleton product contributes one copy of the unit-degree on the
  -- right. {p} ×ˢ (A.erase p) is in bijection with A.erase p via snd; the
  -- filter `dist (p, q).1 (p, q).2 = 1` matches `dist p q = 1` directly.
  have h_sxA :
      (({p} ×ˢ (A.erase p)).filter
        (fun pp : ℝ² × ℝ² => dist pp.1 pp.2 = 1)).card =
        ((A.erase p).filter (fun q => dist p q = 1)).card := by
    rw [Finset.singleton_product, Finset.filter_map, Finset.card_map]
    rfl
  -- (A.erase p) ×ˢ {p} likewise, modulo `dist q p = dist p q`.
  have h_Axs :
      (((A.erase p) ×ˢ {p}).filter
        (fun pp : ℝ² × ℝ² => dist pp.1 pp.2 = 1)).card =
        ((A.erase p).filter (fun q => dist p q = 1)).card := by
    rw [Finset.product_singleton, Finset.filter_map, Finset.card_map]
    congr 1
    ext q
    simp [dist_comm]
  -- Now distribute the filter over the disjoint union and add the cards.
  rw [hdecomp, Finset.filter_union, Finset.filter_union]
  -- Build the disjointness on the filtered sets corresponding to hd_off_right.
  have hd_filt_right :
      Disjoint
        (((A.erase p).offDiag ∪ ({p} ×ˢ (A.erase p))).filter
          (fun pp : ℝ² × ℝ² => dist pp.1 pp.2 = 1))
        (((A.erase p) ×ˢ {p}).filter
          (fun pp : ℝ² × ℝ² => dist pp.1 pp.2 = 1)) :=
    Finset.disjoint_filter_filter hd_off_right
  -- Filter through that outer union to match the post-rewrite shape.
  rw [Finset.filter_union] at hd_filt_right
  rw [Finset.card_union_of_disjoint hd_filt_right,
    Finset.card_union_of_disjoint (Finset.disjoint_filter_filter hd_off_left),
    h_sxA, h_Axs]
  ring

/- ### Peel-vertex extraction

The universal P97 conclusion says: for nonempty convex-independent `A`,
`¬ HasNEquidistantProperty 4 A`. Unwinding, there is some `p ∈ A` such
that for every `r > 0`, fewer than `4` points of `A` lie at distance `r`
from `p`. Specializing `r = 1` gives the unit-degree bound we need. -/

/-- Peel-vertex extraction, stated against Problem 97 **as a hypothesis**
rather than against the (still open) `Problem97.UniversalProblem97`.

`Problem97.UniversalProblem97Statement` is the RHS of upstream
`Erdos97.erdos_97` verbatim, so this is the honest form of the step: given
Erdős 97, every nonempty convex-independent `A` has a vertex of unit-degree
at most `3`.  Kernel-clean on core axioms. -/
lemma peel_vertex_exists_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement)
    {A : Finset ℝ²} (hne : A.Nonempty)
    (hConv : Problem97.ConvexIndep A) :
    ∃ p ∈ A, (A.filter (fun q => dist p q = 1)).card ≤ 3 := by
  have h := hP97 A hne hConv
  unfold Erdos97.HasNEquidistantProperty Erdos97.HasNEquidistantPointsOn at h
  push_neg at h
  obtain ⟨p, hpA, hp⟩ := h
  refine ⟨p, hpA, ?_⟩
  unfold Erdos97.HasNEquidistantPointsAt at hp
  push_neg at hp
  have h1 : (A.filter (fun q => dist p q = 1)).card < 4 :=
    hp 1 (by norm_num)
  omega

/-- Peel-vertex extraction against the project's own P97 assembly.  This is
`peel_vertex_exists_of_erdos97` applied to `Problem97.UniversalProblem97`,
so it inherits that theorem's open A-tail obligations. -/
lemma peel_vertex_exists {A : Finset ℝ²} (hne : A.Nonempty)
    (hConv : Problem97.ConvexIndep A) :
    ∃ p ∈ A, (A.filter (fun q => dist p q = 1)).card ≤ 3 :=
  peel_vertex_exists_of_erdos97 Problem97.UniversalProblem97 hne hConv

/- ### Bound on the doubled count by strong induction -/

/-- **Doubled unit-edge count is at most `6n`, given Erdős 97.** Strong
induction on `A.card`: at each step, peel a low-unit-degree vertex `p` (from
`peel_vertex_exists_of_erdos97`) and apply the IH to `A.erase p` (whose
convex independence comes from `ConvexIndep.erase`).  Kernel-clean on core
axioms. -/
theorem doubledUnitCount_bound_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement) (A : Finset ℝ²)
    (hConv : Problem97.ConvexIndep A) :
    doubledUnitCount A ≤ 6 * A.card := by
  classical
  -- Strong induction on |A|.
  suffices h : ∀ n : ℕ, ∀ A : Finset ℝ², A.card = n →
      Problem97.ConvexIndep A → doubledUnitCount A ≤ 6 * A.card by
    exact h A.card A rfl hConv
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro A hcard hCv
    by_cases hne : A.Nonempty
    · -- Inductive step: peel and apply IH on A.erase p.
      obtain ⟨p, hpA, hdeg⟩ := peel_vertex_exists_of_erdos97 hP97 hne hCv
      have hCv' : Problem97.ConvexIndep (A.erase p) := hCv.erase p
      have hcard_erase_lt : (A.erase p).card < n := by
        rw [← hcard]
        exact (Finset.card_erase_of_mem hpA).symm ▸
          Nat.pred_lt (Finset.card_ne_zero.mpr hne)
      have IH := ih (A.erase p).card hcard_erase_lt (A.erase p) rfl hCv'
      have hrec := doubledUnitCount_erase A p hpA
      have hbd : doubledUnitCount A ≤ 6 * (A.erase p).card + 2 * 3 := by
        rw [hrec]
        exact Nat.add_le_add IH (Nat.mul_le_mul_left 2 hdeg)
      have hcard_erase : (A.erase p).card = A.card - 1 :=
        Finset.card_erase_of_mem hpA
      have hcard_pos : 1 ≤ A.card := Finset.card_pos.mpr hne
      calc doubledUnitCount A
          ≤ 6 * (A.erase p).card + 2 * 3 := hbd
        _ = 6 * (A.card - 1) + 6 := by rw [hcard_erase]
        _ = 6 * A.card := by omega
    · -- Base case: A = ∅. Then offDiag is empty and so is the filter.
      have hA_empty : A = ∅ := Finset.not_nonempty_iff_eq_empty.mp hne
      simp [hA_empty, doubledUnitCount]

/-- Doubled unit-edge bound against the project's own P97 assembly; inherits
its open A-tail obligations. -/
theorem doubledUnitCount_bound (A : Finset ℝ²)
    (hConv : Problem97.ConvexIndep A) :
    doubledUnitCount A ≤ 6 * A.card :=
  doubledUnitCount_bound_of_erdos97 Problem97.UniversalProblem97 A hConv

end EuclideanPeeling

/- ### Headline P96 bound -/

/-- **Erdős 97 ⟹ the halved ordered-pair count is at most `3 |A|`.**

This is the shape `comparator/Challenge.lean` inlines: `doubledUnitCount` is a
plain `def` whose body is literally that Challenge expression, so a comparator
Solution closes against it by delta at default transparency.
`unit_distance_pairs_bound_of_erdos97` below is the same bound restated in the
upstream `unitDistNum` vocabulary.

The explicit P97 hypothesis is carried deliberately; discharging it here would
route the comparator's headline through the still-open
`Problem97.UniversalProblem97`. -/
theorem doubledUnitCount_div_two_bound_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement)
    {A : Finset ℝ²} (hConv : Problem97.ConvexIndep A) :
    EuclideanPeeling.doubledUnitCount A / 2 ≤ 3 * A.card := by
  calc EuclideanPeeling.doubledUnitCount A / 2
      ≤ (6 * A.card) / 2 := Nat.div_le_div_right
        (EuclideanPeeling.doubledUnitCount_bound_of_erdos97 hP97 A hConv)
    _ = 3 * A.card := by omega

/-- **Erdős 97 ⟹ Erdős 96, per-set form with explicit constant 3.**

Given Erdős 97 as a hypothesis — `hP97` is the RHS of upstream
`Erdos97.erdos_97` verbatim — every convex-independent `A : Finset ℝ²`
determines at most `3 * |A|` unit distances.

This is the load-bearing reduction of the P96 branch, and it is
**unconditionally proved**: its axiom closure is
`{propext, Classical.choice, Quot.sound}`.  The openness of
`Problem96.erdos96_rhs` enters only when `hP97` is discharged by
`Problem97.UniversalProblem97`, which is still open. -/
theorem unit_distance_pairs_bound_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement)
    {A : Finset ℝ²} (hConv : Problem97.ConvexIndep A) :
    unitDistNum A ≤ 3 * A.card := by
  rw [EuclideanPeeling.unitDistNum_eq_doubledUnitCount_div_two]
  exact doubledUnitCount_div_two_bound_of_erdos97 hP97 hConv

/-- **Erdős Problem 96 unit-distance bound from Problem 97 (Euclidean
form).** For any convex-independent `A : Finset ℝ²`, the number of
Euclidean unit-distance pairs is at most `3 * A.card`.

`unit_distance_pairs_bound_of_erdos97` applied to
`Problem97.UniversalProblem97`; inherits that theorem's open obligations. -/
theorem unit_distance_pairs_bound {A : Finset ℝ²}
    (hConv : Problem97.ConvexIndep A) :
    unitDistNum A ≤ 3 * A.card :=
  unit_distance_pairs_bound_of_erdos97 Problem97.UniversalProblem97 hConv

end Problem96
