# Conditional `c1 = surplus apex` hard-source-swap diagnostic v1

## Claim boundary

This is a conditional diagnostic named-role quotient. It is **not** a complete
census of the live branch-4 or branch-3 source. It does not prove the rank-3
Lean target, close either continuation branch, establish Euclidean
realizability, or supply a promotion artifact. The Python module is
solver-free: it only constructs deterministic cells and exact replay objects.

`ZeroCutBoundaryIndexing` orders the three triangle separators `U,O,c2`, where
`U` is the surplus apex. The live `c1` is a critical blocker; the current
source neither identifies `c1 = U` nor places `c1` in a fixed separator slot.
The v1 profile collapses `U` onto `c1`. Every count, quotient, and zero form in
this document is restricted to that unproved subcase.

The first executable profile is
`firstCenter_not_mem_secondRow` (branch 4). The second profile is
`robustCenter_not_mem_secondRow` (branch 3). Branches 1 and 2 are outside this
specification.

## Named roles and source rows

The collapsed branch-4 profile has fourteen distinct role symbols:

```text
collapsed separators: O, c1(standing for U), c2
canonical source roles: a, d, e
first-apex extras: p, q
middle-row extras: s, t
old c2 interior hits: u, v
replacement c2 interior hits: x, y
```

Its proposed circle classes are encoded as exact distance equalities:

```text
T0 at O:   {a,d,c1,p,q}
K1 at c1:  {O,a,s,t}
K2 at c2:  {O,a,u,v}
L  at c2:  {d,e,x,y}
```

The source chain for `T0` is
`R.class_card_eq_five` plus `N.firstApexClass_support_eq`, followed by an
unproved identification of the five abstract role names with that class. It is
not a field of the normal form. The middle row comes from `N.blockerClass`;
there is no `firstBlockerClass` field.

The derived rows `K0 = T0 \ {d}` and `Orow = T0 \ {a}` add no new distance
equalities and are retained as source metadata rather than duplicated atoms.
The branch-4 metadata also records `c1 ∉ K2`, `c1 ∉ L`, full and
disjoint `K2,L`, positive distinct radii, and all named-role distinctness.
The radius condition is replayed exactly as
`d(c2,O) ≠ d(c2,d)`.

Branch 3 records `O ∉ K2`. It therefore uses a fresh role `w` and the old
row `K2 = {a,u,v,w}`. Only `a,d ∈ oppInterior1` is fixed for that profile;
the current source does not identify its other row points with the branch-4
adjacent-cap grid. This weaker profile prevents an accidental assumption of the
missing `O` incidence.
Its radius condition is `d(c2,a) ≠ d(c2,d)`.

## Unproved abstraction assumptions

The current Lean source does not prove the conditional role ingress used by
this quotient. The descriptor marks each of the following with
`enforced: false`:

- `c1 = U`, where `U` is the surplus apex separator;
- the displayed named support identities, including the choice of `e,x,y` as
  the non-`d` members of the replacement row;
- `e ∈ surplusInterior` and `x,y ∈ oppInterior2` in branch 4;
- the branch-4 candidate omission `c1 ∉ L`;
- pairwise distinctness of the carrier points denoted by all remaining role
  symbols after collapsing `U` onto `c1`;
- the discrete cross-row alias partition: differently named extras never
  denote the same carrier point; and
- fullness of `K2` and `L` as selected classes rather than four-point subsets.

The Python cell validator checks that role *symbols* are unique and that they
occupy their declared abstract blocks. It does not prove the corresponding
point inequalities or Lean membership facts. The current linear constraints
and model replay enforce row equalities, positive abstract distances, both
Kalmanson signs, and the `K2/L` radius disequality. They do not enforce support
omissions or full-class claims. Any future UNSAT verdict from this surface is
therefore conditional on every assumption above.

The absent live cases include `c1 ≠ U` at every cyclic position, other
source-allowed equality cases for `c1`, and every cross-row alias partition in
which differently named extras denote the same carrier point. The live source
role `U` does not occur separately in the v1 cell schema.

## Direct/mirror order cells

The boundary is rotated to start at `O`. The genuine zero-cut separators are
`U,O,c2`. Only after the conditional substitution `U := c1` do the two profile
orientations become:

```text
direct: O, I2, c2, Is, c1, I1
mirror: O, I1, c1, Is, c2, I2
```

For branch 4 the fixed memberships are:

```text
I1 = oppInterior1 contains a,d
Is = surplusInterior contains e
I2 = oppInterior2 contains u,v,x,y
```

