# Second-cap / fresh-frontier incidence-coupling audit

Date: 2026-07-15

Status: **EXACT SYMBOLIC NEGATIVE FOR THE PHYSICAL REORIENTATION AND BOTH
LOCAL FRONTIER DIRECTIONS.  NOT A `CounterexampleData` OR K-A-PAIR
COUNTERMODEL; ALL-CENTER GLOBAL K4 REMAINS THE OMITTED PARENT LAYER.**

## Question

Can the already kernel-checked non-surplus packet reorientation, the physical
second-large-cap witness, and the freshly reconstructed swapped
`CriticalPairFrontier` force the missing strict-surplus row containing two
points of the original first-apex marginal (or an equivalent extra aggregate
marginal incidence)?

The answer is **no on the strongest currently available exact local/critical
surface**.  The pinned 35-point Euclidean regression realizes the physical
cap swap, both endpoint marginals, both opposite-apex double-deletion source
pairs, and a total critical-shell map, while every exact K4 class already
present at a strict point of the surplus cap avoids two points of either
marginal.

The regression still fails all-center global K4, including at three newly
added strict surplus-cap points.  It therefore identifies the first remaining
layer rather than refuting the live theorem.

## Bank and indexed-corpus preflight

Before deriving a new incidence statement, this lane checked all registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered opposite-apex fibers,
double-deletion survivor pairs, swapped-packet frontier reconstruction,
strict-cap selected rows, outside-pair uniqueness, and aggregate marginal
incidence.  The relevant current declarations remain:

```text
ATailCriticalPairFrontier.firstApex_marginal_inter_secondClass_card_le_one
ATailCriticalPairFrontier.exists_pair_double_deletion_survives_secondApex
ATailCriticalPairFrontier.exists_criticalPairFrontier
ATailCriticalPairFrontier.exists_criticalPairFrontier_of_K4
CapSelectedRowCounting.outsidePair_unique_capCenter
CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le
```

The sibling reorientation audit already kernel-checks:

```text
exists_completeNonSurplusSwap
exists_rightOriented_leaf_secondLargeCap
exists_freshCriticalPairFrontier_after_completeSwap
criticalPairFrontier_after_swap_physical_projection
no_same_pair_criticalPairFrontier_after_completeSwap
```

No banked declaration couples the freshly chosen swapped pair, its blockers,
or the second-large-cap cardinality to a selected row at a strict point of the
unchanged surplus cap.

## Exact physical role map

The 35-point model has MEC boundary `{O,A,C}` and physical cap cardinalities

```text
surplus cap = 8,
old oppCap1 = 11,
old oppCap2 = 19.
```

Both non-surplus caps are large.  Choose the physical old `oppCap1` (card 11)
as the second-large-cap witness and perform the nontrivial fixed-surplus swap.
The roles are then:

| role | before swap | after swap |
|---|---|---|
| first apex | `O` | `A` |
| second apex | `A` | `O` |
| surplus cap | same physical 8-point cap | unchanged |
| selected second cap | old `oppCap1` | new `oppCap2` |

This is the physical equality map from `CompleteNonSurplusSwap`, not an
assertion that the old numeric `Fin 3` index is definitionally unchanged.

## Both frontier directions coexist

The exact unit-radius endpoint classes are:

```text
at O: {A,C,D,E,J},   off-surplus marginal T_O = {C,D,E,J};
at A: {C,G,K,O},     off-surplus marginal T_A = {C,G,K}.
```

Their intersection is exactly `{C}`, as required by the two-apex escape
bound.  The old source pair can be chosen as `{E,D}`.  Deleting it leaves the
entire four-class `{C,G,K,O}` at old second apex `A`.  After the swap, the
fresh source pair can be chosen as `{G,K}`.  Deleting it leaves the five-class
`{A,C,D,E,J}` at the swapped second apex `O`.

Thus the exact metric model contains the local inputs used by both
applications of the production frontier constructor:

- two distinct off-surplus points on the relevant first-apex radius fiber;
- K4 after simultaneous deletion at the opposite apex;
- single-deletion survival as an immediate weakening;
- a total deletion-critical source/blocker assignment; and
- blockers separated from the relevant opposite apex.

The old pair cannot be transported as the fresh pair: `{E,D}` is not a
common-radius pair about `A`.  The fresh pair is genuinely different, in
agreement with the kernel theorem
`no_same_pair_criticalPairFrontier_after_completeSwap`.

Because the model does not instantiate `CounterexampleData.K4`, this report
calls these the **raw local frontier fields**, not a Lean term of type
`CriticalPairFrontier`.  The distinction is only at the omitted global-K4
parent layer; the metric and critical fields listed above are checked
directly.

## Exhaustive strict-surplus audit inside the exact model

The strict points of the physical surplus cap are

```text
{t1, t1_css_1, t1_css_2, t1_css_3, I, F}.
```

The checker enumerates the complete squared-distance profile at every one of
these centers.  The exact K4 split is:

```text
K4 present:  {t1, I, F};
K4 absent:   {t1_css_1, t1_css_2, t1_css_3}.
```

At each of the three centers where a K4 class exists:

```text
no K4 class contains two points of T_O = {C,D,E,J};
no K4 class contains two points of T_A = {C,G,K}.
```

