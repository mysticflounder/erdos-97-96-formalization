# Q-arm circle-power rank audit

## Scope and result

This is a source-only audit for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
No production Lean file was edited and no Lean/Lake build was run.

The normalized Q arms do **not** currently force any of the requested rank
contradictions on their named circle/point surface:

| arm | corrected 5x5 hit | 4x4 row-difference hit | largest named fooling set |
|---|---:|---:|---:|
| paired common deletion | 0 | 0 | 3 |
| reverse-hit/fresh deletion | 0 | 0 | 2 |

The paired arm does force a useful but noncontradictory rank lower bound: a
certified nonsingular 3x3 power minor.  The fresh arm forces only a 2x2 minor.
The planar upper bound is rank 4, so neither closes the core.

The exhaustive named-pattern calculation is in
`audit_power_patterns.py`.  It uses three values throughout:

* `Z`: proved zero power;
* `N`: proved nonzero power;
* `U`: unknown, and therefore present in the possible-support graph.

Run it with:

```bash
uv run python \
  scratch/retained-omission-e1/power-rank-q-arms/audit_power_patterns.py
```

This audit is exhaustive for the named Q surface recorded below.  It does not
claim to have enumerated arbitrary witnesses chosen from the two opaque first
row supports or the existential rich-apex classes.

## Already-banked determinant theorem

`P97/Census554/CirclePowerMatrix.lean` already contains the required sound
linear-algebra bank:

* `powerMatrix_rank_le_four` (line 114);
* `powerMatrix_det_fin_five` (line 124);
* `PermutationPossible` (line 143), where every entry not forced zero remains
  possible;
* `PermutationCertifiedNonzero` (line 148);
* `det_ne_zero_of_unique_possible_matching` (line 158);
* `false_of_powerMatrix_unique_possible_matching` (line 194).

Thus no new 5x5 determinant theorem is needed.  The module is not presently
imported by the ATAIL frontier closure tree, so a future successful producer
would also need an import/wrapper step.  No analogous banked theorem for the
rank-at-most-three row-difference matrix or the rank-four fooling-set bound was
found in the inspected Lean sources.

The one required `nthdegree docs search --lean --agentic` query returned no
usable declaration.  The live source search above is the positive bank hit.

## What the Q normalization actually gives

Write:

* `k = O.kept`, `d = O.deleted`, and, in the fresh arm, `f = fresh`;
* `a = S.oppApex1`;
* `bk = H.centerAt k`, `bd = H.centerAt d`;
* `K` for the full critical shell selected at source `k`;
* `D` for the full critical shell selected at source `d`;
* `F` for the full frontier class centered at `a` and containing `k,d`;
* `A1,A2` for the ambient circles underlying the two packet first rows,
  both centered at `a`.

The normalizers are

```text
firstRow_support_eq_criticalShell_of_center_eq
secondRow_support_eq_criticalShell_of_center_eq
```

at `ATail/PhysicalSecondApexCommonDeletion.lean:82,97`.  In the actual Q
constructors only the second theorem applies by reflexivity:

* `O.packet.B2 = K`;
* paired arm: `reversePacket.B2 = D`;
* fresh arm: `freshPacket.B2 = D`.

The first rows have center `a`, not a supplied equality
`a = H.centerAt source`.  Therefore `A1` and `A2` remain chosen four-subsets
of their ambient apex circles.  A point outside `B1` is **not** certified off
that circle.  This is the load-bearing reason unknown entries cannot be
turned into nonzeros.

## Strongest sound named matrices

### Paired arm

Columns are `k,d,a,bk,bd`:

| row | k | d | a | bk | bd |
|---|---:|---:|---:|---:|---:|
| K  | Z | N | U | N | U |
| D  | N | Z | U | U | N |
| F  | Z | Z | N | U | U |
| A1 | U | U | N | U | U |
| A2 | U | U | N | U | U |

The `K,D,F` by `k,d,a` minor has the unique possible matching

```text
K -> d, D -> k, F -> a,
```

