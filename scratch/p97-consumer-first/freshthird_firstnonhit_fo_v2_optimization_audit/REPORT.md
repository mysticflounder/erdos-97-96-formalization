# FreshThird FirstNonHit FOL v2 optimization audit

## Verdict

No sound separate-sort or quotient encoding is available in the current
Prover9/Mace4 one-sorted language.  There is one conservative, source-faithful
symmetry break: anchor six of the fifteen auxiliary carrier witnesses to six
already named and already pairwise-distinct carrier points.  This leaves nine
free witness constants and removes six free constant choices (and 15 explicit
pairwise clauses if the guard is rewritten as below).  It does not identify
any source points or assert a finite abstract incidence domain.

The six anchors are the largest currently justified fixed set from the input:

```text
pa, pb, ra, rb, qa, qb
```

The input proves all six are carrier points and pairwise distinct (`car` at
lines 57--58; endpoint, Q, and cross-distinctness at lines 61--65 of
`firstnonhit_v2.in`).  It does *not* prove that `ca`, `cb`, or `oa` are distinct
from `qa`/`qb`, so anchoring those as additional slots would add an unsupported
source condition.

## Exact replacement guard

Replace the current `g0`--`g14` block (lines 107--138 of the v2 input) by this
block.  The existing named `car` and distinctness clauses supply the six
anchored points; the nine new constants are the only free cardinality
witnesses.

```prover9
  % Source-backed 15 <= |D.A| guard, with six auxiliary slots normalized
  % to the six named carriers already known pairwise distinct.
  car(g6). car(g7). car(g8). car(g9). car(g10).
  car(g11). car(g12). car(g13). car(g14).

  % Each free witness is different from each anchored witness.
  g6 != pa. g6 != pb. g6 != ra. g6 != rb. g6 != qa. g6 != qb.
  g7 != pa. g7 != pb. g7 != ra. g7 != rb. g7 != qa. g7 != qb.
  g8 != pa. g8 != pb. g8 != ra. g8 != rb. g8 != qa. g8 != qb.
  g9 != pa. g9 != pb. g9 != ra. g9 != rb. g9 != qa. g9 != qb.
  g10 != pa. g10 != pb. g10 != ra. g10 != rb. g10 != qa. g10 != qb.
  g11 != pa. g11 != pb. g11 != ra. g11 != rb. g11 != qa. g11 != qb.
  g12 != pa. g12 != pb. g12 != ra. g12 != rb. g12 != qa. g12 != qb.
  g13 != pa. g13 != pb. g13 != ra. g13 != rb. g13 != qa. g13 != qb.
  g14 != pa. g14 != pb. g14 != ra. g14 != rb. g14 != qa. g14 != qb.

  % The nine free witnesses are mutually distinct.
  g6 != g7. g6 != g8. g6 != g9. g6 != g10. g6 != g11.
  g6 != g12. g6 != g13. g6 != g14.
  g7 != g8. g7 != g9. g7 != g10. g7 != g11. g7 != g12.
  g7 != g13. g7 != g14.
  g8 != g9. g8 != g10. g8 != g11. g8 != g12. g8 != g13.
  g8 != g14.
  g9 != g10. g9 != g11. g9 != g12. g9 != g13. g9 != g14.
  g10 != g11. g10 != g12. g10 != g13. g10 != g14.
  g11 != g12. g11 != g13. g11 != g14.
  g12 != g13. g12 != g14.
  g13 != g14.
```

The replacement has 90 new inequality clauses (54 cross-anchor and 36
free-free), versus 105 `g_i != g_j` clauses in the original block.  More
importantly, it removes the six-way witness-label permutation involving the
already named points.  No solver run was made for this audit.

### Equivalence argument

Let `C = {x | car(x)}`.  The original block says that `C` contains fifteen
distinct elements.  Since the six anchors are in `C` and pairwise distinct,
there are at least nine further elements of `C`; choose those as `g6`--`g14`.
This extends every model of the original packet to the replacement packet.
Conversely, the replacement's six anchors together with `g6`--`g14` are
fifteen distinct members of `C`, so it implies the original cardinality guard.
The `g_i` names occur nowhere else in v2, hence this re-choice of auxiliary
witnesses cannot alter any `cen`, `mem`, `blocked`, or source-mapped clause.

## Rejected optimizations

* A separate finite witness sort is unavailable in the one-sorted input.  A
  simulated sort needs an injective bridge into the incidence domain; after
  eliminating the bridge it is exactly the same fifteen-distinct-elements
  condition, with extra predicates/functions and no guaranteed speedup.
* Replacing the abstract domain by exactly 15 elements, grounding all
  quantifiers over `g0`--`g14`, or asserting that every domain element is one
  of those witnesses conflates `15 <= |D.A|` with the packet's abstract
  incidence domain.  It is not a cardinality-independent source projection.
  The project plan explicitly rules out an induced finite carrier and any
  imposed finite carrier cardinality because omitted K4 witnesses need not be
  downward-hereditary (`docs/computational-closure-plan-2026-07-28.md:9881-9898`).
* A fresh order/successor relation is not a free symmetry break in Mace4:
  Prover9/Mace4 have no built-in finite ordered sort, and the relation's order
  axioms add a new interpreted structure.  A quotient of carrier witnesses is
  unsound unless an injective bridge is retained; `mem`, `blocked`, and `cen`
  can distinguish carrier points, so no congruence has been proved.

## Artifact consistency issue

The current input is the corrected fifteen-witness schema (hash
`0c26a13abf11e4febcfecb81d4e79a8bf6c10e4b4f947112d15c0cc163202e2a`), but the
comment on input line 4 still says “ten distinct carrier witnesses.”  More
materially, `validate_v2_model.py` still asserts `n == 10` and
`len(set(gs)) == 10` (lines 30 and 82), while the run is domain 15 and names
`g0` through `g14`.  It currently exits before these assertions because the
log has no model; any future model would make this validator fail or reject a
valid 15-point model.  This is separate from the optimization and should be
fixed in the v2 artifact before relying on model validation.

## Current run interpretation

`v2-mace4.log` records domain 15, 60 seconds, `max_sec_no`, zero models, and
1,527,030 ground clauses; `v2-prover9.log` records `SEARCH FAILED` at the
30-second limit.  These are incomplete bounded searches, not UNSAT.  The
optimization above is a candidate input rewrite only and has not been
benchmarked here.
