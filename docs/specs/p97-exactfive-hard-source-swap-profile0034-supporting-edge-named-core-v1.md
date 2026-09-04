# Profile 0034 supporting-edge named-core lane v1

Status: discovery-only PIQD plan. The real run has not been launched.

## Purpose

This lane asks Z3, through the maintained PIQD SMT adapter, for named UNSAT
cores from the two supporting-edge mirror cells that returned Z3 UNSAT in the
completed parent run. It also runs fresh positive and negative named controls.

The output is a Z3-returned core. It is not a minimal core. Any claim about
minimality requires a later deletion campaign in fresh one-solve sessions.

Every claim flag is `false`, including theorem, promotion, Lean ingress, source
realization, source completeness, full order elimination, live closure, and
core minimality.

## Authenticated parent

The parent root is:

`scratch/runs/exactfive-hard-source-swap-profile0034-supporting-edge-qfnra-piqd-20260904/run-0001`

The successor pins and reconstructs these records:

- producer SHA-256:
  `75cf96e48d7f0ceb89c965e3cec0d5315107b128540c608f350420689b641534`;
- manifest file SHA-256:
  `c1192f3afed7e089b8fbb7e49e8c4deec2cda36717e9cec537e3bf63689b96c5`;
- manifest self-hash:
  `6e469b3048aec1f26e1c94e644adf570752eaea49ee1dd91c60b3605d5ac50c4`;
- launch file SHA-256:
  `faedccc1afaa8050ac1b5d7a702dcadbbf0be6e7a5cceb8e0ae11bb45b16a250`;
- launch self-hash:
  `28547a2032ae396844226c89851524a24f4583b8b2824f445fe658bf1bf12997`;
- terminal file SHA-256:
  `09c2e3d4a9839814bf7c2c5dd4fd88b10002188acbb94d10c02be01c0954823f`;
- terminal self-hash:
  `db6ec92b4f2047722d3934abdac0d8bd79512768b3dc52b67cbedf71750513a5`.

All six parent result files are pinned byte-for-byte:

| parent key | result SHA-256 |
| --- | --- |
| `control-positive` | `e42993df0dcecbd3cb0e77c43c89f695312f7907895eb5a8edc2a4e43fef5b42` |
| `control-negative` | `87ddb18b3f98d90b6349166417f3f23da223b04f2896e7b1cd52898ff683576d` |
| `parent-z3-mirror-radius-lt` | `be1f7d987e3da0cdfe2d3219e4b65fd45990915171fb75af942e1ca5678f7ae3` |
| `parent-z3-mirror-radius-gt` | `0cd5f030409ca464369af8b7123bd07fd4d75bce020bf7b8f1666e23c2dedf5c` |
| `parent-cvc5-direct-radius-lt` | `44cd395e4db75d0bf340710e982d003915a2f21d70703f00bad6c266562a259e` |
| `parent-cvc5-direct-radius-gt` | `608ac1a197610163fcf2a7bb1073e30c5d640b94469aa242f4b944778b84c683` |

Parent custody reconstructs the terminal from all six authenticated result
trees and checks the launch execution commit. It also checks that each mirror
cell has the ordered engine statuses `Z3 UNSAT`, `cvc5 UNKNOWN`.

## Four-cell plan

Cells run in this fixed order:

1. `z3-control-positive`;
2. `z3-control-negative`;
3. `z3-target-mirror-radius-lt`;
4. `z3-target-mirror-radius-gt`.

The controls finish first and are validated before target submission. The two
targets are then submitted concurrently. The worker count is in `1..4`, with
default `4`. The default requested solve timeout is 60 seconds.

Each cell uses one fresh Z3 session and one solve. Session IDs must be nonempty
and distinct. Prior receipts, session resume, and receipt resume are rejected.
Successful custody requires the closed-session record.

## Target ledger

Each target preserves the parent assertion order and has 156 named assertions:

| label family | count | source |
| --- | ---: | --- |
| `supporting-edge` | 143 | the 13 directed cycle edges against 11 other vertices |
| `source-row-equality` | 11 | the parent source-row equality ledger |
| `radius-branch` | 1 | the selected strict radius branch |
| `source-strict` | 1 | the retained source strict inequality |

Stable IDs use zero-padded indexes, such as `supporting-edge-000`. The Boolean
term is derived from the ID. Each label record binds the term, ID, family,
index, source entry, source assertion body, source-system hash, and ledger hash.
Its `label_sha256` is a self-hash of that complete record.

Flattening `source_commands` from the ordered label ledger must reproduce every
parent assertion in order. Joining the stored unguarded commands with newline
bytes must reproduce the stored parent-journal hash. The guarded journal keeps
the parent logic and real declarations, declares one Boolean term per label,
and emits one implication per label.

## Result acceptance

The positive control must return SAT and pass the parent's exact rational model
replay. The negative control must return UNSAT with named-core provenance.

Both targets must return raw `UNSAT` with effective status
`UNSAT_DISCOVERY_ONLY`. Accepted provenance has:

- basis `get-unsat-assumptions`;
- daemon field `core`;
- `terminal_unsat: false`;
- `named_core_support: true`;
- a nonempty, duplicate-free term list;
- exact term-to-ID-to-label correspondence; and
- the full ordered label list used in the solve request.

The session create request, empty pre-append frontier, post-append frontier,
solve request, live session, receipts, exported journal, lifecycle, solve,
closed session, local result digest, daemon digest advisory, and all artifact
hashes are checked. Unknown, SAT target, transport loss, empty core, terminal
UNSAT without named provenance, unknown label, reordered label list, stale
receipt, open session, extra key, extra file, or unsafe path fails closed.

## Run custody

The checked-in initial root contains only `run_manifest.json`. Its
`base_head` is the lane checkpoint base, not a later commit.

Before launch, the runner recomputes every source digest in the manifest and
requires every source byte string to exist unchanged at the exact current Git
commit. The commit hash is recorded in `launch.json`. Thus an uncommitted or
stale source cannot launch.

Launch and terminal files are write-once. A completed terminal is replayed
without network access. Replay authenticates the source commit recorded in the
launch, so later unrelated `HEAD` advances do not invalidate a completed run.
A launch without a terminal is never resumed; use a fresh run ID. Partial query
output is not accepted as resumable state.

## Invocation

Initialization validation only:

```bash
uv run python scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py --init-only
```

Real launch, only after the owned source set is committed and the manifest is
refrozen:

```bash
uv run python scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py \
  --timeout 60 --workers 4
```
