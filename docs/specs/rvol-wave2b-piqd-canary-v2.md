# RVOL Wave 2b PiQD canary v2

This is the immutable budget-only successor to v1. It preserves the exact
`Fin 9` semantic variables, root predicates, detector, refinement admission,
toolchain, and promotion boundary. The only operational change is increasing
`budgets.max_iterations` from 64 to 1,024.

The machine contract is `rvol-wave2b-piqd-canary-v2.json`, with contract
self-hash
`257b2a16eff24167afb1163d881c1ac3d989944a01e9eff25b6b12555fb6a59a`.
Its deterministic root CNF remains 72 variables and 4,551 clauses with SHA-256
`778d14255f26fac6176f721cf4b1bd2f14d90fdea4bbb10c3f9e2edd316a5d1f`.

The cell remains discovery-only. `MAXITER` is a partial census, `ALIVE` is an
unresolved abstract survivor, and only authenticated `DISCOVERY_UNSAT` plus
independent refinement replay could establish finite abstract coverage. Even
that would not prove the unformalized source-to-cell bridge or any source,
`Card18`, cap, MEC, arbitrary-cardinality, or Lean claim.

Publication-quality verification requires the strict PiQD receipt-parent chain
and a PiQD session export byte-identical to the independently reconstructed
final CNF.
