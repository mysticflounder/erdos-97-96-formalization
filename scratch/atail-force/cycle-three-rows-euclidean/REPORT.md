# Complete period-three all-reverse Euclidean realizability search

Date: 2026-07-17

Status: **BOUNDED NUMERIC `UNKNOWN_NO_HIT`; NOT UNSAT, NOT COVERAGE, AND NO
PRODUCTION `sorry` IS CLOSED.**

This lane tests the actual Euclidean local surface consisting of the complete
period-three all-reverse source/blocker cycle and all three exact `2 + 2`
blocker rows.  It found no numerical realization in the stated boxes and
budgets.  The negative result is only a bounded witness-search outcome.

## Theorem-bank preflight

Before encoding the search, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered the physical omission cycle, all-reverse
membership, same-cap `2 + 2` rows, blocker bisectors, outside-pair terminals,
strict convexity, and MEC/cap geometry.  The nearest reusable declarations are
the current exact-five reverse-row reductions and the existing common-outside-
pair/U5 consumers.  None decides the simultaneous Euclidean realizability
question tested here, so no theorem was rederived or imported.

## Faithful target-union split

The actual packet gives two facts that the first six-distinct draft did not
fully reflect:

1. each outside pair has cardinality two; and
2. the three unordered outside pairs are distinct, but pairs from different
   rows may share one target.

Consequently the union of the three pairs can have cardinality 3, 4, 5, or 6.
The suite covers every abstract graph type:

| union size | pair graph | labeled runs |
|---:|---|---:|
| 3 | triangle | 1 |
| 4 | path | 3 choices of middle row |
| 4 | star | 1 |
| 5 | one shared vertex plus a disjoint edge | 3 choices of disjoint row |
| 6 | three disjoint pairs | focused and broad boxes |

For a shared target of two adjacent rows, the two blocker circles already
share their common cap source.  Their only other intersection is obtained by
reflecting that source across the line of blocker centers.  The size-3, size-4
path, and size-5 scripts use this forced second intersection, so their shared-
target equalities hold by construction.

The size-4 star has one target shared by all three rows.  It uses a stronger
exact-equality parameterization: after choosing that target and the three
physical sources, each blocker is the intersection of the source-pair
perpendicular bisector and the source/shared-target perpendicular bisector.
Each row's remaining target is then parameterized on that exact blocker
circle.  Thus this branch does not replace the triple incidence with a soft
solver equality.

## Encoded ledger

Every candidate gate includes:

- `o = (0,0)`, `left = (1,0)`, with `right,q0,q1,q2` co-radial from `o`;
- ordered physical sources between the endpoint angles and an apex angle at
  most `pi/2`, giving the nonobtuse isosceles Moser triangle;
- all three blockers on the exact perpendicular bisectors of their two named
  cap sources;
- every target on the exact radius circle of every row in whose outside pair
  it occurs;
- all named nonmembers excluded from the physical radius class and from each
  row radius class;
- each row outside pair of cardinality two, the three unordered pairs
  distinct, and the target-union graph specified by the branch;
- pairwise point distinctions;
- strict convexity of all named points in the dynamically detected cyclic
  order;
- the blockers and physical sources strictly on the cap side of the endpoint
  chord, and all row targets on the opposite side;
- containment of every point in the exact circumdisk of
  `(o,left,right)`; and
- exact substitution of every parameterized row equality to a `1e-9`
  floating-point audit gate before a hit can be reported.

The trigonometric and circle formulas impose the mathematical equalities by
parameterization; floating-point substitution checks the implementation.  Had
a hit survived, the next gate would have been rational tangent reconstruction
and an independent exact `Fraction` replay.  No hit reached that gate.

The local search omits the total global `CriticalShellSystem`, K4 at every
source, deletion-survival/minimality fields, `noM44`, and the rest of the
retained parent frontier.  Therefore a SAT hit would only be a local
countermodel, while no-hit cannot prove the full parent false.

## Bounded results

All final runs returned `UNKNOWN_NO_HIT`:

| union/cardinality branch | budget | best minimum margin |
|---|---:|---:|
| 3, triangle | `600 x popsize 28`, 12 workers | `-2.214540207882745e-2` |
| 4, path pivot 0 | `500 x popsize 28`, 12 workers | `-2.057188854960131e-2` |
| 4, path pivot 1 | `500 x popsize 28`, 12 workers | `-1.870481000160046e-2` |
| 4, path pivot 2 | `500 x popsize 28`, 12 workers | `-7.298086679912328e-3` |
| 4, star | `1000 x popsize 36`, 12 workers | `-3.250529240497577e-2` |
| 5, disjoint-row pivot 0 | `500 x popsize 28`, 12 workers | `-7.279775141329101e-3` |
| 5, disjoint-row pivot 1 | `500 x popsize 28`, 12 workers | `-4.499997292205975e-3` |
| 5, disjoint-row pivot 2 | `500 x popsize 28`, 12 workers | `-1.584973704615783e-2` |
| 6, focused | `700 x popsize 32`, 12 workers | `-4.423783391280808e-3` |
| 6, broad | `1000 x popsize 48`, 12 workers | `-4.086728591161285e-5` |

The broad one-target-per-row precursor also remained negative at
`-3.084769137440815e-5`.  Several best candidates approach degeneracies such
as nearly adjacent physical sources or nearly coincident same-row targets.
The signed margins combine differently scaled area and squared-distance
constraints, so their magnitudes are search diagnostics only.  They are not
distances to the feasible set and supply no infeasibility evidence.

The exact per-run record is `CHECKPOINT.json`.

## Restart commands

Six distinct targets, broad box:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-euclidean/search_cycle_three_rows.py \
  --stage full --box-profile broad --maxiter 1000 --popsize 48 \
  --workers 12 --seed 20260801
```

Three-target triangle:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-euclidean/search_three_target_cycle.py \
  --maxiter 600 --popsize 28 --workers 12 --seed 20260720
```

Four-target path (repeat `--pivot 0,1,2` with checkpointed seeds):

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-euclidean/search_partial_overlap.py \
  --schema four-path --pivot 0 --maxiter 500 --popsize 28 \
  --workers 12 --seed 20260723
```

Four-target star:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-euclidean/search_four_target_star.py \
  --maxiter 1000 --popsize 36 --workers 12 --seed 20260802
```

Five-target one-overlap (repeat `--pivot 0,1,2` with checkpointed seeds):

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-euclidean/search_partial_overlap.py \
  --schema five-one-overlap --pivot 0 --maxiter 500 --popsize 28 \
  --workers 12 --seed 20260726
```

## Correct conclusion

No local SAT witness was found after a serious bounded search over every
outside-pair overlap type.  This makes the complete three-row period-three
surface a better candidate for an exact geometric theorem than the already-
refuted one-row surfaces, but it does **not** prove such a theorem.  The next
decisive step would be interval/CAD or an exact semialgebraic reduction on a
fixed cyclic order, not another unbounded numerical run.

No Lean/Lake build was run.  No production source, plan document, blueprint,
`ShellCurvature`, `surplusM44`, card-five, or protected 555/654 file was
modified.
