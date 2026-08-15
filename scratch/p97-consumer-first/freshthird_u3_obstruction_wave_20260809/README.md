# FreshThird U3 obstruction: one bounded wave

This directory contains one theorem-discovery wave for the source packet
produced by `SixSurvivorExactRowsBoundary.exists_u3AuditObstruction` and
`U3FixedTripleAuditFrame.exists_qDeleted_escape_or_criticalFourShell`.

The model is deliberately finite and structural.  It retains six exact
four-point q-deleted rows, six distinct row centers, the three-point dangerous
p-radius class, the off-radius U5 candidate, the three auxiliary points, and
each of the six possible bounded audit centers.  It keeps the escape and
critical-shell alternatives in separate solver families.  It uses only
source-level cardinality, distinctness, q-deletion, and conditional
two-circle intersection bounds.  It does **not** assert an unsupported
Euclidean realization, angular order, Kalmanson inequality, or EdgeClosure.

Run with:

```text
uv run python scratch/p97-consumer-first/freshthird_u3_obstruction_wave_20260809/run_wave.py
```

The generated SMT-LIB files are independently checked with Z3 and cvc5.
`results.json` also contains a pure-Python validation of every Z3 SAT model.
