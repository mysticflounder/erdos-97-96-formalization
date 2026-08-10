# P97 remaining PIQD solver onboarding plan

Date: 2026-08-09

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
| 4 | Frontier A-core static CaDiCaL | Source-faithful package, durable runner, and standalone replay green; first live attempt reached `UNKNOWN` because the deployed daemon could not spawn CaDiCaL | Maintainer repair `#4375`, new daemon identity, then a fresh one-process live canary and independent replay |
| 5 | Exact12 v14 CardHead static CaDiCaL | Production canary CLI and standalone authenticated replay green with 25 fake-transport tests; no live receipt | One-process live SAT total-model or observational UNSAT qualification after A-core |
| 6 | FreshThird Z3/cvc5 SMT sessions | Onboarded: corrected constrained-symbol packet, 91 fake/adversarial tests, one-core 24-session live wave, and two independent standalone replays are green; receipt `eb697bfd…e9ab`, finite only | Reuse the qualified source/session/replay contract for the remaining direct SMT entry points; preserve false theorem and source-entitlement claims |
| 7 | Shared static CardHead/F-Gamma/frontier CaDiCaL | Active direct subprocesses remain; subprocess-only substitution was rejected because the shared boundary lacks authenticated source/map custody and total-model replay | Producer-neutral source package and runner derived from the qualified A-core and CardHead contracts |
| 8 | Phase3 static, projected-static, and incremental CaDiCaL CEGAR | Active direct subprocesses remain | Reuse static adapter where possible; SAT-SESSION-001 for incremental mutation and assumption custody |
| 9 | Other direct Z3/cvc5 diagnostics | SMT backend exists, but source-semantic receipts and lane adapters are absent | One source-faithful adapter per input dialect plus independent semantic replay |
| 10 | Active msolve and Singular algebra probes | No PIQD backend or receipt | PIQD-BACKEND-002 typed algebra execution, or an explicit unsupported disposition |
| 11 | Certificate and Lean ingress | Clause-map consumer green; handoff incomplete | CERT-001 immutable source-to-certificate manifest and authenticated checker/replay receipt |
| 12 | Theorem/candidate bank in PIQD | BANK-001 live but arbitrary payload ingestion incomplete | Hash-verifying atomic payload upload, stable error codes, remaining concurrency/cursor/rollback tests, strict P97 client, dry-run migration, byte-for-byte export audit |
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

Evidence root v2, reference checks, and payload re-hashing are live. Before real
P97 bank migration, PIQD still needs a hash-verifying payload insertion boundary
or atomic payload-plus-record endpoint, stable machine-readable error codes, and
the stated cursor/concurrency/interruption tests. No real bank entry is created
before those gates pass.

### PIQD-BACKEND-002

The active msolve and Singular lanes need a typed algebra backend, not a generic
shell escape. The request posted in nthdegree convo message `#4362` asks for a
closed backend-kind allowlist; immutable input, argument, executable, and
environment identities; bounded byte-exact stdout/stderr; single-process
resource evidence; CAS/idempotency; and backend-specific normalized result and
model/certificate references. If PIQD intentionally does not support these
backends, the maintainer should return an explicit unsupported disposition so
the lanes are not silently counted as onboarded.

The existing PIQD SMT-session API is the intended path for Z3 and cvc5. Each
project adapter must still bind the original source semantics and independently
replay the returned model or values; a generic SMT receipt alone is not source
entitlement.

## Live qualification checkpoint

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
waits for Adam to repair the launchd environment. The failed create-once output
is preserved at
`scratch/p97-piqd-a-core-canary-2026-08-09-v1/`; the repaired qualification must
use a fresh directory and a newly verified daemon identity. It established no
SAT/UNSAT, source-entitlement, coverage, universal-lift, Lean, or theorem-bank
claim. CardHead also waits because it uses the raw-DIMACS job lane. FreshThird
may qualify in the meantime: Z3 and cvc5 SMT sessions resolve executables from
PIQD's solver directory and are explicitly unaffected by this deployment bug;
its 24 sessions still run strictly sequentially with one solver process.

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
