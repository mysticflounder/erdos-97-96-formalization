# P97 remaining PIQD solver onboarding plan

> **Exact-17 route correction (2026-08-10).** PIQD remains the accepted
> custody, solve, session, and certificate-transport layer, but it does not
> establish theorem meaning or source entitlement. Exact-17 proof production
> now starts with the Lean finite-normal-form and checked-export contract in
> `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`. Existing exact-17
> canaries and refinement sessions remain finite infrastructure evidence.

Date: 2026-08-09

Updated: 2026-08-12

## Outcome

Move every active solver boundary behind PIQD without weakening the existing
source, replay, or Lean proof boundaries. PIQD is authoritative only for the
exact submitted CNF/job identity and persisted solver/result records. Exact
producer-manifest bytes, variable-map/semantic bindings, and source/Lean
meaning remain caller-owned P97 artifacts. Git and Lean remain the source of
truth for theorem meaning, source entitlement, named consumers, universal
promotion, and axiom status.

A green finite run is evidence, not a theorem. Every adapter keeps
`source_entitlement`, `theorem_coverage`, `universal_lift`, and `lean_closure`
false until separate source-clean consumers establish them.

## Error-elimination rules

1. Capture each producer input once in caller-owned custody with component-wise
   no-follow reads; embed or content-address the exact downstream bytes and
   retain them locally, since current PIQD job retrieval exposes only
   `producer_manifest_hash` for the producer manifest.
2. Recompute CNF, variable-map, model, clause-map, and bank identities at every
   trust boundary. Do not copy claimed hashes from adjacent JSON.
3. Use one canonical schema and one canonical byte representation per artifact.
   Reject unknown keys and Python `bool`/`int` subtype ambiguities.
4. Never retry an ambiguous mutating request unless PIQD supplies request
   identity, content hash, and exact replay semantics.
5. Record the exact daemon executable, backend executable, requested limits,
   and honest process attestation. One process is not a one-core claim.
6. Make artifacts create-once below an authenticated output root. Reject
   symlink, hardlink, path replacement, and post-write identity drift.
7. Store mechanical candidate/evidence records once in PIQD. Do not maintain a
   second hand-edited theorem-bank manifest with independently copied hashes.
8. Keep proof-blueprint anchors unchanged for off-spine solver infrastructure.

## Lane status and order

