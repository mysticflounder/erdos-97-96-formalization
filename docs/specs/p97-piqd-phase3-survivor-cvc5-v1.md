# P97 Phase-3 survivor cvc5 over PIQD, v1

Status: implemented adapter contract; fake-transport and bounded live
qualification passed; independent offline artifact audit passed; finite
diagnostic only.

This specification is the Phase-3 survivor metric-screening slice of census request `#4821`, under the PIQD maintainer contract recorded in `#4819` and resolved for this lane in `#4830`. It does not change proof-blueprint session `019fdf9c`: the work remains open, diagnostic, and off the proof spine.

## Scope and entry point

The production entry point remains:

```bash
python census/p97_search/phase3_survivor_cvc5_driver.py \
  --backend piqd --workers 1 --timeout 120
```

`--backend piqd` is the default. It enters
`phase3_piqd_survivor_cvc5.run_wave` before any legacy executable resolution,
local version probe, smoke gate, or subprocess call. It admits exactly one
worker and never falls back to a local solver. The old route remains available
only through the explicit `--backend legacy-local` selection for comparison.
It is never a fallback from a PIQD result or transport failure.

The PIQD route defaults to the authenticated current fixture
`census/p97_search/tests/fixtures/phase3_survivor_metric_100_current`, which is
accepted by the legacy authenticated loader and contains exactly 48 systems
(authenticated manifest SHA-256
`2cabdd2f9270c332b7f12ff8af843768b57d27c5a90a5805acc5b33833affd39`).
The explicitly selected `legacy-local` route retains the legacy driver's source
default and archived manifests unchanged.

## Authenticated input

The adapter calls the existing `phase3_survivor_cvc5_driver.load_unique_systems`. That loader replays the complete upstream manifest, source/result join, hash chain, 100 survivor records, all 2,400 ordered leaves, and the deduplication to exactly 48 semantic systems and two row sets.

For every unique system the adapter rebuilds the archived `full-convex` SMT-LIB source with the existing producer. The required assertion counts are fixed:

| kind | count |
|---|---:|
| row equalities | 30 |
| pairwise distinctness | 45 |
| strict convex order | 80 |
| total | 155 |
| selected rows | 10 |

The exact producer bytes, including comments and the terminal `(check-sat)` and `(exit)`, are stored and hashed as `original.smt2`. Only the exact terminal two-command suffix is removed for session assertion.

The system record is canonical JSON and includes the entire system, its semantic hash, every source-leaf provenance record, the upstream manifest hash, the original-source hash, the session-journal hash, and the bounded profile. The descriptor binds its canonical bytes, source-record bytes, exact original SMT-LIB bytes, semantic input, declared variables, readback variables, and timeout.

## Qualified cvc5 SMT-session profile

Each system receives a fresh cvc5 SMT session, exactly one assertion batch, exactly one bounded solve, and a close. No session is reused; reused daemon session identities fail closed across the wave.

The first journal command is exactly:

```smt2
(set-option :nl-cov true)
```

It precedes `(set-logic QF_NRA)`. A late option is invalid for cvc5 and is rejected by packet custody. The remaining commands are exactly the top-level commands split from the archived producer source; PIQD's canonical journal contains those commands, one per line. The separately retained `original.smt2` preserves comments and all source bytes that are not PIQD commands.

This is a qualified successor to the archived one-shot invocation, not a claim of byte-for-byte invocation or behavioral equivalence. PIQD starts cvc5 in incremental session mode and applies the solve timeout per check, plus its daemon wall deadline. The historical local route used one-shot `--nl-cov` and `--tlimit`. Maintainer decision `#4830` accepts one fresh process/session/solve with the first-command option as the semantic onboarding profile.

The adapter is cvc5-only. It never creates or executes a generic Z3 session. Solver signature and executable SHA-256 are taken only from the strict current session schema and must agree across the create response, durable receipt, and close response. No deployment-specific cvc5 signature or hash is hard-coded before live qualification.

## Receipt and status contract

The adapter reuses the producer-neutral PIQD SMT-session validator for current-schema validation. It requires:

- a canonical fresh session identity and cvc5 lane identity;
- exact assertion and exported-journal bytes;
- zero receipts before the solve;
- one solve at the descriptor timeout with the exact empty assumptions and exact readback list;
- one durable receipt bound to journal byte count/hash, solver signature/hash, timeout, assumptions, model request, readback terms, solve index, and result;
- a consistent closed session after the single solve.

Export, source, descriptor, query, session identity, signature, solver hash, timeout, readback, receipt, or close tampering fails closed. The adapter sends no retry and makes no local fallback. A reconciled receipt may authenticate a lost HTTP solve response under the neutral adapter's existing current-schema rule; it does not issue a second solve.

Status meanings are:

- `SAT`: accepted only after independent exact-rational replay of all 45 distinctness, 30 metric-row equalities, and 80 strict-convexity inequalities. A missing, malformed, or false model becomes inconclusive.
- `UNSAT`: `UNSAT_DISCOVERY_ONLY`, diagnostic and not kernel checked. It proves no Lean theorem and no universal Euclidean claim.
- `UNKNOWN`: explicit inconclusive result. `interrupted_by=daemon_deadline` remains visible in the authenticated engine artifact.
- adapter or PIQD session/transport error: `ERROR_NO_VERDICT` at leaf
  classification, with no local recovery path. In the authenticated wave these
  failures abort before publication; the private staging root and any adapter
  tombstone are preserved fail-closed and no error row is installed.
  Deterministic source, producer, descriptor, root identity, and custody errors
  likewise abort the whole wave; they are not relabeled as solver leaves.

