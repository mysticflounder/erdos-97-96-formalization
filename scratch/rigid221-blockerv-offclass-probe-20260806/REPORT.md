# Rigid221 BlockerV off-class probe (2026-08-06)

Status: **SAT** for the finite necessary-incidence abstraction.  This is not a
Euclidean realization and is not a Lean closure.

The probe uses the first cap profile with `|oppCap2| >= 9`, namely
`n = 16`, profile `(5,5,9)` (surplus, opp2, opp1).  The physical class is the
five-point set `{u,xu,v,xv,deleted}` in the nine-point `opp2` interior.  It
enforces the full five-class pair capacity (the physical apex consumes one
center per pair), exact packet traces, source membership in each selected row,
the identities `centerAt u = xv`, `centerAt xv = v`, `centerAt v = deleted`,
`centerAt deleted = c`, and the selected row at `c` having at most one physical
class hit.  Selected rows are indexed by source, while their actual center is
represented by the blocker map; this matches `selectedAt q`/`centerAt q`.

CaDiCaL result: SAT, 225486 variables and 3683601 clauses.  Witness:

```
centerAt(u)=xv, centerAt(xu)=15, centerAt(v)=deleted,
centerAt(xv)=v, centerAt(deleted)=c, centerAt(c)=u.
```

The surviving feature is a six-source directed center map with an unconstrained
`xu` escape center and a `c -> u` return edge.  Thus the packet plus the
`|K_c ∩ C| ≤ 1` premise does not contradict the exact finite incidence surface;
a universal closure needs an additional source-level producer (for example a
constraint on the escape center or a global cyclic-order/metric consequence).

Artifacts: `probe.py`, `probe.cnf`, `probe.solver.log`, and `probe.json`.
