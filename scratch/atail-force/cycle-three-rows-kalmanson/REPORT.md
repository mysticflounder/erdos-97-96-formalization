# Full period-three reverse rows: exact Kalmanson audit

Date: 2026-07-17

Status: **EXHAUSTIVE FINITE ABSTRACT-DISTANCE AUDIT.  ORDINAL CLOSURE
ELIMINATES 1,224 OF 2,214 QUOTIENT ORDER/IDENTIFICATION CASES; ALL 990
REMAINING CASES ARE EXACT QF_LRA SAT WITH INDEPENDENTLY REPLAYED RATIONAL
LEDGERS.  IN PARTICULAR, EVERY SIX-DISTINCT OUTSIDE-TARGET ORDER SURVIVES.
THIS EXHAUSTS PURE TRIANGLE + STRICT-KALMANSON CLOSURE OF THE THREE COMPLETE
PERIOD-THREE ROWS.  NO EUCLIDEAN REALIZATION IS CLAIMED.**

This lane owns only
`scratch/atail-force/cycle-three-rows-kalmanson/`.  It did not edit
production Lean, plan documents, blueprint state, `ShellCurvature`,
`surplusM44`, the card-five lane, or protected 555/654 files.  No Lean or
Lake build was run.

## Exact question

The predecessor `cycle-one-target-kalmanson` audit showed that one complete
reverse `2+2` row is compatible with all triangle and strict Kalmanson
inequalities.  This audit tests the next faithful local threshold: all three
complete source-indexed rows on the period-three all-reverse core.

The fixed chiral cap core is

```text
o, left, q0, c0, c2, q1, c1, q2, right
```

and the three exact row classes are

```text
c0 : {q0,q1,x0,y0}
c1 : {q1,q2,x1,y1}
c2 : {q2,q0,x2,y2}.
```

The physical-apex class is exactly the five named cap points

```text
o : {left,q0,q1,q2,right}.
```

Every outside role lies on the complementary boundary chain between `right`
and `left`, whose distinguished vertex is `o`.  This is precisely the role
window constructed by `ReverseRowCyclicRoles`: starting at each blocker, its
two same-cap sources are the outer shell roles and its outside pair occupies
the two middle roles.

The main six-distinct branch treats `x0,y0,x1,y1,x2,y2` as six distinct
boundary vertices.  The audit is stronger than that branch: it also allows
different rows to share outside targets whenever

1. each row still has two distinct outside points; and
2. the three unordered outside pairs remain distinct, as proved by
   `reverseOutsidePair_injective`.

Thus it covers every role-identification schema compatible with the currently
proved pair-cardinality and pair-injectivity facts.  It does not identify an
outside role with one of the named core vertices; the question dispatched to
this lane was the ordering of the six outside targets.

## Required theorem-bank preflight

Before constructing the finite distance systems, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered strict Kalmanson inequalities, cyclic
quadrilateral shell equalities, omission-cycle outside pairs, and critical
row incidence.  The closest current results are the two generic strict
Kalmanson inequalities and

```lean
CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
```

in `ATail/CapCrossingKalmanson.lean`.  That terminal needs a particular
three-row overlap on five cyclic points.  The exact reverse rows do not force
its two cross-row return incidences.  No bank entry supplies them.

## Exhaustive order and identification quotient

There are 53 valid set partitions of the six row roles after enforcing pair
cardinality two and pair injectivity:

| actual outside vertices | valid role partitions |
|---:|---:|
| 3 | 8 |
| 4 | 32 |
| 5 | 12 |
| 6 | 1 |

For a partition with `k` actual target vertices, every complementary-chain
placement consists of a permutation of those vertices and one of `k+1` cuts
at `o`.  Before symmetry reduction this gives 17,712 order/split cases.

The only quotient used is independent interchange of the two unnamed target
roles in each row, the group `(S2)^3`.  This leaves 2,214 cases:

| actual outside vertices | quotient cases |
|---:|---:|
| 3 | 24 |
| 4 | 480 |
| 5 | 1,080 |
| 6 | 630 |

No reflection quotient is used.  The source/blocker word

```text
q0,c0,c2,q1,c1,q2
```

is chiral: reversing it cannot be relabelled back while preserving which
`c_i` is the blocker for `{q_i,q_(i+1)}`.  Treating reflection as a symmetry
would therefore merge genuinely different source-indexed cases.

`verify_results.py` independently regenerates the 2,214-element quotient and
checks exact set equality with the recorded case list.

