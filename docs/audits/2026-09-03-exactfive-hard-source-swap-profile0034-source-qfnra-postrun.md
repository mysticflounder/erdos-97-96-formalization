# Profile 0034 source QF_NRA postrun audit

Date: 2026-09-03

Status: authenticated diagnostic complete; target inconclusive.

## Scope

This run tested the two authenticated fixed orders of hard-source profile 34.
The profile has `c2` outside `T0`, so it probes the complementary source cell
left open by the opposed-turn membership theorem.  Each target retained all
286 fixed-order signed-area constraints, all 13 source row equalities, the
old/replacement radius disequality, and the source-strict comparison
`dist²(e,d) < dist²(e,a)`.

The result concerns only the submitted formulas.  It does not establish a
source realization, complete source coverage, a Lean theorem, promotion, or
closure of the live exact-five obligation.

## Custody

- Run root:
  `scratch/runs/exactfive-hard-source-swap-profile0034-source-qfnra-piqd-20260903/run-0001`.
- Run-manifest self-hash:
  `0d816be5a6fa83e0a2944352d5acd7d311d98853ecb5a44c719aa6bcb2590395`.
- Launch self-hash:
  `d8c7a9f547cea72953c5c24aa077286a0ae25354a9d88e792565ba51c726d3ae`.
- Terminal self-hash:
  `456135f6c90c9ea7e29e989db1c350fbc9f4b542e5a6db0ce557099076185922`.
- Solver custody: Z3 4.17.0,
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
  cvc5 1.3.3,
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`.

All eight PIQD sessions were fresh, started with zero receipts, performed one
solve, and closed.  No session identifier was reused from the parent run.  The
postrun verifier reconstructed the checkpoint, manifest, parent custody, all
four adapter trees, and terminal record without solver transport.  Every
response-loss flag was false and no reconciliation was needed.

## Results

| Query | Z3 | cvc5 | Result self-hash |
|---|---:|---:|---|
| positive control | SAT, 1 ms | SAT, 0 ms | `d95f7805489e6f04a08557fc1e721b17abb35a6ef5886d3530c295209c6e15b3` |
| negative control | UNSAT, 0 ms | UNSAT, 0 ms | `58792efd529fac89b0c49eb37f9406e3dfdab1873e6d37a76cf5d02f18b0f04d` |
| parent Z3 mirror order | UNKNOWN, 60,842 ms | UNKNOWN, 90,009 ms | `1ccbeb27148396a0b8d9ff33ad5652d6c2b9a4ff4461ccc0388a1b22b56afee5` |
| parent cvc5 direct order | UNKNOWN, 60,933 ms | UNKNOWN, 90,011 ms | `644d1dde3ed8f137caac61d7bab3a680132fe666d0e3bb83c27fcf3aa8d576fe` |

The positive models passed exact rational replay.  The negative controls
returned the expected discovery-only contradiction.  Neither target produced
a model, core, or partial algebraic stream, so this completed wave supplied no
concrete general-theorem candidate and did not trigger another Lean-corpus
search.

## Next refinement

Do not rerun or lengthen these coarse 26-variable cells.  Split the sole radius
disequality into strict `<` and `>` branches.  In each new cell, substitute the
source-distinct gauge `c1=(0,0)` and `O=(1,0)` before emission, leaving 22 real
coordinate variables and no gauge equations.  Preserve all row equalities,
signed-area constraints, and the source-strict comparison.  This produces four
smaller PIQD targets and keeps any later model or contradiction attached to an
explicit source branch.
