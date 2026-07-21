# Exact-five parent-row bridge: completed

Status: **PROVEN IN PRODUCTION LEAN**.

`ATail/ParentExactFiveSecondCap.lean` now proves:

```lean
exists_physicalVertex_mem_parentSecondRow_not_mem_parentFirstRow
```

For `P = physicalVertices profile` and the retained parent rows `B₁,B₂`,
the same module proves:

```text
B₂ ⊆ SelectedClass D.A S.oppApex2 profile.radius
2 ≤ |P ∩ B₂|
|P ∩ B₁| ≤ 1
∃ x : PhysicalVertex profile, x ∈ B₂ ∧ x ∉ B₁
```

The proof keeps the selected row distinct from the complete ambient class and
uses a packet-substituted `CounterexampleData` to apply the first-apex
adjacent-cap one-hit theorem to the actual packet `S`.

This bridge is now stored in
`FrontierBiApexRobustExactFiveMutualParentResidual`; it is not the remaining
proof target.  The live target is
`false_of_frontierBiApexRobustExactFiveMutualParentResidual`.

The same production packet now also stores `oneHit`, proving that at least
one of the two mutual actual-critical supports meets the exact three-point
physical set in exactly one point.  The double-two-hit branch is therefore
closed; only the both-one-hit and two mirror asymmetric cases remain.
