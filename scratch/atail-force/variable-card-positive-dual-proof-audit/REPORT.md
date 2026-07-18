# Variable-card positive-dual proof audit

Date: 2026-07-18

Status: **NO CARD-FOURTEEN ABSTRACT COUNTERMODEL IS PERSISTED OR LOGGED.  THE
OLD SOURCE/TARGET STREAMS WERE SYNCHRONOUSLY INTERRUPTED AND THEIR IMMUTABLE
PREFIXES REPLAY TO TWO FURTHER EXACT UNSAT CUTS.  THE CARDINALITY-GENERIC
POSITIVE-CONTOUR THEOREM REMAINS CONJECTURAL.  DIRECT EXACT Z3 DECISIONS ARE
UNSAT THROUGH CARD TEN AND TIME OUT AT CARDS ELEVEN THROUGH FOURTEEN; COMMON
TRANSLATION PROVES ONLY THAT POSITIVITY AND TRIANGLE ROWS ADD NO FORCE.**

This lane is scratch-only.  It does not edit production Lean, closure plans,
or proof-blueprint state, and it closes no source `sorry` by itself.

## Candidate theorem and current status

Let `V = Fin n` carry its cyclic order.  For every unordered pair `x,y`, let
`e(x,y)` be the corresponding basis vector.  For every increasing
quadruple `a < b < c < d`, define the two strict Kalmanson vectors

```text
K1(a,b,c,d) = e(a,c) + e(b,d) - e(a,b) - e(c,d)
K2(a,b,c,d) = e(a,c) + e(b,d) - e(a,d) - e(b,c).
```

Let `S(c)` be a four-element subset of `V \ {c}` for every center `c`, and
let the row-equality subspace be

```text
R(S) = span { e(c,x) - e(c,y) | x,y in S(c) }.
```

A proof-ready chain formulation is as follows.  Work over `Q` and set

```text
Cdist = Q^(unordered pairs of V)
Crow  = direct sum over c of {u : Q^(S(c)) | sum_x u(x) = 0}
CK    = Q^(increasing quadruple x {K1,K2}).
```

Define the two boundary maps by

```text
drow(c,u) = sum_{x in S(c)} u(x) e(c,x)
dK([a,b,c,d],kind) = Kkind(a,b,c,d).
```

Thus `image(drow) = R(S)`.  The exact desired certificate is a pair
`(lambda,rho)` with

```text
lambda in CK,
lambda(q,kind) >= 0 for every coordinate,
sum_(q,kind) lambda(q,kind) > 0,
rho in Crow,
dK(lambda) + drow(rho) = 0 in Cdist.
```

Only `lambda` has a sign restriction; the row multipliers `rho` are
unrestricted.  Rational coefficients are sufficient, since the entire
surface is rational polyhedral and denominators can be cleared before the
existing integral checker is used.

The proposed cardinality-generic target was:

> **Alternating-four-row positive-contour lemma.**  If every `S(c)` has
> cardinality four and every two centers sharing a target pair alternate with
> that pair in the cyclic order, then there are nonnegative rational weights,
> not all zero, on the `K1/K2` vectors whose weighted sum belongs to `R(S)`.

Pairing this identity with a strict Kalmanson distance table that is constant
on each `S(c)` gives a strictly positive number equal to zero.  The existing
weighted Kalmanson consumer and checked cut-data soundness bridge are already
the formal endpoint for such a certificate.

The strong-connectivity version adds the hypothesis that the digraph
`c -> S(c)` is strongly connected.  No persisted abstract-distance survivor
currently refutes this version.  The corrected card-fourteen outer already
asserts selected-witness strong connectivity, so a future `ALIVE` on that
surface would be decisive negative evidence.

Had the no-connectivity statement been true, it would have said directly:

> A strict cyclic Kalmanson distance matrix has some row in which no distance
> value occurs four times off the diagonal.

That theorem would bypass A-TAIL entirely, because the original property gives
four equal off-diagonal distances at every carrier point.  The present exact
search decides only the finite prefix through card ten; it does not prove the
cardinality-generic statement.

## Interrupted card-fourteen boundary

The exact CEGAR lane has not reported a card-fourteen structural assignment
whose abstract distance oracle is SAT.  The intended surface contains:

- one selected four-member row at every center;
- strict Kalmanson inequalities;
- the exact-six cap/role/blocker structural outer;
- the exact-five physical shell and its row equalities; and
- selected-witness strong connectivity.

The independent event-stream audit shows that the old source/target runs were
synchronously interrupted after cuts 721/719.  Faithful replay from immutable
copies of those exact prefixes produces ordinary exact UNSAT metric cuts
722/720.  There is no `exact_alive` event, SAT terminal, or `alive.json`.
The historical driver did have a real crash-on-SAT bug, but the surviving logs
do not show that these runs exercised it.  The neighboring
`exact6-integrated-cegar-audit/REPORT.md` records the hashes and replay details.

