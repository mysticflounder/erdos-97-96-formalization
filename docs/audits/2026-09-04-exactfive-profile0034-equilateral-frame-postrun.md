# Profile 0034 equilateral-frame postrun audit

Date: 2026-09-04

Status: process complete; authenticated diagnostic targets inconclusive.

## Scope

Run `run-0002` tested four authenticated profile-34 cells: two fixed orders,
each split into the strict radius branches `<` and `>`.  The equilateral-frame
substitution fixes `c1 = c000 = (0,0)`, `O = c001 = (1,0)`, and
`a = c003 = (1/2, -1/2)` in the Z3-mirror order or `(1/2, 1/2)` in the
cvc5-direct order.  Each target has exactly 20 real coordinate declarations,
286 strict signed-area assertions, 11 source row equalities, one strict radius
assertion, and one source-strict assertion: 299 assertions in total.

The result concerns only these four formulas.  It establishes no source
realization, live-source coverage, all-order elimination, Lean ingress,
theorem, promotion, or live closure; every corresponding claim is `false`.

## Failure receipt and repaired lineage

Run-0001 stopped in `verify_adapter_tree` after submitting only the positive
control because the old producer tried to read the absent attribute
`predecessor.frozen_order`.  Its compact failure receipt records no target
submission and keeps every mathematical claim false.  The receipt has file
SHA-256 `f60bc9b1b9559fd03d5a6a5d0150f3611218c251d581b01fad3922a4add2d39a`,
self-hash `f9c7ed4721da80975fdfe74b06ed34f5cdb710aa102c6feeaf10d177edf87ac0`,
and full canonical payload hash
`8f3e1de9225af02504e4e6ee8659962656cdd8f4a21c128e199d24e9a9498462`.

Run-0002 binds that receipt, the predecessor custody hash
`58463af24055e431f7b8ca737321d8d08d7c28ade9e2313f3dbb2969edc5b850`,
and the repaired producer SHA-256
`48ea11c20276ee883f8b244ed3a423a858e787768f6e80621edf7c0b80962237`.
The repaired producer checks SAT, UNSAT, UNKNOWN, and receipt-reconciled
artifact-label families with its local validator, so it no longer reads the
unbound helper attribute.  The quarantined run is retained as failure evidence;
run-0002 is a fresh run and does not resume it.

## Custody

- Run root:
  `scratch/runs/exactfive-hard-source-swap-profile0034-equilateral-frame-qfnra-piqd-20260904/run-0002`.
- Run-manifest self-hash:
  `857fd5899aec834fd1620e9e69a809b594af315790195dcf44e38b65d510cbbc`.
- Launch self-hash:
  `8133d34a18f31ea2753ffd40f9d7967b2df9961fce9ad3d7e009dc553b7cd922`.
- Terminal self-hash:
  `8d7ca9f5f802f1c988baa7612189ac305598dc4c3495d5d9796949064eaeac5a`.
- Solver custody: Z3 4.17.0,
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
  cvc5 1.3.3,
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`.

The immutable producer replay authenticated six artifact trees, 15 input
digests, seven current source digests, and the launch and terminal records
without solver transport.  The run used 12 distinct fresh PIQD sessions, one
per query and engine; their identifiers are disjoint from both run-0001
sessions.  Every session began with zero receipts, performed one solve, and
closed.  All response-loss flags are false, reconciliation-attempt counts are
zero, and no result was reconciled from a receipt.  No target model, core,
partial stream, or proof was produced.

The launch requested `timeout_ms = 60000`.  The PIQD adapter adds a 30,000 ms
solver-deadline grace, so receipts use a 90,000 ms effective deadline.

## Results

| Query | Z3 | cvc5 | Result SHA-256 |
|---|---:|---:|---|
| positive control | SAT and replayed, 1 ms | SAT and replayed, 0 ms | `be81c188439fe5d8d2c713feb10466c11e47fd7e91ed03c9035d97acd60b143d` |
| negative control | UNSAT, discovery only, 0 ms | UNSAT, discovery only, 0 ms | `bec3c15888396a7415c2cd6f20dc67cdac05b48d4b61ab479fe106620c406c9c` |
| Z3-mirror order, radius `<` | UNKNOWN, 61,137 ms | UNKNOWN, 90,012 ms | `2ca2dad9b22dc2f0a242e291e69f3d68d3eb57d769d2be4660d437099bda3f86` |
| Z3-mirror order, radius `>` | UNKNOWN, 60,931 ms | UNKNOWN, 90,003 ms | `8ec62b8a6c80b5c248db2dce7ed3ea363ddc00a5c97aa7375d4cb73ebfbba5f5` |
| cvc5-direct order, radius `<` | UNKNOWN, 61,037 ms | UNKNOWN, 90,007 ms | `c33354a678d2633767d10a6e3cca8ecd934996e1b473f80383cf00ab5d7b7990` |
| cvc5-direct order, radius `>` | UNKNOWN, 61,501 ms | UNKNOWN, 90,009 ms | `5b76d488e31e1463ecf8f17413ad576109848d1c00ad0e8f7d960285b496ac9d` |

The controls behaved as specified.  Both engines returned UNKNOWN for all
four targets.  The wave is inconclusive and licenses no theorem, promotion, or
closure claim; it only motivates the diagnostic refinement below.  Mining only
this wave's new data produced no concrete general-theorem
candidate, so no Lean-corpus search was triggered from the wave data.

## Supporting-edge reuse preflight and next cell

A separate bounded reuse preflight for the proposed supporting-edge lemma ran
against the indexed Lean corpus at revision `a064cc226`.  It found no theorem
that derives the full ordered-triple sign property from strict supporting-edge
constraints.  The closest declaration,
`ConvexCyclicOrder.Basic.ccw_of_hneg`, consumes the full sign property for all
increasing triples, so using it to derive that property from edge constraints
would be circular.  The immediate consumer remains a supporting-edge CEGAR
relaxation.

For each fixed order and radius branch, replace the 286 all-triple assertions
with 143 strict supporting-edge assertions: 13 cyclic edges, each tested
against the other 11 vertices.  Retain the 11 source row equalities and the two
strict metric assertions.  The relaxed target then has 156 assertions.

Every model of the original 299-assertion target satisfies the supporting-edge
relaxation.  Therefore UNSAT for the 156-assertion relaxation is sound for
ruling out the original fixed-order cell.  A SAT answer may be spurious and
must be checked against all 286 ordered triples by the exact verifier before it
is accepted as a model of the original cell.  No converse theorem is needed
for this trust argument; the one direction from the original target to the
relaxation is sufficient.