| Order | Boundary | Current status | Next acceptance gate |
|---:|---|---|---|
| 1 | Exact17 static and seeded CaDiCaL | Onboarded canaries; finite only | Continue through strict shared adapters; no legacy attestation reuse |
| 2 | Rank-four direct-six refinement | Onboarded SAT canary; finite only | Use authenticated PIQD session roots and mandatory theorem-bank search after each wave |
| 3 | Exact12 source54 static CaDiCaL | Onboarded and pushed | Reuse as the custody baseline for other exact12 cells |
| 4 | Frontier A-core static CaDiCaL | Onboarded: source-faithful retry package, durable runner, one-process live SAT canary, and authenticated no-argument standalone replay are green; receipt `643ebab4…ed40`, finite only | Reuse the qualified retry-aware boundary; preserve false source-entitlement, theorem-coverage, universal-lift, and Lean-closure claims |
| 5 | Exact12 v14 CardHead static CaDiCaL | Onboarded and pushed; live SAT canary and independent total-model/custody replay pass, receipt `d74c396e…` | Reuse the qualified producer-specific boundary; preserve finite-only and false source-entitlement claims |
| 6 | FreshThird Z3/cvc5 SMT sessions | Onboarded: corrected constrained-symbol packet, 91 fake/adversarial tests, one-core 24-session live wave, and two independent standalone replays are green; receipt `eb697bfd…e9ab`, finite only | Reuse the qualified source/session/replay contract for the remaining direct SMT entry points; preserve false theorem and source-entitlement claims |
| 7 | Shared static CardHead/F-Gamma/frontier CaDiCaL | CardHead and the F-Gamma base-discovery call are onboarded. The shared frontier seam now authenticates each effective query, fetches the exact kept CNF, validates the source-to-kept clause map, and accepts UNSAT only after caller-owned compact-LRAT Lean replay. A/B/C/DE/DR/E default callers are migrated and fake-qualified; live qualification remains pending | Live-qualify the migrated A/B/C/DE/DR/E callers. Keep raw DRAT and any other non-LRAT certificate products explicit legacy-local boundaries |
| 8 | Phase3 static, projected-static, and incremental CaDiCaL CEGAR | Shared adapters and recovery canaries are green. Structural and five-omission production launchers route discovery through PIQD. Projected-static-v3 now has a qualification-v3 authority for the exact current global unsharded base, complete variable map, current source custody, and arbitrary dense append/solve journals. Its 313-test fake gate is green; historical shard qualification-v2 remains frozen, and no v3 production qualification has run | Recapture the authority from a clean immutable structural source, then run and independently audit one bounded qualification-v3 production wave with resume, shards, and parallelism disabled. Direct APIs remain diagnostic and the terminal DRAT rerun remains explicitly local until CERT-001 |
| 9 | Other direct Z3/cvc5 diagnostics | Producer-neutral source-semantic adapters are green. FreshThird, Survivor-CVC5, global full-convex cvc5, endpoint metric, ATAIL geometry, Phase-3 survivor-metric, and the global metric core-miner now have bounded live qualification at their stated finite diagnostic boundaries plus standalone validation or independent artifact audit. The survivor-metric live checkpoint used two fresh sequential one-solve Z3 sessions: exact-metric `UNKNOWN` and full-convex proofless diagnostic `UNSAT` with an empty unnamed core. The core-miner live checkpoint used closed cvc5 and Z3 sessions and remains diagnostic. PIQD named-core labels and digest coverage requested in `#5400` are shipped. Native and named cores remain diagnostic until the caller binds every exact label to authenticated P97 source semantics and independently replays that mapping. Source-entitlement, proof, theorem, global, universal, Lean, and `sorry`-closure claims remain false. | Reuse the qualified boundaries for finite diagnostics. Require exact caller-owned label-to-source bindings and independent semantic replay before any core promotion; keep proofless UNSAT off the proof spine |
| 10 | Singular algebra probes | A maintained PIQD Singular execution-custody backend and standalone artifact validator are implemented and pushed in checkpoint `765691c`. `equality_ideal_probe.py` and `structural_screen.py` now default to one-worker sequential PIQD execution with no local fallback; the old local subprocess route is explicit legacy-only. Caller contexts bind source and query semantics, and callers independently parse and validate retained transcripts. Fake/adversarial gates are green, including output-parent and rebinding attacks. This attests process execution and immutable transcript custody only: `RAN` is not UNIT/NONUNIT, a proof, or theorem closure. Certificate-producing Singular calls remain intentional local proof boundaries, and old msolve pilots are historical or superseded. | Run one bounded live Singular canary and the public offline validator. Preserve caller-owned semantic replay and keep certificate/proof-producing algebra local unless a separately checked certificate route exists |
| 11 | Certificate and Lean ingress | Clause-map consumer green. `CERT-001` is closed as a scope correction: PIQD authenticates solver execution artifacts, while proof/certificate production and kernel replay remain explicit caller-owned boundaries. The shared frontier certified seam now enforces exact kept-CNF/map custody and validated compact-LRAT Lean replay | Live-qualify each migrated frontier caller without inferring theorem closure from PIQD execution or from an unchecked solver verdict |
| 12 | Theorem/candidate bank in PIQD | The strict seven-component P97 planner and read-only export auditor are green. PIQD evidence v2 and hash-verifying blob upload are live, but APPLY remains disabled | Add atomic blob-plus-evidence publication and snapshot-consistent export, then run the strict P97 migration and byte-for-byte audit. Blob upload alone is not migration authority |
| 13 | Prover9, Mace4, and march_cu references | No active non-test subprocess entry point found | Keep classified inactive; require typed PIQD backend and replay contract before revival |

