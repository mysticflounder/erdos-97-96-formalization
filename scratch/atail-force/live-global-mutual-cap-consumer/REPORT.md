# Live global mutual-cap consumer

Status: **PROVEN / KERNEL-CHECKED SCRATCH CONSUMER; NOT A DIRECT
CONTRADICTION.**

The arbitrary `PhysicalActualCriticalMutualOmissionPair` from the production
transition-global split is converted to a fresh period-two omission edge. On
`RobustLargeRadiusParentSurface`, the common critical map then yields eight
sources for which one named mutual-edge deletion survives at the source's
actual blocker. Pigeonholing the two deletion colors and three blocker caps
returns either:

1. two distinct same-cap blockers and a source-faithful
   `CommonDeletionTwoCenterPacket`; or
2. one exact selected critical shell at a shared blocker, containing both
   selected sources and omitting the common deleted point.

`nonempty_globalMutualCapOutcome` preserves the original mutual pair and the
fresh edge identities. It is a real consumer for the global mutual sibling,
not a direct `False` theorem: the distinct-blocker arm still needs a positive
common outside pair, and the equal-blocker arm still needs a distinct actual
row through both fiber sources with compatible cap placement.

## Imported source and validation

The recovered files are `GlobalMutualPairCycleEdge.lean` and
`LiveGlobalMutualCapConsumer.lean`. The first import was changed from the
obsolete scratch global-split wrapper to production
`ATail.ParentExactFiveAssembler`; no theorem statement or proof body changed.

Focused source rebuilds used current production imports plus temporary oleans
for these existing scratch predecessors:

```text
MutualOmissionCrissCross.lean
PhysicalOmissionCycleParentAdapter.lean
MutualGlobalCapConsumer.lean
GlobalMutualPairCycleEdge.lean
LiveGlobalMutualCapConsumer.lean
```

All checks used `-DwarningAsError=true`. The four public recovered endpoints
report only `propext`, `Classical.choice`, and `Quot.sound`; neither recovered
file contains `sorry`, `admit`, a declared axiom, `unsafe`, or
`native_decide`.

No production source `sorry` is closed by this checkpoint.
