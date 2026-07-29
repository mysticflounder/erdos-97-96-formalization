# v13 top-six UNKNOWN resolution

- Terminal status: `ALL_EIGHT_RESOLVED_6_SAT_2_UNSAT`
- Exact verdicts: 6 SAT, 2 UNSAT, 0 UNKNOWN.
- SAT evidence: rational coordinates, exact Fraction replay of every constraint, and coordinate-pinned Z3/cvc5 replay. UNSAT evidence: a shrunk six-orientation/two-equality schema replayed by both engines plus exact polynomial-identity checking in Singular.
- Source result SHA-256: `acb4dabf276dbb9fdc8ae62251fb45974ed82d19a1e9c6c7bf6bd4e8e0707027`.

| rank | subset | equalities | schema | exact check | Z3 | cvc5 | status |
|---:|---|---|---:|---|---|---|---|
| 1 | `(0, 1, 5, 6, 7, 18)` | `[0, 1, 5, 9, 28, 30, 32]` | A | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 4 | `(0, 1, 5, 13, 14, 16)` | `[0, 2, 3, 4, 10, 18]` | B | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 6 | `(0, 1, 7, 13, 14, 16)` | `[1, 2, 3, 4, 11, 18]` | B | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 8 | `(0, 1, 2, 10, 16, 18)` | `[4, 5, 6, 8, 13, 19]` | C | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 9 | `(0, 1, 2, 11, 16, 18)` | `[4, 5, 7, 8, 14, 19]` | C | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 10 | `(0, 1, 10, 11, 16, 18)` | `[4, 5, 12, 13, 14, 19]` | C | `PASS` | `SAT` | `SAT` | `SAT_EXACT_RATIONAL_WITNESS` |
| 14 | `(0, 2, 3, 10, 12, 18)` | `[6, 8, 13, 20, 21, 23]` | D | `PASS` | `UNSAT` | `UNSAT` | `UNSAT_EXACT_NORMALIZED_SCHEMA` |
| 15 | `(0, 2, 3, 10, 15, 18)` | `[6, 8, 13, 20, 22, 24]` | D | `PASS` | `UNSAT` | `UNSAT` | `UNSAT_EXACT_NORMALIZED_SCHEMA` |

Schemas B and C cover ranks 4/6 and 8/9/10 respectively; their identical local equality shapes are stable under the listed global-class relabelings. Schema A is rank 1. Schema D is the common exact obstruction for ranks 14/15.

## Rank 14/15 normalized contradiction

The shrunk schema keeps only:

- `d2(p0,p1)=d2(p0,p3)=d2(p0,p5)`;
- `d2(p2,p1)=d2(p2,p3)=d2(p2,p4)`; and
- orientations `013`, `015`, `035`, `123`, `134`, `345` (the digits are local vertex indices).

Gauge `p0=(0,0)`, `p1=(1,0)`. Half-angle parameters put `p3` at parameter `t>0` and `p5` at `v>t`. The second center is `(h,h*t)` with `h(1+t^2)>1`; write `p4=(x,y)`, `L=1-x-t*y>0`, and `A=t(x+1)-y`.

Orientation `345` is `v*A+L<0`, hence `A<0`. The second-circle equality and `h(1+t^2)>1` give `F=(1-x^2-y^2)(1+t^2)-2L>0`. But exact expansion gives `F=-A^2+2tA-L^2<0`, contradiction.

Fresh Z3 and cvc5 both replay the normalized schema as `UNSAT`/`UNSAT`; Singular checks both normalization identities: `PASS`.

## Trust boundary

directly checkable exact witnesses for the recorded induced-positive QF_NRA formulas; not Lean/kernel closure and not the full survivor formula.

Pinned false-row disequalities and nonlocal CEGAR facts remain omitted, exactly as in the source six-priority lane.

## Replay

For each `rank-*-rational-witness.smt2`, both commands must print `sat`:

```bash
z3 -smt2 rank-1-rational-witness.smt2
cvc5 --lang smt2 --nl-cov rank-1-rational-witness.smt2
```
