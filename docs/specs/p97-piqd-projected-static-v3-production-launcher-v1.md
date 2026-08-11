# P97 PIQD projected-static-v3 production launcher v1

## Status and boundary

This specification defines the versioned authority-v3 gate used by
`scripts/run-p97-piqd-projected-v3-production.py`. The gate binds the current
global, unsharded projected-static-v3 input without rewriting or relabelling
the historical shard-bound canary and authority-v2 artifacts.

This is finite adapter qualification infrastructure, not a P97 proof result.
It does not assert theorem entitlement, universal closure, a PIQD proof, or a
Lean proof. A live daemon/solver deployment remains unqualified until the full
v3 lifecycle below succeeds.

## Command contract

```text
python scripts/run-p97-piqd-projected-v3-production.py \
  --out OUT \
  --workers 1 \
  --parallel-mode sequential \
  --projected-static-v3 \
  --persistent-discovery \
  --no-bootstrap \
  --no-algebraic-bootstrap \
  --piqd-base-url URL \
  --piqd-journal-root OUT \
  --piqd-source-manifest SOURCE_MANIFEST \
  --piqd-producer-manifest PRODUCER_MANIFEST \
  --piqd-producer-job-id PRODUCER_JOB_ID \
  --piqd-solver-name piqd-satworker-cadical-3.0.0 \
  --piqd-qualification-authority AUTHORITY_V3
```

Every displayed input is mandatory. `--piqd-journal-root` must equal `--out`.
The launcher requires one worker, sequential scheduling,
`--projected-static-v3`, persistent discovery, `--no-bootstrap`, and
`--no-algebraic-bootstrap`. It rejects local-only discovery, resume, cube
batching, every shard selector or verifier, and shard-local simplification.
It also rejects `--bootstrap-results` and every `--algebraic-bootstrap` value,
including when either is crossed with its corresponding `--no-*` flag.

This production path begins from the exact current global base bound by the
validated authority-v3. No structural or algebraic bootstrap bytes are
admitted, authenticated, copied into the clean source image, or claimed by the
authority. The underlying direct projected-static-v3 CLI retains its
historical diagnostic bootstrap defaults; those defaults are outside this
versioned production contract.

Token-shape rejection, including the complete base-only bootstrap policy,
precedes filesystem reads. Once the token shape is complete, bounded reads are
permitted to recapture the authority and manifest inputs and to run the public
current-bundle builder. No output creation, transport, producer-job action, or
solver action occurs before exact profile validation. All control captures are
canonical JSON, bounded, no-follow, single-link reads with pre/post identity
checks. The launcher delegates the exact original argument vector only after
authority-v3 validation succeeds.

The outer launcher enforces the qualification layer's tighter 64 KiB response
limit for exact producer-job status capture; the older generic 1 MiB response
ceiling is not reachable at this production boundary.

## Current global profile

The public pure builder
`build_projected_static_v3_unsharded_inputs` is the sole production source of
the current bundle. Authority-v3 binds:

- authority `base_scope=global` and builder
  `base_scope=global-unsharded`;
- profile `phase3-v0.2-projected-static`;
- exactly 1,194 variables and 58,314 base clauses;
- base SHA-256
  `89548ae97ba91b15592c59c34a6c57f53f34095b990b0aea3993b13d84b5c30b`;
- the complete canonical 90-entry variable map, exactly 802 bytes, SHA-256
  `e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802`;
- the exact 203-byte encoding configuration, SHA-256
  `5f1257a6022cd24eda134ba476472e2175ea3bde66b7194ff36a4e5e55de3f77`;
- exact captured source-bundle, source-manifest, and producer-manifest bytes,
  their byte counts, and their SHA-256 identities; and
- the raw-DIMACS identity recomputed from the base, authenticated producer
  manifest, Cadical/SAT profile, and requested producer core limit one.

Source and producer digests are intentionally not compile-time constants.
Their whitelisted bytes include the public builder's source dependency
manifest. Provisioning captures those bytes from the builder, seals them into
the authority, and both authority loading and launch validation independently
recapture the builder output and require byte-for-byte equality. A caller
cannot select a different but internally self-consistent manifest pair.

No five-clause patch is applied. No shard-bound input is reinterpreted as the
global input. `shard_index`, `shard_count`, and `shard_literals` are present
only as exact JSON null values.

## Provisioning and authority lineage

`scripts/prepare-p97-piqd-projected-v3-production.py` is the create-once
onboarding entry point. Its sealed production profile is an exact immutable
dataclass lineage; a caller-constructed `production=True` profile, including a
v2-shaped forgery with self-consistent fields, is rejected before the public
builder, output resolution, transport, producer-job action, or solver action.

After the current bundle passes the stable semantic profile pins, provisioning
captures exact `/version` bytes, prepares a raw-DIMACS SAT producer job or
authenticates the requested existing job, verifies the exact base blob and
completed SAT status, and selects the pinned registry solver:

- name `piqd-satworker-cadical-3.0.0`;
- SHA-256
  `0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`;
- signature `cadical-3.0.0`;
- backend `cadical`, lane `sat`.

