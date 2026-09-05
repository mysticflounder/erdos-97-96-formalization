# Exact-five profile 0034 alternate-order source QF_NRA postrun audit

Date: 2026-09-04

Status: authenticated diagnostic complete; target inconclusive.

## Scope

This run tested two fixed-order source formulas for hard-source profile 0034.
Each target declares 26 coordinate variables, four gauge assertions, 286
strict signed-area turns, 13 source row equalities, one source radius
disequality, and one source-strict comparison. The target orders below are the
authenticated orders returned by the producer's `--check-parent` records.

The result concerns only the submitted formulas. It does not establish source
realization, live source completeness, all-order elimination, a Lean ingress,
a theorem, promotion, or live closure.

## Custody

- Run root:
  `scratch/runs/exactfive-profile0034-alternate-order-source-qfnra-piqd-20260904/run-0001`.
- Run-manifest self-hash:
  `46dfcd151204d57e759f6910524bc5a77f1e328aec10c57003f21d062c2600bd`.
- Launch self-hash:
  `b37a54792c85a18b8793b5aa4c1d16fab69a32b2b9d9aa34983583bedaba0077`.
- Terminal self-hash:
  `032098cefa906494ae5d0a392d56f4427237e6d8b5cdb1e8673682b7d35ead3b`.

The independently audited custody contains 125 files, 52 snapshots, eight
PIQD receipt envelopes, and two SAT semantic artifacts. Both controls passed:
the positive control was `SAT/SAT`, and the negative control was
`UNSAT/UNSAT`.

An independent `cmp` check verifies that the current cvc5/direct SMT2 is
byte-identical to
`scratch/runs/exactfive-hard-source-swap-profile0034-source-qfnra-piqd-20260903/run-0001/artifacts/parent-cvc5-direct/original.smt2`,
with current SHA-256
`9f0095ae2afdcc310482a196452b0c3b64f873468d56c3a5236aefd19aab755a`. The
current z3/mirror SMT2 has SHA-256
`374ce19ac2ffeee32526d00650c0771fa3416ea1132ed8a868fafe1cdb4e36be`; it
differs from prior z3 SHA-256
`0173ce4756f032ca5c06dd5c5cf45d8b14d6db2afe4475cc7b780735cb39e4ea` only by
the adjacent `s`/`a` order. Do not rerun the unchanged cvc5/direct target.

## Results

| Target | Order | Z3 | cvc5 |
|---|---|---:|---:|
| z3/mirror | `U=c1<p<a<s<d<c2<q=e<O<y<x<v<t<u` | UNKNOWN, ≈60,959 ms | UNKNOWN, 90,002 ms |
| cvc5/direct | `U=c1<s<y<p<t<u<x<v<O<q=e<c2<d<a` | UNKNOWN, ≈60,959 ms | UNKNOWN, 90,008 ms |

Both targets are therefore `UNKNOWN/UNKNOWN`, and the terminal disposition is
`TARGET_INCONCLUSIVE`. Neither target produced a model, core, or partial
algebraic stream. The completed-wave mine found no concrete general-theorem
candidate, so no additional Lean-corpus search was triggered.

## Boundary and next step

The cvc5/direct target is unchanged from the named 2026-09-03 artifact and
should not be rerun. The z3/mirror target contributes only the authenticated
adjacent `s`/`a` order change. Do not lengthen this coarse rerun.

The existing Lean source-backed boundary/order adapter proves a contradiction
from an explicitly supplied chain `U<p<s<a<d<c2<O`; that chain is not one of
the two tested orders. Its missing work is the finite source point-selection
and order transport needed to supply the adapter's antecedents. As a secondary
computational refinement, use the genuinely new `U<p<a<s<d<c2<O` prefix of the
z3/mirror order, split the radius disequality into strict branches, and test
143 supporting-edge relaxation. These are diagnostic computations and do not
assert source closure.
