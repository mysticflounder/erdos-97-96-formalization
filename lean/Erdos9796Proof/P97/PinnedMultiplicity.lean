import Erdos9796Proof.P97.UniversalProblem97

/-!
# Erdős 97 as a pinned-distance-multiplicity statement

The upstream predicate `Erdos97.HasNEquidistantProperty 4 A` is phrased with an
existential radius at each point.  This file gives the equivalent *pinned
multiplicity* phrasing, which is the form the problem takes in the
distinct-distances literature (Dumitrescu, DCG 36 (2006);
Nivasch–Pach–Pinchasi–Zerbib, JoCG 4 (2013)).

For `p ∈ A` put

  μ(p, A) = max over r > 0 of #{q ∈ A : dist p q = r},

the largest number of points of `A` lying on a single circle of positive radius
centred at `p` (`pinnedMultiplicity`).  Then

  Erdős 97  ⟺  every finite `A ⊆ ℝ²` in strictly convex position
               has a point `p` with μ(p, A) ≤ 3.

`universalProblem97Statement_iff_pinnedMultiplicity` proves that equivalence
against `Problem97.UniversalProblem97Statement`, which is definitionally the RHS
of upstream `Erdos97.erdos_97`.  It is a **reformulation, not a proof**: the
equivalence is kernel-clean on core axioms, while both sides remain open.

Why this phrasing is the useful one:

* μ(p, A) ≤ m forces at least `(|A| - 1) / m` *distinct* distances from `p`, so
  Erdős 97 implies that some vertex of a convex `n`-gon determines at least
  `(n - 1) / 3` distinct distances — the pinned distinct-distances question.
* Erdős 96 is the same family read the other way: it bounds how often one fixed
  distance can repeat across the whole set, where this bounds the per-point
  maximum multiplicity.  `Problem96.erdos96_rhs_of_erdos97` is the bridge.
* The threshold `3` is attained: Danzer's 9-point convex polygon (recorded in
  the upstream `Erdos97.erdos_97.variants.three_equidistant` docstring) has
  μ(p, A) = 3 at every vertex.  `Problem97.FiniteN9Closure` is exactly the
  statement that it cannot be pushed to 4 at that cardinality.

The unconditional consequence at `|A| ≤ 9` is
`Problem97.exists_pinnedMultiplicity_le_three_of_card_le_nine`, in
`UniversalLocal.lean` (it needs the counting obstruction, which is imported
later than this file).
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The positive distances from `p` that are realized inside `A`. -/
noncomputable def pinnedRadii (A : Finset ℝ²) (p : ℝ²) : Finset ℝ :=
  (A.image (fun q => dist p q)).filter (fun r => 0 < r)

/-- **Pinned distance multiplicity.**  `pinnedMultiplicity A p` is the largest
number of points of `A` on a single circle of positive radius centred at `p`:

  μ(p, A) = max over r > 0 of #{q ∈ A : dist p q = r}.

The maximum is taken over the finitely many positive distances actually
realized from `p`, and is `0` when there are none. -/
noncomputable def pinnedMultiplicity (A : Finset ℝ²) (p : ℝ²) : ℕ :=
  (pinnedRadii A p).sup (fun r => (A.filter (fun q => dist p q = r)).card)

theorem mem_pinnedRadii_iff {A : Finset ℝ²} {p : ℝ²} {r : ℝ} :
    r ∈ pinnedRadii A p ↔ (∃ q ∈ A, dist p q = r) ∧ 0 < r := by
  simp [pinnedRadii, Finset.mem_filter, Finset.mem_image]

/-- Having `n` points of `A` equidistant from `p` is exactly `μ(p, A) ≥ n`.
The positivity hypothesis is needed in both directions: it supplies the witness
that makes the radius realized, and rules out the empty maximum. -/
theorem hasNEquidistantPointsAt_iff_le_pinnedMultiplicity
    {A : Finset ℝ²} {p : ℝ²} {n : ℕ} (hn : 0 < n) :
    HasNEquidistantPointsAt n A p ↔ n ≤ pinnedMultiplicity A p := by
  constructor
  · rintro ⟨r, hr, hcard⟩
    have hne : (A.filter (fun q => dist p q = r)).Nonempty := by
      rw [← Finset.card_pos]; omega
    obtain ⟨q, hq⟩ := hne
    rw [Finset.mem_filter] at hq
    have hmem : r ∈ pinnedRadii A p := mem_pinnedRadii_iff.mpr ⟨⟨q, hq.1, hq.2⟩, hr⟩
    refine le_trans hcard ?_
    rw [pinnedMultiplicity]
    exact Finset.le_sup (f := fun r => (A.filter (fun q => dist p q = r)).card) hmem
  · intro h
    have hpos : 0 < pinnedMultiplicity A p := lt_of_lt_of_le hn h
    have hne : (pinnedRadii A p).Nonempty := by
      rcases Finset.eq_empty_or_nonempty (pinnedRadii A p) with hc | hc
      · rw [pinnedMultiplicity, hc, Finset.sup_empty] at hpos; exact absurd hpos (lt_irrefl 0)
      · exact hc
    obtain ⟨r, hrmem, hreq⟩ :=
      Finset.exists_mem_eq_sup (pinnedRadii A p) hne
        (fun r => (A.filter (fun q => dist p q = r)).card)
    exact ⟨r, (mem_pinnedRadii_iff.mp hrmem).2, by
      rw [pinnedMultiplicity, hreq] at h; exact h⟩

/-- The `n`-equidistant property is exactly "every point has pinned
multiplicity at least `n`". -/
theorem hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity
    {A : Finset ℝ²} {n : ℕ} (hn : 0 < n) :
    HasNEquidistantProperty n A ↔ ∀ p ∈ A, n ≤ pinnedMultiplicity A p := by
  constructor
  · intro h p hp
    exact (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mp (h p hp)
  · intro h p hp
    exact (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity hn).mpr (h p hp)

/-- Failing the 4-equidistant property is exactly having a point of pinned
multiplicity at most 3. -/
theorem not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three
    (A : Finset ℝ²) :
    ¬ HasNEquidistantProperty 4 A ↔ ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  rw [hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity (by norm_num : 0 < 4)]
  push_neg
  constructor
  · rintro ⟨p, hp, hlt⟩; exact ⟨p, hp, by omega⟩
  · rintro ⟨p, hp, hle⟩; exact ⟨p, hp, by omega⟩

/-- **Erdős 97, pinned-multiplicity form.**

  Erdős 97 ⟺ every finite `A ⊆ ℝ²` in strictly convex position has a point `p`
  with μ(p, A) ≤ 3,

where μ(p, A) is the largest number of points of `A` on any one circle of
positive radius centred at `p`.

The left-hand side is `Problem97.UniversalProblem97Statement`, definitionally
the RHS of upstream `Erdos97.erdos_97`.  This is a reformulation: the
equivalence is kernel-clean on core axioms, but both sides are still open. -/
theorem universalProblem97Statement_iff_pinnedMultiplicity :
    UniversalProblem97Statement ↔
      ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
        ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 := by
  constructor
  · intro h A hne hconv
    exact (not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mp
      (h A hne hconv)
  · intro h A hne hconv
    exact (not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mpr
      (h A hne hconv)

end Problem97
