# P97 PIQD Singular execution-custody backend v1

Status: maintained caller contract. This adapter records and checks execution
custody only. It does not turn Singular output into a mathematical verdict.

Implementation:
`census/global_confinement/piqd_singular_backend.py`.

## Public API

```python
from census.global_confinement.piqd_singular_backend import (
    PiqdSingularCustodyError,
    PiqdSingularRunner,
    SingularExecutionResult,
    validate_artifact_directory,
)

runner = PiqdSingularRunner(
    base_url="http://127.0.0.1:7272",
    poll_interval_s=0.25,
    max_poll_s=3600.0,
)
result = runner.execute(
    script_bytes,
    source="census/global_confinement/equality_ideal_probe.py",
    project="erdos-97-96",
    request_id="caller-owned-at-most-once-key",
    timeout_s=300,
    output_directory=artifact_directory,
    source_context={"caller": "equality-ideal-probe", "row": 12},
)
```

`script` must be nonempty `bytes` and is capped at 16 MiB by this caller.
`source`, `project`, and `request_id` are
nonempty, NUL-free strings. The adapter limits them to respectively 400, 200,
and 200 UTF-8 bytes so it can add the source-context commitment within PIQD's
512-byte `source` bound. `timeout_s` is an exact integer in `1..86400`; a
boolean is not an integer here.

`source_context` must be an exact builtin dictionary and must be
canonical-JSON safe: string keys with values recursively composed of exact
builtin dictionaries, lists, strings, integers, booleans, and null. Floats,
subclasses, custom mappings, and custom values are refused before any mapping
hook or transport call. The adapter serializes and reparses one immutable
builtin snapshot before transport. Its compact, key-sorted, UTF-8 JSON
representation is capped at 1 MiB and hashed. The exact PIQD source is

```text
<source>#source_context_sha256=<64 lowercase hex characters>
```

Thus PIQD's own request identity binds the entire local context without asking
the daemon to know its schema. The full context remains in the standalone
manifest.

`output_directory` and the standalone validator's path must be exact native
`Path` values. Path subclasses and generic path-like objects are refused before
their hooks can run; `execute` performs this gate before contacting PIQD.

The runner is intentionally HTTP-only. A caller may own a PIQD data-root CLI
option for launching or documenting its daemon, but it must not pass a daemon
filesystem path into this adapter. Each execution gets a fresh
`output_directory`; reusing an existing directory fails.

`SingularExecutionResult` has exactly these public dataclass fields:

```text
run_id                 run_status              exit_code
stdout                 stderr                  script_path
stdout_path            stderr_path             receipt_path
manifest_path          request_sha256          result_sha256
script_sha256          stdout_sha256           stderr_sha256
source_context_sha256  receipt_sha256          artifact_sha256
replayed
```

For a valid `DID_NOT_START`, `stdout`, `stderr`, their paths, and their hashes
are null. They are bytes, paths, and hashes for every accepted started outcome.
`run_status` remains a process observation. In particular, `RAN` does not say
that a basis, ideal, equality, contradiction, or other mathematical claim is
correct.

## Wire contract

The adapter first computes the SHA-256 of the exact script bytes and sends them
unchanged with `PUT /blobs/:hash`. It accepts only a `200` or `201` response
whose exact JSON keys are `hash`, `bytes`, and `already_present`, and checks all
three values and types.

It then sends `POST /singular/runs` with exactly these six keys and no others:

```json
{
  "script_blob_hash": "<sha256>",
  "source": "<source plus context commitment>",
  "profile": "default",
  "timeout_s": 300,
  "project": "erdos-97-96",
  "request_id": "<caller-owned key>"
}
```

The pairing is exact: HTTP `202` requires `replayed: false`; HTTP `200`
requires `replayed: true`. A replay is the original run in its current state,
not a second execution.

Every submit or run view is checked against the following exact 26-key schema;
unknown and missing keys fail custody:

```text
id project request_id request_sha256 script_blob_hash source profile timeout_s
state run_status exit_code argv binary_path binary_sha256 env_sha256
stdout_blob_hash stderr_blob_hash stdout_truncated stderr_truncated
attested_processes attestation_basis result_sha256 wall_ms
created_at started_at finished_at
```

The closed state vocabulary is `queued`, `running`, `finished`. The closed
terminal vocabulary is `RAN`, `ERRORED`, `TIMED_OUT`, `DID_NOT_START`, and
`INTERRUPTED`.

- `queued` has a creation timestamp and null start, finish, and terminal
  fields.
- `running` has an ordered start timestamp and null finish and terminal
  fields.
- A finished started outcome has ordered timestamps; byte-exact stdout and
  stderr hashes; booleans for both truncation flags; binary, environment, and
  result hashes; and exact attestation
  `1/SINGLE_SPAWN_UNCONFINED_CHILDREN`.
- `RAN` requires exit code zero; `ERRORED` refuses exit code zero. `TIMED_OUT`
  retains PIQD's nullable exit-code observation.
