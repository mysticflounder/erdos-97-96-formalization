# PIQD raw-DIMACS verdict and proof-lifecycle audit — 2026-08-12

## Verdict

Read-only audit of `/Users/adam/projects/rustprojects`. The next exact-17 wave
must remain held. Immutable CNF snapshotting and exact proof replay are sound in
the inspected path, but solver verdict classification is fail-open with respect
to abnormal exit status, and proof pointers are not consistently bound to the
current run/result lifecycle.

## Findings

1. **HIGH — transcript verdict can override abnormal exit.** CaDiCaL discards
   `ExitStatus` and classifies stdout (`piqd/src/solver/cadical.rs:155-183`).
   Kissat and direct march parse the transcript before considering exit status
   (`kissat.rs:162-171`, `march_cu.rs:733-755`), and march cube solves discard
   status (`march_cu.rs:715-730`). A nonzero/crashed solver that emitted a
   verdict can therefore become terminal SAT/UNSAT. Contradictory verdict text
   resolves to UNSAT. Require one unambiguous verdict plus the backend's accepted
   successful exit status.

2. **HIGH — crash/rerun can expose a stale proof pointer.** Proof pointers are
   persisted before terminal completion (`piqd/src/runner.rs:426-460,510-528`).
   Startup recovery changes `running` to `confirmed`, and `set_completed` writes
   the new result, without clearing proof/kept-CNF hashes
   (`piqd/src/db/jobs.rs:264-270,296-302`). `/proof` serves the pointer without
   requiring the current result to be UNSAT (`piqd/src/http/proof.rs:28-53`).
   Same-CNF replay prevents a false Lean proof, but the pointer is not a sound
   current-run artifact identity.

3. **MEDIUM — proof blob can become unreachable.** Blob storage precedes
   `set_proof_blobs`; a database update error is logged and ignored
   (`piqd/src/runner.rs:432-460`). The job can then complete UNSAT without a
   retrievable certificate. This is an availability/completeness failure, not a
   false proof.

4. **MEDIUM/contract-dependent — raw UNKNOWN is one-shot.** Raw prepare returns
   an existing identity row without resetting UNKNOWN (`prepare_cnf.rs:327-362`),
   and confirm rejects non-`prepared` jobs (`confirm.rs:32-35`). The raw spec
   describes this lane as static one-shot; document that restriction or add a
   provenance-preserving retry route.

5. **LOW — march proof manifest omits the base CNF hash.** `ProofManifest`
   records the backend, cubes, and per-cube artifacts but not the original CNF
   identity (`piqd/src/proof.rs:61-78`). Consumers must cross-check the job's
   `cnf_blob_hash`; preferably include it directly in the manifest.

## Verified strengths

- claim/dedup uses an atomic transaction (`piqd/src/db/jobs.rs:208-240`);
- prepare/confirm, snapshot, and post-run CNF hashing are enforced
  (`confirm.rs:49-67`, `blob.rs:123-142`, `runner.rs:336-355`);
- blob writes are content-addressed and atomic (`blob.rs:145-198`); and
- `drat-trim` requires exit zero and exact `s VERIFIED`, removing rejected
  output (`piqd/src/proof.rs:223-284`).

No additional demonstrated proof-byte/CNF detachment was found beyond the
stale-pointer crash window.
