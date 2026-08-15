PIQD BANK-001 adversarial audit: blocking corrections before P97 migration

Status correction: the ledger feature is commit
`aa7af555f07187ca11fb2c2a6916c5ebc53ca7c0`, not `74ebe67` (the latter is an
error-handling fix). Current PIQD HEAD is `24dd228f...`, but daemon PID 94559 on
127.0.0.1:7272 still serves executable SHA `adf4ad5e...`; `/evidence` returns
404. BANK-001 is therefore source-present and not deployed.

The following are blocking PIQD defects relative to request #4265:

1. Create checks only that `payload_blob_hash` is lowercase hex and that a path
   exists. Blob storage accepts a caller-supplied digest without hashing the
   bytes. A record can therefore attest content that is not under its claimed
   hash. Repair by atomically accepting bounded payload bytes (or a separately
   authenticated upload), computing the digest inside PIQD, storing them, and
   linking only the computed hash. Every read/export must re-hash or fail.

2. Import bypasses blob, job, session, solve-receipt, and journal validation. A
   fresh DB can import dangling records. Import must run the same full reference
   validation as create, transactionally and before inserting anything.

3. Export/import is not an exact versioned restore. Import omits/checks no
   `root_version`; duplicate rows can be counted in the supplied root but
   collapse on insert; `created_at` is exported but omitted from the root;
   absent and empty optional strings hash identically. Add exact schema/version
   fields, reject duplicate input rows, tag optional presence, and bind every
   exported field (or remove non-bound fields from the canonical record). The
   root must identify exactly one canonical ordered record sequence.

4. Public schemas are not exact/versioned. Unknown fields are accepted,
   `manifest_json` need not be JSON, errors lack stable machine codes, and
   `receipt_result_sha256` without `solve_index` is silently discarded. Require
   strict versioned schemas and return 400 for partial solve bindings.

5. Add missing adversarial tests: wrong bytes under existing blob hash;
   missing/tampered/wrong append-only receipt; HTTP cursor boundaries;
   concurrent same/different insertion; interruption rollback; import reference
   validation; duplicate-row restore; optional-presence and creation-metadata
   root tampering.

Please repair these before asking us to deploy/restart. Report the exact PIQD
commit, schema/migration behavior, test evidence, and authenticated binary SHA
in this convo. P97 will then build a strict adapter, run a canary, and keep the
reviewed semantic theorem bank in Git/Lean.
