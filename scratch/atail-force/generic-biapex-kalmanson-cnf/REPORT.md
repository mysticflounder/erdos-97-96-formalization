# Direct-CNF bi-apex outer CEGAR checkpoint

## Exact status

This scratch lane replaces the slow Z3 pseudo-Boolean outer map by a direct,
auditable CNF.  At `n = 11`, second apex `1`, the round-2 bank produced a CNF
with 242 variables and 158,669 clauses.  CaDiCaL found a Boolean survivor in
0.733 seconds.  The encoder substituted that assignment through every CNF
clause; `verify_outer_result.py` independently checked the original structural
conditions and all 141,504 embeddable round-2 schema cuts.  Replaying the
assignment against the original Z3 outer construction was also SAT.

The fixed survivor was full-LRA UNSAT.  Its first minimized core had 12
constraints.  `verify_farkas_core.py` independently rebuilt the rational LRA
core, checked that every single-constraint deletion was SAT, found exact Farkas
multipliers, and replayed coefficient cancellation using `Fraction`.  The
first certificate had multiplier `1/9` on each of nine Kalmanson inequalities,
equality multipliers `-1/9, -1/9, +1/9`, zero total coefficient on every
distance variable, and weighted right-hand side `1`.

Sequential CEGAR then ran with all verification gates before banking:

- `cegar_round3_a1`: 30/30 new schemas banked, 232 -> 262, terminal
  `NEW_SCHEMA_LIMIT`, 44.092 seconds.
- `cegar_round4_a1`: 173 new schemas banked, 262 -> 435.  The 174th outer call
  inherited only 14 seconds from the wall budget and returned `UNKNOWN`; exact
  terminal status `OUTER_UNKNOWN`, not UNSAT, after 895.086 seconds.
- `cegar_round5_a1`: 29 new schemas banked, 435 -> 464.  The owner then found a
  normalization bug in the mining representation: full-carrier gap roles had
  been retained instead of active-role/rank normalization, allowing one active
  theorem shape to recur at different spacings.  The run was stopped after the
  iteration-29 checkpoint.  Its manifest terminal status is
  `STOPPED_FOR_ACTIVE_ROLE_NORMALIZATION`.  Iteration 30's CNF and partial DRAT
  are preserved but have no verdict and must not be used.

Every one of the 232 later bank additions (30 + 173 + 29) was individually
checked by independent semantic outer replay, independent QF_LRA UNSAT replay,
all single-deletion SAT checks, and exact rational Farkas cancellation.  The
normalization bug therefore concerns redundancy/generalization and transport
normal form, not the exact fixed-instance contradiction certificates.  The
464-schema unnormalized bank is discovery evidence only and must not seed a
successor; the next route is the separately audited active-role/rank-normalized
bank with preferred `2 Kalmanson + 3 row equality` cores.

There is no outer UNSAT result, no verified full-LRA SAT metric, no Lean proof,
and no arbitrary-cardinality coverage theorem in this lane.

## Generalization checkpoint

For the first 30 iterative cores, every minimized core used only strict
Kalmanson inequalities and row equalities: 167 `kal2`, 121 `kal1`, and 155 row
equalities in aggregate, with no triangle or positivity constraint.  Twenty-
seven used both Kalmanson kinds and three used only `kal2`.  The later owner
audit sharpened all 30 to exact alternate cores with exactly two Kalmanson
inequalities plus three row equalities and unit weights, yielding 15
order/reflection forms.  This is an empirically exhaustive statement about the
audited 30 cores, not yet a general theorem.

## Main commands

All Python commands used a writable uv cache:

```bash
UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/exact_outer_cnf.py \
  --self-test

UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/exact_outer_cnf.py \
  --n 11 --second-apex 1 \
  --preload-bank scratch/atail-force/generic-biapex-kalmanson-search/schema_bank_round2.json \
  --cnf scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.cnf \
  --result scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.result.json \
  --solver-log scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.cadical.log \
  --proof scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.drat \
  --timeout-seconds 300

UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/verify_outer_result.py \
  scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.result.json \
  scratch/atail-force/generic-biapex-kalmanson-search/schema_bank_round2.json \
  --output scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.verify.json

UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/full_lra_fixed_check.py \
  scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.result.json \
  --timeout-ms 60000 --wall-seconds 300 \
  --output scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.full_lra.json

UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/verify_farkas_core.py \
  scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.full_lra.json \
  --output scratch/atail-force/generic-biapex-kalmanson-cnf/n11_a1_round2.farkas.verify.json
```

The reusable bounded loop was invoked as follows (changing initial bank,
run directory, and schema cap between rounds):

```bash
UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/iterative_cnf_cegar.py \
  --initial-bank INPUT_BANK.json --run-dir RUN_DIRECTORY \
  --n 11 --second-apex 1 --wall-seconds 900 \
  --max-new-schemas LIMIT --outer-timeout-seconds 300 \
  --metric-timeout-ms 60000
```

## Restart pointers

- Implementation: `exact_outer_cnf.py`, `verify_outer_result.py`,
  `full_lra_fixed_check.py`, `verify_farkas_core.py`, and
  `iterative_cnf_cegar.py` in this directory.
- Last safe unnormalized checkpoint (do not use as a successor seed):
  `cegar_round5_a1/bank_029.json` and `cegar_round5_a1/manifest.json`.
- Partial/non-verdict artifacts: `cegar_round5_a1/iteration_030.cnf` and
  `cegar_round5_a1/iteration_030.drat`.
