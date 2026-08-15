# FreshThird first-non-hit deletion-fan v2

## Status: DUPLICATE-GATE STOP — no solver run

This is the smallest finite quotient that was authorized for this bounded
audit.  It adds the two source-clean retained-first-apex declarations named in
the request, and retains only general incidence/deletion consequences already
available in the source.  The quotient is finite and its retained-fan
projection is source-faithful, but the fan is disconnected from the canonical
`Q` row under the current APIs.

Consequently this package stops before emitting SMT-LIB.  No Z3 or cvc5 run,
model readback, malformed-control run, Lean build, NRA search, or second CEGAR
wave was performed.  Running a detached fan-plus-Q product would reproduce a
v1-style diagnostic and would not test the requested source implication.

## Exact gate

`exists_retainedFirstApex_mutualDeletionPair_threeLocationCases` produces
`z,w` in the retained `SelectedClass D.A S.oppApex1 radius`, with mutual
deletion survival, distinct actual centers, and exactly three location arms:

1. retained interior source, then an adjacent-cap point;
2. adjacent-cap point, then retained interior source;
3. opposite adjacent caps.

`retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent` refines
arm 3 to the exact support `{P.source₁,P.source₂,z,w}`.  Neither declaration
contains `Q` or a Q-shell, and no hypothesis in either declaration identifies
`P.source₁/P.source₂` with `Q.source₁/Q.source₂`.  The general fan producers
likewise quantify a selected four-row, not the FreshThird Q row.

Thus the proposed anchor variables have no source-entitled edge to

```text
Q.source₁, Q.source₂,
(H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support,
H.centerAt Q.source₁.1 Q.source₁.2.
```

The requested question — whether every anchor candidate can avoid a
distinct-center overlap of at least three with Q — is therefore **not decided
by this source API**.  An assignment that says all anchors avoid Q would be a
detached product assignment, not a validated SAT survivor.  An UNSAT result
from that product would likewise have no source-faithful coverage argument.

See `INGRESS-CONTRACT.md`, `quotient-schema.json`, and `SOURCE-MAP.md` for the
finite roles, exact clauses, and the missing edge.  `RESULTS.md` records the
deliberate no-run outcome.