## PIQD maintainer dependencies

### SAT-SESSION-001

- CAS or idempotent identity for clause appends;
- idempotent single solves tied to starting frontier and assumptions;
- exact declared DIMACS variable universe and stable total-assignment policy;
- terminal result bound to the exact solve receipt and assumptions; and
- daemon-wide session worker limits plus honest resource attestation.

Until these land, an ambiguous mutation downgrades the P97 lane to `UNKNOWN`
and requires a fresh session reconstructed from authenticated local CNF bytes.

### CERT-001

Maintainer clarification closes this as a scope correction rather than a PIQD
product feature. PIQD may authenticate the submitted CNF, exact kept CNF,
solver result, and compact LRAT artifact, but the caller must still bind the
source-to-kept clause map and run the local checker or Lean replay. A PIQD
`UNSAT` response alone is never certificate, theorem, or Lean closure.

### BANK-001 follow-up

Evidence root v2, reference checks, payload re-hashing, and
`PUT /blobs/:hash` are live. The P97 side has a strict deterministic plan for
all seven canonical registry components and a bounded read-only export auditor.
APPLY remains unconditionally disabled: byte upload is not an atomic
blob-plus-evidence-record transaction, and the export API still lacks a
snapshot token that covers every page. No real bank entry is created before
both guarantees and their interruption/concurrency tests pass.

### PIQD-BACKEND-002

The original unsupported/deferred status is superseded. PIQD now exposes the
closed `piqc singular` execution-custody route, and the maintained P97 adapter
binds the script, source context, request/result identities, bounded byte-exact
stdout/stderr, and durable receipt into a standalone-validatable artifact.
Checkpoint `765691c` migrated the equality-ideal and structural-screen callers
to this route by default. This is process and transcript custody only: callers
still own UNIT/NONUNIT parsing and semantic replay, child-process confinement
is not attested, and certificate-producing algebra remains local.

The existing PIQD SMT-session API is the intended path for Z3 and cvc5. Each
project adapter must still bind the original source semantics and independently
replay the returned model or values; a generic SMT receipt alone is not source
entitlement.

## Live qualification checkpoint

### Projected-v3 clean-image preflight

The first qualification-v3 launch from commit `8d20397464922e0efe88b5f562694060c2aa943c`
stopped before any PIQD job, session, or solver action. The exact committed
structural driver was not importable: a contextless selective patch had placed
the qualification finalizer inside a prospective-state `if` condition even
though the concurrent working-tree source was valid. This is a P97
checkpoint-construction defect, not a PIQD defect. Projected-v3 live work must
resume only from a corrected committed SHA whose exact clean archive passes
Python import plus the capped qualification tests. Future shared-file
checkpoints must validate the staged clean image rather than relying on tests
against the dirty working tree.

The corrected clean checkpoint `e4491362cc14569c2f2040ea8422d9ab223c3137`
then reached PIQD prepare without confirming or running a solver. PIQD returned
the documented mandatory `preview` field in the prepare response, but the P97
authority-v3 wrapper still enforced the older key set and stopped fail-closed.
The prepared job was initially left unconfirmed and unrun. Rust source and the
exact archived response showed that `preview` is the
lossy UTF-8 rendering of the first 512 submitted CNF bytes; this is P97 adapter
schema drift, not a PIQD defect. A subsequent clean checkpoint must require and
cross-bind that field before the live qualification resumes.

Clean checkpoint `d4700a6078c75860e876e4e9ae94317b1b77c5f8` added that strict
binding. The same job, `6883febf-aafb-4b5d-95e2-37faa5fb59ce`, was then
confirmed and completed `SAT` in 13 ms with requested core limit one,
`attested_solver_processes = 1`, and basis
`SINGLE_PROCESS_NO_PARALLEL_FLAG`. This is producer evidence only, not a proof.
Authority provisioning next stopped before creating a session because the P97
wrapper omitted Rust's documented optional `sha256` field from the exact
`/solvers.daemon` schema. The correction accepts only the three required
identity fields, optionally plus an exact lowercase 64-hex `sha256`; when
present it must equal the pre-run and post-run `/version.daemon.sha256`.
Arbitrary extra, missing, mistyped, subclass, and crossed values remain
fail-closed. This is again P97 adapter schema drift, not a PIQD defect. A clean
checkpoint containing this correction is required before the qualification
session opens.