## Ordinal strict-distance closure

For every case, `audit.py` quotients unordered distance terms by all four
shell-equality groups.  It then adds both strict Kalmanson inequalities for
every cyclic quadruple, cancels equal terms, and transitively closes the
resulting directed strict comparisons.

The exact outcome is:

| actual outside vertices | ordinal UNSAT | ordinal survivors |
|---:|---:|---:|
| 3 | 24 | 0 |
| 4 | 480 | 0 |
| 5 | 720 | 360 |
| 6 | 0 | 630 |
| **total** | **1,224** | **990** |

Every ordinal UNSAT case has an immediate one-inequality core: after shell
equalities, one strict Kalmanson inequality has the same two distance classes
on both sides.  `results.json` stores one such named core per case, and the
independent verifier reconstructs its equality quotient and checks the
equal-sum contradiction exactly.

The five-vertex split has a simple source-indexed description.  Exactly one
actual target is shared by two rows.  All 360 cases in which rows `0` and `1`
share it survive ordinal closure, for every chain order.  All 720 cases in
which the shared target joins rows `0` and `2`, or rows `1` and `2`, have an
immediate strict-distance contradiction.  This distinction is with respect
to the fixed chiral core and its anchored row numbering.

Consequently this audit does prove a useful local normal form:

> The three reverse rows use at least five distinct outside vertices.  If
> they use exactly five, the unique shared vertex can occur only in the
> row-`0`/row-`1` pair in the fixed anchored chiral order.

Turning that finite order statement into production Lean would require a
small case-normalization adapter, but its mathematical cores are only shell
equalities plus one current strict Kalmanson theorem.

## Full exact QF_LRA systems

Every ordinal survivor was then checked with its full abstract metric system.
For a case with `n` named vertices, the system contains:

- one positive variable for each unordered distance, normalized to at least
  `1`;
- all `3 * choose(n,3)` triangle inequalities;
- 13 independent equalities generating the physical class and the three
  complete four-point row classes;
- every named exclusion from the exact physical and row radius classes;
- both strict Kalmanson inequalities for every cyclic quadruple, normalized
  to rational slack at least `1`.

The normalization is lossless for this homogeneous finite system: any strict
solution can be scaled by the reciprocal of its smallest positive distance,
strict Kalmanson slack, and named disequality gap.

The two survivor sizes are:

| actual targets | points | distance variables | triangles | named exclusions | strict Kalmanson |
|---:|---:|---:|---:|---:|---:|
| 5 | 14 | 91 | 1,092 | 35 | 2,002 |
| 6 | 15 | 105 | 1,365 | 39 | 2,730 |

Z3 4.17.0 returned SAT for all 990 ordinal survivors.  Every model was
converted to exact rational values and immediately substituted back into all
constraints using `fractions.Fraction`.  `ledgers.json` stores the complete
rational ledger for every surviving case.

The independent replay, which does not import Z3 or the generating module,
returns:

```text
PASS: quotient=2214 ordinal_unsat=1224 exact_lra_sat=990 min_named_exclusion_gap=1 min_kalmanson_slack=1
PASS: abstract distance ledgers only; no Euclidean realization claimed
```

A representative six-distinct case is `k6_1584`, with cyclic order

```text
o, left, q0, c0, c2, q1, c1, q2, right,
x0, y0, x1, y1, x2, y2.
```

Its exact ledger has physical radius `53` and row radii `42`, `67/2`, and
`65`.  Its minimum named-class gap and strict Kalmanson slack are both `1`.
The whole ledger is in `ledgers.json`.

The representative SMT-LIB system was also checked with the independent cvc5
1.3.3 engine:

```text
PASS: cvc5 SAT representative=k6_1584 points=15 variables=105 triangles=1365 strict_kalmanson=2730
PASS: second-engine abstract QF_LRA cross-check; no Euclidean claim
```

## What this decides

The full three-row local surface

```text
period-three co-radial source/blocker cycle
+ all three complete exact named 2+2 rows
+ outside-pair injectivity
+ cyclic order
+ all triangle inequalities
+ all strict Kalmanson inequalities
+ exact named radius-class exclusions
```

is compatible whenever the six outside targets are distinct, in every
genuinely distinct complementary-chain order in the finite quotient.  It is
also compatible in the one allowed five-vertex overlap type.

Therefore the proposed strict-distance/Kalmanson consumer does **not** close
the all-reverse leaf, even after all three complete rows are present.  The
one-row predecessor was not merely too weak: pure linear convex-quadrilateral
distance reasoning is exhausted on this full local period-three surface.

