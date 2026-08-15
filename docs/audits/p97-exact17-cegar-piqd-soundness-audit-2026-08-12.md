# Exact-17 CEGAR and piqd soundness audit — 2026-08-12

Status: **BLOCKED before child 32**. This is an execution and proof-contract
audit, not an exact-17 closure claim.

## Executive verdict

The project-side exact-17 CEGAR chain is source-faithful through the proposed
child-32 Lean CNF. The original piqd CNF-custody defect has been repaired:
solver execution, proof production, and replay now use a verified immutable
snapshot. Piqd also now evaluates SAT assignments against the verified stored
CNF.

The next wave nevertheless remains held. The model-check integration is not
yet fail-closed across solver exit classification, malformed model output,
retry, crash recovery, and run provenance. In particular, backend verdict
parsers can accept SAT/UNSAT text from an abnormally exiting solver, the model
parser can silently ignore malformed tokens and accept out-of-range literals,
retry can retain a stale check row, a crash after recording SAT can leave no
durable check result, and check/proof records do not fully identify the exact
run and transcript they describe.

This defect does not invalidate the current child-31 SAT result. The returned
308-variable assignment was independently replayed against the intended local
CNF: its SHA-256, header, complete assignment, parent-prefix identity, and all
5,846,904 clauses were checked. The complete historical chain has also been
reauthenticated as described below. No previous UNSAT result should be promoted solely
from piqd's job identity without replay against the exact expected CNF bytes.

## Scope

The audit covers the complete exact-17 path:

- Lean `SourceRealization` ingress and source-clause theorems;
- cumulative child-CNF construction and length/prefix invariants;
- Lean-to-DIMACS export and export validation;
- local runner locking, job identity, result parsing, and SAT replay;
- piqd prepare, confirm, execution, model, proof, and blob paths;
- historical child-root lineage; and
- the eventual certificate ingress and live production-leaf consumer.

## Findings

### F1 — piqd immutable execution custody

Status: **FIXED, DEPLOYED, and locally verified**.

Piqd commit `419f845` creates a private hardlink/copy snapshot, verifies its
hash before execution, rechecks it after the solver, and binds proof production
and replay to the same snapshot. The first installed repaired daemon reported
SHA-256 `3ac2aad346430ebaca5a07d7413120a0d9ee6884eccc26b6dee292af0efdbca9`.
The later model-check build superseded it as described below.

### F2 — piqd SAT model evaluation is now fail-closed

Status: **FIXED and DEPLOYED; consolidated independent regression pending**.

Piqd commit `3e538c0` introduced evaluation of each SAT assignment against the
content-addressed CNF and separate `SATISFIED`, `UNSATISFIED`, `INCOMPLETE`, or
`ERROR` findings.  The initially deployed build had SHA-256
`9fd9352a2c5e13c1deae10884a6a8e22b682f53919f5807d227f450d5d5c35a9`;
it is now superseded by the repaired build below.
The live piqd check of child 31 returned `SATISFIED`, 308 assigned variables,
and all 5,846,904 clauses checked. The project-side replay in F3 independently
corroborates that finite result.

The audit originally found four defects:

- solver `v` parsing silently ignores malformed tokens, does not require a
  terminating zero, and does not reject assignment variables outside the CNF
  header range before allocation;
- `reset_to_prepared` does not invalidate a prior `model_checks` row;
- SAT is durably recorded before the check, but startup does not recover a SAT
  job whose check was interrupted, and check failures are only logged;
- the check row stored no assignment digest or run identity, so it could not
  prove which recovered assignment and SAT run it evaluated.

Piqd commit `b12656b`, deployed as daemon SHA-256
`07d8539345a2803545328ac58eae7c42be6974ed33ee20bcc23079162e3d063f`,
repairs all four.  Parsing is strict and requires a terminator; variables are
range-checked before a header-bounded evaluation allocation; reset invalidates
old checks; and the check row binds `model_sha256`, `job_completed_at`, and the
CNF blob hash.  The verdict and `model_check_due` obligation are written
together, and startup turns a missing owed check into an outstanding `ERROR`.
The maintainer reproduced the malformed-token, out-of-range, unterminated, and
post-verdict crash cases against the live daemon before and after deployment.

The previously reported stale-reset consequence was latent rather than
reachable in the current call graph: the sole reset caller handles `UNKNOWN`,
whereas only `SAT` jobs have model checks.  The invalidation was still repaired
so a future caller cannot make it reachable.  Announcement now refuses `NONE`;
`ERROR` remains intentionally announceable so a maintainer can retire a
resolved checker gap.

