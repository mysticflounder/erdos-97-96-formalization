# Scratch worktree cleanup — 2026-08-28

## Outcome

The first governed cleanup wave is complete and independently verified. It
moved 810 dormant, untracked files from `scratch/` to the recoverable NFS
quarantine at:

```text
/opt/nfs/erdos-97-96-formalization-scratch-quarantine-20260828
```

The authenticated set contained 60,003,326,794 logical bytes and
60,004,823,040 allocated bytes (about 55.9 GiB). Every source was copied,
SHA-256 verified at the destination, durably synced, and only then unlinked.
The completion check found zero errors, zero missing destinations, and zero
remaining sources. The independent final verification rehashed all 810
destination files and matched the local and NFS receipts.

The authoritative receipt is
`certificates/scratch_worktree_cleanup_quarantine_20260828_v1.json`:

- frozen-plan receipt SHA-256:
  `396096ed7b7b873961dfd4471ad020decaa94748af0dadec57f436bc322aa4f6`;
- frozen candidate-set SHA-256:
  `15a51986c64528e5b6206f8568e01d95b3f8cf8c277b35e28981768f25af6214`;
- complete receipt self-hash:
  `879407127219952323cf62c8f97ed5036f23538cfc9f00b14e14957bede4755f`;
- complete receipt file SHA-256:
  `f8f94c8e36563ab30aebbeee45742e87dba006a048581563bd16fb52e9f85c34`.

## Quarantined scope

| Source scope | Files | Logical bytes |
| --- | ---: | ---: |
| `scratch/.audit-quarantine/` | 661 | 54,121,861,927 |
| `scratch/quarantine/` | 34 | 2,728,989,798 |
| `scratch/v5-debug/` | 2 | 677,330,428 |
| `scratch/v6-debug/` | 1 | 338,666,102 |
| `scratch/v7-debug/` | 1 | 338,666,458 |
| Generated report/status files directly under `scratch/` | 111 | 1,797,812,081 |

The empty local directory shells are harmless and do not appear in Git.
No registered `scratch/runs/` payload was moved.

## Safety preflight

The move was gated on all of the following:

- exact equality with the frozen 810-record candidate list;
- no tracked candidate overlap;
- no live open handle on any candidate;
- no active scratch writer found in the process audit;
- no non-historical tracked or untracked reference to a candidate;
- unique regular source files only (no symlinks or hardlinks);
- a held, no-follow source-parent descriptor through final stat and unlink;
- no-follow, single-link destination and receipt verification;
- durable sync of every new or resumed destination directory and its parent;
- an independent read-only safety review, which passed under the cooperative
  concurrent-agent threat model.

The only allowed references were frozen worktree-hygiene snapshots and the
cleanup's own receipt/script/report. Those snapshots are passive inventories,
not consumers of the quarantined payloads.

## Deliberate exclusions and remaining bulk

This wave did not mutate active, mixed-ownership, registered, or recently
written roots. At the post-cleanup checkpoint, the principal remaining local
allocations were:

| Root | Allocated size (approx.) | Reason excluded |
| --- | ---: | --- |
| `scratch/runs/` | 523.8 GiB | Governed run roots and retained evidence; requires a separate manifest-aware wave. |
| `scratch/census-554/` | 232.6 GiB | Large mixed corpus; ownership/reference status not yet cleared. |
| `scratch/p97-distinct-distance-lane/` | 167.4 GiB | Research lane payload; not cleared as inactive. |
| `scratch/atail-force/` | 91.1 GiB | Solver lane payload; not cleared as inactive. |
| `scratch/exact12-overlay-20260810/` | 7.9 GiB | Recently written and therefore excluded. |

`scratch/` still occupied approximately 1,156.7 GiB and had 249 Git status
entries at this checkpoint. The next cleanup should be a separately frozen,
manifest-aware `scratch/runs/` wave; it must not reuse the older unlinking
prototype in `scratch/runs/scratch-runs-cleanup-20260824/cleanup-v1/` without
another safety review.

## Replay and verification

The cleanup implementation is
`scripts/quarantine_scratch_cleanup_20260828.py`. To recheck the completed
quarantine without changing data:

```bash
uv run python -B scripts/quarantine_scratch_cleanup_20260828.py verify
```

Recovery is path-preserving: each file is stored below the NFS root at its
original repository-relative `scratch/...` path. The complete receipt is also
stored at `_manifest/scratch_worktree_cleanup_quarantine_20260828_v1.json`
inside the quarantine.
