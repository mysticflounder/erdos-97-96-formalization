# P97 bounded CEGAR campaign custody contract v1

Status: implemented partial G2 remedy. This contract supplies durable ordered
custody and a repeated-survivor stop/pivot gate. It does **not** schedule piqd
jobs, manage aggregate coverage, establish source entitlement, produce a
universal lift, or close a Lean theorem.

## Fixed policy

The immutable manifest schema is `p97-cegar-campaign/v1`. It fixes:

- `threshold = 3`;
- `max_in_flight = 1`;
- a nonempty predeclared `pivot_id`;
- an ordered, dense array of cells with ordinals `0, …, n - 1`; and
- explicit false claims for aggregate coverage, source entitlement, and theorem
  closure.

Each cell binds its `cell_index`, package directory, package identity SHA-256,
wave-manifest SHA-256, and source-bundle SHA-256. The package identity hashes the
fixed ten-file P97 piqd package surface. The package paths are operational
custody locations; the digests are the identities.

Admission reads the ten package files once through no-follow regular-file
descriptors and authenticates that immutable byte snapshot. The source job's
`cell_index` must equal both the predeclared campaign cell and the wave execution
`shard_id`. The wave CNF, variable-map, producer-manifest, order-cell, and
ingress-contract digests must equal the corresponding snapshot bytes. The
producer manifest's eight artifact path/digest references must identify the
fixed package filenames and bytes. Source-job CNF dimensions and digest,
embedded compiler and clause delta, order/variable-map job and cell identities,
and producer provenance source-bundle/compiler/clause-delta digests are
cross-checked against the same snapshot.

The controller accepts cells strictly in manifest order. V1 accepts only
authenticated `STRUCTURAL_SAT` survivors. It has no unauthenticated “reset” or
skip record. Support for authenticated non-survivor resets is reserved for a
later schema.

## Eligible survivor

Admission recomputes the package identity and requires all of the following:

1. The current canonical wave manifest equals the predeclared wave identity and
   passes the existing wave validator.
2. `DurableAttemptJournal` validates the complete hash-chained journal, archived
   artifacts, and existing seal. The controller never manufactures a missing
   seal. Before constructing the adjacent journal reader, the controller opens
   the journal, seal, artifact directory, and every archived artifact through
   no-follow checks and requires regular files (and one regular directory). The
   terminal record must be `STRUCTURAL_SAT` and name a model artifact whose
   bytes have the recorded SHA-256. Its checkpoint must be a successful
   completed `MODEL` event with result `SAT`, bound to the archived model's job
   ID; the model must itself record result `SAT`.
3. A newline-terminated canonical exact12 source-semantic receipt is archived,
   has status `ACCEPTED`, and has every replay gate set to true. The controller
   requires the receipt's recorded input paths and job ID to resolve to the
   predeclared package source job and DIMACS, the archived piqd model, and the
   model's job ID. All three receipt hashes must be well-formed and equal the
   already-authenticated source-job, DIMACS, and model byte snapshots. The
   receipt's cell index must also equal the campaign cell. It calls
   `replay_exact12_model_snapshot` afresh with those immutable bytes. The
   identity-checked archived path spellings are passed only as receipt labels,
   and the snapshot API never reopens them. The fresh canonical bytes must equal
   the archived receipt byte for byte. This closes the former validation/replay
   path-swap window without copying authenticated bytes through a temporary
   pathname.
4. A separate canonical `p97-cegar-diagnostic-classifier/v1` artifact binds the
   exact model hash, source-bundle hash, detector-contract hash, certificate
   hash, and stage. Its status is exactly
   `DIAGNOSTIC_ONLY_NOT_SOURCE_ENTITLED`.

The classifier is self-declared diagnostic evidence. The controller checks its
identities and hashes only: it does not authenticate the detector's semantics,
rerun or endorse the classifier, or promote its certificate to source
entitlement. Thus identical opaque keys mean only that supplied canonical
diagnostic declarations agree on the bound source bundle, detector contract,
and stage.

The opaque equivalence key is SHA-256 of canonical JSON containing only
`source_bundle_sha256`, `detector_contract_sha256`, and `stage`. Certificate and
model hashes remain recorded custody identities but intentionally do not split
the diagnostic failure family.

## Stop result

Three adjacent eligible survivors with the same opaque equivalence key emit a
canonical `PIVOT_REQUIRED` result containing the first and last ordinals, count
three, equivalence key, and predeclared pivot ID. The result repeats the
no-coverage, no-source-entitlement, and no-theorem-closure labels. One or two
survivors emit `CONTINUE`. After `PIVOT_REQUIRED`, further admission fails
closed; there is no early-stop overrun.

## Durability and restart

The campaign state is canonical JSONL. Every record binds the campaign digest,
ordinal, previous-record digest, package/wave/journal/model/replay/classifier
identities, opaque equivalence key, and the explicit finite-local claims. A
record digest seals each logical record.

Admission rewrites the complete already-validated prefix plus one record using
same-directory atomic replacement, file and directory `fsync`, and no-follow
regular-file checks. Restart validates the canonical JSONL prefix and hash chain
before admitting anything. Each record is checked against an exact key set,
types, digests, claims, evidence status, and its predeclared campaign cell. A
state containing any record after a pivot-worthy prefix is rejected as an
overrun. Repeating the identical logical admission is
idempotent, including the threshold-forming admission; a divergent duplicate is
rejected. A canonical derived result file is atomically refreshed after each
durable journal admission and on an idempotent retry. The latter repairs a
missing result after a crash between the authoritative JSONL write and the
derived-result write.

A dedicated no-follow regular-file campaign lock covers manifest/state reads,
evidence authentication, duplicate comparison, and authoritative and derived
writes. Concurrent callers therefore re-read state after acquiring the lock;
they cannot overwrite one another from stale prefixes. Result construction uses
`consecutive_count >= 3` defensively even though validated state cannot overrun.

Inputs, state, classifiers, and receipts reject duplicate JSON keys,
nonstandard or nonfinite constants, noncanonical bytes, symlinks, and
nonregular files. Canonical JSON construction also rejects nonfinite values.

## Library and CLI

Library entry points:

- `make_campaign_manifest(package_dirs, pivot_id)`;
- `make_classifier(...)` and `write_canonical_json(...)`; and
- `process_cell(...)`;
- `replay_exact12_model(...)`, the compatible path-reading replay API; and
- `replay_exact12_model_snapshot(...)`, the immutable-byte replay core used by
  campaign admission.

CLI entry points:

```text
python -m census.p97_search.phase3_piqd_campaign init ...
python -m census.p97_search.phase3_piqd_campaign classifier ...
python -m census.p97_search.phase3_piqd_campaign admit ...
```

`classifier` exists so live-cell diagnostic artifacts are emitted canonically
instead of being hand-authored.
