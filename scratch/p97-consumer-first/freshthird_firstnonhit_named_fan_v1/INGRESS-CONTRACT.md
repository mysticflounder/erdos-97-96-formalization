# FreshThird FirstNonHit named Q-row blocker fan (prelaunch)

This directory is a bounded structural encoder contract.  It is not a solver
wave result and makes no Euclidean, universal-lift, or Lean-closure claim.
The role quotient is cardinality-independent: it introduces named roles only
and does not assume exact `n = 17`, a cyclic order, or frozen cap/order values.

## Named packet

`Q` is represented by `qCenter` and four pairwise-distinct support roles
`q0..q3`.  The live fiber endpoints are `q0` and `q1`.  Two distinct source
rows are represented by `sourceACenter/a0..a3` (the FirstNonHit datum) and
`sourceBCenter/c0..c3` (the second interaction datum).  Each Q support point
has one actual blocker among `b0..b3`; each blocker has an exact four-slot
selected row and a blocker cap profile.

The constructor selectors are exact-one finite representations of:

- `FreshThirdCapSourceNonHit.sameBlocker`;
- `FreshThirdCapSourceNonHit.sourceRowOmission`;
- all four `FreshThirdCapSourceInteraction` constructors.

The omission packet records endpoint choice, source-row nonmembership, and
the `HasNEquidistantPointsAt 4 (A.erase deleted)` survival witness.  The
retained ingress records two labelled exact-four rows, singleton first-apex
slices, unequal radii, and deletion choices.  Common omission is not asserted;
it remains derived metadata until a source theorem licenses it.

## Provenance map

Every assertion is logged with a provenance string in the sidecar JSON:

- generic exact-four, blocked/support, and same-center ideas: the prior
  `freshthird_firstnonhit_fo_v1` / `freshthird_firstnonhit_fol_v2` sanity cores;
- shell slots, rank aliases, cap profiles, and cap-local overlap: adapted from
  `freshthird_full_fidelity_cegar.py`;
- constructor fields: live constructors in
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean`;
- retained rows, slices, radii, and deletion survival: live retained ingress
  in `TwoSourceFreshThirdRetainedProducer.lean`.

The genuinely new clauses are the named Q row, bijective Q-support-to-actual-
blocker ownership, two-source-row separation, and semantic constructor
selector implications.  Source-fan integer blocker/cap labels and constructor
names are not imported as live facts.

## Duplicate gate and controls

Each clause owns one canonical atom key.  Keys are of the forms
`(support,row,point)`, `(actual_blocker,Q-support,blocker-row)`,
`(selected,blocker-row,point)`, `(centerEq,rowA,rowB)`,
`(capOf|capMem,role,capIndex)`, `(deleted|survival,row,endpoint)`, and
`(constructor,source,Q,selector,field)`.  Duplicate keys fail closed during
construction.  Readback also rejects duplicate sidecar keys.

Smoke controls cover duplicate Q supports, overfull Q, forbidden source
membership, missing deletion survival, and multiple selectors.  The CLI only
accepts `--smoke-only`; the main wave is intentionally disabled.
