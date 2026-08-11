# P97 PIQD theorem-bank migration v1

Status: **DRY_RUN ONLY**. This specification records the bounded inventory
boundary for maintainer request #4988. It is not a theorem declaration,
evidence attestation, source-entitlement decision, or proof-closure claim.

## Source inventory

The planner captures exactly these canonical registry components, in this
order:

```text
docs/general-n-certificate-bank-mining-2026-07-09.md
certificates/p97_rvol_general_n_mining.md
certificates/p97_rvol_general_n_mining.json
certificates/erdos97_legacy_general_n_mining.md
certificates/erdos97_legacy_general_n_mining.json
certificates/erdos_general_theorem_p97_mining.md
certificates/erdos_general_theorem_p97_mining.json
```

Each component is opened through a no-follow directory/file-descriptor chain,
must be regular with `st_nlink == 1`, is read under a per-component byte cap,
and is checked again by `fstat` after the read. The complete pathname is then
reopened/rebound and recaptured; exact bytes and SHA-256 must match, so
same-size/same-mtime drift and inode/path replacement fail closed. Absolute
paths, traversal, backslashes, symlinks, hard links, duplicate requested
paths, and TOCTOU identity changes fail closed. JSON components are strictly
parsed (duplicate keys, non-finite constants, invalid UTF-8, excessive depth,
and non-canonical scalar types fail). Their bytes must equal the committed
JSON format (`json.dumps(..., indent=2)` plus one final LF); original bytes
remain the custody bytes, while markdown is opaque exact bytes.

The canonical plan contains path labels, relative paths, byte sizes, SHA-256
digests, a deterministic inventory root, and a plan digest. `semantic_dedup`
is explicitly false: matching hashes do not infer semantic identity. All
theorem, evidence, source-entitlement, closure, and universal-promotion
claims are explicitly false.

## PIQD evidence audit

`audit_piqd_evidence` is read-only. It audits the current v2 export schema and
the keyset-paginated `/evidence` listing: exact field sets and Python types,
lower-case SHA-256 fields, manifest/content digest agreement, strict ordering,
canonical manifest JSON (including duplicate-key, depth, and scalar checks),
cursor advancement, page counts, export root recomputation, and equality of
the paginated listing to the export root. The auditor requires a non-empty
snapshot token on both export and every page. The current PIQD v2 export lacks
that token, so the auditor raises `PIQD_SNAPSHOT_REQUIRED` and does not claim
cross-page snapshot consistency. An injected blob loader may verify payload
bytes against `payload_blob_hash`; without one, payload custody is reported as
unverified. Response trees, strings, lists, aggregate strings, record counts,
and loaded payload bytes are bounded before hashing or record use;
`root_version` is exact-typed and exact-matched. A response, payload, cursor,
snapshot, or root mismatch fails closed. A full page must carry the exact
advancing cursor; a terminal full page is valid only when followed by a
same-snapshot empty page.

## Blob-ingress qualification (not migration)

Per maintainer ruling #5017/#5020, the endpoint `PUT /blobs/:hash` is available
as a byte-custody capability. The module exposes an injected-transport
qualification seam for it; this audit does not probe the live daemon and tests
use only fixture bytes and fake transports.
The request body must be exact `bytes`, bounded before transport use, and the
path is generated as exactly `/blobs/<lowercase SHA-256(body)>`. A successful
response must have exactly `{hash, bytes, already_present}` with exact types:
`201` requires `already_present: false`, while `200` requires `true`, and both
must repeat the request digest and byte count. `422` is accepted only as the
exact `{"error": <string>}` mismatch/no-write response and causes a fail-closed
rejection with no readback. An optional fake/injected `GET /blobs/:hash` check
requires status `200`, raw exact bytes, the same digest, and byte-for-byte
equality. This seam is not called by planning or APPLY and does not upload the
seven canonical sources.

The endpoint supplies byte custody only. It does not atomically bind those bytes
to an immutable evidence record, and it does not provide a snapshot-consistent
export token. Consequently it is a qualification result, not a capability
attestation or a canonical-bank migration authorization.

## Apply gate and remaining blocker

`apply_migration` is unconditionally disabled for the current build. A
caller-supplied capability or attestation cannot authenticate or prove a
future server endpoint, so every call raises `BLOCKED_ON_PIQD_FEATURE` before
any transport call, including calls with a convincing fake capability. It
never guesses at, or composes, the current split record/blob operations.
Before any future private apply path is introduced, public
`validate_migration_plan(plan, repo_root)` must recapture the closed canonical
seven sources and compare exact bytes, component hashes/sizes, manifest, root,
totals, and plan digest; a forged self-consistent dataclass is rejected.
Production planning has no registry-path override: the seven paths above are a
closed canonical set.

Therefore the remaining PIQD-core blockers are (1) a documented,
server-authenticated atomic batch endpoint with payload-plus-record custody and
(2) a snapshot-consistent export token/cursor contract. Any future contract
must also specify all-component batch atomicity, plan-hash idempotency,
server-side digest verification, rollback/no-partial-commit behavior, and
strict response status/schema/count validation. Snapshot-consistent
export/cursor semantics and stable custody/error guarantees must be
established by PIQD before canonical-bank custody is possible. P97 adapter
work still owns source entitlement, theorem/evidence classification, and any
Lean consumer promotion; these are adapter defects, not PIQD bugs, and this
planner does not promote candidates.

The proof-blueprint session `019fdf9c` anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remains
unchanged, open, and off-spine.

## Bounded validation

Run the executable test entrypoint from the repository root:

```bash
bash scripts/test-p97-piqd-theorem-bank-migration.sh
```

The tests use only temporary fake files and fake transports. They do not start
a daemon, submit a job, invoke a solver or Lean, or mutate PIQD.
