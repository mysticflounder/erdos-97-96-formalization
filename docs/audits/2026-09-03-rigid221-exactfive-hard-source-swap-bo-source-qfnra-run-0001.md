# Profile-1697 B--O source QF_NRA run 0001

Date: 2026-09-03

Status: completed, formula-scoped contradiction. No live-source, Lean,
promotion, or closure claim.

## Result

The governed PIQD run completed in 2.78 seconds. The rational positive control
returned `SAT/SAT` and passed exact semantic replay. The negative control
returned `UNSAT/UNSAT`. Both Z3 4.17.0 and cvc5 1.3.3 returned `UNSAT` for each
of the two current fresh profile-1697 cells; target solve times were 0--2 ms.
The terminal status is `TARGETS_UNSAT_DISCOVERY_ONLY` with self-hash
`f096b57cee76d66a8cfc6664e56362d1e98579e013fe0386cbca00ee996be179`.

A completed no-transport replay took 1.49 seconds and reproduced the terminal
from the retained query trees. The first replay attempt used the default
300-second timeout instead of the immutable 30-second launch setting and was
correctly rejected before artifact replay; repeating with the launch setting
passed.

## Exact contradiction

The result does not depend on solver search. Under the source-valid `B--O`
gauge, the six selected row equalities and three order signs force

```text
B=(0,0), O=(1,0), A=(1/2,r), S=(1/2,-r), Q=(3/2,r),
4*r^2-3=0, r>0.
```

Consequently the signed area of `(S,O,Q)` is exactly zero. Both authenticated
fresh orders place `S<O<Q`, so the complete 165-triple ledger retains the
strict assertion that this area is positive. Each target therefore contains
the exact assertion `(assert (> 0 0))`. The independent skeptic report
`docs/skeptic-exactfive-hard-source-swap-bo-normalization-2026-09-03.md`
certifies that the coordinates are forced for every real model of either
formula, not merely chosen as a specialization, and that no division by an
unproved nonzero quantity occurs.

## Custody

- Lane base: `c07dbadc08332e1e52a4857e5365611029a9f814`.
- Run-manifest self-hash:
  `c590ae65656888c36a5912f60dff60ece655bd2e9d57d73130d21e1fd2b52e1e`.
- Launch self-hash:
  `f5c38817980b0f6baacd8cd372cab3de4c9259924072ae34916fbfaf1f661eb1`.
- Terminal self-hash:
  `f096b57cee76d66a8cfc6664e56362d1e98579e013fe0386cbca00ee996be179`.
- Target SMT-2 hashes: fresh-Z3 order
  `ae8ea79c836bd3e04abc11b1867c87391ac5892ffca770fd048e0e72e4d8d38e`;
  fresh-cvc5 order
  `905189f0b7f5b3e8ec1a434193843a0a4c84beb8138b779b11513975d4cea8e8`.
- Each target declares 13 variables and retains 2 normalization assertions,
  165 strict area assertions, 13 row equalities, one radius disequality, and
  one source strict inequality.
- Solver transport was PIQD only. No local solver fallback exists.

The canonical machine-readable summary is
`docs/computation/exactfive-hard-source-swap-bo-source-qfnra-20260903/run-0001-summary.json`.

## Completed-wave theorem mine

The new mathematical candidate is a small three-fan lemma: the displayed
equal-distance relations and the signs of `(B,S,O)`, `(B,O,A)`, and `(B,O,Q)`
force `(S,O,Q)` to have zero signed area. A bounded indexed Lean search found
`Problem97.Census554.false_of_sixPointHingeTailCore`, but direct field matching
shows that theorem has the wrong metric shape. No existing collision core
matches this candidate.

The immediate intended consumer is the exact-grid subcase below
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`. The first
missing live antecedents are the source memberships represented in this
conditional profile by `p=s` and `c2=q`; `HardSourceSwapExactGridRoles` does not
currently expose them. Thus this wave closes both authenticated formulas but
does not close the broader admitted endpoint. No further Lean search is due
until those source facts are supplied or the candidate statement changes.
