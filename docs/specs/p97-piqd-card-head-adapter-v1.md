# P97 PIQD card-head adapter v1

## Status

`census/p97_search/phase3_piqd_card_head_adapter.py` is a bounded,
producer-neutral canary for one exact12-v14 card-head cell. It uses the existing
`exact12_v14_cell_run.run_cell(..., solver=...)` seam without changing that
runner. It does not start PIQD, CaDiCaL, or Lean.

The implemented current-API path includes a production canary CLI and an
independent, transport-free output validator. The production path has only
been exercised with fake transport; no daemon, solver, or Lean process was
started during validation. It is not ready for theorem promotion. Source
entitlement, theorem coverage, universal lift, and Lean closure are all false.
Proof-blueprint session `019fdf9c` remains unchanged, open, and off-spine.

## API and lifecycle

`AuthenticatedPackageSnapshot` accepts exact CNF, canonical producer-manifest,
and canonical wave-manifest bytes. It checks bounded strict JSON, the existing
wave contract, DIMACS dimensions, CNF and producer hashes, CaDiCaL backend, and
finite-local promotion fields. Its package identity covers the CNF, producer
manifest, wave manifest, and dimensions. Arbitrary caller-supplied producer
bytes that satisfy those structural and hash checks do not establish source
entitlement. Only the production builder below authenticates producer bytes
against the selected source path, and only the independent production validator
rebuilds that path on reuse; the receipt therefore keeps source entitlement
false.

`BoundedCurrentPiqdHttpTransport` wraps the current PIQD transport. It admits
only these current endpoint contracts:

| Method and path | Required response |
| --- | --- |
| `POST /jobs/prepare-cnf` | `200 application/json` |
| `POST /jobs/confirm?job_id=...` | `200 application/json` |
| `GET /jobs/{job_id}` | `200 application/json` |
| `GET /jobs/{job_id}/cnf` | `200 application/octet-stream` |
| `GET /jobs/{job_id}/model` | `200 application/json` |
| `GET /jobs/{job_id}/log?...` | `200 text/plain; charset=utf-8` |
| `GET /jobs/{job_id}/proof` | `200 text/plain; charset=utf-8` |
| `GET /jobs/{job_id}/clause-map` | `200 application/json` |
| `GET /jobs/{job_id}/lean?toolchain=leanprover%2Flean4%3Av4.27.0` | `200 text/plain; charset=utf-8` |

Every path and job identifier is validated before use. Unexpected methods,
routes, queries, status codes, content types, and bodies exceeding their typed
limit fail closed. JSON parsing rejects duplicate keys, non-finite values,
invalid UTF-8, excessive depth, excessive node count, and excessive bytes.
Before any header iteration, each response must be an exact `HttpResponse`
whose status is an exact integer, body is exact bytes, and headers are an exact
builtin dictionary with exact builtin string names and values. Non-mappings,
custom mappings, dictionary/string subclasses, malformed entries, and duplicate
case-insensitive `Content-Type` fields therefore fail as typed adapter/oracle
errors; the CLI converts the production-path failure to its fail-closed exit.
CNF, journal, checkpoint, model, log, proof/LRAT, clause-map, Lean source, and
all journal artifacts have explicit byte limits. Filesystem reads are stable,
bounded, regular-file, single-link, and no-follow reads.

The oracle exposes `stdlib_http_transport` as its stable standard-library HTTP
transport. The historical private name remains an exact compatibility alias,
but CardHead uses the public name. CardHead's bounded validating wrapper opts in
to the same segmented `MultipartBody` path, so the producer's CNF buffer is
streamed rather than joined into a second full request body. A multipart body
has an exact tuple of exact `bytes`, `bytearray`, or `memoryview` segments and an
exact nonnegative integer content length. Memoryviews must be one-dimensional,
byte-sized, C-contiguous, and unreleased. Construction and the public transport
boundary both check that the segment byte total equals the declared length;
the accepted buffer objects are sent directly without joining or coercing them
to a second full body. Malformed segments and forged dataclass state fail with
deterministic typed errors before a connection is opened.

`CurrentPiqdPacketAssembler` is the actual transport path. A caller supplies a
`CurrentPiqdRun` holding the existing `PiqdCegarDriver` and strict HTTP wrapper.
The assembler runs the shared driver, then authenticates its
`DurableAttemptJournal`, checkpoint artifacts, hash chain, terminal record, and
seal against the package and returned `DriverResult`. It reconstructs the
`PreparedJob` from the authenticated prepare checkpoint and checks the current
status response against that job and journal outcome. It then fetches the
current result-specific endpoints and builds the local packet; it does not
require a daemon-only aggregate envelope.

