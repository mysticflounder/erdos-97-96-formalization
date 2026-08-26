# Unused-point deletion regression

**Classification:** PROVEN finite incidence/order regression.
**Artifact:** `scratch/atail-force/endpoint-continuation/finite_countermodel.lean`
**Artifact SHA-256:** `0a126cbeb59241d255025b6f3648c5b2f2d9517f3490b38ad5b11b4ff068affc`

The kernel-checked `Fin 13` model has interior blocker-cycle rows that omit both
cap endpoints. It records the precise failure mode behind the rule: a point
unused by selected rows is not thereby removable.

**Fails:** metric realization and the full source packet. Its role is to reject
arbitrary-deletion edges in the containment DAG.
