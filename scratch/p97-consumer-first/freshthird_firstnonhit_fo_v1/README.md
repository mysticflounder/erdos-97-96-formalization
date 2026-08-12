# FreshThird FirstNonHit cardinality-independent FOL preflight

This directory tests the source-mapped incidence contract for the retained
`sameBlocker × sameBlocker` / common-omission arm of
`TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`.

The abstraction has no carrier-cardinality bound.  `firstnonhit_base.in` is
the Prover9/Mace4 form and `firstnonhit_base.p` is the TPTP/Vampire form.
`firstnonhit_base_axioms.p` is the same TPTP base without the consistency
conjecture, for additive controls.

The base has a finite abstraction model.  Adding either three explicit common
support points at distinct blocker centers or the stronger
three-blocked-deletion producer is contradictory.  Both outcomes validate the
intended Lean landing contract only: the finite model is not a Euclidean P97
model, and the refutations do not discover the missing P97 producer.

See `INGRESS-CONTRACT.md` for the source map and `RESULTS.md` for the exact
classification.
