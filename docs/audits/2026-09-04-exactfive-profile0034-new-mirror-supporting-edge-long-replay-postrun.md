# Exact-five profile 0034 new mirror long-replay postrun

Date: 2026-09-04

Status: authenticated diagnostic complete; target inconclusive.

## Scope

This PIQD replay resubmitted the exact cvc5 query bytes from the two new-mirror
supporting-edge branches with a 300,000 ms requested timeout and a 330,000 ms
effective daemon deadline.  The branch order is the authenticated
`U,p,a,s,d,c2,q,O,y,x,v,t,u` order.  Each target retains 20 real variables,
143 supporting edges, 11 row equalities, one strict radius branch, and one
source-strict comparison: 156 assertions and 177 commands in 16,285 bytes.

The result concerns only these two submitted formulas.  It does not establish
source realization, live source completeness, all-order elimination, a Lean
ingress, a theorem, promotion, or live closure.

## Custody

- Run root:
  `scratch/runs/exactfive-profile0034-new-mirror-supporting-edge-long-replay-piqd-20260904/run-0001`.
- Run-manifest self-hash:
  `b52d36c1fc956072ceb98da1308ccab2846e98469fd6f7b82f753cdd7e4a507a`.
- Launch self-hash:
  `6dd11aaea2aeb825ce04f13e11ba09bba1339d92bbfa3fe3366cfa9f2ac4b80f`.
- Terminal self-hash:
  `a7949330ac61b070ec524d5fe73b16156be311f24f5801865587ee1cc7669fd2`.

The independent audit found 112 files and eight directories with no unsafe
entries.  All 19 input digests and nine source digests match.  Four PIQD cvc5
receipts are unique, closed, and identify cvc5 1.3.3.  Strict offline
verification returned exit code 0 while transport construction was disabled.

The positive control was semantically replayed `SAT`; the negative control was
`UNSAT_DISCOVERY_ONLY`.

## Results

| Target | cvc5 | Effective status |
|---|---:|---|
| `mirror-radius-lt` | UNKNOWN at 330,012 ms | `INCONCLUSIVE_UNKNOWN` |
| `mirror-radius-gt` | UNKNOWN at 330,012 ms | `INCONCLUSIVE_UNKNOWN` |

Both target sessions were interrupted by the effective daemon deadline.  They
contain no model, values, core, replay, response loss, or reconciliation
artifact.  The parent Z3 target answers remain diagnostic UNSAT results with
empty cores; they cannot be promoted.  The terminal status is
`TARGET_INCONCLUSIVE`.

## Completed-wave mine and next action

The fivefold timeout increase produced no new mathematical evidence, so a
further coarse replay is not justified.  This wave yields no concrete reusable
Lean theorem candidate and therefore triggers no new Lean-corpus search.

Earlier guarded named-core work showed that Boolean guards obscure the fast Z3
route.  Earlier physical deletion successfully reduced the distinct
`U,p,s,a,d,c2,O` cell and led to the existing Lean obstruction.  The present
queries instead use `U,p,a,s,d,c2,O`, with target hashes
`db29694cf075b978bb586fde6b5490fa0aa3cf318635cef59cddbf4c18c3862a`
and
`9a5c4cfd3154224d46f3cb81df6c5e4a13f0ecc8783e9bfaadcdeb9040402cbf`.

The next computational lane should therefore run unguarded physical
block/assertion deletion on these exact new-mirror queries through PIQD/Z3,
accepting deletions only after custody-valid UNSAT.  Its goal is a small
source-preserving interaction obstruction for the complementary `a/s` order,
not a solver proof or a source-coverage claim.  In Lean, the final positive
branch is independently reduced to one strict seven-index order classifier by
`exists_profile0034_seven_role_boundary_indices`.
