# P97 remaining PIQD solver onboarding plan

> **Exact-17 route correction (2026-08-10).** PIQD remains the accepted
> custody, solve, session, and certificate-transport layer, but it does not
> establish theorem meaning or source entitlement. Exact-17 proof production
> now starts with the Lean finite-normal-form and checked-export contract in
> `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`. Existing exact-17
> canaries and refinement sessions remain finite infrastructure evidence.

Date: 2026-08-09

Updated: 2026-08-11

## Outcome

Move every active solver boundary behind PIQD without weakening the existing
source, replay, or Lean proof boundaries. PIQD becomes the source of truth for
immutable mechanically checked inputs, requests, results, and candidate-bank
records. Git and Lean remain the source of truth for theorem meaning, source
entitlement, named consumers, universal promotion, and axiom status.

A green finite run is evidence, not a theorem. Every adapter keeps
`source_entitlement`, `theorem_coverage`, `universal_lift`, and `lean_closure`
false until separate source-clean consumers establish them.

## Error-elimination rules

1. Capture each producer input once with component-wise no-follow reads; embed
   or content-address the exact bytes used downstream.
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
| 7 | Shared static CardHead/F-Gamma/frontier CaDiCaL | CardHead and the F-Gamma base-discovery call are onboarded. F-Gamma job `5b9afcf1…` returned a total 23-variable SAT model; independent source/map/CNF/model/custody replay and daemon-side corroboration pass | Bind the remaining frontier producer dialects; keep F-Gamma's two proof-producing DRAT gates local until PIQD has an authenticated certificate path |
| 8 | Phase3 static, projected-static, and incremental CaDiCaL CEGAR | Shared adapters and recovery canaries are green. Structural and five-omission production launchers route discovery through PIQD. Projected-static-v3 now has a qualification-v3 authority for the exact current global unsharded base, complete variable map, current source custody, and arbitrary dense append/solve journals. Its 313-test fake gate is green; historical shard qualification-v2 remains frozen, and no v3 production qualification has run | Recapture the authority from a clean immutable structural source, then run and independently audit one bounded qualification-v3 production wave with resume, shards, and parallelism disabled. Direct APIs remain diagnostic and the terminal DRAT rerun remains explicitly local until CERT-001 |
| 9 | Other direct Z3/cvc5 diagnostics | Producer-neutral source-semantic adapter is green. FreshThird and Survivor-CVC5 have authenticated live canaries and offline replay. The global-confinement cvc5 adapter has exact source/query custody, one-session/one-solve `:nl-cov`, independent exact-rational SAT replay, and a green 98-test fake/adversarial gate. Its first live canary durably ended `UNKNOWN / daemon_deadline`; the P97 late-receipt reconciliation race is fixed, and PIQD now discloses the effective deadline in both solve responses and receipts | With `effective_deadline_ms = timeout_ms + 30000` cross-bound and the HTTP bound sized above it, rerun and independently audit one fresh bounded full-convex canary. Assess endpoint and core-mining dialects separately; do not promote diagnostic UNSAT or UNKNOWN outcomes |
| 10 | Singular algebra probes | PIQD-BACKEND-002 is explicitly unsupported today. The active equality-ideal screen still executes Singular directly; certificate-producing Singular calls remain intentional local proof boundaries. The old msolve pilots are historical or superseded. PIQD's live content-addressed blob upload can custody bytes but does not attest execution or semantics | Do not count algebra execution as onboarded. Await an explicitly ruled-in typed backend; blob-ingest plus `/evidence` may custody external evidence only with execution attestation false |
| 11 | Certificate and Lean ingress | Clause-map consumer green; handoff incomplete | CERT-001 immutable source-to-certificate manifest and authenticated checker/replay receipt |
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

Provide one immutable manifest binding the producer manifest, submitted and
kept CNF, proof bytes, clause map, terminal result, backend identities, and
checker/replay receipts. The local clause-map consumer verifies numbering and
content identities but cannot manufacture producer or proof provenance.

### BANK-001 follow-up

Evidence root v2, reference checks, payload re-hashing, and
`PUT /blobs/:hash` are live. The P97 side has a strict deterministic plan for
all seven canonical registry components and a bounded read-only export auditor.
APPLY remains unconditionally disabled: byte upload is not an atomic
blob-plus-evidence-record transaction, and the export API still lacks a
snapshot token that covers every page. No real bank entry is created before
both guarantees and their interruption/concurrency tests pass.

### PIQD-BACKEND-002

The maintainer returned the explicit `UNSUPPORTED TODAY` disposition in
nthdegree convo message `#4924`: PIQD has no msolve or Singular execution
backend and no generic shell runner. Therefore algebra execution is not
onboarded and must not be counted as such. If this feature is later ruled in,
it needs a closed backend-kind allowlist; immutable input, argument,
executable, and environment identities; bounded byte-exact stdout/stderr;
single-process resource evidence; CAS/idempotency; and backend-specific
normalized result and model/certificate references.

The smaller custody-only request in convo messages `#4925` and `#4929` is now
live as hash-addressed `PUT /blobs/:hash`. It reuses PIQD's content-addressed
blob store but does not attest that PIQD executed Singular or validated the
result. Any later evidence record must still say `execution_attested=false`,
`piqd_executed=false`, and `semantic_claims=false`; publication also needs an
atomic record-binding contract rather than a split best-effort sequence.

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
- explicitly classified as historical, inactive, or intentionally unsupported.

The final audit must find no active direct solver subprocess, no duplicated
candidate-bank authority, no ambiguous mutating retry, no unauthenticated model
or certificate handoff, and no finite result mislabeled as theorem closure.

Proof-blueprint session `019fdf9c` and anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remain
unchanged, open, and off-spine throughout this infrastructure work.
