# `scratch/runs` authenticated quarantine — 2026-08-28

## Outcome

The cleanup completed with a `VERIFIED_COMPLETE` post-delete verification.
It moved 36 unreferenced files into a path-preserving NFS archive and reclaimed
4,155,957,248 allocated bytes (4,155,896,064 logical bytes) from the worktree.
No directory pruning was performed.

The initial mechanical predicate identified 3,297 candidate files. A fresh,
fixed-point reference scan promoted 3,261 of them into preservation because
tracked, retained, ignored, or otherwise present repository artifacts referred
to them directly or transitively. Those promoted files account for
351,131,862,804 logical bytes and 351,138,402,304 allocated bytes. Archiving
them would have broken retained SAT-portfolio and provenance consumers, so this
wave deliberately archived only the 36-file zero-reference remainder.

## Authentication record

- Plan SHA-256: `e1071309aacbe74af6c9e8f7c89b7808d6ba1a54e721e64c57b3212ffaa918b0`
- Complete receipt SHA-256: `80502a7e76728e96acc069e85f879133f82cdc3c1fdaece448103593fbe9cb8e`
- Run-manifest file SHA-256: `a98ffc144b4cebd7938a6cb4b508fda575f32173d3846571f4575f954351ba0a`
- Preservation-manifest SHA-256: `999b378c7bf96f4438e519943fc586393ab0a25a41e26ad7e5e8c66b52256895`
- Checkpoint file SHA-256: `ce1dbb476034088ada563e84a96717dc7a1afea594af86fdc38c08dfc83bd88c`
- Mover source SHA-256: `d6b45fa63e285a4e2bbf4ac7135c6754f7027eac486fa9e61d522702797524e5`
- Candidate manifest SHA-256: `e06fbceba0204c6059257c9d513de48a9afab77102d31b0eceaeb7da4405b8d7`
- Candidate-content SHA-256: `e221c13c92be69138153ebf415cdb48f4f18de520d8a836424ce13cffc3ab9cf`
- Archive SHA-256: `a03cbce94e89efec65027001016fee7d00479636e1cf690fc081e48c206f303f`
- Archive size: 28,796,199 bytes
- Verified members: 36
- Errors: none
- Pending parent fsyncs: none
- Still-present candidates: zero

The archive and its authenticated manifests are under:

```text
/opt/nfs/erdos-97-96-formalization-scratch-runs-quarantine-20260828/
```

The archive itself is:

```text
/opt/nfs/erdos-97-96-formalization-scratch-runs-quarantine-20260828/scratch-runs-candidates.tar.zst
```

The local complete receipt is
`certificates/scratch_runs_quarantine_20260828_v1.json`. The frozen plan,
candidate manifest, preservation manifest, candidate-content manifest, and run
manifest remain under
`scratch/runs/scratch-runs-quarantine-20260828/archive-v1/`.

## Safety gates

The mover:

1. preserved tracked, checkpoint-durable, manifest, provenance, ambiguous
   proof/report, runtime-evidence, and 36 explicitly protected top-level roots;
2. scanned regular files plus lexical symlink targets for exact candidate
   references, including sentence punctuation and JSON slash escapes;
3. computed reference preservation to a fixed point before hashing candidates;
4. checked open files and process command lines before archive and unlink;
5. bound the checkpoint, mover source, run manifest, candidate manifest, and
   preservation manifest into the frozen plan;
6. streamed every candidate through SHA-256 while building the tar.zst archive;
7. independently decoded the archive with Zstandard `--long=31` and compared
   every member's path, size, and SHA-256 with the frozen manifest; and
8. used descriptor-relative no-follow identity checks, a parent-fsync WAL, and
   parent-directory fsyncs for the unlink pass.

The final verification independently replayed the archive, confirmed all 36
source paths absent, checked every preservation path present, confirmed the WAL
absent, and compared the local and NFS manifests and receipts byte-for-byte.

## Failed attempts retained

Two non-destructive attempts are retained below the governed lane root:

- `failed-attempt-zstd-decoder-20260828/`: the archive was built, but the first
  independent decoder lacked `--long=31` and correctly refused the frame. No
  source file was removed. The superseded NFS plan and preservation manifest
  are retained in the corresponding named NFS directory.
- `failed-refreeze-self-reference-20260828/`: preserving the first attempt
  inside the lane initially caused cleanup provenance to count as a consumer,
  producing a zero-candidate freeze. No archive or unlink ran from that plan.

The final mover narrowly excludes only its authenticated lane root and local
receipt from consumer discovery; identical references anywhere else in the
repository remain blocking. An independent adversarial audit passed this rule,
the fixed-point closure, no-follow symlink handling, writer checks, archive
verification, receipt bindings, and fsync/WAL behavior.

After completion, the hygiene checker found that the run manifest used
non-policy output-class names. A separately audited, one-shot chain repair
first replay-verified the COMPLETE state and snapshotted the old local and NFS
plan/receipt chain. It then changed only the run manifest's `output_classes` to
`["artifacts", "events", "tmp"]` and recomputed the dependent run-manifest,
plan, and receipt hashes. Candidate, preservation, content, archive, removal,
and archive-verification fields were unchanged. Full `VERIFIED_COMPLETE`
verification passed after republication. The old chain is retained under
`archive-v1/artifacts/pre-hygiene-manifest-repair-20260828/` locally and the
corresponding `pre-hygiene-manifest-repair-20260828/` NFS directory.

A second audited chain repair registered the retained root-level evidence in
the lane checkpoint and moved the runtime lock from `archive-v1/archive.lock`
to the policy-compliant `archive-v1/tmp/archive.lock`. Between the frozen
snapshot and that repair, the mounted worktree's device identifier changed
uniformly from `16777229` to `16777233`. The repair authenticated the migration
against all 301,152 preservation rows, with one exact exception for the known
run-manifest self-row left stale by the preceding output-class repair. It
retargeted the lock, refreshed current device metadata, and recomputed the
dependent preservation, run-manifest, plan, and receipt bindings without
changing candidates, archive content, or removals. A failed final check caught
a six-byte stale preservation total from that same run-manifest row; the
retained WAL then rolled only the local and NFS plan and receipt forward to the
correct total. The routine verifier subsequently returned
`VERIFIED_COMPLETE`, and the repair WAL was removed. Pre-repair chain history
is retained under `archive-v1/artifacts/pre-checkpoint-lock-repair-20260828/`
and its corresponding NFS directory.

## Recovery

Restore into a new empty staging directory first; do not extract over a live
worktree:

```bash
zstd -q --long=31 -dc /opt/nfs/erdos-97-96-formalization-scratch-runs-quarantine-20260828/scratch-runs-candidates.tar.zst \
  | tar -xvf - -C /path/to/empty/staging-directory
```

After extraction, compare the staged files with
`candidate-content.jsonl` and restore only the intended paths. The routine
verification command is:

```bash
uv run python -B scripts/quarantine_scratch_runs_20260828.py verify
```

At completion, `/opt/nfs` had approximately 1.5 TiB free. `scratch/runs`
still occupied approximately 520 GiB because the reference closure and the
explicit live/provenance protections retain the overwhelming majority of the
original payload. Further byte reclamation requires a reviewed consumer
rewrite or a whole dependency-closure relocation; it is not a safe mechanical
cleanup.
