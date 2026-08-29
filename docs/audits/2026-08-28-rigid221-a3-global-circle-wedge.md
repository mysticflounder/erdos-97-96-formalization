# Rigid221 A3/A4 global circle-wedge audit

Date: 29 August 2026

## Scope

This audit covers the cardinality-free global circle-wedge formalization for
the Rigid221 `BlockerV` branch.  The A3 landing closes the deleted-row,
off-physical-class continuation.  The A4 landing eliminates the unsplit
pentagon residual before the blocker-of-`v` dichotomy is introduced.

The audit does not certify the full Rigid221 cluster or the Problem 97
publication target.

## A3 theorem boundary

The source theorem

```text
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_
  pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_wedge
```

derives `False` from exactly:

1. `Q : ExactFourRigid221PentagonBlockerVResidual P packet`;
2. `centerAt v = deleted`;
3. the blocker of `deleted` lies in the strict second cap; and
4. that blocker lies outside the physical five-class.

It does not use a carrier-cardinality bound, the next-row physical-hit bound,
an endpoint-deletion packet, a finite exact-cover certificate, or any of the
three former A3 residual hypotheses.

## A4 theorem boundary

The stronger source theorem

```text
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_
  pentagonBlockerV_vRowCircleWedge
```

derives `False` from the unsplit
`Q : ExactFourRigid221PentagonBlockerVResidual P packet` alone.  In particular,
it does not use the former A4 off-physical-class hypothesis, the alternate
joint-deletion equality, or the blocker-center dichotomy.

## A3 formal proof structure

`A3GlobalCircleWedge.lean` isolates two independent components.

First, `scalar_two_clearance_margins`,
`vector_two_clearances_of_nested_fan`, and
`two_clearances_of_nested_fan` prove that the selected circle centered at the
deleted-row blocker has strict clearance from both boundary rays of the
relevant wedge.  The proof is trig-free.  It uses the squared physical radius
`r`, the middle-pair inner product `p`, and the final bisector parameter `T`.
The two differences factor as positive sums whose final common factor is

```text
(2*T - 1) * (r - 2*T*p).
```

The source order and equal-chord fan supply `T > 1/2` and `2*T*p < r`.

Second, `outside_interval_opposite_wedge_side`,
`outside_cap_opposite_wedge_side`, and
`ordered_cap_chord_outside_negative` convert global convex-boundary order into
the required strict side alternatives.  These lemmas handle both orientations
of the retained cap; no adjacency or cap-cardinality assumption is made.

The source adapter extracts the forced order

```text
u < v < c < deleted < xv
```

or its reversal.  The exact-four row centered at `c` has at most two supports
in the closed cap, hence at least two outside it.  One outside support can be
chosen distinct from the opposite apex.  Circle clearance puts this support
inside both wedge half-planes, while the boundary-order lemma says an outside
cap vertex must fail one of them.  The resulting opposite-side inequality
contradicts the row-radius equality through
`ExactA2CapMetric.false_of_clearance_and_outside_hit`.

## A4 formal proof structure

`A4GlobalCircleWedge.exists_four_point_fan_parameters` constructs the three
positive parameters of the four-point fan.  Relative to the opposite apex
`O`, the source adapter supplies

```text
xv - O = tx * ((u - O) + (xu - O)),
v  - O = tv * ((u - O) + (xv - O)),
b  - O = T  * ((v - O) + (xv - O)),
```

where `b = centerAt v`, `tx > 0`, `tv > 0`, and `T > 1/2`.  The first two
relations come from the retained equal-chord rows.  The third comes from the
row centered at `b`; the strict cap order

```text
u < v < b < xv < xu
```

or its reversal gives the signed-side condition needed for `T > 1/2`.

`A4GlobalCircleWedge.two_clearances_of_four_point_fan` then proves strict
clearance of the circle centered at `b` through `v` from the outer lines
`O-u` and `xu-O`.  The row centered at `b` has four supports and at most two
of them lie in the closed second cap.  Choose an outside-cap support distinct
from `O`.  The A3 global order lemma puts it on the forbidden side of at least
one outer line.  Its row-radius equality with `v` contradicts the matching
clearance through `ExactA2CapMetric.false_of_clearance_and_outside_hit`.

## Closed declarations

The three former A3 leaves

```text
...card_ge_eighteen_xvDeletion_missingIncidence
...card_ge_eighteen_uDeletion_missingIncidence
...card_ge_eighteen_biSurvival_commonDeletionRectangle
```

now each apply the stronger wedge theorem directly.  Their old local
cardinality, survival, row, and incidence hypotheses remain in their public
signatures for compatibility but are not proof obligations.  The live
`...card_ge_eighteen` coordinator is also a direct corollary of the wedge
theorem, so the old three-profile split is bypassed rather than moved.

The former A4 off-class leaf, joint-deletion leaf, and two-arm split are direct
compatibility corollaries of the Q-only A4 theorem.  The live
`...pentagonBlockerV` parent also applies that theorem directly.  Thus the old
split is bypassed only after both of its obligations have been proved by the
stronger common theorem.

## Completion matrix

| Obligation | Label | Status | Evidence |
|---|---|---|---|
| A3 fan parameters and two clearances | PROVEN (Lean-formalized) | ✅ done | `A3GlobalCircleWedge` |
| A3 outside-cap wedge obstruction | PROVEN (Lean-formalized) | ✅ done | A3 source wedge theorem |
| A3 legacy leaves and coordinator | PROVEN (Lean-formalized) | ✅ done | direct applications of the A3 wedge theorem |
| A4 four-point fan parameters | PROVEN (Lean-formalized) | ✅ done | `A4GlobalCircleWedge.exists_four_point_fan_parameters` |
| A4 two circle clearances | PROVEN (Lean-formalized) | ✅ done | `A4GlobalCircleWedge.two_clearances_of_four_point_fan` |
| A4 source adapter and Q-only contradiction | PROVEN (Lean-formalized) | ✅ done | A4 source circle-wedge theorem |
| Live `BlockerV` parent wiring | PROVEN (Lean-formalized) | ✅ done | direct parent application |

## Verification

The focused lock-governed builds of `A3GlobalCircleWedge`,
`A4GlobalCircleWedge`, and
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy` succeeded.
The A3 checkpoint also included a repository-wide `lake-build` completing all
12,050 jobs.  The final A4 source rewiring was then checked by a fresh focused
build of the complete source-heavy module.

Direct axiom walks for both parameter constructors, the scalar/vector/point
clearance theorems, both source wedge theorems, the A4 live parent, and the
legacy wrappers report only:

```text
propext, Classical.choice, Quot.sound
```

No declaration in this route reaches `sorryAx`, native reduction,
`Lean.trustCompiler`, a custom axiom, or external evidence.

Independent adversarial reviews found no algebraic, order-sign,
source-interface, cardinality, wiring, or trust blocker in either landing.  The
A3 review identified one reverse-order endpoint typo during implementation
(`u` selected where the chord endpoint must be `v`); the corrected source is
the version covered by the successful builds and axiom audits.  The A4 review
checked both cap orientations, all three equal-chord inputs, the choice of a
non-apex outside-cap support, and the direct Q-only applications in the legacy
wrappers and local `BlockerV` parent.

This closes A4, not the complete outer source-heavy branch.  The later
`blockerCenterSplit` coordinator still reaches other sibling leaves whose
axiom closures contain `sorryAx`; those obligations are outside this audit's
stated scope.
