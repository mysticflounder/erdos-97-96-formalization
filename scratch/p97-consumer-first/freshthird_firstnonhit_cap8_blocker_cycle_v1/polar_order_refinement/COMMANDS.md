# Commands

```bash
UV_CACHE_DIR=$PWD/scratch/.uv-cache uv run --offline python \
  scratch/p97-consumer-first/freshthird_firstnonhit_cap8_blocker_cycle_v1/polar_order_refinement/run_refinement.py
```

The run used 12 workers, Z3 `-T:5`, cvc5 `--tlimit 5000`, and exact serial Z3
readback for any refinement SAT result.  The script reads only prior Z3-SAT
indices from the parent result matrix.
