# Corrected FreshThird exact-17 core minimization

## Result

The first joint Z3+cvc5 UNSAT at
`../generated/refined_named_rows_and_singletons.smt2` has a genuine
deletion-minimal **two-clause** core:

1. `k4_equal_13_10`: the frozen first-apex K4 row requires
   `d2(13,10) = d2(13,0)`;
2. `singleton_excludes_c_first_10`: the aligned `c_first` singleton requires
   `d2(13,10) != d2(13,0)`.

Each singleton clause obtained by dropping one member is SAT in Python Z3,
Z3 CLI, and cvc5. The two-clause union is UNSAT in all three checks. Z3's
assumption core over the complete 1,083-clause query already returns these two
clauses, and a fresh-solver-per-trial deletion pass confirms minimality.

This is not the 13-clause final-stage delta. Only one of those 13 clauses is
needed, together with one earlier K4-witness equality. The exact source
interpretation and reusable incidence cut are in [SOURCE_MAP.md](SOURCE_MAP.md).

Classification: computational theorem-discovery evidence for one frozen
corrected exact-17 assignment. It closes no Lean theorem and proves no
universal P97 statement. In particular, it is not a P97 counterexample: it
rejects this incidence candidate because its K4 support violated an already
licensed aligned-singleton exclusion.

## Reproduce and verify

From the repository root:

```bash
uv run python -m py_compile \
  scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/core_minimization/minimize_core.py \
  scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/core_minimization/verify_manifest.py

uv run python -u \
  scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/core_minimization/minimize_core.py \
  --timeout-ms 60000 --cvc5-timeout-ms 60000

uv run python \
  scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/core_minimization/verify_manifest.py
```

The generator first validates the assignment, rebuilds the canonical
1,083-clause artifact byte-for-byte, extracts and deletion-shrinks the core,
then writes and independently replays ten one-`check-sat` artifacts.

The replay suite contains:

- the two-clause UNSAT core;
- both drop-one SAT witnesses;
- the two-packet named-group UNSAT core and both drop-one-group SAT witnesses;
- two SAT malformed-source controls obtained by flipping either core clause;
- one known-SAT and one known-UNSAT solver smoke control.

Every SAT result is also checked by exact formula evaluation in the Python Z3
model. Every query is replayed by Z3 CLI and cvc5. Current recorded versions
are Python Z3 4.16.0, Z3 CLI 4.16.0, and cvc5 1.3.3.

Running the generator twice produced byte-identical `results.json` and
`SHA256SUMS`; the manifest verifier checks all artifact hashes and the
one-`check-sat` invariant.

## Files

- `minimize_core.py`: deterministic extraction, shrink, generation, and
  dual-solver replay;
- `verify_manifest.py`: hash, coverage, core, delta-size, and one-check-sat
  integrity verification;
- `results.json`: machine-readable source map and all replay statuses;
- `SHA256SUMS`: hashes for the generated artifacts and result manifest;
- `generated/*.smt2`: exact core, drop, packet, malformed, and smoke queries.
