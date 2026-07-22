# Exact-five card-13 distinct-cross terminal audit — 2026-07-21

## Result

**No terminal was proved.  No source `sorry` is closed by this lane.**

The exact-card-13 distinct-radius reduction is useful but not terminal.  It
forces the two outside points of an asymmetric physical row to use opposite
complete first-apex classes.  The resulting local packet is exactly
satisfiable in the full rational triangle plus strict-Kalmanson abstraction.
Therefore no proof using only the displayed incidences, cap order, triangle
inequalities, and linear Kalmanson inequalities can close this arm.

The broad full-parent finite gate remains **UNKNOWN under the recorded
budgets**.  Its observed rejections are generic selected-row ordinal cycles;
none of the extracted cores uses the distinct cross-class conclusion.

The first missing input must therefore use information absent from the local
linear metric packet: rank-two Euclidean/MEC geometry, or a positive
source-indexed occurrence forced by the total critical system/global cover.

## Checked source reductions

The input scratch module

```text
../exact5-first-apex-card13-parent-row-coupling/
  ExactFiveFirstApexCard13ParentRowCoupling.lean
```

already kernel-checks the two reductions owned by this audit:

```lean
parentFirstRow_eq_doubleRow_of_distinctRadius

SourceTwoHitNormalForm
  .outsidePair_crosses_parentFirstRow_of_distinctRadius
```

On the distinct-radius arm at card 13 they imply:

1. the retained and double-deletion first-apex classes are disjoint exact
   four-classes;
2. their strict first-cap pairs partition all four strict first-cap points;
3. the actual q-deleted parent first row is exactly the double class; and
4. if both outside points of the asymmetric row stay in that strict cap,
   one belongs to each first-apex class.

The theorem-bank registry and indexed Lean corpus were checked before this
audit.  The nearest existing terminals are:

```lean
SourceTwoHitNormalForm.false_of_firstApex_coRadial
CapSelectedRowCounting.outsidePair_unique_capCenter
false_of_criticalFiberClosingCore
```

The cross-color split supplies none of their missing positive occurrences.

## Exact local rational witness

`enumerate_local_lra.py` found the following card-13 cyclic metric packet
after 4,801 checked assignments and no solver `UNKNOWN` result:

```text
physical cap        = {0,1,2,3,4}
surplus cap         = {4,5,6,7,8}
first opposite cap  = {8,9,10,11,12,0}

first apex          = 4
second apex         = 8
physical blocker    = 2

O1 retained class   = {3,5,9,10}
O1 double class     = {2,6,11,12}
O2 exact-five class = {0,1,2,3,4}
two-hit source row  = {1,3,9,11}

outside pair        = {9,11}
q,w                 = 9,3
parent B1           = {2,6,11,12}
parent B2           = {0,1,2,3}
```

The two first-apex squared-radius variables are distinct:

```text
retained radius = 283/4
double radius   = 299/4
```

The artifact [`local-lra.json`](local-lra.json) gives all 78 rational
distance variables.  The independent checker
[`verify_local_lra.py`](verify_local_lra.py) verifies with `Fraction`
arithmetic that:

- all distances are positive;
- all three triangle inequalities for every triple have normalized slack at
  least one;
- both strict Kalmanson inequalities for every cyclic quadruple have slack
  at least one;
- all four displayed radius classes are exact (not just selected subsets);
- the second apex has exactly one K4 radius class;
- the first apex has exactly the two displayed K4 radius classes;
- both endpoint one-hit bounds and the strict-cap partition hold;
- the outside pair crosses the two first-apex classes;
- `parent B1` is the double class, `parent B2` is a q-deleted subset of the
  second class, and their overlap is at most two; and
- deleting `q,w` leaves four points of the second-apex class and leaves the
  double first-apex class intact.

Reproduction:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-distinct-cross-terminal/verify_local_lra.py \
  scratch/atail-force/exact5-card13-distinct-cross-terminal/local-lra.json
