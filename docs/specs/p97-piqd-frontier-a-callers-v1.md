# P97 certified PIQD A-core callers v1

## Status and scope

This specification migrates the original finite/local A-core `run.py` and
`smoke.py` callers onto the certified PIQD frontier seam.  It does not change
the A-core Boolean encoding, establish source entitlement, prove aggregate
case coverage, or close a Lean theorem.  Proof-blueprint session `019fdf9c`
remains **OPEN**, **OFF_SPINE**, and unchanged by this caller migration.

The A-core results retain their existing interpretation: a SAT result is a
total finite-model replay for the exact effective CNF, and an UNSAT result is
only a local obstruction for that exact finite package.

## Backend contract

The production default is `piqd`.  `legacy-local` is available only through an
explicit `--solver-backend legacy-local` selection.  There is no exception
fallback from PIQD to the local solver.  `--workers` accepts exactly `1`, so the
existing chronological run and smoke-gate order remains single-process and
sequential.

## Authenticated package contract

Each effective DIMACS query gets a fresh package, PIQD transport, and concrete
Lean LRAT replayer.  The package binds:

1. the exact effective DIMACS bytes;
2. a complete variable map over every ID from `1` through the DIMACS header,
   preserving all A-core named atoms and explicitly naming anonymous
   auxiliaries;
3. bounded source snapshots for the active caller, A encoder and encoding
   spec, this migration spec, and its finite/local Lean and prose context;
4. a chronological build ledger whose final allocator watermark equals the
   effective DIMACS header; and
5. an A-lane profile classified `FINITE_LOCAL` / `LOCAL_CERTIFICATE`, with no
   aggregate source entitlement.

The run caller has three allocator states.  In the source image authenticated
by this checkpoint, the common base ends at variable `871`; DEL3 adds Sinz
variables through `881`; the A1 extension then ends at `1062`.  `base` uses the
first ledger, `base+P` and its five leaf probes use the
first two phases, and `base+A1` uses all three.  Smoke constructs both mutable
extensions before its first solver query, so every smoke package carries the
full `871 -> 881 -> 1062` ledger even when a particular clause set uses only a
prefix of those variables.

## Certified result contract

PIQD SAT is accepted only with a total assignment that independently replays
every clause of the exact packaged CNF before A-core model decoding.

PIQD UNSAT is accepted only when PIQD custody includes the fetched kept CNF,
the strict clause map, a compact LRAT proof, and successful concrete Lean
replay.  The returned result must have `proof_verified is True`.  The legacy
requested `*.drat` path is a custody anchor only and is never written by PIQD;
the certified files use sibling suffixes `*.lrat`, `*.kept.cnf`,
`*.clause-map.json`, `*.replay.lean`, `*.replay.json`, and
`*.piqd-certified.json`.  Manifests record both the untouched requested path
and the actual PIQD custody paths.

## Caller semantics

`run.py` preserves the original order and expects all eight finite A-core runs
to be SAT.  Any UNSAT or inconclusive result makes the CLI fail.

`smoke.py` preserves its validation checks, gate order, stop-after-G-BASE
behavior, witness decoding, and ten-pair/four-probe cardinality
checks.  Every expected-UNSAT smoke result now passes only when
`proof_verified is True`; SAT gates are protected by the shared total-model
replay.

## Focused test boundary

`census/frontier-packages/test-a-piqd-callers.sh` caps common native thread
pools at one and runs only
`census/card_head/tests/test_piqd_frontier_a_callers.py`.  The tests use fake
transports and fake solver results.  They do not contact a daemon, invoke a SAT
solver, run Lean, or perform Git operations.
