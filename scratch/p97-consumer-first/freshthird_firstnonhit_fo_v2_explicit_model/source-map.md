# Source map and trust boundary

## Input and target

- Schema: `../freshthird_firstnonhit_fo_v2/firstnonhit_v2.in`.
- Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`.
- Exact-15 ingress: `ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six`,
  used by `TwoSourceFreshThirdResidual.lean` at the two `card_ge_fifteen`
  applications documented in the v2 README.
- Retained-pair blocker equalities: `RetainedInteriorBlockerCollision.blockers_eq`
  for `P` and `Pρ`, represented as `cen(pa)=cen(pb)` and `cen(ra)=cen(rb)`.
- Target blocker separation: `hblockersNe`, represented as
  `cen(ra) != cen(pa)`.

## What is encoded

The SMT query expands the complete v2 clause families over the finite carrier
`0,...,14`: exact-four rows, center/support equality, distinct-center
two-overlap, blocker incidence and own blocking, center-fiber bound, named
carrier/distinctness clauses, Q/C same-blocker facts, endpoint omissions and
survival equivalences, retained blocker equalities, blocker separation, and
the fifteen distinct carrier witnesses.

The Python validator independently checks those same clause families against
the explicit tables. It does not import or call the SMT generator.

## Deliberate omissions

This projection does not encode Euclidean coordinates, strict cap geometry,
exact selected-class/intersection cardinalities, K4 rows beyond the selected
exact-four schema, cyclic order, `LP`/`MP` data, deletion packets, or the full
minimality/large-cap/no-cover context. Therefore a SAT result cannot be
promoted to a P97 model or used to close a universal Lean theorem.

## Fail-closed interpretation

The only accepted positive result is `sat` from both Z3 and cvc5 together with
the independent validator pass. Any timeout, parser error, missing solver,
validator failure, or disagreement is `INCONCLUSIVE`, not SAT/UNSAT. The
malformed control must be UNSAT in both solvers before the pinned result is
accepted.
