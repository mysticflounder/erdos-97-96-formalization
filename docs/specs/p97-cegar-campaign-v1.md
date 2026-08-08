# P97 bounded CEGAR campaign custody contract v2

Status: implemented finite-local source-entitlement remedy. This contract
supplies durable ordered custody, source-derived duplicate-center
classification, and a repeated-survivor stop/pivot gate. It does **not**
schedule piqd jobs, manage aggregate coverage, establish an ambient-fiber or
universal result, or close a Lean theorem.

## Fixed policy

The immutable manifest schema is `p97-cegar-campaign/v2`. Campaign state records
use `p97-cegar-campaign-record/v2`, and derived results use
`p97-cegar-campaign-result/v2`. The v2 cutover is intentionally fail-closed:
v1 manifests cannot be admitted, v1 state cannot be restarted, and a resident
v1 result must be removed and regenerated from authenticated v2 state. There is
no silent migration or shared schema identifier between the old diagnostic
contract and this source-derived contract.

V2 fixes:

- `threshold = 3`;
- `max_in_flight = 1`;
- a nonempty predeclared `pivot_id`;
- an ordered, dense array of cells with ordinals `0, …, n - 1`; and
- explicit false claims for aggregate coverage, universal lift, and Lean theorem
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

The controller accepts cells strictly in manifest order. V2 accepts only
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
   `derive_source_duplicate_center_classifier_snapshot` afresh with the same
   immutable source-job, DIMACS, model, and source-bundle bytes. The archived
   path spellings are receipt labels only; the snapshot API never reopens them.
   One internal replay retains the decoded cube for classification, so there is
   no second model decode or input-path read. The fresh receipt bytes must equal
   the archived receipt byte for byte.
4. That replay normalizes the complete cube through the structural CEGAR cube
   canonicalizer. Receipt and classifier use the identical canonical payload
   and SHA-256, so integer-key and JSON string-key forms cannot acquire distinct
   cube identities.
5. Before replay or detection, the complete declared detector source closure is
   opened once through component-wise no-follow descriptors, required to be
   regular files, and captured as an ordered path/byte-count/SHA-256/canonical
   base64 bundle. Missing source, a symlink in the detector path, malformed
   base64, or inconsistent byte count/hash fails closed. Detection and artifact
   validation use that immutable in-memory snapshot and do not reopen detector
   paths. Because the Python detector modules were already imported before this
   snapshot was taken, this is authenticated custody of the resident source
   snapshot, **not** provenance that those exact bytes are the code executing in
   the interpreter. The artifact custody metadata and scope record
   `executed_byte_provenance = false`; admission makes no stronger claim.
6. The detector runs on the retained cube. Admission accepts only
   `equality-duplicate-center`, independently replays the complete certificate,
   requires every certificate row to have `exact=false`, proves each row support
   is a subset of decoded selected-positive support, and safely compiles the
   selected-row learned clause. Replay retains the full selected-positive
   DIMACS assignment, and every absolute learned-clause literal must occur in
   that assignment. The canonical positive-variable list and its SHA-256 are
   embedded in the classifier, so a negative clause over unrelated variables is
   rejected even if otherwise well formed.
7. The resulting canonical
   `p97-cegar-source-derived-duplicate-center/v2` artifact binds the model,
   source-job, DIMACS, and source-bundle hashes; full canonical cube and hash;
   detector contract, full base64 source bundle, custody semantics, and hash;
   full canonical certificate and hash; learned clause and its selected-positive
   witness; stage; row semantics; and explicit false claims.
   The fresh artifact must equal the archived classifier byte for byte. A
   self-declared hash is never accepted instead of recomputation.

The selected-support subset result does **not** claim that a certificate row is
the complete ambient metric fiber. The artifact records
`ambient_fiber_completeness = false`; aggregate coverage, universal lift, and
Lean theorem closure also remain false.

The authenticated equivalence key is SHA-256 of canonical JSON containing only
`source_bundle_sha256`, `detector_contract_sha256`, and `stage`. Certificate and
model hashes remain recorded custody identities but intentionally do not split
the finite-local source-derived failure family.

## Stop result

Three adjacent eligible survivors with the same authenticated equivalence key emit a
canonical `PIVOT_REQUIRED` result containing the first and last ordinals, count
three, equivalence key, and predeclared pivot ID. The result repeats the false
aggregate-coverage, universal-lift, and Lean-theorem-closure claims. One or two
survivors emit `CONTINUE`. After `PIVOT_REQUIRED`, further admission fails closed;
there is no early-stop overrun.

## Durability and restart

The campaign state is canonical JSONL. Every record binds the campaign digest,
ordinal, previous-record digest, package/wave/journal/model/replay/classifier
identities, authenticated equivalence key, and the explicit finite-local claims. A
record digest seals each logical record.

Admission rewrites the complete already-validated prefix plus one record using
same-directory atomic replacement, file and directory `fsync`, and no-follow
regular-file checks. Restart validates the canonical JSONL prefix and hash chain
before admitting anything. Each record is checked against an exact key set,
types, digests, claims, evidence status, and its predeclared campaign cell. A
state containing any record after a pivot-worthy prefix is rejected as an
overrun. Repeating the identical logical admission is
idempotent, including the threshold-forming admission; a divergent duplicate is
rejected. A canonical v2 derived result file is atomically refreshed after each
durable journal admission and on an idempotent retry. The latter repairs a
missing result after a crash between the authoritative JSONL write and the
derived-result write.

Restart preflights any resident result before changing authoritative state. A
v1 or unknown result schema fails closed; a missing or stale v2 derived result
can still be refreshed from the authoritative validated JSONL prefix.

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
- `make_classifier(...)`, a compatibility constructor for diagnostic-only
  artifacts which cannot pass campaign admission, and
  `write_canonical_json(...)`;
- `process_cell(...)`;
- `replay_exact12_model(...)`, the compatible path-reading replay API;
- `replay_exact12_model_snapshot(...)`, the immutable-byte replay core used by
  receipt-only consumers; and
- `derive_source_duplicate_center_classifier_snapshot(...)`, the immutable-byte
  replay-and-classify boundary used by campaign admission.

CLI entry points:

```text
python -m census.p97_search.phase3_piqd_campaign init ...
python -m census.p97_search.phase3_piqd_campaign classifier ...
python -m census.p97_search.phase3_piqd_campaign admit ...
python -m census.p97_search.phase3_piqd_exact12_replay \
  --source-bundle ... --classifier ... --receipt ...
```

`classifier` remains only for compatibility and emits
`p97-cegar-diagnostic-classifier/v1` with status
`DIAGNOSTIC_ONLY_NOT_SOURCE_ENTITLED`. Its output is deliberately inadmissible;
an admissible classifier must be derived from authenticated source snapshots.
The exact12 replay command derives and atomically archives that classifier when
`--source-bundle` and `--classifier` are supplied together.

The exact12 replay receipt remains
`p97_rigid221_exact12_full_v14_piqd_model_replay.v1`: canonicalizing integer and
JSON-string cube keys preserves its existing cube hash identity, so the campaign
v2 cutover does not manufacture an unrelated replay-schema change. Live v1
campaign manifests, records, results, and source-classifier v1 artifacts must be
regenerated; replay v1 receipts remain admissible only when their complete bytes
match the fresh replay required by v2 admission.
