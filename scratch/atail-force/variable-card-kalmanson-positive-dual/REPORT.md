# Variable-card Kalmanson positive-dual audit

Date: 2026-07-18

Status: **THE GENERIC POSITIVE-DUAL THEOREM REMAINS CONJECTURAL.  THE CURRENT
EXACT-SIX SURFACE HAS NO FOUND LINEAR OR ORDINAL COUNTERMODEL, BUT THREE
INDEPENDENT MONOLITHIC SOLVER ARCHITECTURES RETURNED ONLY BOUNDED NO-VERDICTS.
THE CONTINUATION-ORBIT MILP OPTIMUM AT ZERO IS A STRONG CONVERGENCE SIGNAL,
NOT AN EXACT CERTIFICATE.**

This lane changes no production Lean, closes no source `sorry`, and does not
claim finite coverage from a growing literal schema bank.

## Question audited

The proposed variable-card theorem has the following abstract surface.

- The carrier has a cyclic order.
- Every center chooses four non-self targets at one common distance.
- The selected-edge digraph is strongly connected.
- Every cyclic quadruple satisfies both strict Kalmanson inequalities.

The desired conclusion is `False`.  Equivalently, for every selected-row
table there should be a finite positive dual: nonnegative weights on strict
Kalmanson inequalities, together with unrestricted multipliers on selected
row equalities, whose distance coefficients cancel and whose strict weight
is nonzero.

The exact theorem remains **CONJECTURED**.  This audit found neither a uniform
proof nor an exact rational Kalmanson countermodel.  A ten-second direct bare
card-14 bit-blast also ended `UNKNOWN`; that smoke is recorded only to show
that the generic and exact-six questions were kept separate.

## Correct normal form

Let the distance atoms be unordered carrier pairs.  Selected-row equalities
generate an equivalence relation on those atoms.  A strict Kalmanson
inequality has two positive diagonal atoms and two negative side atoms.

If one positive atom and one negative atom lie in the same equality class,
the remaining positive atom is strictly larger than the remaining negative
atom.  Thus the simplest duals are directed cycles in the quotient of
distance atoms.  Full Farkas duals are nonnegative circulations that may use
several Kalmanson inequalities before their coefficients cancel.

This is also the useful boundary-difference form.  For cyclic
`a < b < c < d`, Kalmanson-2 says

```text
d(a,c) - d(a,d) > d(b,c) - d(b,d).
```

Selected-row equalities splice these strict difference comparisons.  The
right uniform theorem, if true, is therefore a cut/gap circulation theorem,
not another fixed list of row-membership schemas.

## Exact audit of the existing minimized schema bank

`analyze_quotient_cycles.py` reconstructs the transitive equality quotient
and every one-term K1/K2 cancellation comparison.  On the current combined
round-one/round-two minimized membership projections it finds:

```text
stored minimized schemas     263
quotient-cycle schemas       231
projection residuals          32

cycle length 1                31
cycle length 2               115
cycle length 3                54
cycle length 4                23
cycle length 5                 6
cycle length 6                 1
cycle length 8                 1
```

This is exact combinatorial replay of the stored projections.  It is not live
parent coverage.  In particular, a minimized membership projection may omit
row entries that are present in the original whole row table, so the 32
residual projections cannot be advertised as full-row ordinal survivors.

The result nevertheless identifies the dominant invariant: most observed
Farkas cores are already quotient ordinal cycles after transitive row-equality
cancellation.  Literal core growth was therefore stopped.

## Countermodel search against the bare generic theorem

`search_countermodel.py` performs local core-guided mutation of fixed strongly
connected four-out row tables and checks exact rational Kalmanson feasibility.
It banks no literal schema.  No SAT table was found in these bounded runs:

| Card | Exact fixed-table checks | Terminal state |
|---:|---:|---|
| 10 | 39,389 | `UNKNOWN_WALL_BUDGET` |
| 11 | 28,583 | `UNKNOWN_WALL_BUDGET` |
| 12 | 20,666 | `UNKNOWN_WALL_BUDGET` |
| 13 | 14,812 | `UNKNOWN_WALL_BUDGET` |
| 15 | 7,250 | `UNKNOWN_WALL_BUDGET` |
| 18 | 2,286 | `UNKNOWN_WALL_BUDGET` |
| 21 | 711 | `UNKNOWN_WALL_BUDGET` |
| 25 | 110 | `UNKNOWN_WALL_BUDGET` |

