# Exact13 witnessed-Key guarded CEGAR wave6 closeout

Status: `NONTERMINAL` partial solver/certificate evidence only.

Lane: `exact13-witnessed-key-guarded-cegar-wave6-20260906`
Recorded base: `fd020fbb3255253b07ffc8229ca6b2c7883ff1d1`
Current repository HEAD at closeout: descendant `9852eb8cb5f8283d7f5a8e0d06508590c45934bc`.
The lane was not restarted for this descendant drift.

## Root and imported frontier

The guarded root was replayed and retained with 432 variables, 31,283
clauses, and 1,815 guarded clauses. Its SHA-256 is
`238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f`.

The wave5 final bank was pinned at 56,000 rows with source SHA-256
`ed2bf13c87c5969be1b3ff45711a37fd7fc2346dfb1402122549141088f74f11`.
The complete import replay checked every source path, certificate, parent
model, provider atom set, reconstructed clause, and zero-sum projection. Its
sealed report SHA-256 is
`3a01167ee3307cf7d6401e1144c77114a03416e760fe2f34c56a97f593060372`.
The historical parent partition was preserved: first 6,000 had 4,431
outside `StrongValid` and 1,569 satisfying it; the later 50,000 imported
parents satisfied `StrongValid`. Historical parent status was not used as a
cut-soundness antecedent.

## Partial PIQD run

The isolated governed PIQD session was
`5ead1a60-d97d-4c52-a6e5-20c13b1ad097`, using
`piqd-satworker-cadical-3.0.1` with a 120,000 ms per-solve timeout and a
configured 3,600 s loop budget. The process was interrupted during the live
frontier; it was not allowed to reach a natural terminal. The producer,
isolated daemon, and worker were then stopped without touching the default
PIQD daemon.

Recorded partial counts:

- bank rows: 63,509 = 56,000 imported + 7,509 new;
- new raw PIQD solves: 7,509, all recorded `SAT`;
- new model certificates: 7,509;
- new cuts: 7,509, comprising 5,700 one-form
  `transitive-incidence-path` and 1,809 two-form cuts;
- total bank form counts: 55,823 one-form and 7,686 two-form.

The append-only bank SHA-256 at interruption is
`2f18fb2f8930767e641049286dbe40da7d6fb0b8543f20fc8abd519483c8b8c2`.
The in-progress state recorded 63,508 rows while the bank had already
appended row index 63,508; this one-row state lag is retained as interruption
evidence, not repaired into a terminal claim.

No model reached the no-short-cancellation branch, so no 1,430-form
exact-rational quotient-cone diagnostic was required or produced. No completed
post-run `StrongValid` replay artifact was emitted or recorded by the
interrupted run. A transient read-only checker observed during closeout
produced no retained post-audit artifact and is not treated as lane evidence.
Therefore the partial run does not claim completed new-model StrongValid
validation.

## Terminal and claim boundary

There is no `events/run.json`, terminal receipt, terminal status, full
post-audit, survivor discharge, UNSAT result, Lean result, or closure result.
The state remains `RUNNING` with the recorded active session because the
process was interrupted. No strict total-wall compliance claim is made;
authenticated terminal elapsed-time fields were never emitted.

This artifact makes no Lean formalization, UNSAT, source-coverage, theorem,
promotion, or exact-cardinality closure claim. The result is bounded,
formula-scoped partial discovery evidence only.

## Retained paths

The checkpoint keeps the run manifest durable plus the eight non-output PIQD
runtime files required by the fixed hygiene policy for a retained generated
root; bulk solver outputs are not promoted as durable evidence. The generated
run root is retained for replay/audit and contains:

- `artifacts/exact13-witnessed-key-effective-root.cnf`;
- `artifacts/exact13-witnessed-key-effective-root.map.json`;
- `artifacts/immutable-imported-wave3-final-bank.jsonl`;
- `events/cut-bank.jsonl`;
- `events/wave3-import-replay.json`;
- `events/state.json`;
- `events/models/`, `events/cuts/`, and `events/piqd/`;
- `piqd-data/piqd.db`, `piqd-data/piqd.lock`;
- `piqd-data-7400/piqd.db`, `piqd-data-7400/piqd.lock`;
- `piqd-data-7401/piqd.db`, `piqd-data-7401/piqd.lock`;
- `piqd-data-7401/sessions/5ead1a60-d97d-4c52-a6e5-20c13b1ad097/journal.cnf`;
- `piqd-data-7401/sessions/5ead1a60-d97d-4c52-a6e5-20c13b1ad097/receipts.jsonl`;
- `run_manifest.json`.

The run manifest SHA-256 is
`9a7319c830f7f889b555053daf321f37bceb4268e4dce23fe7a4d7fd08048734`.
