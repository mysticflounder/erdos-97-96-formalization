# Phase-3 frontier cube24 checkpoint audit

Read-only snapshot: 2026-08-01 10:17:54 PDT. Target round:
`phase3_projected_static_v2_frontier_cube24_20260801_050632`.

## Result

**Authoritative state: `RUNNING`, not `CHECKPOINT` and not terminal.** PID/PGID
67356 was live with PPID 1, state `RNs`, and elapsed time 05:11:22. At the
process snapshot the PGID contained the coordinator only; regardless of
transient solver-child state, the coordinator/source writer has not exited.

The latest manifest captured and self-hash-authenticated during the audit had
manifest SHA-256
`5a595cc87dedf8bb1b70921e70b3ad5e7e1c4fe5924073e7ceb02f99f555a987`
and reported:

- raw SAT results: **248,562**;
- classified: **29,252**;
- unclassified/stale-current-antichain: **219,310**;
- active antichain: **26,607**;
- learned records: **29,724** = 472 bootstrap + 29,252 dynamic;
- structural survivors: **0**.

The manifest had null diagnostic/failure and terminal clause count, with
`terminal_drat_verified: false`. No terminal/DRAT/LRAT/proof/counterexample
artifact was present. Thus there is neither a verified terminal result nor a
retained survivor at this checkpoint.

## Authentication

The manifest's canonical self-hash passed the production
`_sha256_value` check. A stable byte prefix of the learned journal was passed
through the current production `_load_learned` path with the projected-static-v2
encoding and all manifest-pinned algebraic templates. It accepted **28,644**
records, reconstructed **25,613** active antichain cuts, and ended at record
chain head
`6b9b40a29253fe92e11fbb4c26eb5ea994e32d815265093e1a65a9929997bba9`.
This checks exact schema/index identity, record hashes and links, certificate
replay, clauses, and supersession metadata. The survivor loader accepted the
empty survivor journal.

The same production record-hash validator accepted these captured top-level
journal prefixes:

- solver log: 882,944 records, chain head
  `e2b0c3e0a6d5e5a8f22c618cbb1beb3c5d6c527e57fbcb2491abf3d46df17d18`;
- cube-batch journal: 27,592 records, chain head
  `4857990e806123f262cf427228f6c77beea6684174838dd357b4bac030d66176`.

These are authenticated moving prefixes, not frozen final digests. After that
replay, `learned-certificates.jsonl` had already advanced to 29,715 lines and
the latest atomic manifest to 29,724 learned records, directly demonstrating
continued mutation.

## Freeze decision

The learned bank is **nonempty but not stable/frozen**. The documented freeze
gate requires the bounded round's exact status `CHECKPOINT`, every writer/PID
to have exited, and a nonempty bank whose before/copy/after digests agree. Here
the status is `RUNNING` and PID/PGID 67356 remains live, so the freeze gate is
**not satisfied**. No completed-bank copy or final-bank SHA should be taken
from this moving source.

No solver, generator, Lean/Lake command, resume, process signal, or source
mutation was performed.
