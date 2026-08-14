# P97 CEGAR wave framework consolidation plan

Date: 2026-08-13

Status: implementation in progress. This document changes neither solver
semantics nor theorem status.

## Decision

New CEGAR waves should normally be data, not new Python programs.

The repository should converge on one small control schema that references the
existing canonical wave manifest, one shared execution engine, one shared
command-line interface, and a small allowlisted set of semantic adapters. A
wave may add a manifest, source snapshots, a variable map, and mathematical
validation data. It should not add its own
exporter, PIQD launcher, receipt parser, publication helper, offline checker,
or test harness unless it introduces a genuinely new semantic or trust
boundary.

Existing scripts are not to be deleted merely because a generic replacement
exists. Historical scripts and their byte identities remain replay inputs until
their callers are inventoried and the generic path has reproduced their
artifacts under shadow validation. Retirement means removal from the active
production surface, with a durable compatibility index; it does not mean
rewriting old receipts or mutating old campaign directories.

## Why this is worth doing

The current Exact17 Python surface alone contains 146 files and roughly 35,400
lines. The recent Child34--Child41 sequence accounts for 46 files and 9,375
lines:

| Repeated role | Files | Approximate lines |
|---|---:|---:|
| per-wave validators | 16 | 4,454 |
| exporters | 8 | 1,486 |
| PIQD launchers | 8 | 1,422 |
| publication/ingress tests | 9 | 1,043 |
| generators and generator tests | 5 | 970 |

Most of this growth is repeated execution-custody machinery. The mathematical
differences are usually much smaller: a different source declaration, parent
checkpoint, variable map, constraint family, model replay, or promotion
consumer.

The first measurable target is to replace the 46-file active Child34--Child41
surface with at most six maintained Python entrypoints plus declarative wave
packages, an 87% reduction in active Python files. This is a target for the
active surface, not a license to erase historical evidence.

## Existing foundation

This plan extends rather than replaces the current control plane:

- `phase3_cegar_wave.py` already owns canonical wave manifests, attempt
  journals, outcome classes, and publication assessment;
- `phase3_cegar_runtime.py` already owns effect protocols, bounded no-follow
  capture, atomic publication, ledgers, and terminal-proof publication;
- `phase3_piqd_driver.py` already owns the generic raw-DIMACS driver policy,
  durable attempt journal, PIQD client boundary, and proof replayer interface;
- `phase3_piqd_oracle.py` already owns strict raw-DIMACS transport validation;
- `phase3_piqd_theorem_gated_discovery.py` already owns successor-wave and
  theorem-gated discovery operations;
- `phase3_piqd_campaign.py` already owns campaign admission and custody. It is
  intentionally not a general scheduler.

The consolidation must use these contracts. It must not create a second,
weaker manifest or receipt vocabulary.

## Target architecture

### 1. Declarative wave package

Each wave lives in a data directory, for example:

```text
census/p97_search/waves/<family>/<wave-id>/
  wave.json
  variable-map.json
  source-manifest.json
  semantic-packet.json
  fixtures/
```

`wave.json` is a small control record, provisionally
`p97-cegar-wave-control/v1`. It is not a second wave manifest. It contains only
canonical JSON values, rejects unknown or missing fields, and binds:

- the path and SHA-256 of the exact canonical existing `p97-cegar-wave/v1`
  manifest bytes, which remain authoritative for source, parent, execution,
  promotion, and publication identity;
- a fixed adapter identifier and version;
- exact references to the already-authenticated package artifacts;
- resource policy; and
- the independent domain-validator identifier.

It must not duplicate fields from the canonical wave manifest or reconstruct a
second source of truth. Any supplementary artifact reference is authenticated
against both the control record and the authoritative manifest before use.

The manifest must not contain Python import strings, arbitrary callables, shell
argument arrays, executable paths, or transport credentials. Runtime
capabilities are supplied out of band by the trusted launcher and selected from
a fixed registry.

### 2. Fixed executor registry

The shared implementation now supports `STATIC_CNF` and the closed
`ASSUMPTION_CNF` profile described below. Later implementations may add the
remaining deliberately separate execution kinds, one trust boundary at a time:

| Kind | Shared implementation boundary | Allowed conclusion |
|---|---|---|
| `STATIC_CNF` | raw-DIMACS PIQD driver | replayed SAT or discovery UNSAT |
| `ASSUMPTION_CNF` | one-session sequential PIQD assumptions over one authenticated parent | replayed SAT or discovery UNSAT |
| `INCREMENTAL_CNF` | later append-capable incremental PIQD session adapter | replayed SAT or discovery UNSAT |
| `SMT_ONESHOT` | future generic authenticated single-solver SMT boundary; existing FreshThird remains specialized until then | exact-replayed SAT or diagnostic UNSAT/UNKNOWN |
| `TERMINAL_PROOF` | local terminal-proof runner and publisher, separate from PIQD proof replay | certified local UNSAT only after proof replay |
| `EXTERNAL_PROCESS` | authenticated process-custody adapter such as Singular | process outcome only |

Selection is an immutable code-defined allowlist keyed by
`(wave_kind, adapter_id, schema_version)`. The receipt additionally pins the
registry revision, adapter implementation identity, capability identity and
version, domain-validator identity, and applicable solver/checker binary
identities. A manifest selects a stable identifier; it never dynamically
imports code. Adding an executor requires a code review because it changes a
trust boundary. Adding a wave that uses an existing executor does not.

