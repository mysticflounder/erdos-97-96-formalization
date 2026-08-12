# Ingress contract

## Semantics

- `car(u)`: `u` is a carrier point of `D.A`.
- `cen(u)`: `H.centerAt u`, the actual blocker center chosen for source `u`.
- `mem(u,v)`: `v` lies in the support of `H.selectedAt u`.
- `blocked(v,c)`: `¬ HasNEquidistantPointsAt 4 (D.A.erase v) c`.

Here `blocked` is an externally interpreted, otherwise uninterpreted FOL
predicate.  These files do not encode the definition of
`HasNEquidistantPointsAt`; the source map licenses only the implications listed
below.

The generic clauses encode exact-four selected supports, support equality at
equal actual blockers, the two-circle intersection bound at distinct centers,
blocked deletion implying support membership, own-deletion blocking, and the
actual-blocker-fiber bound.  The corresponding production APIs include:

- `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`;
- `ATailSurvivalCover.actualBlockerFiber_card_le_four`;
- `ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree`;
- `SelectedFourClass.inter_card_le_two` and
  `false_of_centerAt_selectedFourClass_inter_card_ge_three`.

## Named branch

The named constants represent the two retained endpoint pairs `pa,pb` and
`ra,rb`, the FreshThird pair `qa,qb`, the two canonical sources `ca,cb`, and
`oa = S.oppApex1`.  The encoded branch is explicitly:

1. both canonical sources and both FreshThird endpoints have the same actual
   blocker center;
2. each canonical source omits an endpoint of each retained pair;
3. the `CommonCollisionEndpointOmission` arm has been selected, witnessed by
   `co`, which is one of the four retained endpoints and is omitted by both
   source rows;
4. for the four retained endpoints only, selected-support omission is
   equivalent to survival of deletion at the source center;
5. deletion of the normalized endpoints `pa` and `ra` survives at `oa`.

The common-omission witness is a branch guard, not a consequence of the four
pairwise omission clauses.  No C/Q cross-alias exclusion is assumed.

## Intended producer

The stronger control supplies a carrier source `ta`, three pairwise-distinct
members `da,db,dc` of the Q support, `cen(ta) ≠ cen(qa)`, and deletion blocking
of all three points at `cen(ta)`.  The generic blocked-deletion lemma puts all
three points into the selected support of `ta`, and the distinct-center
two-circle bound yields the contradiction.

This is a cardinality-independent logical ingress.  It is not a proof that the
live P97 hypotheses produce `ta,da,db,dc`.
