# Non-equilateral geometry consumer

## Status

This lane does **not** prove `False`.  It kernel-checks the strongest terminal
that follows from the current native non-equilateral packet together with the
genuine second-large-cap/MEC data, and it isolates a precise missing producer.

The result is choice-order compatible with the existential parent surface.
Operationally, the parent stores one tuple

```text
(second large cap, K4 radius, frontier, continuation, late critical system)
```

and its routed branch proof, so a proof implementation can close only that
stored branch.  This is proof-construction ergonomics, not a logical
weakening: with the existing nonempty choices and a stored branch proof, the
routed eliminator is propositionally equivalent to `False`.  Selection alone
adds no mathematical force.  Nothing in this report claims that every
frontier reaches the non-equilateral branch, or that both non-equilateral
residual arms must be developed as uniform callbacks.  The new terminal is a
diagnostic and a consumer boundary for a stored tuple that actually routes
non-equilateral.

Epistemic status:

- the Lean reductions in `NonEquilateralGeometryConsumer.lean` are **PROVEN**;
- the finite model in `IncidenceCountermodel.lean` is **EXACT WITHIN ITS
  FINITE INCIDENCE ABSTRACTION**;
- the rational cap-profile regression is **EXACT FOR ITS EXPLICIT EUCLIDEAN
  CONFIGURATION**;
- neither regression is a full `CounterexampleData` model, so neither refutes
  a theorem that genuinely consumes additional MEC/global-K4 geometry.

## Kernel-checked geometric terminal

`NonEquilateralGeometryConsumer.lean` proves the following main declarations.

### 1. The genuine second-large-cap datum reaches the exact leaf

`oppositeLargeCapLocation_of_leaf_noM44` proves, for the actual leaf packet
`S`,

```lean
5 <= S.oppCap1.card ∨ 5 <= S.oppCap2.card
```

It consumes the MEC circumscribed-triangle cap lower bounds and `hNoM44`.
Thus the second-large-cap witness is no longer merely carried alongside the
native continuation packet: its exact cardinality consequence is present at
the terminal.

This consequence alone is only a disjunction of cap locations.  It does not
specify an additional member of either native row.

### 2. The exclusive strict arm has genuine metric content

`surplusHeavy_or_strictWitnessMetricHinge` refines the existing support split
to

```text
one native row has at least two surplus-cap points
or
there are exclusive strict-oppCap1 witnesses x and y forming metric hinges.
```

In the strict arm, with continuation centers `z1,z2`, the checked equalities
and inequalities are

```text
dist x z1 = dist z1 z2,    dist x z2 != dist z1 z2,
dist y z2 = dist z1 z2,    dist y z1 != dist z1 z2.
```

The equalities come from the native row radii.  The cross inequalities use
`firstCap_center_separates_secondApex_pair`, so they genuinely consume the
ordered-cap/MEC geometry rather than only finite support counting.

### 3. The late critical expansion and cap datum coexist

`NonEquilateralGeometryTerminal` contains, for the same native output:

- the exact opposite-large-cap disjunction;
- `NonEquilateralNativeCriticalExpansion` at the late favorable critical
  system; and
- the surplus-heavy/strict-metric-hinge split.

`nonempty_nonEquilateralGeometryTerminal` constructs this packet.

The same file also makes the strict-arm deficit executable:
`StrictWitnessBankCompletion` contains exactly a common native point `f`, two
`f`-centered reverse equalities, and one `y`-centered reverse equality.
`u1TwoLargeCapHypotheses_of_strictWitnessBankCompletion` kernel-proves that
these fields, together with the native rows, instantiate all seven metric
equalities and the inequality of the sibling obstruction.

### 4. Only the realized routed branch is retained

`fullParent_nonEquilateralGeometryTerminal` chooses one continuation and one
late critical system for a supplied frontier.  Its output is exactly one of

```text
cross survival
or non-equilateral with NonEquilateralGeometryTerminal
or equilateral residual.
```

The theorem uses global K4 plus no-removability to obtain the late critical
system.  It does not replace the outer existential packaging already
kernel-checked by
`critical-system-rebase/ExistentialParentSurface.lean`; it is the
non-equilateral refinement to use after a tuple and its actual branch have
been stored.  Neither the existential surface nor this branch packaging is a
strictly weaker hypothesis than closure: the stored branch eliminator is an
operational normal form for `False`.

## Nearest bank theorem and the exact deficit