Every Kalmanson vector and every row/shell equality vector has coefficient sum
zero.  Therefore, **if** an exact nonnegative SAT table `d` is later found,
define

```text
d'(i,j) = d(i,j) + C                 for i != j.
```

All Kalmanson slacks and all row/shell equalities are unchanged.  Choosing
`C > 0` makes every off-diagonal distance strictly positive.  Moreover

```text
d'(i,j) + d'(j,k) - d'(i,k)
  = d(i,j) + d(j,k) - d(i,k) + C,
```

so one sufficiently large rational `C` makes every triangle inequality
strict as well.  Positivity and abstract metric triangles therefore cannot
distinguish that hypothetical table from the strict metric shadow.  This
invariant does not produce such a table or refute the generic theorem.

The current live routes are exact cut coverage and the aggregate positive
contour theorem.  If a genuine `ALIVE` table appears, the first new algebraic
force is common planar Euclidean realizability: exact squared Cayley--Menger
determinants, or a centered positive-semidefinite Gram matrix of rank at most
two.  Failure of one four-point planar minor will explain that witness, though
it will not prove that every structural assignment fails.  A planar survivor
would require actual MEC/nonobtuse cap geometry, complete critical-fiber
provenance rather than selected representatives, and global minimality/no-M44.

## Why ordinary ordinal cycles are not enough

`OrdinalKalmansonCycle.lean` consumes a directed cycle of strict comparisons
between individual quotient distance classes.  The exact 263-core audit shows:

```text
minimized exact metric cores     263
cores with an ordinal cycle      231
cores without an ordinal cycle    32
```

The remaining 32 cores require a genuine balanced `2 -> 2` Kalmanson flow:
several strict inequalities cancel only after branching and recombination.
Therefore a proof that merely extracts a cycle in the selected-row digraph,
or a cycle in the one-term ordinal quotient, is too weak.

The right local basis is the triangular distance grid.  Adjacent `K2` cells
have the form

```text
e(i,j) + e(i+1,j+1) - e(i,j+1) - e(i+1,j),
```

and global Kalmanson inequalities telescope from these cells plus the wrap
`K1` cells.  A row equality is a zero boundary integral along one horizontal
path in the same grid.  The desired proof would:

1. orient enough row-equality paths to obtain a nonzero closed 1-chain;
2. fill it with a nonnegative 2-chain of local Kalmanson cells; and
3. use the cell boundary identity to obtain the positive dual.

Step 2 is routine planar telescoping once the correctly oriented contour is
known.  Step 1 is the missing combinatorial lemma.  Strong connectivity gives
an unsigned graph cycle, but it does not by itself supply the signs and
nonnegative filling required by the Kalmanson grid.  Any proposed proof must
address this orientation issue explicitly.

The natural non-enumerative invariant is **oriented Kalmanson flux** on the
distance-term Möbius strip.  Unordered pairs `(i,j)` form the vertices of the
discrete triangular strip obtained from the cyclic square by swapping the two
coordinates.  Adjacent `K2` vectors are oriented unit cells; the seam cells
are the local `K1` vectors.  A global `K1/K2` vector is a nonnegative rectangle
sum of these cells.  Row equalities are paths inside one center fiber.

The missing contour-extraction statement can therefore be isolated further:

> From four marked terms in every center fiber, subject to pair alternation,
> choose and orient row-fiber paths so their total endpoint boundary vanishes,
> and so every bounded component of the resulting 1-cycle has the same cell
> orientation.  At least one component or seam winding must be nonzero.

A null-homologous component is filled by adjacent `K2` cells.  A component
with nonzero strip winding is closed using the seam `K1` cells.  In both cases
the filling coefficients are nonnegative and not all zero, giving `lambda`;
the oriented row paths give `rho`.  This is a genuine combinatorial/topological
lemma.  It is stronger than finding a directed cycle in `c -> S(c)` and is the
first step that a proof must supply.

## Soundness of the pair-alternation cuts

For four vertices `a < b < c < d`, two centers equidistant from the same
target pair are forbidden unless the center pair and target pair alternate.
There are four forbidden center placements:

- centers `a,b`, targets `c,d`: direct `K2` cancellation;
- centers `c,d`, targets `a,b`: the symmetric direct `K2` cancellation;
- centers `a,d`, targets `b,c`: direct `K1` cancellation; and
- centers `b,c`, targets `a,d`: direct `K1` cancellation.

The two diagonal partitions `{a,c}|{b,d}` are the only allowed placements.
This is exactly what `add_selected_pair_alternation` encodes.  The normalized
Lean kernels are already present in
`CapCrossingKalmanson.lean` and in the sibling scratch
`exact5-shell-selected-row-alternation` lane.

