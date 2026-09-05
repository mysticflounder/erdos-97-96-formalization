# B1 source-context second-deletion audit

## Scope and target

This lane tests the requested source-clean producer.  Given

```text
P : ExactFourMutualOmissionJointDeletion R rho u v
X : ExactFourMutualOmissionSourceContext R rho source other u v
```

the proposed result is a packet `Q` with the same `R`, `rho`, `u`, and `v`,
such that

```text
Q.deleted ≠ P.deleted
Hlate.centerAt Q.deleted.1 Q.deleted.2 ≠
  Hlate.centerAt P.deleted.1 P.deleted.2
```

where `Hlate := lateFirstApexSystem R`.  These two inequalities are the
minimum packet relation needed by the existing `exactFour_twoDeletion_crossOmission`
consumer.  The lane base is `8540e4baed9b9640394bc78ecaa654e7688a32ba`; the
current source head at audit close is
`59342b9b5eb0e4f5469789b6d528e84198a4b40a`.

No new Lean module or conditional wrapper was created.  The requested
producer is not derivable from `P` and `X` with the current source fields, so
no Lean build was run and no source/module/sorry/import/PIQD change was made.

## Indexed reuse preflight

The bounded current-project preflight was:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean
  "ExactFourMutualOmissionJointDeletion second distinct deleted same u v source context"
```

The index was at source `817fdebab` and returned the relevant handles:
`SF8ERW` (`false_of_exactFourMutualOmissionJointDeletion`), `D98KHH`,
`Q2WHKF`, `MC4BWX`, `X8GB8Z`, `SK0QFE`, `YS1GV2`, and `TW4YE7` for the
joint-deletion provenance readers and adapters.  It also surfaced the
forbidden `Rigid221Closure` terminal.  The index predates the current head;
the statements below were checked directly in the current source.

The current-project `proof-blueprint` search for
`ExactFourMutualOmissionJointDeletion second distinct packet` found
`exists_two_exactFourMutualOmissionJointDeletions` at
`JointDeletion/ExactFiveSplit.lean:245-345`, the exact-five split at
`:147-241`, and the forbidden legacy/Rigid-221 routes.  Neither existing
theorem consumes `P` and `X` with the requested blocker inequality.

## Live packet fields

`ExactFourMutualOmissionJointDeletion` is defined at
`JointDeletion/Types.lean:42-69`.  For a packet `P`, its fields give:

* class membership and source inequality for `P.deleted`;
* omission of `P.deleted` from the selected rows at `u` and `v`;
* distinct blockers for the rows at `u` and `v`; and
* two common-deletion packets centered at those row blockers.

The type has no second packet and no field relating the actual blocker
`Hlate.centerAt P.deleted.1 P.deleted.2` to the blocker of another deleted
source.

`ExactFourMutualOmissionSourceContext` is at
`JointDeletion/Types.lean:75-121`.  Its extra data includes source and
`other` class/interior membership, `other_ne_source`, omission of `other`
from the row at `source`, distinct source/other blockers, source survival at
one canonical deletion, source membership in the row at `u`, and the two
source-row orientation alternatives.  It does not provide either

```text
other.1 ∉ row_u ∧ other.1 ∉ row_v
```

nor a relation between `other` and `P.deleted`.  It also does not state that
the actual blocker of a prospective `Q` differs from the actual blocker of
`P`.

## Existing source-clean packet producers

`nonempty_exactFourMutualOmissionJointDeletion` at
`JointDeletion/Constructors.lean:46-58` uses the class lower bound
`5 ≤ (SelectedClass ... rho).card` and the distinct row blockers to create one
packet outside both rows.  It has no input `P` or `X` and gives no second
packet relation.

At exact class cardinality five,
`exactFourMutualOmissionJointDeletion_exactFive_strongSplit` at
`JointDeletion/ExactFiveSplit.lean:147-241` accepts a packet `J` and returns
one of:

1. a packet `K` with `K.deleted ≠ J.deleted`; or
2. a rigid `2+2` partition of the four class points in the two row
   intersections, with `J.deleted` as the remaining point.

The source context does not rule out the second branch.  In particular,
`other_not_mem_source_row` concerns the selected row at `source`, while the
strong split needs omission from both rows at `u` and `v`.  It also supplies no
actual-blocker inequality between `K` and `J`.

For class cardinality at least six,
`exists_two_exactFourMutualOmissionJointDeletions` at
`JointDeletion/ExactFiveSplit.lean:243-345` constructs two packets from
`6 ≤ (SelectedClass ... rho).card` and the two row-blocker inequality.  It
only concludes that their deleted sources differ.  It does not conclude

```text
Hlate.centerAt first.deleted.1 first.deleted.2 ≠
  Hlate.centerAt second.deleted.1 second.deleted.2
```

and the current packet structures contain no such injectivity fact.  Thus
even the six-point route needs an additional actual-blocker-distinctness
antecedent before either packet can be paired with `P`.

The existing B1 escape-source adapter at
`TwoDeletionCollision.lean:1720-1743` calls the five-point producer with
`P.source` and returns only one new joint-deletion packet together with its
`ExactFourMutualOmissionSourceContext`.  It does not invoke either split
above, and it does not identify the produced packet with the global
`C.first`/`C.second` packets.

## First missing antecedent

The first missing edge is not the cross-omission consumer itself.  It is one
of the following source-clean inputs:

* a proof that the five-point strong split is in its second-packet branch,
  which can be supplied by a class point outside both `u` and `v` rows (for
  example `other` with both row-omission facts), followed by a proof that the
  selected packet has an actual blocker distinct from `P`; or
* a proof of `6 ≤ (SelectedClass ... rho).card` together with a theorem
  deriving actual-blocker distinctness for a selected second packet and
  `P`.

The current `P` and `X` do not supply either antecedent.  In the exact-five
case the missing row-omission bridge is the earliest gap.  In the large-class
case the missing cardinality and blocker-distinctness data are independent
gaps.  Since the existing two-packet constructors do not produce the
required actual-blocker inequality, a direct use of them would not prove the
requested target.

## Single-packet terminal comparison

A source-clean terminal consuming one `P` together with `X` is strictly
stronger as a route from the current ingress: it would avoid both the second
packet and the actual-blocker-distinctness requirement.  No checked terminal
with that one-packet/source-context interface exists in the current source.
The existing `false_of_exactFour_twoDeletion_blockerTwoCycle` and downstream
one-way cross-omission route both require two packets, and the Rigid-221,
Coordinator, and open terminal paths are excluded by the lane contract.

Therefore no `B1SourceContextSecondDeletion.lean` module was created.  The
correct handoff is the missing row/cardinality input plus actual-blocker
distinctness for a second packet, or a new single-packet terminal.

## Source hashes

* `B1WinningSliceOrderOutcome.lean`:
  `d6853a3439c5168f99b7d8e60b708a4fb4b4801d11ce82a2b2569f9ae3c68d97`.
* `TwoDeletionCollision.lean`:
  `483e9aeb63a93e11b2f4109f83f6ec42ca4c002dd3c91e30e15c95d4c6877603`.
* `JointDeletion/Types.lean`:
  `8cd091cf7b62c2236798390585e38184df8f366570b4c1d69892e01233b84587`.
* `JointDeletion/Constructors.lean`:
  `12608f78e86740a6e5888e050dc2d55734b5e1aa74bf882b4e27aa3af797946b`.
* `JointDeletion/ExactFiveSplit.lean`:
  `ece52228aff89425efbcd99be3a229010f2e2c59aae9bccd09f7ed37cb71a14a`.
