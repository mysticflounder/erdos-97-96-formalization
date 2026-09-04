# Profile 0034 source-gauge split postrun audit

Date: 2026-09-04

Status: process complete; authenticated diagnostic target inconclusive.

## Scope

Run `run-0001` tested four authenticated cells: the two fixed orders for
profile 34, each split into the strict radius branches `<` and `>`. Each target
contains 22 real coordinate variables, no emitted gauge assertions, 286 strict
signed-area assertions, 13 source row equalities, one strict radius assertion,
and one source-strict assertion. The gauge was substituted as
`c1 = c000 = (0,0)` and `O = c001 = (1,0)`.

The result concerns only these four formulas. It establishes no source
realization, live-source coverage, all-order elimination, Lean ingress,
theorem, promotion, or live closure; every corresponding claim remains
`false`.

## Custody

- Run root:
  `scratch/runs/exactfive-hard-source-swap-profile0034-source-gauge-split-qfnra-piqd-20260904/run-0001`.
- Run-manifest self-hash:
  `e5b8ea0abe6e71693c97ec41cda5b8d98ac29dc2114f651b62b0873028538979`.
- Launch self-hash:
  `159c01803795b99f92540411606ab30b8032b28b3a4ec842fc03671a3927ae4b`.
- Terminal self-hash:
  `df6c3261b926038372b0002ac1270ee5f58a1f1d2e93769f1ae88e95b3770e70`.
- Solver custody: Z3 4.17.0,
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
  cvc5 1.3.3,
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`.

The immutable producer replay authenticated all six artifact trees, all 11
input digests, all six current source digests, and the launch and terminal
records without solver transport. The run used 12 distinct fresh PIQD sessions,
one per query and engine. Every session began with zero receipts, performed one
solve, and closed. All response-loss flags were `false`; reconciliation counts
were zero. No target model, core, partial stream, or proof was produced.

The launch requested `timeout_ms = 60000`. The PIQD adapter explicitly adds a
30,000 ms solver-deadline grace, so every receipt records an effective deadline
of 90,000 ms. The observed target solve times therefore range from 60,879 ms to
90,011 ms. These are the authenticated timings; the run is not described as a
strict 60-second wall-clock experiment.

## Results

| Query | Z3 | cvc5 | Result self-hash |
|---|---:|---:|---|
| positive control | SAT, 1 ms | SAT, 0 ms | `641b7e353ea96eb5a7430d6461af9d21f02437d49f84153afb31dd021a3e1821` |
| negative control | UNSAT, 0 ms | UNSAT, 0 ms | `741c87cff78367002ef037f91efc01d2e7da803b2de6ce8fecae410aefc9b343` |
| Z3-mirror order, radius `<` | UNKNOWN, 60,879 ms | UNKNOWN, 90,011 ms | `3165fb4448a34ab5b400404652953a459b8e6457f2a7cd5acd8472ecc349d3f2` |
| Z3-mirror order, radius `>` | UNKNOWN, 61,757 ms | UNKNOWN, 90,003 ms | `19a8de14dec75352dfe629e339917fa3a390ea1cbbcdb36cafd7f8ddc47972b5` |
| cvc5-direct order, radius `<` | UNKNOWN, 61,300 ms | UNKNOWN, 90,011 ms | `ceeb4b6b61a21da03e21860cb3c800f2d1343e90e505420c555171cc0ac66992` |
| cvc5-direct order, radius `>` | UNKNOWN, 61,264 ms | UNKNOWN, 90,006 ms | `709e0ee2eee441084f61945a54e0b05923ecb948d0ebf2271d157ffce514414a` |

The positive-control models passed exact rational semantic replay at `t = 1`.
The negative controls returned the expected discovery-only contradiction. All
four targets returned `UNKNOWN` on both engines, so the wave is inconclusive and
licenses no refinement or proof claim. Its new data contained no concrete
general-theorem candidate; under the project search rule, no Lean-corpus search
was triggered.

## Recommended exact reduction

The next cell should use a vertically rescaled equilateral frame.  Write each
original vertical coordinate as `y = sqrt(3) * Y`.  Every squared distance then
becomes `dx^2 + 3 * dY^2`, while every signed area gains the same positive
factor `sqrt(3)`, so all strict orientation signs are preserved.

With `c1 = (0,0)` and `O = (1,0)`, the two anchor-row equations for `a` force
`x_a = 1/2` and `Y_a^2 = 1/4`.  The fixed-order area assertion on the anchor
triple fixes `Y_a = -1/2` for the Z3-mirror order and `Y_a = 1/2` for the
cvc5-direct order.  Substituting both coordinates of `a` makes those two row
equations tautological.  The successor therefore has 20 real variables, 11
emitted row equalities, and 299 total assertions while retaining all 286
ordered-triple assertions and both strict metric predicates.

This normalization removes the algebraic value forced by the original frame,
so the exact-rational replay path can accept a rational target model.  Any
remaining algebraic solver value must still fail closed as inconclusive.  The
normalization is a source-preserving change of coordinates, not a solver
verdict.
