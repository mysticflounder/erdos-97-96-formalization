# Projected-static-v3 producer custody v1

`scripts/run-p97-piqd-projected-v3-producer.py` is the narrow producer
adapter. It accepts only the current public unsharded projected-static-v3
bundle/profile. It authenticates the source and producer manifests, computes
the exact one-core raw-DIMACS identity, and then prepares one daemon job. A
production authority-v3 is downstream evidence minted after the completed SAT
job, not a prerequisite for creation. Offline `--check` may optionally
cross-bind a later authority with `--authority`.

Normal mode performs this fixed sequence:

1. Create a private mode-0700 output directory and singly-linked mode-0600
   files. Write the current base, manifests, and `prepare-wave.json`.
2. Make exactly one `POST /jobs/prepare-cnf`, with
   `requested_core_limit=1`. The exact response bytes are first preserved as
   `prepare-response.raw`; its UUID, preview, dimensions, blob digest, and raw
   identity must match the current bundle. A response reporting `existing=true`
   is rejected before any confirmation mutation. `prepared-job.json`
   is written only after these checks.
3. Rebind the exact base with one `GET /jobs/<uuid>/cnf`, then make exactly one
   `POST /jobs/confirm?job_id=<uuid>`. A create-once `confirm-intent.json`
   precedes the mutation. A 200 response must be the exact confirmed JSON
   response; an oracle-valid 409 is preserved byte-for-byte as opaque evidence,
   followed by one independent authoritative `GET /jobs/<uuid>` rebind. The
   409 body is never treated as a 200 response and confirmation is never
   retried. A transport exception leaves the outcome ambiguous; resume refuses
   to mutate again.
4. Poll only `GET /jobs/<uuid>` sequentially, up to `--max-polls`, sleeping
   `--poll-interval-s` between nonterminal responses. `queued`, `running`, and
   `confirmed` are nonterminal lifecycle states and must have no terminal
   result. The terminal response must be completed `SAT`, current-base/blob/raw
   identity bound, requested core one, and attested as one process with
   `SINGLE_PROCESS_NO_PARALLEL_FLAG`.
5. Preserve exact raw confirm, status, version, and solver-registry bodies;
   validate the current daemon/solver identities; record the confirm HTTP
   status and ordered status-file hashes; and write the canonical self-hashed
   `producer-result.json` last.

The output also contains `base.cnf`, `variable-map.json`, `source-bundle.json`,
`encoding-configuration.json`, `source-manifest.json`, `producer-manifest.json`,
`prepare-wave.json`, `prepared-job.json`, `prepare-response.raw`,
`cnf-response.raw`, `confirm-intent.json`, `confirm-state.json`,
`confirm-response.raw`, `status-NNN.raw`, `daemon-version.raw`, and
`solver-registry.raw`. These are finite adapter artifacts, not a proof,
theorem, global obstruction, universal lift, Lean closure, or source
entitlement; all such claims are explicitly false in the result.

Every producer artifact is opened without following links and must remain a
regular, singly-linked file owned by the current UID with exact mode 0600;
the output directory is owned by the current UID with exact mode 0700. These
identity and mode checks apply on resume reads and after each write.

`--resume` is permitted only for a locally preserved prepared artifact. It
never re-prepares. If confirmation has not been durably recorded, it performs
the one pending confirmation; an existing intent without an authenticated
confirm result is treated as ambiguous and aborts. Once confirmation is
recorded, resume is read-only with respect to PIQD mutations. `--check` is
offline-only and verifies the result self-hash and required raw custody.
The CLI accepts `--authority` only together with `--check`; normal production
mode rejects it because authority-v3 is downstream evidence.

Example:

```text
python scripts/run-p97-piqd-projected-v3-producer.py \
  --out /authority/producer-run \
  --piqd-base-url http://127.0.0.1:49943 \
  --max-polls 300 --poll-interval-s 2
```

No local solver, shard, worker, or thread is started by this adapter. PIQD
`SAT` remains discovery evidence only.
