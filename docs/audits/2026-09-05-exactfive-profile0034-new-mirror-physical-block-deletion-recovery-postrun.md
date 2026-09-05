# Exact-five profile 0034 NEW-mirror physical block-deletion recovery postrun

Date: 2026-09-05

Status: authenticated diagnostic complete; no source, theorem, promotion, or
closure claim.

## Outcome

The fresh recovery run completed successfully with strict offline verification.
It used execution commit
`eab46043e52350b1ffa805325acb4d2577655659`, a fresh request namespace and run
root, and `resume: false`. Runtime was 3m52.590 wall time (12.634 user,
2.161 sys). The run manifest self-hash is
`13a6d03f7d1fef460a39c5a459313dee510667a1410f5a7093c810754887190b`.

The run completed 60 queries in 19 rounds. Dispositions were:

- 1 `SAT_REPLAYED` control;
- 38 `SAT_REPLAY_UNRESOLVED`, all `BoSourceQfnraError` with
  `exact_readback_unsupported`;
- 5 `UNKNOWN`;
- 16 `UNSAT_CUSTODY_VALID`.

No resume, replay, tombstone, or nonregular-file event occurred. The
independent audit passed all 759 engine-artifact and 120 receipt checks, with
source 5/5, input 11/11, round 19/19, and result 60/60 hash checks passing.

## Retained sets

The GT branch retained exactly eight groups:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
source-row-equality-00, source-row-equality-01,
source-row-equality-03, source-row-equality-05
```

Its retained-set hash is
`b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9`.

The LT branch retained exactly nine groups:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
edge-index-06, source-row-equality-01, source-row-equality-02,
source-row-equality-03, source-row-equality-05
```

Its retained-set hash is
`c38f1b732a8fc0b8043ca1b4181af97e828c273600273ba98e5b0282aef0a92c`.

Both branches stopped at `singleton-unresolved`; `deletion_stable` is false
for each branch. The terminal record keeps every claim false, including
core minimality, source realization, theorem, Lean ingress, promotion, and
live closure.

## Completed-wave mine and next action

The completed-wave mine produced no theorem candidate. Next, independently
confirm the exact reduced LT and GT sets, then perform the singleton/core audit.

Recovery is deliberately separate from the incomplete predecessor. For the
failure boundary and missing-candidate record, see the [run-0001 failure
audit](2026-09-05-exactfive-profile0034-new-mirror-physical-block-deletion-run0001-failure.md).
The governing [recovery specification](../specs/p97-exactfive-profile0034-new-mirror-physical-block-deletion-recovery-piqd-v1.md)
and [recovery producer](../../census/card_head/exactfive_profile0034_new_mirror_physical_block_deletion_recovery_piqd.py)
define the fresh-root, fail-closed readback, and custody rules; the [runner](../../scripts/run_exactfive_profile0034_new_mirror_physical_block_deletion_recovery_piqd.py)
records the launch contract.

## Evidence

- Run root: `scratch/runs/exactfive-profile0034-new-mirror-physical-block-deletion-recovery-piqd-20260905/run-0001/`
- Launch record: `events/launch.json`; terminal record: `events/terminal.json`
- Strict offline verifier: pass
- Recovery manifest self-hash: `13a6d03f7d1fef460a39c5a459313dee510667a1410f5a7093c810754887190b`