```

The recorded output is:

```text
status: VERIFIED
distance_variables: 78
minimum_triangle_slack: 1
minimum_kalmanson_slack: 1
```

### Epistemic scope

This is an **exact witness within the abstract linear metric model**, not a
rank-two Euclidean realization and not a Problem 97 counterexample.  It omits
MEC containment, the total critical system, carrier-wide K4/minimality, and
the global deletion-cover rows.

## Full-parent focused gates

`decision.py` adds the complete finite parent projection, retained rows,
distinct-class partition, and cross-color condition.  Two 120-second runs
gave:

| orbit | outer candidates | LRA UNSAT | focused blocks | status |
|---|---:|---:|---:|---|
| `asymmetricSourceLeft` | 44 | 44 | 44 | `UNKNOWN` |
| `asymmetricSourceRight` | 37 | 37 | 37 | `UNKNOWN` |

The first left core is

```text
row|m|3|1=4
row|m|1|0=4
row|m|2|1=11
row|m|1|0=11
```

and the first right core is

```text
row|m|2|1=3
row|m|1|0=3
row|m|4|0=9
row|m|2|1=9
```

Both are generic `m`-row ordinal cycles.  They do not mention `parent B1`,
the double class, the cross split, or another distinct-radius field.  The
artifacts are [`left.json`](left.json) and [`right.json`](right.json).

`fixed_local_gate.py` then fixed the verified local witness while asking the
finite outer to fill the total blocker map and two global-cover row families.
The finite layer has a checked completion, recorded in
[`fixed-local-finite.json`](fixed-local-finite.json).  Its first selected-row
metric completion is UNSAT on another generic `m`-row core.  Enabling the
integrated ordinal prefilter made the fixed pattern solver-UNSAT in two seeds
(`fixed-local-seed17.json`, `fixed-local-seed29.json`), but those verdicts
have no exported coverage certificate and must not be presented as a proof.

Consequently:

- local strict-distance geometry is demonstrably insufficient;
- one particular local orbit does not extend to the integrated global
  abstraction;
- the broad global surface is not decided.

## Source-valid perpendicular-bisector mode reduction

There is one useful geometric reduction, but it is deliberately not promoted
because it is nonterminal.

Let `E` be the complete exact-five second-apex class.  It contains all three
strict physical-cap points and has one hit on each adjacent endpoint chain.
Suppose its hit on the first-opposite-cap side were a strict first-cap point
`x`.  The distinct-radius partition places `x` in one of the two exact
first-apex classes.  That class also has one strict physical-cap point `p`.
Then both apices are equidistant from `p,x`:

- the second apex because `p,x ∈ E`;
- the first apex because `p,x` lie in the same complete first-apex class.

Both apices lie in the surplus cap, while `p` and `x` lie outside it.
`CapSelectedRowCounting.outsidePair_unique_capCenter` therefore gives a
contradiction.  Hence the first-side adjacent hit of `E` must be the shared
support-triangle endpoint, not a strict first-cap point.

This reduction removes a genuine incidence mode, but it produces neither
first-apex co-radiality of the asymmetric outside pair nor a terminal packet.

## Nonlinear search status

`search_planar_cross.py` and `scan_analytic_core.py` are bounded numerical
falsification aids.  They found no convex/MEC realization of the tested
endpoint-saturated orbit.  The latter scanned 500,000 random angle triples
(529,680 circle-intersection branches) and found no convex eight-role core.

This is **HEURISTIC negative evidence only**.  The scans cover neither all
physical-role assignments nor all complete-parent fields, and they provide
no interval or algebraic certificate.  They do not prove rank-two
infeasibility.

## Exact remaining producer

The branch can close only after producing one of the following from the full
`F,R,B,Q,profile,star,N,P` packet:

1. `dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂`, immediately
   feeding `N.false_of_firstApex_coRadial`;
2. a genuine second source-indexed center through the relevant same-cap
   outside pair, feeding `outsidePair_unique_capCenter`;
3. `Nonempty (CriticalFiberClosingCore R)`;
4. a contract-complete alternative short-cap / `(m,4,4)` support packet; or
5. `False` directly from a rank-two Euclidean/MEC obstruction.

The local rational witness proves that no theorem deriving one of these may
use only the displayed class incidences and linear cyclic metric inequalities.
It must visibly consume the total critical map/global deletion cover, full
minimality, or genuinely nonlinear rank-two/MEC geometry.

The most precise next source-level question is therefore:

> In the endpoint-forced distinct-cross residual, why can the two exact
> first-apex colors not be completed to the total critical system and global
> deletion-cover star?

That is a coverage/occurrence theorem, not another row rebase lemma.
