# Commands

Run from the repository root:

```bash
UV_CACHE_DIR=$PWD/scratch/.uv-cache uv run --offline python \
  scratch/p97-consumer-first/freshthird_firstnonhit_cap8_blocker_cycle_v1/run_wave.py
```

The optimized corrected admitted run uses 12 workers, Z3 `-T:5`, and cvc5
`--tlimit 5000`.  A known-SAT general-planar geometry control and malformed
orientation UNSAT control are emitted and run by the same script.
`results.json` is the authoritative run matrix and
`SHA256SUMS.json` authenticates every emitted SMT artifact.
