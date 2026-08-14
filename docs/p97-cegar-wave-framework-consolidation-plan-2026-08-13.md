# P97 CEGAR wave framework consolidation plan

Date: 2026-08-13

Status: proposed implementation plan. This document changes neither solver
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

The first implementation supports only `STATIC_CNF`. Later implementations may
add the following deliberately separate execution kinds, one trust boundary at
a time:

| Kind | Shared implementation boundary | Allowed conclusion |
|---|---|---|
| `STATIC_CNF` | raw-DIMACS PIQD driver | replayed SAT or discovery UNSAT |
| `INCREMENTAL_CNF` | incremental PIQD session adapter | replayed SAT or discovery UNSAT |
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
- `validate-output OUT`: perform a zero-network, zero-solver replay;
- `mine-diagnostic OUT`: run the wave's allowlisted candidate miner without
  implying theorem promotion;
- `status OUT`: report custody and mathematical classification without
  upgrading either; and
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

### Phase 0: freeze and inventory

- Generate a machine-readable index of every active wave script, its callers,
  data dependencies, output schemas, and historical receipts.
- For every legacy caller, record exact script and dependency identities,
  argv, environment, working directory, owner, output schema, and receipt-reader
  behavior. Add an executable replay smoke before changing or removing it.
- Mark each entry `ACTIVE`, `HISTORICAL_REPLAY`, `COMPATIBILITY_SHIM`, or
  `UNCLASSIFIED`.
- Do not delete or rewrite anything while an entry is `UNCLASSIFIED`.
- Pin the current Child34--Child41 artifacts and all external callers before
  changing their launch paths.

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
- Run the generic validators against copies of their preserved outputs; do not
  mutate their campaign directories.
- Compare exact input identities, semantic outcomes, artifact inventories,
  receipt chains, and publication classifications.
- Run the existing scripts and the new engine side by side on fake/offline
  fixtures until all meaningful fields agree.

Exit gate: the generic path independently validates both frozen waves and its
adversarial tests reject every mutation rejected by the legacy validators.

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
