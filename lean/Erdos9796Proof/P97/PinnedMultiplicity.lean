import Erdos9796Proof.P97.UniversalProblem97

/-!
# Erdős 97 as a pinned-distance-multiplicity statement

The upstream predicate `Erdos97.HasNEquidistantProperty 4 A` is phrased with an
existential radius at each point.  This file gives the equivalent *pinned
multiplicity* phrasing.

That phrasing is Erdős's own, and it is what he was actually after.  In "On sets
of distances of n points", Amer. Math. Monthly 53 (1946), 248–250, §2 "Some
conjectures concerning f(n)", p. 248 (quoted verbatim from the page image at
`users.renyi.hu/~p_erdos/1946-03.pdf`):

> The following conjecture is stronger: In every convex polygon there is at
> least one vertex with the property that no three vertices of the polygon are
> equally distant from it.  If this is the case, then clearly we would obtain
> [n/2] different distances by considering all the distances from such a vertex.
>
> A still stronger conjecture is that on every convex curve there exists a point
> P such that every circle with center P intersects the curve in at most 2
> points.

The second paragraph is the pinned-multiplicity form written out: "every circle
with center P intersects ... in at most 2 points" is exactly μ(P, ·) ≤ 2.  So
this framing is not a modern restatement — it is in the source paper, in both of
the shapes used below.

The `k = 3` form was later disproved by Danzer; the `k = 4` conjecture this
repository targets is in Erdős, "Some combinatorial and metric problems in
geometry", Intuitive Geometry (Siófok 1985), Colloq. Math. Soc. J. Bolyai 48
(1987), 167–177, **p. 176**: "Perhaps in every convex polygon there is a vertex
which does not have four other vertices equidistant from it."  Danzer's nonagon
is drawn on that same page.  (An earlier version of this docstring cited p. 175;
that page carries a *different* conjecture — see the problem separation below.)

Three nearby Erdős conjectures are easily conflated; only the third is this
repository's Problem 97 target:

* **erdosproblems #93** — a convex `n`-gon determines at least `⌊n/2⌋` distinct
  distances *globally*.  Proved by Altman, "On a problem of P. Erdős", Amer.
  Math. Monthly 70 (1963), 148–157.  Not a pinned statement: Altman's own
  restatement of it (Canad. Math. Bull. 15 (1972), 329–340, p. 338, Theorem 3)
  is a plain count of distinct distances between pairs of vertices.
* **erdosproblems #982** — some *vertex* has at least `⌊n/2⌋` distinct distances
  to the others (pinned *count*).  Open.  This is what Erdős 1987 p. 175 states,
  and what he repeatedly flags as unsettled (1970 AMM 77 p. 739; 1975 Ann. Mat.
  Pura Appl. 103 p. 100; 1987 p. 175).
* **erdosproblems #97** — some vertex has no four others equidistant from it
  (pinned *multiplicity*).  Open; the target here.

Terminology warning.  In the distance literature "pinned" conventionally modifies
a *set*: the pinned distance set `D_p(A) = {dist p q : q ∈ A}` (e.g. the pinned
Falconer problem).  That object discards multiplicity, and counting it is Erdős
96 territory — the adjacent problem in this repository.  `pinnedMultiplicity` is
a statistic of the *multiset* of distances from `p`, which the standard pinned
apparatus throws away.  The name is not attested in the literature; it is used
here for want of a standard one, and a reader who knows "pinned distances"
should not read it as `D_p(A)`.

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
  `(n - 1) / 3` distinct distances — a weak form of the pinned-count conjecture
  #982 above, which asks for `⌊n/2⌋` and is itself open.
  Note the implication runs only that way: distinct-distance lower bounds
  constrain the *average* multiplicity at `p`, whereas Erdős 97 is an upper
  bound on the *maximum*, so they do not give it back.
  Altman's `⌊n/2⌋` theorem does **not** short-circuit this: it is a *global*
  count over all pairs (#93), not a bound at any single vertex, so it implies no
  pinned lower bound at all.  Nothing unconditional is known at a vertex.
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