The common engine performs, in order:

1. strict canonical manifest validation;
2. componentwise no-follow capture of every declared input;
3. exact hash, size, schema, source, parent, and budget checks;
4. create-once custody-directory creation;
5. dispatch through the fixed adapter registry;
6. independent domain-specific result validation;
7. authentication of the modality's existing authoritative journal or receipt;
8. exact post-run input and artifact recapture;
9. atomic no-replace publication; and
10. offline revalidation of the published result.

The engine produces one thin common receipt envelope plus an adapter-specific
semantic result. The envelope binds the authoritative domain receipt or journal
seal; it does not replace it or introduce a competing attempt chain. Static CNF
keeps `DurableAttemptJournal`, incremental CNF keeps its session journal, SMT
keeps its session receipt, and Singular keeps its custody artifact directory.
The envelope records custody and execution facts only; it never manufactures a
mathematical verdict.

The first engine inherits the current same-user filesystem custody model. It
must not claim universal held-descriptor protection: current publishers and
journals still reopen some paths. Stronger hostile-filesystem guarantees require
a later capability-rooted journal and publisher API that accepts and retains a
held custody descriptor.

### 3. One command-line interface

The intended production surface is one module, provisionally:

```text
python -m census.p97_search.cegar_wave_cli <command> ...
```

Commands:

- `plan SPEC`: validate and print the immutable identity without execution;
- `export SPEC OUT`: materialize a package only for a registered exporter;
- `run SPEC OUT`: execute exactly one wave or resume its append-only journal;
- `validate-ingress SPEC`: validate an externally produced package;
- `validate-output SPEC OUT --package-root ROOT`: perform a zero-network,
  zero-solver replay cross-bound to the authenticated control and package;
- `mine-diagnostic OUT`: run the wave's allowlisted candidate miner without
  implying theorem promotion;
- `status OUT`: inspect envelope/custody self-consistency only, returning
  `STRUCTURAL_ONLY`/`OBSERVED` rather than an authenticated pass; and
- `check SPEC OUT`: run the complete offline validation gate.

Campaign admission remains an explicit campaign-specific adapter or the
existing campaign command. It is not a generic engine operation: its required
state, package, classifier, and source-derived checks are campaign-specific.

One small shell wrapper may set resource caps and invoke this CLI. There should
not be a new shell script per wave.

### 4. Wave-specific semantic plugins

Some code must remain mathematical and wave-specific. It belongs in a small
adapter or validator registry when it does one of the following:

- constructs a genuinely new encoding rather than selecting data for an
  existing encoding;
- independently replays a new model semantics;
- introduces a new solver protocol or response vocabulary;
- maps an assumption/core name to a source-level theorem statement;
- constructs or checks a new proof/certificate format; or
- defines a new theorem-promotion boundary.

Literal clause families, parent hashes, source theorem names, row tables,
candidate orders, expected dimensions, and promotion targets are data. A new
Python file is not justified merely because the child number changed.

Semantic adapters must be registered by a stable identifier and have their own
shared adversarial suite. A manifest may select an identifier but cannot inject
code.

## Trust and proof invariants

Consolidation is acceptable only if it preserves all of these boundaries:

1. Exact submitted CNF or SMT bytes, producer manifest, variable map, source
   snapshots, and parent identity remain content-addressed.
2. PIQD discovery receives no proof path. An observational UNSAT result is not
   promoted as a certificate.
3. A terminal UNSAT claim still requires the existing fresh identical-formula
   local proof run and independent DRAT/LRAT replay where the lane requires it.
4. SAT is accepted only after the lane's independent semantic replay, not from
   a daemon verdict alone.
5. UNKNOWN, timeout, malformed evidence, response loss, and custody drift are
   inconclusive and never trigger an implicit local fallback.
6. Attempts and retries are append-only. A retry receives a new attempt or
   campaign identity and never overwrites an old artifact.
7. Generic receipts attest execution and custody only. They do not imply source
   entitlement, universal lifting, theorem consumption, Lean closure, or
   `sorry` discharge.
8. Each completed CEGAR wave triggers one bounded mine of that wave's new data
   for general theorem candidates. Ordinary proof work does not repeatedly
   rerun the corpus search without a new candidate.
9. A cube campaign uses a verified covering family, not an assumed partition:
   each child CNF is exactly the parent clauses plus its cube units, coverage is
   encoded by the exact negated-cube CNF, every UNSAT child has a checker-verified
   LRAT, and the coverage LRAT is checked against the authenticated parent. Do
   not claim pairwise disjointness unless a separate overlap check proves it.
10. A checker execution hashes its private checker copy before and after use and
    records that exact identity in the receipt.

## Migration plan

### Implementation checkpoint — 2026-08-13

The first executable framework tranche is implemented without migrating a
production wave:

- `phase3_cegar_wave_control.py` provides the strict control parser, closed
  adapter registry, authenticated static-package binding, and dry-run cleanup
  plan generator.
- `phase3_cegar_wave_engine.py` provides the first reusable `STATIC_CNF`
  execution boundary, a self-hashed result envelope, and a transport-free
  offline validator. It remains discovery-only: its UNSAT classification is
  not a certificate or theorem claim.
