# P97 PIQD cap-configuration census protocol v1

Status: `IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED`

Live search authorized: **false**. This document freezes the implementation
contract and its target-neutral fixture gate. It does not supply a T0 target
record, a T1 source-oracle record, an active wave authorization, a qualified
production resource supervisor, source entitlement, theorem coverage, or Lean
closure.

## Authority and scope

This specification implements the artifact and command contract reviewed in
`docs/plans/2026-08-23-cap-configuration-piqd-census-plan.md` and operated by
`docs/runbooks/p97-cap-configuration-ce-search.md`. When prose in those files
is broader than a concrete v1 record below, this specification controls the
machine-readable v1 spelling. A semantic or serialization change requires a
new schema/domain version.

The v1 implementation supports:

- independently enumerable target-neutral fixture cells;
- deterministic symmetry reduction and orbit validation;
- named sparse polynomial atoms over exact rationals;
- exact SAT model/readback replay;
- one authenticated PIQD SMT session and one solve per logical attempt at the
  adapter boundary, including bounded lifecycle reconciliation;
- immutable planning snapshots, append-only attempt state, deterministic
  result selection, and diagnostic coverage;
- offline reconstruction of the frozen backend-`none` fixture without PIQD or
  a solver.

The shipped fixture manifest is deliberately producer-neutral: it declares
backend/profile `none`, zero live attempts, and no live resource envelope. The
campaign tests inject a fake adapter and attestor to exercise custody,
classification, crash, and restart behavior. The CLI `run` path has no ambient
attestor and stops at `BLOCKED_RESOURCE_BOUNDARY` before network access. A
manifest naming a real solver and a registered resource/daemon attestor are
qualification work, not authority inferred from this spec.

The implementation does not promote a solver result into a mathematical or
Lean claim. `UNSAT_DISCOVERY_ONLY` remains discovery evidence even when every
declared fixture cell has diagnostic coverage.

## Compatibility and reuse map

| Cap protocol term | Existing repository term/component | v1 decision |
| --- | --- | --- |
| Canonical JSON, stored newline, raw hash, structured hash | `census.cap_configuration.schema` | Reuse directly; no second serializer |
| Named exact-QQ relation journal | `census.cap_configuration.encode.PolynomialSystem` | Reuse directly; cap-specific semantic ledger |
| Authenticated source query | `census.p97_search.phase3_piqd_smt_source_adapter.SourceSemanticQuery` | Reuse exact descriptor/source/journal validation |
| One-solver session lifecycle | `run_authenticated_single_solver_query` | Reuse; v1 adds the optional caller-owned request identity at this shared seam |
| PIQD JSON/byte transport and response types | `PiqdTransport`, `JsonResponse`, `BytesResponse` | Reuse; cap HTTP client implements this protocol only |
| PIQD solve and receipt result spellings | shared SMT adapter | Reuse verbatim |
| Project adapter classifications | shared source-semantic adapter vocabulary | Reuse verbatim; no cap aliases |
| Worktree run manifest | `worktree-run-manifest/v1` in `scripts/check_worktree_hygiene.py` | Reuse exact schema and self-hash |
| Filesystem no-follow/atomic-write patterns | shared P97 campaign and adapter code | Reimplement only the small cap snapshot boundary because its manifest, authorization, and run-root identities are new |
| Attempt identity and stage chain | existing attempt/index/hash-chain vocabulary | Reuse field names; cap records are new because shared CNF wave records cannot carry cap cell/system/replay bindings |
| Ordered campaign restart | existing authenticated JSONL/campaign patterns | Reuse strict order, append-only, idempotent exact duplicate, divergent duplicate rejection |
| SAT semantic replay | no existing generic cap polynomial verifier | New cap-specific boundary in `replay.py` |
| Universe, symmetry, orbit witness, omitted-source inventory | no existing generic cap universe contract | New cap-specific boundary in `universe.py` and `symmetry.py` |
| Wave authorization and one-time consumption | existing parent-bound authorization vocabulary | New strict cap record because it binds the cap manifest, run root, exact cell set, and resource envelope |
| Cell result and coverage | existing result/coverage vocabulary | New cap projection; preserves every raw attempt and shared classification |
| Offline validation | existing standalone validator pattern | New cap validator consuming only retained bytes |

