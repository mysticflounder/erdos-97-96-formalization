# Rigid221 S0 bounded full-L1 computation launch record

**Date:** 2026-08-29  
**Lane:** `rigid221-s0-full-l1-20260829`  
**Run:** `full-l1-v1`  
**Lane base:** `914396eaca79981b03f7b46b40dbb88d22f79ab5`  
**Operational state:** RUNNING  
**Mathematical state:** NO VERDICT

The governed two-cell computation was launched at `2026-08-30T06:28:16Z` and
observed live under launcher PID `92665` (Python PID `92719`, terminal session
`82463`). There is no solver verdict or accepted witness yet. “Running” here
means only that this bounded M0 fixed-order canary is underway; it does not
mean that the unencoded exhaustive L1 partition has been launched.

## Objective and boundary

The first launch will test the two fixed fourteen-role, all-distinct `M0`
canary cells documented in
`2026-08-29-rigid221-s0-full-l1-source-constraint-manifest.md`:

```text
m0-distinct-s0-i
m0-distinct-s0-n
```

Each supported cell combines the exact physical five-fiber, both actual
selected rows, both deletion obstructions, strict convexity, MEC/non-obtuse
Moser data, exact `OnArcOpposite` cap filters, the generic cap-membership count,
endpoint-erased `J`, `u∈J`, and the selected `xu` branch.

The earlier twelve-role row computation and exact cap-semantics controls are
prerequisites only:

- `2026-08-29-rigid221-s0-l1-computation.md` established a restricted
  `SAT_12_ROLE_POSITIVE_CONTROL_EXACT` row canary, not L1 or S0;
- `2026-08-29-rigid221-s0-cap-semantics-computation.md` established exact
  cap predicate positive/negative controls, not a coupled-row L1 result.

Combining their code paths does not retroactively upgrade either prior result.
Only a fresh governed run against the active manifest can produce a bounded
L1-cell verdict.

## Governed paths

```text
lane checkpoint:
  .codex/worktree-checkpoints/rigid221-s0-full-l1-20260829.json

generated run root:
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/

required run manifest:
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/run_manifest.json

durable run outputs declared by the lane:
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/REPORT.md
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/cell_manifest.json
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/results.json

implementation:
  scripts/rigid221_s0_full_l1.py
  scripts/test_rigid221_s0_full_l1.py

source manifest:
  docs/audits/2026-08-29-rigid221-s0-full-l1-source-constraint-manifest.md
```

The `run_manifest.json` must exist before solver artifacts are generated. Its
`base_head` must repeat the lane base above. The actual executed commit,
working-source digests, solver versions, command, environment, and start time
belong in the run record and results; none is filled in here before launch.

## Prelaunch gates

1. The source manifest maps every active constraint and carries an explicit
   omission ledger.
2. The exact cap checker derives all caps from `OnArcOpposite`, applies the
   Moser endpoint pattern, enforces exactly one cap for every non-Moser carrier
   role, and erases the correct endpoints from `J`.
3. With `(v1,v2,v3)=(m1,m2,O)` and `surplusIdx=0`, the checker verifies
   `oppApex2=v3=O`, `oppIndex2=2`, and `J=C3\{m1,m2}`.
4. The cardinality `>4` check applies to `cap[surplusIdx]=C1`, not to `J=C3`
   merely because `J` is the selected second-opposite cap.
5. The verifier checks exact closure of `C`, `Ku`, and `Kv` over all fourteen
   modeled carrier roles and enumerates every four-subset needed for both
   `no_qfree_at` obstructions.
6. Known-SAT, known-UNSAT, cap-index, closed-versus-open arc, endpoint-erasure,
   global-convexity, and deletion-obstruction controls pass.
7. Result authentication and independent rational replay reject mutations of
   every load-bearing constraint.
8. Focused tests, lint, the lane hygiene report, and the pre-existing
   `run_manifest.json` all pass before launch.

## Expected commands

These are launch-plan commands, not a record that they have run:

