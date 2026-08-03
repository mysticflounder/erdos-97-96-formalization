# Phase-3 P5 authenticated loader cache and antichain index

Date: 2026-08-02

Status: initial successor implementation complete; P5 acceptance and
performance gates remain open.

## Scope delivered

The projected-static-v3 successor now has an opt-in compiled-loader cache and
indexed learned-bank representation. The frozen projected-static-v2 runner
and its namespace were not modified.

Implemented components:

- `census/p97_search/phase3_loader_cache.py` validates a learned JSONL source
  by dense record index, hash chain, record hashes, byte count, terminal chain
  head, and whole-file SHA-256.
- The cache envelope binds the source identity to cache schema, ordering
  schema, v3 driver source, cache-module source, and v3 configuration. Cache
  writes are canonical, hashed, temporary-file-plus-replace writes with file
  and directory durability steps.
- `IndexedNogoodBank` uses interned row IDs, size buckets, and postings. The
  subset query uses a posting union and strict-superset removal uses a posting
  intersection; exact legacy shortest-key and deterministic removal ordering
  are retained. Retired row IDs are omitted from serialized active snapshots.
- `compiled_loader_cache=True` and `--compiled-loader-cache` are successor
  options. Completed/terminal publication writes
  `compiled-loader-cache.json`; shard replay carries the option through.
- Warm loading remains an accelerator only. Terminal publication and completed
  resume perform a full source replay and compare ordered records, clauses, and
  active-bank state with the cached state. Any disagreement fails closed.

## Verification

Focused verification passed:

```text
58 passed in 6.28s
ruff check: passed
python -m py_compile: passed
```

The focused set covers the cache round trip, indexed-bank differential
behavior, source/config/loader/cache invalidation, torn-source rejection,
terminal resume, and the successor/runtime tests. The frozen v2 checks also
passed independently: 92 passed in 371.63s.

The broader benchmark/reference command was not promoted as a P5 gate:
69 tests passed and 7 failed. The failures are in the existing P4 reference
surface: two mock-transcript terminal cases and five runtime-A/B cases whose
test-local frozen publisher does not accept the P4 `proof_solver` constructor
argument. They are recorded separately from the P5 cache path; no focused P5
test failed.

## Open acceptance gates

This is not yet a warm-cache performance claim. The following remain open:

- 45k/65k warm-start and cold-replay measurements;
- 212k replay performance with authenticated suffix checkpoints;
- periodic immutable checkpoint creation and suffix-mismatch handling; and
- peak-RSS and end-to-end acceptance thresholds.

The current source-identity path rereads the learned source once while
priming the existing stream ledger after the identity scan. Eliminating that
duplicate read is a later optimization, not a trust-boundary change.

The cache is therefore opt-in and outside the proof boundary. Full replay
remains the acceptance oracle at terminal, completed-resume, and explicit
audit boundaries.
