# FreshThird sharedFourth: six-point Kalmanson diagnostic

This is theorem-discovery evidence only. It is not a Euclidean realization,
not a metric theorem, and not a Lean/proof-spine closure.

## Encoding

The points are ordered 0 < 1 < 2 < 3 < 4 < 5. There is one real variable
`d_i_j` for each i < j; symmetry is represented by canonicalizing every pair.
For each i < j < k < l the assertions are

```
d_i_j + d_k_l < d_i_k + d_j_l       (Kqa)
d_i_l + d_j_k < d_i_k + d_j_l       (Kqb)
```

Thus there are 30 strict QF_LRA Kalmanson assertions. No triangle,
nonnegativity, or Euclidean-realizability assertions are included. The
matching convention is `m[i]` = omitted support slot for center i, where slots
0, 1, 2 mean support points 3, 4, 5 respectively. The two retained support
points are constrained equal in each center row.

## Results

Both `/Users/adam/bin/z3 -smt2` and `/Users/adam/bin/cvc5 --lang=smt2
--produce-models --produce-unsat-cores` agree:

| case | m | Z3 | cvc5 |
|---|---|---|---|
| no-row control | — | SAT | SAT |
| m_012 | (0,1,2) | SAT | SAT |
| m_021 | (0,2,1) | UNSAT | UNSAT |
| m_102 (requested known case) | (1,0,2) | UNSAT | UNSAT |
| m_120 | (1,2,0) | UNSAT | UNSAT |
| m_201 | (2,0,1) | UNSAT | UNSAT |
| m_210 | (2,1,0) | SAT | SAT |

## SAT models

The following are positive rational models obtained by adding a constant to
the cvc5 model (adding a common constant preserves every displayed strict
inequality and row equality). Entries are ordered
`d01,d02,d03,d04,d05,d12,d13,d14,d15,d23,d24,d25,d34,d35,d45`.

```
no-row:  1,4,4,3,2,3,4,4,4,4,5,6,3,5,3
m_012:   1,4,4,2,2,3,4,3,4,4,4,6,2,5,2
m_210:   2,3,3,3,1,2,3,4,3,1,3,3,1,2,1
```

For m_012 the row equalities are d04=d05, d13=d15, d23=d24. For m_210
they are d03=d04, d13=d15, d24=d25.

## UNSAT cores and direct cancellations

The named Z3 cores are:

```
m_021: K6b K11b K13b R0 R1 R2
m_102: K4b K6b K11b R0 R1 R2
m_120: K4b K6b K13b R0 R1 R2
m_201: K4b K11b K13b R0 R1 R2
```

The named cvc5 cores are smaller:

```
m_021: K9b K11b R0 R1 R2
m_102: K6b K7b R0 R1 R2
m_120: K4b K9b R0 R1 R2
m_201: K4b K12b R0 R1 R2
```

For m_021, cvc5 gives K9b and K11b. With rows d04=d05, d13=d14,
d23=d25 they become d24 < d23 and d23 < d24. For m_102, K6b and K7b,
with d03=d05, d14=d15, d23=d24, become d05 < d04 and d04 < d05.
For m_120, K4b and K9b, with d03=d05, d13=d14, d24=d25, become
d04 < d03 and d03 < d04. For m_201, K4b and K12b, with d03=d04,
d14=d15, d23=d25, become d13 < d14 and d14 < d13.

The generated SMT-LIB inputs, raw solver outputs, and machine-readable result
summary are in this directory; rerun with:

```
uv run python scratch/freshthird-sharedfourth-kalmanson-permutations/run_kalmanson_permutations.py
```
