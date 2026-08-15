# FreshThird U3 simultaneous six-center diagnostic

Run once from the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_u3_simultaneous_sixcenter_20260809/run_simultaneous.py
```

The runner creates a fresh manifest, 12-case matrix, SMT-LIB files, raw Z3 and
cvc5 logs, independent pure-Python SAT readbacks, the source-derived finite
no-good bank, and machine/human result summaries.  Processes run strictly
sequentially with one host core budget and a 20-second timeout per process.

This is the only wave in this namespace.  Do not iterate its SAT models into a
second refinement round without a new task and namespace.
