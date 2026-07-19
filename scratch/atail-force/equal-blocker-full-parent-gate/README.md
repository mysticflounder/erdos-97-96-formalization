# Equal-blocker full-parent model gate

This lane implements the acceptance boundary for the first active branch of
the current A-tail strategy.  Its target is the exact parent implication

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualEqualBlockerShell M
---------------------------------------
False
```

The gate is deliberately fail-closed.  A selected-row, Kalmanson, or partial
blocker model is recorded as `RELAXATION_ONLY`; it cannot be reported as a
counterexample to the parent theorem and cannot authorize a Lean producer.
Likewise, a checked UNSAT result is promotable only when the input retains the
complete `D`/`S`/`H`/`F0`/`R`/`B`/`L` packet and every required global field.

The initial manifest is `NOT_RUN`: the existing equal-blocker artifacts are
regression evidence, not a full-parent decision.  Run the checker before
publishing any future solver result:

```bash
python3 scratch/atail-force/equal-blocker-full-parent-gate/check_manifest.py \
  --manifest scratch/atail-force/equal-blocker-full-parent-gate/manifest.json
```

Allowed decisive statuses are `FULL_PARENT_SAT_WITNESS`,
`CERTIFIED_UNSAT`, and `UNKNOWN`.  The first two are rejected unless all
ledger fields are present; `UNKNOWN` is always nonterminal.