The detailed source audit is
`scratch/exact17-lean-to-sat/piqd-current-modelcheck-audit-20260812.md`.

### F3 — current child-31 SAT result independently replays

Classification: **EMPIRICALLY VERIFIED finite result**, not theorem closure.

The intended CNF is
`scratch/exact17-lean-to-sat/exact17-thirty-first-root-thirtieth-model-refinements.cnf`
with SHA-256
`3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204`.
It has 308 variables and 5,846,904 clauses. Independent replay checked:

- the file hash and DIMACS header;
- byte-identical preservation of the parent body;
- one complete, unique, in-range value for each variable; and
- satisfaction of every clause.

The replay report is
`scratch/exact17-lean-to-sat/audit-child31-cnf-model.json` and the independent
checker is `scratch/exact17-lean-to-sat/audit_child31_cnf_model.py`.

### F4 — proposed child-32 Lean source CNF is source-clean

Classification: **PROVEN conditional source theorem**, not an executed wave.

`BlockerVExactSeventeenThirtyFirstModelRefinements.lean` adds 336 clauses from
84 subset-minimal occurrences. Its repaired coordinator proves:

- membership of every new source clause;
- total length `5,847,240 = 5,846,904 + 336`;
- satisfaction of the complete extended CNF by every `SourceRealization`; and
- the conditional contradiction obtained from an UNSAT proof of that CNF.

A targeted build passes. `lean_verify` reports no `sorryAx` for the public
source-assignment and conditional-UNSAT declarations; their accepted trust set
contains the repository-approved `native_decide` compiler axioms and ordinary
Lean axioms.

There is deliberately no child-32 exporter, certificate-ingress module, piqd
job, or live-leaf wiring yet.

### F5 — the eventual live consumer has the required source ingress

Classification: **PROVEN ingress, open terminal consumer**.

`exists_exactSeventeenSourceRealization_of_exactCover` accepts exactly the
residual context, center-placement facts, exact carrier and cap cardinalities,
next-row hit bound, and exact-cover condition available in the exact-cover arm
of the cap-nine production leaf. The remaining branch can therefore be closed
by composing that ingress with a future checked UNSAT certificate. The branch
remains a `sorry`; the present Lean coordinator alone does not close it.

### F6 — project-side validator and runner hardening

Status: **REPAIRED and regression-tested**.

The main exact-17 runner now uses a full-process transaction lock, strict JSON
with duplicate-key rejection, exclusive fsynced state creation, report-path and
report-hash binding, job/CNF/daemon/backend/solver identity checks, and a
private verified CNF snapshot shared by upload and SAT replay. Validators reject
JSON booleans in integer fields. The analyzer binds the current model and,
when supplied, the terminal job artifact rather than misreading the parent's
model provenance from the ingress manifest. The theorem-bank miner now uses
the explicit second named order rather than assuming it is the reverse of the
first.

All 21 runner wrappers load and specialize from their pinned historical bytes.
The combined project regression is 34 tests passed with `ruff` clean. The base
runner SHA-256 is
`223956a6062ea0c313c3eb333ca759423304cd2a0277b6b7e055e1c66acf9c74`.

### F7 — historical exact-17 chain independently reauthenticates

Classification: **EMPIRICALLY VERIFIED finite artifact chain**.

The audit found one immutable C–G root followed by 31 children. All 31 adjacent
parent-body prefixes and exact clause deltas pass. All 31 model-bearing SAT
artifacts contain complete unique 308-variable assignments and independently
satisfy every clause. All 32 current local CNF hashes have present PIQD blobs
with byte equality, and all available final/live SHA, byte, variable, and clause
records pass 45/45 checks.

Some historical metadata is absent: the C–G root and six model-only entries do
not have recorded historical root hashes. These are metadata `MISSING` cases,
not current-byte or model-replay failures. The PIQD execution bug means the
audit cannot prove that the daemon reverified the same bytes immediately before
each historical solve, but exact current-byte equality plus full independent
model replay rules out a false historical SAT conclusion for every model-bearing
child in this chain.

### F8 — historical NamedOrder-1 mining used the wrong permutation

Classification: **historical completeness/provenance defect, not an UNSAT
soundness defect**.

One historical theorem-search scanner treated named order 1 as the reversal of
order 0. The source normal form instead defines a distinct explicit order. A
corrected replay over children 22–31 changes the total observed occurrences
from 44 to 42, with 34 added and 36 removed occurrence records. The old
model-hit provenance and search-completeness claim therefore fail.