The rational ledgers are abstract metrics.  They do **not** assert planar
Euclidean realizability, shared coordinates, MEC containment, an actual
`CounterexampleData`, or compatibility with deletion minimality and the full
`CriticalShellSystem`.  The route can still close only through information
absent from this abstraction, such as:

1. a genuinely two-dimensional Euclidean distance-matrix/coordinate
   obstruction;
2. MEC or strict cap placement beyond cyclic Kalmanson inequalities; or
3. a source-indexed cross-row incidence forced by the retained global
   critical map and deletion minimality.

The local overlap theorem above may simplify those routes, but it does not by
itself close a production `sorry`.

## Promotion interface for the exact overlap normal form

The finite negative part has a small useful production-facing statement even
though the full Kalmanson route is blocked.  After specializing the physical
cycle to period three, write

```text
P0 = reverseOutsidePair K 0
P1 = reverseOutsidePair K 1
P2 = reverseOutsidePair K 2
U  = P0 union P1 union P2.
```

The intended theorem interfaces are, schematically:

```lean
theorem five_le_reverseOutsideUnion_card_of_period_three
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 3)
    (hreverse : allReverseMembership K) :
    5 ≤ (P0 ∪ P1 ∪ P2).card

theorem reverseOutside_overlap_normalForm_of_period_three_of_card_eq_five
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 3)
    (hreverse : allReverseMembership K)
    (hcard : (P0 ∪ P1 ∪ P2).card = 5) :
    (P0 ∩ P1).card = 1 ∧
    Disjoint P0 P2 ∧
    Disjoint P1 P2
```

Here `0,1,2` are the anchored row indices of the current chiral omission-cycle
packet; this is not an invariant statement under an unproved reflection or
rotation quotient.  A production declaration should either keep those
anchored indices or first prove the exact transport theorem it uses.

The geometric step needs only the existing pair-cardinality/injectivity
theorems, the three `ReverseRowCyclicRoles`, shell equalities, and one of:

```lean
CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
```

Every rejected finite case reduces to one application of one of these strict
inequalities whose two sides become equal after the row-shell rewrites.

The remaining implementation burden is finite normalization, not new
geometry:

1. extract each two-point `P_i` using `reverseOutsidePair_card_eq_two`;
2. rank the resulting three-to-six actual vertices on the complementary
   chain supplied by the cyclic-role adapters;
3. quotient the three independent swaps inside `P_i` (but not reflection);
4. use a checked finite table mapping every bad rank/identification schema to
   its stored `K1` or `K2` equal-sum core; and
5. instantiate the corresponding current CCW Kalmanson lemma and close by the
   four shell equalities plus `linarith`.

`results.json` is already the complete discovery table: its 1,224 rejected
records each contain `minimal_equal_sum_core`.  Before promotion, that JSON
should be compressed to a small pure finite schema theorem (ordinary kernel
reduction or explicit generated cases, not an opaque solver assumption), then
connected to the actual boundary indices.  This adapter would prune the
period-three branch to five or six outside vertices; it would not close the
branch or any production `sorry` by itself.

## Reproduction

Generation and exact Z3 ledger extraction:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-kalmanson/audit.py \
  --jobs 1 --timeout-ms 20000
```

Independent exact replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-kalmanson/verify_results.py
```

Independent-engine representative cross-check:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-kalmanson/crosscheck_representative.py
```

The multiprocessing option is retained for non-sandboxed hosts.  This
sandbox denied the process-semaphore query before any parallel case ran, so
the recorded census used the deterministic sequential path.

## Epistemic status

| Claim | Status |
|---|---|
| 2,214 cases exhaust the stated order/identification quotient | **EXACT FINITE ENUMERATION, independently regenerated** |
| 1,224 cases are impossible by shell equalities plus strict Kalmanson | **EXACT, one-inequality cores independently replayed** |
| All 990 remaining cases satisfy the full abstract LRA system | **EXACT QF_LRA SAT with rational ledgers independently replayed** |
| Representative six-distinct case is SAT in a second engine | **CROSS-CHECKED by cvc5** |
| Any SAT ledger is a planar Euclidean/MEC realization | **NOT CLAIMED** |
| Pure local Kalmanson closure of all three complete rows can prove `False` | **REFUTED in the stated abstraction** |
| Production `sorry` closed by this lane | **NONE** |
