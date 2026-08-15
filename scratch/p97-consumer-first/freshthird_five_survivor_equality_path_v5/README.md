# FreshThird five-survivor equality-path CEGAR v5

This directory tests the source-clean equality-path consumer on the complete
eight-tag exact-17 FreshThird five-survivor structural matrix.  Unlike v4, it
does not freeze one support assignment per tag.  It asks the structural solver
for an assignment, checks it independently, learns a path-specific Boolean cut
when exact-support closure contradicts that assignment, and repeats until it
finds a closure-clean survivor or the finite structural tag is UNSAT.

Current outcome: all eight tags have independently validated, dual-solver SAT,
equality-closure-clean survivors.  Eight source-entitled path cuts were learned
on the way.  Therefore the named-row equality-path consumer is real and useful,
but it is not a complete closure mechanism for this finite abstraction.

Run and verify:

```bash
uv run python scratch/p97-consumer-first/freshthird_five_survivor_equality_path_v5/run_wave.py --overwrite
uv run python scratch/p97-consumer-first/freshthird_five_survivor_equality_path_v5/verify_wave.py
uv run python scratch/p97-consumer-first/freshthird_five_survivor_equality_path_v5/test_wave.py
uv run python scratch/p97-consumer-first/freshthird_five_survivor_equality_path_v5/verify_wave.py --checksums
```

The wave is serial and uses one core, z3 and cvc5, a 45-second per-call limit,
and at most 128 refinements per tag.  It does not invoke shared-coordinate NRA.
Every emitted SMT2 file has exactly one `check-sat`.

Artifact layout:

- `manifest.json`: pinned sources, exact tag matrix, bounds, and row contract;
- `journal.jsonl`: hash-chained, source-labeled candidates and learned cuts;
- `results.json`: terminal classifications and replayable cut records;
- `artifacts/<tag>/`: exact queries, solver logs, parsed models, and statuses;
- `artifacts/controls/`: dual-solver SAT/UNSAT and drop-one controls;
- `SHA256SUMS`: hashes for every non-cache file in this directory.

This is finite exact-17 diagnostic evidence.  A SAT survivor is not a P97
counterexample or a Euclidean realization.  An UNSAT tag, had one occurred,
would still not be a universal-cardinality theorem or a Lean/sorry closure.