```bash
uv run python scripts/rigid221_s0_full_l1.py \
  --smoke --workers 20 --timeout-ms 120000

uv run pytest -q scripts/test_rigid221_s0_full_l1.py

uv run python scripts/rigid221_s0_full_l1.py \
  --output-dir \
  scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/artifacts/primary \
  --workers 20 --timeout-ms 600000

uv run python scripts/check_worktree_hygiene.py report \
  --lane rigid221-s0-full-l1-20260829
```

The worker setting is hard-capped at 20. The current canary has only two cell
templates, so the cell executor can use at most two cell workers concurrently;
the 20-worker value is a ceiling for the extensible runner, not evidence that
twenty cores are active.

## Initial cell ledger

| Cell family | Operational state | Mathematical status | Coverage note |
|---|---|---|---|
| `m0-distinct-s0-i` / `M0-I-v1` | RUNNING | no verdict | supported fixed canary |
| `m0-distinct-s0-n` / `M0-N-v1` | RUNNING | no verdict | supported fixed canary |
| Other cyclic orders in M0 | no encoder cell | `ENCODING_BLOCKED` | required for negative exhaustiveness |
| M1 and M2 auxiliary-overlap cells | no encoder cell | `ENCODING_BLOCKED` | source-legal |
| Legal `cu`/`cv` placement cells | no encoder cell | `ENCODING_BLOCKED` | source-legal |
| Legal `O`–auxiliary equality cells | no encoder cell | `ENCODING_BLOCKED` | source-legal |
| Legal `m1`/`m2` endpoint-identification cells | no encoder cell | `ENCODING_BLOCKED` | includes possible `xu` endpoint cells in S0-N |

Unsupported cells do not prevent an exact SAT witness in a supported cell from
being useful. They do prevent any fixed-cell UNSAT result from being promoted
to an L1-S0-I or L1-S0-N UNSAT claim.

## Truthful status and claim vocabulary

| Term | Required evidence and meaning |
|---|---|
| `PREPARING — NOT LAUNCHED` | No computation job exists; only prelaunch work is occurring. |
| `LAUNCHED` | A recorded command, start timestamp, governed output root, and live PID or scheduler job exist. |
| `RUNNING` | The recorded job is currently live. “Computation is underway” is reserved for this state. |
| `SAT_EXACT` | One named bounded cell has a rational witness and independent exact replay of every active manifest constraint. It is not a source-universal or Lean claim. |
| `UNKNOWN_FIXED_ORDER_UNSAT` | The solver returned UNSAT for one serialized order; at L1 scope this remains `UNKNOWN`. |
| `UNKNOWN_TIMEOUT` / `UNKNOWN_NONRATIONAL_MODEL` | No accepted exact verdict for the cell. |
| `ENCODING_BLOCKED` | A source-legal cell has no implemented encoder/replay path. |
| `UNSAT_EXACT` at L1 scope | Reserved for an exact argument covering every required legal cell, with independently checked certificate or extracted contradiction. The present canary cannot emit this claim. |

A result field should prefer `bounded_l1_cell_sat` or
`l1_existential_witness_claim` over an ambiguous `full_L1_claim`. If the latter
name remains for schema compatibility, its prose meaning must say “all active
constraints hold for this serialized bounded cell,” and separate booleans must
remain false for exhaustive, source-universal, Lean, and promotion claims.

## Launch record

```text
executed commit:       bd86913fd06a9454e9e1cc6b7286627739ead391
working script SHA-256:0b131fda6cd4f10ec678e747bff9377405b6e529321169d9db7751669ff3b174
launch command:        uv run python scripts/rigid221_s0_full_l1.py --output-dir scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/artifacts/primary --workers 20 --timeout-ms 600000
PID / terminal session:92665 / 82463
start timestamp:       2026-08-30T06:28:16Z
end timestamp:         NONE
wall / CPU time:       NONE
cell verdicts:         NONE
accepted result hashes:NONE
```

This is a launch snapshot, not a mathematical result. Final fields must be
replaced from authenticated run data after process completion.