- `cegar_exact17_shadow.py` provides an offline comparator for the preserved
  Child38 and Child39 publication bundles. It captures the legacy inputs
  twice, binds them to the closed `STATIC_CNF` control, and reports observed
  parity without starting PIQD, a solver, Lean, or transport.
  JSON inputs must be either the compact canonical encoding or the exact
  sorted, two-space-indented, LF-terminated legacy encoding; duplicate keys,
  non-finite numbers, reordered or differently spaced encodings, symlinks,
  hardlinks, and path/inode replacement are rejected. The create-once shadow
  receipt is written and recaptured through one held parent-directory and
  file descriptor, fsynced, and rebound to the unchanged parent pathname
  before it is accepted.
  The legacy ingress `daemon_build_receipt` is always validated as an exact
  absolute-path/lowercase-digest sealed reference. It enters the comparator's
  independently captured artifact digest table only when the caller also
  supplies that artifact for a fresh no-follow, single-link recapture; an
  omitted or legacy hard-linked receipt is not silently promoted to captured
  custody.
- `phase3_cegar_cleanup.py` provides the cleanup safety boundary. It consumes
  only an exact digest-selected plan, moves approved compatibility shims into
  a create-once quarantine, and emits an immutable quarantine receipt
  supporting later rollback. It has no
  deletion or purge API, and no cleanup has been executed as part of this
  checkpoint.
- `scripts/test-p97-cegar-wave-framework.sh` is the single one-process,
  thread-capped gate for these framework modules.

The shared CLI and registry-driven wave discovery are now implemented. Child38
also has the compatibility lifecycle route described below. The first
data-only native wave is now registered as described below; the first native
execution and the later shim retirement pass remain pending.
Quarantine execution remains last and requires a separately reviewed exact
inventory and plan digest after those migration gates pass.

### v2 closed-registry and Child40 replay checkpoint — 2026-08-14

The v1 control and execution identities remain frozen: the v1 registry
snapshot, aliases, and receipt-envelope fields are byte-compatible and are not
reinterpreted as v2. Any v2 execution must select the closed, code-defined v2
registry entry; there is no fallback to an unregistered adapter or to the v1
semantic boundary. The v2 contract keeps the authenticated input manifest
separate from the execution manifest/envelope, and separately binds the
semantic profile and its declared artifacts. These records are joined by exact
digests, not by an import path, inferred filename, or wave-specific launcher.

The production Child40 semantic profile at
`census/p97_search/waves/exact17/child40/semantic-profile.json` now passes
offline replay of nine authenticated artifacts totaling 583,289,004 bytes:
308 variables, 5,847,584 clauses, and child CNF SHA-256
`555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034`.
The replay log is retained at
`scratch/cegar-wave-v2/child40-production-profile.log`.

This is semantic-profile replay evidence only. It is not a new PIQD
execution, does not promote a wave, and does not authorize cleanup. The full
framework gate is green at 179 passed with Ruff clean; that result validates
the shared contracts and offline fixtures, not a new mathematical or runtime
claim.

### Child40 native data-only registration — 2026-08-14

Child40 is now represented by four data records under
`census/p97_search/waves/exact17/child40/`: a complete 308-entry variable map,
canonical producer and wave manifests, and a closed v4 control. No new
Child40-specific Python runner, exporter, validator, or shell gate was added.
The registered `v3-data-only` adapter can plan and authenticate ingress, but it
does not advertise execution, output validation, or checking and rejects a run
before engine construction or filesystem publication.

The retained daemon-build receipt is a historical three-link file. The v4
control models that exact fact as a closed role-specific legacy-reference
policy: only `daemon_build_receipt` may have link count three, and its held
no-follow capture still binds stable device, inode, size, bytes, digest, path
chain, and link count. Every executable v1/v2 registration and every other
artifact role continues to require link count one. This exception authenticates
retained evidence; it does not grant execution custody or permission to copy,
rewrite, unlink, quarantine, or delete the receipt.
New data-only packages use an empty retained-hardlink policy and therefore keep
single-link custody for every role.

The native records reproduce the reviewed Child40 formula at 308 variables and
5,847,584 clauses, bind all nine semantic artifact roles, and independently
reconstruct the complete hit/next-center/named-order variable map. This remains
offline data-only evidence: no PIQD session, solver run, publication, theorem
promotion, or cleanup occurred. Legacy Child40 entrypoints and artifacts remain
required for comparison, rollback, and the later zero-caller cleanup gate. The
full shared framework gate passed 289 tests with one environment-dependent
fixture skip, Ruff lint clean, and all 23 scoped files format-clean. The
canonical v4 control SHA-256 is
`43eabb1c79f9d26720569450ddb5b5a3224e91bcc7d75c953c80f96e0a690c83`.

Cleanup remains the final, separately approved operation: first generate a
dry-run plan from the externally authenticated inventory and exact trusted
allowlist; then require standalone engine validation, semantic/artifact
comparison, zero references and writers, immutable archive, verified rollback,
and separate review of the exact plan digest; only then may a move-only
quarantine produce its immutable receipt. Retain the quarantine and protected
evidence through the rollback window, and rescan the authenticated inventory
before any separately reviewed source removal or purge. No automatic deletion
is permitted.

### Child45 native data-only registration — 2026-08-14