The required theorem-bank registries and indexed Lean corpora were checked
before introducing a new terminal:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered the non-equilateral support split, two
large caps, common deletion, reciprocal critical incidence, cap rows, and MEC
ordering.  The nearest contradiction consumer remains the unimported sibling
declaration

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
```

whose metric shape is

```text
row c contains a,d,f at one radius;
row d contains c,e,f at one radius;
row f contains a,d,e at one radius;
row e contains a,c at one radius;
a != c.
```

For a strict terminal, the natural substitution is

```text
a = x, c = z1, d = z2, e = y.
```

The native rows and the metric hinge already supply `a != c`, the `c`-row
equality between `a,d`, and the `d`-row equality between `c,e`.  What is not
supplied is:

1. a common native support point `f` in both the `z1` and `z2` rows;
2. a row centered at `f` putting `x,z2,y` on one radius; and
3. a row centered at `y` putting `x,z1` on one radius.

Global K4 gives some four-point row at every center, but it does not prescribe
members of that row.  Prescribed deletion criticality has the opposite
direction: saying that source `x` is critical at `z1` identifies a row
**centered at `z1` that contains `x`**.  It does not imply that a row centered
at `x` contains `z1`, nor any of the other reverse incidences above.  No
indexed bank theorem reverses this implication.

Consequently, the honest strict-arm target for an actually stored tuple is
`Nonempty (StrictWitnessBankCompletion T)`, or a direct contradiction using
equally strong Euclidean input.  The checked adapter shows that this producer
is sufficient modulo mechanically importing the already source-proved sibling
consumer.  It should visibly consume geometry beyond the current
incidence/critical-map interface.

The surplus-heavy arm has a different exact deficit.  It supplies at least
two surplus-cap points on one native row while the leaf supplies a genuine
large opposite cap, but no current theorem couples those facts into a forced
selected-row member or a metric contradiction.  A producer for this arm must
use the placement/order of the second cap, not cardinality alone.

Again, these are branch-conditional residuals.  Constructing a tuple whose
stored proof routes to a separately closable branch could organize a proof
without invoking them, but the current existential surface does not prove
that such a choice exists and selection itself supplies no extra force.

## Kernel-checked incidence regression

`IncidenceCountermodel.lean` gives a twelve-label finite incidence shadow.  It
has all of the following simultaneously:

- a closed-cap profile `(5,5,5)`, including a genuine second large cap and
  failure of the `(m,4,4)` profile;
- a four-point row at every center, with center omission and pairwise
  distinct-row intersection at most two;
- a total source-to-critical-center map, source containment, nonfixed
  blockers, support locking under a common blocker, and three surviving shell
  points after prescribed deletion;
- the native mutual two-center rows, exact `(2,2)` `oppCap2` profiles,
  disjoint native supports, and six native sources outside the apex critical
  support;
- exclusive strict witnesses whose prescribed blockers are exactly `z1` and
  `z2`; and
- failure of all four reverse incidences from the globally selected rows at
  those strict witnesses.

The model additionally proves
`no_fivePointBankIncidence_at_native_centers`: no labels instantiate even the
incidence shadow of `u1TwoLargeCapObstruction` with the two native centers.

This is decisive only for the represented abstraction.  It proves that
all-center row existence, row intersection bounds, and a total prescribed
critical map do not logically manufacture the missing reverse incidences.
It does **not** encode Euclidean distances, strict convexity, MEC promotion,
or the complete global K4 condition, and is therefore not a counterexample to
a geometric completion theorem using those hypotheses.

## Exact Euclidean regression

The existing rational regression was rerun:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/non-equilateral-parent-producer/verify_cap_profile_regression.py
```

It passes both the exact eleven-point local row check and the exact structural
`(5,5,4)` cap-profile check.  These coexist in one coordinate set, but they do
not form a native continuation packet: row centers `z1,z2` are `oppCap2`
endpoints, while strict `oppCap2` is `{kL,kR}`.  The zero overlap and
set-theoretic surplus-heavy second row therefore guard only deductions which
ignore native strict-center placement.  This is not a full global critical-
system/MEC/no-removability model or a Euclidean realization of either native
branch.

The finite incidence model and the Euclidean cap regression are complementary
regression gates.  They are not jointly one model and must not be presented as
such.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean \
  -R ../scratch/atail-force/non-equilateral-geometry-consumer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/NonEquilateralGeometryConsumer.olean \
  ../scratch/atail-force/non-equilateral-geometry-consumer/NonEquilateralGeometryConsumer.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean \
  -R ../scratch/atail-force/non-equilateral-geometry-consumer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/NonEquilateralGeometryIncidenceCountermodel.olean \
  ../scratch/atail-force/non-equilateral-geometry-consumer/IncidenceCountermodel.lean
```

Both direct checks succeed.  Every printed declaration depends only on the
expected core axioms among

```text
[propext, Classical.choice, Quot.sound]
```

and none depends on `sorryAx`.

## Recommended next move

Instantiate the existing nonempty choices at the existential parent surface
and inspect the stored routed branch.  This is an organizational step, not a
logical strengthening.  If that branch is non-equilateral:

- in the strict arm, target
  `Nonempty (StrictWitnessBankCompletion T)` under
  `a=x, c=z1, d=z2, e=y`, rather than another support-count lemma;
- in the surplus-heavy arm, target a geometric second-cap/selected-row
  coupling that produces a forced point or distance equality.

Any candidate must pass the finite incidence regression by visibly using
extra Euclidean/MEC data.  There is no basis here for another round of
incidence-only mining or for a universal theorem over all frontiers.