`CardHeadPiqdAdapter` checks that the runner-owned CNF exactly equals the
authenticated package and invokes the assembler. The legacy `nice` value is
recorded as unsupported and is not forwarded. `requested_core_limit = 1`,
`attested_solver_processes = 1`, and
`SINGLE_PROCESS_NO_PARALLEL_FLAG` authenticate the current one-process/no-
parallel-flag claim. They do not authenticate one OS core or one thread.

## Production canary and standalone replay

`build_source_faithful_canary_package` rebuilds the current source-faithful
path for the selected exact12-v14 cell:

1. `build_manifest(repo_root)`;
2. `build_bound_job(schedule, repo_root, cell_index)`;
3. `instantiate_validated_bound_job(job, schedule, repo_root)`;
4. the resulting `CoverInstance.dimacs()` and complete choice/blocker variable
   map.

This is the ordinary bound-cell package accepted by
`exact12_v14_cell_run.run_cell`. The separate source54 package contains
additional frozen clauses and therefore is not byte-identical to the injected
solver seam's runner-owned DIMACS. Substituting it would defeat the seam's exact
CNF authentication.

`run_production_canary` creates the output root exactly once, snapshots the CNF,
producer/wave/schedule manifests, bound job, and variable map, and then calls
the unchanged `run_cell(..., solver=adapter)` entry point. Each injected solve
attempt constructs the current `PiqdRawDimacsClient`, `PiqdCegarDriver`, and
`DurableAttemptJournal`. The driver policy requests one core and one attempt;
the resulting receipt claims only authenticated one-process/no-parallel
execution, not OS-level core or thread enforcement.

A newly created output is a fresh qualification attempt. Immediately after
`prepare-cnf` validation, its response must have `existing = false`; an
`existing = true` response fails closed before CNF retrieval, confirmation,
status polling, or result retrieval. The adapter neither invents another
generation nor changes semantic identity. This gate does not affect an already
complete output: the preexisting receipt remains eligible for transport-free,
idempotent validation, including validation of a historically recorded job
whose prepare response had `existing = true`.

All output traversal is rooted and component-wise no-follow. Snapshotting
rejects symlinks, non-regular files, multiply linked files, changed files,
excessive depth/node counts, and excessive individual or total bytes. The
canonical `canary-receipt.json` contains a self-hash plus the complete directory
and file inventory. A second `run` on a complete output performs standalone
validation without contacting PIQD and reports `restarted = true`; a partial or
tampered output fails closed and is retained for forensic inspection.

`validate_production_output` independently rebuilds the package from current
source, reopens every durable journal, reauthenticates its checkpoint chain and
seal, and replays packet/status/result/cell-summary bindings. It takes no
transport argument. For SAT it also reconstructs the bound source instance,
requires a total DIMACS model, decodes the exact cube and blocker assignment,
checks added constraints, calls `source_faithful_cube_ok`, and matches the
runner's model and summary. For UNSAT it revalidates the separately typed LRAT,
clause-map, Lean-source observation, and false-claim handoff, but still returns
only diagnostic evidence because CERT-001 is absent.

The CLI forms are:

```text
python -m census.p97_search.phase3_piqd_card_head_adapter run \
  --repo-root "$REPO" --output-root "$OUTPUT" --cell-index 0

python -m census.p97_search.phase3_piqd_card_head_adapter validate \
  --repo-root "$REPO" --output-root "$OUTPUT" --cell-index 0
```

The live `run` form is separately authorization-sensitive because its default
base URL is `http://127.0.0.1:7272`. Exit status is 0 only for replayed SAT, 3
for non-promotable UNSAT/UNKNOWN, and 2 for fail-closed validation or transport
errors.

## Shared `sat_encoding` boundary and frontier callers

The current shared static entry point remains
`census.card_head.sat_encoding.solve_cadical(instance, cnf_path, *,
extra_clauses=(), timeout_seconds=30, nice=10, proof_path=None)`. It writes the
DIMACS itself, invokes `nice ... cadical` directly, parses only positive model
literals, and optionally writes and checks a legacy DRAT file with
`drat-trim`. Its effective instance protocol is only `dimacs(extra_clauses)`
plus `decode_model(positive_variables)`.

The A-, B-, C-, DE-, DR-, and E-core frontier encoders import or re-export that
function and supply duck-typed `RunInstance` implementations. Their run scripts
pass a legacy `.drat` path and write a decoded named-atom model after SAT. This
is not by itself a sufficient producer-neutral PIQD seam:

- the call carries no authenticated source/package manifest or variable map;
- five of the six frontier `decode_model` methods only project positive
  variables into a named-atom table and do not independently replay every CNF
  clause;
- the local solver parser does not require a total signed DIMACS assignment;
- the legacy `.drat` output contract cannot receive compact LRAT bytes; and
- replacing the subprocess alone would leave callers treating observational
  CERT-001-incomplete UNSAT as though the old local DRAT check had run.

