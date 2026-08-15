# piqd fit for the P97 CEGAR process

Date: 2026-08-07  
Scope: read-only audit of P97 CEGAR artifacts/scripts from 2026-07-25--2026-08-07 and the `piqd`/`piqc`/`piqd-encoder` workspaces.  
Proof-blueprint anchor: `Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`.

This is an integration audit, not a closure claim.  A finite SAT result, a DRAT/LRAT certificate, or a QF_LRA/QF_NRA result is evidence for a producer-side instance.  It is not a P97 theorem until the source ingress, Lean consumer, and universal lift are separately checked.

## Executive finding

The lowest-risk fit is a thin Python CEGAR adapter using piqd as an exact, content-addressed oracle for each generated DIMACS.  The P97 coordinator should remain the owner of iterations, learned clauses, source-faithful manifests, and checkpoints.  piqd already supplies exact raw-DIMACS storage/identity, SAT models, terminal CaDiCaL proof replay, retry/crash recovery, concurrent workers, durable incremental-session journals, and basic solver telemetry.  It does not currently supply a semantic CEGAR coordinator, learned-clause/assumption-core API for the raw lane, universal-lift metadata enforcement, or durable attempt-level UNKNOWN history.

## Capability matrix

| Need | Exists now | Boundary/gap |
|---|---|---|
| Raw DIMACS ingress | `POST /jobs/prepare-cnf` validates and stores exact bytes; identity hashes namespace, backend/profile, CNF blob, and producer-manifest hash | Manifest JSON is semantically opaque; no CEGAR iteration/checkpoint semantics |
| Job identity | Content-addressed dedup; profile-sensitive identities | Run/attempt/shard lineage is not first-class; changing manifest metadata intentionally changes identity |
| UNKNOWN/retry | Ordinary UNKNOWN can reset to prepared; running jobs reset after crash | Current job record is verdict-level and retry reset loses historical attempts; P97 must distinguish timeout, solver nonterminal, replay unknown, iteration limit, and survivor |
| Checkpoints | SQLite job state/progress; session journals flush/sync before acknowledgement; `piqc` uses atomic record replacement | Learned-clause sets, parent checkpoint hashes, and source hashes remain producer-owned |
| Discovery/certification | Profiles separate identities; terminal CaDiCaL UNSAT can trigger binary DRAT and LRAT pipeline | SAT/model and finite UNSAT remain discovery evidence; piqd does not certify Lean ingress or universal lift |
| DRAT/LRAT | UNSAT replay stores proof and kept-CNF blobs; exact-CNF export is tested | Replay proves the submitted CNF only; do not infer P97 closure |
| Concurrency/sharding | `run_forever(..., max_workers)` claims jobs transactionally; `piqc` has bounded pool | No CEGAR shard/order ownership or deterministic shard manifest; coordinator must provide it |
| SAT models | Signed-literal model endpoint for CaDiCaL/Kissat (SMT model blobs) | Producer must validate the model and provide variable-map/schema hashes; march_cu model endpoint is unavailable |
| SMT/QF_NRA | Z3/cvc5 job/session lanes, durable SMT-LIB journal, UNKNOWN and model/core support | Raw-CNF lane rejects SMT; generic exact raw-SMT2 ingress and P97’s arbitrary QF_LRA/NRA metadata are not a single contract |
| Telemetry | Progress includes backend, last line, cubes, decisions/conflicts/restarts, elapsed time, solver version | No iteration/cell/attempt/learned-clause/unknown-reason fields; keep scientific telemetry in producer records |

## P97 evidence and implications

`run_exact17_cadical_cegar.py` rebuilds an exact CNF each iteration, verifies SAT models, immediately checks UNSAT DRAT, and writes an append-only journal plus atomic checkpoint.  `exact17_source_faithful_cegar.py` revalidates source hashes, cyclic order, and weighted-cache hashes on resume.  The source-faithful manifest explicitly says that nogood soundness and Lean lift remain separate.  These are the authoritative producer-side invariants; piqd can carry their hashes but cannot interpret or prove them.

