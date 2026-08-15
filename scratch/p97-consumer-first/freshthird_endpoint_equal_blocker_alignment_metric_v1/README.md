# FreshThird endpoint/equal-blocker alignment — metric wave v1

This directory is the complete handoff for one narrowly scoped feasibility
wave.  It tests only the proposed implication

> endpoint row/cap split + a distinct equal-blocker pair in one strict cap
> forces an indexed cap containing the row center and common blocker while
> both repeated-blocker row points lie outside.

The implication is refuted by an exact rational local Euclidean realization.
This is not a model of the entire
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual` hypothesis list.

## Handoff files

- `RESULTS.md`: verdict, witness spine, solver matrix, and scope boundary.
- `SOURCE_MAP.md`: every tested clause and its live Lean provenance.
- `THEOREM_SEARCH.md`: assessment of the single mandatory post-wave theorem
  search.
- `run_wave.py`: deterministic emitter, solver runner, exact validator,
  theorem-search runner, and checksum generator.
- `artifacts/*.smt2`: incidence abstraction, exact Euclidean realization, and
  two malformed controls.
- `logs/*`: raw Z3 and cvc5 stdout/stderr.
- `readback/witness.json`: exact rational witness.
- `readback/geometry_{z3,cvc5}.json`: exact solver readbacks.
- `readback/exact_validator.json`: independent `fractions.Fraction` checks.
- `results.json`, `environment.json`: machine-readable run summary.
- `theorem_search/*`: exact query metadata and raw output.
- `SHA256SUMS`: checksums for every other file in this directory.

## Reproduction

From the repository root:

```bash
uv run scratch/p97-consumer-first/freshthird_endpoint_equal_blocker_alignment_metric_v1/run_wave.py wave
uv run scratch/p97-consumer-first/freshthird_endpoint_equal_blocker_alignment_metric_v1/run_wave.py search
uv run scratch/p97-consumer-first/freshthird_endpoint_equal_blocker_alignment_metric_v1/run_wave.py checksums
```

The solver processes are sequential.  The maximum simultaneous solver count
is one, below the requested 12-core ceiling.

