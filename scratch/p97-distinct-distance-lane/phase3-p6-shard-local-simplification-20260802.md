# Phase-3 P6a fixed-shard local simplification report

Date: 2026-08-02

Status: implemented in the projected-static-v3 successor, opt-in.  This is
an exact shard-local formula transformation and an authenticated artifact
contract; it is not a solver speedup claim, a new mathematical lemma, or
Problem 97 closure.

## Scope

The new module
`census/p97_search/phase3_shard_optimization.py` implements schema
`p97-phase3-shard-local-simplification-v1`.  Given the authenticated source
clause sequence and a consistent fixed-shard assignment, it:

- drops clauses satisfied by the shard units;
- removes falsified literals;
- preserves explicit empty residual clauses;
- removes tautologies and duplicate residuals; and
- applies deterministic strict-subsumption elimination.

The residual retains the shard literals as unit clauses.  Therefore the
plain-DIMACS solver input has the same models as the source formula conjoined
with the shard assignment.  The metadata records source/residual counts and
hashes, retained-source-index hash, transform hash, and all transformation
counters.

The successor driver accepts this option only for a top-level fixed shard in
sequential mode.  The cube-batch path and frozen v2 driver are unchanged.
The exact residual CNF is still frozen for terminal proof production; the
fresh proof-producing rerun and existing checker remain the trust boundary.

## Verification

Commands were run from the repository root with `uv`; `PYTHONPATH=.` is
required for the repository-local `census` package.

```text
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_shard_optimization.py -k 'not driver'
4 passed, 1 deselected in 0.27s

PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_shard_optimization.py \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
41 passed in 168.10s

uv run --with ruff ruff check \
  census/p97_search/phase3_shard_optimization.py \
  census/p97_search/phase3_structural_cegar_projected_static_v3.py \
  census/p97_search/tests/test_phase3_shard_optimization.py
All checks passed.

uv run python -m py_compile \
  census/p97_search/phase3_shard_optimization.py \
  census/p97_search/phase3_structural_cegar_projected_static_v3.py \
  census/p97_search/tests/test_phase3_shard_optimization.py
passed
```

The pure tests exhaustively compare source and residual truth tables on a
bounded six-variable corpus, cover tautologies, duplicates, subsumption,
explicit empty residuals, and contradictory assumptions, and verify the
deterministic three-level fixed cube partition is exhaustive and disjoint.
The driver/resume canary uses an injected UNSAT solver and checker, verifies
the residual terminal artifact and authenticated manifest/log metadata, then
confirms a completed resume does not invoke the solver.  No production solver,
large bank, multi-process canary, adaptive scheduler, or DRAT proof was run by
this report.

## Source hashes

These hashes identify the reviewed inputs for this report:

```text
7d8638e42718733f2ccb48c748497e34cfa09044c3b7cee9bd35383e2f0fb38c  census/p97_search/phase3_shard_optimization.py
f6627a0fc64c4535d005f4832c457c9120bbac111057b7bd4df8f05bcd1c3916  census/p97_search/phase3_structural_cegar_projected_static_v3.py
b32f115b58b6b40250b4a5995ba108bae3b2e2bf479542cc162f442901519fbe  census/p97_search/tests/test_phase3_shard_optimization.py
41d2971ff09508b90ed68ee54221cef5af3cec9376781de330993afe072b9b70  census/p97_search/PHASE3-SPEC.md
c45608d01d0a68e535843e7815cf10961ee2a902708dc5226a086556ec5c8aa0  scratch/p97-distinct-distance-lane/phase3-cegar-optimization-implementation-plan-20260801.md
```

## Open P6b gate

Adaptive cubing is not included.  The existing cube-batch contract describes
one immutable exhaustive partition and has no authenticated parent/leaf
decision tree.  P6b must define the pilot budget and outcome record, retain
interrupted and `UNKNOWN` leaves explicitly, independently verify pairwise
disjointness and exact parent coverage, and publish immutable bank epochs
before any adaptive scheduler or throughput result is trusted.
