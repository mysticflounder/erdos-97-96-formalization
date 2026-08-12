# Results

Run date: 2026-08-11; Lean project toolchain is unrelated to this scratch
diagnostic.  Both Z3 and cvc5 were run on each emitted SMT-LIB artifact.

| case | Z3 | cvc5 | scope |
|---|---|---|---|
| `sat_source_local` | SAT | SAT | free local QF_NRA geometry; Z3 selected algebraic coordinates |
| `sat_source_exact_rational_witness` | SAT | SAT | same local constraints with an explicit exact-rational witness |
| `unsat_malformed_two_radii` | UNSAT | UNSAT | malformed control: the four row points are required to lie on radius 1 and radius 2 about Q |

The exact-rational replay witness is:

```text
Q1=(-4/5,-3/5), Q2=(3/5,-4/5)
C1=(4/5,3/5), C2=(-3/5,4/5)
P1=(6/5,11/10), P2=(-6/5,11/10)
R1=(9/5,19/10), R2=(-9/5,19/10)
oppApex1=(0,-1/2), Q=(0,0)
```

This eliminates a purely named-local Euclidean obstruction.  It does not
provide the missing global producer.  The omitted ingress includes complete
carrier-wide K4/minimality, cyclic cap order, exact source-generated cap
boundaries, blocker-fiber transport, and a finite-to-universal lift.
