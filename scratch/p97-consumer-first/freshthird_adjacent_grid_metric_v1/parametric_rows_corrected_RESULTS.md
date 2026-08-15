# Corrected FreshThird source-row replay

Bounded exact-17 diagnostic only; pinned failure is not unpinned UNSAT.

Role audit: C.firstSource=deleted 0 and C.secondSource=source5 are source labels, not circle centers.
Actual centers: b_at(0)=7, b_at(source5)=6; Q.B1 center=2.

Stages:
- geometry: z3=unknown:timeout, cvc5=unknown; pinned=sat/sat
- grid_members: z3=unknown:timeout, cvc5=unknown; pinned=sat/sat
- grid_exact: z3=unknown:timeout, cvc5=unknown; pinned=sat/sat
- rows: z3=unknown:timeout, cvc5=unknown; pinned=unsat/unsat
- source_slices: z3=unknown:timeout, cvc5=timeout; pinned=unsat/unsat
- kalmanson: z3=unknown:timeout, cvc5=unknown; pinned=unsat/unsat

First unpinned z3 non-SAT/unknown stage: geometry
Pinned malformed-geometry control: z3=unsat, cvc5=unsat.
The three rows are encoded with exact member equalities and nonmember disequalities.
No finite result here is promoted to a Lean producer or a universal theorem.
