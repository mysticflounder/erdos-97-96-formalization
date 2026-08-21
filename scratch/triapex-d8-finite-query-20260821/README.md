# D8 endpoint-cycle exact-row query

This scratch lane tests a deliberately narrow implication needed by the sole
remaining F1 terminal in
`TriApexEndpointRetainedOmission.lean`.

The query retains only source-audited incidence consequences of
`EndpointDistinctBlockerThreeStepDeletionCycle` and its three
`CommonDeletionTwoCenterPacket`s:

- every represented row has exactly four distinct points and omits its center;
- each packet row omits its deletion source;
- rows at distinct centers overlap in at most two points;
- each packet's two distinct-center rows overlap in at most two points;
- the named endpoint shells contain and omit the points proved in the Lean
  source; and
- the four represented centers and four deletion sources satisfy only the
  audited disequalities.

The three packet rows at the secondary centers are identified with the
corresponding canonical blocker shells by
`qDeletedK4Class_support_eq_selectedShell`. Rows sharing the first-apex
center are *not* assumed equal or disjoint: the packet structures select four
witnesses and do not expose complete concentric classes.

It then asks whether all presently missing cross-incidences can simultaneously
fail.  A SAT answer is an abstraction survivor, not a counterexample to the
geometric theorem.  An UNSAT answer would still require an independently
checked certificate and a Lean theorem matching the exact source contract.

Run:

```bash
uv run python scratch/triapex-d8-finite-query-20260821/d8_endpoint_cycle_query.py \
  --output scratch/runs/triapex-d8-finite-query-20260821/run-0001/result.json
uv run pytest -q \
  scratch/triapex-d8-finite-query-20260821/test_d8_endpoint_cycle_query.py
```

## Reuse preflight

Candidate searched: a collision consumer for
`H.centerAt Q.J Q.J_mem_A = O.deleted` inside the three-step endpoint cycle.
Its immediate consumer would be
`false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core`.
The project Lean-corpus agentic search on 2026-08-21 returned only the cycle
producer and that same sorry-bearing consumer, so the first missing antecedent
remains a non-circular collision contradiction or a theorem separating `x`
from `d`. The audited terminal source digest for this run is
`8a317341312f80e28e109a61c81e8674db54f1fb205e96f8ffe99662ec866392`.