The roles `p,q,s,t` have no claimed cap location at this layer. The generator
places each in all three blocks and permutes every block, lazily and in a
stable order. Branch 3 similarly enumerates every unresolved placement rather
than importing the branch-4 grid.

The resulting conditional raw labeled universes contain 1,647,360 branch-4
cells and 14,529,715,200 branch-3 cells, counting direct and mirror
orientations. These are not live-branch coverage counts. The generator never
materializes either universe.

The first conditional-profile quotient is implemented for branch 4. It chooses
a stable representative under the independent row-internal swaps `(p q)`,
`(s t)`, `(u v)`, and `(x y)`. The action has orbit size sixteen, leaving
exactly 102,960 cells in the collapsed subcase. The API is lazy and computes no
Kalmanson constraints while selecting representatives. Its SHA-256 quotient
key includes the conditional symmetry schema and canonical cell payload.

Deduplication by the complete row-reduced constraint signature is not yet
implemented: forming thousands of constraints for every raw cell would defeat
the launch gate. A later pass must derive that signature directly from the
order and equality-class representatives. The branch-3 wave should not launch
until additional source cap placements make its surface smaller.

The role-to-block ingress is an explicitly documented unproved abstraction
assumption. `ZeroCutBoundaryIndexing.exists_with_capBlocks` supplies the generic
direct/mirror block universe for `U,O,c2`; it does not authorize replacing `U`
with `c1`. Consequently an exhaustive result for these cells says nothing
about omitted `c1` placements or alias partitions.

## Conditional zero-form regression

The collapsed separator placement forces an immediate row-reduced zero strict
form in every current branch-4 cell:

```text
direct: complementary Kalmanson on (O,c2,c1,a)
mirror: main Kalmanson on (O,a,c1,c2)

d(O,c1) - d(O,c2) - d(a,c1) + d(a,c2) = 0
```

The `T0`, `K1`, and `K2` row equalities cancel this form exactly. A pure
regression checks both orientations. This diagnoses the conditional collapse;
it is not a contradiction for the live branch because the source has not
placed `c1` at the `U` separator.

## Exact linear system

Every undirected distance is a symbol `d(X,Y)`. A signed form is a canonical
sorted map from distance symbols to `Fraction` coefficients.

Each circle row chooses its first support point as reference and emits
`d(center, point) - d(center, reference) = 0` for every other support point.
For every increasing boundary quadruple `i,j,k,l`, the cell emits both strict
forms:

```text
d(i,k) + d(j,l) - d(j,k) - d(i,l) > 0
d(i,k) + d(j,l) - d(i,j) - d(k,l) > 0
```

These are the directions supplied by
`dist_add_dist_lt_diagonal_sum_of_ccw` and
`complementary_dist_add_dist_lt_diagonal_sum_of_ccw`. All distance values must
be positive. Row equalities have a deterministic union-find reduction, but the
unreduced exact forms remain available for certificate replay.

The existing exact-12 helpers were audited before this scaffold was written.
Their order universes, structural signatures, and quotient cells bind different
fixed roles and cardinalities, so importing them would weaken this source map.
This module instead follows their deterministic canonical-JSON, exact-rational
replay, and immutable-cell patterns while keeping a separate v1 schema.

## Replay hooks and controls

Model replay parses rational values exactly, checks positivity, replays every
row equality, and checks every strict form. It does not accept floating-point
tolerances.

Core replay accepts rational weights. Strict constraints must have
nonnegative weights, at least one strict weight must be positive, equality
weights may have either sign, and the weighted sum must cancel coefficient by
coefficient.

The pure tests include:

- a rational four-point metric satisfying both Kalmanson signs;
- the reversed-sign negative control;
- a known inconsistent system in which two equalities cancel one strict form;
- deterministic direct/mirror generation and row-closure checks.

No SAT, SMT, LP, PiQD, or external solver is invoked by this version.

## Excluded layers

The following are intentionally absent:

- planar coordinates, Euclidean distance-matrix rank, Cayley-Menger, and
  orientation constraints;
- minimum-enclosing-circle and cap-realizability constraints;
- `CriticalShellSystem` blocker, minimality, deletion-survival, and no-qfree
  constraints;
- solver invocation, timeout policy, model custody, core minimization, and
  proof-certificate capture;
- a Lean ingress/coverage theorem or a named source-clean terminal consumer.

A later solver wave may add these only under a new governed run manifest. It
must first introduce `U` separately, enumerate or prove the position of `c1`,
and cover source-allowed cross-row alias partitions. No verdict on the current
collapsed cells may be described as live branch-4 coverage.
