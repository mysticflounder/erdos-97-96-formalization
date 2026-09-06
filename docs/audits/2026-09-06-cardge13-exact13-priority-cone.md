# Exact-13 cell-12 priority/cone route test (2026-09-06)

## Scope

This lane is an **empirical bounded route test** for one catalog cell. It is
not source coverage, theorem promotion, a Euclidean counterexample, or closure.
The Boolean and cone producers both make formula-scoped claims only.

## Governance

- Lane: `cardge13-exact13-priority-cone-20260906`
- Worker: `CardGE13ConeSmith` (non-Luna solver worker)
- Checkpoint base HEAD: `0b02a614097133602c1079d919929c9042302a21`
- Checkpoint self-hash:
  `f4573bc885a09f36c519780bfe4bc7ca59c9810d635403f677784ac84ad19e83`
- Run manifest:
  `scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/run_manifest.json`
- Run-manifest self-hash:
  `365823ffb88f3e8be57af06d456659a6862363bc153d5eac5d377d4a0e8d01af`
- Run-manifest file SHA-256:
  `64f973399f76244a0be3ac8793874c1b917fe931b0b3a65d6c3a86b35fa87ecc`
- Catalog input:
  `scratch/runs/cardge13-exact13-coarse-cell-classifier-20260905/run-0001/artifacts/coarse-cell-catalog.json`
- Catalog input file SHA-256:
  `161e25d990ff527e3826af1a405d891540680bfc21e4a51bd62c144aeff4f160`
- The requested PIQD skill cache path at version `0.2.79` was absent. The
  installed successor at `0.2.80` was read completely and applied.

The manifest pins all nine Python producers used by the Boolean and conic
routes. No Lean file or source script was edited, and no Lake, staging, commit,
or push command was run.

## Boolean PIQD priority probe

The one governed probe used
`scripts/cardge13_exact13_coarse_cell_boolean_piqd.py` with repository root
`.`, the run manifest above, catalog cell index 12, Z3, `timeout-ms = 120000`,
and `max-refinements = 1000`. No `--seed-event` argument and no extra role or
row pin were supplied.

Cell 12 was:

- cell ID `direct-z09-k08-12`;
- orientation `direct`;
- `z = 9`;
- `K ∩ I2 = {8, 12}`; and
- `L ∩ I2 = {9, 10, 11}`.

Exact result:

- process exit: `0`;
- top-level solver status: `SAT`;
- CEGAR status: `REFINEMENT_BUDGET`;
- command count: `49,528`;
- initial conflict count: `21,842`;
- seed-cut count: `0`;
- refinement budget: `1,000`;
- solve count: `1,001` (initial solve plus 1,000 refinements);
- solve statuses: 1,001 `SAT`;
- model replay outcomes: 1,001 `SATISFIED`;
- PIQD session: `d45f09c1-f3ce-4644-8767-ec233ea5afea`;
- session close state: `closed`;
- solver signature: `z3-4.17.0`;
- solver SHA-256:
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
- final solve index: `1001`;
- final result SHA-256:
  `df45adfe7e8b0bba03d57449ad906ddfea54af1739ab60d67773c27877caa2b3`;
- final replay-script SHA-256:
  `dcb7b335bddeb793f2935fe6b564130b0545b3670878cf4d0c7311bf159b59c2`.

Outputs and hashes:

- Boolean event:
  `scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/cell-012-direct-z09-k08-12-priority.json`
- Event self-hash:
  `8931c8834825a6666b8905f8ce944a0ab9b649c4ce3b400121f28605f7e167a6`
- Event file SHA-256:
  `cbdf6f1b69a1c84ca5a3c256d13a3201291692efefa3b42856ea0137588f4c9e`
- Boolean journal:
  `scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/artifacts/cell-012-direct-z09-k08-12-priority.smt2`
- Journal SHA-256:
  `90e78d2e4ab809b0b1f8d1b8b1d405c177034ccb9176ec57d6aece535070693c`
- Journal size: `4,222,000` bytes.
- PIQD receipts:
  `/Users/adam/.piqd/sessions/d45f09c1-f3ce-4644-8767-ec233ea5afea/receipts.jsonl`
- Receipt count: `1,001` lines.
- Receipt-stream SHA-256:
  `1aaaa7ad57c8cf3866510ad67dc086c2ea45f29ba84121f7f1c352a5a2d08582`
- Receipt-stream size: `12,806,713` bytes.

Independent replay recomputed the event self-hash, manifest self-hash, journal
hash, and file hashes; checked all 1,001 stored replay outcomes; revalidated all
1,001 decoded models against cell 12; and matched the receipt count.

## Conditional full-cone attempt and blocker

Because the Boolean event ended in replayed SAT, the lane invoked
`scripts/cardge13_exact13_coarse_cell_conic_batch_piqd.py` on that exact event
with the same manifest, Z3, `timeout-ms = 120000`, minimum nonzero weight count
`1`, no maximum, and no `--exclude-zero` flag.

The producer failed closed before writing output or creating a PIQD session:

```text
ConicBatchError: run manifest does not anchor the source event
```

This is a manifest-ordering blocker. The required `run_manifest.json` existed
before Boolean generation and its self-hash is embedded in the Boolean event.
The conic producer separately requires the newly generated Boolean event path
and SHA-256 to have already appeared in that same manifest's `input_digests`.
The event digest could not be known before the event existed. Updating the
manifest afterward would change the self-hash already embedded in the Boolean
event and would break its immutable custody binding. Per instruction, neither
producer nor manifest was modified to bypass this check.

Planned but absent cone outputs were:

- `scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/artifacts/cell-012-direct-z09-k08-12-priority-cone.smt2`; and
- `scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/cell-012-direct-z09-k08-12-priority-cone.json`.

Both absence checks passed. Therefore there is no cone solver status, cone
receipt, cone hash, weighted cut, or cone semantic consequence for this lane.

## Hygiene

The preproduction report accepted the checkpoint and declared manifest after
the catalog input was added. At HEAD
`0b02a614097133602c1079d919929c9042302a21`, the repository-wide report still
returned `blocking: true` because the shared worktree contained foreign and
unregistered material. Its bounded summary reported 13,470 entries, nine
foreign dirty paths, 4,563 durable-untracked entries, 8,795 unregistered
generated entries, and 102 untracked-root spills. None was changed by this
lane.

The postproduction report ran at HEAD
`c7b9018808524a0a8792ecdccc62326044aa29e0`. It reported `issues: 0` for this
lane and still returned repository-wide `blocking: true` because of shared
state. The bounded summary contained 13,474 entries, 12 foreign dirty paths,
4,564 durable-untracked entries, 8,792 unregistered generated entries, 104
untracked-root spills, one expected checkpoint-control entry, and one owned
path entry. No foreign path was edited, moved, staged, or deleted.
