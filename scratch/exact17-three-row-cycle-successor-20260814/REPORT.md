# Exact-17 complete three-row-cycle successor audit

Date: 2026-08-14

Status: **LEAN-CHECKED SOURCE BANK / INDEPENDENT EXPORT AUDIT PASS**.

## Lean bank

`KalmansonThreeRowCycleSchemas.lean` proves three cardinality-independent
six-point cycle contradictions and both cyclic orientations of each consumer.
Its twelve public metric/consumer declarations have axiom closure exactly
`propext`, `Classical.choice`, and `Quot.sound`.

`BlockerVExactSeventeenThreeRowCycleRefinements.lean` enumerates both named
orders, both directions, seventeen cuts, and 4,368 five-offset choices for
each of the three schemas.  The resulting 891,072 clauses are proved valid for
every exact-17 `SourceRealization`.  Its complete-CNF evaluator and terminal
conditional-UNSAT adapter have no `sorryAx`; they inherit
`Lean.ofReduceBool` and `Lean.trustCompiler` from the accepted exact-17
`native_decide` bank.

Targeted builds passed for the theorem bank, source adapter, and exporter.

## Independent export audit

The direct Lean export has:

```text
p cnf 308 6739936
bytes  322685712
sha256 2870fa87246292872ef0668471b2dab8a708a7c1815e2223a385c2ecb8a8f869
```

`audit_export.py` independently:

1. authenticates the Child46 parent SHA-256
   `106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2`;
2. compares the complete Child46 clause body byte-for-byte with the successor
   prefix;
3. regenerates all 891,072 suffix clauses without importing the Lean
   generator;
4. compares every generated clause in order with the Lean export; and
5. evaluates the suffix against the authenticated Child46 source model.

The audit passes.  The new suffix falsifies twenty clauses under that model,
so the successor nonredundantly removes the authenticated Child46 assignment.

## Scope

This is not exact-17 closure.  The uniform theorem handles the direct
six-distinct-point order types only.  It does not claim that every six-hit
producer certificate has that form.  Immutable publication, registered
ingress validation, one PIQD successor, terminal replay, and either wave-only
mining or UNSAT composition remain required.