Child45 now uses the same declarative boundary as Child40. Four canonical
data-only records under `census/p97_search/waves/exact17/child45/` bind its
closed semantic profile, static producer, wave manifest, and v4 data-only
control. A fifth canonical record selects the existing generic executable-v2
registration. The package reuses Child40's complete 308-entry variable map by
exact path, byte count, and SHA-256; it does not duplicate that map and adds no
Child45-specific Python runner, exporter, validator script, or shell gate.

The closed `exact17-child45` validator authenticates exactly seven retained
single-link artifacts totaling 583,428,488 bytes: the 5,848,820-clause Child44
parent, the 5,848,824-clause Child45 child, the authenticated Child44 SAT model
and final custody record, the immutable Child45 export receipt, and the exact
Lean root/export sources. Its immutable source authority pins the complete
profile plus all seven artifact digests. Offline replay independently checks
the byte-identical parent prefix, ordered four-clause suffix SHA-256
`7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590`,
parent-subsumed suffix index 1, model-rejected suffix index 3, total parent SAT
replay, one-core/process completion custody, receipt/Lean paths and hashes, and
all final cross-bindings.

The canonical profile, producer, wave, and control SHA-256 values are
`596c27ccfa4fcc0156fc8aec10a38294e07e70f16c33129e7e16af0788ed37cf`,
`f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a`,
`b6348262596549529f8b506d0c235586409b88beecb622216f66f31a37061a26`,
and `0ab189b9dc6a7b43be7fab12deb34682d9f0b40e9f014bbeb92c25d7a52c7fe1`.
The separately authenticated executable-v2 control SHA-256 is
`70e2bfb569a16a47e102ccd8cd9aca1e74a4f7b95154060a66d9a601d5564657`.
The v4 control has an empty retained-hardlink exception map and resolves only
the shared data-only capabilities `plan`, `status`, and `validate-ingress`.
It cannot run or validate an execution output.

This checkpoint authenticates preserved finite evidence only. It does not open
a PIQD session, run a solver, promote a theorem, or authorize cleanup. The
separately reviewed executable-v2 control is recorded below; the next step is
one static child run through the existing generic CLI, with no parallel
per-wave wrapper. The final shared gate passed 315 tests with one
environment-dependent retained-artifact skip, Ruff lint clean, all 23 scoped
files format-clean, and an independent adversarial audit PASS. Cleanup stays
last: retain both data
packages and legacy evidence until exact zero-caller/zero-writer inventory,
immutable archive, rollback, and move-only quarantine gates pass under a
separately reviewed plan digest.

### Child45 generic executable-v2 control — 2026-08-14

`execution-control-v2.json` is the exact canonical projection of the reviewed
v4 data-only record: its control schema is `p97-cegar-wave-control/v2`, its
adapter schema is `v2`, and the data-only `retained_hardlink_counts` field is
absent. Every manifest, package, policy, semantic-profile, semantic-artifact,
path, size, and digest field remains byte-for-byte equal. The closed registry
therefore supplies only the shared `check`, `plan`, `run`, `status`,
`validate-ingress`, and `validate-output` capabilities.

No new Child45 runner, launcher, validator, or shell script is involved. The
only production entrypoint is
`python -m census.p97_search.cegar_wave_cli`, which dispatches the generic v2
static engine with literal `proof_path=None`, one worker/core, create-once
output, retained journal custody, and standalone offline validation. The
control has passed canonical derivation, closed-registration, and complete
production ingress replay. It has not yet opened a PIQD job or run a solver.
That live step requires a clean immutable checkpoint, an idle maintained
daemon, fresh output/journal custody paths, and a separate immediate preflight.
Cleanup remains last and unauthorized.

### Exact17 frozen shadow checkpoint — 2026-08-14

The hardened comparator was run offline against the preserved Child38 and
Child39 bundles under `scratch/exact17-lean-to-sat/`. It emitted create-once
receipts under
`scratch/p97-cegar-wave-framework/exact17-shadow-20260814-v3/`:

- Child38: `SAT_OBSERVED`, 308 variables, 5,847,276 clauses, CNF SHA-256
  `07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`,
  receipt SHA-256
  `244d79619e76860e84c9f4dca5bf5c48cbfe391645a67a51c4dcbf4754f2cf7d`.
- Child39: `SAT_OBSERVED`, 308 variables, 5,847,388 clauses, CNF SHA-256
  `989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`,
  receipt SHA-256
  `3bf0678011f9da44f0dff0b475c6112c963218bf0724010a726ac6e57b3f4eeb`.
  Its exact 112-clause ordered suffix over Child38 has SHA-256
  `4cc66a1b3f4af46d60ed0a2c59f4fb6b0cb016f3ab1b111989ffe015f5b33925`.

This closes the frozen offline parity fixture only. The legacy runtime has not
been retired, the shared runtime has not produced a replacement production
wave, and no cleanup target is authorized by these receipts.

### Exact17 Child38 compatibility lifecycle checkpoint — 2026-08-14

The shared CLI now owns the closed `exact17-child38` lifecycle profile and its
`validate-local`, `live-identity`, `start`, `reconcile`, and `finalize`
commands. This is an operational routing migration, not a native-engine
rewrite: it delegates to the existing hardened Child38 lifecycle so intent,
prepared-job, confirmed-state, final-result, model, solver-log, lock, and
response-loss reconciliation semantics remain unchanged. The route is
sequential, one-worker, and has no local fallback.