The current Rust `/solvers.daemon` object has one of exactly two accepted
schemas: the required builtin fields `name`, `version`, and
`protocol_version`, or those same fields plus `sha256`. No other field is
accepted. The optional `sha256`, when present, must be an exact builtin
lowercase 64-hex string equal to the daemon SHA-256 in the captured `/version`
object. Its absence preserves the documented Rust optional-field contract; it
does not permit any supplied value to escape identity validation.

The `POST /jobs/prepare-cnf` response is exact-schema evidence. It must contain
only `job_id`, `cnf_blob_hash`, `identity_hash`, `num_vars`, `num_clauses`,
`preview`, `existing`, and `requested_core_limit`. `preview` is a mandatory
exact builtin string equal to the daemon contract's lossy UTF-8 rendering of
the first 512 submitted CNF bytes. The current DIMACS is ASCII, so this is
exactly its first 512 bytes decoded as text. Missing, non-string, subclass,
or substituted preview values fail before any authority or output is minted.
Authority-v3 seals the exact preview and qualification-v3 copies and rechecks
it against the independently recaptured runtime base in preflight custody.
`producer_manifest_hash` is deliberately not invented as a POST echo: it is
required and cross-bound only in the completed `GET /jobs/:id` status below.

Before minting authority-v3, that completed status must already expose and
cross-bind `cnf_blob_hash`, `identity_hash`, and `producer_manifest_hash` to
the authenticated prepared base, raw-DIMACS identity, and captured producer
manifest respectively. Provisioning never accepts caller-selected manifest
identities or a self-consistent manifest echo.

The producer job alone attests `requested_core_limit=1`. The authority records
the job API's exact builtin `existing` boolean honestly, for either a newly
prepared job (`false`) or an authenticated requested job (`true`). It never
promotes that evidence into session core, thread, process, or CPU-affinity
claims; all such resource claims remain false.

Provisioning uses a private create-once directory, no-follow traversal,
single-link 0600 files, held-directory identity checks, atomic create-once
installation, no overwrites, and installs the authority seal last. It does not
confirm/run a producer job, open CEGAR, or invoke a solver.

The Python-only fake profile has a separate test-only schema and can never be
loaded as authority-v2 or authority-v3. There is no production CLI switch for
it.

## Sealed authority-v3

The canonical `p97-piqd-projected-static-v3-production-authority/v3` object
cross-binds:

- every current profile, base, map, configuration, source, producer, and raw
  identity above;
- its own canonical SHA-256;
- daemon URL and SHA-256 of the exact authenticated pre-run `/version` bytes;
- producer job UUID, exact prepare preview, requested core limit one, and
  honest existing flag;
- exact solver name, SHA-256, signature, backend, and lane;
- exact null shard fields; and
- the immutable v3 policy and false claim map.

Authority-v3 is accepted only by the global projected-static-v3 production
launcher, incremental runner, and qualification-v3 lifecycle. Authority-v2 and
canary artifacts cannot cross this boundary; authority-v3 cannot enter their
frozen loaders or finalizers. No monkeypatching, field stripping, schema
translation, or shard relabelling is performed.

The daemon binary identity is the identity in the sealed authority and must
match the captured pre-run version object. Qualification-v3 independently
validates the exact `/solvers.daemon` schema and, when its optional `sha256` is
present, cross-binds it first to the pre-run and then to the post-run
`/version.daemon.sha256`. Finalization also requires byte-for-byte equality of
the complete post-run version object with the pre-run object, not merely
equality of a selected version field or digest supplied by a caller.

## Qualified lifecycle

Before session creation, qualification-v3 revalidates the authority path and
exact captured bytes, recaptures the public bundle, authenticates both
manifests, verifies stable `base.cnf`, raw-DIMACS identity, producer job and
base blob, solver registry identity, and pre-run daemon version, then writes
canonical preflight custody. The runtime `.solver.cnf` must initially equal
the base and thereafter be an append-only extension.

Qualification-v3 normalizes its already authenticated daemon URL to one
origin-only HTTP(S) value before any live request. The origin must use printable
ASCII, a lowercase canonical scheme and DNS/IP host, and an empty or canonical
non-default decimal port; whitespace or control characters, Unicode host
ambiguity, userinfo, empty, default, out-of-range, or leading-zero ports, and
noncanonical equivalent spellings fail closed. One trailing slash is
normalized away. Its
private adapter prefixes that origin to the relative control-contract paths for
pre-run `/version`, `/jobs/:id`, `/jobs/:id/blobs/:sha256`, `/solvers`, and
post-close `/version`. An already absolute request is forwarded without a
second prefix only when it has the identical canonical scheme and authority and
an unambiguous root-relative path. Cross-origin, userinfo, query, fragment,
literal traversal or separators, whitespace or controls, and every percent
escape fail closed; rejecting all percent escapes also rejects encoded and
double-encoded traversal, separators, NULs, and controls, none of which current
qualification endpoints require. This v3-only binding does not loosen the
generic stdlib transport or alter the frozen authority-v2 and historical canary
paths.

