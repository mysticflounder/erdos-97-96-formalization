# Child32 known-UNSAT PIQD smoke

Date: 2026-08-12/13 UTC
Job: `ab289b3f-a306-4de7-a52f-619ea4dbe049`

## Terminal record

`GET /jobs/:id` via `PIQD_URL=http://127.0.0.1:7272 piqc status <id>` returned:

- `status=completed`, `result=UNSAT`
- backend `cadical`, solver profile `sat`
- daemon SHA-256 `bb1c0283b3358219559f42bc2685c58d4728858ef5bf7a893b3a854f9958bad9`
- daemon identity hash `6d463b09e28eadaaab30cf5ec0337221e1cf27f0075a6db9a82d1a9f627c8060`
- manifest solver SHA-256 `0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`
- `attested_solver_processes=1`, basis `SINGLE_PROCESS_NO_PARALLEL_FLAG`
- CNF blob hash `ac42a371b5a124286c410ed5dfa2e3be7ee7d5b1feac6f08e7e1715f0c3669a8`
- producer-manifest blob/hash `0127121c8efb798b668769ea5bbd28c4a77de439de606a386d20ee5f6a5cb333`

## Stored artifact checks

Retrieved with:

```bash
PIQD_URL=http://127.0.0.1:7272 piqc job cnf ab289b3f-a306-4de7-a52f-619ea4dbe049 --out job.cnf
curl -fsS http://127.0.0.1:7272/jobs/ab289b3f-a306-4de7-a52f-619ea4dbe049/blobs/0127121c8efb798b668769ea5bbd28c4a77de439de606a386d20ee5f6a5cb333 -o producer-manifest.blob
```

The stored CNF is 19 bytes:

```text
p cnf 1 2
1 0
-1 0
```

`sha256sum job.cnf` equals the daemon CNF hash above, and `cmp` succeeds against both local inputs `../piqd-child32-smoke-unsat.cnf` and `../preflight/known-unsat.cnf`. `sha256sum producer-manifest.blob` equals the daemon manifest hash and `cmp` succeeds against `../piqd-child32-smoke-unsat.json`.

## Proof retrieval and replay

```bash
PIQD_URL=http://127.0.0.1:7272 piqc job proof ab289b3f-a306-4de7-a52f-619ea4dbe049 --out job.proof
sha256sum job.proof
PYTHONPATH=. uv run python scratch/exact17-lean-to-sat/child32-unsat-smoke-ab289b3f/replay_job.py
```

The proof endpoint returned `content-type: text/plain`, `content-length: 10`, and `x-proof-blob-hash: 2e9bf73f333fd3624376d1eb676ce8d6240ba39924936c22bc1a522bfb01b8cc`; the local byte hash matches. Bytes are `3 0 1 2 0\n`, a compact LRAT proof (PIQD source path is raw DRAT -> `piqd-lrat` -> LRAT). The independent replay uses `LeanLratReplayer`, emits its own `verifyCert_correct` checker, and runs pinned `lake env lean` with `native_decide`.

Replay output:

```text
{"verified":true,"returncode":0,"checker_source_sha256":"86f9650ed286359d18f953043c4a2b28630989a986792c673cf96342d2da40e8","receipt_sha256":"0e683127d9990c10cd450eb20a4822164cc1fc2470a88da541afb012dfc2522d","wave_manifest_sha256":"ce94be6ab8b8b71bd26a28834e23ced13d5d63e74f5f69c24bd8167743a26343","validation":"PASS"}
```

The earlier `drat-trim` run (`rc=0`, `s VERIFIED`) is retained only as an auxiliary check; it is not the authoritative replay for this compact LRAT artifact.

## Scope and gap

This is a one-variable known-result smoke only: the replay receipt uses the
explicit synthetic smoke wave binding in `replay_job.py`, so it does not claim
child32 coverage or a production-root submission. The status JSON did not carry
a proof hash field; the proof endpoint's `x-proof-blob-hash` and local SHA-256
provide that binding.

No production child32 root was submitted or modified.