Fake-current lifecycle tests cover a complete start plus SAT/model-replay
finalization and a lost prepare response followed by explicit reconciliation.
The latter confirms exactly one submission and one confirmation; it never
resubmits the job.

The shared cleanup-status command is report-only and currently returns
`RETAIN`. No file is moved or deleted. Child38's compatibility implementation,
Child39's frozen shadow and successor inputs, and Child32's base lifecycle and
historical evidence remain protected. Native shared lifecycle support, a fresh
native campaign with semantic validation and successor admission, a rollback
drill, and a zero-caller rescan are required before the compatibility shim can
become a quarantine candidate.

### Current-SAT assumption-session prerequisite — 2026-08-14

The maintained incremental discovery runner now exposes an opt-in, closed
assumption-solve contract for the future `ASSUMPTION_CNF` engine. The public
runner defaults to the current Rust SAT response schema; historical legacy
shapes are selected only by explicit frozen/test callers. Nonempty assumption
solves require canonical signed literals, explicit opt-in, and a canonical
request UUID. Before transport, the runner durably records the exact base
identity, assumptions, resource limits, UUID, and independently recomputed
`piqd-solve-request/v1` digest.

An uncertain transport failure retries only the identical request. A durable
pending request survives restart with either zero remote receipts (the request
did not reach the daemon) or one exactly matching receipt (the response was
lost); larger or crossed suffixes fail before local custody mutation. While a
request remains unresolved, append and close issue no remote mutation. SAT
models replay against the current frontier and assumptions; UNSAT cores must be
canonical subsets, and an empty core is observational terminal discovery only;
UNKNOWN is inconclusive. None of these paths produces proof, theorem, Lean, or
cleanup entitlement.

The prerequisite alone is intentionally not the large-parent campaign engine.
Its byte-backed descriptor still materializes ordinary seeds, so the 291 MB
Child44 parent is handled by the streaming adapter in the next checkpoint. The
focused current/legacy/restart matrix passes 188 tests, including independent
adversarial review; no live daemon or solver was used for this checkpoint.

### Streaming `ASSUMPTION_CNF` engine checkpoint — 2026-08-14

The v3 control and closed registry now add exactly one assumption campaign:
the reviewed Exact17 Child44 next-center profile. The profile authenticates one
308-variable, 5,848,820-clause, 291,704,790-byte parent; thirteen canonical
next-center cells; the exact CaDiCaL identity and deterministic resource
limits; and the sole registered source-semantic SAT replay. Manifests select
this reviewed identifier, never a Python import string or caller-supplied
callback.

`phase3_piqd_assumption_campaign.py` streams the parent through componentwise
no-follow, unique-regular-file custody without retaining its clauses or full
bytes. It authenticates the completed producer job, job-scoped blob, exported
session journal, current solver identity, request digest, durable receipt, and
post-solve session state. Every nonempty solve has a deterministic UUID and an
identical-request recovery route. A pending request blocks a different solve,
append, and close until `retry_pending()` resolves it; close response loss is
reconciled without a second DELETE. The engine re-captures the full streamed
parent identity after the final solve both before close and again immediately
before publication, and rejects byte-identical inode or ancestor replacement.
Live and offline UNSAT cores must both be canonical ordered,
noncontradictory assumption subsets.

`phase3_cegar_assumption_engine.py` opens one fresh sequential session, visits
the exact thirteen cells, replays every SAT assignment through the registered
Child44 source decoder, records nonempty-core UNSAT as discovery only, treats
UNKNOWN as inconclusive, and stops the suffix as `NOT_RUN` after an empty-core
parent-terminal discovery. It closes once before create-once publication. The
offline validator rebinds the current control, streamed parent identity,
campaign, producer, variable map, session receipts, request IDs, solver
descriptor, semantic-result digests, and canonical envelope without network or
solver access.

The common registry and CLI dispatch by the exact registration. Static-only
arguments are rejected by assumption runs, assumption-only solver identity is
rejected by static runs, and `status`/`validate-output` understand both frozen
static and assumption envelopes. The v1 static registry snapshot remains
byte-identical. Fake/adversarial tests cover the streaming adapter, profile,
engine, registry, and CLI; a live Child44 campaign has not been run in this
checkpoint.

### Child45 generic assumption-campaign package — 2026-08-14

Child45 is also represented entirely by declarative data consumed by the shared
`ASSUMPTION_CNF` engine. The three canonical records
`assumption-campaign.json`, `assumption-wave-manifest.json`, and
`assumption-control.json` live beside the existing Child45 static package. They
reuse the existing Child45 producer manifest and Child40 variable map and add
no wave-specific runner, launcher, validator, or shell script.

The campaign authenticates the completed Child45 static job, the 308-variable,
5,848,824-clause Child45 root, and the distinct 5,848,820-clause Child44 source
parent. It contains exactly the thirteen reviewed singleton next-center cells
0–7 and 12–16, including center 15. The optional historical Child44 plumbing
canary is intentionally omitted because it is neither a production cell nor an
authority for this campaign. The wave manifest binds
`source.ingress_hypotheses_sha256` to the authoritative Lean source root
`BlockerVExactSeventeenFortyFourthModelRefinements.lean`, not to either CNF or
the nested producer source manifest.