Under the authority-v3 daemon contract, completed producer-job status must
contain all three exact SHA-256 identities: `cnf_blob_hash` equals the
authenticated prepared base blob, `identity_hash` equals the authenticated raw
DIMACS identity, and `producer_manifest_hash` equals the authenticated producer
manifest bytes. Missing, substituted, or non-string values fail before session
creation. This binds returned identities; it does not invent a producer
manifest object echo. Historical authority-v2 status handling is unchanged.

The transport permits one fresh session and an arbitrary finite sequence of
nonempty clause appends and assumption-free `SAT`, `UNSAT`, or `UNKNOWN`
solves with dense indices. The exact append/solve sequence must match the
hash-chained journal. Finalization reparses that journal from the authenticated
base, reconstructs the final frontier, and requires exact runtime CNF equality.
Projected-v3 discovery supplies a timeout. Qualification-v3 validates that
request before delegation and retains its exact nonnegative builtin value under
the dense solve index. The solve response contains no timeout field; exact
schema validation rejects both `timeout_ms` and `effective_deadline_ms` there.
The durable receipt must bind its exact builtin `timeout_ms` to the retained
request, and finalization checks that binding again. Missing, mismatched,
boolean, floating-point, subclass, negative, or cross-index receipt timeout
substitutions fail closed; a receipt value cannot serve as its own request
evidence.
Every current SAT solve response, for `SAT`, `UNSAT`, and `UNKNOWN`, must also
contain the exact builtin boolean `replayed: false`. Missing, true, integer,
floating-point, string, or subclass values fail closed. The SAT response and
receipt forbid `effective_deadline_ms`, whether or not a timeout was supplied;
that field belongs to the separately preserved SMT/session adapter contract,
not this production SAT path. Historical authority-v2 and canary response
semantics remain frozen.

The v3 wrapper makes exactly one public close call, and the generic current-SAT
runner owns remote close and reconciliation inside that call. A genuinely lost
DELETE response uses the existing idempotent reconciliation: observe closed,
or retry DELETE only if the session is still live. Once a closed response has
been received and parsed, a later custody mismatch is a committed close with a
schema/custody failure, not transport uncertainty, and cannot trigger another
GET or DELETE. Qualification accepts exactly one confirmed closed-state
observation.

Only a successful driver status with a terminal, assumption-free PIQD `UNSAT`
observation can mint a consumable qualification seal. PIQD `UNSAT` remains
discovery-only: the exact terminal CNF still requires the fresh local Cadical
DRAT production and verification path. `UNKNOWN`, errors, interrupted or
incomplete runs, version drift, control-file custody drift, journal/runtime
crossing, or response crossing emit no qualification seal.
If terminal publication or close cleanup fails while handling a solve
exception, the solve exception remains primary; the cleanup exception is
recorded as a note and chained as secondary, and no qualification seal is
minted.

Finalization records exact solve count, ordered statuses, final frontier,
runtime hash, close evidence, driver status, and post-run version. The session
result is create-once before the qualification seal; the seal is atomically
installed last. Existing forensic files are never overwritten.

## Claim semantics

Source entitlement, theorem coverage, universal lift, Lean closure,
one-process, one-core, session thread/core, and CPU-affinity claims are false.
A completed producer job and qualified session are finite adapter evidence
only. They are neither a solver proof nor a P97 theorem.

The normalized PIQD receipt boundary independently enforces exact key sets,
canonical bytes, and exact builtin scalar/container types. Boolean/integer
aliases, floats, subclasses, unknown keys, crossed receipts, re-signed
substitutions, non-total SAT models, nonempty UNSAT cores, and malformed
UNKNOWN evidence fail closed. There is no local discovery fallback.
Its public normalization helper preserves the historical receipt contract by
default, including the legacy timed `effective_deadline_ms = timeout_ms +
30000` rule. Only the production incremental-v3 caller explicitly selects the
strict current-SAT contract that forbids that field.

## Historical artifacts

The historical canary remains frozen: first `SAT`, append exact clause `(91)`,
then assumption-free terminal `UNSAT`. Its schemas and finalizer are unchanged.

Authority-v2 remains frozen to the historical shard-4/32 base: 58,319 clauses,
SHA-256
`c9c302d28ef5571f82f802c03f3a487576c648768d948e6d48a0c6da36ae8e18`,
with unit clauses `(-91)`, `(-92)`, `(93)`, `(-94)`, and `(-95)`. It is not a
global authority and is not accepted by the production launcher described
here.

## Proof-frontier relevance

Proof-blueprint session `019fdf9c` remains unchanged, open, and off-spine at
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`. This work
discharges no Lean obligation and proves no P97 theorem.

## Verification

Focused tests run in one pytest process with all numerical-library thread caps
set to one. They use fake transports only and run no live daemon, solver, Lean,
Git, commit, or push operation. Adversarial cases cover v2/v3 and schema
crossing, profile drift and forged profile lineage, shard fields, map/source/
producer substitution, boolean/float/subclass values, noncanonical bytes,
response/custody crossing, arbitrary append/solve lifecycle, exact version
identity, and the no-output/transport/job/solver-before-profile gate.