Every published per-system directory contains immutable descriptor, source,
original, journal, session, receipt, solve, semantic-replay (for SAT), and
result artifacts. The wave itself is reserved create-once beneath a held
nofollow parent descriptor; per-system directories are staged below that held
root, and the root is installed with no-replace rename and fsync only after an
exact inventory check. Hostile or pre-existing entries, including adapter
tombstones, are never overwritten, removed, or published. A solver/session
failure preserves private staging fail-closed and installs no error row.
`validate_wave_output`
reopens the exact published tree with bounded nofollow reads, reloads the
authenticated source, reconstructs every listed system packet, checks the
artifact hashes and session lifecycle, and repeats exact-rational SAT replay.
Its leaf checks are descriptor-relative beneath one held wave root FD, require
exact scalar schemas and inventory equality, and derive outer status fields
from the archived solve, receipt, and session artifacts. Source ingress takes
bounded nofollow snapshots of the manifests and every referenced dependency,
query, semantic, and bootstrap file before and after legacy parsing and packet
preparation.
The public `load_authenticated_current_source` API returns the parsed manifest,
the authenticated system tuple, and an opaque snapshot token; callers invoke
`recheck_authenticated_current_source` after leaf execution to verify the exact
source bytes again.

## Qualification state

The capped test runner exercises the producer-neutral SMT adapter, the
Survivor-CVC5 adapter, the legacy driver boundary, and the canary launcher with
fake current-schema transports. Its final checkpoint is 135 passing tests plus
Ruff check and format gates. Coverage includes first-command and source/query
custody, cvc5-only execution, optional `replayed=false` response compatibility,
known SAT and UNSAT controls, daemon-deadline UNKNOWN, false-model rejection,
whole-wave create-once publication and offline replay, deterministic aborts,
solver-failure staging preservation, and adversarial source, registry,
identity, signature, query, receipt, symlink, hardlink, and publication races.

The bounded live index-4 canary is preserved at
`scratch/p97-survivor-cvc5-index04-live-canary-20260810-v1`. It used one fresh
session, `fd60dbcf-3b93-4bcd-9893-486bab648b29`, one solve, and a 20,000 ms
limit. CVC5 returned raw `UNSAT` in 4,702 ms, which the adapter records only as
`UNSAT_DISCOVERY_ONLY` and
`CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED`. The session was closed, and the
daemon-side maintainer independently confirmed that no worker remained live.

The canary pins:

- daemon executable SHA-256
  `6087acb84cf179821240625b60f93502e37eb8b5362840a70b810103c9d1b464`;
- cvc5 signature `cvc5-1.3.3` and executable SHA-256
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`;
- pre/post canonical `/version` SHA-256
  `00bb9d6b56e5ba6310e9c26ab71f0eeb034a6630cdcc48c1c65848dcadd512e8`;
- pre/post complete solver-registry SHA-256
  `1b434735f1320f792e5ce575983e177e8064a23b7ec37afd6ed5f358e5cdef5c`;
- selected-cvc5 canonical SHA-256
  `e3915dbb58e6c47273c6131f0f9aa9633376ac433efa41a813f52b36a990ec79`;
- engine receipt SHA-256
  `a5a619381fb8199a14f33854d09b3b8fca88e4a6e2134c1f02bfc2a9c8c4ddbe`;
- outer canonical manifest SHA-256
  `0532eec9e7020dea3adae72285a4c4966dc9eaea9473d2befc22045520f9f9ad`;
- result file SHA-256
  `b172d4d92e298555716e199592016e0c67e50aeb6b25387e5cf1ee416de4f5e8`;
  and
- canonical result SHA-256
  `80d1afc9d03b8eb43f6c7dd724356c477c923b5d2e4144a5723f0391b76031cc`.

Canonical identity objects use sorted-key compact JSON with no trailing
newline. A maintainer reproduced the `/version` digest without the canary code.
The `/solvers.daemon` versus `/version.daemon` equality is a restart detector,
not an independent second attestation, because both endpoints are produced by
the daemon. Full registry equality additionally rejects any registration or
data-directory drift across the solve window.

The independent read-only audit reconstructed index 4 from the authenticated
21-file, 48-system source fixture; reran the public leaf and descriptor-relative
validators; verified the exact 8-entry outer and 11-entry leaf inventories;
and rechecked all receipt, journal, session, source, engine, and hash bindings.
The whole-wave validator correctly rejects this deliberately single-leaf
canary root because it has no wave `source-manifest.json`; the applicable leaf
validators pass. Audit evidence is in nthdegree messages `#4917` and `#4919`,
with daemon-side corroboration in `#4916` and `#4918`.

No Lean build or proof-blueprint mutation was performed. Proof, global,
theorem, Lean, universal, and Euclidean Problem 97 claims are all false. No
PIQD defect was found.