These are falsification attempts only.  “No SAT hit” is not evidence of
coverage or a proof of the generic theorem.

## Direct integrated exact-six decisions

The exact-six outer was pinned to

```text
scratch/atail-force/exact6-allcenter-capaware-gate/allcenter_gate.py
SHA-256 2af4ebe69459f371f25100a80de1a092e81cae75bd62ad87175c1d4c19a5f27b
```

That source includes the new complete exact-five-shell/selected-row
alternation constraint.  The integrated formula adds exact Floyd-Warshall
selected-edge strong connectivity and uses no transported or learned metric
schema cuts.

### Z3 real-linear portfolios

For each of the seven exact-six role orbits,
`integrated_exact6_decision.py` asserted in one solver:

- 1,092 guarded selected-row equalities;
- 78 guarded complete-shell equalities;
- 2,002 normalized strict Kalmanson inequalities;
- on the full surface, 91 positivity and 1,092 strict triangle inequalities.

Results:

```text
full metric surface          7/7 UNKNOWN at 180 s
Kalmanson-only surface       7/7 UNKNOWN at 180 s
SAT models                   0
UNSAT verdicts               0
```

The Kalmanson-only run is the stronger proof test: it omits assumptions not
used by any observed core.  Its higher conflict rate did not become a solver
verdict.

### Independent cvc5 cross-check

The separately owned
`../exact6-integrated-qflra-crosscheck/REPORT.md` independently emits SMT-LIB
and uses cvc5 1.3.3.  Its full and Kalmanson-only portfolios both ended
`7/7 TIMEOUT` at 300 seconds.  Its verifier passes, including the hand-checked
SAT/UNSAT smoke pair, current source hashes, exact timeout markers, and absence
of cut-bank categories.

This agreement rules out a Z3-wrapper accident.  It does not turn a timeout
into mathematical evidence.

## Exact ordinal-cycle decision attempt

`integrated_ordinal_cycle_decision.py` encodes the complete equality quotient
without real variables.  It assigns a bounded rank to each of the 91 distance
atoms and asserts all 8,008 one-term Kalmanson cancellation implications.  A
rank exists exactly when the quotient comparison graph is acyclic: there are
91 available ranks for at most 91 quotient classes, so unrelated classes can
always receive distinct topological ranks.

The seven arithmetic-rank Z3 runs and seven finite-domain/7-bit runs all ended
`UNKNOWN` at 180 seconds.  The formula was then exported by
`bitblast_ordinal_cnf.py` through

```text
simplify
propagate-values
elim-term-ite
solve-eqs
lia2card
card2bv
bit-blast
tseitin-cnf
```

The seven CNFs contain 57,561--58,257 variables and 310,686--315,043 clauses.
CaDiCaL 3.0.0 `--plain` searched each for 180 seconds; all seven ended
`UNKNOWN_WALL_BUDGET`.  No SAT assignment or UNSAT proof was produced.

`run_cadical_ordinal.py` contains the exact projected-model replay that would
have run on SAT.  Since every result was unknown, no replay is claimed.

## New convergence signal from the integrated MILP lane

The independently owned continuation-orbit MILP artifact reports:

```text
floating HiGHS status        globally optimal
common strict slack epsilon  0
branch-and-bound nodes        309
wall time                    57.0956 s
```

The LP relaxation has positive optimum

```text
epsilon = 0.0006279434850863421
```

Pinned provenance:

```text
cbd394ca9a4507ef8dd58fb0f8b630b65ca94792b1e007b2b17f8c000a2eb0da  ../exact6-integrated-milp/continuationOrder.json
6491e0fb615bb85a520303b1b17095821c10565c79de4023da4dc05a6c5d1297  ../exact6-integrated-milp/continuationOrder.lp.json
1d31c875afa50ea03d825d6ddc34ea41928438dddd5f0b50918c4b448ef599d5  ../exact6-allcenter-coverage-certificate/encode.py
```