The first Frontier A-core qualification used the exact source-derived
889-variable, 21,101-clause SAT canary and one requested solver process. The
deployed daemon `0af7a4cd9f813c91ea3ce5a8f4eab6ad979b50e49a2c7276a2fdafa932e5da77`
accepted job `c7d55a56-4529-4cbd-83a9-991127924daf`, but completed it as
`UNKNOWN` with zero attested solver processes. Its authenticated log is exactly
`[cadical] spawn error: No such file or directory (os error 2)`. The adapter
receipt is `2fc37e70db0536c7580b3cfde4af551cccfd38eadcd77b72f8f4ff13a982d5a6`.

This is a deployed PIQD solver-resolution defect, not an A-core encoding or
adapter result. It is reported in nthdegree convo message `#4375` and
root-caused in `#4380`: the launchd daemon's `PATH` excludes
`/Users/adam/bin`, while raw-DIMACS job backends are launched by bare name.
Consequently the entire raw-DIMACS job lane, including CaDiCaL and march_cu,
was blocked until the launchd environment was repaired. The failed create-once
output is preserved at `scratch/p97-piqd-a-core-canary-2026-08-09-v1/`. It
established no SAT/UNSAT, source-entitlement, coverage, universal-lift, Lean,
or theorem-bank claim. The same deployment issue blocked CardHead until the
repair because it also uses the raw-DIMACS job lane. FreshThird was unaffected:
Z3 and cvc5 SMT sessions resolve executables from PIQD's solver directory; its
24 sessions still run strictly sequentially with one solver process.

The repaired A-core qualification used daemon build
`6087acb84cf179821240625b60f93502e37eb8b5362840a70b810103c9d1b464` and
fresh job `f0f47542-e4ff-4c65-bfcd-4b941f4c68fa`. The exact 889-variable,
21,101-clause packet completed `SAT` with `existing=false` and one requested
solver process. The adapter preserved the raw PIQD model bytes exactly, then
strictly parsed the total 889-literal assignment and independently replayed
every CNF clause. A separate no-argument offline replay authenticated the
archived retry-v2 producer bytes, rebuilt the exact packet, and reproduced
receipt
`643ebab437026c0a3f312e88b595350ae9c4a2559b48b46a9e7a29326e97ed40`.
The model SHA-256 is
`0f846cd99e562de70b0e01182b1ca5851f405573721d34dcd87318b157942b2e`.
The create-once output is preserved at
`scratch/p97-piqd-a-core-canary-2026-08-10-retry1-6087acb8/`. The daemon build
digest in the retry producer is caller-supplied identity material, not a
per-job daemon attestation; `PIQD-BUILDBIND-001` remains open. This remains a
finite canary and establishes no source-entitlement, theorem-coverage,
universal-lift, Lean, or theorem-bank claim.

The first FreshThird live wave did exercise all 24 sessions and produced
create-once receipt
`70654e11f9e41a63053182c655953efee87d41953d2a2b41514b2acdf6da3748`
under `scratch/p97-piqd-freshthird-smt-live-2026-08-09-v1/`, but it is not an
accepted qualification. Both Z3 and cvc5 returned `SAT`, the exact value
readback `((true true))`, and an empty model for the frozen variable-free
`(assert true)` control. The adapter intentionally rejected that vacuous
control as `UNKNOWN`. PIQD is correct to preserve the solvers' empty model.
The initial successor packet's known-SAT control declared no symbol, so PIQD
correctly returned an empty model that the adapter rejected as vacuous. That
P97 fixture mismatch is recorded in convo `#4384`, with the maintainer's
classification and repair direction in `#4385`.