The already emitted clauses remain independently source-proved Lean theorems,
so this defect does not make any accepted source model invalid or create a
false UNSAT conclusion. The current miner uses both explicit tables. An early
regeneration check produced byte-identical output only because certificate
re-selection still used the old canonical-order path; it was not a valid
order-1 provenance check. The stronger regeneration is described in F13 and
remains blocked on its producer-to-Lean choice projection. The proposed child
must not be called provenance-clean until that gate passes.

Evidence:

- `scratch/exact17-lean-to-sat/exact17-chain-reauth-20260812.md`;
- `scratch/exact17-lean-to-sat/exact17-chain-reauth-20260812.json`.

### F9 — one historical ingress manifest names a superseded report hash

Classification: **historical fail-closed validation mismatch, not a current
SAT-soundness defect**.

`piqd-ingress-manifest-twenty-ninth-model-refinements.json` records export
report SHA-256 `c55b7e67...`, while the report currently at its recorded path has
SHA-256 `d9766918...`. The hardened thirtieth runner therefore correctly refuses
to validate from that historical manifest alone. The later child-31 ingress,
`piqd-ingress-manifest-thirtieth-model-refinements.json`, records `d9766918...`,
and the independent prefix, byte-hash, and model replay in
F3 and F7 does not depend on accepting the stale pairing. This mismatch must be
preserved as a documented historical metadata failure or repaired by producing
a new explicitly versioned artifact; it must not be silently overwritten in
place.

### F10 — piqd solver-verdict and proof lifecycle are not fully fail-closed

Severity: **release-blocking verdict defect plus proof-custody hardening**.

The raw-DIMACS backends currently classify solver transcripts without first
requiring the backend's accepted success exit status. CaDiCaL discards the exit
status, while Kissat and march inspect verdict text before status. A crashed or
otherwise abnormally exiting solver that emitted `SATISFIABLE` or
`UNSATISFIABLE` can therefore be recorded terminal SAT/UNSAT; contradictory
verdict text resolves to UNSAT in the inspected parsers. Terminal
classification must require both one unambiguous verdict and the
backend-appropriate successful exit status.

There are two related proof-lifecycle gaps. Proof pointers are persisted before
terminal completion, but startup recovery and later completion do not clear a
prior pointer; `/proof` also does not require the current result to be UNSAT.
A crash and rerun can therefore expose a stale proof pointer. Conversely, a
verified proof blob whose database-pointer update fails is only logged, so the
job can complete UNSAT without a retrievable certificate. Exact Lean replay
against the expected immutable CNF prevents either condition from becoming a
false theorem in this project, but the daemon artifact/run contract is not yet
sound enough to admit the next wave without repair and regression tests.

The detailed read-only audit is
`scratch/exact17-lean-to-sat/piqd-verdict-proof-audit-20260812.md`.

### F11 — regression status

The project-side hardening suite passes 34 tests with clean `ruff`. An
independent targeted Rust run over `piqd`, `piqd-encoder`, `piqc`, and
`piqd-lrat` completed 902 tests passed, zero failed, and one ignored on the
pre-repair model-check source. Strict clippy cannot yet be used as a final gate:
the shared PIQD worktree is actively changing while the maintainer repairs the
findings, and the broader encoder package also has existing warning debt. The
post-repair test and lint gate must be rerun against one quiescent recorded
source revision.

### F12 — piqd operational identity and state transitions are incomplete

Severity: **release-blocking identity/transition defects plus secondary API
hardening**.

The exact-17 client does not call piqd's `/version` endpoint, so the daemon
binary and protocol identity are not bound into the run receipt.  Backend and
solver-profile identity are also not carried and cross-checked end to end: the
client currently repeats values from its own request, while terminal status
does not attest the complete requested execution profile.

The same-daemon confirmation race found by this audit is now fixed and deployed.
Commit `651c289` changes confirmation to a database compare-and-set from
`prepared`, returns whether the transition was applied, and makes a losing
confirmation return HTTP 409 instead of overwriting a claimed `running` job.
The live build is
`a8e87e2f4ccc1b2535bc3c7fcea7ff08095e4be4ce3e3d573ac836d950e2ebac`;
the maintainer reports a live two-confirm test, a deterministic unit regression,
587 passing tests, and clean clippy.  This still needs inclusion in the final
independent quiescent-revision regression pass below.

