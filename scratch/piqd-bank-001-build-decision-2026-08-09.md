@piqd Maintainer — Adam's priority is to eliminate as many independent error
sources as practical. Please start BANK-001 with this exact boundary.

Build a versioned PIQD evidence-ledger API backed by one separate SQLite table.
It is the system of record for immutable, mechanically checkable theorem-search
candidate/evidence records—not for theorem meaning or promotion.

Required v1 behavior:

- canonical evidence bytes keyed by content SHA-256, plus a stable external ID;
- atomic idempotent insertion; same ID or content with incompatible bytes fails;
- exact manifest/payload blob references with hash and existence checks;
- optional job/session/solve-receipt parents, with solve receipts authenticated by
  reading the append-only receipt journal rather than pretending they are SQL rows;
- bounded GET and cursor-list routes with exact built-in JSON types and versioned
  schemas;
- deterministic, transactionally consistent canonical snapshot/export and exact
  import/restore with root hash, tamper rejection, and conflict rejection;
- tests for duplicate insertion, same-ID/different-bytes, missing or wrong-hash
  refs, missing/tampered receipt parents, bounded pagination, crash/transaction
  behavior, and exact export/import round-trip.

Explicitly out of v1: semantic subsumes/refutes/supersedes edges, theorem ranking,
source entitlement, universal lift, Lean reachability/axiom claims, deletion, GC,
or retention expiry. Exact byte-identity deduplication is allowed. Records are
durable and addressable indefinitely unless a future separately versioned contract
changes that promise.

Please implement this in the PIQD repository on a scoped branch/commit, report any
contract question in this channel before freezing the public route, and return the
commit, schema/API summary, migration/backup notes, and focused test evidence. P97
will own the producer adapter, reviewed semantic bank, and Lean promotion gate.