Accordingly, this adapter does not monkeypatch or replace the shared
`solve_cadical` symbol and does not mutate any frontier package. The current
A-core lane has its own source-package adapter and durable replay contract. The
CardHead lane instead uses the narrower exact12-v14 `run_cell(...,
solver=...)` seam, where the runner-owned CNF can be compared byte-for-byte and
the source-faithful decoder/semantic validator is available.

A future truly shared static adapter must make the missing producer contract
explicit: canonical source manifest, exact rendered CNF including extra
clauses, complete DIMACS-variable map, total-model clause replay, a
producer-supplied semantic decoder/validator, and typed result-artifact
custody. Its UNSAT branch must remain observational until CERT-001 supplies an
authenticated source-to-certificate linkage and checker/replay receipt.

## SAT

Current Rust model JSON is not required to use canonical key order. The exact
raw response bytes are hashed and compared with the model artifact recorded by
the durable journal. Only after that comparison does the adapter produce a
separate canonical local receipt.

SAT then requires the exact current keys, matching job/result, a builtin-integer
count, and exactly one in-range literal for every CNF variable. It replays the
authenticated DIMACS, uses the existing exact12 decoder, and calls the real
`source_faithful_cube_ok` semantic validator. Partial, duplicate, out-of-range,
boolean-as-integer, crossed-job, and post-journal-tampered models fail closed.

This establishes only a replayed finite-cell model, not any theorem-facing
claim.

## UNSAT and CERT-001

For current UNSAT, the assembler obtains the proof, clause-map, and Lean-source
endpoint bodies. It checks the proof hash header, bounded ASCII compact-LRAT
shape including an empty-clause record, the existing clause-map consumer with
exact numbering and content identity, and that the returned Lean source embeds
the same kept CNF, LRAT bytes, and job-specific theorem name.

Those checks are observational. Fake endpoint bytes do not execute the Lean
replay, and the current journal has no authenticated source-CNF-to-proof link.
Until CERT-001 supplies that missing production linkage and checker/replay
receipt, UNSAT returns `proof_verified = false` and cannot promote a theorem.

When a typed output base is supplied, the adapter creates these files once with
no-follow custody:

- `.lrat` for compact LRAT bytes;
- `.clause-map.json` for the exact current response;
- `.lean` for the unexecuted current endpoint source;
- `.piqd-observation.json` for the local observational handoff.

It never writes compact LRAT bytes to the legacy `.drat` path. The handoff
records certificate kind/path/hash, job and identity, clause-map response hash
and numbering/content identities, journal/seal identities, and Lean-source
hash. Certificate-source linkage, replay receipt, Lean execution, certificate
contract completeness, theorem promotion, source entitlement, theorem
coverage, universal lift, and Lean closure remain explicitly false.

## Results and blockers

| Current result | Adapter classification |
| --- | --- |
| Strict SAT with total DIMACS and semantic replay | finite-cell `SAT` |
| UNSAT with exact current proof/map/Lean observations | diagnostic `UNSAT`, `proof_verified = false` |
| `UNKNOWN` | non-promotable `UNKNOWN` |
| Failed, crossed, tampered, or malformed evidence | exception, fail closed |

The next theorem-promotion blocker is CERT-001, not another card-head response
envelope. A trusted checker/replay receipt remains unperformed. The Python
oracle currently supplies prepare/model/proof methods
and the public standard-library transport while the assembler's strict observer
covers the live clause-map and Lean endpoints directly. None of this upgrades
the current resource evidence to one-core/thread enforcement.

## Live SAT qualification

The authorized one-process cell-0 canary completed on 2026-08-10 and is
preserved at
`scratch/p97-piqd-card-head-exact12-v14-cell0-live-2026-08-10-v1/`.
Its exact daemon job is `1528db5c-4f91-42f6-93c6-89c6ce0a0809` with identity
`735e7f8b3b7ed0519babcf15aa4ed6e5f6f17935bb71ad7c9507f8ed4f1a6760`.
The prepare response was fresh (`existing = false`), the terminal response was
`completed`/`SAT`, and PIQD reported `requested_core_limit = 1`,
`attested_solver_processes = 1`, and
`attestation_basis = SINGLE_PROCESS_NO_PARALLEL_FLAG`. The solver wall time was
82 ms. This authenticates the one-process boundary, not OS CPU affinity,
thread count, or literal one-core execution.