The existing checkpoints include terminal states such as `linear_unknown_survivor` and `iteration_limit`, as well as CNF hashes, learned-pattern counts, and record counts.  They demonstrate why a single SAT/UNSAT/UNKNOWN field is insufficient: a QF_LRA `unknown` blocks a model but is not a proof, and an iteration limit is neither UNSAT nor closure.

## Prioritized integration plan

### P0 — exact static-oracle adapter (safe now)

For each producer iteration: export exact DIMACS bytes; hash them; submit with a manifest containing producer run/iteration, parent checkpoint hash, source hashes, order/shard identifiers, variable-map hash, query polarity, intended result class, solver profile, timeout, and seed.  Poll piqd.  On SAT, fetch and independently validate the assignment, then append the model/learned clause to the producer journal.  On UNSAT, consume a proof only when the certification profile requested it; otherwise record discovery evidence.  Keep the P97 checkpoint and journal canonical.

### P1 — preserve provenance and outcome taxonomy

Add an adapter-side immutable attempt record keyed by `(run_id, iteration, shard_id, cnf_hash, profile)` and retain every retry.  Define explicit outcomes (`sat_model`, `boolean_unsat_certified`, `solver_timeout`, `solver_unknown`, `linear_unknown`, `iteration_limit`, `survivor`, `replay_failed`) and a policy that no UNKNOWN-like outcome certifies closure.  Include the named proof-blueprint anchor as a consumer reference, not as a piqd verdict.

### P2 — optional incremental-session lane

Use the existing durable SAT/SMT session journals only for a measured optimization: export the final exact CNF and route certification through the static raw-DIMACS path.  Do not assume current sessions provide CEGAR failed-assumption cores or atomic semantic learning.  A future CEGAR session API needs explicit clause/assumption provenance and replay tests before replacing P0.

### P3 — exact raw-SMT lane (only if workload warrants it)

Add a raw-SMT2 content-addressed ingest contract (exact script bytes, dialect/protocol, solver binary hash/profile, source manifest, timeout, and model/UNKNOWN taxonomy), or keep QF_LRA/NRA checks in the existing producer-side Z3 replay.  Either way, universal-lift metadata stays an externally verified consumer obligation.

## Acceptance tests

1. Submit identical bytes and manifest twice: dedup returns the same identity; changing profile or manifest hash yields a distinct identity.  Exported bytes match byte-for-byte.
2. Adapter crash/restart after each iteration: checkpoint parent hash, CNF hash, clause counts, and journal replay reconstruct exactly one next iteration; prior attempts remain immutable.
3. SAT returns a model that the producer revalidates against the exact clauses and variable-map hash; malformed or schema-mismatched models are rejected.
4. Discovery UNSAT and certification UNSAT are distinct profiles.  Certification stores exact kept CNF plus verified DRAT/LRAT; SAT stores no proof; proof failure cannot be reported as theorem closure.
5. Concurrent workers claim each job once.  Distinct `(shard_id, order_index, seed)` manifests do not collide, while an exact retry of the same immutable attempt does.
6. Inject timeout/nonterminal solver results, QF_LRA/NRA UNKNOWN, `iteration_limit`, and survivor cases.  Adapter preserves their distinct outcome classes and never auto-promotes or auto-retries without policy.
7. Delete a raw blob before execution: job fails closed and producer records a missing-input failure, not UNKNOWN or closure.
8. Session journal restart/export reproduces exact client clauses/script; rejected SMT commands are absent.  Z3/cvc5 model, assumption-core, and UNKNOWN records carry solver protocol/version metadata.
9. Source-faithful manifest carries exporter/fullcover/order/bank/runner hashes, Lean consumer, and universal-lift status.  piqd stores the manifest hash; a separate adapter/Lean audit rejects missing or mismatched ingress/lift evidence.

## Explicit non-goals

This integration does not replace the Python CEGAR coordinator, add IPASIR or failed-assumption-core semantics to the current raw lane, make manifest JSON trusted semantics, certify arbitrary QF_NRA, promote finite-order UNSAT to an all-order theorem, or establish the anchor theorem.  No solver/build was run for this audit, and no production or git state was changed.
