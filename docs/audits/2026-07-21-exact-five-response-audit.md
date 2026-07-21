# Exact-five response audit

Scope: the live exact-five terminal
`false_of_frontierBiApexRobustExactFiveSecondCapProfile`. This records only
results that change its next proof obligation.

## Status

`False` is not proved. The proposed MEC-extreme route is not a new producer:
under the same hypotheses its conditional short-cap exchange derives that both
extreme strict-cap points are off the MEC boundary. Constructing a packet from
an extreme would also still require the full `SurplusCapPacket` cap-partition
contract. Do not target an extreme-boundary disjunction or add a `sorry` for
it.

## Reusable production facts

- The full five-point second-apex class has at least three points in the
  physical strict interior; this is already
  `three_le_capInterior_hits_of_largeCapUniqueFive`.
- The existing physical-omission successor and
  `nonempty_physicalActualCriticalOmissionCycle_from_start` turn any such
  physical point into a source-faithful cycle without changing the fixed
  `CriticalShellSystem`.
- `nonempty_mutualOmissionEdge_or_all_reverseMembership` is an exhaustive
  split of that cycle. On its all-reverse arm,
  `false_of_transitionReverseOutsidePair_coRadial_firstApex` is already a
  direct terminal once a distinct co-radial pair in one reverse outside pair
  is produced.

## First missing source-level implication

The parent has the chosen `q`-deleted rows at the two physical apices. The
useful source-level bridge is:

```text
∃ x, x lies in the strict physical second-cap interior,
     x lies in the second-apex q-deleted row, and
     x does not lie in the first-apex q-deleted row.
```

This is **CONJECTURED**. The checked theorem
`three_le_capInterior_hits_of_largeCapUniqueFive` gives only `3 ≤ |P|`; it
does not put three points of `P` in the selected second row. A sufficient
producer is `3 ≤ |P ∩ U₂|`, where `U₁` and `U₂` are the retained first- and
second-apex rows: the parent overlap bound `|U₁ ∩ U₂| ≤ 2` would then give the
displayed point.

The cardinality facts alone do not imply it. The abstract pattern

```text
P  = {p1, p2, p3}
U₂ = {p1, p2, u, v}
U₁ = {p1, p2, s, t}
```

has the required sizes and row-overlap bound but no point of `P ∩ U₂` outside
`U₁`. Thus neither an unverified row/class identification nor a bare
same-side argument may be recorded as a producer. Its sole role, if proved,
is to choose a cycle start that retains both parent rows.

## Exact remaining closure surface

Only after this source-level producer is proved, start the cycle and prove one
of the following from the full live parent and the exact-five profile:

1. a mutual-omission cycle edge is contradictory; or
2. on the all-reverse arm, one transition has two distinct members of
   `transitionReverseOutsidePair` co-radial from the first physical apex.

The second result feeds the existing direct terminal above. Bare cycles,
another selected-row adapter, a cap-at-least-six continuation, or literal
CEGAR output are not closure progress for this anchor.
