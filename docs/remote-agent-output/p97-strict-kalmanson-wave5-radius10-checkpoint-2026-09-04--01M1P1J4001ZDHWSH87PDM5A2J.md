# P97 strict-Kalmanson / planar CEGAR — Wave 5 recovery checkpoint

**Date:** 2026-09-04  
**Scope:** exact `n=12` all-center selected-four row search, fixed reflected row-0 cell 78 (`row(0)={1,2,6,9}`).  
**Status:** active. The CEGAR2 bank has been proved UNSAT through Hamming radius 10 around the current near model. The final all-11-rows-changed sector is being split into 81 exact center-11 cases. No full cell-78 or `n=12` closure is yet claimed.

## 1. Current exact bank

The active monotone bank is:

```text
results/n12-bank/n12-cegar2-minimal.cnf.txt
clauses: 477,282
SHA-256: 299e6a61e9765c3ced11b222001bc5a0c7e30f4ed76c9f20e06feacc587ca3a3
```

It contains the initial strict-Kalmanson/local bank, the planar three-equilateral-zigzag orbit, exhaustive small two-Kalmanson cancellation motifs through the recorded catalog bounds, and two additional exact quotient cores mined from the prior survivor.

The near assignment in `n12-cegar2-local-cpp-20260904.json` violates exactly one bank clause: rows 8 and 9 both contain the pair `{10,11}`.

## 2. New general theorem mined

The first `n=12` quotient survivor exposed the cardinality-generic motif

```text
a < b < c < d < e
row(a) contains {b,d}
row(c) contains {d,e}
row(d) contains {b,e}
```

Two companion strict Kalmanson inequalities cancel using the three selected-row equalities. Luna formalization completed as:

```text
Problem97.FiveRoleThreeRowTwoKalmansonCycle
  .false_of_three_selected_rows_five_role_twoKalmanson_cycle
```

in `P97/ATail/FiveRoleThreeRowTwoKalmansonCycle.lean`. The reported focused Lean check passes and its axiom closure is only `propext`, `Classical.choice`, and `Quot.sound`; commit publication was temporarily blocked by unrelated foreign staging at the time of this checkpoint.

## 3. Exact neighborhood decomposition

The exact row-domain solver fixes row 0 and applies the canonical-minimum row-signature symmetry condition. A free-center mask allows those rows to vary; all other nonzero rows remain at the near assignment.

### Radius 9

All 54 admissible free-center masks are exact UNSAT:

```text
status: EXACT_UNSAT_ALL_MASKS
mask count: 54
total search nodes: 38861
total conflicts: 32936
maximum single-mask elapsed time: 20.3 s
payload: b75d0121e684d134e79fa64ecfc2aff2ba03e5a621c99eba607e298abfa6b938
```

Campaign record SHA-256:

```text
a8219b6be294879e3fc864a85c1519f406e2d4f2dc056c131dbb1094fc54ed29
```

### Radius 10

All 11 free-center masks—equivalently, every choice of one unchanged nonzero row—are exact UNSAT:

```text
status: EXACT_UNSAT_ALL_MASKS
mask count: 11
total search nodes: 120047
total conflicts: 102571
maximum single-mask elapsed time: 501.16 s
payload: 2f71b9a54493d056a4f68593c933a143b034ad95c3b029997fbb1f458d7e9c25
```

Campaign record SHA-256:

```text
6f506ee96fea52f5b6168ab90e03f9215a7d5553e524a26d2212ebcc9b514391
```

Therefore any CEGAR2-bank survivor in cell 78 must change **all eleven** nonzero rows of the near assignment.

## 4. Final-sector decomposition

Exact root generalized arc consistency, with every nonzero row required to change, reduces center 11 to 81 possible supports. These are recorded in:

```text
results/n12-bank/n12-cegar2-allchanged-center11-split.json
SHA-256: 30289efa6f1495998a68833757974a61c607381a72564c75e7239edb4d0bb52b
payload: 4242a31f3534fe1a48b2525e7f1155661c89a6f173d68038c3f1e122fb9b1cc0
```

Each of those 81 fixed-center-11 branches is now being solved independently with the other ten centers free and required to differ from the near assignment. Only after every branch is exact UNSAT may cell 78 be declared closed.

## 5. Solver defect found and quarantined

A differential fuzz test exposed a genuine defect in the first queue-based changed-row implementation: if changed-row filtering made an initial domain empty, the DFS completion test could treat the zero-size domain as solved. Every queue-derived `n=12` result produced before the fix was stopped and moved under:

```text
quarantine/queue-solver-pre-empty-domain-fix-20260904T110031Z/
```

The radius-9 and radius-10 campaigns are unaffected because they used `src/repair_radius` without changed-row filtering.

The changed-row and queue solvers were fixed to reject empty domains both at initialization and after propagation. A brute-force differential suite over 200 random finite row-CSP instances now passes for the changed-row scan solver and the corrected queue solver used by the restarted campaign:

```text
status: PASS
tests: 200
SAT instances: 4
UNSAT instances: 196
payload: 7494cb58f5949bbeeeb838c662311d8e2f0bcdeaf4c993e7098d1074bc2d325d
record SHA-256: c91c357d2f8e4db2b210647b75ee341e37c37118b0475595c97c21f3c89c6884
```

The final center-11 campaign was restarted from an empty result directory after this fix. Pre-fix queue outputs are not reused.

## 6. Claim boundary

Established:

- exact `n=12` bank construction and semantic replay of all displayed incidence witnesses;
- exact quotient-Kalmanson refutation of each displayed bank survivor;
- the new five-role/two-Kalmanson terminal;
- exact UNSAT through radius 10 around the current near model;
- exact reduction of the all-changed sector to 81 center-11 cases;
- detected, quarantined, fixed, and differentially tested queue-solver defect.

Not established:

- completion of all 81 final branches;
- UNSAT of row-0 cell 78;
- exhaustive UNSAT or SAT for all 170 reflected `n=12` row-0 cells;
- planar or P97 closure at cardinality 12.
