# Seven-support tournament audit

Date: 2026-08-02

## Verdict

Let `X` have seven elements and let `B_i ⊆ X` have cardinality four with
`i ∈ B_i`.  Suppose every unordered pair `{i,j}` is covered by at least one
of `j ∈ B_i` and `i ∈ B_j`.

The set axioms alone force the relation

```text
i -> j  iff  j ∈ B_i, for i != j
```

to be a regular tournament.  If the intersection bound
`|B_i ∩ B_j| <= 2` applies to every `i != j` (in particular, if the center of
`B_i` is the vertex `i`), it then forces the unique doubly regular tournament
on seven vertices.  This is the Paley tournament `T_7`, and the complements
of the supports are the seven lines of the Fano plane.

There is one premise boundary: if the geometric centers are separate data,
the displayed set axioms do not prove that those centers are distinct.  In
that interpretation the intersection bound cannot automatically be applied
to every pair, and Paley uniqueness does not follow.

## Counting

There are exactly

```text
sum_i (|B_i| - 1) = 7 * 3 = 21
```

ordered off-diagonal incidences `(i,j)` with `j ∈ B_i`.  There are also 21
unordered pairs.  Pair coverage is a surjection from those incidences to the
unordered pairs, and each fiber has size one or two.  Equal domain and
codomain cardinalities force every fiber to have size one.  Hence, for all
distinct `i,j`,

```text
j ∈ B_i  iff  i ∉ B_j.
```

In particular, both directions never occur.  Every vertex has outdegree
three, so this is a regular tournament.  The supports are also distinct:
`B_i = B_j` would put both `i` and `j` in that common set and give both
directions.

If centers are the indexed vertices, then their distinctness is simply
`i != j`; otherwise it is an additional geometric premise, not a consequence
of this incidence count.

## What the intersection bound forces

For a vertex `x`, exactly four supports contain `x`: `B_x` itself and the
three supports indexed by the in-neighbors of `x`.  Double-counting support
intersections therefore gives

```text
sum_{i<j} |B_i ∩ B_j|
  = sum_x binom(number of supports containing x, 2)
  = 7 * binom(4,2)
  = 42.
```

If all 21 distinct-index pairs satisfy `|B_i ∩ B_j| <= 2`, equality forces

```text
|B_i ∩ B_j| = 2  for every i != j.
```

For either orientation of `{i,j}`, the head of the arc belongs to the
intersection, and the remaining intersection points are the common
out-neighbors.  Thus every pair has exactly one common out-neighbor.  The
exact tournament condition is consequently

```text
outdegree(i) = 3,
|N+(i) ∩ N+(j)| = 1  for all i != j.
```

This is a doubly regular tournament with parameters `(7,3,1)`.

Equivalently, with `C_i = X \ B_i`, every `C_i` is a triple and every two
`C_i,C_j` meet in exactly one point.  Each point lies in three such triples;
the 21 point-pairs occur exactly once across the seven triples.  Hence the
`C_i` form the Fano plane and the `B_i` are its line complements.

## Hand classification

Fix a vertex `v`, let `A = N+(v)` and `D = N-(v)`.  Both have size three.

For `a ∈ A`, the unique common out-neighbor of `v,a` is exactly the unique
out-neighbor of `a` inside `A`; therefore `A` is a directed 3-cycle.  For
`d ∈ D`, the unique common out-neighbor of `v,d` lies in `A`, so `d` beats
exactly one member of `A`; regularity then makes `D` a directed 3-cycle.
Degree counts on the `A` side show that the three arcs from `D` to `A` are a
perfect matching.

Write `A = {a1,a2,a3}` with

```text
a1 -> a2 -> a3 -> a1
```

and label `D = {d1,d2,d3}` by the matching arcs `di -> ai`.  Then each `ai`
beats the two nonmatched `d` vertices.  The pair `(ai,d(i+1))` already has
`a(i+1)` as a common out-neighbor.  To avoid a second one, the unique
out-neighbor of `d(i+1)` inside `D` must be `di`, not `d(i+2)`.  Thus the
cycle on `D` is forced to run in the reverse indexed direction.  All arcs are
now determined, proving uniqueness up to isomorphism.

The isomorphism to the standard Paley tournament on `Z/7Z` is

```text
v  -> 0
a1 -> 1, a2 -> 2, a3 -> 4
d1 -> 6, d2 -> 5, d3 -> 3.
```

There `i -> j` exactly when `j-i` is in `{1,2,4}`, and

```text
B_i = {i, i+1, i+2, i+4} mod 7.
```

## Literal-premise counterexample when center distinctness is unavailable

Take instead

```text
B_i = {i, i+1, i+2, i+3} mod 7.
```

These supports obey self-membership and exact pair coverage and are distinct,
but `|B_0 ∩ B_1| = 3`, so this regular tournament is not Paley.  If all
supports are allowed to have one common external geometric center, the
intersection implication for distinct centers is vacuous.  Therefore an
external-center formulation must separately supply pairwise distinctness of
the seven centers before the Paley conclusion is sound.

## Exhaustive cross-check

Run:

```bash
uv run python scratch/retained-omission-e1/round5-general-cegar/audit_seven_support_tournaments.py
```

The enumeration over all `2^21` labeled tournaments reports:

```text
all labeled tournaments: 2097152
regular labeled tournaments: 2640
qualified labeled tournaments: 240
distinct labeled Paley relabelings: 240
qualified minus Paley: 0
Paley minus qualified: 0
isomorphism classes among qualified: 1
```

The 240 labeled copies equal `7!/21`, consistent with the Paley tournament's
automorphism group of order 21.  Enumeration is only a regression check; the
hand classification above proves the result.