`alternation_incidence_decision.py` independently reconstructs only the
Boolean row-cardinality and alternation surface.  Exact Z3 replay gives:

```text
n = 5   UNSAT
n = 6   UNSAT
n = 7   UNSAT
n = 8   SAT, model substituted back into every clause
```

No strong-connectivity hypothesis is used.  Thus the `n=5..7` MILP
infeasibility is not a floating arithmetic artifact: pair alternation alone
already rules out every four-row incidence table there.  At `n=8` the
incidence obstruction genuinely stops, so a metric/weighted consumer is
required.

## Integrated normalized MILP

`integrated_bare_kalmanson_milp.py` chooses all rows and one symmetric
distance table simultaneously.  It uses:

- exactly four non-self members in every row;
- optional exact strong connectivity via all directed cut constraints;
- the sound pair-alternation clauses above;
- guarded equality to one row radius;
- `sum d(i,j) = 1`;
- `d(i,j) >= epsilon`; and
- both Kalmanson slacks at least `epsilon`.

Since the surface is homogeneous and all normalized distances lie in `[0,1]`,
the guarded equality constant `M=1` is rigorous.  A positive optimum is
equivalent to a strict feasible table.  A decoded incumbent is independently
replayed in exact Z3 LRA after scaling every positive/slack condition to at
least one.

The SAT smoke gate has one selected row at `n=6`.  HiGHS obtains
`epsilon = 1/30`, and the fixed row replays as an exact rational Kalmanson
model.  Thus the guarded equality and strict-slack directions are not
accidentally contradictory.

Current global results without connectivity are:

| `n` | pair-alternating incidence | Kalmanson MILP | exact fixed-row replay |
|---:|:---:|:---:|:---:|
| 5 | UNSAT | infeasible | not applicable |
| 6 | UNSAT | infeasible | not applicable |
| 7 | UNSAT | infeasible | not applicable |
| 8 | SAT | optimal `epsilon ~= 0` | decoded row table UNSAT |
| 9 | SAT | optimal `epsilon = 0` | decoded row table UNSAT |
| 10 | not separately decided | 300 s `UNKNOWN`; zero incumbent | decoded row table UNSAT |
| 11 | not separately decided | 300 s `UNKNOWN`; zero incumbent | decoded row table UNSAT |
| 12 | not separately decided | 300 s `UNKNOWN`; numerical `epsilon = 4.9e-15` incumbent | decoded row table UNSAT |

HiGHS optimality is external floating-point evidence, not an exact global
certificate.  Exact fixed-row replay certifies only the displayed incumbent,
not the global zero optimum.  No positive exact-replayed witness has been
found.  In particular, the `n=10..12` timeouts are not finite-range closure:
their dual bounds still permit positive normalized slack, while their
incumbents are zero-slack floating solutions whose selected rows are exactly
infeasible.  Their correct status is `UNKNOWN`.

The independent direct Z3 encoding chooses the row incidences and the
abstract Kalmanson distance table together over exact real arithmetic.  The
files without `no-connectivity` in their names include the selected-witness
strong-connectivity constraints.  Z3 currently reports:

| `n` | with strong connectivity | without connectivity |
|---:|:---:|:---:|
| 8 | UNSAT | UNSAT |
| 9 | UNSAT | UNSAT |
| 10 | UNSAT | UNSAT |
| 11 | 600 s `UNKNOWN` | not run |
| 12 | 600 s `UNKNOWN` | not run |
| 13 | 600 s `UNKNOWN` | not run |
| 14 | 600 s `UNKNOWN` | not run |

These are exact-arithmetic solver decisions, but the UNSAT results do not yet
carry independently checked proof certificates.  They are therefore strong
finite evidence, not kernel closure and not a proof for arbitrary card.

At `n=8`, the optimum row table is the circulant pattern

```text
S(i) = i + {-2,-1,1,3} mod 8.
```

Its first terminal is already a three-row Kalmanson contour: after cyclic
normalization `a < b < c < d`, the rows at `a`, `b`, `c` respectively equate

```text
(a,b) = (a,d),   (a,b) = (b,d),   (a,c) = (b,c),
```

which cancels `K2(a,b,c,d)` directly.  The unminimized solver core lists a
telescoping chain of adjacent `K2` cells, illustrating the same planar filling.

At `n=9`, the optimum row table is the circulant pattern

```text
S(i) = i + {-3,-1,1,2} mod 9.
```

Its decoded exact core is again a short Kalmanson staircase, not an ordinal
one-edge collision.

## Adversarial checks and current decision

