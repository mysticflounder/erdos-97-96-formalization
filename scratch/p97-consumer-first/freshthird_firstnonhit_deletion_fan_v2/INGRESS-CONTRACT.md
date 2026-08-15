# Ingress contract

## Scope and status

This package is a schema-only audit.  It is not a Lean file and introduces no
axiom, theorem, solver assertion, or production edit.  The finite quotient is
source-faithful as a one-way projection of the listed declarations, but it is
not a source-faithful consumer of the live first-non-hit target because the
new fan roles have no Q bridge.

The live target remains the open theorem
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`.  Its source
requires a carrier source whose actual center differs from Q's and whose
selected shell intersects Q's selected shell in at least three points.  The
v2 fan pair supplies neither Q center data nor Q-shell incidence.

## Finite roles

The Q projection reuses v1's four named Q-support labels:

```text
q0 = Q.source₁, q1 = Q.source₂, q2,q3 = the two other named Q-shell points.
```

The retained-fan projection has four role labels
`p1,p2,z,w`, where `p1,p2` stand for `P.source₁,P.source₂` and `z,w` are
the existential pair emitted by the retained theorem.  The labels are role
names, not a claim that any of these points coincide with a Q label.  A
location tag is one of `mixed_left`, `mixed_right`, or `opposite_adjacent`.

## Exact source clauses admitted

The schema admits precisely these source projections:

1. `exists_retainedFirstApex_mutualDeletionPair_threeLocationCases`: both
   anchors lie in the retained selected class; they are distinct; each
   deletion leaves the other anchor's four-point condition; their actual
   centers differ; and one of the three location tags holds.
2. In the `opposite_adjacent` arm,
   `retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent`: the
   retained selected class is exactly `{p1,p2,z,w}`.
3. General source fan consequences already proved:
   `sourceFaithfulDeletionFan_of_triApexAllLargeContext` supplies, for each
   selected-four support point, an indexed strict-cap blocker, deletion
   failure, and the equal-center/non-robust versus distinct-center/overlap-at-
   most-two dichotomy.
   `nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan`
   supplies the non-robust arm or a distinct-center mutual-deletion pair.
4. General FreshThird deletion incidence retained from v1:
   `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` turns a proved
   source-row omission survival into center inequality with Q; and
   `exists_selectedRow_overlap_card_ge_three_of_blocked_deletions` consumes a
   genuinely supplied blocked subset of size at least three.

No clause above supplies a relation from `z,w,p1,p2` to `q0,q1,q2,q3`, to Q's
selected support, or to Q's actual blocker center.

## Missing edge and stop rule

The missing source fact would have to be a theorem whose antecedent includes
the retained-fan pair (or its location arm) and whose conclusion mentions Q,
for example an equality/inequality involving
`H.centerAt z.1 z.2` and `H.centerAt Q.source₁.1 Q.source₁.2`, or a support
intersection involving the two selected shells.  No such theorem is present
in the admitted declarations.  Adding one as an SMT implication would be a
conjectural relaxation and is forbidden in this audit.

The finite schema is therefore not executed.  In particular, “all anchors
avoid Q overlap-three” is neither SAT nor UNSAT here; it is an unconnected
query.  No universal closure claim follows.