The MILP wrapper is still evolving in its owned lane; the result artifacts
pin the stable structural encoder hash above, so this report does not pretend
that the wrapper's current bytes are the bytes that produced the checkpoint.

The rigor label is exactly
`HIGHS_OPTIMAL_NONPOSITIVE_COMMON_SLACK_NO_EXACT_CERTIFICATE`.  Floating
global optimality is a strong convergence signal, not a Lean theorem or exact
Farkas certificate.  The positive LP relaxation shows that integrality and
structural branching are load-bearing; one root Farkas dual cannot close the
surface.

## Decision and next proof-facing move

Do not spend another round on unpartitioned SMT or literal schema mining.

For the current exact-six parent, the computational route should convert the
small continuation MILP search into a checkable branch-and-bound/Farkas tree:

1. branch only on named structural Boolean variables;
2. at every leaf, record an infeasibility or nonpositive-slack LP dual;
3. rationally reconstruct and coefficient-check every dual;
4. record the binary branch tree so its leaves exhaust the parent surface;
5. feed each checked weighted cut to the existing
   `WeightedKalmansonCutDataSoundness`/`KalmansonFarkasConsumer` endpoint;
6. repeat for the other six role orbits, or prove their symmetry reduction.

For the theorem-facing generic route, the only honest remaining target is a
cut/gap circulation theorem proving that strong connectivity forces a
positive Kalmanson dual.  This audit supplies the quotient normal form and a
large exact regression set, but not that theorem.  It should remain a
research fallback, not the critical path to today's source closure.

## Verification

Run:

```bash
UV_CACHE_DIR=/private/tmp/p97-variable-dual-uv uv run python \
  scratch/atail-force/variable-card-kalmanson-positive-dual/verify_checkpoint.py
```

The verifier fail-closes over:

- all seven full Z3 no-verdict artifacts;
- all seven Kalmanson-only Z3 no-verdict artifacts;
- all seven QF_FD ordinal no-verdict artifacts;
- all seven bit-blasted CaDiCaL no-verdict artifacts, recorded CNF hashes,
  and parsed-header logs;
- the 263-schema quotient-cycle audit;
- the bounded bare-generic smoke; and
- the pinned continuation MILP/LP hashes and reported floating optima.

Current result:

```text
variable-card positive-dual checkpoint: PASS
```

Key source hashes at this checkpoint:

```text
11c382fbd2f854987e56580bb1cd530eb1a4a864c679abe9fc6b2165247511ca  analyze_quotient_cycles.py
4b711c875d1b9e5f2ac0fb96d562e138382037555dac47742661b78f5550d31e  quotient_cycle_audit.json
3562060d36c02632c9e78001bf94ede32a5f06ef6dce4110042f520ad1e1ab6a  search_countermodel.py
e729e8c86b8a95b8fc3cc9430eede039ebc5f33711ca6474f1144adb09392692  integrated_exact6_decision.py
ab6329812be5069a3902b53d41483160e557db091cc8632aa57721a908528e05  integrated_ordinal_cycle_decision.py
b8375e0b3016d5a73211acf40d3226b23e227e2a6efb7e98e38b621b83031fd1  bitblast_ordinal_cnf.py
8a53e0590f984bb71fdd39b98a4ce4046cff9b3a394f99bee6d17e47a05e1c9d  run_cadical_ordinal.py
90b5b5a579da9d6b171359f8fb04f9827dcba4ecb8bf73d1ccb86ab7b01edaa9  bare_generic_decision.py
0f7124d73090a7ac22acb0d00b894422bf012a59265782069da580e05c72701d  verify_checkpoint.py
```

## Bank and indexed-corpus preflight

Before theorem discovery, the registries required by `AGENTS.md` were
searched: the current general-n registry, sibling `p97-rvol` census, both
legacy inventories, and indexed Lean corpora through `nthdegree docs search
--lean`.  The existing `CapCrossingKalmanson`, `OrdinalKalmansonCycle`,
`KalmansonFarkasConsumer`, and weighted cut-data soundness consumers were
reused as endpoints.  No duplicate production consumer was added.