- The random fixed-row falsifier found no exact Kalmanson SAT table in tens of
  thousands of strongly connected candidates for each `n=6..25`.  This is
  heuristic no-hit evidence only.
- The direct integrated Z3 encoding is externally UNSAT with and without
  strong connectivity for `n=8..10`.  Its strong-connectivity runs time out at
  `n=11..14`; `UNKNOWN` is unresolved-under-budget, not evidence for either
  satisfiability or infeasibility.
- The integrated exact-six Z3/cvc5 Kalmanson-only decisions remain bounded
  `UNKNOWN`; their timeouts do not prove the generic theorem.
- The no-connectivity integrated `n=10..12` MILPs likewise remain `UNKNOWN`
  after 300 seconds.  They found no positive exact-replayed witness, but the
  bounds do not prove that none exists.
- The exact-six integrated HiGHS model has optimum common slack zero, but it
  contains many cap, shell, blocker, and role constraints absent from the bare
  theorem.
- The 263 minimized cores prove that literal schema enumeration is not a
  general proof: 32 already escape the ordinary quotient-cycle normal form.
- A center-avoiding relabeling of the order-three projective-plane incidence
  design gives thirteen four-member rows with every two rows intersecting in
  exactly one target, so all shared-pair alternation constraints are vacuous.
  Exact replay still rejects it.  Its core is one coherent six-cycle in the
  center/target incidence graph: three row equalities cancel a positive sum
  of two `K2` cells.  In the saved relabeling the rows give

  ```text
  d(0,6) = d(0,11),  d(1,6) = d(1,10),  d(2,10) = d(2,11),
  ```

  while `K2(0,1,6,10) + K2(0,2,10,11)` has exactly those six
  terms with the contradictory strict orientation.  This is useful evidence
  for the local contour rule, but it is not yet a uniform extraction theorem.
- The order-three symplectic generalized-quadrangle test was deliberately
  canceled when the card-fourteen route correction arrived; its stored
  `UNKNOWN/canceled` record is not evidence in either direction.
- The corrected exact CEGAR lane has no card-fourteen abstract-linear survivor.
  The only durable terminals beyond the interrupted prefixes are two further
  exact UNSAT cuts.  A future `ALIVE` must be persisted and independently
  replayed before it changes this route assessment.

Therefore the honest status is:

```text
direct all-center Kalmanson theorem       CONJECTURAL; EXTERNALLY UNSAT THROUGH n=10
positive-contour formulation             VALID DUAL FORM; GENERIC EXISTENCE OPEN
ordinary strong-connectivity cycle proof INSUFFICIENT AS STATED
finite decision frontier                  n=11..14 UNKNOWN UNDER 600 s BUDGET
```

The two live continuations are: obtain checked finite cut coverage for the
remaining exact-six/card-fourteen structural orbits, or prove the aggregate
positive-contour theorem uniformly.  If a genuine `ALIVE` appears, persist and
independently replay it before computing a planar Euclidean obstruction.  Only
then would the route need additional Euclidean/MEC, full-fiber, or
global-minimality force.

## Artifacts and reproduction

- `integrated_bare_kalmanson_milp.py`: normalized mixed decision and exact
  fixed-row replay;
- `alternation_incidence_decision.py`: independent exact Boolean alternation
  cross-check;
- `integrated_bare_kalmanson.py`: exact integrated Z3 reference encoding;
- `exact-z3-allrows-n{8,9,10}-20260718.json`: direct Z3 UNSAT results with
  strong connectivity;
- `exact-z3-allrows-n{8,9,10}-no-connectivity-20260718.json`: the matching
  stronger bare decisions without connectivity;
- `exact-z3-allrows-n{11,12,13,14}-20260718.json`: 600-second
  strong-connectivity `UNKNOWN` records;
- `structured_design_falsifier.py`: exact fixed-design falsifier for
  `PG(2,3)` and `W(3,3)` incidence rows;
- `audit_alive_planarity.py`: exact translation, strict-triangle replay, and
  four-point Cayley--Menger audit for any future card-fourteen ALIVE table;
- `structured_pg23_seed0.json`: exact-UNSAT projective-plane row table;
- `structured_w33_seed0.json`: deliberately canceled `UNKNOWN` run;
- `search_n6.json` through `search_n9.json`: bounded local-search no-hit runs;
- `all_rows_n*_no_connectivity.json`: no-connectivity decisions; and
- `all_rows_n*_with_alternation.json`: strong-connectivity decisions with the
  same redundant alternation clauses.

Example:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/variable-card-positive-dual-proof-audit/\
integrated_bare_kalmanson_milp.py \
  --n 9 --mode all-rows-no-connectivity --time-limit 300 \
  --output scratch/atail-force/variable-card-positive-dual-proof-audit/\
all_rows_n9_no_connectivity.json
```