No cap module starts, replaces, or upgrades PIQD. No cap module copies a raw
DIMACS launcher, daemon database reader, receipt parser, or proof-promotion
path.

## Serialization and byte custody

Canonical structured JSON is sorted-key compact JSON encoded directly as
UTF-8. Floats are forbidden. No Unicode normalization is performed. A stored
JSON artifact is its canonical JSON bytes followed by exactly one LF byte.

For a structured value `V` and ASCII domain `D`:

```text
SHA256(UTF8(D ++ "\n") ++ canonical_json(V))
```

The canonical JSON in that preimage has no terminal LF. Raw source, SMT,
journal, model, values payload, receipt, log, supervisor, telemetry, and
retained-file hashes cover their exact bytes. New cap fields carrying such a
digest end in `_raw_sha256`; a structured digest ends in `_sha256` and names
its domain in this specification. Reused shared-adapter artifact descriptors
retain their historical `sha256` spelling and always mean the raw bytes named
by the adjacent `path` and `bytes` fields.

Path-bearing inputs are canonical repository-relative POSIX paths. They are
ASCII, contain no backslash, empty component, `.` or `..`, and are opened one
component at a time below a held repository descriptor with `O_NOFOLLOW`.
Each directory component's pre-open name, opened descriptor, and post-open name
must have the same device/inode identity before traversal continues.
Regular-file status and link count one are checked from the held file
descriptor. Planning copies bytes from held descriptors into create-once
staging and atomically publishes immutable snapshots. Execution and validation
consume retained snapshots rather than reopening caller paths as authority.

Optional absence is recognized only when the initial lookup of the final file
or directory component returns `ENOENT`. A missing intermediate component, a
symlink or non-directory component, an inaccessible component, an `ENOENT`
after the final name was first observed, or any other inspection/open failure
is `BLOCKED_CUSTODY_OR_IDENTITY`. In particular, stat/open and read/recapture
races fail closed; they are never downgraded to an optional missing artifact.

## Frozen domains

| Field | Domain | Projection |
| --- | --- | --- |
| `campaign_id` | `cap-configuration-campaign-identity/v1` | manifest `identity` |
| `manifest_sha256` | `cap-configuration-census-manifest/v1` | manifest without the field |
| `cell_sha256` | `cap-configuration-cell/v1` | cell without the field |
| `orbit_ledger_sha256` | `cap-configuration-orbit-ledger/v1` | ledger without the field |
| `finite_ingress.payload_sha256` | `cap-configuration-finite-ingress/v1` | complete finite-ingress record |
| `replay_sha256` | `cap-configuration-semantic-replay/v1` | replay record without the field |
| `plan_sha256` | `cap-configuration-campaign-plan/v1` | plan without the field |
| `resource_attestation_sha256` | `cap-configuration-resource-attestation/v1` | attestation without the field |
| `attempt_id` | `cap-configuration-attempt-identity/v1` | admission `identity` |
| `admission_sha256` | `cap-configuration-attempt-admission/v1` | admission without the field |
| `stage_sha256` | `cap-configuration-attempt-stage/v1` | stage without the field |
| `outcome_sha256` | `cap-configuration-attempt-outcome/v1` | outcome without the field |
| `cell_result_sha256` | `cap-configuration-cell-result/v1` | result without the field |
| `coverage_sha256` | `cap-configuration-coverage/v1` | coverage without the field |
| `authorization_sha256` | `cap-configuration-wave-authorization/v1` | authorization without the field |
| `authorization_consumption_sha256` | `cap-configuration-wave-authorization-consumption/v1` | consumption without the field |
| `final_recapture_sha256` | `cap-configuration-final-recapture/v1` | recapture without the field |

## Manifest and universe

`cap-configuration-census-manifest/v1` has exactly `schema`, `identity`,
`campaign_id`, `publication`, and `manifest_sha256`. Its identity binds the
repository revision and generator/validator source manifests; target and
termination contract; claim flags; finite-ingress and orbit-ledger identities;
raw/canonical/orbit counts; ordered cell entries; solver/profile and resource
identities; variable/atom/omission/source ledgers; retry, admission, and
classification policy versions; and expected artifact schema versions.