The repaired successor packet declares and asserts `smoke_dummy : Bool` and is
now the adapter default. A fresh strictly sequential live wave completed all 24
Z3/cvc5 sessions under
`scratch/p97-piqd-freshthird-smt-live-2026-08-09-v2/`, producing receipt
`eb697bfd3911d998b8c980f224dfccfb09ed8d2e23a8bab054643bc44f28e9ab`.
Two independent `--check` passes reproduced the same receipt and all 12 case
verdicts. Both engines returned effective `SAT` with valid model readback for
the known-SAT control and effective `UNSAT` for the known-UNSAT control; no case
was downgraded to `UNKNOWN`, and the current source hashes exactly matched the
frozen packet. This qualifies the FreshThird PIQD execution and replay lane as
finite diagnostic infrastructure only. Every theorem, universal-closure,
source-entitlement, solver-attestation, daemon-attestation, Euclidean, and Lean
claim remains explicitly false.

### Repaired shared-boundary qualifications

The launchd environment was repaired and PIQD daemon
`63aeb78f408d74b17d91d5f19d9effd4929d74b12f8c3b0747e452b8438a529c`
was started on 2026-08-10. Three bounded post-restart qualifications now pass.

The producer-neutral static boundary submitted the nonvacuous CNF
`p cnf 1 1\n1 0\n`, SHA
`6642f3ff4fae6f869a53f303bc768802cec0a16af731686c6bf03f342cf0489e`,
as fresh job `85df9325-d50a-411d-b332-b713892fdd48`. Preparation recorded
`existing=false`; the daemon recorded a started, completed `SAT` run with
requested core limit one, one attested solver process, and basis
`SINGLE_PROCESS_NO_PARALLEL_FLAG`. The total assignment `[1]` independently
replays. The adapter receipt is
`60131469ea6df429ea0d704b3a6d014d171712e7197d5cec9a04ecce788f5c1e`
and the durable journal seal is
`7741f2835f0eb91d5e8439d37b3b23af8de9aaac23beed2bf53dbcfd7cf3685a`.
Both a local read-only custody audit and the PIQD maintainer independently
validated the preserved artifacts; see convo `#4464`, `#4466`, and `#4469`.

The incremental-session boundary then authenticated that exact job-scoped CNF
and opened fresh session `e59fced0-d4fa-441e-a4f1-63004892afcd`. Its first
solve returned `SAT` with total assignment `[1]`; after appending exact clause
`[-1]`, its second assumption-free solve returned `UNSAT` with empty core. The
canary deliberately truncated the local journal to its open-plus-SAT prefix.
A second process recovered the committed append and UNSAT receipt from the
authoritative remote frontier, sent no repeated append or solve and no model
request, and closed the session exactly once. The recovery result SHA is
`c9a330b76968ec01d9757449751df0dbefee9dc304fd9ccee9775c2870560c8d`;
see convo `#4468` and `#4470`. Historical solve receipts do not carry a
`terminal_unsat` field: recovery derives terminality exactly from `UNSAT` plus
an empty assumptions list, while the current session row exposes
`last_terminal_unsat`; the maintainer verified both directions in `#4471` and
independently reproduced the receipt digests in `#4473`. A separate read-only
artifact audit validated the exact repair, close-once behavior, canonical
hash chains, and 15-file inventory in `#4475`. Its one explicit upstream
boundary is that the static producer names a variable-map hash whose bytes are
not among that inherited attempt's sealed 14 artifacts; the seed, source, and
producer identities used by this canary are sealed.

Finally, the source-semantic SMT boundary ran one constrained-symbol packet in
fresh sequential Z3 and cvc5 sessions. Both returned `SAT`, both authenticated
semantic replayers accepted, and both response/receipt digests matched the
locally recomputed PIQD digest contract. Separate offline processes replayed
the complete 22-file archive for each engine. The create-once `result.json`
file SHA is
`62d90a684eb964bdcb8b67783ce7aa9904c1118860ef97cd298760a7583eab22`;
the maintainer additionally confirmed distinct solver executable identities in
convo `#4467`.