The canonical campaign, manifest, and control SHA-256 values are
`845e9a10137267764e07bca6e2d01c1a0b3dff5856e646b569b8c46d51c7d48f`,
`327c9a558b6828c77a69288780aaec7aec1ee17334267086eaf9fd5a9b4a0af5`,
and `ba086684a71e8dd3def1f2d10f62271677a9abafd220e420c35fc64c1b427e2b`.
The generic CLI must pass `plan` and `validate-ingress`, and the shared offline
validator must accept the closed Child45 replay schema while rejecting crossed
root, source-parent, suffix, and dimension evidence before any live campaign is
authorized.

This package is an immutable execution checkpoint, not a result. No assumption
session or cell solve is implied by its presence. SAT remains admissible only
after complete source-semantic replay; nonempty-core UNSAT remains finite
discovery evidence; UNKNOWN remains inconclusive; and empty-core observational
UNSAT still requires an independently checked terminal proof route before any
promotion.

All proof, theorem, Lean, closure, source-entitlement, universal-lift, and
cleanup claims remain false. An empty assumption core is still observational
UNSAT discovery, not a checked terminal proof. Cleanup remains the last,
separately reviewed move-only quarantine phase; this checkpoint does not move,
delete, or authorize retirement of any legacy wave file.

### Phase 0: first implementation tranche — freeze, inventory, and cleanup plan

The first implementation tranche is a dry run for cleanup plan generation only.
It may read, classify, hash, and compare artifacts, but it must not instantiate
the consolidated executor, run a wave, mutate a campaign directory, quarantine
or remove source, or delete anything. Its durable output is a canonical,
content-addressed plan and its supporting inventory evidence.

- Start from an externally authenticated inventory SHA-256 and an exact trusted
  entrypoint allowlist. Record both values, and their authentication evidence,
  in the plan; a locally recomputed hash without external authentication is not
  sufficient.
- Generate a machine-readable index of every active wave script, its callers,
  references, writers, data dependencies, output schemas, receipts, artifacts,
  replacements, archives, rollback evidence, and historical replay evidence.
- For every legacy caller, record exact script and dependency identities,
  argv, environment, working directory, owner, output schema, and receipt-reader
  behavior. Add an executable replay smoke before changing or removing it.
- Mark each entry `ACTIVE`, `HISTORICAL_REPLAY`, `COMPATIBILITY_SHIM`, or
  `UNCLASSIFIED`.
- Do not delete or rewrite anything while an entry is `UNCLASSIFIED`.
- Pin the current Child34--Child41 artifacts and all external callers before
  changing their launch paths.
- Cleanup targets in this tranche may be exact, hash-pinned entries for
  approved compatibility-shim entrypoints on the trusted allowlist only. A
  glob, directory, generated path, historical script, receipt, artifact, or
  unlisted executable is not a target.
- Protect the complete evidence closure: all callers, references, receipts,
  artifacts, replacements, archive and rollback material, and replay evidence
  remain retained and are never cleanup targets. A candidate is eligible for a
  later executor only after the authenticated inventory and a fresh rescan show
  zero references and zero writers, the semantic shadow check is `PASS`, an
  immutable archive is present, and rollback has been verified.
- The plan records the exact target set, protected set, evidence identities,
  rollback window, and canonical plan digest. There is no automatic deletion.
- Any later cleanup executor is a separate reviewed change and must be invoked
  with this exact plan digest; it may not silently consume a newer or inferred
  plan. If cleanup is eventually approved, quarantine and retain an immutable
  archive before source removal, keep the protected evidence through the
  rollback window, and rescan the authenticated inventory after every removal
  to reverify zero references and zero writers.

The bounded quarantine implementation in
`census/p97_search/phase3_cegar_cleanup.py` is deliberately dormant during
this tranche. It accepts only a canonical plan whose digest, externally
authenticated inventory, and trusted entrypoint allowlist still agree; it
revalidates exact no-follow single-link regular files, re-digests each source
through a held descriptor immediately before rename, and atomically moves
approved shims through held no-follow quarantine descriptors before writing an
immutable receipt. Both cleanup planning and execution require the repository
root to be an exact absolute canonical no-symlink path; aliases such as the
macOS `/var` to `/private/var` path are rejected before target classification
or quarantine creation instead of silently producing an empty plan. Cleanup is
last in the migration order: activation is not a Phase 2 execution gate and
remains deferred until standalone validation, actual
engine-run tests, and evidence comparison pass. The executor is move-only
quarantine. The shared engine output root, including its `engine-envelope.json`,
sole attempt directory, and exact six-entry attempt inventory
(`attempt.jsonl`, `attempt.jsonl.lock`, `attempt.jsonl.artifacts/`,
`attempt.jsonl.seal.json`, `solver-receipt.json`, and `custody-seal.json`), is
protected evidence and is never a cleanup target. A post-move digest failure or
other failure after one or more moves may leave a partial quarantine root
without a receipt; the source has already moved, so preserve that root and its
entries as explicit rollback-window state for separate review and do not retry
or purge automatically. The module exposes no deletion or
purge API. Source removal, rollback-window expiry, and any future reviewed
purge remain separate operations, with an inventory rescan required after each
eventual removal.

Exit gate: no active or externally invoked script is unclassified.