This is stronger than checking only the old q-shell candidates `{F,I}` or one
previously selected row: it also checks `t1`, and at each covered center it
excludes **every possible** `SelectedFourClass`, for both endpoint marginals.
The three uncovered strict centers remain fail-closed.  The fixed carrier has
no K4 row there, so this model cannot say what the live global-K4 hypothesis
forces at those centers.

Consequently the fresh frontier does not force the old generic sink

```text
some strict-surplus z has a row containing two points of T_O,
```

and it does not even force the symmetric `T_A` version among the existing
strict rows.  It does not settle whether global K4 at the uncovered strict
centers supplies the extra aggregate incidence.

## Complementary all-center finite shadow

`SecondCapPairCountCountermodel.lean` checks the complementary boundary in
the Lean kernel.  It extends both card-12 pair-count shadows from
`generic-marginal-pair-count` with:

- one abstract four-row at every one of the twelve carrier centers;
- a second endpoint class and off-cap marginal of cardinality three;
- endpoint-marginal intersection of cardinality one;
- an old marginal pair disjoint from the second endpoint row;
- a genuinely fresh second-marginal pair disjoint from the first endpoint
  row; and
- exactly one hit from each endpoint marginal in every strict cap row.

The two arms are:

```text
card-four first arm:
  T_O = {6,7,8},  T_A = {6,9,10},
  old pair = {7,8}, fresh pair = {9,10};

card-five first arm:
  T_O = {6,7,8,9},  T_A = {9,10,11},
  old pair = {6,7}, fresh pair = {10,11}.
```

In both arms every strict row contains exactly one point of `T_O` and one
point of `T_A`.  Both aggregate sums equal the number of strict centers, so
neither marginal crosses the pigeonhole threshold.  The old and fresh pair
deletions preserve the opposite endpoint row at the finite-incidence level.

This finite shadow restores the **all-center selected-row incidence
projection** omitted by the exact Euclidean regression, but omits Euclidean
realizability, strict-convex/MEC geometry, and a critical-shell map.  It is not
a model of `HasNEquidistantProperty 4`.  Its exact conclusion is that adding a
second frontier does not repair the raw pair-count/aggregate argument.

Taken together, the two regressions leave a joint burden:

- the exact Euclidean/critical model shows that geometry, total CSS, both
  frontier directions, and local K4 do not suffice without global K4; while
- the kernel finite model shows that all-center row incidence, both frontier
  directions, and the complete ordered-cap pair ledger do not suffice without
  joint metric/critical realization.

Therefore the next theorem must exploit the **coupling** of global K4 with
the Euclidean/critical parent fields.  Neither layer in isolation forces the
missing extra incidence.

## Full-parent hypothesis ledger

The exact regression consumes or checks:

- simultaneous Euclidean realization of all named distance classes;
- 35 distinct points in one certified strict convex order;
- the unique non-obtuse/equilateral MEC boundary and physical cap placement;
- cap cardinalities `(8,11,19)` and no `IsM44` orientation;
- the robust old first-apex source pair and opposite-apex deletion survival;
- the physically swapped endpoint marginal and a fresh source pair with the
  reverse opposite-apex deletion survival;
- a total `CriticalShellSystem` shadow with exact deletion-critical
  four-shells at every source; and
- exact K4 classes at both endpoint apices and at strict centers `t1,I,F`.

The only live parent field omitted by the pinned 35-point regression is:

```text
all-center HasNEquidistantProperty 4.
```

The missing K4 centers include the three strict points
`t1_css_1,t1_css_2,t1_css_3`, as well as other carrier points.  Therefore a
successful uniform producer must visibly use global K4 at an uncovered strict
center or a continuation through other missing global rows, then feed that
metric/critical information into one endpoint marginal.  Reorientation,
fresh-frontier existence, second-cap cardinality, and another local endpoint
count are not enough by themselves.

## Closure consequence

This closes the proposed **symmetry-only** route, not K-A-PAIR.  The second
cap removes index adjudication and supplies a genuinely fresh frontier, but
the fresh choice is uncoupled from the old marginal and can coexist with
marginal-pair avoidance in every strict K4 class already present.

The honest next producer target is therefore an all-center continuation
statement, for example one of:

1. a theorem applying global K4 at an uncovered strict center and forcing its
   row to hit an endpoint marginal twice;
2. a monotone cap-order continuation whose termination yields such an
   incidence; or
3. a global critical-map collision already consumed by a banked terminal.

Any candidate proof that mentions only the second-large-cap witness, the
physical swap, and existence of the fresh frontier is refuted by this
regression surface.

## Replay and trust boundary

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/second-cap-incidence-coupling/check.py --check
```

The checker pins the source verifier by SHA-256, replays its exact
strict-convex/MEC/cap/no-`IsM44`/total-CSS gates, and then enumerates all
endpoint and strict-surplus radius profiles.

Trust boundary:

```text
EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL
```

No production file, shared closure document, `SurplusM44` file, or unique-row
artifact was edited.  No production target build or publication gate was
run.

The complementary Lean shadow was checked as a deliberate isolated
single-file validation after compiling its scratch dependency to `/tmp`:

```bash
env LEAN_PATH=/tmp/p97-second-cap-incidence lake env lean -M 16384 \
  -R ../scratch/atail-force/second-cap-incidence-coupling \
  ../scratch/atail-force/second-cap-incidence-coupling/SecondCapPairCountCountermodel.lean
```

All five printed declarations have axiom closure contained in:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, declared axiom, `admit`, or `native_decide` dependency.