The poll-timeout path presently leaves a live job without an explicit
cancel-or-resume receipt.  This is not by itself a false SAT/UNSAT verdict, but
the wrapper must reconcile the same immutable job rather than silently start
or accept a competing run.  Secondary hardening findings are that exact-17
does not fetch and compare the daemon-retained producer-manifest bytes, and
the multipart ingress silently accepts duplicate known parts with last-wins
semantics while ignoring unknown parts.  These secondary conditions do not
invalidate the canonical client request, but the daemon should reject an
ambiguous request schema.

The detailed read-only audit is
`scratch/exact17-lean-to-sat/piqd-operational-gap-audit-20260812.md`.

### F13 — post-SAT provenance and publication need hardening

Severity: **release-blocking provenance defects; emitted Lean clauses remain
source-sound**.

The child-31 analysis is for named order 1, and the top-level census correctly
uses that order.  Certificate re-selection initially hard-coded the identity
order.  This did **not** make an emitted Lean clause false: the serialized
certificate is positional and order-erased, and the Lean consumer proves an
order-guarded source clause by reinterpreting those positions in the clause's
current order.  It did mean that the serialized certificate was not a replay
of the claimed order-1 producer run, so the order-1 provenance, minimality, and
completeness claim was not authenticated.

That defect is now repaired locally.  Selection uses the complete original
row bank, not a two-point projection reconstructed from one support; forward
certificates replay under authenticated order 1, and reflected certificates
replay under the corresponding reversed order.  Missing exact records fail
closed.  A real production-fixture regeneration now reproduces 237 forward
records, 237 reflected records, 135 supports, 84 minimal supports, and 336
clauses.  Its publication ledger explicitly records both orders and verifies
the parent CNF bytes.  The combined analyzer/generator regression has 19
passing tests with clean `ruff`.

The independent reflected-orientation check verified that reversing the
authenticated order and reflecting positional hits is exactly Lean's
`Fin.rev` transport.  It also found a separate release blocker: full producer
records contain all 17 source-row choices, while the generated Lean occurrence
serialized all of them and `CancellationOccurrence.check` requires every
serialized choice to be covered by the six-hit clause.  Across the 84 candidate
occurrences, all 168 forward/reverse records had 17 choices but only zero or one
covered choice.  The producer record must remain fully replayed for provenance,
but the Lean certificate needs an explicitly validated projection to precisely
the choices consumed by its paths.  No child-32 Lean output may be promoted
until a production-fixture mirror of the Lean checker accepts every projected
occurrence and rejects uncovered or missing choices.

The exact-31 analyzer also allowed caller-supplied replacements for its fixed
CNF/model/job/clause trust anchors while still setting
`production_authenticated = true`; this has been repaired locally so alternate
anchors are rejected, terminal identity is recomputed, and terminals lacking
solver identity are diagnostic-only.  Seven focused adversarial tests pass.

Finally, shard/coordinator/ledger publication is a sequence of file replacements,
not an atomic multi-file operation.  The generator now has an exclusive writer
lock and a ledger-last protocol, but the only caller of its shared-lock validator
is its test.  Lean imports the four shards directly, so it can observe sequential
replacement without acquiring or respecting that lock.  The validator itself
checks output hashes and the parent CNF but does not yet enforce the exact schema,
fixed five-file allowlist, source-analysis and parent-ledger identities,
authenticated order table, implementation/source identities, entry counts, or
the ledger's own expected identity.  It also accepts an arbitrary output path,
and `--parent-cnf` remains optional.

There is no child-32 exporter, ingress validator, or hash-pinned runner yet.
The historical and first audit ledgers lack the new protocol and bindings and
are diagnostic-only.  Production needs immutable one-time publication (or an
equivalent atomic versioned directory), strict validation of every fixed output
and identity, required parent-CNF bytes, and a new export/ingress/runner chain
that refuses any unvalidated generation.  The current 237-record census does
not appear first-hit-limited and emits 336 distinct raw clauses from 84 minimal
supports, but those counts are not promoted until both the repaired certificate
projection and this publication/consumer gate pass.

The detailed audit is
`scratch/exact17-lean-to-sat/post-sat-refinement-audit-20260812.md`.

### F14 — production theorem mining can omit the terminal receipt

Severity: **release-blocking authentication defect**.

