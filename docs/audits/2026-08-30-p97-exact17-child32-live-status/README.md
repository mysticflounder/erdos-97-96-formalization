<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 exact-17 child-32 live-status retention — 2026-08-30

- Classification: `HISTORICAL_OBSERVATION_ONLY`
- Imported: 2026-08-31T06:40:17Z
- Source: untracked `rustprojects/scratch/live-exact17-detail.jsonl`
- Primary raw snapshot: 5,751 bytes across four JSONL records
- Raw SHA-256:
  `573420715835c38bade736706525ee2c871a07f8d35c25d6d5220af6f25998b0`
- Adjacent retained summary: child-25 job `ee45af01-...` extracted from
  `rustprojects/scratch/live-jobs.json` at JSON pointer `/jobs/36`

This bundle retains the exact-17 material in the audited Rust workspace scratch
tree that was not fully represented by a tracked artifact here. The raw
child-32 snapshot is preserved byte-for-byte in
`live-exact17-detail.jsonl`. The only additional exact-17 row in the broad
50-job listing is preserved separately in
`adjacent-child25-live-job-summary.json`; the other 49 summary rows are not
retained. `provenance.json` records both origins and limits, and `SHA256SUMS`
authenticates the retained bundle files.

## Retained observations

| Job | Observation | Retention significance |
|---|---|---|
| `547cca82-e479-468c-abe1-fb318d7004e6` | Child-32 restart completed `UNKNOWN` after SIGTERM. | The terminal quarantine is already represented in local scratch evidence and prose; this row adds the daemon's `run_epoch: 0` field. |
| `2506986e-0445-465f-9b05-eff6bb9a5983` | Child-32 job completed `SAT`. | Earlier documents that call this job `prepared` describe an earlier checkpoint. This later status has no model blob and, by itself, supplies no model-replay evidence. |
| `ab289b3f-a306-4de7-a52f-619ea4dbe049` | Tiny synthetic smoke job completed `UNSAT` with a 10-byte compacted-LRAT proof over a 19-byte CNF. | Mechanism test only; its proof and replay evidence are already present under the existing child-32 scratch tree. |
| `32519563-315b-49a7-a3c0-5c78955ef00e` | Tiny synthetic smoke job completed `SAT`. | The full live record was unique; the current worktree previously retained only a nine-field summary. |
| `ee45af01-c366-4cfd-8737-cdad428e262a` | Adjacent child-25 job completed `SAT`; the summary says no proof was retained. | This job ID did not occur elsewhere in the repository. Only the nine-field source summary is available. |

The later terminal state for `2506986e-...` does not invalidate the dated
checkpoint text in
[`../../piqd-sat-cegar-adoption-gaps-2026-08-08.md`](../../piqd-sat-cegar-adoption-gaps-2026-08-08.md)
or
[`../../specs/p97-exact17-cap9-lean-to-sat-route-v1.md`](../../specs/p97-exact17-cap9-lean-to-sat-route-v1.md).
Those documents subsequently move the frontier past child 32. This bundle
records the later observed job state without rewriting their historical
sequence.

## Limits

- The source was an untracked scratch file with no source manifest. Its raw
  digest authenticates the retained bytes but does not independently attest
  how the external file was produced.
- The child-25 record is an exact extraction of one JSON object from
  `/jobs/36` in the separately hashed `live-jobs.json`; the broad source file
  is not retained in full.
- These are PIQD status records, not CNFs, models, proofs, producer manifests,
  coverage receipts, or Lean declarations.
- `SINGLE_PROCESS_NO_PARALLEL_FLAG` attests one observed solver process and no
  parallel flag; it is not an operating-system CPU-allocation guarantee.
- The snapshot alone establishes no theorem, source coverage, exact-17
  closure, V8 packet recovery, or promotion authority.
- In particular, the `2506986e-...` record has `model_blob_hash: null`. Any
  claim based on a retrieved model must use the separate existing replay
  evidence, not this status row.

## Excluded Rust scratch material

The retention audit deliberately omitted:

- the full `live-jobs.json`, a broad 50-job volatile listing; its one exact-17
  row outside the child-32 detail file is retained separately, while the other
  49 summary rows are omitted;
- `piqd-decomp-001/`, whose patches and test logs duplicate PIQD campaign code
  already present in the Rust workspace;
- `piqd-decomp-approval.json` and `piqd-decomp-recall.json`, which are memory
  search exports rather than primary evidence;
- `audit-curl.out`, an untimestamped daemon response with no unique exact-17
  content; and
- empty scratch directories.

No V8 CNF, producer manifest, wave manifest, or portfolio artifact was present
in the Rust scratch tree.

## Verification

From this directory:

```bash
shasum -a 256 -c SHA256SUMS
jq -c . live-exact17-detail.jsonl >/dev/null
jq -e '.id == "ee45af01-c366-4cfd-8737-cdad428e262a"' \
  adjacent-child25-live-job-summary.json >/dev/null
test "$(wc -l < live-exact17-detail.jsonl)" -eq 4
```