Each ordered cell entry binds its dense ordinal, stable cell ID, structured
cell hash, and canonical relative file path. A fixture target has null named
consumers and false source-entitlement, theorem-coverage, universal-lift, and
Lean-closure flags.

The pure universe API treats generator/validator source-manifest digests as
declarations; it performs no filesystem I/O. `campaign plan` is the custody
boundary that opens each declared source once through held no-follow
descriptors, compares its raw digest, and snapshots those same held bytes. A
universe-only validation result therefore makes no source-byte custody claim.

`cap-configuration-cell/v1` binds raw and canonical representatives, orbit
witness and stabilizer, fixture/control kind or target payload, complete
`PolynomialSystem` record, enabled and omitted atoms, omitted-source inventory,
exact original and reconstructed journal raw hashes, and its self-hash.

`cap-configuration-orbit-ledger/v1` binds the group/action version, complete
ordered raw universe, exact permutation list, canonical orbit partition,
witness for every member, stabilizer for every representative, and its
self-hash. Validation independently checks identity, composition, inverse,
closure, membership, action closure, orbit disjointness/completeness, witness
action, canonical minima, and stabilizers.

The frozen target-neutral fixture has a nontrivial two-element slot-swap
action, three canonical control cells, every relation family across its atom
ledgers, and a deliberate omitted source predicate. Its expected control kind
is test metadata, not a solver result.

## Exact SAT replay

`cap-configuration-semantic-replay/v1` binds the system identity,
`values_raw_sha256`, ordered rational readback, per-enabled-atom truth ledger,
outcome, shared adapter classification, failure reason, verifier identity,
limits, and `replay_sha256`. Here the raw values payload is exactly the UTF-8
encoding of the retained solve JSON's `values` string after strict JSON
decoding; no Unicode normalization or alternate re-encoding is permitted. The
solve artifact descriptor separately authenticates the complete retained JSON
file bytes.

The parser accepts only the frozen PIQD SMT get-values S-expression grammar
whose leaves are exact integers or reduced rational forms. It rejects decimal,
floating, approximate, non-finite, algebraic, unsupported operator, missing,
duplicate, extra, reordered, oversized, over-depth, zero-denominator,
negative-denominator, and unreduced values. Readback covers the declared
variable order exactly once. Acceptance requires every enabled atom to evaluate
true under `Fraction` arithmetic.

Independent verification never trusts the digest stored in a replay record.
When `values_raw_sha256` is present it requires the separately retained values
payload, recomputes its raw digest, reparses it, reevaluates every atom, and
requires byte-identical canonical replay output. Parser limits may be tightened
by a caller but cannot exceed the frozen maxima.

Raw SAT with rejected replay is retained as
`INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`. A verifier exception or invalid
evidence is retained as `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`.

## PIQD request identity

An unnamed legacy shared-adapter call retains its existing request and response
shape. A named v1 call supplies a canonical UUID `request_id` and an ordered
assumption-label tuple. The shared seam sends and cross-checks
`request_id`, `request_sha256`, and `replayed` in both solve response and
receipt.

The request digest uses `piqd-smt-solve-request/v1` and binds the exact journal
command count, journal byte count and raw hash, timeout, model flag, ordered
assumptions, ordered complete `get_values`, and ordered assumption labels.
Same-ID/same-digest daemon replay is accepted; same ID with another digest is a
protocol failure. After a lost named-solve response, the one bounded retry is
accepted only when the daemon returns `replayed = true`; `replayed = false`
fails closed and cannot be retained as a reconciled solve. The offline
validator enforces the same rule. It never authorizes a second logical solve.

Named lifecycle recovery is also identity-bound. Create loss uses one exact
label/solver/profile session-list reconciliation and never issues a replacement
create. Append loss accepts only the exact pre- or post-journal frontier;
both named and unnamed export get one bounded read retry; close loss is
reconciled by authenticated status and bounded cleanup, with one bounded status
retry at each reconciliation point. If closure still cannot be proved, the
lifecycle records `closure_unproven` and no complete result is published. After
a process restart, an exact live or closed session may resume. Recovery keeps
the original loss lifecycle byte-for-byte and publishes a distinct immutable
final lifecycle; offline validation authenticates both. A missing session
permits a create only when the retained adapter directory was empty before
resume; any preexisting adapter intent plus missing daemon state fails closed
rather than risking a duplicate solve. The online cap entrypoint independently
authenticates exactly one retained `cell.json`, exactly one polynomial-system
snapshot, and every cell/system/semantic digest cross-binding before transport.