The hardened analyzer rejects substituted trust anchors when a terminal PIQD
artifact is supplied, but its no-terminal path still records
`production_authenticated = true`.  The pinned child-31 analysis artifact has
no model digest, PIQD job identifier, terminal receipt identity, or solver
completion identity.  The child-32 generator validates the analysis artifact's
hash and structural fields, but does not independently recover those missing
bindings.  A correctly shaped unauthenticated model can therefore enter the
theorem-mining and certificate-selection path.

Production analysis must require a terminal receipt and bind the exact job,
CNF digest, model digest, daemon build, backend/profile, and completion identity.
Absent or incomplete terminal evidence may remain usable for diagnostics, but
must be marked diagnostic-only and rejected by every production generator.
The historical child-31 assignment itself remains independently authenticated
by the direct hash, complete-model, parent-prefix, and all-clause replay in F7;
this defect concerns the reusable production ingress contract.

The end-to-end stage audit also confirmed that the current 237-record search is
an exhaustive enumeration only of the registered two-Kalmanson family under
the authenticated order and its reversal.  It is not an exhaustive general
theorem-bank or automorphism-orbit search.  Child 32 additionally has no raw
DIMACS exporter, parent-prefix/header/sequence/dedup validation, certificate
ingress, or immutable hash-pinned runner.  Those are required downstream gates,
not evidence against the source validity of the proposed clauses.

## Release gate for child 32

Child 32 may be exported and provisioned only after all of the following are
true:

- [x] piqd solves and proves from a verified immutable CNF snapshot;
- [x] the proof replay path is bound to those same bytes;
- [ ] the exact daemon build/protocol identity is fetched from `/version` and
      bound into the immutable run receipt;
- [ ] backend and solver profile are returned by piqd and cross-checked at
      prepare, status, and terminal-result ingestion;
- [x] confirmation is an atomic compare-and-set transition that cannot requeue
      a running job, with a concurrent-confirm regression;
- [ ] every backend requires its accepted success exit status and exactly one
      unambiguous SAT/UNSAT verdict before recording a terminal solver result;
- [x] piqd strictly parses and range-checks SAT models before bounded
      allocation and clause evaluation;
- [x] piqd invalidates stale checks on retry and binds findings to the exact
      assignment digest, current completion identity, and CNF blob hash;
- [x] piqd durably records the current-run model-check obligation with the SAT
      verdict, and interrupted post-SAT checks recover to a visible error;
- [ ] prepare-to-confirm, confirm-to-solve, check/open, retry, and post-SAT-crash regressions
      fail closed;
- [ ] a poll timeout has an explicit resume/reconcile or cancel contract and
      cannot create or admit a competing run for the same immutable job;
- [ ] proof pointers are cleared or rebound across claim/retry/recovery, served
      only for the current UNSAT result, and pointer persistence cannot fail
      while leaving a certificate-less terminal UNSAT;
- [ ] the complete targeted Rust regression and strict core clippy gate pass
      against one quiescent recorded post-repair source revision;
- [x] the installed daemon binary/build identity is recorded;
- [x] project-side known-SAT and known-UNSAT raw-DIMACS smoke tests pass;
- [x] current and historical exact-17 root/model lineage reauthentication is
      complete;
- [x] all currently identified project validator-edge cases pass or are repaired;
- [x] the child-32 Lean source clauses and source-assignment theorem build and
      verify without `sorryAx`;
- [ ] child-32 certificate selection and producer replay use the exact
      authenticated named order, and the ledger binds that order explicitly;
- [x] the production analyzer rejects caller-replaced trust anchors and
      recomputes terminal identity;
- [ ] production theorem mining requires and binds an authenticated terminal
      receipt, exact model digest, job/completion identity, daemon build, and
      backend/profile; no-terminal analysis is diagnostic-only;
- [ ] shard/coordinator/ledger publication is locked, ledger-last, and every
      downstream consumer verifies all ledger-bound output hashes before use;
- [ ] the child ledger binds parent-CNF bytes plus generator, producer-bank,
      and relevant source-theorem identities;
- [ ] a child-32 exporter and certificate ingress are generated and validated;
- [ ] the exported bytes match the Lean-owned CNF hash and parent prefix; and
- [ ] the wave is provisioned under the exact immutable hash with no stale job
      reuse.

## Promotion rule

A SAT result remains a finite model of the encoded surface until it has been
replayed and classified. An UNSAT result remains a solver result until its
proof is replayed against the exact Lean-owned CNF bytes and the certificate is
composed through `SourceRealization` ingress into the named production leaf.
Neither a green build nor a terminal piqd status is closure by itself.