These qualifications establish working shared transport, custody, replay, and
recovery boundaries. They do not migrate a caller by themselves. Each active
producer still needs an authenticated lane-specific source descriptor and a
semantic or model replay before its direct subprocess can be removed. One
attested solver process and a no-parallel flag are not hardware CPU affinity or
thread-count attestations, and every source-entitlement, theorem-coverage,
aggregate, universal, Euclidean, Lean, and proof-spine claim remains false.

### Global-confinement metric-cvc5 timeout checkpoint

The first bounded metric canary selected frontier system
`8b6ceb4eed2ec9f83827` and opened PIQD session
`3a2ffaea-21f8-49fa-904c-14b51364a869` with `timeout_ms = 20000`. The client
lost the HTTP response at 50 seconds, but the durable session subsequently
settled to one solve and one receipt: `UNKNOWN`,
`interrupted_by = daemon_deadline`, `solve_ms = 50004`, and result SHA
`beff21f8ac8e0d1f15e4f2fc020b3c717ba7b520cb91e001e49ac8d2f5096f3a`.
The run therefore supplies a finite diagnostic `UNKNOWN`, not an inconclusive
or missing solver record.

This checkpoint exposed two distinct contract gaps. PIQD deliberately adds a
30-second grace to bounded cvc5 solves because cvc5 1.3.3 does not honor
`tlimit-per`; the live daemon now discloses that bound as
`effective_deadline_ms = timeout_ms + 30000` in both the response and durable
receipt. The requested 20-second solve therefore has an honest 50-second
effective deadline rather than a 20-second execution claim. Separately, the
P97 adapter sampled reconciliation before the receipt committed and initially
mislabeled the run. The adapter uses a fixed bounded reconciliation schedule,
authenticates terminal session state and exactly one durable receipt together,
never retries the solve, and closes exactly once. A fresh live retry is
permitted only after the strict adapter requires the new effective-deadline
field and sizes its HTTP bound above it. See convo `#4960`, `#4961`, `#4964`,
`#4967`, `#5017`, and `#5020`.

The offline validator has since been hardened before that retry. It keeps the
published output directory descriptor open through semantic validation,
recaptures the exact final inventory and bytes through that descriptor, and
requires the requested pathname to reopen to the same device and inode. Source
custody now records and rechecks every component-wise no-follow directory
identity plus exact source-file metadata, including after SMT reconstruction;
byte-identical file replacement and ancestor-directory rebinding fail closed.
Descriptor cleanup attempts every close without masking a primary validation
error. The capped fake-only metric gate passes 116 tests.

The bounded retry has now qualified that operational boundary. Frontier system
`8b6ceb4eed2ec9f83827` ran in fresh cvc5 session
`f779df51-aeb9-4aee-85d3-c4745ec09073` with exactly one assumption-free solve,
one durable receipt, and a closed session. It returned `UNKNOWN` with
`interrupted_by = daemon_deadline`, requested `timeout_ms = 20000`, disclosed
`effective_deadline_ms = 50000`, `solve_ms = 50007`, and result SHA
`beff21f8ac8e0d1f15e4f2fc020b3c717ba7b520cb91e001e49ac8d2f5096f3a`.
The public standalone validator accepted the exact 11-file output at
`scratch/p97-global-metric-piqd-8b6ceb4eed2ec9f83827`, and the independent
audit in convo `#5385` rechecked its source custody, canonical source/system
records, daemon journal and receipt, one-session lifecycle, and false-claim
boundary. Maintainer clarification `#5384` confirms that capacity planning for
this cvc5 profile must use the disclosed 50-second effective deadline, not the
20-second request.

This closes live PIQD onboarding and custody qualification for the selected
full-convex cvc5 stage. It does not close the mathematical obligation: there is
no SAT model, UNSAT certificate, proof, source-entitlement promotion, theorem,
global or universal conclusion, Lean result, or proof-spine movement. The next
progress on this system must come from decomposition, a justified larger
budget, or a stronger backend rather than from retrying the same solve.

### Remaining Z3 diagnostic checkpoint

