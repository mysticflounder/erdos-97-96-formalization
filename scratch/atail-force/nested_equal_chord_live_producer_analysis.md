# Nested equal-chord live producer boundary

Date: 2026-07-13

## Result

The cyclic-order half of the proposed producer is automatic.  For every
source of a `CriticalShellSystem`,
`NestedEqualChordLiveProducer.orderedBlockerRow` enumerates the four labels in
its blocker row as `a,b,c,d` after the blocker center `o` in cyclic boundary
order.  The construction uses only:

- `GeneralCarrierBridge.rowPattern_card`;
- exclusion of the positive-radius row center from its own support; and
- `BoundaryIndexing.indexOf` plus the cyclic cut at `o`.

The smallest remaining direct producer field is therefore
`GlobalNestedPairFields O` for one ordered blocker row `O`:

```text
o,d ∈ rowPattern F a
o,c ∈ rowPattern F b
```

The four memberships construct `NestedEqualChordCore.Core` immediately.  The
kernel-checked proposition `HasGlobalNestedPairProducer F H B` packages the
existence of a source whose ordered blocker row has these two global-row pair
hits, and `false_of_hasGlobalNestedPairProducer` closes the branch.

This is strictly smaller than producing two more critical-shell rows.  The
live `FaithfulCarrierPattern` already supplies rows centered at `a` and `b`, so
neither extra blocker sources nor alignment equalities for their centers are
needed.

## Existing API and theorem-bank audit

No existing theorem found in the required registries or indexed Lean corpora
produces the four memberships above.

The closest current APIs stop on the wrong side of the implication:

- `CriticalShellSystem.source_mem_selectedFourClass` forces the deleted source
  into any selected row at its blocker center.
- `CriticalShellSystem.selectedFourClass_support_eq_shell` locks the global
  selected row to the critical full shell at an already chosen blocker
  center.  It does not make a specified carrier label into a blocker center.
- `CriticalShellSystem.exists_blocker_cycle` produces a nontrivial cycle of
  source-to-blocker centers but carries no cross-support incidence.
- `SelectedFourClass.inter_card_le_two` is an upper bound on two rows'
  intersection.  The producer needs two particular lower-bound hits.
- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed` can turn an already
  row-closed nonempty subset into the whole carrier, but row closure is at
  least as strong as the incidence information missing here.
- `exists_secondLargeCap_of_noM44` yields only a second cap of cardinality at
  least five.
- The strongest exact selected-row cap hit counts in
  `CapSelectedRowCounting` use an `IsM44` witness, whereas this live lane has
  `hNoM44`.

The indexed searches for critical-shell/cyclic-pair and faithful-carrier row
incidence returned `FaithfulCarrierPattern`, its class-selection constructors,
and unrelated cap/shell cardinality lemmas, but no lower-bound theorem fixing
the required pairs.  The exhaustive sibling registries likewise contain the
two-circle intersection upper bounds, not this producer.

## Why critical-shell provenance alone cannot supply it

The exact `(4,5,6)` residual audited in `residual_456_report.md` has rows

```text
0 : {1,3,4,5}
1 : {0,2,5,6}
2 : {1,7,8,9}
3 : {0,7,10,11}
```

with cyclic order

```text
0,8,9,10,11,1,3,4,2,5,6,7
```

and blocker map

```text
0->1, 1->0, 2->1, 3->0, 4->0, 5->0,
6->1, 7->2, 8->2, 9->2, 10->3, 11->3.
```

The exact arithmetic audit verifies strict convexity, exactness of these four
rows, source membership, and deletion of every source reducing its chosen
blocker's maximum remaining distance multiplicity to three.  The structural
scan finds no nested equal-chord core.  Thus common critical-shell provenance,
exact rows, and cyclic order do not force `GlobalNestedPairFields`.

This is not a countermodel to the full live hypotheses.  It fails global K4 at
centers `4` through `11` and fails the common MEC disk condition.  Those are
the two concrete load-bearing resources left for proving the producer:

1. use one or more selected four-classes at centers absent from the residual;
2. use the MEC disk inequalities to rule out its row/cap placement; or
3. derive a stronger full-filter/no-`M44` consequence such as the already
   isolated `URowCapMultiplicityFields` and use it to force the pair hits.

## Recommended live theorem

The cleanest new theorem should retain the full K-A-LIVE hypotheses and
conclude

```lean
HasGlobalNestedPairProducer F H B
```

for the `FaithfulCarrierPattern F`, actual `CriticalShellSystem H`, and convex
boundary indexing `B` built at the wrapper.  It should be proved by choosing a
source adapted to the two large caps, not by trying to prove the field for an
arbitrary source.  The current APIs show that the proof must use at least one
of global selected-row incidence, MEC disk confinement, or a stronger
cap/full-filter consequence; blocker-cycle combinatorics alone cannot do it.

## Kernel check

The scratch files were checked with the scratch directory registered as a
Lean module root.  The relevant declarations report only the standard core
axioms:

```text
orderedBlockerRow                         [propext, Classical.choice, Quot.sound]
core_of_globalNestedPairFields            [propext, Classical.choice, Quot.sound]
false_of_globalNestedPairFields           [propext, Classical.choice, Quot.sound]
false_of_hasGlobalNestedPairProducer      [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` in the checked producer boundary.
