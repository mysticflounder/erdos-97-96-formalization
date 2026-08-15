# FreshThird aligned Q/core v6 diagnostic

Scratch-only bounded diagnostic derived from corrected v5. Production Lean and
authoritative documentation are not edited.

## Added source-entitled clauses

For each core and each side, `source0` and `source1` are asserted absent from
the synchronized x-shell and y-shell. The source basis is the
`CapSourceThirdCanonicalRowWitness` fact that both source points lie in
`capInterior` and outside both retained endpoint pairs, together with
`hfrontierInteriorEq`, `hρInteriorEq`, and `shellAt_radius_eq`.

The v5 controls remain: unconditional shell synchronization, both endpoint
memberships on every corresponding shell, unconditional source-row/apex-shell
and Q-row/apex-shell intersection bounds, and the equal/distinct blocker row
relation. Four anonymous filler vertices are included in each shell universe,
shared by synchronized cores and subject to disjointness, so exact-four shell
cardinality is not accidentally restricted to the nine named points.

## Run and result

```text
uv run python scratch/p97-consumer-first/freshthird_aligned_q_core_v6/freshthird_aligned_q_core_v6.py
```

Z3 and cvc5 agree on every check. All 24 arm/mode queries are SAT, while the
negative controls for each of the four new source-membership clauses and all
inherited v5 controls are UNSAT in both solvers. The survivor support census is
in `survivor-summary.md`. This is diagnostic only and makes no closure claim.
