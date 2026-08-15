# Ingress contract

## Accepted input

This directory consumes only the completed v4 assignment at:

```text
post_exact_off_circle_cut_v4/generated/post_exact_off_circle_cut_v4_assignment.json
```

Its SHA-256 and the SHA-256 of the v4 source map are embedded in
`mapping.json`.  The scope is the one named exact-17/direct-crossed,
closure-clean survivor.

## Equality entitlement

For each of the 17 named centers, the sole accepted row is the assignment's
`point_k4_rows[center]`.  It is interpreted as the one selected
`FaithfulCarrierPattern.classAt` support supplied at that center.  Equalities
may be generated only through:

- `FaithfulCarrierPattern.classAt.support_eq_radius`;
- `GeneralCarrierBridge.rowPattern` and `GeneralCarrierBridge.realizes`;
- `EqualityCore.EdgeClosure.row`, `.flip`, `.refl`, `.symm`, `.trans`, and
  `EdgeClosure.sound`.

Every satisfied consumer equality in `mapping.json` carries an explicit path
through those named selected rows.  An unsatisfied field has different closure
components and no path.

`GeneralCarrierBridge.realizes` also supplies injectivity of the canonical
carrier interpretation.  Consequently, distinct carrier indices denote
distinct plane points.  Together with `dist_pos.mpr` and `dist_self`, this
refutes any proposed missing equality whose one side is a distinct-point edge
and whose other side is diagonal.  This distinctness check is what invalidates
the four formal SevenPoint min-two maps.

No claim is made about an arbitrary four-point support beyond these selected
classes.

## Signed-area entitlement

The accepted order source is the live
`FreshThirdAlignedMutualBlockerBoundaryPacket`:

- its blocker-cap memberships and distinct cap indices;
- its boundary zero/apex identifications;
- the `DirectBoundaryBlocks` or `MirrorBoundaryBlocks` disjunction;
- its equivalence saying exactly one canonical source index is strictly
  between the two blocker indices.

Together with `BoundaryIndexing.boundary_ccw`, `hneg_of_ccw`, and the cyclic
and antisymmetric identities of `signedArea2`, these facts force some strict
area signs.  Direct and Mirror are separate cases.  Inside either case, an
area sign is accepted only if it holds in both logical arms of the betweenness
equivalence.

The v4 numeric rank and every frozen coordinate proposal are explicitly not
premises.  They cannot select a betweenness arm or supply a global order.

## Live packet surface inspected

The audit records content hashes and line slices for:

- `TwoCapSourceThirdCanonicalRowSurface`;
- `FreshThirdAlignedRetainedConsumerPacket` and its retained radii;
- `GeneralCarrierBridge.rowPattern` and `.realizes`;
- both FiveRow consumers and the SevenPoint consumer;
- the boundary-block and mutual-boundary packet declarations.

The retained packet does not itself add one of the missing consumer
equalities.  Blocker-image exactness is retained only at the blocker centers
already licensed by v4.

## SevenPoint viability filter

The raw theorem permits coincidences among roles other than `O` and `A`, but a
role map into the injective carrier cannot treat a nonzero edge as a candidate
for a self-distance equality.  The corrected audit therefore requires both
sides of every *missing* SevenPoint equality to be non-diagonal under the role
assignment.  This is a necessary consumer-eligibility filter only.  Passing it
does not prove that all missing metric equations are simultaneously realizable.

## Explicit exclusions

This round does not introduce point aliases from a lattice or coordinate
template.  It does not broaden to a generic metric solve, an arbitrary-support
search, another later-stage consumer, or a different finite cardinality.  It
makes no finite-to-universal inference, no Problem 97 counterexample claim,
and no Lean proof-closure claim for
`TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`.