and all three entries are certified nonzero.  Hence it has rank 3.  It is not
a contradiction.

### Fresh arm

Columns are `k,d,f,a,bk,bd`:

| row | k | d | f | a | bk | bd |
|---|---:|---:|---:|---:|---:|---:|
| K  | Z | N | U | U | N | U |
| D  | Z | Z | N | U | U | N |
| F  | Z | Z | U | N | U | U |
| A1 | U | U | U | N | U | U |
| A2 | U | U | U | N | U | U |

Here `D(k)=0` is the reverse-hit fact and `D(f) != 0` is the fresh omission.
The best corrected unique-matching minor has size 2.

Every `N` at a row's own center uses positivity of that row's radius.  Every
other `N` above comes from an explicit full-shell nonmembership.  No complement
of a first-row `B1` was used.

## Why each proposed obstruction stops

### 5x5 unique possible matching

For both arms the certified-nonzero neighborhoods of the three apex-centered
rows are

```text
N(F) = N(A1) = N(A2) = {a}.
```

They fail Hall before uniqueness is considered.  Any 5x5 producer on this
surface must first prove at least two new nonzero entries from these three rows
to two distinct non-`a` columns.  For an `A1` or `A2` row this must be a genuine
ambient off-circle fact such as

```lean
z ∉ SelectedClass D.A S.oppApex1 packet.row₁.radius
```

(equivalently, the associated power is nonzero), not merely
`z ∉ packet.B₁`.

The script also computes one minimum completion of the present matrix.  For
the paired arm one such completion adds

```text
N: A1(d), A2(k)
Z: A1(bd), A1(bk), A1(k), A2(bd), F(bd), F(bk), K(bd).
```

For the fresh arm one minimum completion adds

```text
N: A1(d), A2(k)
Z: A1(bk), A1(k), D(a), D(bk), F(bk).
```

These lists are concrete sufficient targets, not claims that these particular
incidences follow from Q.  The invariant necessary defect is the need for two
new distinct certified-nonzero neighbors among `F,A1,A2`.

### Row-difference rank at most three

For `(Ci-C0)(z)`, the sound three-valued reduction is:

* `Z` only when both circle powers at `z` are proved zero;
* `N` when exactly one is proved zero and the other proved nonzero;
* `U` in every other case, including two individually nonzero powers.

The paired surface has a largest certified nonsingular difference minor of
size 2; the fresh surface has size 1.  No 4x4 determinant is forced.

A precise sufficient producer would supply four difference rows and four
columns whose matching entries lie on exactly one of the row circle and base
circle, while every competing permutation contains a column proved to lie on
both corresponding circles.  The Q data supplies only the paired 2x2 seed
against base `F`; it lacks two further exactly-one incidences and the common
memberships needed to kill all alternative permutations.

Same-center row subtraction does not rescue this: `A1`, `A2`, and `F` share
center `a`, but Q proves neither equality nor inequality of their radii.  Their
row differences are constants whose zero/nonzero status remains unknown.

### Fooling sets and minrank

A rank-four fooling-set contradiction needs more than 16 paired rows/columns:
diagonal powers nonzero and, for every unordered pair, at least one directed
cross power zero.  Q names only two normalized full critical shells, and the
largest fooling patterns on the named surface have sizes 3 and 2.  Richness in
`TriApexAllLargeContext` is existential and supplies no 17-circle directed
cross-incidence family.

## First missing producer

The first missing producer is therefore **ambient apex-row
nonmembership/radius separation**, followed by positive cross-membership.  In
the smallest useful form it should state that two of the three apex-centered
circles `F,A1,A2` have certified nonzero power at two distinct named non-apex
columns.  A complete rank certificate then additionally needs enough genuine
circle memberships to eliminate every alternative perfect matching.

Without that producer, the normalized full critical rows improve the Q surface
from an unsafe subset abstraction to sound rank-3/rank-2 lower bounds, but do
not exceed either planar rank ceiling.
