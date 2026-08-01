# n=17 PB-to-CNF / CaDiCaL result

Date: 2026-07-30

## Result

`UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT`.

The Z3 tactic route is technically feasible and cheap after source
construction, but it did not materially improve the outer solve:

- hash-pinned source formula: 689,038 named constraints, represented by
  689,067 `QF_FD` assertions after Z3 flattens top-level conjunctions;
- source construction plus ground-formula scan: about 79 seconds;
- `pb2bv -> bit-blast -> tseitin-cnf`: 9.34 seconds;
- DIMACS serialization: 31,364,923 bytes, 116,393 variables, and 1,435,449
  clauses;
- default CaDiCaL 3.0.0: `UNKNOWN` after a 600-second hard solver timeout;
- CaDiCaL `--sat -n`: `UNKNOWN` after a 300-second hard solver timeout.

The previous direct `QF_FD` attempt was also `UNKNOWN` after a 780-second
outer timeout (845.5 seconds total). Thus the export overhead is not the
bottleneck, but these bounded runs give no evidence that CaDiCaL resolves the
outer instance materially better.

## Fidelity gates and mappings

The source file is pinned at SHA-256
`4e7cca7b8fb097387b42aec35358534fee57465b4e6f4d5035acd0295b292219`.
The ground-formula scanner passed with 1,385,965 visited nodes.

Representative SAT and UNSAT pseudo-Boolean smoke formulas passed. Each smoke
formula also passed all eight fixed-source-variable projection checks, and the
smoke UNSAT DRAT was accepted by `drat-trim`.

The emitted CNF is SHA-256
`e9bffb192dab42825992339780930d70b4ac6efc666f768b3518142030e247c9`.
Its `c <id> <label>` lines map every DIMACS id. All 5,695 source Boolean names
are present. Z3 gives 4,080 distinct auxiliary ids the repeated display label
`at-least`; therefore the DIMACS integer id, not that label, is the canonical
auxiliary identity. See `n17-initial.mapping.json`.

The CNF is the initial outer formula. Since neither CaDiCaL run produced a SAT
assignment, source readback and the dynamic strong-connectivity refinement
step were not reached.

## Trust boundary

- The small smoke gates do not certify the full Z3 tactic translation.
- The timed-out 567,456,704-byte DRAT stream is incomplete and is not a proof.
- No SAT assignment exists to read back against the pre-CNF assertions.
- This remains only the fixed `n = 17` combinatorial model. It omits Euclidean
  realizability constraints, and the live Lean obligation has `n >= 17`.

## Reproduction

From the repository root, using the pinned `uv` environment:

```bash
uv run python \
  scratch/atail-force/aligned-singleton-second-nonbisector-cadical/export_and_solve.py \
  --export-only --export-timeout-ms 360000

cadical -t 600 \
  scratch/atail-force/aligned-singleton-second-nonbisector-cadical/n17-initial.cnf \
  scratch/atail-force/aligned-singleton-second-nonbisector-cadical/n17-initial.drat
```

Machine-readable measurements and the explicit trust boundary are in
`run-summary.json`.
