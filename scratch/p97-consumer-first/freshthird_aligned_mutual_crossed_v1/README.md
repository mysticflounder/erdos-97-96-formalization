# FreshThird aligned mutual crossed v1

This directory is a reproducible **exact-17 diagnostic only** for one
constructor: the direct-orientation
`FirstFiberCrossedThreeRowExactSupports` arm inside
`FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`.

It is not a general-`n` producer, not a model of the complete Euclidean Lean
context, and not Lean closure.  SAT means only that the encoded finite
abstraction or explicitly named metric fragment is consistent.  UNSAT means
only that the corresponding emitted query is inconsistent.

## Reproduce

From this directory:

```bash
uv run --script diagnostic.py run --timeout 20
uv run --script diagnostic.py verify-assignment
uv run --script diagnostic.py verify-global-assignment
uv run python -m unittest -v
uvx ruff check diagnostic.py test_diagnostic.py
uvx ruff format --check diagnostic.py test_diagnostic.py
python3 -m py_compile diagnostic.py test_diagnostic.py
```

The run uses one process at a time (well below the 12-core ceiling).  It writes
`results.json`, both independently checked assignment JSON files, and the exact
SMT-LIB queries under `generated/`.  Every query contains exactly one
`check-sat`.

## What is encoded

The structural stage has a 17-element carrier, all 17 selected exact four-row
incidence sets, carrier-valued blockers, the exact closed-cap profile `(8,6,6)`,
the direct aligned distinct-blocker packet, direct-or-mirror boundary blocks,
cyclic separation, the direct crossed three-row payload, the exact mutual
intersection of the two `C` rows, and the proved fourth-point selected-row
omission saturation.  [INGRESS-CONTRACT.md](INGRESS-CONTRACT.md) maps every
load-bearing clause to source.

A separately reported full-carrier incidence stage adds a chosen four-point
K4 witness at every carrier center, locks the witness at each actual blocker
to its canonical selected row by unique-four minimality, and enforces the
branch-neutral two-circle bounds.  The three rich apices enter only through
the source theorem's exact strict-cap alternative: one radius slice of size at
least four, or two distinct-radius slices of size at least two.  This is still
an incidence abstraction, not a simultaneous Euclidean realization.

For `C.first`, `C.second`, `commonFourth`, and `oppositeFourth`, the global
stage asks whether pointwise K4 forces either two hits in a rich slice of a cap
distinct from the actual blocker's cap, or overlap at least three with the
explicit first-collision Q row.  It does not: the query with both positives
negated is SAT in both solvers and its exported assignment independently
validates.

The metric stages use a separate 17-point rational-coordinate fixture.  Stage
1 checks equal-radius equations for the four rows named in this diagnostic.
Stage 2 adds exactness against every other point in that fixture.  It does
**not** add convex position, Moser arc predicates, every carrier point's
Euclidean selected row, `no_qfree`, or a simultaneous Euclidean realization of
the global K4 stage.

The first-collision outside pair `Q.source` / `Q.otherOutsidePoint` is never
identified with an apex-centered adjacent-grid radius hit.  No adjacent-grid
roles occur in the schema.  Such an alias has no source theorem in this
constructor and is rejected at ingress rather than silently asserted.

## Solver protocol

Both external wrappers:

- emit exactly one `check-sat`;
- classify `SAT`, `UNSAT`, and `UNKNOWN` separately;
- classify a nonzero exit, missing status, or multiple statuses as `ERROR`;
- use a bounded timeout; and
- never infer a mathematical result from `UNKNOWN` or `ERROR`.

For SAT, an independent in-process Z3 model is exported and a plain-Python
verifier rechecks the structural clauses.  The rational metric fixture is
independently checked using `fractions.Fraction`.

See [RESULTS.md](RESULTS.md) for the current result and its limits.
