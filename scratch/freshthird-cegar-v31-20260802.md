# FreshThird v31 authenticated CEGAR round (2026-08-02)

Scope: scratch-only external Z3/CEGAR computation.  No production Lean file,
certificate bank, or theorem source was edited.

## Focused contract gate

Command (pinned project environment):

```text
uv run --project scratch/retained-omission-e1/round5-general-cegar --with pytest pytest -q scratch/retained-omission-e1/round5-general-cegar/test_round5_cegar_v31.py
```

Result: exit 0; `9 passed, 7 subtests passed in 96.41s`.

The gate authenticates the v31 schema/provenance, spawn adapter, clause family,
and parent result validation.  It is not a solver run.

## Authenticated retry/search attempt

Source summary:
`scratch/retained-omission-e1/round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json`

Source-summary SHA-256: `96bc41be3a625843ee5047df1ca08eaba49fa7d22d38f2471fb5ce9724c4a46d`.

Command:

```text
nice -n 15 uv run --project scratch/retained-omission-e1/round5-general-cegar python scratch/retained-omission-e1/round5-general-cegar/round5_cegar_v31.py retry --summary scratch/retained-omission-e1/round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json --semantic-bool-count 810 --workers 1 --timeout-ms 30000 --bool-timeout-ms 5000 --max-power-cuts 32 --max-power-candidates 100000 --max-bool-power-cuts 0 --max-bool-power-candidates 1 --max-assignments 8 --replay-timeout-ms 5000 --raw-probe-timeout-ms 0 --artifacts scratch/retained-omission-e1/round5-general-cegar/artifacts-v31-reverse-hit-two-center-acute
```

The semantic-count filter selected 43 authenticated source cases (all profiles
with two `D`s), not only the 24 fresh cases affected by the acute family.  The
v31 source contract records 24 affected fresh cases, eight guarded clauses per
non-paired case, zero paired clauses, and zero semantic-Boolean delta.

Artifact run directory:
`scratch/retained-omission-e1/round5-general-cegar/artifacts-v31-reverse-hit-two-center-acute/20260803T035819.291975Z-retry-pid6710/`

The attempt was interrupted after bounded resources were exceeded; shell exit
status was 143 (termination of the launched process).  Durable progress before
termination:

| count | status |
|---:|---|
| 3 | `unknown` (`v31_wall_clock_budget_exhausted`) |
| 2 | `error` |
| 1 | started with no durable result |

The five durable cases were `fresh_SDD_k0_d2_f1`,
`fresh_SDD_k0_d2_f3`, `fresh_SDD_k0_d3_f1`, `fresh_SDD_k0_d3_f2`, and
`fresh_SDD_k1_d3_f0`.  Each encoded `global_K4=465`,
`nonapex_global_k4_squared_superadditivity=4368`, and
`reverse_hit_two_center_sqdist_acute=8`.  No `sat` or `unsat` result was
authenticated.

The two errors were both:
`RuntimeError: frozen formula tracker allowlist mismatch: missing=[], extra=['track_reverse_hit_two_center_sqdist_acute']`.
This is a v31 integration/fidelity failure: the v19 tracker allowlist was not
extended for the new family.  Therefore the partial artifacts are diagnostic
only and cannot support a mathematical closure or a complete retry census.

Provenance in `invocation.json`: schema version 31; script SHA-256
`15f0881bc999ddd96af4ba9230e519897f62caf9504531066014dea82d6c9cc2`;
schema SHA-256 `af037fd9c285d81cb54559c94733f914abc39c591f15f53b3f5addc6cb53e11d`.
