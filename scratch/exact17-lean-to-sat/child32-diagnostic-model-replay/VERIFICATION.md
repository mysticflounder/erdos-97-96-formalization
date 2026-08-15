# Child32 diagnostic model replay

This directory is a read-only PIQD retrieval and local diagnostic record for
job `2506986e-0445-465f-9b05-eff6bb9a5983`.

## Retrieved identity

- PIQD status: `completed`, result `SAT`, backend `cadical`, profile `sat`.
- `requested_core_limit`: `null`; attestation is
  `SINGLE_PROCESS_NO_PARALLEL_FLAG` with one attested solver process.  This is
  diagnostic only and is not a production/core-gated result.
- CNF SHA-256: `c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`.
- Producer-manifest SHA-256: `f5da5c5bb0c5cbb7f1f95dd3230aef848ae62623330e9fecb5c62d9b66cba82e`.
- CNF bytes: `291620182`; header: `p cnf 308 5847240`.
- Retrieved `model.json` has `result=SAT`, `num_assigned=308`, and one signed
  literal for every variable 1 through 308.

## Independent replay

The local verifier streamed all `5,847,240` clauses from the retrieved CNF,
recomputed the CNF SHA, checked variable ranges and duplicate literals, and
pinned the retrieved 308-literal assignment.  Results:

```
sha_match=true
assignment_abs_1_to_308=true
clauses_counted=5847240
clause_count_match=true
literal_count=60067863
duplicate_literals=false
unsatisfied_clauses=0
```

`model.log` is only a derived Cadical-format view of the retrieved JSON model;
its SHA-256 is
`702eff2b6092072314495674441d9c9eb27717eacf4db3d43b9394880d599f46`.

## Diagnostic motif scan

The existing `census.atail_force.producer_bank.scan_all_formalized_cores`
pipeline was run on the 17 four-point rows decoded using this exact-17
encoding's row variables (`1 + 17*center + point`), for both named orders.
Each order returned four source-valid diagnostic records:

1. `equality-convex-four-point-two-circle-bisector-order`;
2. its reverse;
3. `equality-convex-five-point`;
4. `equality-convex-two-kalmanson-cancellation`.

The complete rows and canonical records are in
`motif-inventory.json`.  These are candidate source-consumer motifs only:
they do not promote the SAT model, prove universal coverage, or close the
Lean frontier.

The separate source-faithful Z3 analyzer was also attempted using its legacy
272-variable row map; it rejected this child32 model as `unsat`, so that path
is recorded as an encoding mismatch/obstruction, not as a theorem result.