- `DID_NOT_START` is accepted only with no exit code, environment, or stream
  hashes; false truncation flags; exact attestation
  `0/SOLVER_DID_NOT_START`; and a valid result digest. Null attestation is not
  zero and is refused.
- `INTERRUPTED` describes an unobserved run. Its outcome and attestation fields
  are null. The adapter rejects every `INTERRUPTED` receipt because execution
  custody is inconclusive; it never silently resubmits the script.

The canonical argv is exact and ordered:

```text
Singular -q -t --no-rc --cpus=1 --threads=1 --flint-threads=1 <data-root>/singular/<run-id>/script.sing
```

No `--no-shell` claim is made. The accepted attestation says PIQD spawned one
Singular process with its own parallelism flags pinned; Singular scripts can
spawn unconfined children.

Polling has both a 30-second per-request transport deadline and a caller-set
`max_poll_s` deadline. Run identity, request fields, creation time, start time,
and forward-only lifecycle are checked between polls.

After a conclusive finished receipt, the adapter retrieves
`GET /singular/runs/:id/script` and compares the opaque bytes both with the
receipt hash and the originally submitted bytes. For a started outcome it also
retrieves opaque stdout and stderr and verifies each receipt hash. Retained
streams are capped at exactly 16 MiB; a stream marked truncated must contain a
full 16 MiB retained prefix. `DID_NOT_START` has no stream retrieval.

## PIQD digest recomputation

The request digest is SHA-256 over the following byte concatenation. `len`
means UTF-8 byte length and the timeout is ASCII decimal:

```text
len(project):project
len(script_blob_hash):script_blob_hash
len(source):source
len(profile):profile
timeout_s
```

The displayed newlines above are explanatory only; the four length prefixes
are the delimiters and no newline is inserted.

The result digest is SHA-256 over these nine fields in order, with one newline
after every field, including the last:

```text
request_sha256
run_status
exit_code-or--
binary_sha256-or--
stdout_blob_hash-or--
stderr_blob_hash-or--
stdout_truncated-as-0-or-1
stderr_truncated-as-0-or-1
compact-JSON-argv
```

Both daemon digests are recomputed locally. Timestamps, run ID, binary path,
environment digest, wall time, and attestation remain receipt evidence but are
not members of PIQD's result digest.

## Standalone artifact

Publication is create-once. Every caller-supplied path component is traversed
as a directory without following symlinks; `..` traversal is refused. The
final directory must not exist. Files are created with `O_EXCL|O_NOFOLLOW`,
fsynced, and made read-only. The completed directory is made non-writable.
Partial publication never overwrites a prior artifact.

The exact file set for a started outcome is:

```text
script.sing
stdout.bin
stderr.bin
receipt.json
manifest.json
```

A `DID_NOT_START` artifact omits both stream files. The receipt and manifest
are canonical compact JSON with one terminal newline. Manifest top-level keys
are exactly:

```text
schema source effective_source source_context source_context_sha256
request replayed receipt receipt_sha256 artifacts claims artifact_sha256
```

`artifacts` has exact keys `script`, `stdout`, and `stderr`. Each present entry
has exact keys `path`, `bytes`, and `sha256`. Paths are fixed basenames, not
caller-controlled values. The claims object is fixed to:

```json
{
  "execution_custody": true,
  "mathematical_verdict": false,
  "singular_children_confined": false
}
```

Local digests have distinct meanings:

- `source_context_sha256` hashes canonical source-context JSON.
- `receipt_sha256` hashes the exact canonical `receipt.json` bytes, including
  their terminal newline.
- `artifact_sha256` hashes the canonical manifest object before the
  `artifact_sha256` member is added. It binds the receipt, context, request,
  file metadata, and custody claims. Individual script/transcript bytes are
  bound through their manifest SHA-256 entries.

The offline validator opens every component and file without following
symlinks; rejects writable, linked, non-regular, oversized, untracked, missing,
or changing files; rechecks the exact schemas, lifecycle, attestation, argv,
all daemon and local digests, and the file set; and does not contact PIQD:

```bash
python -m census.global_confinement.piqd_singular_backend \
  --check path/to/artifact-directory
```

Successful output reports the artifact digest, run ID, process status, and an
explicit null mathematical verdict. The equivalent Python entry point is
`validate_artifact_directory(path) -> SingularExecutionResult`. Every custody,
transport, schema, digest, lifecycle, or publication failure raises
`PiqdSingularCustodyError`.

## Tests

`scripts/test-p97-piqd-singular-backend.sh` runs the fake-daemon tests and
format/lint checks under one-worker thread caps and wall-clock command caps. The
fake uses `HTTPServer`, not a threaded server, and exercises byte custody,
idempotent replay, strict schemas and types, lifecycle/hash/argv failures,
corrected `DID_NOT_START`, fail-closed `INTERRUPTED`, create-once/no-follow
publication, hostile mapping/path boundaries, tamper detection, the offline
API, and `--check`. It does not start PIQD or Singular.