The PIQD maintainer independently inspected the status, CNF, model, and log
routes without mutating the job. The status/model routes confirmed the terminal
facts and all 42,710 assignments; the job's stored CNF bytes independently
hashed to the package CNF digest below. The solver log identifies CaDiCaL 3.0.0
at upstream commit `7b99c07f0bcab5824a5a3ce62c7066554017f641`.
`identity_hash` and `existing` are prepare-response-only fields: the status
route cannot independently corroborate them, so their sole custody record is
the authenticated archived prepare response. `progress.solver_version` is null
for CaDiCaL; PIQD-BUILDBIND-001 now tracks populating it and binding daemon
build provenance per job.

The run used package identity
`8d7bc444f85dd6bcf46cdcf91c34b2c122ea84d46f7c604a40abe5fdaacf4fa0`
and the exact 42,710-variable, 369,355-clause CNF with SHA-256
`cfc268f2915ff31e1af24a66a036e41e81f93aca0967e88c1b4a4158eb67a379`.
The adapter preserved the raw model response, published its canonical form,
proved their decoded objects equal, and independently replayed the total model
through the source-faithful cell checker. The terminal classification is
`SAT_WITNESS_REPLAYED`; the self-hashed canary receipt is
`d74c396e34f328b6760762f450e88e6650f7459cf46e920c0c955199624dcc70`.
A separate transport-free `validate` invocation reproduced that result from
the archived bytes.

This is finite diagnostic evidence only. The receipt keeps source entitlement,
theorem coverage, universal lift, certificate-source linkage, Lean replay,
Lean closure, and theorem promotion false. The daemon `/version` response was
observed out of band with daemon SHA-256
`6087acb84cf179821240625b60f93502e37eb8b5362840a70b810103c9d1b464`;
the job does not authenticate that daemon build.

## Fake-contract verification

The focused tests use the current `PiqdRawDimacsClient`,
`PiqdCegarDriver`, and `DurableAttemptJournal` with a fake HTTP transport. They
exercise the real `run_cell(..., solver=...)` seam, noncanonical raw model
authentication, real source-faithful valid/invalid cubes, total-model attacks,
crossed endpoint/job/map/certificate/Lean data, status/journal disagreement,
durable-journal tampering, invalid compact LRAT, response/artifact bounds,
deep/wide JSON, malformed types, `UNKNOWN`, create-once/no-follow custody,
complete-output restart without transport, partial-output fail-closed behavior,
fresh-output `existing = true` rejection before confirm/solve, standalone SAT
replay, crossed production packet/journal data, hostile response-header
structures, duplicate content types, exact multipart buffer types, invalid
memoryview shapes, forged multipart state, and CLI fail-closed behavior. No
global semantic monkeypatch is used.

The verification command is:

```text
PYTHONPATH=. UV_CACHE_DIR=.uv-cache uv run --with pytest --with pytest-xdist \
  pytest -q -n 1 \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py

UV_CACHE_DIR=.uv-cache uvx ruff check \
  census/p97_search/phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/phase3_piqd_card_head_adapter.py \
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py

UV_CACHE_DIR=.uv-cache uvx ruff format --check \
  census/p97_search/phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/phase3_piqd_card_head_adapter.py \
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py

PYTHONPATH=. UV_CACHE_DIR=.uv-cache uv run --with pytest --with pytest-xdist \
  pytest -q -n 1 \
  census/p97_search/tests/test_phase3_piqd_preappended_snapshot.py \
  census/p97_search/tests/test_phase3_piqd_a_core_adapter.py \
  census/p97_search/tests/test_phase3_piqd_exact17_direct6_package.py \
  census/p97_search/tests/test_phase3_piqd_exact17_runner.py \
  census/p97_search/tests/test_phase3_piqd_static_solver_runner.py \
  census/p97_search/tests/test_phase3_piqd_structural_cegar_route.py
```

Current focused result: `116 passed in 125.61s`. The additional generic
consumer regression passed `288` tests in `5.82s`; Ruff check and format-check
both passed. Adding the exact17-v19 runner to that generic command produced
`299 passed, 5 errors`, all five at fixture setup because the current source
tree disagrees with its provenance sidecar for `direct_exporter`,
`producer_bank`, and `static_schema_lean_consumers`. That independent custody
drift was not changed by this adapter/oracle hardening.

No PIQD core bug was observed by either the fake suite or the live SAT canary.
The audit
#4589 response-header gap was a P97 CardHead adapter robustness defect, and its
multipart segment gap was a shared Python oracle transport robustness defect;
neither is classified as a PIQD core bug. CERT-001 and
the separately tracked build-binding/retry-generation gaps are PIQD core
contract limitations. Fresh-qualification enforcement is a P97 adapter policy;
the formerly private default-transport dependency was a Python oracle/adapter
API issue. The custom-envelope, noncanonical-model, semantic-monkeypatch,
bounds, and custody findings in audit threads #4321 and #4326 were P97 adapter
defects and are corrected here.
