# Exact-12 source-order v27 receipt — 2026-09-04

This is the bounded H4 remediation receipt for lane
`source-order-v27-receipt-20260904`, run `run-0001`. The lane checkpoint is
[`source-order-v27-receipt-20260904.json`](../../.codex/worktree-checkpoints/source-order-v27-receipt-20260904.json)
and the retained run artifacts are under
[`run-0001`](../../scratch/runs/source-order-v27-receipt-20260904/run-0001/).

## Result

The repository producer completed a one-second-bound local SAT canary. It
returned `SAT_WITNESS_REPLAYED` / `STRUCTURALLY_UNRESOLVED` with exit 0 after
269.6 seconds of materialization and solving. The replay flags were all true:
candidate, added constraints, named deletion arm, exact CNF, and canonical
static extension.

The source-order repair is present and authenticated inside the producer
artifacts:

- 81 entries, bank digest
  `cedf416274a28e0aaee1fe148986610fe7e0f81ca510cae5a69b43af3aa4348c`;
- installation digest
  `f6860ff742497fcc34a45dddcb7717cdd4b92c3c653ff790adccfdee973be7f2`;
- post-install dimensions 47,211 variables and 704,481 clauses;
- post-install CNF digest
  `82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78`;
- the final 704,710-clause CNF is retained as `discovery.cnf` (it has the
  frozen final digest `8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f`).

## Exact invocations

Producer (supported module invocation; the direct script form is invalid here
because the producer uses package-relative imports):

```text
UV_CACHE_DIR=scratch/runs/source-order-v27-receipt-20260904/tmp/producer-tmp/uv-cache uv run python -m census.card_head.exact12_next_row_arm_static_canary --repo-root . --workdir scratch/runs/source-order-v27-receipt-20260904/run-0001 --arm-cell-index 6 --timeout-seconds 1 --nice 19 --legacy-local-discovery
exit 0
```

Frozen v27 validator attempt:

```text
UV_CACHE_DIR=scratch/runs/source-order-v27-receipt-20260904/tmp/producer-tmp/uv-cache uv run python -m census.card_head.exact12_next_row_arm_static_v27_validator scratch/runs/source-order-v27-receipt-20260904/run-0001 --repo-root .
exit 2
```

The validator stopped at its first required missing input:
`[Errno 2] No such file or directory: 'piqd-journal'`. Legacy-local mode does
not create the fresh PIQD descriptor/custody journal required by the v27
validator. This is a fail-closed validator limitation, not a fabricated
validator pass; the exact attempt is retained in `validator.json`.

## Historical pre-fix regression

Current code does not expose a historical witness fixture or API. The closest
observable pre-fix failure mode is duplicate source-order installation, and the
current regression rejects it. The fresh tests were:

```text
UV_CACHE_DIR=scratch/runs/source-order-v27-receipt-20260904/tmp/producer-tmp/uv-cache uv run --with pytest pytest -q census/card_head/tests/test_exact12_v14_source_order_bank.py -k 'installs_clause_exactly_once or tampering_fails_fresh_rebuild_gate'
exit 0
2 passed, 6 deselected, 6 subtests passed in 1246.14s
```

`test_installs_clause_exactly_once` rejects a second installation, and
`test_tampering_fails_fresh_rebuild_gate` rejects mutated source-order
certificates. This is explicit current-code regression evidence; it does not
recover an absent historical witness.

## Retained hashes

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| `source_order_bank.json` | 6,362,792 | `a0d8d396da07c31ba4fa19694b4d9b1943126b80de84a7a3fd83190c88780892` |
| `source_order_installation.json` | 668 | `916ca266c4a81a56c09a0044527c2b2ca59ed91d14a35cf8003c2443deaab50a` |
| `discovery.cnf` | 14,463,719 | `8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f` |
| `survivor.json` | 340,095 | `6641b1e0ba3c991df462f3fd22572ba4eebfc34964c6170bc00c9f69040e4123` |
| `summary.json` | 9,417 | `e6f2c979a11addc4854d0f331759dcd40bdb7606f2e83fa7d367cb2d6bd334e4` |
| `receipt.json` | — | `9f6b0c07e8f442274dcdce32ac4ea1ae9dfb86cc0bba60b427cb37341774e9e6` (self-hash field) |
| `run_manifest.json` | 1,101 | `a6f53a03c14c363d38f21c53a21e4c65e516665b406227307770b893c01688c3` |

The run manifest binds base head
`dae2e850eae19dca1fb59a431feacc7beccc8637`; its own manifest digest is
`e875f00071a9b527ea65b372154075e500a5cd5ed79d44537c854a32866d0f62`. The lane
checkpoint digest is
`c2b253244fb5589db1f00a194234363283560874715c9e5125bd85580ccc24ab`.

## Scope and limitation

This receipt establishes a reproducible source-order installation and bounded
SAT/replay canary with retained artifacts. It does not establish terminal
UNSAT, a Lean proof, universal coverage, or v27 validator certification. No
source files were edited, and no staging or commit was performed.
