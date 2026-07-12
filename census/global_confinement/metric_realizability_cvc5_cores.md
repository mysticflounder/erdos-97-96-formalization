# Minimized cvc5 convex-order cores

## Scope

These are deletion-minimal relative to the recorded cvc5 run and the
configured timeout, not formal minimal-unsatisfiable-subset proofs.
Every retained core is re-run at the validation timeout and submitted
as identical SMT-LIB to Z3. An UNSAT result remains a bounded trusted
computation and is not a Lean theorem.

## Results

| System | Stage | Rows | cvc5 | Z3 | Cross-check |
|---|---|---:|---|---|---|
| `0b12b25bf5daa7566f98` | `convex-only-relaxation` | 3/12 | UNSAT | UNSAT | `CROSSCHECKED_UNSAT` |
| `61441fb2d7ae397e1df6` | `convex-only-relaxation` | 11/12 | UNSAT | ERROR | `CVC5_UNSAT_Z3_ERROR` |
| `66d08a69dde4db909815` | `full-convex` | 5/12 | UNSAT | ERROR | `CVC5_UNSAT_Z3_ERROR` |
| `e5cea0bced9ad6e37aff` | `convex-only-relaxation` | 8/12 | UNSAT | ERROR | `CVC5_UNSAT_Z3_ERROR` |

### `0b12b25bf5daa7566f98`

- Cyclic order: `[0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9]`
- Retained row indices: `[1, 9, 11]`
- Source family: `shell-audit-critical`

| Index | Center | Support | Exact |
|---:|---:|---|---|
| 1 | 1 | `[0, 6, 8, 9]` | true |
| 9 | 9 | `[0, 1, 6, 7]` | false |
| 11 | 11 | `[1, 4, 9, 10]` | false |

### `61441fb2d7ae397e1df6`

- Cyclic order: `[0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9]`
- Retained row indices: `[0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11]`
- Source family: `shell-audit-survival`

| Index | Center | Support | Exact |
|---:|---:|---|---|
| 0 | 0 | `[3, 7, 8, 10]` | true |
| 1 | 1 | `[0, 6, 8, 9]` | true |
| 2 | 2 | `[0, 1, 10, 11]` | true |
| 3 | 3 | `[2, 5, 9, 10]` | true |
| 5 | 5 | `[2, 3, 6, 7]` | false |
| 6 | 6 | `[5, 7, 9, 11]` | false |
| 7 | 7 | `[4, 5, 8, 10]` | false |
| 8 | 8 | `[1, 3, 4, 9]` | true |
| 9 | 9 | `[0, 3, 5, 6]` | false |
| 10 | 10 | `[2, 4, 8, 11]` | false |
| 11 | 11 | `[0, 1, 5, 7]` | false |

### `66d08a69dde4db909815`

- Cyclic order: `[0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9]`
- Retained row indices: `[0, 3, 8, 10, 11]`
- Source family: `shell-audit-critical`

| Index | Center | Support | Exact |
|---:|---:|---|---|
| 0 | 0 | `[2, 4, 5, 6]` | true |
| 3 | 3 | `[1, 2, 8, 10]` | true |
| 8 | 8 | `[0, 1, 3, 5]` | true |
| 10 | 10 | `[0, 1, 4, 7]` | false |
| 11 | 11 | `[1, 6, 9, 10]` | false |

### `e5cea0bced9ad6e37aff`

- Cyclic order: `[0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9]`
- Retained row indices: `[0, 1, 4, 7, 8, 9, 10, 11]`
- Source family: `shell-audit-critical`

| Index | Center | Support | Exact |
|---:|---:|---|---|
| 0 | 0 | `[2, 4, 5, 7]` | true |
| 1 | 1 | `[0, 3, 8, 9]` | true |
| 4 | 4 | `[1, 6, 9, 11]` | true |
| 7 | 7 | `[2, 3, 4, 9]` | false |
| 8 | 8 | `[0, 1, 3, 7]` | true |
| 9 | 9 | `[0, 5, 6, 8]` | false |
| 10 | 10 | `[0, 1, 4, 6]` | false |
| 11 | 11 | `[1, 5, 9, 10]` | false |

## Formula ledger

Encoded: the fixed two-point Euclidean gauge, all retained-row
distance equalities, pairwise distinct ambient labels, and strict
convexity in the saved cyclic order. Full-convex cores additionally
encode each retained exact row's nonmember radius exclusions.

Omitted: all Problem 97 hypotheses absent from the saved assignment,
including diameter, minimal-enclosing-circle, nonobtuse-frame, and
unsaved radius classes. The results therefore exclude only these
bounded row systems.