### Phase 1: schema and registry

- Implement the strict wave-control parser and canonical identity while keeping
  `p97-cegar-wave/v1` authoritative.
- Define the `STATIC_CNF` executor interface and the fixed adapter/validator
  registry. Record the other modalities as later interfaces, not as already
  generalized APIs.
- Add hostile-schema, type-confusion, path, symlink, hardlink, replacement,
  oversize, and unknown-adapter tests.
- Add a repository check that a wave manifest cannot name arbitrary Python or
  shell execution.

Exit gate: specs can be parsed and authenticated without importing a wave
module or contacting a solver.

### Phase 2: common engine and CLI

- Extract the static-CNF shell presently repeated in Exact17 runners: input
  capture, PIQD policy, existing durable journal, receipt-envelope publication,
  and offline validation.
- Implement the static-CNF CLI surface and stable receipt-envelope schema.
- Keep campaign admission separate from execution scheduling.
- Make every command deterministic and noninteractive; resource caps and one
  worker remain explicit.

Exit gate: known static-CNF SAT, discovery-UNSAT, UNKNOWN, response-loss, and
custody-tamper fixtures pass through one engine without wave-specific launch
code. Terminal proof, incremental, SMT, and external-process support do not
enter this gate until their separate adapters preserve their domain receipts.

### Phase 3: shadow migration

- Use two closed consecutive Exact17 waves, initially Child38 and Child39, as
  the parity fixture. Reconstruct their specs from their frozen artifacts.
- Run `census/p97_search/cegar_exact17_shadow.py` and its focused test against
  offline copies of both authenticated bundles. The comparator returns
  `SAT_OBSERVED` for an accepted bundle; the migration gate records `PASS`
  only when both Child38 and Child39 satisfy that result and the legacy CNF,
  receipt, manifest, model, parent binding, and ordered-suffix identities
  agree with the generic `STATIC_CNF` control. This is observed parity
  evidence, not a proof or theorem claim.
- Run the generic validators against copies of their preserved outputs; do not
  mutate their campaign directories.
- Compare exact input identities, semantic outcomes, artifact inventories,
  receipt chains, and publication classifications.
- Run the existing scripts and the new engine side by side on fake/offline
  fixtures until all meaningful fields agree.

Exit gate: the generic path independently validates both frozen waves and its
adversarial tests reject every mutation rejected by the legacy validators. No
cleanup plan may be executed on the strength of shadow parity alone: both
comparators must be `PASS`, a fresh authenticated inventory rescan must show
zero references and zero writers for any proposed shim, all immutable legacy
artifacts and replay evidence must remain preserved, and cleanup must receive
separate review under the exact plan digest.

### Phase 4: first native wave

- Do not retrofit the currently active Child41 work. After it is closed, express
  the first subsequent static-CNF wave as a control record from inception. Any
  stale or failed earlier attempt remains historical; a retry uses a fresh
  immutable attempt identity.
- Keep the old launcher available as an explicit compatibility route for the
  canary.
- Publish under a new campaign key and validate with both the generic checker
  and the existing lane-specific semantic validator.
- On failure, create another new campaign key. Never repair a published receipt
  in place.
- Before making the new path the default, drill rollback: restore the prior
  pinned executor or active shim, rerun a fixture under another fresh campaign
  key, leave every prior row/blob/receipt byte-unchanged, and prove historical
  offline replay still succeeds.

#### First native Exact17 profile: Child40

Treat Child40 as the first native-profile fixture after the Child38/Child39
shadow gate, not as permission to rewrite or remove its legacy implementation.
Its data-only registration is now present and authenticated; it does not
retrofit active Child41 or advance the first native execution until the Phase 4
exit gate passes.
The profile is pinned to the Child39 parent (308 variables, 5,847,388 clauses,
and parent SHA-256
`989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`), the
196-clause Child40 suffix (ordered SHA-256
`e34111b179caf00ed0e04c3f28d17fd670d7a2291a9761a09f0d6984bdf19be5`), and
the resulting 5,847,584-clause child identity. The generic `STATIC_CNF`
profile must reproduce the legacy Child40 exporter, ingress, and runner
semantics side by side, including the child CNF and export receipt, manifest
and model bindings, publication classification, and the exact Child40 custody
set: intent, prepared, live-state, final, model, solver log, and runner lock.

Until that comparison and an offline replay pass are complete, retain
`scripts/export_exact17_thirty_fortieth_root.py`,
`scripts/validate_exact17_thirty_ninth_model_refinements_{export,ingress}.py`,
`scripts/run_piqd_exact17_thirty_fortieth_root.py`, their publication tests,
and every Child40 CNF, model, manifest, receipt, and custody artifact. The
runner may become a thin compatibility shim only after the authenticated
caller/writer rescan is zero, the native and legacy semantic receipts agree,
the historical replay suite remains green, and the rollback drill succeeds;
the retained exporters and validators remain replay/authentication oracles.

Child40 is eligible for a later reviewed quarantine plan only when its exact
shim path and source digest are on the trusted allowlist, all protected
callers, references, receipts, artifacts, replacements, archive, rollback,
and replay evidence are recorded, an immutable archive and rollback pointer
exist, and the exact plan digest is separately approved. Quarantine is
move-only during the rollback window: there is no automatic deletion or purge,
and any eventual source removal requires a fresh authenticated inventory
rescan proving zero references and zero writers.