## Planning, execution, and validation

The command surface is:

```text
python -m census.cap_configuration.campaign plan MANIFEST RUN_ROOT --authorization AUTHORIZATION
python -m census.cap_configuration.campaign run MANIFEST RUN_ROOT --authorization AUTHORIZATION --base-url PIQD_BASE_URL
python -m census.cap_configuration.campaign status RUN_ROOT
python -m census.cap_configuration.validate MANIFEST RUN_ROOT
```

`plan` makes no network or solver call. It admits the immutable inputs,
snapshots exact bytes, creates the registered run root and
`worktree-run-manifest/v1`, and publishes a plan record atomically.

`run` first validates the retained prefix and immutable snapshots. Before any
PIQD mutation it authenticates the expected daemon/solver identity, consumes
one wave authorization, validates and retains resource attestation, and prints
`CAP_CONFIG_RESOURCE_ATTESTATION=PASSED`. It then processes dense cell ordinals
with one append-only logical attempt per declared attempt identity. A retained
attempt may exist only after every earlier ordinal is terminal; sparse or
out-of-order prefixes are not resumable. There is no fallback or undeclared
second solve.

`status` reports observed structure only. `validate` makes no network or solver
call. It reconstructs the retained prefix, request/source/snapshot/final
recapture binding, stage chains, exact SAT replay, deterministic result
selection, and diagnostic coverage.

## Authorization and resources

`cap-configuration-wave-authorization/v1` binds the campaign/manifest, run
kind and exact run root, active plan/checkpoint, parent record, exact ordered
allowed cell set, expected PIQD daemon/solver/profile identity, resource
envelope, issue/expiry/revocation state, issuer, and `max_children = 1`.

This fixture-only v1 freezes `parent` to JSON `null`. No non-null live-parent
schema is yet qualified, so every other parent value fails closed rather than
being accepted under an inferred shape.

The immutable consumption record binds the authorization hash, run root,
campaign, canonical ordinal-zero child attempt identity, consumption time, and
its self-hash. Retained consumption is revalidated before reuse. A second
consumption, changed authorization, crossed attempt or run root, revoked
authorization, or expired authorization fails closed.

Fixture and target-preflight tiers require one process and a retained wall
boundary while explicitly claiming no production memory ceiling. Pilot,
campaign, and production resume require a manifest-bound qualified external
CPU/RSS/process/disk supervisor and telemetry identity. Until that registered
supervisor is present, those run kinds stop with
`BLOCKED_RESOURCE_BOUNDARY`.

## Results and coverage

The adapter classifications are exactly:

- `SAT_SEMANTICALLY_REPLAYED`;
- `UNSAT_DISCOVERY_ONLY`;
- `INCONCLUSIVE_UNKNOWN`;
- `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`;
- `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`;
- `INCONCLUSIVE_TRANSPORT_LOSS`; and
- `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT`.

The fixture-only v1 runtime admits exactly one attempt, index `000000`, per
cell and selects it under the frozen `single_attempt` policy. Extra attempt
indices, conflicting retained attempts, and reselection are custody failures,
not fixture classifications. Multi-attempt conflict resolution (including
lowest-index decisive and highest-index eligible-terminal selection) belongs
to a future reviewed live schema; this implementation does not provide or
qualify it. A nonterminal or orphan fixture attempt blocks complete coverage.

Coverage is `COMPLETE` only when every declared cell has one validator-accepted
diagnostic classification and all identities/stages pass. The fixture-only v1
controller is exhaustive and implements neither `FIRST_VALID_WITNESS` nor
`NEGATIVE_BRANCH_CLOSURE`; those termination policies require a future live
schema and qualification. Coverage is diagnostic and has no promotion-status
field.

## Qualification status

The frozen wrapper and implementation adversarial audit pass in the isolated
implementation worktree. The implementation remains unqualified for live
search until a fixture canary is independently reproduced under an active
authorization, a non-null parent schema and registered resource attestor are
reviewed and qualified, and the operator runbook records the verifying
implementation commit. Until then the runbook must not say `READY` and the
controller must not infer live authority from this specification.