The two remaining active Z3 diagnostic producers now have strict PIQD routes
and independent fake/offline audits:

- `phase3_survivor_metric_driver.py` defaults to a one-worker PIQD route. Each
  order uses fresh sequential exact-metric, full-convex, and conditional
  convex-only sessions; SAT is accepted only after exact-rational replay, and
  the whole staged result has a standalone validator. Its corrected custody
  gate passes 42 tests and independently rejects parsed-equal byte changes,
  line-ending drift, inode replacement, and post-query source mutation. Its
  first clean selected-order canary from `f3abce3f` stopped before PIQD because
  the `python -m` entrypoint and canonical adapter import created distinct
  Python dataclass classes. The driver now compares complete canonical case
  replay identities instead of class-sensitive dataclass equality, with an
  exact module-entrypoint regression. That failed attempt created no session,
  solver run, or output artifact; it was a P97 integration defect, not PIQD.
  The repaired immutable checkpoint
  `3a72216df8821e7f4e9a8dde33b5bbf0b9b8d78b` subsequently completed one bounded
  selected-order live canary. Two fresh sequential Z3 sessions made exactly
  one solve each and closed: exact-metric returned `UNKNOWN`, then full-convex
  returned proofless diagnostic `UNSAT` with an empty unnamed core. The public
  standalone validator and independent artifact audit `#5472` passed.
- `metric_realizability_cvc5_core_miner.py` defaults to the PIQD core-mining
  route, with local cvc5/Z3 retained only behind `--legacy-local`. The adapter
  uses guarded append-CAS, total polarity assumptions, deterministic request
  IDs, durable receipt continuity, exact cvc5 SAT replay, status-only PIQD Z3
  checks, exact result cardinality, and bounded no-follow capture. Its
  corrected gate passes 21 tests and an independent audit.

The aggregate command `./scripts/test-p97-piqd-remaining-solvers.sh` now runs
the ATAIL opt-in guard, global metric core-miner, Phase-3 survivor metric,
A-core metric, pinned-general-m, rigid221, and the complete A/B/C/DE/DR/E
certified-frontier gates sequentially with one pytest worker and thread caps.
The 2026-08-12 offline checkpoint passes all 350 tests; Ruff lint and format
checks are clean. This aggregate result is not a blanket live qualification.
The two originally targeted lanes are separately live-qualified at their
finite diagnostic boundaries: the global metric core-miner used one fresh
cvc5 session for 32 solves and one fresh Z3 session for two status-only solves;
both sessions closed, and the standalone validator plus independent
seven-artifact audit passed. The Phase-3 survivor-metric route used the two
fresh one-solve sessions described above; its standalone validator and
independent custody audit also passed. The newly aggregated A-core,
pinned-general-m, rigid221, and certified-frontier routes remain
fake/adversarial or offline qualified only until their separately bounded live
canaries and independent artifact validations complete. The separately
implemented Singular routes have the same live-validation boundary.

Maintainer contract `#5400` is now shipped: PIQD accepts caller-owned
`assumption_labels`, returns `core_labels`, and covers both in the result
digest and durable receipt. Native and named cores remain diagnostic evidence.
Promotion of a named core tied to P97 source statements still requires the
caller to bind every label to exact source-statement bytes and independently
replay that interpretation. No source entitlement, proof, theorem, global or
universal result, Lean result, or proof-spine movement follows from this
checkpoint.

### Residual direct-solver audit correction

The earlier phrase “two remaining active Z3 diagnostic producers” was too
narrow. A caller-level audit at commit `299bd24067b622153356cc2ac4b6b063ad0e2a44`
found additional operational entry points that still bypass PIQD or need an
explicit retirement classification:

- `scripts/pinned-generalm-certificate-coverage.py` now defaults to 45 fresh,
  sequential PIQD Z3 sessions with exact SAT replay, create-once custody, and
  a standalone offline validator. Its 24-test fake/adversarial gate is green;
  local Z3 remains only behind explicit `--backend legacy-local`, and a live
  PIQD qualification is still pending;