Exit gate: one native wave completes export, PIQD discovery, semantic replay,
publication, offline check, and successor admission without a new per-wave
Python file.

### Phase 5: bulk conversion

- Convert Child34--Child40 manifests and validators to declarative packages in
  chronological order.
- Replace repeated exporters, runners, ingress validators, publication tests,
  and offline checkers with registry entries and table-driven fixtures.
- Move only active, non-frozen entrypoints to thin compatibility shims that
  preserve the caller manifest's exact argument meaning. Exact17 wrappers whose
  source bytes are pinned historical artifacts remain byte-stable replay inputs;
  index them instead of rewriting them.
- Convert other static-CNF families next, then incremental CNF, SMT, and
  external-process lanes. Do not combine modalities merely to reduce file
  count.

Exit gate: at least 85% of the active repeated Exact17 Python wrappers are no
longer production entrypoints, with all historical artifacts still replayable.

### Phase 6: retirement and prevention

- Add a compatibility index mapping every retired command to a spec and generic
  CLI invocation.
- Remove a shim only after its machine-readable caller manifest, executable
  compatibility replay, repository/external-user audit, and historical replay
  suite are all green.
- Apply the Phase 0 cleanup contract: only a separately reviewed exact plan
  digest may authorize move-only quarantine; retirement alone never authorizes
  execution. Before source removal, quarantine the source and retain an
  immutable archive for the full rollback window; after any eventual removal,
  rescan the externally authenticated inventory and verify zero references and
  zero writers. The archive, rollback material, and replay evidence remain
  protected afterward.
- Add a CI budget: a new file matching per-wave exporter/runner/validator naming
  patterns fails unless the change also registers a new semantic boundary and
  records why data was insufficient.
- Generate wave lists, docs tables, and test parametrizations from manifests so
  the registry cannot silently drift.

Exit gate: a mechanical new child wave is a data-only change and passes the
same full gate as its predecessor.

## Validation matrix

Each executor, as it is migrated, needs one shared positive fixture and
adversarial coverage appropriate to its declared custody model for:

- missing, extra, crossed, noncanonical, and wrong-typed manifest fields;
- source, parent, producer, variable-map, formula, and semantic-packet drift;
- symlink, hardlink, nonregular file, truncation, and oversize attacks, plus
  same-byte inode replacement and directory rebinding when the executor has a
  capability-rooted custody boundary;
- SAT model omission and semantic replay failure;
- certified UNSAT without a proof, bad proof, wrong formula, and crossed proof
  receipt, while proof-free discovery UNSAT remains explicitly non-certifying;
- UNKNOWN, timeout, process error, response loss, and reconciliation exhaustion;
- duplicate, reordered, truncated, or crossed attempt records;
- preexisting output, publication races, cleanup failure, and post-publication
  mutation; and
- an offline checker test that forbids transport and solver construction.

The repository-level gate additionally runs:

- manifest-lock validation for every registered production spec;
- replay of all retained historical fixture generations;
- exact artifact-inventory and canonical-byte validation;
- proof-boundary tests for every `CERTIFIED_UNSAT` path;
- exact parent/child/negated-cube covering-family reconstruction and LRAT checks
  for every cube campaign;
- pre/post hashing of the exact private checker copy used by a proof gate;
- offline Child38/Child39 shadow parity and protected-artifact non-targeting;
- theorem-promotion checks using the existing wave publication contract; and
- a generated-entrypoint audit proving no active wave bypasses the engine.

## Work packages and ownership

These packages can proceed independently after the schema is frozen:

1. **Specification:** wave-control records, canonical parser, static registry,
   and schema adversaries.
2. **Engine:** static-CNF executor, receipt envelope, publication flow, and CLI.
3. **Static Exact17 adapter:** Child38/39 shadow replay and first native wave.
4. **Other modalities:** incremental CNF, SMT, terminal proof, and external
   process adapters, each without weakening its current validator.
5. **Test infrastructure:** table-driven fixture harness, repository script
   budget, compatibility-index validation, and aggregate gate.
6. **Migration:** caller census, chronological manifest conversion, shims,
   external-user confirmation, and eventual retirement changes.

One owner should control the schema and registry during Phases 1--4. Wave
owners control only their manifests, semantic packets, and genuinely new
validators. Historical artifact owners approve retirement of compatibility
shims.

## Success measures

The project may call this consolidation complete when:

- the maintained static-CNF production surface is at most six general Python
  entrypoints for planning/export, execution, validation, diagnostics, and
  explicit campaign-specific admission adapters;
- a normal new child wave adds no Python or shell file;
- all registered waves pass one table-driven offline/adversarial suite;
- every historical receipt and manifest retained for replay still validates
  without mutation;
- no active or externally used legacy caller is unclassified;
- every terminal proof path retains its independent proof replay;
- no generic receipt is promoted into a theorem or proof claim; and
- the active Exact17 wrapper count falls by at least 85% before consolidation
  expands to less repetitive families.

## Explicit non-goals

This project does not merge mathematical encodings, erase useful source-level
generators, turn PIQD discovery into a proof, make campaigns into an automatic
scheduler, mutate old artifacts into new schemas, or claim progress on the Lean
proof spine merely because execution infrastructure was consolidated.