- `census/rigid221_pentagon_oracle.py` now defaults to a sequential one-worker
  PIQD campaign with exact label-to-source bindings, source/result custody, and
  a standalone validator. Its 37-test fake/adversarial gate is green; the live
  campaign remains pending;
- `census/p97_search/a_core_metric_driver.py` now defaults to a one-worker,
  sequential PIQD route with exact source/order/query custody, exact-rational
  SAT replay, create-once publication, and a standalone validator. Its local
  Z3 route is explicit `legacy-local-z3`; the fake/adversarial qualification is
  green and a bounded live qualification remains pending;
- the A/B/C/DE/DR/E frontier-package reproduction entry points now default to a
  shared certified PIQD route. Every effective DIMACS query receives a fresh
  authenticated package and attempt, exact variable-map/source/build-ledger
  custody, exact `kept_cnf_blob_hash` and kept-CNF validation, source-to-kept
  clause-map validation, and caller-owned compact-LRAT Lean replay. Their
  combined fake/adversarial checkpoint is green, but no live frontier query has
  yet qualified the route. Requested `.drat` paths remain untouched; raw DRAT
  is available only through explicit legacy-local execution;
- `census/global_confinement/metric_realizability_probe.py` is retained as an
  explicit `legacy-local-z3` diagnostic API and CLI. Omission of the opt-in
  fails before local Z3 discovery; current production A-core and survivor
  callers use their PIQD routes by default; and
- `census/p97_search/structural_screen.py` and `equality_ideal_probe.py` were
  active direct Singular callers; both now use the shared PIQD execution-custody
  backend by default, while retaining an explicit legacy-local route.

These are P97 caller-migration and ledger/retirement gaps, not PIQD product
bugs. ATAIL's old Z3/cvc5 checkpoints are terminal historical work. Its
retained manifest and geometry diagnostics now reject omitted legacy-local
selection before executable discovery, and their focused opt-in regressions
are included in the aggregate gate. MARCO has no non-test caller; these are not
active migration blockers. Under the
closed `CERT-001` scope correction, proof and certificate checking remains a
local caller responsibility. The shared Singular backend closes execution and
transcript custody only; it does not promote algebraic verdicts or
certificates. The project-wide onboarding completion criteria remain unmet:
the new A-core metric, pinned-general-m, rigid221, A/B/C/DE/DR/E certified
frontier, and Singular routes still need their stated bounded live
qualifications and independent artifact validation. Explicit legacy-local
diagnostics are no longer silently selected production defaults and remain
outside theorem closure.

## Rollout protocol

For each lane:

1. freeze and authenticate one existing producer packet without solving;
2. implement a strict fake-transport adapter and adversarial test suite;
3. run an independent contract audit;
4. verify the deployed PIQD executable and endpoint schema;
5. run one bounded one-solver-process canary;
6. independently replay SAT models or UNSAT certificates;
7. persist the mechanical receipt in PIQD only after BANK acceptance is ready;
8. search the indexed theorem banks and name the exact Lean consumer, if any;
9. update the lane status without moving the proof spine for finite evidence;
10. commit and push only a reviewed, scoped change set when requested.

## Completion criteria

Onboarding is complete only when every active solver call is either:

- routed through a strict PIQD adapter with authenticated replay; or
- explicitly classified as historical, inactive, or an intentionally local
  proof/certificate boundary.

An execution-custody backend is not silently counted as proof production.
Singular callers must retain explicit caller-side transcript semantics and
false proof/theorem/Lean claims; certificate-producing routes remain governed
local boundaries until a checked certificate path exists.

The final audit must find no unclassified active direct solver subprocess, no
duplicated candidate-bank authority, no ambiguous mutating retry, no
unauthenticated model or certificate handoff, and no finite result mislabeled
as theorem closure. Every retained direct route must name its governing local,
deferred, or inactive classification and the claims it does not establish.

Proof-blueprint session `019fdf9c` and anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remain
unchanged, open, and off-spine throughout this infrastructure work.
